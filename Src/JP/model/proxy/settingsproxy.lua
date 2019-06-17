slot0 = class("SettingsProxy", pm.Proxy)

function slot0.onRegister(slot0)
	slot0._ShowBg = PlayerPrefs.GetInt("disableBG", 1) > 0
	slot0._ShowLive2d = PlayerPrefs.GetInt("disableLive2d", 1) > 0
	slot0._selectedShipId = PlayerPrefs.GetInt("playerShipId")
	slot0._backyardFoodRemind = PlayerPrefs.GetString("backyardRemind")
	slot0._userAgreement = PlayerPrefs.GetInt("userAgreement", 0) > 0
	slot0._showMaxLevelHelp = PlayerPrefs.GetInt("maxLevelHelp", 0) > 0
	slot0.nextTipAoutBattleTime = PlayerPrefs.GetInt("AutoBattleTip", 0)

	slot0:resetEquipSceneIndex()

	slot0._everyplayInited = false
end

function slot0.SetLive2dEnable(slot0, slot1)
	if slot0._ShowLive2d ~= slot1 then
		slot0._ShowLive2d = slot1

		PlayerPrefs.SetInt("disableLive2d", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.SetBGEnable(slot0, slot1)
	if slot0._ShowBg ~= slot1 then
		slot0._ShowBg = slot1

		PlayerPrefs.SetInt("disableBG", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.getUserAgreement(slot0)
	return slot0._userAgreement
end

function slot0.setUserAgreement(slot0)
	if not slot0._userAgreement then
		PlayerPrefs.SetInt("userAgreement", 1)
		PlayerPrefs.Save()

		slot0._userAgreement = true
	end
end

function slot0.deleteUserAreement(slot0)
	if slot0._userAgreement then
		PlayerPrefs.DeleteKey("userAgreement")
		PlayerPrefs.Save()

		slot0._userAgreement = nil
	end
end

function slot0.IsLive2dEnable(slot0)
	return slot0._ShowLive2d
end

function slot0.IsBGEnable(slot0)
	return slot0._ShowBg
end

function slot0.SetSelectedShipId(slot0, slot1)
	if slot0._selectedShipId ~= slot1 then
		slot0._selectedShipId = slot1

		PlayerPrefs.SetInt("playerShipId", slot1)
		PlayerPrefs.Save()
	end
end

function slot0.GetSelectedShipId(slot0)
	return slot0._selectedShipId
end

function slot0.setEquipSceneIndex(slot0, slot1)
	slot0._equipSceneIndex = slot1
end

function slot0.getEquipSceneIndex(slot0)
	return slot0._equipSceneIndex
end

function slot0.resetEquipSceneIndex(slot0)
	slot0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

function slot0.setActivityLayerIndex(slot0, slot1)
	slot0._activityLayerIndex = slot1
end

function slot0.getActivityLayerIndex(slot0)
	return slot0._activityLayerIndex
end

function slot0.resetActivityLayerIndex(slot0)
	slot0._activityLayerIndex = 1
end

function slot0.setBackyardRemind(slot0)
	if slot0._backyardFoodRemind ~= tostring(GetZeroTime()) then
		PlayerPrefs.SetString("backyardRemind", slot1)
		PlayerPrefs.Save()

		slot0._backyardFoodRemind = slot1
	end
end

function slot0.getBackyardRemind(slot0)
	if not slot0._backyardFoodRemind or slot0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(slot0._backyardFoodRemind)
	end
end

function slot0.getMaxLevelHelp(slot0)
	return slot0._showMaxLevelHelp
end

function slot0.setMaxLevelHelp(slot0, slot1)
	if slot0._showMaxLevelHelp ~= slot1 then
		slot0._showMaxLevelHelp = slot1

		PlayerPrefs.SetInt("maxLevelHelp", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

function slot0.setStopBuildSpeedupRemind(slot0)
	slot0.isStopBuildSpeedupReamind = true
end

function slot0.getStopBuildSpeedupRemind(slot0)
	return slot0.isStopBuildSpeedupReamind
end

function slot0.checkReadHelp(slot0, slot1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if slot1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr:GetInstance():isEnd() then
		slot4 = PlayerPrefs.GetInt(slot1, 0)

		return PlayerPrefs.GetInt(slot1, 0) > 0
	end

	return true
end

function slot0.recordReadHelp(slot0, slot1)
	PlayerPrefs.SetInt(slot1, 1)
	PlayerPrefs.Save()
end

function slot0.clearAllReadHelp(slot0)
	PlayerPrefs.DeleteKey("tactics_lesson_system_introduce")
	PlayerPrefs.DeleteKey("help_shipinfo_equip")
	PlayerPrefs.DeleteKey("help_shipinfo_detail")
	PlayerPrefs.DeleteKey("help_shipinfo_intensify")
	PlayerPrefs.DeleteKey("help_shipinfo_upgrate")
	PlayerPrefs.DeleteKey("help_backyard")
	PlayerPrefs.DeleteKey("has_entered_class")
	PlayerPrefs.DeleteKey("help_commander_info")
	PlayerPrefs.DeleteKey("help_commander_play")
	PlayerPrefs.DeleteKey("help_commander_ability")
end

function slot0.setAoutBattleTip(slot0)
	slot0.nextTipAoutBattleTime = GetZeroTime()

	PlayerPrefs.SetInt("AutoBattleTip", GetZeroTime())
	PlayerPrefs.Save()
end

function slot0.isTipAutoBattle(slot0)
	return slot0.nextTipAoutBattleTime < pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.initEveryPlay(slot0)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not slot0._everyplayInited then
		print("Init Everyplay")
		Everyplay.Initialize()

		slot0._everyplayInited = true
	else
		print("Everyplay had inited")
	end
end

return slot0
