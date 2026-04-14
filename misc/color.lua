local initiated = false

local color = {}
    color.list = {}
    function color.add(name, r, g, b, a)
        local newColor = {}
        newColor.name = name
        newColor.r = r
        newColor.g = g
        newColor.b = b
        newColor.a = a or 1

        for i = 1, #color.list do
            if color.list[i].name == newColor.name then
                -- same color already exists--
                -- add a new log to explicit the error--
                love.event.quit()
            end
        end
        table.insert(color.list, newColor)
    end

    function color.set(name)
        for i = 1, #color.list do
            if color.name == name then
                love.graphics.setColor(color.r, color.g, color.b, color.a)
            end
        end
        -- error no color found --
        love.event.quit()
    end
    function color.get(name)
        for i = 1, #color.list do
            if color.name == name then
                return {color.r, color.g, color.b, color.a}
            end
        end
        -- error no color found
        love.event.quit()
    end

    function color.init()
        if initiated then
            -- error color already initiated --
            love.event.quit()
        end
        color.add("red", 1, 0, 0, 1)
        color.add("green", 0, 1, 0, 1)
        color.add("blue", 0, 0, 1, 1)
        color.add("white", 1, 1, 1, 1)
        color.add("black", 0, 0, 0, 1)
        initiated = true
    end
return color