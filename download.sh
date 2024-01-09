#!/bin/bash
set -e

# Download the c-server-sdk.
#
# $1: The platform the SDK is being downloaded for.
# $2: The expected name of the SDK bundle file.
# $3: Optional major version. Downloads the latest minor/patch unless specified.
# $4: Optional minor version. Downloads the latest patch unless specified.
# $5: Optional patch version.
# Examples:
#
# Download the latest osx version.
# download_sdk osx osx-clang-64bit-dynamic.tar
#
# Download the latest 2.x version for osx.
# download_sdk osx osx-clang-64bit-dynamic.tar 2
#
# Download a specific version of the SDK.
# download_sdk osx osx-clang-64bit-dynamic.tar 2 1 1
download_sdk() {
    echo "downloading $1 c-server-sdk shared library"
    rm -rf $2 'include' 'lib'
    major=${3:-[0-9]+}
    minor=${4:-[0-9]+}
    patch=${5:-[0-9]+}
    #Get the list of releases.
    #Trim that to a list of version numbers one on each line.
    #Exclude any pre-release versions.
    #Sort the versions from highest to lowest
    #Take the first one.
	curl https://api.github.com/repos/launchdarkly/c-server-sdk/releases/tags/$(
		curl https://api.github.com/repos/launchdarkly/c-server-sdk/releases | \
        grep tag_name | \
        cut -d '"' -f 4 | \
        grep -E "$major\.$minor\.$patch$" | \
        sort -V -r | \
        head -n 1) | \
    grep browser_download_url | \
    grep $2 | \
    cut -d '"' -f 4 | \
    xargs curl -s -o $2 -L
    tar -xvf $2
}

# This will download the latest version of the SDK.
# For a production application it would be preferable to download a specific
# version. 
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    download_sdk linux linux-gcc-64bit-dynamic.tar
elif [[ "$OSTYPE" == "darwin"* ]]; then
    download_sdk osx osx-clang-64bit-dynamic.tar
else
    echo "unknown platform"
    exit 1
fi

echo "downloading lua-server-sdk"

rm -rf lua-server-sdk
rm -f launchdarkly-server-sdk.lua

cp -r lib/* ./

git clone --branch 1.2.2 --depth 1 https://github.com/launchdarkly/lua-server-sdk.git

cp lua-server-sdk/launchdarkly-server-sdk.c ./
cp lua-server-sdk/launchdarkly-server-sdk-1.0-0.rockspec ./
