io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("misc")

function love.load()
    initMisc()
    log.init()
    screen.init()
    colors.init()
end

function love.update(dt)
    log.print(log.types.ERROR, "test")
end

function love.quit()
end


function love.draw()
end