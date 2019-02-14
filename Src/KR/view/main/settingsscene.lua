slot0 = class("SettingsScene", import("..base.BaseUI"))
slot0.CLD_RED = Color.New(0.6, 0.05, 0.05, 0.5)
slot0.DEFAULT_GREY = Color.New(0.5, 0.5, 0.5, 0.5)

function slot0.getUIName(slot0)
	return "SettingsUI"
end

function slot0.init(slot0)
	slot0.bg = slot0:findTF("main")
	slot0.eventTriggers = {}
	slot0.bg = slot0:findTF("main")
	slot0.backButton = slot0:findTF("main/btnBack")
	slot0.logoutButton = slot0:findTF("nav/nav/logout")
	slot0.bbsButton = slot0:findTF("nav/nav/bbs")
	slot0.soundToggle = slot0:findTF("nav/nav/sound")
	slot0.notificationToggle = slot0:findTF("nav/nav/notification")
	slot0.exchangeToggle = slot0:findTF("nav/nav/exchange")
	slot0.interfaceToggle = slot0:findTF("nav/nav/battle_preference")
	slot0.resToggle = slot0:findTF("nav/nav/res")

	slot0:initSoundPanel(slot0:findTF("main/sound"))
	slot0:initNotificationPanel(slot0:findTF("main/notification"))
	slot0:initInterfacePreference(slot0:findTF("edit"))
	slot0:initResDownloadPanel(slot0:findTF("main/download"))
	slot0:initHelpPanel(slot0:findTF("nav/nav/helpBtn"))
end

function slot0.initResDownloadPanel(slot0, slot1)
	setActive(slot1, false)

	slot0.live2DDownloadBtn = slot0:findTF("main/download/live2d")
	slot0.live2DDownloadProgress = slot0:findTF("main/download/live2d/slider")
	slot0.live2DDownloadInfo = slot0:findTF("main/download/live2d/info")
	slot0.live2DDownloadInfo1 = slot0:findTF("main/download/live2d/tip/Text")
	slot0.live2DDownloadInfo2 = slot0:findTF("main/download/live2d/version/Text")
	slot0.live2DDownloadDot = slot0:findTF("main/download/live2d/dot")
	slot0.live2DDownloadLoading = slot0:findTF("main/download/live2d/loading")

	setSlider(slot0.live2DDownloadProgress, 0, 1, 0)
	setActive(slot0.live2DDownloadDot, false)
	setActive(slot0.live2DDownloadLoading, false)

	slot0.live2DDownloadTimer = Timer.New(function ()
		slot0:updateLive2DDownloadState()
	end, 0.5, -1)

	slot0.live2DDownloadTimer:Start()
	slot0:updateLive2DDownloadState()

	if Live2DUpdateMgr.Inst.state == DownloadState.None then
		slot2:CheckD()
	end

	onButton(slot0, slot0.live2DDownloadBtn, function ()
		if slot0.state == DownloadState.CheckFailure then
			slot0:CheckD()
		elseif slot0 == DownloadState.CheckToUpdate or slot0 == DownloadState.UpdateFailure then
			slot0:UpdateD(true)
		end
	end, SFX_PANEL)

	slot0.soundDownloadBtn = slot0:findTF("main/download/sound")
	slot0.soundDownloadProgress = slot0:findTF("main/download/sound/slider")
	slot0.soundDownloadInfo = slot0:findTF("main/download/sound/info")
	slot0.soundDownloadInfo1 = slot0:findTF("main/download/sound/tip/Text")
	slot0.soundDownloadInfo2 = slot0:findTF("main/download/sound/version/Text")
	slot0.soundDownloadDot = slot0:findTF("main/download/sound/dot")
	slot0.soundDownloadLoading = slot0:findTF("main/download/sound/loading")

	setSlider(slot0.soundDownloadProgress, 0, 1, 0)
	setActive(slot0.soundDownloadDot, false)
	setActive(slot0.soundDownloadLoading, false)
	CVUpdateMgr.Inst.CheckD(slot4)

	slot0.soundDownloadTimer = Timer.New(function ()
		slot0:updateSoundDownloadState()
	end, 0.5, -1)

	slot0.soundDownloadTimer:Start()
	slot0:updateSoundDownloadState()
	onButton(slot0, slot0.soundDownloadBtn, function ()
		if slot0.state == DownloadState.CheckFailure then
			slot0:CheckD()
		elseif slot0.state == DownloadState.CheckToUpdate or slot0.state == DownloadState.UpdateFailure then
			slot0:UpdateD(true)
		end
	end, SFX_PANEL)

	slot0.repairBtn = slot0:findTF("main/download/repair")
	slot0.repairProgress = slot0.repairBtn:Find("slider")

	setActive(slot0.repairBtn, true)
	onButton(slot0, slot0.repairBtn, function ()
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("resource_clear_all"),
			onYes = function ()
				VersionMgr.Inst:DeleteCacheFiles()
				Application.Quit()
			end
		})
	end, SFX_PANEL)
