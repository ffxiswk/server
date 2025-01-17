-----------------------------------
-- Area: Ranguemont Pass
--  NPC: Waters of Oblivion
-- Finish Quest: Painful Memory (BARD AF1)
-- !pos -284 -45 210 166
-----------------------------------
local ID = require("scripts/zones/Ranguemont_Pass/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    TrosKilled = player:getCharVar("TrosKilled")

    if (player:hasKeyItem(xi.ki.MERTAIRES_BRACELET) and
        not GetMobByID(ID.mob.TROS):isSpawned() and
        (TrosKilled == 0 or (os.time() - player:getCharVar("Tros_Timer")) > 60)
    ) then
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        SpawnMob(ID.mob.TROS):updateClaim(player)
    elseif (player:hasKeyItem(xi.ki.MERTAIRES_BRACELET) and TrosKilled == 1) then
        player:startEvent(8) -- Finish Quest "Painful Memory"
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 8) then
        if (npcUtil.completeQuest(player, JEUNO, xi.quest.id.jeuno.PAINFUL_MEMORY, {item=16766})) then
            player:delKeyItem(xi.ki.MERTAIRES_BRACELET)
            player:setCharVar("TrosKilled", 0)
            player:setCharVar("Tros_Timer", 0)
        end
    end
end

return entity
