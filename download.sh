#!/bin/bash
set -e

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo 'downloading linux c-server-sdk shared library'
    rm -rf 'linux-gcc-64bit-dynamic.tar' 'include' 'lib'
    curl -s -o 'linux-gcc-64bit-dynamic.tar' -L 'https://github.com/launchdarkly/c-server-sdk/releases/download/2.2.1/linux-gcc-64bit-dynamic.tar'
    tar -xvf 'linux-gcc-64bit-dynamic.tar'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo 'downloading osx c-server-sdk shared library'
    rm -rf 'osx-clang-64bit-dynamic.tar' 'include' 'lib'
    curl -s -o "osx-clang-64bit-dynamic.tar" -L "https://github.com/launchdarkly/c-server-sdk/releases/download/2.2.1/osx-clang-64bit-dynamic.tar"
    tar -xvf 'osx-clang-64bit-dynamic.tar'
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
