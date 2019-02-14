slot0 = class("NewPlayerScene", import("..base.BaseUI"))
slot1 = 0.5
slot2 = -300
slot3 = Vector3(-380, 265, 0)
slot4 = 19
slot5 = {
	101171,
	201211,
	301051
}
slot6 = {
	[101171] = i18n("login_newPlayerScene_word_laFei"),
	[201211] = i18n("login_newPlayerScene_word_biaoqiang"),
	[301051] = i18n("login_newPlayerScene_word_lingBo")
}

function slot0.getUIName(slot0)
	return "NewPlayerUI"
end

function slot0.getBGM(slot0)
	return "main"
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0.characters = slot0:findTF("select_character/characters")
	slot0.propPanel = slot0:findTF("prop_panel")

	setActive(slot0.propPanel, false)

	slot0.confirmBtn = slot0:findTF("qr_btn", slot0.propPanel)
	slot0.cancelBtn = slot0:findTF("cancel_btn", slot0.propPanel)
	slot0.tip = slot0:findTF("select_character/tip")
	slot0.skillTpl = slot0:getTpl("bg/skill_panel/frame/skills/skilltpl", slot0.propPanel)
	slot0.skillContainer = slot0:findTF("bg/skill_panel/frame/skills", slot0.propPanel)
	slot0.namedPanel = slot0:findTF("named_panel")

	setActive(slot0.namedPanel, false)

	slot0.info = slot0.namedPanel:Find("info")
	slot0.nickname = slot0.info:Find("nickname")
	slot0.qChar = slot0.info:Find("q_char")
	slot0.chat = slot0:findTF("info/tip/chatbgtop0/Text", slot0.namedPanel)
	slot0.propertyPanel = PropertyPanel.New(slot0.propPanel:Find("bg/property_panel/frame"))
end

function slot0.onBackPressed(slot0)
	if LeanTween.isTweening(go(slot0.propPanel)) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.namedPanel) then
		slot0:closeNamedPanel()

		return
	end

	if slot0.inProp then
		triggerButton(slot0.cancelBtn)

		return
	end

	pg.SDKMgr:GetInstance():onBackPressed()
end

