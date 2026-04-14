io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

misc = require("misc")

function love.load()
    initMisc()
    screen.init()
    colors.init()
end

function love.update(dt)
end

function love.draw()
end