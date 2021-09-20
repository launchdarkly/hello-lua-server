# LaunchDarkly Sample Lua Server-Side Application
We've built a simple console application that demonstrates how LaunchDarkly's SDK works. Below, you'll find the basic build procedure, but for more comprehensive instructions, you can visit your [Quickstart page](https://app.launchdarkly.com/quickstart#/). Use this as a starting point for integrating the lua-server-sdk with your application.

## Dependencies
Additionally you need the shared library for the LaunchDarkly `c-server-sdk`. You can automatically download the `lua-server-sdk`, and `c-server-sdk` with `download.sh`. The `c-server-sdk` shared library must be accessible be the linker at run-time. This project is built with `luarocks`.

The `download.sh` script is not suitable for a production or CI environment.

## Instructions
1. Install the dependencies described above
2. Copy your SDK key and feature flag key from your LaunchDarkly dashboard into `hello.lua`
3. Build the SDK with `sudo luarocks make launchdarkly-server-sdk-1.0-0.rockspec LD_DIR=. LD_INCDIR=./include`
5. Run `LD_LIBRARY_PATH=. luajit hello.lua` or `LD_LIBRARY_PATH=. lua hello.lua`
