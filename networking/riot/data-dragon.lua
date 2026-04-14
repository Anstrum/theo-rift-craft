local httpClient = require("networking.http-client")

local dataDragon = {}
local baseUrl = "https://ddragon.leagueoflegends.com/cdn/"
local spritesCache = {}

local function loadImageFromSpritesheet(spriteUrl, x, y, w, h)
    if not spritesCache[spriteUrl] then
        local raw = httpClient.getRaw(spriteUrl)
        local fileData = love.filesystem.newFileData(raw, "sprite.png")
        spritesCache[spriteUrl] = love.image.newImageData(fileData)
    end

    local sheet = spritesCache[spriteUrl]
    local cropped = love.image.newImageData(w, h)
    cropped:paste(sheet, 0, 0, x, y, w, h)
    return love.graphics.newImage(cropped)
end

local function parseChampion(champion, version)
    local spriteUrl = baseUrl .. version .. "/img/sprite/" .. champion.image.sprite
    local championTagSet = {}

    local championData = {
        id = champion.id,
        name = champion.name,
        image = loadImageFromSpritesheet(
            spriteUrl,
            champion.image.x,
            champion.image.y,
            champion.image.w,
            champion.image.h
        ),
        tagSet = championTagSet,
    }

    return championData
end

function dataDragon.fetchLastPatch()
    local patches = httpClient.get("https://ddragon.leagueoflegends.com/api/versions.json")
    return patches[1]
end

function dataDragon.fetchChampions(version)
    local champions = httpClient.get(baseUrl .. version .. "/data/en_US/champion.json")
    local championList = {}
    local tagSet = {}

    for _, championFull in pairs(champions.data) do
        table.insert(championList, parseChampion(championFull, version))

        for _, tag in ipairs(championFull.tags) do
            tagSet[tag] = true
        end
    end

    return championList, tagSet
end

return dataDragon