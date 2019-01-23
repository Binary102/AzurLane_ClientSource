class("GetPowerRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().page or 1

	if (getProxy(MilitaryExerciseProxy):getNextTime(slot2.type or 1, slot2.act_id) or 0) < pg.TimeMgr.GetInstance():GetServerTime() then
		slot6:clearPowerRankList(slot4, slot5)
	end

	if not slot6:getPowerRankList(slot4, slot3, slot5) or #slot8 <= 0 then
		pg.ConnectionMgr.GetInstance():Send(18201, {
			page = slot3,
			type = slot4,
			act_id = slot5
		}, 18202, function (slot0)
			slot1 = {}
			slot2 = 0
			slot3 = 1
			slot4 = getProxy(MilitaryExerciseProxy)

			if slot0 > 1 and slot4:getPowerRank(slot1, slot0 - 1, 20, slot2) then
				slot2 = slot5.power
				slot3 = slot5.rank
			end

			for slot8, slot9 in ipairs(slot0.list) do
				slot2 = slot11

				slot10:setRank((slot2 == PowerRank.New(slot9).power and slot3) or (slot0 - 1) * 20 + slot8)
				table.insert(slot1, slot10)
			end

			slot4:setNextTime(slot1, GetHalfHour(), slot2)
			slot4:updatePowerRankList(slot1, slot1, slot0, slot2)
		end)
	else
		slot0:sendNotification(MilitaryExerciseProxy.POWERRANK_UPDATED, {
			list = slot8,
			nextTime = slot7,
			page = slot3,
			type = slot4,
			act_id = slot5
		})
	end
end

return class("GetPowerRankCommand", pm.SimpleCommand)
