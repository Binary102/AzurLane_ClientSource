class("ModShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().shipIds or {}
	slot7 = Clone(getProxy(BayProxy).getShipById(slot5, slot1.getBody().shipId))

	if not getProxy(BayProxy).getShipById(slot5, slot1.getBody().shipId) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_error_noShip", slot3))

		return
	end

	if table.getCount(slot4) == 0 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_materal_no_enough"))

		return
	end

	slot8 = {}

	for slot12, slot13 in ipairs(slot4) do
		if not slot5:getShipById(slot13) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("ship_error_noShip", slot13))

			return
		end

		table.insert(slot8, slot14)
	end

	pg.ConnectionMgr.GetInstance():Send(12017, {
		ship_id = slot3,
		material_id_list = slot4
	}, 12018, function (slot0)
		if slot0.result == 0 then
			slot1 = {}
			slot2 = getProxy(EquipmentProxy)

			for slot6, slot7 in ipairs(slot0) do
				for slot11, slot12 in ipairs(slot7.equipments) do
					if slot12 then
						if slot12:hasSkin() then
							slot2:addEquipmentSkin(slot12.skinId, 1)
							pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_skin_unload"))
						end

						slot2:addEquipmentById(slot12.id, 1, true)

						if not slot1[slot12.id] then
							slot1[slot12.id] = Equipment.New({
								count = 1,
								id = slot12.id
							})
						else
							slot1[slot12.id].count = slot1[slot12.id].count + 1
						end
					end
				end

				slot1:removeShip(slot7)
			end

			for slot7, slot8 in pairs(slot3) do
				slot2:addModAttrExp(slot7, slot8)
			end

			slot1:updateShip(slot2)
			slot3:sendNotification(GAME.MOD_SHIP_DONE, {
				oldShip = slot4,
				newShip = slot2,
				equipments = slot1
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_modShip_error", slot0.result))
		end
	end)
end

return class("ModShipCommand", pm.SimpleCommand)
