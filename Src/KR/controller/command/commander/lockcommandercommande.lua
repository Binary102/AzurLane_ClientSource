class("LockCommanderCommande", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().flag

	if not getProxy(CommanderProxy):getCommanderById(slot1.getBody().commanderId) or slot6:getLock() == slot4 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25016, {
		commanderid = slot3,
		flag = slot4
	}, 25017, function (slot0)
		if slot0.result == 0 then
			slot0:setLock(slot0.setLock)
			slot0:updateCommander(slot0)
			slot3:sendNotification(GAME.COMMANDER_LOCK_DONE, {
				commander = slot0,
				flag = slot3.sendNotification
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_lock_erro", slot0.result))
		end
	end)
end

return class("LockCommanderCommande", pm.SimpleCommand)
