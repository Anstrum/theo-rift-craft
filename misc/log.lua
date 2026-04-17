initiated = false

local log = {}

    log.settings = {}
        log.list = {}
        log.settings.display_on_screen = false
        log.settings.display_overlap = false -- wait the time of the previous display
        log.settings.export_on_shutdown = false
        log.settings.print_logs = false
        log.settings.color = nil
        log.settings.display_duration = 1

    log.types = {}
        log.types.FATAL = "FATAL"
        log.types.ERROR = "ERROR"
        log.types.DEBUG = "DEBUG"
        log.types.INFO = "INFO"


    function log.init()
        if initiated then
            log.print(log.types.FATAL, "LOG SYSTEM ALREADY INITIATED")
            love.event.quit()
        end

        log.settings.display_on_screen = true
        log.settings.export_on_shutdown = true
        log.settings.print_logs = true
        log.settings.color = "black"
        log.settings.display_duration = 1


        initiated = true
    end

    function log.print(type, message)

        local date = os.date("%Y-%m-%d %H:%M:%S", seconds)
        local completeLog = "["..date.."] "..type.." : "..message

        if log.settings.print_logs then
            print(completeLog)
        end

        table.insert(log.list, completeLog)

        if type == log.types.FATAL then
            love.event.quit()
        end
    end

    function log.export()
        if not log.settings.export_on_shutdown then
            return
        end

        local date = os.date("%Y-%m-%d - %Hh%Mm%Ss", seconds)
        local filename = "LOG - "..date..".txt"
        local content = ""

        for i, line in ipairs(log.list) do
            content = content .. line .. "\n"
        end

        local success, message = love.filesystem.write(filename, content)
    end



return log