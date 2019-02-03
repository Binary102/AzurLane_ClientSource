class("ProposeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(BayProxy):getShipById(slot1:getBody().shipId) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_error_noShip", slot3))

		return
	end

	if getProxy(BagProxy).getItemById(slot6, ITEM_ID_FOR_PROPOSE).count < 1 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12032, {
		ship_id = slot3
	}, 12033, function (slot0)
		if slot0.result == 0 then
			slot0:removeItemById(ITEM_ID_FOR_PROPOSE, 1)

			slot0.removeItemById.propose = true
			slot0.removeItemById.proposeTime = pg.TimeMgr.GetInstance():GetServerTime()

			pg.TimeMgr.GetInstance().GetServerTime():updateShip(pg.TimeMgr.GetInstance().GetServerTime().updateShip)

			slot1 = getProxy(CollectionProxy)

			slot1.shipGroups[slot1.groupId].updateMarriedFlag(slot2)
			slot1.shipGroups[slot1.groupId].updateMarriedFlag:sendNotification(GAME.PROPOSE_SHIP_DONE, {
				ship = slot1
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_proposeShip", slot0.result))
		end
	end)
end

return class("ProposeCommand", pm.SimpleCommand)
