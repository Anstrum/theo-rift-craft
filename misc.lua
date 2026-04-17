log = nil
colors = nil
screen = nil
debug = nil

function initMisc()
    log = require("misc/log")
    colors = require("misc/color")
    screen = require("misc/screen")
    debug = require("misc/debug")

    log.print(log.types.INFO, "misc initiated")
end