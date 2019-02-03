class("GetCommanderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = getProxy(CommanderProxy)
	slot5 = slot4:getBoxById(slot3)

	if getProxy(PlayerProxy):getData().commanderBagMax <= slot4:getCommanderCnt() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("commander_capcity_is_max"))

		return
	end

	if slot5:getState() ~= CommanderBox.STATE_FINISHED then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25004, {
		boxid = slot3
	}, 25005, function (slot0)
		if slot0.result == 0 then
			slot1 = Commander.New(slot0.commander)

			slot0:addCommander(slot1)
			slot1:finish()
			slot1.finish:sendNotification(GAME.COMMANDER_ON_OPEN_BOX_DONE, {
				commander = slot1:clone(),
				boxId = slot1.finish
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_acquire_erro", slot0.result))
		end
	end)
end

return class("GetCommanderCommand", pm.SimpleCommand)