end

function slot0.initSoundPanel(slot0, slot1)
	setActive(slot1, false)

	slot0.revertBtn = slot0:findTF("main/sound/revert_button")
	slot0.bgmSlider = slot0:findTF("main/sound/sliders/BGM/Slider")

	setSlider(slot0.bgmSlider, 0, 1, pg.CriMgr.GetInstance():getBGMVolume())
	slot0:initSoundSlider(slot0.bgmSlider, function (slot0)
		pg.CriMgr.GetInstance():setBGMVolume(slot0)
	end)

	slot0.effectSlider = slot0:findTF("main/sound/sliders/SFX/Slider")

	setSlider(slot0.effectSlider, 0, 1, pg.CriMgr.GetInstance():getSEVolume())
	slot0:initSoundSlider(slot0.effectSlider, function (slot0)
		pg.CriMgr.GetInstance():setSEVolume(slot0)
	end)

	slot0.mainSlider = slot0:findTF("main/sound/sliders/CV/Slider")

	setSlider(slot0.mainSlider, 0, 1, pg.CriMgr.GetInstance():getCVVolume())
	slot0:initSoundSlider(slot0.mainSlider, function (slot0)
		pg.CriMgr.GetInstance():setCVVolume(slot0)
	end)
	onButton(slot0, slot0.revertBtn, function ()
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("sure_resume_volume"),
			onYes = function ()
				pg.CriMgr.GetInstance():setBGMVolume(DEFAULT_BGMVOLUME)
				pg.CriMgr.GetInstance():setSEVolume(DEFAULT_SEVOLUME)
				pg.CriMgr.GetInstance():setCVVolume(DEFAULT_CVVOLUME)
				setSlider(slot0.bgmSlider, 0, 1, DEFAULT_BGMVOLUME)
				setSlider(slot0.effectSlider, 0, 1, DEFAULT_SEVOLUME)
				setSlider(slot0.mainSlider, 0, 1, DEFAULT_CVVOLUME)
			end
		})
	end, SFX_UI_CLICK)
end

function slot0.initSoundSlider(slot0, slot1, slot2)
	slot3 = slot1:GetComponent("Slider")

	slot3.onValueChanged:RemoveAllListeners()
	pg.DelegateInfo.Add(slot0, slot3.onValueChanged)
	slot3.onValueChanged:AddListener(slot2)

	slot4 = (slot3.maxValue - slot3.minValue) * 0.1

	onButton(slot0, slot0:findTF("add", slot1.parent), function ()
		slot0.value = math.clamp(slot0.value + slot1, slot0.minValue, slot0.maxValue)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("sub", slot3.transform.parent), function ()
		slot0.value = math.clamp(slot0.value - slot1, slot0.minValue, slot0.maxValue)
	end, SFX_PANEL)
end

slot1 = {}
slot2 = {
	{
		title = i18n("words_show_ship_name_label")
	},
	{
		title = i18n("words_auto_battle_label"),
		name = AUTO_BATTLE_LABEL
	},
	{
		default = 1,
		title = i18n("words_rare_ship_vibrate"),
		name = RARE_SHIP_VIBRATE
	},
	{
		default = 1,
		title = i18n("words_display_ship_get_effect"),
		name = DISPLAY_SHIP_GET_EFFECT
	}
}

