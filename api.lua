local args = {...}
local directory = args[1] .. '.'

local gamerules = require(directory .. 'gamerules')
local player = require(directory .. 'player')
local entity = require(directory .. 'entity')

local api = {
    gamerules=gamerules,
    player=player,
    entity=entity
}

return api


