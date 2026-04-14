local dataDragon = require("riot.data-dragon")
local json = require("misc.json")

local gameData = {
    currentVersion = nil,
    champions = {},
    tagSet = {},
}

function gameData.initialize()
    gameData.currentVersion = dataDragon.fetchLastPatch()
end

return gameData