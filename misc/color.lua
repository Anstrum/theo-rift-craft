local initiated = false


local color = {}
    color.list = {}

    color.list.white = {1, 1, 1, 1}
    color.list.black = {0, 0, 0, 1}
    color.list.red = {1, 0, 0, 1}
    color.list.green = {0, 1, 0, 1}
    color.list.blue = {0, 0, 1, 1}
    
    
    function color.set(color, alpha)
        if color == nil then
            log.print(log.types.ERROR, "no color found")
            return
        end
        love.graphics.setColor(color[1], color[2], color[3], alpha or color[4])
    end



    function color.init()
        if initiated then
            log.print(log.types.FATAL, "COLOR SYSTEM ALREADY INITIATED")
            love.event.quit()
        end

        --init (any for now)

        initiated = true
    end
return color