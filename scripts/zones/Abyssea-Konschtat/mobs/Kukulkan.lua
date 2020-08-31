-----------------------------------
-- Area: Abyssea - Konschtat
--   NM: Kukulkan
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Abyssea-Konschtat/IDs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobDeath(mob, player, isKiller)
    if (math.random(1, 100) >= 70) then
        player:addKeyItem(tpz.ki.VENOMOUS_PEISTE_CLAW)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.VENOMOUS_PEISTE_CLAW)
    end
end