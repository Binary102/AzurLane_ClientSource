class("SetCommanderPrefabFleetNameCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if getProxy(CommanderProxy):getPrefabFleetById(slot3):getName() == slot1:getBody().name then
		return
	end

	slot6, slot7 = slot5:canRename()

	if not slot6 then
		pg.TipsMgr:GetInstance():ShowTips(slot7)

		return
	end

	if not nameValidityCheck(slot4, 0, 12, {
		"spece_illegal_tip",
		"login_newPlayerScene_name_tooShort",
		"login_newPlayerScene_name_tooLong",
		"playerinfo_mask_word"
	}) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25024, {
		id = slot3,
		name = slot4
	}, 25025, function (slot0)
		if slot0.result == 0 then
			print(slot0)
			getProxy(CommanderProxy):updatePrefabFleetName(getProxy(CommanderProxy).updatePrefabFleetName, slot0)
			getProxy(CommanderProxy):sendNotification(GAME.SET_COMMANDER_PREFAB_NAME_DONE)
			pg.TipsMgr:GetInstance():ShowTips(i18n1("改名成功"))
		else
			pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[slot0.result])
		end
	end)
end

return class("SetCommanderPrefabFleetNameCommand", pm.SimpleCommand)
