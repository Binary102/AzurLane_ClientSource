class("InstagramActivityCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = getProxy(ActivityProxy).getActivityById(slot3, slot2.activity_id)

	print(slot2.activity_id, slot2.cmd, slot2.arg1, slot2.arg2)
	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = slot2.activity_id,
		cmd = slot2.cmd or 0,
		arg1 = slot2.arg1 or 0,
		arg2 = slot2.arg2 or 0,
		arg3 = slot2.arg3 or 0
	}, 11203, function (slot0)
		if slot0.result == 0 then
			if ActivityConst.INSTAGRAM_OP_ACTIVE == slot0.cmd then
				if slot1:GetMessageById(slot0.arg1) then
					slot1:UpdateMessage(slot1)
				else
					slot1:AddMessage(slot1)
				end

				if slot0.isActivate then
					slot1:UpdateNextPushTime(slot0.number[1])
					slot1:UpdateActiveCnt()
				end

				slot2:updateActivity(slot1)
				slot2.updateActivity:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
					activity = slot1
				})
			elseif ActivityConst.INSTAGRAM_OP_COMMENT == slot0.cmd or ActivityConst.INSTAGRAM_OP_LIKE == slot0.cmd or ActivityConst.INSTAGRAM_OP_MARK_READ == slot0.cmd then
				slot1 = Instagram.New(slot0.ins_message)

				slot1:UpdateMessage(slot1)
				slot1.UpdateMessage:updateActivity(slot1)
			end

			slot3:sendNotification(GAME.ACT_INSTAGRAM_OP_DONE, {
				cmd = slot0.cmd,
				id = slot0.arg1
			})

			if slot0.callback then
				slot0.callback()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return class("InstagramActivityCommand", pm.SimpleCommand)
