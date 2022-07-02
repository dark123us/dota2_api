local args = {...}
local directory = args[1] .. '.'

local gamerules = require(directory .. 'gamerules')
local player = require(directory .. 'player')
local entity = require(directory .. 'entity')
local net = require(directory .. 'net')

local api = {
    gamerules=gamerules,
    player=player,
    entity=entity,
    net=net
}

return api


