class("UpGradeEquipmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.shipId
	slot4 = slot2.pos

	if not Equipment.canUpgrade(slot2.equipmentId) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_max_level"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send((slot3 and 14002) or 14004, (slot3 and {
		ship_id = slot3,
		pos = slot4
	}) or {
		equip_id = slot5
	}, (slot3 and 14003) or 14005, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(BayProxy)
			slot4 = getProxy(PlayerProxy)
			slot5, slot6 = nil
			slot7 = slot4:getData()

			slot7:consume({
				gold = (not slot0 or slot2:getShipById(slot0):getEquip(getProxy(BagProxy))) and getProxy(EquipmentProxy):getEquipmentById(slot2).config.trans_use_gold
			})
			slot4:updatePlayer(slot7)

			for slot13, slot14 in ipairs(slot9) do
				slot1:removeItemById(slot14[1], slot14[2])
			end

			slot10 = Equipment.New({
				id = slot6.config.next
			})

			if slot5 then
				if slot6:hasSkin() then
					slot10:setSkinId(slot6:getSkinId())
				end

				slot5:updateEquip(slot1, slot10)
				slot2:updateShip(slot5)
			elseif slot6 then
				slot3:removeEquipmentById(slot6.id, 1)
				slot3:addEquipmentById(slot10.id, 1, true)
			end

			slot3:sendNotification(GAME.UPGRADE_EQUIPMENTS_DONE, {
				ship = slot5,
				equip = slot6,
				newEquip = slot10
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("equipment_upgrade_erro", slot0.result))
		end
	end)
end

return class("UpGradeEquipmentCommand", pm.SimpleCommand)
