-----------------------------------
--
-- tpz.effect.BEWILDERED_DAZE_3
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.CRITHITRATE, -3)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CRITHITRATE, -3)
end
