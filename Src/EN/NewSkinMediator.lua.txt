slot0 = class("NewSkinMediator", import("..base.ContextMediator"))
slot0.SET_SKIN = "NewSkinMediator:SET_SKIN"
slot0.ON_EXIT = "NewSkinMediator:ON_EXIT"

slot0.register = function (slot0)
	slot0.viewComponent:setSkin(slot0.contextData.skinId)
	slot0:bind(slot0.SET_SKIN, function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			slot0:sendNotification(GAME.SET_SHIP_SKIN, {
				shipId = slot6,
				skinId = slot0.contextData.skinId
			})
		end

		slot0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	slot0:sendNotification(GAME.SET_SHIP_FLAG, {
		shipsById = getProxy(BayProxy).getData(slot1),
		flags = slot0.contextData.flags or {}
	})
end

slot0.listNotificationInterests = function (slot0)
	return {
		GAME.SET_SHIP_FLAG_DONE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.SET_SHIP_FLAG_DONE then
		slot0.viewComponent:setShipVOs(slot3.shipsById)
	end
end

return slot0
