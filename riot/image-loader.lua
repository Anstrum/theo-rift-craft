local httpClient = require("riot.http-client")

local imageLoader = {}
local cache = {}

function imageLoader.loadFromSpritesheet(spriteUrl, x, y, w, h)
    if not cache[spriteUrl] then
        local raw = httpClient.getRaw(spriteUrl)
        local fileData = love.filesystem.newFileData(raw, "sprite.png")
        cache[spriteUrl] = love.image.newImageData(fileData)
    end

    local sheet = cache[spriteUrl]
    local cropped = love.image.newImageData(w, h)
    cropped:paste(sheet, 0, 0, x, y, w, h)
    return love.graphics.newImage(cropped)
end
                                                                                                                           
return imageLoader