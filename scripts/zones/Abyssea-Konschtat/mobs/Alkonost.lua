-----------------------------------
-- Area: Abyssea - Konschtat
--   NM: Alkonost
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Abyssea-Konschtat/IDs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobDeath(mob, player, isKiller)
    --compare using something like
    if tpz.abyssea.canGiveNMKI(player, mob) then
        player:addKeyItem(tpz.ki.TATTERED_HIPPOGRYPH_WING)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.TATTERED_HIPPOGRYPH_WING)
    end
end