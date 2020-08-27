-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Cavernous Maw
-- !pos -28.597, 46.056, -685.754 117
-- Teleports Players to Abyssea - Tahrongi
-----------------------------------
local ID = require("scripts/zones/Tahrongi_Canyon/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/abyssea")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (ENABLE_ABYSSEA == 1 and player:getMainLvl() >= 30) then
        local HasStone = tpz.abyssea.getTravStonesTotal(player)
        if (HasStone >= 1 and player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.DAWN_OF_DEATH) == QUEST_ACCEPTED
        and player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.A_GOLDSTRUCK_GIGAS) == QUEST_AVAILABLE) then
            player:startEvent(9)
        else
            if canEnterAbyssea(player) then
                player:startEvent(218,0,1) -- No param = no entry.
            end 
		end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 38 then
        player:addQuest(ABYSSEA, tpz.quest.id.abyssea.MEGADRILE_MENACE)
    elseif csid == 39 then
        -- Killed Glavoid
    elseif csid == 100 and option == 1 then
        player:setPos(-24, 44, -678, 240, 45)
    end
end
