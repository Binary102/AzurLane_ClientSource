class("SetComanderPrefabFleetCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().id
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		table.insert(slot5, {
			id = slot10.id,
			pos = slot9
		})
	end

	if #slot5 == 0 or _.all(slot5, function (slot0)
		return slot0.id == 0
	end) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25022, {
		id = slot3,
		commandersid = slot5
	}, 25023, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(CommanderProxy)
			slot2 = slot1:getPrefabFleetById(slot0)

			slot2:updateCommanders(slot1)
			slot1:updatePrefabFleet(slot2)
			slot2:sendNotification(GAME.SET_COMMANDER_PREFAB_DONE)
		else
			pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		end
	end)
end

return class("SetComanderPrefabFleetCommand", pm.SimpleCommand)
