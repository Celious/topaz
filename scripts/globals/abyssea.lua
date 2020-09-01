-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/utils")

tpz = tpz or {}
tpz.abyssea = tpz.abyssea or {}

tpz.abyssea.lightType =
{
    PEARL   = 1,
    AZURE   = 2,
    RUBY    = 3,
    AMBER   = 4,
    GOLDEN  = 5,
    SILVERY = 6,
    EBON    = 7,
}

tpz.abyssea.triggerType = 
{
	RED = 0,
	YELLOW = 1,
	BLUE = 2
}

tpz.abyssea.deathType =
{
	NONE = 0,
	PHYSICAL = 1,
	MAGICAL = 2,
	WS_PHYSICAL = 3,
	WS_MAGICAL = 4,
}

-- weaponskills for red weakness
local redWeakness =
{
    --light
    37, 161, 149, 180,
    --dark
    22, 133, 98,
    --fire
    34,
    --earth
    178,
    --wind
    20, 148,
    --ice
    51,
    --thunder
    144
}

local yellowWeakness =
{
    --fire
    [0] = { 146, 147, 176, 204, 591, 321, 455 },
    --earth
    [1] = { 161, 162, 191, 210, 555, 330, 458 },
    --water
    [2] = { 171, 172, 201, 515, 336, 454 },
    --wind
    [3] = { 156, 157, 186, 208, 534, 327, 457 },
    --ice
    [4] = { 151, 152, 181, 206, 531, 324, 456 },
    --ltng
    [5] = { 166, 167, 196, 212, 644, 333, 459 },
    --light
    [6] = { 29, 30, 38, 39, 21, 112, 565, 461 },
    --dark
    [7] = { 247, 245, 231, 260, 557, 348, 460 }
}

local blueWeakness =
{
    --6-14
    {196, 197, 198, 199, 212, 213, 214, 215, 18, 23, 24, 25, 118, 119, 120},
    --14-22
    {40, 41, 42, 135, 136, 71, 72, 103, 104, 87, 88, 151, 152, 55, 56},
    --22-6
    {165, 166, 167, 168, 169, 5, 6, 7, 8, 9, 176, 181, 182, 183, 184}
}

-- [ZoneID] = {Required Trades Event, Has Key Items Event, Missing Key Item Event}
local popEvents =
{
    [tpz.zone.ABYSSEA_KONSCHTAT]        = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_TAHRONGI]         = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_LA_THEINE]        = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_ATTOHWA]          = {1010, 1022, 1023},
    [tpz.zone.ABYSSEA_MISAREAUX]        = {1010, 1022, 1021},
    [tpz.zone.ABYSSEA_VUNKERL]          = {1010, 1015, 1120},
    [tpz.zone.ABYSSEA_ALTEPA]           = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_ULEGUERAND]       = {1010, 1020, 1025},
    [tpz.zone.ABYSSEA_GRAUBERG]         = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_EMPYREAL_PARADOX] = {1010, 1020, 1021},
}

-------------------------------------------------
-- public functions
-------------------------------------------------

-- returns Traverser Stone KI cap
tpz.abyssea.getMaxTravStones = function(player)
    local stones = 3

    for ki = tpz.ki.VIRIDIAN_ABYSSITE_OF_AVARICE, tpz.ki.VERMILLION_ABYSSITE_OF_AVARICE do
        if player:hasKeyItem(ki) then
            stones = stones + 1
        end
    end

    return stones
end

-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
tpz.abyssea.getTravStonesTotal = function(player)
    local stones = 0

    for ki = tpz.ki.TRAVERSER_STONE1, tpz.ki.TRAVERSER_STONE6 do
        if player:hasKeyItem(ki) then
            stones = stones + 1
        end
    end

    return stones
end

-- removes Traverser Stone KIs
tpz.abyssea.spendTravStones = function(player, spentstones)
    if spentstones == 4 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end

    if spentstones == 3 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end

    if spentstones == 2 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end

    if spentstones == 1 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end
end

-- returns total "Abyssite of <thing>"
tpz.abyssea.getAbyssiteTotal = function(player, abyssite)
    local sojourn = 0
    local furtherance = 0
    local merit = 0

    if abyssite == "SOJOURN" then
        for ki = tpz.ki.IVORY_ABYSSITE_OF_SOJOURN, tpz.ki.EMERALD_ABYSSITE_OF_SOJOURN do
            if player:hasKeyItem(ki) then
                sojourn = sojourn + 1
            end
        end
        return sojourn
    elseif abyssite == "FURTHERANCE" then
        for ki = tpz.ki.SCARLET_ABYSSITE_OF_FURTHERANCE, tpz.ki.IVORY_ABYSSITE_OF_FURTHERANCE do
            if player:hasKeyItem(ki) then
                furtherance = furtherance + 1
            end
        end
        return furtherance
    elseif abyssite == "MERIT" then
        for ki = tpz.ki.AZURE_ABYSSITE_OF_MERIT, tpz.ki.INDIGO_ABYSSITE_OF_MERIT do
            if player:hasKeyItem(ki) then
                merit = merit + 1
            end
        end
        return merit
    end
