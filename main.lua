io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

misc = require("misc")
local gameData = require("state.game-data")

function love.load()
    initMisc()
    screen.init()
    colors.init()
    gameData.initialize()
    local testChampion = require("state.game-data")
    print(testChampion.champions[1].name)
end

function love.update(dt)
end

function love.draw()
end