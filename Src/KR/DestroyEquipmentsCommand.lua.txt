class("DestroyEquipmentsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = {}
	slot4 = getProxy(EquipmentProxy)

	for slot8, slot9 in ipairs(slot1:getBody().equipments) do
		slot11 = slot9[2]

		if not slot4:getEquipmentById(slot9[1]) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_destroyEquipments_error_noEquip"))

			return
		end

		if slot12.count < slot11 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_destroyEquipments_error_notEnoughEquip"))

			return
		end

		table.insert(slot3, {
			id = slot10,
			count = slot11
		})
	end

	pg.ConnectionMgr.GetInstance():Send(14008, {
		equip_list = slot3
	}, 14009, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(PlayerProxy).getData(slot1)
			slot3 = {}
			slot4 = 0

			for slot8, slot9 in ipairs(slot0) do
				slot12 = slot1:getEquipmentById(slot10)

				slot1:removeEquipmentById(slot9.id, slot9.count)

				if pg.equip_data_template[slot9.id] then
					slot14 = slot13.destory_item or {}
					slot4 = slot4 + (slot13.destory_gold or 0) * slot11

					for slot19, slot20 in ipairs(slot14) do
						slot21 = false

						for slot25, slot26 in ipairs(slot3) do
							if slot20[1] == slot3[slot25].id then
								slot3[slot25].count = slot3[slot25].count + slot20[2] * slot11
								slot21 = true

								break
							end
						end

						if not slot21 then
							table.insert(slot3, Item.New({
								type = DROP_TYPE_ITEM,
								id = slot20[1],
								count = slot20[2] * slot11
							}))
						end
					end
				end
			end

			table.insert(slot3, Item.New({
				id = 1,
				type = DROP_TYPE_RESOURCE,
				count = slot4
			}))

			for slot8, slot9 in ipairs(slot3) do
				slot2:sendNotification(GAME.ADD_ITEM, slot9)
			end

			slot2:sendNotification(GAME.DESTROY_EQUIPMENTS_DONE, slot3)
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("equipment_destroyEquipments", slot0.result))
		end
	end)
end

return class("DestroyEquipmentsCommand", pm.SimpleCommand)