end

tpz.abyssea.canGiveNMKI = function(player, mob)
	local playerId = mob:getLocalVar("[ClaimedBy]")
	local redWeakness = mob:getLocalVar("[AbysseaRedProc]")
	local dropChance = 70 --TODO: make this mob specific
	if redWeakness == 1 then
		dropChance = 0
	end
	
    if playerId == player:getID() then
		if (math.random(1, 100) >= dropChance) then
			return true
		end
    end
	
	return false
end

-- returns total value of Demulune KeyItems
tpz.abyssea.getDemiluneAbyssite = function(player)
    local demilune = 0
    -- Todo: change this into proper bitmask
    if player:hasKeyItem(tpz.ki.CLEAR_DEMILUNE_ABYSSITE) then
        demilune = demilune + 1
    end
    if player:hasKeyItem(tpz.ki.COLORFUL_DEMILUNE_ABYSSITE) then
        demilune = demilune + 2
    end
    if player:hasKeyItem(tpz.ki.SCARLET_DEMILUNE_ABYSSITE) then
        demilune = demilune + 4
    end
    if player:hasKeyItem(tpz.ki.AZURE_DEMILUNE_ABYSSITE) then
        demilune = demilune + 8
    end
    if player:hasKeyItem(tpz.ki.VIRIDIAN_DEMILUNE_ABYSSITE) then
        demilune = demilune + 16
    end
    if player:hasKeyItem(tpz.ki.JADE_DEMILUNE_ABYSSITE) then
        demilune = demilune + 32
    end
    if player:hasKeyItem(tpz.ki.SAPPHIRE_DEMILUNE_ABYSSITE) then
        demilune = demilune + 64
    end
    if player:hasKeyItem(tpz.ki.CRIMSON_DEMILUNE_ABYSSITE) then
        demilune = demilune + 128
    end
    if player:hasKeyItem(tpz.ki.EMERALD_DEMILUNE_ABYSSITE) then
        demilune = demilune + 256
    end
    if player:hasKeyItem(tpz.ki.VERMILLION_DEMILUNE_ABYSSITE) then
        demilune = demilune + 512
    end
    if player:hasKeyItem(tpz.ki.INDIGO_DEMILUNE_ABYSSITE) then
        demilune = demilune + 1024
    end
    return demilune
end

