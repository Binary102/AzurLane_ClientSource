class("ActivityNewPtOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id) or slot4:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = slot2.activity_id,
		cmd = slot2.cmd or 0,
		arg1 = slot2.arg1 or 0,
		arg2 = slot2.arg2 or 0
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}

			if slot0.cmd == 1 then
				for slot5, slot6 in ipairs(slot0.award_list) do
					table.insert(slot1, slot7)
					slot1:sendNotification(GAME.ADD_ITEM, Item.New({
						type = slot6.type,
						id = slot6.id,
						count = slot6.number
					}))
				end

				slot2.data2 = slot0.arg1
			elseif slot0.cmd == 2 then
				slot2.data3 = slot0.number[1]
			end

			slot3:updateActivity(slot3.updateActivity)
			slot1:sendNotification(GAME.ACT_NEW_PT_DONE, {
				awards = slot1
			})
		else
			print(slot0.result)
		end
	end)
end

return class("ActivityNewPtOPCommand", pm.SimpleCommand)
