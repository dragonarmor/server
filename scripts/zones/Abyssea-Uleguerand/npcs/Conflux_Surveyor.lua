-----------------------------------
-- Zone: Abyssea - Uleguerand
--  NPC: Conflux Surveyor
-----------------------------------
require("scripts/globals/abyssea")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.surveyorOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.surveyorOnEventFinish(player, csid, option, npc)
end

return entity