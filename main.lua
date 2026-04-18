io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest")

require("misc")

appManager = require("app-manager")

function love.load()
    initMisc()
    log.init()
    screen.init()
    colors.init()
    appManager.init()
    log.print(log.types.INFO, "Load complete")
end

function love.update(dt)
    appManager.update(dt)
end

function love.draw()
    appManager.draw()
end

function love.keypressed(key)
    appManager.keypressed(key)
end

function love.mousepressed(x, y, click)
    appManager.mousepressed(x, y, click)
end

function love.quit()
    log.export()
end