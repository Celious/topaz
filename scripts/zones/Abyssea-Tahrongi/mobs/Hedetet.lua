-----------------------------------
-- Area: Abyssea - Tahrongi
--   NM: Hedetet
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Abyssea-Tahrongi/IDs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobDeath(mob, player, isKiller)
    --compare using something like
    if tpz.abyssea.canGiveNMKI(player, mob) then
        player:addKeyItem(tpz.ki.GORY_SCORPION_CLAW)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.GORY_SCORPION_CLAW)
    end
end