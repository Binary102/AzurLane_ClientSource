slot0 = class("BillboardProxy", import(".NetProxy"))
slot0.FETCH_LIST_DONE = "BillboardProxy:FETCH_LIST_DONE"
slot0.NONTIMER = {}

function slot0.register(slot0)
	slot0.NONTIMER = {
		PowerRank.TYPE_MILITARY_RANK
	}
	slot0.data = {}
	slot0.playerData = {}
	slot0.timers = {}
end

function slot0.setPlayerDataByType(slot0, slot1, slot2)
	if table.contains(slot0.NONTIMER, slot1) then
		return
	end

	slot0.playerData[slot1] = slot2
end

function slot0.getPlayerDataByType(slot0, slot1)
	return slot0.playerData[slot1]
end

function slot0.getListByType(slot0, slot1)
	return slot0.data[slot1]
end

function slot0.setListByType(slot0, slot1, slot2)
	if table.contains(slot0.NONTIMER, slot1) then
		return
	end

	if not slot0.data[slot1] then
		slot0:addTimer(slot1, GetHalfHour())
	end

	slot0.data[slot1] = slot2
end

function slot0.addTimer(slot0, slot1, slot2)
	if table.contains(slot0.NONTIMER, slot1) then
		return
	end

	if slot0.timers[slot1] then
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1] = nil
	end

	slot0.timers[slot1] = Timer.New(function ()
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1].Stop.timers[slot0.timers[slot1]] = nil

		slot0.timers[slot1].Stop.timers:sendNotification(GAME.GET_POWERRANK, {
			type = slot0.timers[slot1].Stop.timers
		})
		slot0.timers[slot1].Stop.timers.sendNotification:addTimer(slot0.timers[slot1].Stop.timers.sendNotification, GetHalfHour())
	end, slot2 - pg.TimeMgr.GetInstance():GetServerTime(), 1)

	slot0.timers[slot1]:Start()
end

function slot0.remove(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil
end

function slot0.canFetch(slot0, slot1)
	if slot1 == PowerRank.TYPE_PT then
		return true
	else
		return table.contains(slot0.NONTIMER, slot1) or slot0.timers[slot1] == nil
	end
end

return slot0
