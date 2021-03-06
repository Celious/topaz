-----------------------------------
--
-- Zone: Rolanberry_Fields_[S] (91)
--
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
-----------------------------------

function onInitialize(zone)
	local zoneUsed = GetServerVariable("[DIZone]")

	-- dark ixion
	if zoneUsed ~= 91 then
		DisallowRespawn(17150321, true)
	else
		local popTime = GetServerVariable("[DIPop]")
		local nm = GetMobByID(17150321)
		if popTime ~= 0 then
			nm:setRespawnTime(popTime - os.time())
		else
			local respawnTime = math.random(72000, 86400) -- 20 to 24 hr
            SetServerVariable("[DIPop]", respawnTime + os.time())
            nm:setRespawnTime(respawnTime)
		end
	end
end

function onZoneIn(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-376.179, -30.387, -776.159, 220)
    end
    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
