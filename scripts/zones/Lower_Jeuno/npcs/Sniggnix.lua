-----------------------------------
-- Area: Lower Jeuno
--  NPC: Sniggnix
-- Type: Standard NPC
-- !pos -45.832 4.498 -135.029 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    thickAsThievesGamblingCS = player:getCharVar("thickAsThievesGamblingCS")

    if (trade:hasItemQty(1092, 1) and trade:getItemCount() == 1 and thickAsThievesGamblingCS == 7) then -- Trade Regal die
        rand1 = math.random(1, 700)
        player:startEvent(10026, 0, 1092, rand1)     -- complete gambling side quest for as thick as thieves
    end

end

entity.onTrigger = function(player, npc)

    thickAsThievesGamblingCS = player:getCharVar("thickAsThievesGamblingCS")

    if (thickAsThievesGamblingCS == 1) then
        rand1 = math.random(1, 999)
        rand2 = math.random(1, 999)
        player:startEvent(10024, 0, 1092, rand1, rand2)
    elseif (thickAsThievesGamblingCS >= 2 and thickAsThievesGamblingCS <= 6) then
        player:startEvent(10025, 0, 1092, rand1, rand2)

    else
        player:startEvent(10023)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 10024 and option == 1) then                -- player won first dice game
        player:setCharVar("thickAsThievesGamblingCS", 2)
    elseif (csid == 10026) then
        player:tradeComplete()
        player:setCharVar("thickAsThievesGamblingCS", 8)
        player:delKeyItem(xi.ki.SECOND_FORGED_ENVELOPE)
        player:addKeyItem(xi.ki.SECOND_SIGNED_FORGED_ENVELOPE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SECOND_SIGNED_FORGED_ENVELOPE)
    end


end

return entity
