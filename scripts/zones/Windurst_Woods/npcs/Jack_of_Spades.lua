-----------------------------------
-- Area: Windurst Woods
--  NPC: Jack of Spades
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs");
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/npc_util")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
		4096,	102, 3,	-- Fire Crystal
		4097,	307, 2,	-- Ice Crystal
		4098,	99,  3,	-- Wind Crystal
		4099,	102, 3,	-- Earth Crystal
		4100,	307, 2,	-- Lightning Crystal
		4101,	116, 3,	-- Water Crystal
		4102,	718, 1,	-- Light Crystal
		4103,	589, 1,	-- Dark Crystal
        4274,  1421, 2, -- Persikos
        4273,  1002, 2, -- Kitron
        4449,  3331, 1, -- Reishi Mushroom
    }

    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
	-- player:startEvent(10009,0,4)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end