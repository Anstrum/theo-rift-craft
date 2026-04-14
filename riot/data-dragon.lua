local httpClient = require("riot.http-client")

local dataDragon = {}
local baseUrl = "https://ddragon.leagueoflegends.com/cdn/"

local function loadImage(championId, version)
    local imageUrl = baseUrl .. version .. "/img/champion/" .. championId .. ".png"
    return httpClient.getRaw(imageUrl)
end

function dataDragon.fetchLastPatch()
    local patches = httpClient.get("https://ddragon.leagueoflegends.com/api/versions.json")
    return patches[1]
end

function dataDragon.fetchChampions(version)
    local champions = httpClient.get(baseUrl .. version .. "/data/en_US/champion.json")
    local championList = {}

    for _, championFull in pairs(champions.data) do
        local champion = {
            id = championFull.id,
            name = championFull.name,
            image = loadImage(championFull.id, version),
        }

        table.insert(championList, champion)
    end

    return championList
end

function dataDragon.fetchChampionSpells()
    
end

return dataDragon