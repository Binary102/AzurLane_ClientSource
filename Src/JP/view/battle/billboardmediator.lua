slot0 = class("BillboardMediator", import("..base.ContextMediator"))
slot0.REFRESH_BILLBOARD = "BillboardMediator:REFRESH_BILLBOARD"
slot0.OPEN_RIVAL_INFO = "BillboardMediator:OPEN_RIVAL_INFO"
slot0.GET_POWERRANK = "BillboardMediator:GET_POWERRANK"

function slot0.register(slot0)
	slot0:bind(slot0.REFRESH_BILLBOARD, function (slot0)
		slot0:sendNotification(GAME.REFRESH_BILLBOARD)
	end)
	slot0:bind(slot0.OPEN_RIVAL_INFO, function (slot0, slot1)
		slot0:sendNotification(GAME.GET_RIVAL_INFO, slot1)
	end)
	slot0:bind(slot0.GET_POWERRANK, function (slot0, slot1, slot2, slot3)
		slot0:sendNotification(GAME.GET_POWERRANK, {
			type = slot1 or 1,
			page = slot2 or 1,
			act_id = slot3
		})
	end)
	slot0.viewComponent:setPlayer(slot2)

	slot3 = getProxy(BayProxy)

	slot0.viewComponent:setSecondaryPoint(slot3:getBayPower(), 1)
	slot0.viewComponent:setPresonalPoint(getProxy(CollectionProxy).getCollectionCount(slot4), 2)
	slot0.viewComponent:setPlayerShip(slot5)

	function slot6()
		slot0:sendNotification(GAME.REFRESH_BILLBOARD)

		BillboardMediator.time = pg.TimeMgr.GetInstance():GetServerTime() + REFRESH_BILLBOARD_TIME
	end

	slot7 = getProxy(MilitaryExerciseProxy)

	if BillboardMediator.time then
		if BillboardMediator.time - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			slot6()
		else
			slot0.viewComponent:setBillboard(slot7:getArenaRankList())
		end
	else
		slot6()
	end

	slot0.viewComponent:setSeasonInfo(slot8)

	slot12, slot10 = slot0:getRankMsg()

	for slot14, slot15 in ipairs(slot9) do
		slot0:sendNotification(GAME.GET_POWERRANK, slot10[slot15])
		slot0:sendNotification(GAME.GET_PLAYERPOWERRANK, slot10[slot15])
	end
end

function slot0.getRankMsg(slot0)
	slot2 = getProxy(MilitaryExerciseProxy).rankMsgInfo

	if not slot0.refresh or not slot2 then
		slot1:buildRankMsg()

		slot0.refresh = true
	end

	return slot1.rankMsgList, slot1.rankMsgInfo
end

function slot0.listNotificationInterests(slot0)
	return {
		MilitaryExerciseProxy.ARENARANK_UPDATED,
		GAME.GET_RIVAL_INFO_DONE,
		MilitaryExerciseProxy.POWERRANK_UPDATED,
		MilitaryExerciseProxy.MYPOWERRANK_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == MilitaryExerciseProxy.ARENARANK_UPDATED then
		slot0.viewComponent:setBillboard(slot3)
	elseif slot2 == MilitaryExerciseProxy.POWERRANK_UPDATED then
		slot0.viewComponent:setRank(slot3.list, slot3.nextTime, slot3.page, slot3.type, slot3.act_id)
	elseif slot2 == MilitaryExerciseProxy.MYPOWERRANK_UPDATED then
		slot4 = slot3.point or 0

		if slot3.act_id and getProxy(ActivityProxy):getActivityById(slot3.act_id) and not slot5:isEnd() then
			slot0.viewComponent:setPlayerRank(slot5:getData1() or 0, slot3.rank, slot3.type, slot3.act_id)
		end
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
