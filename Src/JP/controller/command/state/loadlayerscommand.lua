class("LoadLayersCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot1:getBody().type = LOAD_TYPE_LAYER

	slot0:sendNotification(GAME.LOAD_CONTEXT, slot1.getBody())
end

return class("LoadLayersCommand", pm.SimpleCommand)
