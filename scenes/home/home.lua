local home = {}
    home.sceneName = "HOME"
    home.title = nil
    function home.load()
        home.title = love.graphics.newImage("pictures/theo-rift-craft.png")
    end

    function home.unload()
    end

    function home.update(dt)
    end

    function home.draw()
        love.graphics.draw(home.title, 100, 100, 0, 0.5, 0.5)
    end

    function home.keypressed(key)
    end

    function home.mousepressed(x, y, click)
    end

return home