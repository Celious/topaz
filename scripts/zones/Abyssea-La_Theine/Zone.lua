-----------------------------------
--
-- Zone: Abyssea - La_Theine
--
-----------------------------------
local ID = require("scripts/zones/Abyssea-La_Theine/IDs")
require("scripts/globals/quests")
require("scripts/globals/abyssea")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-480.5,-0.5,794,62)
    end

    if player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED and player:getCharVar("1stTimeAbyssea") == 0 then
        player:setCharVar("1stTimeAbyssea",1)
    end

    tpz.abyssea.ResetPlayerLights(player)

    local visitantEffect = tpz.effect.VISITANT
    local visitantStatusEffect = player:getStatusEffect(visitantEffect)

    if not player:hasStatusEffect(visitantEffect) then
        player:addStatusEffect(tpz.effect.VISITANT,0,3,5400)
    end
    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end