local ld = require("launchdarkly-server-sdk")

local YOUR_SDK_KEY = "<put your SDK key here>"
local YOUR_FEATURE_KEY = "<put your feature key here>"

local config = {
    key = YOUR_SDK_KEY
}

local client = ld.clientInit(config, 1000)

local user = ld.makeUser({
    key = "abc"
})

if client.boolVariation(user, YOUR_FEATURE_KEY, false) then
    print "feature is enabled"
else
    print "feature is disabled"
end
