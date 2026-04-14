local initiated = false

local screen = {}
    screen.title = "Another Love2D Project"
    screen.width = 1200
    screen.height = 700
    screen.resizable = false
    screen.maximized = false

    function screen.init()
        if initiated then
            -- error color already initiated --
            love.event.quit()
        end

        love.window.setTitle(screen.title)
        love.window.setFullscreen(screen.maximized)
        love.window.setMode(screen.width, screen.height, {resizable = screen.resizable})
        initiated = true
    end

return screen