tpz.abyssea.getNewYellowWeakness = function(mob)
    local day = VanadielDayElement()
    local weakness = math.random(day - 1, day + 1)

    if weakness < 0 then weakness = 7 elseif weakness > 7 then weakness = 0 end

    return yellowWeakness[weakness][math.random(#yellowWeakness[weakness])]
end

tpz.abyssea.getNewRedWeakness = function(mob)
    return 161
end

tpz.abyssea.getNewBlueWeakness = function(mob)
    local time = VanadielHour()
    local table = 3

    if time >= 6 and time < 14 then
        table = 1
    elseif time >= 14 and time < 22 then
        table = 2
    end

    return blueWeakness[table][math.random(#blueWeakness[table])]
end

tpz.abyssea.procMonster = function(mob, player, triggerType)
    if player and player:getAllegiance() == 1 then
        local master = player:getMaster()
        if master then
            player = master
        end
		if triggerType == tpz.abyssea.triggerType.RED then
			if mob:getLocalVar("[AbysseaRedProc]") == 0 then
				mob:setLocalVar("[AbysseaRedProc]", 1)
			else
				mob:setLocalVar("[AbysseaRedProc]", 0)
			end
			mob:weaknessTrigger(2)
			mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
		elseif extensions == tpz.abyssea.triggerType.YELLOW then
			if mob:getLocalVar("[AbysseaYellowProc]") == 0 then
				mob:setLocalVar("[AbysseaYellowProc]", 1)
			else
				mob:setLocalVar("[AbysseaYellowProc]", 0)
			end
			mob:weaknessTrigger(1)
			mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
		elseif extensions == tpz.abyssea.triggerType.BLUE then
			if mob:getLocalVar("[AbysseaBlueProc]") == 0 then
				mob:setLocalVar("[AbysseaBlueProc]", 1)
			else
				mob:setLocalVar("[AbysseaBlueProc]", 0)
			end
			mob:weaknessTrigger(0)
			mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 30)
		end
    end
end

-- trade to QM to pop mob
tpz.abyssea.qmOnTrade = function(player, npc, trade)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()]
    if not pop then
        return false
    end

    -- validate trade-to-pop
    local reqTrade = pop[2]
    if #reqTrade == 0 or trade:getItemCount() ~= #reqTrade then
        return false
    end

    -- validate traded items
    for k, v in pairs(reqTrade) do
        if not trade:hasItemQty(v, 1) then
            return false
        end
    end

    -- validate nm status
    local nm = pop[4]
    if GetMobByID(nm):isSpawned() then
        return false
    end

    -- complete trade and pop nm
    player:tradeComplete()
    local dx = player:getXPos() + math.random(-1, 1)
    local dy = player:getYPos()
    local dz = player:getZPos() + math.random(-1, 1)
    GetMobByID(nm):setSpawn(dx, dy, dz)
	
	SpawnMob(nm):updateClaim(player)
	local mob = GetMobByID(nm)
	GetMobByID(nm):setLocalVar("[ClaimedBy]", player:getID())
	
    return true
end

tpz.abyssea.qmOnTrigger = function(player, npc)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()]
    if not pop then
        return false
    end

    -- validate nm status
    local nm = pop[4]
    if GetMobByID(nm):isSpawned() then
        return false
    end

    -- validate trade-to-pop
    local t = pop[2]
    if #t > 0 then
        for i = 1, 8, 1 do
            if not t[i] then
                t[i] = 0
            end
        end
        player:startEvent(events[1], t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8]) -- report required trades
        return true
    end

    -- validate ki-to-pop
    local kis = pop[3]
    if #kis == 0 then
        return false
    end

    -- validate kis
    local validKis = true
    for k, v in pairs(kis) do
        if not player:hasKeyItem(v) then
            validKis = false
            break
        end
    end

    -- infill kis
    for i = 1, 8, 1 do
        if not kis[i] then
            kis[i] = 0
        end
    end

    -- start event
    if validKis then
        player:setLocalVar("abysseaQM", npc:getID())
        player:startEvent(events[2], kis[1], kis[2], kis[3], kis[4], kis[5], kis[6], kis[7], kis[8]) -- player has all key items
        return true
    else
        player:startEvent(events[3], kis[1], kis[2], kis[3], kis[4], kis[5], kis[6], kis[7], kis[8]) -- player is missing key items
        return false
    end
end

tpz.abyssea.qmOnEventUpdate = function(player, csid, option)
    return false
end

tpz.abyssea.qmOnEventFinish = function(player, csid, option)
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[player:getLocalVar("abysseaQM")]
    player:setLocalVar("abysseaQM", 0)
    if not pop then
        return false
    end

    if csid == events[2] and option == 1 then
        -- delete kis
        local kis = pop[3]
        for k, v in pairs(kis) do
            if player:hasKeyItem(v) then
                player:delKeyItem(v)
            end
        end

        -- pop nm
        local nm = pop[4]
        local dx = player:getXPos() + math.random(-1, 1)
        local dy = player:getYPos()
        local dz = player:getZPos() + math.random(-1, 1)
        GetMobByID(nm):setSpawn(dx, dy, dz)
        SpawnMob(nm):updateClaim(player)
		local mob = GetMobByID(nm)
		GetMobByID(nm):setLocalVar("[ClaimedBy]", player:getID())
	
        return true
    end
end

function isInAbysseaZone(player)
    return player:getCurrentRegion() == tpz.region.ABYSSEA
end

function GetAbysseaStats(player)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]

    if isInAbysseaZone(player) then
        local pearl  = player:getCharVar("pearlLight")
        local azure  = player:getCharVar("azureLight")
        local ruby   = player:getCharVar("rubyLight")
        local amber  = player:getCharVar("amberLight")
        local gold   = player:getCharVar("goldLight")
        local silver = player:getCharVar("silverLight")
        local ebon   = player:getCharVar("ebonLight")

        player:messageSpecial(ID.text.LIGHTS_MESSAGE_1, pearl, ebon, gold, silver)
        player:messageSpecial(ID.text.LIGHTS_MESSAGE_2, azure, ruby, amber)
    end
end

tpz.abyssea.ResetPlayerLights = function(player)
    player:setCharVar("pearlLight", 0)
    player:setCharVar("azureLight", 0)
    player:setCharVar("rubyLight", 0)
    player:setCharVar("amberLight", 0)
    player:setCharVar("goldLight", 0)
    player:setCharVar("silverLight", 0)
    player:setCharVar("ebonLight", 0)
end

