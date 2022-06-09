local player = {}

function player:SetHero(name)

end

function player:GetHeroes()
    local res = {}
    local maxPlayers = 5
    for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
        for i=1, maxPlayers do
            local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
            if playerID ~= nil then
                if not PlayerResource:HasSelectedHero(playerID) then
                    local hPlayer = PlayerResource:GetPlayer(playerID)
                    if hPlayer ~= nil then
                        table.insert(res, hPlayer)
                    end
                end
            end
        end
    end
    return res
end

function player:EntityIndexToHandler(entityIndex)
    return EntIndexToHScript(entityIndex)
end

function player:SetAbilityLevel(entity, abilityName, level)
    level = level or 1
    if entity:IsRealHero() and entity:HasAbility(abilityName) then
        entity:FindAbilityByName(abilityName):SetLevel(level)
    end
end

return player

-- function randomForNoHeroSelected()
--     log:debug("RandomForNoHeroSelected")
--     --NOTE: GameRules state must be in HERO_SELECTION or STRATEGY_TIME to pick heroes
--     --loop through each player on every team and random a hero if they haven't picked
--     local player = 1
--     local hero = HERO
--     PrecacheUnitByNameAsync(
--         hero,
--         function()
--             PlayerResource:ReplaceHeroWith( player, hero, 0, 0 )
--         end,
--         player)
-- 
--     local maxPlayers = 5
--     for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
--         for i=1, maxPlayers do
--             local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
--             log:debug(string.format("player %s %s %s", playerID, i, teamNum))
--             if playerID ~= nil then
--                 if not PlayerResource:HasSelectedHero(playerID) then
--                     local hPlayer = PlayerResource:GetPlayer(playerID)
--                     if hPlayer ~= nil then
--                         log:debug(hPlayer)
--                         hPlayer:MakeRandomHeroSelection()
--                     end
--                 end
--             end
--         end
--     end
-- end

-- local setAbilityForHero = function()
--     local maxPlayers = 5
--     for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
--         for i=1, maxPlayers do
--             local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
--             log:debug(string.format("player %s %s %s", playerID, i, teamNum))
--             if playerID ~= nil then
--                 if not PlayerResource:HasSelectedHero(playerID) then
--                     local hPlayer = PlayerResource:GetPlayer(playerID)
--                     if hPlayer ~= nil then
--                         log:debug(hPlayer)
--                         hPlayer:MakeRandomHeroSelection()
--                     end
--                 end
--             end
--         end
--     end
-- end
