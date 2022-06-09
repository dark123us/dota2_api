local CONST = {
    OnStrategyTime = "OnStrategyTime",
    OnStateChange = "OnStateChange"
}
local gamerules = {
    event = {notify = function(event, data) end},
    mode = nil,
}

function gamerules:InitDebugMode(hero)
    hero = hero or "npc_dota_hero_windrunner"
    GameRules:EnableCustomGameSetupAutoLaunch(true)
    GameRules:SetCustomGameSetupAutoLaunchDelay(0)
    GameRules:SetCustomGameSetupTimeout(10)
    GameRules:SetHeroSelectionTime( 10 )
    GameRules:SetStrategyTime( 0.0 )
    GameRules:SetShowcaseTime( 0.0 )
    GameRules:SetPreGameTime( 0.0 )
    GameRules:SetGoldTickTime(999999)
    GameRules:SetGoldPerTick(0)          
    GameRules:SetHeroSelectPenaltyTime(5)

	self.mode = GameRules:GetGameModeEntity()
    self.mode:SetCustomGameForceHero(hero)

    ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)
end

function gamerules:Constants()
    return CONST
end

function gamerules:SetEventDispatcher(eventDispatcher)
    self.event = eventDispatcher
end

function gamerules:OnStateChange()
    local state = GameRules:State_Get()
    self.event:notify(CONST.OnStateChange, {state=state})
    if state == DOTA_GAMERULES_STATE_STRATEGY_TIME then
        self.event:notify(CONST.OnStrategyTime, {})
    end
end


return gamerules
