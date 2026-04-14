local dataDragon = require("networking.riot.data-dragon")

local gameData = {
    currentVersion = nil,
    champions = {},
    tagSet = {},
}

function gameData.initialize()
    gameData.currentVersion = dataDragon.fetchLastPatch()
    local champions, tagSet = dataDragon.fetchChampions(gameData.currentVersion)
    gameData.champions = champions
    gameData.tagSet = tagSet
end

return gameData