local ld = require("launchdarkly_server_sdk")

-- Set YOUR_SDK_KEY to your LaunchDarkly SDK key.
local YOUR_SDK_KEY = ""
-- Set YOUR_FEATURE_KEY to the feature flag key you want to evaluate.
local YOUR_FEATURE_KEY = "my-boolean-flag"

local config = {
    key = YOUR_SDK_KEY
}

local client = ld.clientInit(config, 1000)

local user = ld.makeUser({
    key = "example-user-key",
    name = "Sandy"
})

local value = client:boolVariation(user, YOUR_FEATURE_KEY, false)
print("feature flag "..YOUR_FEATURE_KEY.." is "..tostring(value).." for this user")