function slot0.initCharacters(slot0)
	slot0.charInitPos = {}

	for slot4 = 1, 3, 1 do
		slot5 = slot0:findTF("character_" .. slot4, slot0.characters)
		slot7 = slot5:Find("name_bg")

		setActive(slot8, false)

		slot9 = GetOrAddComponent(slot6, "EventTriggerListener")
		slot0.eventTriggers[slot9] = true

		slot9:AddPointDownFunc(function ()
			slot0.selectedCharacter = slot1

			setActive(slot2, true)
		end)
		slot9:AddPointUpFunc(function ()
			slot0.selectedCharacter = nil

			setActive(nil, false)
		end)
		onButton(slot0, slot5:Find("fitter/char"), function ()
			if slot0.inProp then
				return
			end

			slot0:selectCharacterByIdx(slot0, slot2[])
		end)
	end

	LeanTween.value(slot0._go, 1, 0, LeanTween.value):setOnUpdate(System.Action_float(function (slot0)
		if slot0.selectedCharacter then
			GetComponent(slot1, "Image").color.a = slot0
			GetComponent(slot1, "Image").color = GetComponent(slot1, "Image").color
		end
	end)):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.confirmBtn, function ()
		slot0:showNamedPanel()

		return
	end, SFX_PANEL)
	onButton(slot0, findTF(slot0.info, "random_button"), function ()
		slot0 = require("GameCfg.names")

		setInputText(slot0.nickname, slot1 .. slot2 .. slot0[3][math.random(#slot0[3])] .. slot0[4][math.random(#slot0[4])])
		pg.TipsMgr:GetInstance():ShowTips(i18n("login_newPlayerScene_randomName"))

		return
	end, SFX_MAIN)
	onButton(slot0, findTF(slot0.info, "btn_container/enter_button"), function ()
		if not slot0.contextData.configId then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_newPlayerScene_error_notChoiseShip"))

			return
		end

		if getInputText(slot0.nickname) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_newPlayerScene_inputName"))

			return
		end

		if not nameValidityCheck(slot0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			return
		end

		slot0.event:emit(NewPlayerMediator.ON_CREATE, slot0, slot0.contextData.configId)

		return
	end, SFX_CONFIRM)
	onButton(slot0, findTF(slot0.info, "btn_container/cancel_button"), function ()
		slot0:closeNamedPanel()

		return
	end)
	slot0:initCharacters()

	return
end

slot7 = 0.3
slot8 = -47

function slot0.selectCharacterByIdx(slot0, slot1, slot2)
	slot0.inProp = true
	slot0.contextData.configId = slot2
	slot4 = slot1:Find("name_bg")
	slot5 = slot0.propPanel.anchoredPosition
	slot6 = slot4.anchoredPosition

	slot0:enableOtherChar(slot1, false)
	LeanTween.moveX(rtf(slot1), slot0, slot1):setEase(LeanTweenType.easeInOutSine)
	LeanTween.moveX(rtf(slot0.propPanel), slot2, slot1):setEase(LeanTweenType.easeInOutSine)
	setParent(slot4, slot1.parent)

	slot4.localPosition = slot3

	slot0.propertyPanel:initProperty(slot2)
	slot0:initSkills()
	onButton(slot0, slot0.cancelBtn, function ()
		slot0.inProp = nil

		setParent(nil, slot2)

		slot2.anchoredPosition = slot3

		slot2:enableOtherChar(slot2, true)

		slot2.anchoredPosition = slot4
		slot2.propPanel.anchoredPosition = slot5

		return
	end, SFX_CANCEL)

	return
end

function slot0.enableOtherChar(slot0, slot1, slot2)
	eachChild(slot0.characters, function (slot0)
		if slot0 ~= slot0 then
			setActive(slot0, setActive)
		end

		return
	end)
	setActive(slot0.propPanel, not slot2)
	setActive(slot0.tip, slot2)

	return
end

function slot0.initSkills(slot0)
	removeAllChildren(slot0.skillContainer)

	for slot5, slot6 in ipairs(pg.ship_data_template[slot0.contextData.configId].buff_list_display) do
		slot9 = cloneTplTo(slot0.skillTpl, slot0.skillContainer)

		setActive(slot9:Find("mask"), not table.contains(slot1.buff_list, slot6))
		onButton(slot0, slot9, function ()
			slot0:emit(NewPlayerMediator.ON_SKILLINFO, slot1.id)

			return
		end, SFX_PANEL)
		LoadImageSpriteAsync("skillicon/" .. getSkillConfig(slot6).icon, findTF(slot9, "icon"))
	end

	return
end

function slot0.showNamedPanel(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0.namedPanel)
	setActive(slot0.namedPanel, true)
	setInputText(slot0.nickname, "")
	setText(slot0.chat, slot0[slot0.contextData.configId])

	if Ship.New({
		configId = slot0.contextData.configId
	}).getPrefab(slot1) == slot0.shipPrefab then
		return
	end

	slot0:recycleSpineChar()
	pg.UIMgr:GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(slot2, true, function (slot0)
		pg.UIMgr:GetInstance():LoadingOff()

		slot0.shipPrefab = slot0
		slot0.shipModel = slot0

		slot0:GetComponent("SpineAnimUI"):SetAction("stand", 0)

		tf(slot0).localScale = Vector3(0.5, 0.5, 1)
		tf(slot0).localPosition = Vector3(15, -95, 0)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
		removeAllChildren(slot0.qChar)
		SetParent(slot0, slot0.qChar, false)

		return
	end)

	return
end

function slot0.closeNamedPanel(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.namedPanel, slot0._tf)
	setActive(slot0.namedPanel, false)
	slot0:recycleSpineChar()

	return
end

function slot0.recycleSpineChar(slot0)
	if slot0.shipPrefab and slot0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipPrefab, slot0.shipModel)

		slot0.shipPrefab = nil
		slot0.shipModel = nil
	end

	return
end

function slot0.willExit(slot0)
	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	slot0:closeNamedPanel()

	return
end

return slot0
