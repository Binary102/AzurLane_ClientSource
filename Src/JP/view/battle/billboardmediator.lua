slot0 = class("BillboardMediator", import("..base.ContextMediator"))
slot0.FETCH_RANKS = "BillboardMediator:FETCH_RANKS"
slot0.OPEN_RIVAL_INFO = "BillboardMediator:OPEN_RIVAL_INFO"

function slot0.register(slot0)
	slot1 = getProxy(BillboardProxy)

	slot0.viewComponent:updateRankList(slot0.contextData.page or PowerRank.TYPE_POWER, slot1:getListByType(slot0.contextData.page or PowerRank.TYPE_POWER), slot1:getPlayerDataByType(slot0.contextData.page or PowerRank.TYPE_POWER), slot0.contextData.act_id or PowerRank:getActivityIdByRankType(slot0.contextData.page or PowerRank.TYPE_POWER))
	slot0:bind(slot0.FETCH_RANKS, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.GET_POWERRANK, {
			type = slot1,
			activityId = slot2
		})
	end)
	slot0:bind(slot0.OPEN_RIVAL_INFO, function (slot0, slot1)
		slot0:sendNotification(GAME.GET_RIVAL_INFO, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.GET_POWERRANK_DONE,
		GAME.GET_RIVAL_INFO_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.GET_POWERRANK_DONE then
		slot0.viewComponent:updateRankList(slot3.type, slot3.list, slot3.playerRankinfo, slot3.activityId)
		slot0.viewComponent:filter(slot3.type, slot3.activityId)
	elseif slot2 == GAME.GET_RIVAL_INFO_DONE then
		slot0:addSubLayers(Context.New({
			viewComponent = RivalInfoLayer,
			mediator = RivalInfoMediator,
			data = {
				rival = slot3.rival,
				type = RivalInfoLayer.TYPE_DISPLAY
			}
		}))
	end
end

return slot0
