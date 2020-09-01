-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Megantereon
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
        player:addKeyItem(tpz.ki.BLOODIED_SABER_TOOTH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BLOODIED_SABER_TOOTH)
    end
end