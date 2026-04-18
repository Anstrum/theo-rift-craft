local home = {}
    home.sceneName = "HOME"
    home.title = nil
    home.buttons = nil

    function home.load()
        home.title = require("scenes/home/modules/title")
        home.buttons = require("scenes/home/modules/buttons")
        home.title.load()
        home.buttons.load()
        home.music = love.audio.newSource("sounds/urf-music.mp3", "stream")
        love.audio.setVolume(0.2)
        love.audio.play(home.music)
    end

    function home.unload()
    end

    function home.update(dt)
        home.title.update(dt)
        home.buttons.update(dt)
    end

    function home.draw()
        home.title.draw()
        home.buttons.draw()
    end

    function home.keypressed(key)
        home.buttons.keypresed(key)
    end

    function home.mousepressed(x, y, click)
        home.buttons.mousepressed(x, y, click)
    end

return home