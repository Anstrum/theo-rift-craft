io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("misc")

function love.load()
    initMisc()
    log.init()
    screen.init()
    colors.init()
    log.print(log.types.INFO, "Load complete")
end

function love.update(dt)
    
end

function love.quit()
end


function love.draw()
end