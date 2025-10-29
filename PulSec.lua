-- Master Loader
local scripts = {
    [18687417158] = "https://raw.githubusercontent.com/nitaybl/Thisrepoisdefinetleynotgonnabeleaked/pulsesakenv2.lua",
    [13559635034] = "https://raw.githubusercontent.com/nitaybl/PulSec/refs/heads/main/combatinitiation.lua"
}
local id = game.PlaceId
local url = scripts[id]
loadstring(game:HttpGet(url))()
