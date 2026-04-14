initiated = true

local log = {}

    log.settings = {}
        log.settings.display_on_screen = false
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
            -- error color already initiated --
            love.event.quit()
        end

        log.settings.display_on_screen = true
        log.settings.export_on_shutdown = true
        log.settings.print_logs = true
        log.settings.color = "black"


        initiated = true
    end

    function log.print(type, message)
        
    end

    function log.export()
        
        --export log into file--

    end


return log