tpz.abyssea.SetBonusLights = function(player)
    player:addCharVar("pearlLight", ABYSSEA_BONUSLIGHT_AMOUNT)
    player:addCharVar("azureLight", ABYSSEA_BONUSLIGHT_AMOUNT)
    player:addCharVar("rubyLight",  ABYSSEA_BONUSLIGHT_AMOUNT)
    player:addCharVar("amberLight", ABYSSEA_BONUSLIGHT_AMOUNT)
    player:addCharVar("goldLight",  ABYSSEA_BONUSLIGHT_AMOUNT)
    player:addCharVar("silverLight", ABYSSEA_BONUSLIGHT_AMOUNT)
    player:addCharVar("ebonLight",  ABYSSEA_BONUSLIGHT_AMOUNT)
end

tpz.abyssea.AddPlayerLights = function(player, light, amount)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]
    local tiermsg     = 0
    local lightamount = amount or 0
    
    if lightamount <= 8 then
        tiermsg = 0
    elseif lightamount > 8 and lightamount <= 16 then
        tiermsg = 1
    elseif lightamount > 16 and lightamount <= 32 then
        tiermsg = 2
    elseif lightamount > 32 and lightamount <= 64 then
        tiermsg = 3
    elseif lightamount > 64 then
        tiermsg = 4
    end

    if light == tpz.abyssea.lightType.PEARL or 
        light == tpz.abyssea.lightType.GOLDEN or 
        light == tpz.abyssea.lightType.SILVERY or 
        light == tpz.abyssea.lightType.EBON then
        if tiermsg > 2 then
            tiermsg = 2
        end
    end

    if light == tpz.abyssea.lightType.PEARL then
        player:setCharVar("pearlLight",utils.clamp(player:getCharVar("pearlLight") + lightamount, 0, 230))
        player:messageSpecial(ID.text.BODY_EMITS_PEARL_LIGHT,tiermsg)
    elseif light == tpz.abyssea.lightType.AZURE then
        player:setCharVar("azureLight",utils.clamp(player:getCharVar("azureLight") + lightamount, 0, 255))
        player:messageSpecial(ID.text.BODY_EMITS_AZURE_LIGHT,tiermsg)
    elseif light == tpz.abyssea.lightType.RUBY then
        player:setCharVar("rubyLight",utils.clamp(player:getCharVar("rubyLight") + lightamount, 0, 255))
        player:messageSpecial(ID.text.BODY_EMITS_RUBY_LIGHT,tiermsg)
    elseif light == tpz.abyssea.lightType.AMBER then
        player:setCharVar("amberLight",utils.clamp(player:getCharVar("amberLight") + lightamount, 0, 255))
        player:messageSpecial(ID.text.BODY_EMITS_AMBER_LIGHT,tiermsg)
    elseif light == tpz.abyssea.lightType.GOLDEN then
        player:setCharVar("goldLight",utils.clamp(player:getCharVar("goldLight") + lightamount, 0, 200))
        player:messageSpecial(ID.text.BODY_EMITS_GOLDEN_LIGHT,tiermsg) 
    elseif light == tpz.abyssea.lightType.SILVERY then
        player:setCharVar("silverLight",utils.clamp(player:getCharVar("silverLight") + lightamount, 0, 200))
        player:messageSpecial(ID.text.BODY_EMITS_SILVERY_LIGHT,tiermsg)
    elseif light == tpz.abyssea.lightType.EBON then
        player:setCharVar("ebonLight",utils.clamp(player:getCharVar("ebonLight") + lightamount, 0 ,200))
        player:messageSpecial(ID.text.BODY_EMITS_EBON_LIGHT,tiermsg)
    end
end

function convertTimeDescending(raw_time)
    local rawSeconds = tonumber(raw_time)
    local timeTable = {0,0,0}

    timeTable[1] = string.format("%02.f", math.floor(-rawSeconds/3600))
    timeTable[2] = string.format("%02.f", math.floor(-rawSeconds/60 - (timeTable[1]*60)))
    timeTable[3] = string.format("%02.f", math.floor(-rawSeconds - timeTable[1]*3600 - timeTable[2] *60))

    return timeTable
end


function canEnterAbyssea(player)
    if (player:getCharVar("lastEnteredAbyssea") <= os.time() or player:getCharVar("lastEnteredAbyssea") == 0) and player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.THE_TRUTH_BECKONS) >= QUEST_ACCEPTED and player:getMainLvl() >= 65 then
        player:PrintToPlayer("If you have a Dedication effect from an experience ring, it will wear off upon entering Abyssea.", tpz.msg.channel.SYSTEM_3)
        return true
    end

    local lastEnterTable = {0,0,0}
	if player:getCharVar("lastEnteredAbyssea")  ~= 0 then
		lastEnterTable = convertTimeDescending(os.time() - player:getCharVar("lastEnteredAbyssea"))
		player:PrintToPlayer("You must wait " ..lastEnterTable[1].. " hours, " ..lastEnterTable[2].. " minutes, and " ..lastEnterTable[3].. " seconds before you can enter Abyssea again.", tpz.msg.channel.SYSTEM_3)
	end

    return false
end