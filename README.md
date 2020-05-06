# LaunchDarkly Sample Lua Server-Side Application
We've built a simple console application that demonstrates how LaunchDarkly's SDK works. Below, you'll find the basic build procedure, but for more comprehensive instructions, you can visit your [Quickstart page](https://app.launchdarkly.com/quickstart#/). Use this as a starting point for integrating the lua-server-sdk with your application.

## Dependencies
The SDK has two Lua dependencies `cjson`, and `ffi`. You can install `cjson` with: `luarocks install lua-cjson`. If you are using the Lua interpreter instead of LuaJIT you will need: `luarocks install --server=https://luarocks.org/dev luaffi`.

Additionally you need the shared library for the LaunchDarkly `c-server-sdk`. You can automatically download the `lua-server-sdk`, and `c-server-sdk` with `download.sh`. The `c-server-sdk` shared library must be accessible be the linker at run-time.

## Instructions
1. Install the dependencies described above
2. Copy your SDK key and feature flag key from your LaunchDarkly dashboard into `hello.lua`
5. Run `LD_LIBRARY_PATH=./lib luajit hello.lua` or `LD_LIBRARY_PATH=./lib lua hello.lua`
