-----------------------------------
-- Area: Windurst_Woods
--  NPC: Bin Stejihna
-- Only sells when Windurst controlls Zulkheim Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/shop")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local RegionOwner = GetRegionOwner(xi.region.ZULKHEIM)
    if RegionOwner ~= xi.nation.WINDURST then
        player:showText(npc, ID.text.BIN_STEJIHNA_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.BIN_STEJIHNA_OPEN_DIALOG)

        local rank = GetNationRank(xi.nation.WINDURST)
        if rank ~= 3 then
            table.insert(stock, 1840) --Semolina
            table.insert(stock, 1840)
        end

        local stock =
        {
            1840,  1840,  -- Semolina
            4372,    44,  -- Giant Sheep Meat
            622,     44,  -- Dried Marjoram
            610,     55,  -- San d'Orian Flour
            611,     36,  -- Rye Flour
            4366,    22,  -- La Theine Cabbage
            4378,    55   -- Selbina Milk
        }

        xi.shop.general(player, stock, WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
