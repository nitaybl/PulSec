-- Master Loader
local scripts = {
    [8657806289] = "https://raw.githubusercontent.com/nitaybl/PulSec/refs/heads/main/dummiesvsnoobs.lua",
    [18687417158] = "https://raw.githubusercontent.com/nitaybl/PulSec/refs/heads/main/pulsesaken2.lua",
}
local id = game.PlaceId
local url = scripts[id]
loadstring(game:HttpGet(url))()
