class("ChangePlayerIcon", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().skinPage

	if getProxy(PlayerProxy).getData(slot5).character == slot1.getBody().characterId then
		if slot4 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("change_skin_secretary_ship"))
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11011, {
		character = slot3
	}, 11012, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)
			slot2 = slot1:getShipById(slot0)
			slot1.character = slot0
			slot1.icon = slot2.configId
			slot1.skinId = slot2.skinId

			slot2:updatePlayer(slot1)

			if slot2.updatePlayer then
				pg.TipsMgr.GetInstance():ShowTips(i18n("change_skin_secretary_ship"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("player_changePlayerIcon_ok"))
			end

			slot4:sendNotification(GAME.CHANGE_PLAYER_ICON_DONE, {
				ship = slot2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("player_changePlayerIcon", slot0.result))
		end
	end)
end

return class("ChangePlayerIcon", pm.SimpleCommand)
