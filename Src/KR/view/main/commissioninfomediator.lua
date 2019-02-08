slot0 = class("CommissionInfoMediator", import("..base.ContextMediator"))
slot0.FINISH_EVENT = "CommissionInfoMediator:FINISH_EVENT"
slot0.ON_ACTIVE_EVENT = "CommissionInfoMediator:ON_ACTIVE_EVENT"
slot0.GET_OIL_RES = "CommissionInfoMediator:GET_OIL_RES"
slot0.GET_GOLD_RES = "CommissionInfoMediator:GET_GOLD_RES"

function slot0.register(slot0)
	slot1 = getProxy(EventProxy)

	slot0.viewComponent:setEvents(slot1:getEventList(), slot1.maxFleetNums)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getData(slot2))
	slot0:bind(slot0.FINISH_EVENT, function (slot0, slot1)
		slot0.contextData.inFinished = true

		slot0:sendNotification(GAME.EVENT_FINISH, {
			id = slot1.id,
			callback = function ()
				slot0.contextData.inFinished = nil
			end
		})
	end)
	slot0:bind(slot0.ON_ACTIVE_EVENT, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	slot0:bind(slot0.GET_OIL_RES, function (slot0)
		slot0:sendNotification(GAME.HARVEST_RES, ResourceField.TYPE_OIL)
	end)
	slot0:bind(slot0.GET_GOLD_RES, function (slot0)
		slot0:sendNotification(GAME.HARVEST_RES, ResourceField.TYPE_GOLD)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		GAME.HARVEST_RES_DONE,
		GAME.EVENT_LIST_UPDATE,
		GAME.EVENT_SHOW_AWARDS
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.HARVEST_RES_DONE then
		slot4 = nil

		if slot3.type == 2 then
			slot4 = i18n("word_oil")
		elseif slot3.type == 1 then
			slot4 = i18n("word_gold")
		end

		pg.TipsMgr:GetInstance():ShowTips(i18n("commission_get_award", slot4, slot3.outPut))
	elseif slot2 == GAME.EVENT_LIST_UPDATE then
		slot4 = getProxy(EventProxy)

		slot0.viewComponent:setEvents(slot4:getEventList(), slot4.maxFleetNums)
	elseif slot2 == GAME.EVENT_SHOW_AWARDS then
		slot4 = nil

		coroutine.wrap(function ()
			if #slot0.oldShips > 0 then
				slot1.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
					title = pg.collection_template[slot0.eventId].title,
					oldShips = slot0.oldShips,
					newShips = slot0.newShips,
					isCri = slot0.isCri
				}, )
				coroutine.yield()
			end

			slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot0.awards)
		end)()
	end
end

return slot0