function slot0.initNotificationPanel(slot0, slot1)
	slot2 = slot0:findTF("scrollrect/content/common/list", slot1)
	slot3 = slot0:findTF("scrollrect/content/common/list1", slot1)
	slot4 = slot0:findTF("scrollrect/content/other", slot1)
	slot5 = slot0:findTF("toggle_tpl", slot1)

	for slot10, slot11 in ipairs(slot6) do
		slot12 = cloneTplTo(slot5, slot2)

		setText(slot0:findTF("text", slot12), slot11.title)
		onToggle(slot0, slot12, function (slot0)
			pg.PushNotificationMgr.GetInstance():setSwitch(slot0.id, slot0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
		triggerToggle(slot12, pg.PushNotificationMgr.GetInstance():isEnabled(slot11.id))
	end

	for slot10, slot11 in pairs(slot0) do
		slot0[slot11.name] = PlayerPrefs.GetInt(slot11.name, 0) > 0
		slot12 = cloneTplTo(slot5, slot3)

		setText(slot0:findTF("text", slot12), slot11.title)
		onToggle(slot0, slot12, function (slot0)
			if slot0[slot1.name] ~= slot0 then
				slot1(slot1.name, (slot0 and 1) or 0)
				PlayerPrefs.Save()

				slot0[slot1.name] = slot0
			end
		end, SFX_UI_TAG, SFX_UI_CANCEL)
		triggerToggle(slot12, slot0[slot11.name])
	end

	for slot10, slot11 in pairs(slot1) do
		setText(slot0:findTF("text", cloneTplTo(slot5, slot4)), slot11.title)

		if slot10 == 1 then
			onToggle(slot0, slot12, function (slot0)
				pg.PushNotificationMgr.GetInstance():setSwitchShipName(slot0)
			end, SFX_UI_TAG, SFX_UI_CANCEL)
			triggerToggle(slot12, pg.PushNotificationMgr.GetInstance():isEnableShipName())
		else
			slot0[slot11.name] = PlayerPrefs.GetInt(slot11.name, slot11.default or 0) > 0

			onToggle(slot0, slot12, function (slot0)
				if slot0[slot1.name] ~= slot0 then
					slot1(slot1.name, (slot0 and 1) or 0)
					PlayerPrefs.Save()

					slot0[slot1.name] = slot0
				end
			end, SFX_UI_TAG, SFX_UI_CANCEL)
			triggerToggle(slot12, slot0[slot11.name])
		end
	end
end

function slot0.initInterfacePreference(slot0, slot1)
	setActive(slot1, false)

	slot0.editPanel = slot1
	slot0.editBackBtn = findTF(slot2, "btnBack")

	onButton(slot0, slot0.editBackBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)

	slot0.normalBtns = findTF(slot3, "normal_buttons")
	slot0.editBtns = findTF(slot3, "edit_buttons")
	slot0.saveBtn = findTF(slot0.editBtns, "save_button")
	slot0.cancelBtn = findTF(slot0.editBtns, "cancel_button")
	slot0.editBtn = findTF(slot0.normalBtns, "edit_button")
	slot0.revertBtn = findTF(slot0.normalBtns, "revert_button")

	onButton(slot0, slot0.editBtn, function ()
		slot0:editModeEnabled(true)
	end, SFX_PANEL)
	onButton(slot0, slot0.revertBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("setting_interface_revert_check"),
			onYes = function ()
				slot0:revertInterfaceSetting(true)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()
		if slot0._currentDrag then
			LuaHelper.triggerEndDrag(slot0._currentDrag)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("setting_interface_cancel_check"),
			onYes = function ()
				slot0:editModeEnabled(false)
				slot0.editModeEnabled:revertInterfaceSetting(false)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.saveBtn, function ()
		if slot0._currentDrag then
			LuaHelper.triggerEndDrag(slot0._currentDrag)
		end

		slot0:editModeEnabled(false)
		slot0.editModeEnabled:saveInterfaceSetting()
		pg.TipsMgr:GetInstance():ShowTips(i18n("setting_interface_save_success"))
	end, SFX_PANEL)

	slot0.interface = slot0:findTF("edit/interface")
	slot0.stick = findTF(slot0.interface, "stick")
	slot0.skillBtn1 = findTF(slot0.interface, "skill_1")
	slot0.skillBtn2 = findTF(slot0.interface, "skill_2")
	slot0.skillBtn3 = findTF(slot0.interface, "skill_3")
	slot0.skillBtn4 = findTF(slot0.interface, "skill_4")

	slot0:initInterfaceComponent(slot0.stick, "joystick_anchorX", "joystick_anchorY", slot4)
	slot0:initInterfaceComponent(slot0.skillBtn1, "skill_1_anchorX", "skill_1_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[1])
	slot0:initInterfaceComponent(slot0.skillBtn2, "skill_2_anchorX", "skill_2_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[2])
	slot0:initInterfaceComponent(slot0.skillBtn3, "skill_3_anchorX", "skill_3_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[3])
	slot0:initInterfaceComponent(slot0.skillBtn4, "skill_4_anchorX", "skill_4_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[4])

	slot0.components = {
		findTF(slot0.interface, "top"),
		slot0.stick,
		slot0.skillBtn1,
		slot0.skillBtn2,
		slot0.skillBtn3,
		slot0.skillBtn4
	}

	slot0:editModeEnabled(false)
	slot0:initExchangeCodePanel()
end

function slot0.initInterfaceComponent(slot0, slot1, slot2, slot3, slot4)
	slot7 = rtf(slot0._tf).rect.width * 0.5 + slot0.interface.localPosition.x
	slot8 = rtf(slot0._tf).rect.height * 0.5 + rtf(slot0.interface).localPosition.y
	slot9 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot0.eventTriggers[slot9] = true
	slot10, slot11, slot12, slot13 = nil

	slot9:AddBeginDragFunc(function (slot0, slot1)
		slot0._currentDrag = slot1
		slot2 = slot1 / UnityEngine.Screen.width
		slot4 = slot5 / UnityEngine.Screen.height

		for slot5 = 2, #slot0.components, 1 do
			if slot0.components[slot5] ~=  then
				GetOrAddComponent(slot6, "EventTriggerListener").enabled = false
			end
		end

		slot7 = slot6.localPosition.x
		slot8 = slot6.localPosition.y
	end)
	slot9:AddDragFunc(function (slot0, slot1)
		slot0.localPosition = Vector3(slot1.position.x * slot1 - slot2, slot1.position.y * slot3 - slot4, 0)

		slot5:checkInterfaceIntersect()
	end)
	slot9:AddDragEndFunc(function (slot0, slot1)
		slot0._currentDrag = nil

		if slot0:checkInterfaceIntersect() then
			slot1.localPosition = Vector3(slot2, slot1, 0)
		end

		for slot6 = 2, #slot0.components, 1 do
			GetOrAddComponent(slot0.components[slot6], "EventTriggerListener").enabled = true
		end

		slot0:checkInterfaceIntersect()
	end)
	slot0:setInterfaceAnchor(slot1, slot2, slot3, slot4)
end

function slot0.initHelpPanel(slot0, slot1)
	onButton(slot0, slot1, function ()
		pg.SDKMgr:GetInstance():bugReport()
	end, SFX_CANCEL)
end

function slot0.editModeEnabled(slot0, slot1)
	setActive(slot0.normalBtns, not slot1)
	setActive(slot0.editBtns, slot1)

	for slot5, slot6 in ipairs(slot0.components) do
		setActive(findTF(slot6, "rect"), slot1)

		if slot5 > 1 then
			GetOrAddComponent(slot6, "EventTriggerListener").enabled = slot1
		end
	end

	slot0.logoutButton:GetComponent("ButtonExtend").interactable = not slot1
	slot0.bbsButton:GetComponent("ButtonExtend").interactable = not slot1
	slot0.notificationToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0.exchangeToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0.interfaceToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0._tf:GetComponent(typeof(Button)).interactable = not slot1
	slot0.editBackBtn:GetComponent(typeof(Button)).interactable = not slot1
end

function slot0.setInterfaceAnchor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6, slot7 = nil

	if slot5 then
		slot6 = slot4.x
		slot7 = slot4.y
	else
		slot6 = PlayerPrefs.GetFloat(slot2, slot4.x)
		slot7 = PlayerPrefs.GetFloat(slot3, slot4.y)
	end

	slot1.localPosition = Vector3((slot6 - 0.5) * rtf(slot0.interface).rect.width, (slot7 - 0.5) * rtf(slot0.interface).rect.height, 0)
end

function slot0.checkInterfaceIntersect(slot0)
	slot1 = {}
	slot2 = false
	slot3 = rtf(slot0.interface).rect.width * 0.5
	slot4 = rtf(slot0.interface).rect.height * 0.5

	for slot8, slot9 in ipairs(slot0.components) do
		slot10 = slot9.localPosition.x
		slot11 = slot9.localPosition.y
		slot12 = rtf(slot9).rect.width * 0.5
		slot13 = rtf(slot9).rect.height * 0.5

		for slot17, slot18 in ipairs(slot0.components) do
			if slot9 ~= slot18 then
				slot19 = slot18.localPosition.x
				slot21 = rtf(slot18).rect.width * 0.5

				if math.abs(slot11 - slot18.localPosition.y) < rtf(slot18).rect.height * 0.5 + slot13 and math.abs(slot10 - slot19) < slot21 + slot12 then
					slot1[slot18] = true
				end
			end
		end

		if slot8 > 1 and (slot3 < slot10 + slot12 or slot10 - slot12 < slot3 * -1 or slot4 < slot11 + slot13 or slot11 - slot13 < slot4 * -1) then
			slot1[slot9] = true
		end
	end

	for slot8, slot9 in ipairs(slot0.components) do
		slot10 = findTF(slot9, "rect"):GetComponent(typeof(Image))

		if slot1[slot9] then
			slot10.color = slot0.CLD_RED
			slot2 = true
		else
			slot10.color = slot0.DEFAULT_GREY
		end
	end

	return slot2
end

function slot0.revertInterfaceSetting(slot0, slot1)
	slot0:setInterfaceAnchor(slot0.stick, "joystick_anchorX", "joystick_anchorY", slot2, slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn1, "skill_1_anchorX", "skill_1_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[1], slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn2, "skill_2_anchorX", "skill_2_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[2], slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn3, "skill_3_anchorX", "skill_3_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[3], slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn4, "skill_4_anchorX", "skill_4_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[4], slot1)
	slot0:saveInterfaceSetting()
end

function slot0.saveInterfaceSetting(slot0)
	slot0:overrideInterfaceSetting(slot0.stick, "joystick_anchorX", "joystick_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn1, "skill_1_anchorX", "skill_1_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn2, "skill_2_anchorX", "skill_2_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn3, "skill_3_anchorX", "skill_3_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn4, "skill_4_anchorX", "skill_4_anchorY")
end

function slot0.overrideInterfaceSetting(slot0, slot1, slot2, slot3)
	PlayerPrefs.SetFloat(slot2, slot6)
	PlayerPrefs.SetFloat(slot3, (slot1.localPosition.y + rtf(slot0.interface).rect.height * 0.5) / rtf(slot0.interface).rect.height)
end

function slot0.onSwitchToggle(slot0, slot1, slot2)
	slot3 = rtf(findTF(slot1, "switch"))

	onToggle(slot0, slot1, function (slot0)
		if slot0 then
			slot0.anchoredPosition = Vector2.New(21, 0)
		else
			slot0.anchoredPosition = Vector2.New(-21, 0)
		end

		slot1(slot0)
	end, SFX_PANEL)
end

function slot0.updateSoundDownloadState(slot0)
	slot3, slot4, slot5, slot6, slot7 = nil
	slot8 = false

	if CVUpdateMgr.Inst.state == DownloadState.None then
		slot3 = i18n("word_soundfiles_download_title")
		slot4 = i18n("word_soundfiles_download")
		slot5 = "DOWNLOAD"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Checking then
		slot3 = i18n("word_soundfiles_checking_title")
		slot4 = i18n("word_soundfiles_checking")
		slot5 = "CHECKING"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.CheckToUpdate then
		slot3 = i18n("word_soundfiles_checkend_title")
		slot4 = i18n("word_soundfiles_checkend")
		slot5 = string.format("V%d-->V%d", slot1.localVersion.Build, slot1.serverVersion.Build)
		slot6 = 0
		slot7 = true
	elseif slot2 == DownloadState.CheckOver then
		slot3 = i18n("word_soundfiles_checkend_title")
		slot4 = i18n("word_soundfiles_noneedupdate")
		slot5 = "V" .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.CheckFailure then
		slot3 = i18n("word_soundfiles_checkfailed")
		slot4 = i18n("word_soundfiles_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Updating then
		slot3 = i18n("word_soundfiles_update")
		slot4 = string.format("(%d/%d)", slot1.downloadCount, slot1.downloadTotal)
		slot5 = slot1.downPath
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = false
		slot8 = true
	elseif slot2 == DownloadState.UpdateSuccess then
		slot3 = i18n("word_soundfiles_update_end_title")
		slot4 = i18n("word_soundfiles_update_end")
		slot5 = "V" .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.UpdateFailure then
		slot3 = i18n("word_soundfiles_update_failed")
		slot4 = i18n("word_soundfiles_update_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = true
	end

	setText(slot0.soundDownloadInfo, slot3)
	setText(slot0.soundDownloadInfo1, slot4)
	setText(slot0.soundDownloadInfo2, slot5)
	setSlider(slot0.soundDownloadProgress, 0, 1, slot6)
	setActive(slot0.soundDownloadDot, slot7)
	setActive(slot0.soundDownloadLoading, slot8)
end

function slot0.updateLive2DDownloadState(slot0)
	slot3, slot4, slot5, slot6, slot7 = nil
	slot8 = false

	if Live2DUpdateMgr.Inst.state == DownloadState.None then
		slot3 = i18n("word_live2dfiles_download_title")
		slot4 = i18n("word_live2dfiles_download")
		slot5 = "DOWNLOAD"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Checking then
		slot3 = i18n("word_live2dfiles_checking_title")
		slot4 = i18n("word_live2dfiles_checking")
		slot5 = "CHECKING"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.CheckToUpdate then
		if slot1.serverVersion.Build <= slot1.localVersion.Build then
			slot1.state = DownloadState.CheckOver

			slot0:updateLive2DDownloadState()

			return
		end

		slot3 = i18n("word_live2dfiles_checkend_title")
		slot4 = i18n("word_live2dfiles_checkend")
		slot5 = string.format("V%d-->V%d", slot1.localVersion.Build, slot1.serverVersion.Build)
		slot6 = 0
		slot7 = true
	elseif slot2 == DownloadState.CheckOver then
		slot3 = i18n("word_live2dfiles_checkend_title")
		slot4 = i18n("word_live2dfiles_noneedupdate")
		slot5 = "V" .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.CheckFailure then
		slot3 = i18n("word_live2dfiles_checkfailed")
		slot4 = i18n("word_live2dfiles_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Updating then
		slot3 = i18n("word_live2dfiles_update")
		slot4 = string.format("(%d/%d)", slot1.downloadCount, slot1.downloadTotal)
		slot5 = slot1.downPath
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = false
		slot8 = true
	elseif slot2 == DownloadState.UpdateSuccess then
		slot3 = i18n("word_live2dfiles_update_end_title")
		slot4 = i18n("word_live2dfiles_update_end")
		slot5 = "V" .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.UpdateFailure then
		slot3 = i18n("word_live2dfiles_update_failed")
		slot4 = i18n("word_live2dfiles_update_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = true
	end

	setText(slot0.live2DDownloadInfo, slot3)
	setText(slot0.live2DDownloadInfo1, slot4)
	setText(slot0.live2DDownloadInfo2, slot5)
	setSlider(slot0.live2DDownloadProgress, 0, 1, slot6)
	setActive(slot0.live2DDownloadDot, slot7)
	setActive(slot0.live2DDownloadLoading, slot8)
end

function slot0.initExchangeCodePanel(slot0)
	setActive(slot0:findTF("nav/nav/exchange"), pg.SDKMgr:GetInstance():GetSdkServerID() ~= AUDIT_SERVER_ID)

	slot0.codeInput = slot0:findTF("main/exchange/code_input")
	slot0.placeholder = slot0:findTF("Placeholder", slot0.codeInput)
	slot0.placeholder:GetComponent(typeof(Text)).text = i18n("exchangecode_use_placeholder")
	slot0.achieveBtn = slot0:findTF("main/exchange/achieve_button")

	setText(slot0:findTF("main/exchange/text"), i18n("exchangecode_title"))
	onButton(slot0, slot0.achieveBtn, function ()
		pg.m02:sendNotification(GAME.EXCHANGECODE_USE, {
			key = slot0.codeInput:GetComponent(typeof(InputField)).text
		})
	end, SFX_CONFIRM)
	setGray(slot0.achieveBtn, getInputText(slot0.codeInput) == "")
	onInputChanged(slot0, slot0.codeInput, function ()
		slot0(slot0.achieveBtn, getInputText(slot0.codeInput) == "")
	end)
end

function slot0.clearExchangeCode(slot0)
	slot0.codeInput:GetComponent(typeof(InputField)).text = ""
end

function slot0.didEnter(slot0)
	onBackButton(slot0, slot0.backButton, function ()
		return true, 
	end)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.logoutButton, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("main_settingsScene_quest_exist"),
			onYes = function ()
				slot0:emit(SettingsMediator.ON_LOGOUT)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.bbsButton, function ()
		Application.OpenURL(HOME_PAGE)
	end, SFX_PANEL)

	function slot1(slot0, slot1, slot2)
		if slot0 then
			slot0.bg.sizeDelta = Vector2.New((slot1 == nil and slot0.bg.sizeDelta.x) or slot1, (slot2 == nil and slot0.bg.sizeDelta.y) or slot2)
		end
	end

	onToggle(slot0, slot0.soundToggle, function (slot0)
		slot0(slot0, nil, 420)
	end, SFX_PANEL)
	onToggle(slot0, slot0.notificationToggle, function (slot0)
		slot0(slot0, nil, 455)
	end, SFX_PANEL)
	onToggle(slot0, slot0.exchangeToggle, function (slot0)
		slot0(slot0, nil, 390)
	end, SFX_PANEL)
	onToggle(slot0, slot0.interfaceToggle, function (slot0)
		slot0(slot0, nil, 390)
	end, SFX_PANEL)
	onToggle(slot0, slot0.resToggle, function (slot0)
		slot0(slot0, 672, 400)
	end, SFX_PANEL)
	triggerToggle(slot0.soundToggle, true)

	slot0._cvTest = slot0:findTF("cvTest")
	slot0._hpBtn = slot0:findTF("dungeon_hp")

	if SFX_TEST then
		setActive(slot0._cvTest, true)

		slot0._cvPanel = slot0:findTF("CVTestPanel")
		slot0._cvPanelBack = slot0:findTF("back", slot0._cvPanel)
		slot0._cvPlay = slot0:findTF("characterPlay", slot0._cvPanel)
		slot0._cvID = slot0:findTF("characterID", slot0._cvPanel)
		slot0._cvLabel = slot0:findTF("voiceLabel", slot0._cvPanel)
		slot0._cvPre = slot0:findTF("preVoice", slot0._cvPanel)
		slot0._cvPost = slot0:findTF("postVoice", slot0._cvPanel)
		slot0._cvChat = slot0:findTF("chat", slot0._cvPanel)
		slot0._cvNameList = {
			{
				"get",
				"unlock",
				1
			},
			{
				"login",
				"login",
				1
			},
			{
				"detail",
				"detail",
				1
			},
			{
				"main_1",
				"main",
				1
			},
			{
				"main_2",
				"main",
				2
			},
			{
				"main_3",
				"main",
				3
			},
			{
				"touch_1",
				"touch",
				1
			},
			{
				"touch_2",
				"touch2",
				1
			},
			{
				"task",
				"mission",
				1
			},
			{
				"headtouch",
				"touch_head",
				1
			},
			{
				"warcry",
				"battle",
				1
			},
			{
				"mvp",
				"win_mvp",
				1
			},
			{
				"lose",
				"lose",
				1
			},
			{
				"skill",
				"skill",
				1
			},
			{
				"mail",
				"mail"
			},
			{
				"home",
				"home"
			},
			{
				"mission_complete",
				"mission_complete"
			},
			{
				"profile",
				"profile"
			},
			{
				"feeling1",
				"feeling1"
			},
			{
				"feeling2",
				"feeling2"
			},
			{
				"feeling3",
				"feeling3"
			},
			{
				"feeling4",
				"feeling4"
			},
			{
				"feeling5",
				"feeling5"
			},
			{
				"expedition",
				"expedition"
			},
			{
				"profile",
				"profile"
			},
			{
				"propose",
				"propose"
			},
			{
				"upgrade",
				"upgrade"
			}
		}

		onButton(slot0, slot0._cvTest, function ()
			setActive(slot0._cvPanel, true)

			setActive._cvList = {}
			setActive._cvIndex = 1
		end)

		function slot2()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			slot0 = tonumber(slot0._cvID:GetComponent(typeof(InputField)).text)
			slot0._cvLabel:GetComponent(typeof(Text)).text = slot0._cvNameList[slot0._cvIndex][1]

			if slot0._cvNameList[slot0._cvIndex][1] == "skill" then
				slot0._cvChat:GetComponent(typeof(Text)).text = ""
				slot0._currentVoice = playSoundEffect(Ship.getCVPath(slot0, slot1[1]))
			else
				slot0._cvChat:GetComponent(typeof(Text)).text, slot6 = Ship.getWords(slot0, slot1[2], slot1[3])
				slot0._currentVoice = playSoundEffect(slot3)
			end
		end

		onButton(slot0, slot0._cvPlay, function ()
			function slot2()
				pg.CriMgr:LoadBattleCV(pg.CriMgr.LoadBattleCV, function ()
					slot0._cvList[slot1] = true

					true()
				end)
			end

			if slot0._cvList[Ship.getCVKeyID(slot0)] then
				slot1()
			else
				pg.CriMgr:LoadCV(slot1, slot2)
			end
		end)
		onButton(slot0, slot0._cvPanelBack, function ()
			setActive(slot0._cvPanel, false)
			setActive:clearCV()
		end)
		onButton(slot0, slot0._cvPre, function ()
			slot0._cvIndex = slot0._cvIndex - 1

			if slot0._cvIndex <= 0 then
				slot0._cvIndex = #slot0._cvNameList
			end

			slot1()
		end)
		onButton(slot0, slot0._cvPost, function ()
			slot0._cvIndex = slot0._cvIndex + 1

			if slot0._cvIndex > #slot0._cvNameList then
				slot0._cvIndex = 1
			end

			slot1()
		end)
		onButton(slot0, slot0:findTF("CVTestPanel/play"), function ()
			pg.StoryMgr.GetInstance():Play(slot0:findTF("CVTestPanel/playid"):GetComponent(typeof(InputField)).text, nil, true)
		end)
		setActive(slot0._hpBtn, true)

		slot0._dungeonHPPanel = slot0:findTF("dungeonHPPanel")
		slot0._dungeonID = slot0:findTF("dungeonHPPanel/dungeonID")
		slot0._dungeonLV = slot0:findTF("dungeonHPPanel/dungeonLV")
		slot0._dungeonHP = slot0:findTF("dungeonHPPanel/DMG")

		onButton(slot0, slot0._hpBtn, function ()
			setActive(slot0._dungeonHPPanel, true)
		end)
		onButton(slot0, slot0:findTF("dungeonHPPanel/calcBtn"), function ()
			slot1 = tonumber(slot0._dungeonLV:GetComponent(typeof(InputField)).text)
			slot2 = 0
			slot3 = {}

			for slot8, slot9 in ipairs(ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot0).stages) do
				for slot13, slot14 in ipairs(slot9.waves) do
					if slot14.triggerType == ys.Battle.BattleConst.WaveTriggerType.NORMAL then
						for slot18, slot19 in ipairs(slot14.spawn) do
							slot3[#slot3 + 1] = slot19.monsterTemplateID
						end

						if slot14.reinforcement then
							for slot18, slot19 in ipairs(slot14.reinforcement) do
								slot3[#slot3 + 1] = slot19.monsterTemplateID
							end
						end
					end
				end
			end

			for slot8, slot9 in ipairs(slot3) do
				slot2 = slot2 + ys.Battle.BattleDataFunction.GetMonsterTmpDataFromID(slot9).durability + ys.Battle.BattleDataFunction.GetMonsterTmpDataFromID(slot9).durability_growth * (slot1 - 1) / 1000
			end

			setText(slot0._dungeonHP, slot2)
		end)

		return
	end

	setActive(slot0._cvTest, false)
	setActive(slot0._hpBtn, false)
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")) then
		triggerButton(slot1.transform:Find("dialog/title/back"))

		return
	end

	triggerButton(slot0._tf)
end

function slot0.clearCV(slot0)
	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0._cvList then
		for slot4, slot5 in pairs(slot0._cvList) do
			pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(slot4))
			pg.CriMgr.UnloadCVBank(pg.CriMgr.GetBattleCVBankName(slot4))
		end
	end

	slot0._cvList = nil
end

function slot0.willExit(slot0)
	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	slot0:clearCV()
	slot0.soundDownloadTimer:Stop()

	slot0.soundDownloadTimer = nil

	slot0.live2DDownloadTimer:Stop()

	slot0.live2DDownloadTimer = nil
end

return slot0
