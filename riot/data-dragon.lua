local httpClient = require("riot.http-client")

local dataDragon = {}
local baseUrl = "https://ddragon.leagueoflegends.com/cdn/"

local function loadImage(championId, version)
    local imageUrl = baseUrl .. version .. "/img/champion/" .. championId .. ".png"
    return httpClient.getRaw(imageUrl)
end

local function parseChampion(champion, version)
    local championTagSet = {}
    local tagSet = {}

    for _, tag in ipairs(champion.tags) do
        championTagSet[tag] = true
        tagSet[tag] = true
    end

    return {
        id = champion.id,
        name = champion.name,
        image = loadImage(champion.id, version),
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