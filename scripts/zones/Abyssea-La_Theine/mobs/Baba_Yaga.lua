-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Baba Yaga
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Abyssea-La_Theine/IDs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobDeath(mob, player, isKiller)
    --compare using something like
    if tpz.abyssea.canGiveNMKI(player, mob) then
        player:addKeyItem(tpz.ki.SHIMMERING_PIXIE_PINION)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.SHIMMERING_PIXIE_PINION)
    end
end