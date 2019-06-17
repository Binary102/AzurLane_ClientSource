class("GetCommanderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback
	slot5 = getProxy(CommanderProxy)
	slot6 = slot5:getBoxById(slot3)

	if getProxy(PlayerProxy):getData().commanderBagMax <= slot5:getCommanderCnt() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("commander_capcity_is_max"))

		return
	end

	if slot6:getState() ~= CommanderBox.STATE_FINISHED then
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
				boxId = slot3,
				callback = GAME.COMMANDER_ON_OPEN_BOX_DONE
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_acquire_erro", slot0.result))

			if "commander_acquire_erro" then
				slot4()
			end
		end
	end)
end

return class("GetCommanderCommand", pm.SimpleCommand)
