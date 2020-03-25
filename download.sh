#!/bin/bash
set -e

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "downloading linux c-server-sdk shared library"
    rm -f "libldserverapi.so"
    curl -s -o "libldserverapi.so" -L "https://github.com/launchdarkly/c-server-sdk/releases/download/1.2.0/linux-gcc-64bit-libldserverapi.so"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "downloading osx c-server-sdk shared library"
    rm -f "libldserverapi.dylib"
    curl -s -o "libldserverapi.dylib" -L "https://github.com/launchdarkly/c-server-sdk/releases/download/1.2.0/osx-clang-64bit-libldserverapi.dylib"
else
    echo "unknown platform"
    exit 1
fi

echo "downloading lua-server-sdk"

rm -rf lua-server-sdk
rm launchdarkly-server-sdk.lua
git clone git@github.com:launchdarkly/lua-server-sdk.git
cp lua-server-sdk/launchdarkly-server-sdk.lua ./
