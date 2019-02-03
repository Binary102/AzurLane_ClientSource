class("EquipFromShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.equipmentId
	slot5 = slot2.pos
	slot6 = slot2.oldShipId
	slot7 = slot2.oldPos

	if getProxy(BayProxy):getShipById(slot2.shipId) == nil then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_error_noShip", slot4))

		return
	end

	if slot9:getEquip(slot5) and getProxy(PlayerProxy):getData().equip_bag_max <= getProxy(EquipmentProxy):getCapacity() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)

		return
	end

	if slot8:getShipById(slot6) == nil then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_error_noShip", slot6))

		return
	end

	if not slot10:getEquip(slot7) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_equipToShip_error_noEquip"))

		return
	end

	slot12, slot13 = slot9:canEquipAtPos(slot11, slot5)

	if not slot12 then
		pg.TipsMgr:GetInstance():ShowTips(slot13)

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("ship_equip_exchange_tip", slot10:getName(), slot11.config.name, slot9:getName()),
		onYes = function ()
			function slot0(slot0, slot1, slot2, slot3)
				pg.ConnectionMgr.GetInstance():Send(12006, {
					equip_id = slot1,
					ship_id = slot2,
					pos = slot3
				}, 12007, function (slot0)
					if slot0.result == 0 then
						slot2 = Equipment.New({
							id = slot2.id
						})
						slot3 = getProxy(EquipmentProxy)
						slot4 = pg.equip_skin_template

						if slot0:getEquip(slot0.getEquip) then
							if slot1:hasSkin() then
								if _.any(slot4[slot1.skinId].equip_type, function (slot0)
									return slot0.config.type == slot0
								end) then
									slot2.skinId = slot1.skinId
								else
									slot3:addEquipmentSkin(slot1.skinId, 1)
									pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_skin_unmatch_equipment"))
								end
							end

							slot3:addEquipmentById(slot1.id, 1, true)
						end

						slot0:updateEquip(slot1, slot2)
						slot3:updateShip(slot0)
						slot3:removeEquipmentById(slot4, 1)
						slot3.removeEquipmentById:sendNotification(GAME.EQUIP_TO_SHIP_DONE, slot0)
						pg.TipsMgr:GetInstance():ShowTips(i18n("ship_equipToShip_ok", pg.equip_data_statistics[slot4].name), "green")

						return
					end

					pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_equipToShip", slot0.result))
				end)
			end

			pg.ConnectionMgr.GetInstance():Send(12006, {
				equip_id = 0,
				ship_id = slot3,
				pos = slot4
			}, 12007, function (slot0)
				if slot0.result == 0 then
					if slot0:getEquip(getProxy(EquipmentProxy)) and slot2:hasSkin() then
						slot1:addEquipmentSkin(slot2.skinId, 1)
						pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_skin_unload"))
					end

					slot0:updateEquip(slot1, nil)
					slot2:updateShip(slot0)
					slot1:addEquipmentById(slot1.addEquipmentById, 1, true)
					slot1(slot1.addEquipmentById, slot1, 1, true)
				else
					pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_unequipFromShip", slot0.result))
				end
			end)
		end
	})
end

return class("EquipFromShipCommand", pm.SimpleCommand)
