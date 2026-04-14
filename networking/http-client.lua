local client = require("socket.http")
local json = require("networking.json")

local httpClient = {}

function httpClient.get(url)
    local body = httpClient.getRaw(url)
    return json.decode(body)
end

function httpClient.getRaw(url)
    local body, code = client.request(url)

    if code == 200 then
        return body
    else
        error("HTTP request failed with code: " .. tostring(code) .. " and body: " .. body)
    end
end

return httpClient