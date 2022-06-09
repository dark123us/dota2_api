local args = {...}
local directory = args[1] .. '.'

local gamerules = require(directory .. 'gamerules')
local player = require(directory .. 'player')

local api = {
    gamerules=gamerules,
    player=player
}

return api


