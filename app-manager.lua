local initiated = false

local appManager = {}

    appManager.sceneList = {}
    appManager.sceneList.HOME = "HOME"
    appManager.sceneList.DRAFT = "DRAFT"
    appManager.sceneList.GAME = "GAME"

    appManager.scenes = {}
    appManager.currentScene = nil
    appManager.currentSceneIndex = nil




    function appManager.init()
        if initiated then
            log.print(log.types.FATAL, "APP MANAGER ALREADY INITIATED")
            love.event.quit()
        end

                -- REQUIRE ALL SCENES HERE -- 
        table.insert(appManager.scenes, require("scenes/home/home"))
        table.insert(appManager.scenes, require("scenes/draft/draft"))
        table.insert(appManager.scenes, require("scenes/game/game"))

        appManager.currentScene = appManager.sceneList.HOME
        appManager.currentSceneIndex = 1
        appManager.scenes[1].load()

        initiated = true
    end


    function appManager.setScene(name)

        if name == appManager.currentScene then
            log.print(log.types.FATAL, "CURRENT SCENE IS ALREADY: "..name)
        end

        for i = 1, #appManager.scenes do
            if appManager.scenes[i].sceneName == name then
                appManager.scenes[i].load()
            end
        end


            -- SET THE CURRENT SCENE BEFORE UNLOADING THE PREVIOUS ONE TO PREVENT APP CRASHES --
        local toUnload = appManager.currentScene
        
        appManager.currentScene = name
        for i = 1, #appManager.scenes do
            if appManager.scenes[i].sceneName == name then
                appManager.currentSceneIndex = i
            end
        end
        


        for i = 1, #appManager.scenes do
            if appManager.scenes[i].sceneName == toUnload then
                appManager.scenes[i].unload()
            end
        end
    end




        -- BASIC WORKING FUNCTION --

    function appManager.update(dt)
        appManager.scenes[appManager.currentSceneIndex].update(dt)
    end

    function appManager.draw()
        appManager.scenes[appManager.currentSceneIndex].draw()
    end
    function appManager.keypressed(key)
        appManager.scenes[appManager.currentSceneIndex].keypressed()
    end

    function appManager.mousepressed(x, y, click)
        appManager.scenes[appManager.currentSceneIndex].mousepressed(x, y, click)
    end








return appManager
