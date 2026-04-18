local title = {}

    title.picture = nil
    title.startDelay = nil
    title.startTimer = nil
    title.fadeInDuration = nil
    title.fadeInAlpha = nil
    title.fadeInTimer = nil
    title.fadeComplete = nil
    title.drawTitle = nil
    title.x = nil
    title.y = nil
    title.scale = nil

    function title.load()    
        title.picture = love.graphics.newImage("pictures/theo-rift-craft.png")
        title.startDelay = 1.5
        title.startTimer = 0
        title.fadeInDuration = 0.8
        title.fadeInAlpha = 0
        title.fadeInTimer = 0
        title.fadeComplete = false
        title.drawTitle = false
        title.scale = 0.5
        title.x = screen.width / 2 - ((title.picture:getWidth() * title.scale) / 2)
        title.y = 50
    end


    function title.update(dt)
        if title.drawTitle then
            if not title.fadeComplete then
                title.fadeInTimer = title.fadeInTimer + dt
                title.fadeInAlpha = title.fadeInTimer / 0.5
            end
        else
            title.startTimer = title.startTimer + dt
            if title.startTimer > title.startDelay then
                title.drawTitle = true
            end
        end
    end



    function title.draw()
        if title.drawTitle then
            colors.set(colors.list.white, title.fadeInAlpha)
            love.graphics.draw(title.picture, title.x, title.y, 0, title.scale, title.scale)
        end
    end

return title