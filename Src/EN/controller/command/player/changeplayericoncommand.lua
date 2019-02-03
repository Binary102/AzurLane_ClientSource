class("ChangePlayerIcon", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(PlayerProxy).getData(slot4)

	pg.ConnectionMgr.GetInstance():Send(11011, {
		character = slot1:getBody().characterId
	}, 11012, function (slot0)
		if slot0.result == 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("player_changePlayerIcon_ok"))

			slot1 = getProxy(BayProxy)
			slot2 = slot1:getShipById(slot0)
			slot1.character = slot0
			slot1.icon = slot2.configId
			slot1.skinId = slot2.skinId

			slot2:updatePlayer(slot1)
			slot2.updatePlayer:sendNotification(GAME.CHANGE_PLAYER_ICON_DONE, {
				ship = slot2
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("player_changePlayerIcon", slot0.result))
		end
	end)
end

return class("ChangePlayerIcon", pm.SimpleCommand)
