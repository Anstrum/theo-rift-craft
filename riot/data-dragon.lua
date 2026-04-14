local httpClient = require("riot.http-client")
local imageLoader = require("riot.image-loader")

local dataDragon = {}
local baseUrl = "https://ddragon.leagueoflegends.com/cdn/"

local function parseChampion(champion, version)
    local spriteUrl = baseUrl .. version .. "/img/sprite/" .. champion.image.sprite
    local championTagSet = {}
    local tagSet = {}

    for _, tag in ipairs(champion.tags) do
        championTagSet[tag] = true
        tagSet[tag] = true
    end

    return {
        id = champion.id,
        name = champion.name,
        image = imageLoader.loadFromSpritesheet(
            spriteUrl,
            champion.image.x,
            champion.image.y,
            champion.image.w,
            champion.image.h
        ),
        tagSet = championTagSet,
    }
end

function dataDragon.fetchLastPatch()
    local patches = httpClient.get("https://ddragon.leagueoflegends.com/api/versions.json")
    return patches[1]
end

function dataDragon.fetchChampions(version)
    local champions = httpClient.get(baseUrl .. version .. "/data/en_US/champion.json")
    local championList = {}

    for _, championFull in pairs(champions.data) do
        table.insert(championList, parseChampion(championFull, version))
    end

    return championList
end

return dataDragon