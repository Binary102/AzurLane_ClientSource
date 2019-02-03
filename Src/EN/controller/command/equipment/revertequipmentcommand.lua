class("RevertEquipmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(14010, {
		equip_id = slot1:getBody().id
	}, 14011, function (slot0)
		if slot0.result == 0 then
			slot1 = Equipment.New({
				id = slot0
			})
			slot2 = getProxy(EquipmentProxy)

			slot2:removeEquipmentById(slot0, 1)
			slot2:addEquipmentById(slot1:getRootEquipment().id, 1)
			getProxy(BagProxy).removeItemById(slot4, Item.REVERT_EQUIPMENT_ID, 1)

			slot6 = {}
			slot7 = pairs
			slot8 = slot1:getRevertAwards() or {}

			for slot10, slot11 in slot7(slot8) do
				slot1:sendNotification(GAME.ADD_ITEM, Item.New(slot11))
				table.insert(slot6, slot11)
			end

			slot1:sendNotification(GAME.REVERT_EQUIPMENT_DONE, {
				awards = slot6
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("equipment_destroyEquipments", slot0.result))
		end
	end)
end

return class("RevertEquipmentCommand", pm.SimpleCommand)
