#!/bin/bash
set -e

download_sdk() {
    echo "downloading $1 c-server-sdk shared library"
    rm -rf $2 'include' 'lib'
    curl https://api.github.com/repos/launchdarkly/c-server-sdk/releases/latest | \
    grep browser_download_url | \
    grep $2 | \
    cut -d '"' -f 4 | \
    xargs curl -s -o $2 -L
    tar -xvf $2
}

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

cp lib/* ./

git clone https://github.com/launchdarkly/lua-server-sdk.git

cp lua-server-sdk/launchdarkly-server-sdk.c ./
cp lua-server-sdk/launchdarkly-server-sdk-1.0-0.rockspec ./
