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

if client:boolVariation(user, YOUR_FEATURE_KEY, false) then
    print "feature flag is true for this user"
else
    print "feature flag is false for this user"
end
