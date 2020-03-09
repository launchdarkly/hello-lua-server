local ld = require("launchdarkly")

local YOUR_SDK_KEY = "<put your SDK key here>"
local YOUR_FEATURE_KEY = "<put your feature key here>"

local config = {
    key = YOUR_SDK_KEY
}

local user = ld.makeUser({
    key = "abc"
})

local client = ld.clientInit(config, 1000)

if client.boolVariation(user, YOUR_SDK_KEY, false) then
    print "feature is enabled"
else
    print "feature is disabled"
end
