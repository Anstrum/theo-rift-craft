local dataDragon = require("riot.data-dragon")

local gameData = {
    currentVersion = nil,
    champions = {},
    tagSet = {},
}

function gameData.initialize()
    gameData.currentVersion = dataDragon.fetchLastPatch()
    gameData.champions = dataDragon.fetchChampions(gameData.currentVersion)
end

return gameData