-----------------------------------
--
-- Zone: Arrapago_Reef (54)
--
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    zone:registerRegion(1, -462, -4, -420, -455, -1, -392) -- approach the Cutter
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-456, -3, -405, 64)
    end

    if prevZone == xi.zone.THE_ASHU_TALIF then
        if player:getCurrentMission(TOAU) == xi.mission.id.toau.THE_BLACK_COFFIN and player:getCharVar("AhtUrganStatus") == 2 then
            player:setPos(-456, -3, -405, 64)
            cs = 9
        elseif player:getCharVar("AgainstAllOdds") == 3 then
            cs = 238
        end
    elseif prevZone == xi.zone.CAEDARVA_MIRE then
        if player:getCurrentMission(TOAU) == xi.mission.id.toau.PREVALENCE_OF_PIRATES and player:getCharVar("AhtUrganStatus") == 0 then
            cs = 13
        end
    elseif prevZone == xi.zone.ILRUSI_ATOLL then
        player:setPos(26, -7, 606, 222)
    end
    return cs
end

zone_object.afterZoneIn = function(player)
    player:entityVisualPacket("1pb1")
    player:entityVisualPacket("2pb1")
end

zone_object.onRegionEnter = function(player, region)
    if player:getCurrentMission(TOAU) == xi.mission.id.toau.THE_BLACK_COFFIN and player:hasKeyItem(xi.ki.EPHRAMADIAN_GOLD_COIN) and player:getCharVar("AhtUrganStatus") == 0 then
        player:startEvent(8)
    elseif player:getCurrentMission(TOAU) == xi.mission.id.toau.PREVALENCE_OF_PIRATES and player:getCharVar("AhtUrganStatus") == 1 then
        player:startEvent(14)
    elseif player:getCurrentMission(TOAU) == xi.mission.id.toau.TESTING_THE_WATERS and player:hasKeyItem(xi.ki.EPHRAMADIAN_GOLD_COIN) then
        player:startEvent(15)
    elseif player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.AGAINST_ALL_ODDS) == QUEST_ACCEPTED and player:getCharVar("AgainstAllOdds") == 1 then
        player:startEvent(237)
    end
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 8 then
        player:setCharVar("AhtUrganStatus", 1)
        player:startEvent(34, 1, 1, 1, 1, 1, 1, 1, 1)
    elseif csid == 9 then
        player:setCharVar("AhtUrganStatus", 3)
        player:setPos(0, 0, 0, 0, 53)
    elseif csid == 13 then
        player:setCharVar("AhtUrganStatus", 1)
    elseif csid == 14 then
        player:completeMission(xi.mission.log_id.TOAU, xi.mission.id.toau.PREVALENCE_OF_PIRATES)
        player:setCharVar("AhtUrganStatus", 0)
        player:addKeyItem(xi.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.PERIQIA_ASSAULT_AREA_ENTRY_PERMIT)
        player:addMission(xi.mission.log_id.TOAU, xi.mission.id.toau.SHADES_OF_VENGEANCE)
    elseif csid == 15 then
        player:setCharVar("AhtUrganStatus", 1)
        player:setPos(0, 0, 0, 0, 57)
    elseif csid == 34 and player:getCharVar("AhtUrganStatus") == 1 then
        player:startEvent(35)
    elseif csid == 108 then -- enter instance: illrusi atoll
        player:setPos(0, 0, 0, 0, 55)
    elseif csid == 222 then -- Enter instance: Black coffin
        player:setPos(0, 0, 0, 0, 60)
    elseif csid == 237 then
        player:startEvent(240)
    elseif csid == 238 then
        npcUtil.completeQuest(player, AHT_URHGAN, xi.quest.id.ahtUrhgan.AGAINST_ALL_ODDS, { item=15266, var="AgainstAllOdds"})
    elseif csid == 240 then
        player:setCharVar("AgainstAllOdds", 2)
    end
end

return zone_object
