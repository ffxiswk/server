-----------------------------------
-- Area: Pso'Xja
--  NPC: _096 (Stone Gate)
-- Notes: Spawns Gargoyle when triggered
-- !pos 290.000 -1.925 -98.399 9
-----------------------------------
require("scripts/zones/PsoXja/globals")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if ( player:getMainJob() == xi.job.THF and trade:getItemCount() == 1 and (trade:hasItemQty(1115, 1) or trade:hasItemQty(1023, 1) or trade:hasItemQty(1022, 1)) ) then
        attemptPickLock(player, npc, player:getZPos() <= -99)
    end
end

entity.onTrigger = function(player, npc)
    attemptOpenDoor(player, npc, player:getZPos() <= -99)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 26 and option == 1) then
        player:setPos(260, -0.25, -20, 254, 111)
    end
end

return entity
