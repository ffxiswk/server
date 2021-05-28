-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Perfaumand
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -39 -3 69 233
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local WildcatSandy = player:getCharVar("WildcatSandy")

    -- "Lure of the Wildcat"
    if
        player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and
        not utils.mask.getBit(WildcatSandy, 18)
    then
        player:startEvent(560)

    -- San d'Oria Missions
    elseif player:getNation() == xi.nation.SANDORIA and player:getRank(player:getNation()) ~= 10 then
        local sandyMissions = xi.mission.id.sandoria
        local currentMission = player:getCurrentMission(SANDORIA)
        local missionStatus = player:getMissionStatus(player:getNation())

        -- San d'Oria 9-2 "The Heir to the Light" (optional dialogue)
        if currentMission == sandyMissions.THE_HEIR_TO_THE_LIGHT and (missionStatus == 2 or missionStatus == 5) then
            if missionStatus == 5 then
                playerStartEvent(7)
            else
                player:startEvent(2)
            end

        -- San d'Oria 6-2 "Ranperre's Final Rest" (optional dialogue)
        elseif currentMission == sandyMissions.RANPERRE_S_FINAL_REST then
            if player:hasKeyItem(xi.ki.ANCIENT_SANDORIAN_BOOK) and missionStatus > 2 and missionStatus < 6 then
                player:startEvent(49)
            elseif missionStatus == 6 then
                player:startEvent(50)
            elseif missionStatus == 7 then
                player:startEvent(79)
            end

        -- Default dialogue
        else
            player:startEvent(522)
        end
    else
        player:startEvent(522)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if csid == 560 then
        player:setCharVar("WildcatSandy", utils.mask.setBit(player:getCharVar("WildcatSandy"), 18, true))
    end

end

return entity
