# LaunchDarkly sample Lua server-side application
We've built a simple console application that demonstrates how LaunchDarkly's SDK works. Below, you'll find the build procedure. For more comprehensive instructions, you can visit your [Quickstart page](https://app.launchdarkly.com/quickstart#/) or the [Lua reference guide](https://docs.launchdarkly.com/sdk/server-side/lua).

## Dependencies
You will need the shared library for the LaunchDarkly `c-server-sdk`. You can automatically download the `lua-server-sdk` and `c-server-sdk` with `download.sh`. The `c-server-sdk` shared library must be accessible be the linker at run time. This project is built with `luarocks`.

The `download.sh` script is not suitable for a production or CI environment.

## Instructions
1. Install the dependencies described above.
2. Edit hello.lua and set the value of YOUR_SDK_KEY to your LaunchDarkly SDK key. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, set YOUR_FEATURE_KEY to the flag key.

```
local YOUR_SDK_KEY = "1234567890abcdef"

local YOUR_FEATURE_KEY = "my-boolean-flag"
```

3. On the command line, build the SDK with `sudo luarocks make launchdarkly-server-sdk-1.0-0.rockspec LD_DIR=. LD_INCDIR=./include`.
4. On the command line, run `LD_LIBRARY_PATH=. luajit hello.lua` or `LD_LIBRARY_PATH=. lua hello.lua`.
