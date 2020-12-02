-----------------------------------
--
-- tpz.effect.ATMA
--
-----------------------------------
require("scripts/globals/atma")
require("scripts/globals/abyssea")
-----------------------------------

function onEffectGain(target, effect)
    tpz.atma.onEffectGain(target, effect)
end

function onEffectTick(target, effect)
	if isInAbysseaZone(target) then
        target:delStatusEffect(effect)
    end
end

function onEffectLose(target, effect)
    tpz.atma.onEffectLose(target, effect)
end
