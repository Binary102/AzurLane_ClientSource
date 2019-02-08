slot0 = class("ShipInfoScene", import("..base.BaseUI"))
slot1 = nil
slot2 = 0.2
slot3 = 0.3
slot4 = 3
slot5 = 0.5
slot6 = 11
slot0.UNLOCK_EQUPMENT_SKIN_POS = {
	1,
	2,
	3
}
slot0.PAGE = {
	EQUIPMENT = 1,
	DETAIL = 0,
	INTENSIFY = 2,
	REMOULD = 5,
	UPGRADE = 3,
	FASHION = 4
}

function slot0.getUIName(slot0)
	return "ShipInfoUI2"
end

function slot0.preload(slot0, slot1)
	parallelAsync({
		function (slot0)
			GetSpriteFromAtlasAsync("bg/star_level_bg_" .. getProxy(BayProxy).getShipById(slot1, slot0.contextData.shipId).getShipBgPrint(slot2), "", slot0)
		end
	}, slot1)
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0.resPanel:setResources(slot1)
end

function slot0.setShipList(slot0, slot1)
	slot0.shipList = slot1
end

function slot0.setEquipments(slot0, slot1)
	slot0.equipmentProxy = slot1
end

function slot0.setMaxLevelHelpFlag(slot0, slot1)
	slot0.maxLevelHelpFlag = slot1
end

function slot0.setShip(slot0, slot1)
	slot2 = false

	if slot0.shipVO and slot0.shipVO.id ~= slot1.id then
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = nil

		if slot0.loadedCVBankName then
			pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

			slot0.loadedCVBankName = nil
		end

		slot2 = true
	end

	slot0.shipVO = slot1

	slot0:updatePreference(slot1)
	slot0:updateDetail(slot1)
	slot0:updateEquipments(slot1)
	slot0:updateLock()
	slot0:updateFashion()

	slot3 = nil

	if slot1:hasCommander() then
		slot3 = getProxy(CommanderProxy):getCommanderById(slot1:getCommander())
	end

	slot0:updateCommander(slot3)

	if slot0.intensifyMask and slot0.upgradeMask then
		setActive(slot0.intensifyMask, slot0.shipVO:isTestShip() or slot0.shipVO:isBluePrintShip())
		setActive(slot0.upgradeMask, slot0.shipVO:isTestShip() or slot0.shipVO:isBluePrintShip())
	end

	if slot0.equipmentSkinPanel then
		slot0.equipmentSkinPanel:updateAll(slot0.shipVO)
	end

	if slot2 then
		if slot0.page == slot0.PAGE.INTENSIFY and slot0.intensifyMask.gameObject.activeSelf then
			triggerToggle(slot0.detailToggle, true)
		end

		if slot0.page == slot0.PAGE.UPGRADE and slot0.upgradeMask.gameObject.activeSelf then
			triggerToggle(slot0.detailToggle, true)
		end

		if slot0.page == slot0.PAGE.FASHION and not slot0.fashionToggle.gameObject.activeSelf then
			triggerToggle(slot0.fashionToggle, false)
			triggerToggle(slot0.detailToggle, true)
		end
	end

	setActive(slot0.npcFlagTF, slot1:isActivityNpc())
	slot0:setToggleEnable()
end

function slot0.setToggleEnable(slot0)
	if slot0.upgradeToggle then
		SetActive(slot0.upgradeToggle, not slot0.shipVO:isBluePrintShip())
	end

	if slot0.intensifyToggle then
		SetActive(slot0.intensifyToggle, not slot0.shipVO:isBluePrintShip())
	end

	if slot0.remouldToggle then
		SetActive(slot0.remouldToggle, not slot0.shipVO:isBluePrintShip() and pg.ship_data_trans[slot0.shipVO.groupId])
	end

	if slot0.technologyToggle then
		SetActive(slot0.technologyToggle, slot0.shipVO:isBluePrintShip())
	end
end

function slot0.updateCommander(slot0, slot1)
	setActive(slot2, slot1)
	setActive(slot0:findTF("add", slot0.commanderTF), not slot1)

	if slot1 then
		setImageSprite(slot2, LoadSprite("QIcon/" .. slot1:getPainting()), true)
	end

	onButton(slot0, slot0.commanderTF, function ()
		slot0:emit(ShipInfoMediator.ON_SEL_COMMANDER)
	end, SFX_PANEL)
end

function slot0.setSkinList(slot0, slot1)
	slot0.skinList = slot1
end

function slot0.updateLock(slot0)
	if slot0.shipVO:GetLockState() == slot0.shipVO.LOCK_STATE_UNLOCK then
		setActive(slot0.lockBtn, true)
		setActive(slot0.unlockBtn, false)
	elseif slot1 == slot0.shipVO.LOCK_STATE_LOCK then
		setActive(slot0.lockBtn, false)
		setActive(slot0.unlockBtn, true)
	end
end

function slot0.setModPanel(slot0, slot1)
	slot0.modPanel = slot1
end

function slot0.init(slot0)
	slot0:initShip()
	slot0:initPages()

	slot0.topPanel = slot0:findTF("top", slot0.common)

	setAnchoredPosition(slot0.topPanel, {
		y = slot0.topPanel.rect.height
	})

	slot0.equipmentSkinPanel = EquipmentSkinPanel.New(slot0:findTF("main").gameObject)

	slot0.equipmentSkinPanel:attach(slot0)
	setActive(slot0.equipmentSkinPanel._go, true)

	slot0.customMsgbox = slot0:findTF("custom_msgbox")
	slot0.msgBoxItemPanel = slot0:findTF("frame/bg/item_panel", slot0.customMsgbox)
	slot0.msgboxItemContains = slot0:findTF("frame/bg/item_panel/items", slot0.customMsgbox)
	slot0.msgBoxItemTpl = slot0:findTF("equipmenttpl", slot0.msgboxItemContains)
	slot0.msgBoxItemContent = slot0:findTF("frame/bg/item_panel/content", slot0.customMsgbox)
	slot0.msgBoxItemContent1 = slot0:findTF("frame/bg/item_panel/content_num", slot0.customMsgbox)
	slot0.msgBoxCancelBtn = slot0:findTF("frame/btns/cancel_btn", slot0.customMsgbox)
	slot0.msgBoxConfirmBtn = slot0:findTF("frame/btns/confirm_btn", slot0.customMsgbox)
	slot0.msgBoxContent = slot0:findTF("frame/bg/content", slot0.customMsgbox)
	slot0.msgBtnBack = slot0:findTF("frame/top/btnBack", slot0.customMsgbox)

	SetActive(slot0.customMsgbox, false)

	slot0.huntingRange = slot0:findTF("hunting_range")

	setActive(slot0.huntingRange, false)

	slot0.mainCanvasGroup = slot0._tf:GetComponent(typeof(CanvasGroup))
	slot0.commonCanvasGroup = slot0:findTF("common"):GetComponent(typeof(CanvasGroup))
	Input.multiTouchEnabled = false
end

function slot0.showAwakenCompleteAni(slot0, slot1)
	function slot2()
		slot0.awakenAni:SetActive(true)

		slot0.awakenAni.SetActive.awakenPlay = true

		onButton(onButton, slot0.awakenAni, function ()
			slot0.awakenAni:GetComponent("Animator"):SetBool("endFlag", true)
		end)

		slot0 = tf(slot0.awakenAni)

		pg.UIMgr.GetInstance():BlurPanel(slot0.awakenAni)
		slot0:SetAsLastSibling()
		setText(slot0:findTF("window/desc", slot0.awakenAni), setText)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			slot0.awakenAni:GetComponent("Animator"):SetBool("endFlag", false)
			pg.UIMgr.GetInstance():UnblurPanel(slot0.awakenAni, slot0.common)
			slot0.awakenAni:SetActive(false)

			slot0.awakenPlay = false
		end)
	end

	if slot0:findTF("AwakenCompleteWindows(Clone)") then
		slot0.awakenAni = go(slot3)
	end

	if not slot0.awakenAni then
		PoolMgr.GetInstance():GetUI("AwakenCompleteWindows", true, function (slot0)
			slot0:SetActive(true)

			slot0.awakenAni = slot0

			slot0()
		end)
	else
		slot2()
	end
end

function slot0.showCustomMsgBox(slot0, slot1)
	slot0.isShowCustomMsgBox = true

	SetActive(slot0.customMsgbox, true)
	setParent(slot0.customMsgbox, pg.UIMgr:GetInstance().OverlayMain)
	setActive(slot0.msgBoxItemPanel, slot1.items and #slot1.items > 0)
	setActive(slot0.msgBoxContent, not (slot1.items and #slot1.items > 0))

	if slot1.items and #slot1.items > 0 then
		for slot8 = slot0.msgboxItemContains.childCount + 1, #slot1.items, 1 do
			cloneTplTo(slot0.msgBoxItemTpl, slot0.msgboxItemContains)
		end

		for slot8 = 1, slot0.msgboxItemContains.childCount, 1 do
			SetActive(slot0.msgboxItemContains:GetChild(slot8 - 1), slot8 <= #slot3)

			if slot8 <= #slot3 then
				updateDrop(slot9, slot10)

				slot11 = 0

				if slot3[slot8].type == DROP_TYPE_RESOURCE then
					slot11 = slot0.player:getResById(slot10.id)
				elseif slot10.type == DROP_TYPE_ITEM then
					slot11 = getProxy(BagProxy):getItemCountById(slot10.id)
				end

				setText(slot9:Find("icon_bg/count"), slot11 .. "/" .. ((slot11 < slot10.count and "<color=#D6341DFF>" .. slot10.count .. "</color>") or "<color=#A9F548FF>" .. slot10.count .. "</color>"))
			end
		end

		setText(slot0.msgBoxItemContent, slot1.content or "")
		setText(slot0.msgBoxItemContent1, slot1.content1 or "")
	else
		setText(slot0.msgBoxContent, slot1.content or "")
	end

	onButton(slot0, slot0.msgBoxConfirmBtn, function ()
		if slot0.onYes then
			slot0.onYes()
		else
			slot1:hideCustomMsgBox()
		end
	end, SFX_PANEL)
	SetActive(slot0.msgBoxCancelBtn, not defaultValue(slot1.hideNO, false))
	onButton(slot0, slot0.msgBoxCancelBtn, function ()
		if slot0.onCancel then
			slot0.onCancel()
		else
			slot1:hideCustomMsgBox()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.customMsgbox, function ()
		slot0:hideCustomMsgBox()
	end, SFX_PANEL)
	onButton(slot0, slot0.msgBtnBack, function ()
		slot0:hideCustomMsgBox()
	end, SFX_CANCEL)
end

function slot0.hideCustomMsgBox(slot0)
	slot0.isShowCustomMsgBox = nil

	SetActive(slot0.customMsgbox, false)
	setParent(slot0.customMsgbox, pg.UIMgr:GetInstance().UIMain)
end

function slot0.initShip(slot0)
	slot0.shipInfo = slot0:findTF("main/character")

	setActive(slot0.shipInfo, true)

	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.painting = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "painting", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipInfo)
	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.common = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "common")
	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.npcFlagTF = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.common:Find("name/npc")
	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipName = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "name", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.common)

	setActive(rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipName, true)

	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipInfoStarTpl = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "star_tpl", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipName)

	setActive(rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipInfoStarTpl, false)

	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.nameEditFlag = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "editFlag", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipName)

	setActive(rtf(slot0.shipInfo.parent).rect.width / 2 - 55.nameEditFlag, false)

	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.energyTF = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "energy", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.shipName)
	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.energyDescTF = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "desc", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.energyTF)
	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.energyText = rtf(slot0.shipInfo.parent).rect.width / 2 - 55.findTF(slot0, "desc/desc", rtf(slot0.shipInfo.parent).rect.width / 2 - 55.energyTF)

	setActive(rtf(slot0.shipInfo.parent).rect.width / 2 - 55.energyDescTF, false)

	rtf(slot0.shipInfo.parent).rect.width / 2 - 55.intimacyTF = rtf(slot0.shipInfo.parent).rect.width / 2 - 55:findTF("main/detail_panel/intimacy")

	if not rtf(slot0.shipInfo.parent).rect.width / 2 - 55.intimacyTF then
		slot0.intimacyTF = slot0:findTF("intimacy", slot0.shipName)
	end

	slot0.intimacyDescTF = slot0:findTF("desc", slot0.intimacyTF)
	slot0.intimacyText = slot0:findTF("desc/desc", slot0.intimacyTF)

	setActive(slot0.intimacyDescTF, false)

	slot0.intimacyHeart = slot0:findTF("heart", slot0.intimacyTF)
	slot0.chat = slot0:findTF("main/chat")
	slot0.chatBg = slot0:findTF("main/chat/chatbgtop")
	slot0.chatText = slot0:findTF("main/chat/chatbgtop/Text")
	rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)
	slot0.initChatBgH = slot0.chatBg.sizeDelta.y
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel._tf:SetParent(slot0:findTF("common/top/playerRes"), false)

	slot0.commanderTF = slot0:findTF("commander", slot0.shipInfo)

	setActive(slot0.commanderTF, false)
end

function slot0.initPages(slot0)
	slot0.background = slot0:findTF("background")
	slot0.main = slot0:findTF("main")
	slot0.mainMask = slot0.main:GetComponent(typeof(RectMask2D))
	slot0.toggles = slot0:findTF("toggles", slot0.common)

	slot0:initDetail()
	slot0:initEquipment()
	slot0:initFashion()

	slot0.page = slot0.contextData.page or slot0.PAGE.DETAIL

	if slot0.page == slot0.PAGE.EQUIPMENT then
		setAnchoredPosition(slot0.background, {
			x = 0
		})
		setAnchoredPosition(slot0.shipInfo, {
			x = setAnchoredPosition
		})
		setAnchoredPosition(slot0.chat, {
			x = 45
		})

		slot0.paintingFrameName = "zhuangbei"
	else
		setAnchoredPosition(slot0.background, {
			x = -178
		})

		if slot0.page == slot0.PAGE.REMOULD then
			setAnchoredPosition(slot0.shipInfo, {
				x = -700
			})
			setActive(slot0.shipName, false)
		else
			setAnchoredPosition(slot0.shipInfo, {
				x = 275
			})
		end

		setAnchoredPosition(slot0.chat, {
			x = -320
		})

		slot0.paintingFrameName = "chuanwu"
	end

	setAnchoredPosition(slot0.detailPanel, {
		x = (slot0.page == slot0.PAGE.DETAIL and 0) or slot0.detailPanel.rect.width
	})
	setAnchoredPosition(slot0.equipmentR, {
		x = (slot0.page == slot0.PAGE.EQUIPMENT and 0) or slot0.equipmentR.rect.width
	})
	setAnchoredPosition(slot0.equipmentL, {
		x = (slot0.page == slot0.PAGE.EQUIPMENT and 0) or -slot0.equipmentL.rect.width
	})
	setAnchoredPosition(slot0.stylePanel, {
		x = (slot0.page == slot0.PAGE.FASHION and 0) or slot0.stylePanel.rect.width
	})
end

function slot0.initDetail(slot0)
	slot0.detailPanel = slot0:findTF("main/detail_panel")
	slot0.attrs = slot0:findTF("attrs", slot0.detailPanel)
	slot0.shipDetailPanel = ShipDetailPanel.New(slot0.attrs, slot0)
	slot0.equipments = slot0:findTF("equipments", slot0.detailPanel)
	slot0.equipmentsGrid = slot0:findTF("equipments", slot0.equipments)
	slot0.detailEqupimentTpl = slot0:findTF("equipment_tpl", slot0.equipments)
	slot0.emptyGridTpl = slot0:findTF("empty_tpl", slot0.equipments)
	slot0.lockGridTpl = slot0:findTF("lock_tpl", slot0.equipments)
	slot0.lockBtn = slot0.detailPanel:Find("lock_btn")
	slot0.unlockBtn = slot0.detailPanel:Find("unlock_btn")
	slot0.viewBtn = slot0.detailPanel:Find("view_btn")
	slot0.evaluationBtn = slot0.detailPanel:Find("evaluation_btn")
	slot0._renamePanel = slot0:findTF("changeName_panel")
	slot0._renameConfirmBtn = slot0._renamePanel:Find("frame/queren")
	slot0._renameCancelBtn = slot0._renamePanel:Find("frame/cancel")
	slot0._renameRevert = slot0._renamePanel:Find("frame/revert_button")
	slot0.showRecordBtn = slot0:findTF("unload_all", slot0.equipments)
	slot0.recordPanel = slot0:findTF("record_panel", slot0.detailPanel)
	slot0.recordBtns = {
		slot0:findTF("container/record_1/record_btn", slot0.recordPanel),
		slot0:findTF("container/record_2/record_btn", slot0.recordPanel),
		slot0:findTF("container/record_3/record_btn", slot0.recordPanel)
	}
	slot0.recordEquipmentsTFs = {
		slot0:findTF("container/record_1/equipments", slot0.recordPanel),
		slot0:findTF("container/record_2/equipments", slot0.recordPanel),
		slot0:findTF("container/record_3/equipments", slot0.recordPanel)
	}
	slot0.equipRecordBtns = {
		slot0:findTF("container/record_1/equip_btn", slot0.recordPanel),
		slot0:findTF("container/record_2/equip_btn", slot0.recordPanel),
		slot0:findTF("container/record_3/equip_btn", slot0.recordPanel)
	}

	setActive(slot0.recordPanel, false)
	setActive(slot0.detailEqupimentTpl, false)
	setActive(slot0.emptyGridTpl, false)
	setActive(slot0.lockGridTpl, false)
	setActive(slot0.detailPanel, true)
	onButton(slot0, slot0.equipments, function ()
		triggerToggle(slot0.equipmentToggle, true)
	end, SFX_PANEL)
	onButton(slot0, slot0.showRecordBtn, function ()
		if not slot0.isShowRecord then
			slot0:displayRecordPanel()
		else
			slot0:closeRecordPanel()
		end

		setActive(slot0.showRecordBtn:Find("active"), slot0.isShowRecord)
		setActive(slot0.showRecordBtn:Find("inactive"), not slot0.isShowRecord)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("unload_all", slot0.recordPanel), function ()
		slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("ship_unequip_all_tip"),
				onYes = function ()
					slot0:emit(ShipInfoMediator.UNEQUIP_FROM_SHIP_ALL, slot0.shipVO.id)
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shipName, function ()
		if not slot0.shipVO.propose then
			return
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shipName, function ()
		if slot0.shipVO.propose then
			if not pg.PushNotificationMgr.GetInstance():isEnableShipName() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_rename_switch_tip"))

				return
			end

			if (slot0.shipVO.renameTime + 2592000) - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
				if math.floor(slot0 / 60 / 60 / 24) < 1 then
					slot1 = 1
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("word_rename_time_tip", slot1))
			else
				slot0:DisplayRenamePanel(true)
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0._renameConfirmBtn, function ()
		slot0 = getInputText(findTF(slot0._renamePanel, "frame/name_field"))

		slot0:emit(ShipInfoMediator.RENAME_SHIP, slot0.shipVO.id, slot0)
	end, SFX_CONFIRM)
	onButton(slot0, slot0._renameRevert, function ()
		setInputText(findTF((slot0.shipVO:isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot0.shipVO:getRemouldSkinId()].name)) or pg.ship_data_statistics[slot0.shipVO.configId].name._renamePanel, "frame/name_field"), (slot0.shipVO.isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot0.shipVO.getRemouldSkinId()].name)) or pg.ship_data_statistics[slot0.shipVO.configId].name)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCancelBtn, function ()
		slot0:DisplayRenamePanel(false)
	end, SFX_CANCEL)
end

function slot0.DisplayRenamePanel(slot0, slot1)
	slot0.isOpenRenamePanel = slot1

	SetActive(slot0._renamePanel, slot1)

	if slot1 then
		pg.UIMgr.GetInstance():BlurPanel(slot0._renamePanel, false)
		setInputText(findTF(slot0._renamePanel, "frame/name_field"), getText(slot0:findTF("name_mask/Text", slot0.shipName)))
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0._renamePanel, slot0._tf)
	end
end

function slot0.initEquipment(slot0)
	slot0.equipmentR = slot0:findTF("main/equipment_r")
	slot0.equipmentL = slot0:findTF("main/equipment_l")
	slot0.equipmentR1 = slot0:findTF("equipment/equipment_r1", slot0.equipmentR)
	slot0.equipmentR2 = slot0:findTF("equipment/equipment_r2", slot0.equipmentR)
	slot0.equipmentR3 = slot0:findTF("equipment/equipment_r3", slot0.equipmentR)
	slot0.equipmentL1 = slot0:findTF("equipment/equipment_l1", slot0.equipmentL)
	slot0.equipmentL2 = slot0:findTF("equipment/equipment_l2", slot0.equipmentL)
	slot0.infoTplR = slot0:findTF("info", slot0.equipmentR1)
	slot0.infoTplL = slot0:findTF("info", slot0.equipmentL1)

	setActive(slot0.equipmentR, true)
	setActive(slot0.equipmentL, true)

	slot0.equipmentPanels = {
		slot0.equipmentR1,
		slot0.equipmentR2,
		slot0.equipmentR3,
		slot0.equipmentL1,
		slot0.equipmentL2
	}
	slot0.equipmentNames = {}

	for slot4, slot5 in ipairs(slot0.equipmentPanels) do
		if IsNil(slot0:findTF("info", slot5)) then
			cloneTplTo((slot4 <= Ship.WEAPON_COUNT and slot0.infoTplR) or slot0.infoTplL, slot5, "info")
		end

		table.insert(slot0.equipmentNames, ScrollTxt.New(slot0:findTF("info/cont/name_mask", slot5), slot0:findTF("info/cont/name_mask/name", slot5)))
	end
end

function slot0.initFashion(slot0)
	slot0.stylePanel = slot0:findTF("main/style_display")
	slot0.styleScroll = slot0:findTF("style_scroll", slot0.stylePanel)
	slot0.styleContainer = slot0:findTF("view_port", slot0.styleScroll)
	slot0.styleCard = slot0:findTF("style_card", slot0.styleScroll)

	setActive(slot0.stylePanel, true)
	setActive(slot0.styleCard, false)

	slot0.fashionSkins = {}
	slot0.fashionCellMap = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
end

function slot0.updatePreference(slot0, slot1)
	slot0.scrollTxt = ScrollTxt.New(slot0.shipName:Find("name_mask"), slot0.shipName:Find("name_mask/Text"))

	slot0.scrollTxt:setText(slot3)
	setText(slot0:findTF("english_name", slot0.shipName), slot1:getConfigTable().english_name)
	setActive(slot0.nameEditFlag, slot1.propose)

	if not GetSpriteFromAtlas("energy", slot1:getEnergyPrint()) then
		warning("找不到疲劳")
	end

	setImageSprite(slot0.energyTF, slot4)
	setActive(slot0.energyTF, true)

	slot10, slot6, slot7 = slot1:getIntimacyDetail()

	setImageSprite(slot0.intimacyTF, slot8, true)
	setActive(slot0.intimacyTF, true)

	slot9 = 1

	if not LOCK_PROPOSE and slot6 <= slot7 and not slot0.shipVO.propose then
		setActive(slot0.intimacyHeart, true)

		slot9 = 0
	else
		setActive(slot0.intimacyHeart, false)
	end

	slot0.intimacyTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, slot9)

	removeAllChildren(slot10)

	slot11 = slot1:getStar()

	for slot16 = 1, slot1:getMaxStar(), 1 do
		cloneTplTo(slot0.shipInfoStarTpl, slot10, "star_" .. slot16)
	end

	for slot17 = 1, slot12 - slot11, 1 do
		slot18 = slot10:GetChild(slot17 - 1)

		setActive(slot18:Find("star_tpl"), false)
		setActive(slot18:Find("empty_star_tpl"), true)
	end

	if slot0.page ~= slot0.PAGE.FASHION then
		slot0:loadPainting(slot0.shipVO:getPainting())
		slot0:loadSkinBg(slot0.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip())
	end

	if not GetSpriteFromAtlas("shiptype", slot1:getShipType()) then
		warning("找不到船形, shipConfigId: " .. slot1.configId)
	end

	setImageSprite(slot0:findTF("ship_type/type", slot0.shipName), slot14, true)
end

function slot0.updateDetail(slot0, slot1)
	slot0.shipDetailPanel:flush(slot1)
	removeOnButton(slot2)

	if table.contains(TeamType.SubShipType, slot1:getShipType()) then
		onButton(slot0, slot2, function ()
			slot0:displayHuntingRange(slot0)
		end, SFX_PANEL)
	end
end

function slot0.displayHuntingRange(slot0, slot1)
	setActive(slot0.huntingRange, true)
	slot0:updateHuntingRange(slot1, slot1:getHuntingLv())
	setText(slot0.huntingRange:Find("frame/current_level"), "Lv." .. slot1:getHuntingLv())
	setText(slot0.huntingRange:Find("frame/tips"), i18n("ship_hunting_level_tips"))
	onButton(slot0, slot0.huntingRange:Find("frame/top/btnBack"), function ()
		slot0:hideHuntingRange()
	end, SFX_CANCEL)
	onButton(slot0, slot0.huntingRange:Find("frame/help"), function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = pg.gametip.help_shipinfo_hunting.tip
		})
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0.huntingRange)
end

function slot0.updateHuntingRange(slot0, slot1, slot2)
	for slot7 = 0, slot0.huntingRange:Find("frame/range").childCount - 1, 1 do
		setActive(slot0:findTF("activate", slot3:GetChild(slot7)), false)
	end

	_.each(slot4, function (slot0)
		if slot0:GetChild(slot0[1] * 7 + slot0[2] + math.floor(24.5)) and slot3 ~= 24 then
			setActive(slot1:findTF("activate", slot4), true)
		end
	end)
	setActive(slot0.huntingRange:Find("frame/last"), slot2 > 1)
	setActive(slot0.huntingRange:Find("frame/next"), slot2 < #slot1:getConfig("hunting_range"))
	setText(slot0.huntingRange:Find("frame/level"), "Lv." .. slot2)
	onButton(slot0, slot5, function ()
		if slot0 - 1 == 0 then
			slot0 = #slot1:getConfig("hunting_range")
		end

		slot2:updateHuntingRange(slot2.updateHuntingRange, slot0)
	end, SFX_PANEL)
	onButton(slot0, slot0.huntingRange.Find("frame/next"), function ()
		if slot0 + 1 == #slot1:getConfig("hunting_range") + 1 then
			slot0 = 1
		end

		slot2:updateHuntingRange(slot2.updateHuntingRange, slot0)
	end, SFX_PANEL)
end

function slot0.hideHuntingRange(slot0)
	setActive(slot0.huntingRange, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.huntingRange, slot0._tf)
end

function slot0.doUpgradeMaxLeveAnim(slot0, slot1, slot2, slot3)
	slot0.inUpgradeAnim = true

	slot0.shipDetailPanel:doLeveUpAnim(slot1, slot2, function ()
		if slot0 then
			slot0()
		end

		slot1.inUpgradeAnim = nil
	end)
end

function slot0.updateEquipments(slot0, slot1)
	removeAllChildren(slot0.equipmentsGrid)

	slot2 = slot1:getActiveEquipments()

	for slot6, slot7 in ipairs(slot1.equipments) do
		slot8 = slot2[slot6]
		slot9 = nil

		if slot7 then
			updateEquipment(slot9, slot7)
			onButton(slot0, slot9, function ()
				slot0:emit(slot1.ON_EQUIPMENT, {
					type = EquipmentInfoMediator.TYPE_SHIP,
					shipId = slot0.shipVO.id,
					pos = slot1.ON_EQUIPMENT
				})
			end, SFX_UI_DOCKYARD_EQUIPADD)
			setActive(cloneTplTo(slot0.detailEqupimentTpl, slot0.equipmentsGrid):Find("icon_bg/tip"), slot7 and not slot8)
		else
			onButton(slot0, cloneTplTo(slot0.emptyGridTpl, slot0.equipmentsGrid), function ()
				triggerToggle(slot0.equipmentToggle, true)
			end, SFX_UI_DOCKYARD_EQUIPADD)
		end

		slot0:updateEquipmentPanel(slot6, slot7, slot8)
	end
end

function slot0.updateEquipmentPanel(slot0, slot1, slot2, slot3)
	slot5 = findTF(slot4, "info")
	slot7 = findTF(slot5, "efficiency")

	setActive(slot5, slot2)
	setActive(slot6, not slot2)
	setActive(slot5:Find("icon_bg/tip"), slot2 and not slot3)

	slot8 = nil

	for slot12, slot13 in pairs(slot0.shipVO.skills) do
		if ys.Battle.BattleDataFunction.GetBuffTemplate(slot13.id, slot13.level).shipInfoScene and slot14.shipInfoScene.equip then
			slot8 = slot14.shipInfoScene.equip
		end
	end

	slot9 = findTF(slot4, "panel_title/type")

	if findTF(slot4, "skin_icon") then
		setActive(slot10, slot2 and slot2:hasSkin())
	end

	setText(slot9, EquipType.Types2Title(slot1, slot0.shipVO.configId))

	if slot2 then
		setActive(slot7, slot2.config.type ~= EquipType.Equipment and slot2.config.type ~= EquipType.Sonar and slot2.config.type ~= EquipType.AntiSubAircraft)

		if slot2.config.type ~= EquipType.Equipment then
			slot11 = pg.ship_data_statistics[slot0.shipVO.configId]
			slot13 = (slot0.shipVO:getEquipProficiencyByPos(slot1) and slot12 * 100) or 0

			if slot8 then
				slot14 = 1

				if slot8.type and not table.contains(slot8.type, slot2.config.type) then
					slot14 = slot14 * 0
				end

				if slot8.nationality and not table.contains(slot8.nationality, slot2.config.nationality) then
					slot14 = slot14 * 0
				end

				if slot14 == 1 then
					slot13 = slot13 + slot8.number
				end
			end

			setButtonText(slot7, slot13 .. "%")
		end

		updateEquipment(slot5, slot2)

		slot11 = slot2.config.name

		if slot2.config.ammo_icon[1] then
			setActive(findTF(slot5, "cont/icon_ammo"), true)
			setImageSprite(findTF(slot5, "cont/icon_ammo"), GetSpriteFromAtlas("ammo", slot2.config.ammo_icon[1]))
		else
			setActive(findTF(slot5, "cont/icon_ammo"), false)
		end

		function slot12(slot0, slot1)
			slot2 = slot0:GetSkill()

			setActive(slot0, slot2)
			setActive(slot1, not slot2)

			if slot2 then
				setText(findTF(slot0, "values/value"), slot2.name)
				setText(findTF(slot0, "values/value_1"), "")
			end
		end

		if findTF(slot5, "attrs/attr_3_1") then
			setActive(slot13, slot2.config.type == EquipType.Equipment and slot1 <= 3)
		end

		slot0.equipmentNames[slot1]:setText(slot11)

		slot14 = slot2:GetProperties()
		slot15 = false

		for slot19 = 1, 4, 1 do
			if findTF(slot5, "attrs/attr_" .. slot19) then
				slot21 = findTF(slot20, "panel")
				slot22 = findTF(slot20, "lock")

				if slot2.config.type == EquipType.Equipment and slot1 <= 3 and slot19 == 3 then
					slot15 = true

					setActive(slot13, true)
					SetActive(slot20, false)
					slot12(findTF(slot13, "panel"), findTF(slot13, "lock"))
				elseif slot2.config.type == EquipType.Equipment and slot19 == 3 then
					SetActive(slot20, true)
					slot12(slot21, slot22)
				elseif slot15 == true and slot19 == 4 then
					SetActive(slot20, false)
				else
					SetActive(slot20, true)
					setActive(slot21, slot23)
					setActive(slot22, not slot14[slot19])

					if slot14[slot19] then
						slot24 = findTF(slot21, "tag")
						slot25 = findTF(slot21, "values/value")
						slot26 = findTF(slot21, "values/value_1")

						if slot2.config.type ~= EquipType.Equipment and slot23.type == AttributeType.Reload and slot19 == 4 then
							setText(slot24, AttributeType.Type2Name(AttributeType.CD))
							setText(slot25, slot28)
							setText(slot26, i18n("word_secondseach"))
						else
							setText(slot24, AttributeType.Type2Name(slot23.type))
							setText(slot25, slot23.value)
							setText(slot26, "")
						end
					end
				end
			end
		end

		onButton(slot0, slot4, function ()
			slot0:emit(slot1.ON_EQUIPMENT, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = slot0.shipVO.id,
				pos = slot1.ON_EQUIPMENT
			})
		end, SFX_UI_DOCKYARD_EQUIPADD)
	else
		onButton(slot0, slot4, function ()
			if slot0.shipVO then
				slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

				if not slot0 then
					pg.TipsMgr:GetInstance():ShowTips(slot1)

					return
				end

				slot0:emit(ShipInfoMediator.ON_SELECT_EQUIPMENT, slot1)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	end
end

function slot0.getGroupSkinList(slot0, slot1)
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.shipVO:isRemoulded() then
		slot3 = ShipGroup.GetGroupConfig(slot1).trans_skin

		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].id == slot3 then
				table.remove(slot2, slot7)

				break
			end
		end
	end

	for slot6 = #slot2, 1, -1 do
		if slot2[slot6].show_time and ((type(slot7.show_time) == "string" and slot7.show_time == "stop") or (type(slot7.show_time) == "table" and not pg.TimeMgr:GetInstance():inTime(slot7.show_time))) then
			table.remove(slot2, slot6)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		slot3 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].skin_type == 3 and slot3 < slot0.shipVO.createTime then
				table.remove(slot2, slot7)
			end
		end
	end

	if HXSet.isHx() then
		for slot6 = #slot2, 1, -1 do
			if pg.ship_skin_template[slot2[slot6].id].isHX == 1 then
				table.remove(slot2, slot6)
			end
		end
	end

	return slot2
end

function slot0.updateFashion(slot0)
	setActive(findTF(slot0.detailPanel, "fashion_toggle"), #slot0:getGroupSkinList(slot1) > 1)

	if slot0.page ~= slot0.PAGE.FASHION or #slot2 <= 1 then
		return
	end

	if true or slot0.fashionGroup ~= slot1 then
		slot0.fashionGroup = slot1
		slot0.fashionSkins = slot2

		for slot6 = slot0.styleContainer.childCount, #slot0.fashionSkins - 1, 1 do
			cloneTplTo(slot0.styleCard, slot0.styleContainer)
		end

		for slot6 = #slot0.fashionSkins, slot0.styleContainer.childCount - 1, 1 do
			setActive(slot0.styleContainer:GetChild(slot6), false)
		end

		for slot6, slot7 in ipairs(slot0.fashionSkins) do
			slot8 = slot0.fashionSkins[slot6]

			if not slot0.fashionCellMap[slot0.styleContainer:GetChild(slot6 - 1)] then
				slot0.fashionCellMap[slot9] = ShipSkinCard.New(slot9.gameObject)
			end

			slot10:updateData(slot0.shipVO, slot8, slot0.shipVO:proposeSkinOwned(slot8) or table.contains(slot0.skinList, slot8.id) or (slot0.shipVO:getRemouldSkinId() == slot8.id and slot0.shipVO:isRemoulded()) or slot8.skin_type == 3)
			slot10:updateUsing(slot0.shipVO.skinId == slot8.id)
			onButton(slot0, slot9, function ()
				if slot0.page ~= slot1.PAGE.FASHION then
					return
				end

				slot0.fashionSkinId = slot2.id

				slot0:updateFashionDetail(slot2)

				if not HXSet.isHx() then
					slot0:loadPainting(slot2.painting)
					slot0.loadPainting:loadSkinBg(slot0.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip())
				elseif slot2.isSwimsuit ~= 1 then
					slot1 = slot0
					slot0 = slot0.loadPainting
					slot2 = (slot2.painting_hx ~= "" and slot2.painting_hx) or slot2.painting

					slot0:loadPainting(slot2)
					slot0.loadSkinBg(slot0.loadPainting, slot0.loadPainting.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip())

					if not slot2.painting_hx then
						slot2 = slot2.painting
					end
				end

				for slot3, slot4 in ipairs(slot0.fashionSkins) do
					slot8 = slot0.fashionCellMap[slot0.styleContainer:GetChild(slot3 - 1)]
					slot7 = slot0.fashionCellMap[slot0.styleContainer.GetChild(slot3 - 1)].updateSelected

					if slot4.id ~= slot0.fashionSkinId then
						slot9 = false
					else
						slot9 = true
					end

					slot7(slot8, slot9)

					slot8 = slot6
					slot7 = slot6.updateUsing

					if slot0.shipVO.skinId ~= slot4.id then
						slot9 = false
					else
						slot9 = true
					end

					slot7(slot8, slot9)
				end
			end)
			setActive(slot9, true)
		end
	end

	if slot0.fashionSkinId == 0 then
		slot0.fashionSkinId = slot0.shipVO.skinId
	end

	slot3 = slot0.styleContainer:GetChild(0)

	for slot7, slot8 in ipairs(slot0.fashionSkins) do
		if slot8.id == slot0.fashionSkinId then
			slot3 = slot0.styleContainer:GetChild(slot7 - 1)

			break
		end
	end

	triggerButton(slot3)
end

function slot0.resetFashion(slot0)
	slot0.fashionSkinId = 0

	return
end

function slot0.updateFashionDetail(slot0, slot1)
	if not slot0.fashionDetailWrapper then
		slot0.fashionDetailWrapper = {
			name = findTF(slot0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(slot0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(slot0.stylePanel, "style_desc/character"),
			confirm = findTF(slot0.stylePanel, "confirm_button"),
			cancel = findTF(slot0.stylePanel, "cancel_button"),
			diamond = findTF(()["confirm"], "diamond"),
			using = findTF(()["confirm"], "using"),
			change = findTF(()["confirm"], "change"),
			buy = findTF(()["confirm"], "buy"),
			activity = findTF(()["confirm"], "activity"),
			cantbuy = findTF(()["confirm"], "cantbuy"),
			prefab = "unknown"
		}
	end

	setText(slot2.name, HXSet.hxLan(slot1.name))
	setText(slot2.descTxt, HXSet.hxLan(slot1.desc))

	if #slot2.descTxt:GetComponent(typeof(Text)).text > 50 then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end

	if slot2.prefab ~= slot1.prefab then
		if not IsNil(slot2.character:Find(slot2.prefab)) then
			PoolMgr.GetInstance():ReturnSpineChar(slot2.prefab, slot4.gameObject)
		end

		slot2.prefab = slot1.prefab

		PoolMgr.GetInstance():GetSpineChar(slot2.prefab, true, function (slot0)
			if slot0.prefab ~=  then
				PoolMgr.GetInstance():ReturnSpineChar(PoolMgr.GetInstance().ReturnSpineChar, slot0)
			else
				slot0.name = slot1
				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3(0.4, 0.4, 1)

				slot0.transform:SetParent(slot0.character, false)

				slot1 = slot0:GetComponent(typeof(SpineAnimUI)).SetAction

				if not slot2.show_skin then
					slot3 = "stand"
				end

				slot1(slot2, slot3, true)
			end

			return
		end)
	end

	if slot0.shipVO:getRemouldSkinId() == slot1.id then
		slot4 = slot0.shipVO:isRemoulded()
	else
		slot4 = false

		if false then
			slot4 = true
		end
	end

	if slot0.shipVO:proposeSkinOwned(slot1) or table.contains(slot0.skinList, slot1.id) or slot4 then
		slot5 = 1
	else
		slot5 = 0
	end

	if slot1.shop_id <= 0 or not pg.shop_template[slot1.shop_id] then
		slot6 = nil
	end

	slot7 = false

	if HXSet.isHx() and slot6 then
		if pg.shop_template[slot6.id].isHX ~= 1 then
			slot7 = false
		else
			slot7 = true
		end
	end

	if slot6 then
		slot8 = not pg.TimeMgr.GetInstance():inTime(slot6.time)
	end

	if slot1.id ~= slot0.shipVO.skinId then
		slot9 = false
	else
		slot9 = true
	end

	if slot1.id ~= slot0.shipVO:getConfig("skin_id") and slot5 < 1 and slot1.skin_type ~= 3 then
		slot10 = false
	else
		slot10 = true
	end

	setGray(slot2.confirm, false)
	setActive(slot2.using, false)
	setActive(slot2.change, false)
	setActive(slot2.buy, false)

	if slot9 then
		setActive(slot2.using, true)
	else
		if slot10 then
			setActive(slot2.change, true)
		else
			if slot6 then
				setActive(slot2.buy, true)

				slot11 = setGray
				slot12 = slot2.confirm

				if not slot8 then
					slot13 = slot7
				end

				slot11(slot12, slot13)
			else
				setActive(slot2.change, true)
				setGray(slot2.confirm, true)
			end
		end
	end

	onButton(slot0, slot2.confirm, function ()
		if slot0 then
		else
			if slot1 then
				if HXSet.isHx() and slot2.isSwimsuit == 1 then
					slot1 = slot3
					slot0 = slot3.loadPainting

					if slot2.painting_hx == "" or not slot2.painting_hx then
						slot2 = slot2.painting
					end

					slot0(slot1, slot2)
					slot3:loadSkinBg(slot3.shipVO:rarity2bgPrintForGet(), slot3.shipVO.shipVO:isBluePrintShip())

					for slot3, slot4 in ipairs(slot3.fashionSkins) do
						slot8 = slot3.fashionCellMap[slot3.styleContainer:GetChild(slot3 - 1)]
						slot7 = slot3.fashionCellMap[slot3.styleContainer.GetChild(slot3 - 1)].updateSelected

						if slot4.id ~= slot3.fashionSkinId then
							slot9 = false
						else
							slot9 = true
						end

						slot7(slot8, slot9)

						slot8 = slot6
						slot7 = slot6.updateUsing

						if slot3.shipVO.skinId ~= slot4.id then
							slot9 = false
						else
							slot9 = true
						end

						slot7(slot8, slot9)
					end
				end

				slot1 = slot3
				slot0 = slot3.emit

				if slot2.id == slot3.shipVO:getConfig("skin_id") then
					slot4 = 0
				else
					slot4 = slot2.id
				end

				slot0(slot1, slot2, slot3, slot4)
			else
				if slot4 then
					if slot5 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
					else
						slot0 = true

						if HXSet.isHx() then
							if pg.shop_template[slot4.id].isHX == 1 then
								slot0 = false
							else
								slot0 = true
							end
						end

						if slot0 then
							slot1 = Goods.New({
								shop_id = slot4.id
							}, Goods.TYPE_SKIN)
							slot2 = slot1:getConfig("resource_num")

							if slot1:isDisCount() then
								slot2 = slot2 * (100 - slot1:getConfig("discount")) / 100
							end

							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("text_buy_fashion_tip", slot2, HXSet.hxLan(slot2.name)),
								onYes = function ()
									slot0:emit(ShipInfoMediator.BUY_ITEM, slot1.id, 1)

									return
								end
							})
						end
					end
				end
			end
		end

		return
	end)
	onButton(slot0, slot2.cancel, function ()
		triggerToggle(slot0.detailToggle, true)

		return
	end)

	return
end

function slot0.clearFashion(slot0)
	if slot0.fashionDetailWrapper and not IsNil(slot0.fashionDetailWrapper.character:Find(slot0.fashionDetailWrapper.prefab)) then
		PoolMgr.GetInstance():ReturnSpineChar(slot1.prefab, slot2.gameObject)
	end

	slot0.fashionDetailWrapper = nil

	for slot4, slot5 in pairs(slot0.fashionCellMap) do
		slot5:clear()
	end

	slot0.fashionCellMap = {}
	slot0.fashionSkins = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0

	return
end

function slot0.addRingDragListenter(slot0)
	slot1 = GetOrAddComponent(slot0._tf, "EventTriggerListener")
	slot2 = nil
	slot3 = 0
	slot4 = nil

	slot1:AddBeginDragFunc(function ()
		slot0 = 0
		slot1 = nil

		return
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		if not slot0.inPaintingView then
			slot2 = slot1.position

			if not slot1 then
				slot1 = slot2
			end

			slot0:moveUIPanels(slot0.page, math.abs(slot2.x - slot1.x))
		end

		return
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if not slot0.inPaintingView then
			if slot1 < -50 then
				slot0:resetAllPage(slot0.page)
				slot0:emit(ShipInfoMediator.NEXTSHIP, -1)
			else
				if slot1 > 50 then
					slot0:resetAllPage(slot0.page)
					slot0:emit(ShipInfoMediator.NEXTSHIP)
				else
					slot0:moveUIPanels(slot0.page, 0)
				end
			end
		end

		return
	end)

	return
end

function slot0.uiStartAnimating(slot0, slot1)
	shiftPanel(slot0.topPanel, nil, 0, slot3, slot2, true, true, nil, function ()
		slot0:dispatchUILoaded(true)

		return
	end)

	slot0.tweens = topAnimation(slot0:findTF("bg/left", slot0.topPanel), slot0:findTF("bg/right", slot0.topPanel), slot0:findTF("bg/title_chara", slot0.topPanel), slot0:findTF("bg/SHIPINFO", slot0.topPanel), 0.27, function ()
		if slot0 then
			slot0()
		end

		slot1.tweens = nil

		return
	end)

	return
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.topPanel, nil, slot0.topPanel.rect.height, dur, delay, true, true, nil, function ()
		slot0:dispatchUILoaded(true)

		return
	end)

	return
end

function slot0.didEnter(slot0)
	slot0:addRingDragListenter()
	onButton(slot0, slot0:findTF("top/back", slot0.common), function ()
		GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

		slot0:uiExitAnimating()
		LeanTween.delayedCall(0.3, System.Action(function ()
			slot0:emit(slot1.ON_BACK)

			return
		end))

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("main/detail_panel/attrs/icons"), function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = pg.gametip.help_shipinfo_attr.tip
		})

		return
	end)
	onButton(slot0, slot0.npcFlagTF, function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = pg.gametip.help_shipinfo_actnpc.tip
		})

		return
	end, SFX_PANEL)

	slot0.helpBtn = slot0:findTF("help_btn", slot0.common)

	onButton(slot0, slot0.helpBtn, function ()
		if slot0.page == slot1.PAGE.EQUIPMENT then
			pg.MsgboxMgr.GetInstance():ShowHelpWindow({
				helps = pg.gametip.help_shipinfo_equip.tip
			})
		else
			if slot0.page == slot1.PAGE.DETAIL then
				pg.MsgboxMgr.GetInstance():ShowHelpWindow({
					helps = pg.gametip.help_shipinfo_detail.tip
				})
			else
				if slot0.page == slot1.PAGE.INTENSIFY then
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = pg.gametip.help_shipinfo_intensify.tip
					})
				else
					if slot0.page == slot1.PAGE.UPGRADE then
						pg.MsgboxMgr.GetInstance():ShowHelpWindow({
							helps = pg.gametip.help_shipinfo_upgrate.tip
						})
					else
						if slot0.page == slot1.PAGE.FASHION then
							pg.MsgboxMgr.GetInstance():ShowHelpWindow({
								helps = pg.gametip.help_shipinfo_fashion.tip
							})
						end
					end
				end
			end
		end

		return
	end, SFX_PANEL)

	slot0.equipSkinBtn = slot0:findTF("main/equipment_r/equipment_skin_btn")

	setActive(slot0.equipSkinBtn, not LOCK_EQUIP_SKIN)
	onButton(slot0, slot0.equipSkinBtn, function ()
		slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		slot2 = slot0.shipVO.equipments

		if _.all(slot1.UNLOCK_EQUPMENT_SKIN_POS, function (slot0)
			return not slot0[slot0]
		end) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_skin_no_equipment_tip"))

			return
		end

		slot0:switch2EquipmentSkinPage()

		return
	end)

	if slot0.contextData.isInEquipmentSkinPage then
		slot0.contextData.isInEquipmentSkinPage = nil

		triggerButton(slot0.equipSkinBtn)
	end

	slot0.detailToggle = findTF(slot0.toggles, "detail_toggle")
	slot0.equipmentToggle = findTF(slot0.toggles, "equpiment_toggle")
	slot0.upgradeToggle = findTF(slot0.toggles, "upgrade_toggle")
	slot0.intensifyToggle = findTF(slot0.toggles, "intensify_toggle")
	slot0.remouldToggle = findTF(slot0.toggles, "remould_toggle")
	slot0.fashionToggle = findTF(slot0.detailPanel, "fashion_toggle")
	slot0.upgradeMask = findTF(slot0.toggles, "upgrade_toggle/mask")
	slot0.intensifyMask = findTF(slot0.toggles, "intensify_toggle/mask")
	slot0.technologyToggle = findTF(slot0.toggles, "technology_toggle")

	setActive(slot0.intensifyMask, slot0.shipVO:isTestShip())
	setActive(slot0.upgradeMask, slot0.shipVO:isTestShip())

	slot2 = {
		slot0.PAGE.DETAIL,
		slot0.PAGE.EQUIPMENT,
		slot0.PAGE.INTENSIFY,
		slot0.PAGE.UPGRADE,
		slot0.PAGE.FASHION,
		slot0.PAGE.REMOULD
	}

	onToggle(slot0, slot0.intensifyToggle, function (slot0)
		if slot0 then
			slot0:switchToPage(slot1[3])
			slot0:emit(ShipInfoMediator.OPEN_INTENSIFY)
		else
			slot0:emit(ShipInfoMediator.CLOSE_INTENSIFY)
		end

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.remouldToggle, function (slot0)
		if slot0 then
			if LeanTween.isTweening(go(slot0.chat)) then
				LeanTween.cancel(go(slot0.chat))
			end

			rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)

			slot0:switchToPage(slot1[6])
			slot0:emit(ShipInfoMediator.OPEN_REMOULD)
		else
			slot0:emit(ShipInfoMediator.CLOSE_REMOULD)
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.intensifyMask, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("test_ship_intensify_tip"))

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.upgradeMask, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("test_ship_upgrade_tip"))

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.upgradeToggle, function (slot0)
		if slot0 then
			slot0:switchToPage(slot1[4])
			slot0:emit(ShipInfoMediator.ON_UPGRADE)
		else
			slot0:emit(ShipInfoMediator.CLOSE_UPGRADE)
		end

		return
	end, SFX_PANEL)

	for slot6, slot7 in ipairs(slot1) do
		if slot7 ~= slot0.intensifyToggle and slot7 ~= slot0.upgradeToggle and slot7 ~= slot0.remouldToggle then
			onToggle(slot0, slot7, function (slot0)
				if slot0 then
					slot0:switchToPage(slot1[slot0])
				end

				return
			end, SFX_PANEL)
		end
	end

	triggerToggle(slot1[slot0.page + 1], true)
	onButton(slot0, slot0.lockBtn, function ()
		slot0:emit(ShipInfoMediator.ON_LOCK, {
			slot0.shipVO.id
		}, slot0.shipVO.LOCK_STATE_LOCK)

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.unlockBtn, function ()
		slot0:emit(ShipInfoMediator.ON_LOCK, {
			slot0.shipVO.id
		}, slot0.shipVO.LOCK_STATE_UNLOCK)

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.viewBtn, function ()
		Input.multiTouchEnabled = true

		Input:paintView()

		return
	end, SFX_PANEL)
	onButton(slot0, tf(slot0.painting), function ()
		if slot0.page ~= slot1.PAGE.FASHION then
			slot0:displayShipWord("detail")
		end

		return
	end)
	onButton(slot0, slot0.evaluationBtn, function ()
		slot0:emit(ShipInfoMediator.OPEN_EVALUATION, slot0.shipVO:getGroupId(), slot0.shipVO:isActivityNpc())

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.energyTF, function ()
		slot0:showEnergyDesc()

		return
	end)

	if not LOCK_PROPOSE then
		onButton(slot0, slot0.intimacyTF, function ()
			if slot0.shipVO:isActivityNpc() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("npc_propse_tip"))

				return
			end

			if slot0.chatFlag then
				if slot0.chatani1Id then
					LeanTween.cancel(slot0.chatani1Id)
				end

				if slot0.chatani2Id then
					LeanTween.cancel(slot0.chatani2Id)
				end

				LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), ):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()
					slot0.chatFlag = nil

					return
				end))
			end

			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			if slot0.chatFlag then
				if slot0.chatani1Id then
					LeanTween.cancel(slot0.chatani1Id)
				end

				if slot0.chatani2Id then
					LeanTween.cancel(slot0.chatani2Id)
				end

				LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), ):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()
					slot0.chatFlag = nil

					return
				end))
			end

			slot0:emit(ShipInfoMediator.PROPOSE, slot0.shipVO.id)

			return
		end)
	end

	slot3 = pg.UIMgr.GetInstance()

	setParent(slot0.common, slot4)
	slot3:PartialBlur(slot0.toggles, true)

	if slot0.page == slot0.PAGE.DETAIL then
		slot0:displayShipWord(slot0:getInitmacyWords())
		slot0:checkMaxLevelHelp()
	end

	onNextTick(function ()
		slot0:uiStartAnimating()

		return
	end)
	slot0:setToggleEnable()
	onButton(slot0, slot0.technologyToggle, function ()
		slot0:emit(ShipInfoMediator.ON_TECHNOLOGY, slot0.shipVO)

		return
	end, SFX_PANEL)

	return
end

function slot0.onBackPressed(slot0)
	if slot0.inUpgradeAnim then
		return
	end

	if slot0.awakenPlay then
		return
	end

	if slot0.isOpenRenamePanel then
		slot0:DisplayRenamePanel(false)

		return
	end

	if slot0.isShowCustomMsgBox then
		slot0:hideCustomMsgBox()

		return
	end

	if isActive(slot0.huntingRange) then
		slot0:hideHuntingRange()

		return
	end

	if slot0.inPaintingView then
		slot0:hidePaintView(true)

		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0:findTF("top/back", slot0.common))

	return
end

function slot0.showEnergyDesc(slot0)
	if slot0.energyTimer then
		return
	end

	setActive(slot0.energyDescTF, true)

	if slot0.intimacyTimer then
		slot0.intimacyTimer:Stop()

		slot0.intimacyTimer = nil
	end

	setActive(slot0.intimacyDescTF, false)

	slot1, slot6 = slot0.shipVO:getEnergyPrint()

	setText(slot0.energyText, i18n(slot2))

	slot0.energyTimer = Timer.New(function ()
		setActive(slot0.energyDescTF, false)
		setActive.energyTimer:Stop()

		setActive.energyTimer.Stop.energyTimer = nil

		return
	end, 2, 1)

	slot0.energyTimer:Start()

	return
end

function slot0.showIntimacyDesc(slot0)
	if slot0.intimacyTimer then
		return
	end

	setActive(slot0.intimacyDescTF, true)

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end

	setActive(slot0.energyDescTF, false)

	slot1, slot6 = slot0.shipVO:getInitmacyInfo()

	setText(slot0.intimacyText, i18n(slot2, slot0.shipVO:getConfigTable().name))

	slot0.intimacyTimer = Timer.New(function ()
		setActive(slot0.intimacyDescTF, false)
		setActive.intimacyTimer:Stop()

		setActive.intimacyTimer.Stop.intimacyTimer = nil

		return
	end, 2, 1)

	slot0.intimacyTimer:Start()

	return
end

function slot0.displayShipWord(slot0, slot1, slot2)
	if slot2 or not slot0.chatFlag then
		slot0.chatFlag = true
		slot0.chat.localScale = Vector3.zero

		setActive(slot0.chat, true)

		if findTF(slot0.painting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingCode, slot1)
		end

		slot7, slot4 = Ship.getWords(slot0.shipVO.skinId, slot1)

		setText(slot0.chatText, slot3)

		if CHAT_POP_STR_LEN < #slot0.chatText:GetComponent(typeof(Text)).text then
			slot5.alignment = TextAnchor.MiddleLeft
		else
			slot5.alignment = TextAnchor.MiddleCenter
		end

		if slot0.initChatBgH < slot5.preferredHeight + 26 then
			slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot6)
		else
			slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot0.initChatBgH)
		end

		slot7 = slot0

		function slot8()
			if slot0.chatFlag then
				if slot0.chatani1Id then
					LeanTween.cancel(slot0.chatani1Id)
				end

				if slot0.chatani2Id then
					LeanTween.cancel(slot0.chatani2Id)
				end
			end

			slot0.chatani1Id = LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), LeanTween.scale):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
				slot0.chatani2Id = LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), LeanTween.scale):setEase(LeanTweenType.easeInBack):setDelay(slot1 + LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), LeanTween.scale).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()
					slot0.chatFlag = nil

					return
				end)).uniqueId

				return
			end)).uniqueId

			return
		end

		if slot4 then
			function slot9()
				if slot0._currentVoice then
					slot0._currentVoice:Stop(true)
				end

				nil._currentVoice, slot0 = playSoundEffect(slot1)

				if slot3 then
					slot2 = long2int(slot0.length) * 0.001
				end

				slot3()

				return
			end

			if slot0.loadedCVBankName then
				slot9()
			else
				pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0.shipVO.skinId), function ()
					slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

					if pg.CriMgr.GetCVBankName.exited then
						pg.CriMgr.UnloadCVBank(slot0)
					else
						slot2()

						if slot2._currentVoice then
							slot1.loadedCVBankName = slot0
						end
					end

					return
				end)
			end
		else
			slot8()
		end
	end

	return
end

function slot0.startChatTimer(slot0)
	if slot0.chatFlag then
		return
	end

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	slot0.chatTimer = Timer.New(function ()
		slot0:displayShipWord(slot0:getInitmacyWords())

		return
	end, slot0, 1)

	slot0.chatTimer:Start()

	return
end

function slot0.switchToPage(slot0, slot1)
	if slot0.page == slot1 then
		return
	end

	if slot0.page == slot0.PAGE.EQUIPMENT and slot0.contextData.isInEquipmentSkinPage then
		triggerButton(slot0.equipSkinBtn)
	end

	if slot0.page == slot0.PAGE.FASHION then
		slot0:resetFashion()
	end

	slot2 = setActive
	slot3 = slot0.shipName

	if slot1 == slot0.PAGE.REMOULD then
		slot4 = false
	else
		slot4 = true
	end

	slot2(slot3, slot4)

	if slot1 ~= slot0.PAGE.FASHION then
		slot0:loadPainting(slot0.shipVO:getPainting())
		slot0:loadSkinBg(slot0.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip())
	end

	slot2 = setActive
	slot3 = slot0.helpBtn

	if slot1 == slot0.PAGE.FASHION then
		slot4 = false
	else
		slot4 = true
	end

	slot2(slot3, slot4)

	slot2 = slot0.page

	slot0:switchPanel(slot0.detailPanel, slot0.detailPanel.rect.width, nil, nil, nil, true)
	slot0:switchPanel(slot0.equipmentR, slot0.equipmentR.rect.width, nil, nil, nil, true)
	slot0:switchPanel(slot0.equipmentL, -slot0.equipmentL.rect.width, nil, nil, nil, true)
	slot0:switchPanel(slot0.stylePanel, slot0.stylePanel.rect.width, nil, nil, nil, true)

	if slot1 == slot0.PAGE.EQUIPMENT then
		slot0:switchPanel(slot0.equipmentR, 0, nil, nil, slot1)
		slot0:switchPanel(slot0.equipmentL, 0, nil, nil, slot1)
		slot0:switchPanel(slot0.background, 0, nil, slot1 * 2)
		slot0:switchPanel(slot0.shipInfo, slot2, nil, slot1 * 2)
		slot0:switchPanel(slot0.chat, 45, nil, slot1 * 2)
		slot0:switchPainting(slot0.painting, "zhuangbei", slot1 * 2)
	else
		if slot1 == slot0.PAGE.REMOULD then
			slot0:switchPanel(slot0.shipInfo, -slot2, nil, slot1 * 2)

			slot0.chatFlag = nil
		else
			if slot1 == slot0.PAGE.DETAIL then
				slot0:switchPanel(slot0.detailPanel, 0, nil, nil, slot1)
			else
				if slot1 == slot0.PAGE.FASHION then
					slot0:switchPanel(slot0.stylePanel, 0, nil, nil, slot1)
				end
			end

			slot0:switchPanel(slot0.background, -178, nil, slot1 * 2)
			slot0:switchPanel(slot0.shipInfo, 275, nil, slot1 * 2)
			slot0:switchPanel(slot0.chat, -320, nil, slot1 * 2)
			slot0:switchPainting(slot0.painting, "chuanwu", slot1 * 2)
		end
	end

	slot0.contextData.page = slot1
	slot0.page = slot1

	if slot0.page == slot0.PAGE.FASHION then
		slot0:updateFashion()
	else
		if slot0.page == slot0.PAGE.DETAIL then
			slot0:checkMaxLevelHelp()
		end
	end

	slot3 = setActive
	slot4 = slot0.npcFlagTF

	if slot0.page ~= slot0.PAGE.UPGRADE then
		slot5 = slot0.shipVO:isActivityNpc()
	else
		slot5 = false

		if false then
			slot5 = true
		end
	end

	slot3(slot4, slot5)

	return
end

function slot0.checkMaxLevelHelp(slot0)
	if not slot0.maxLevelHelpFlag and slot0.shipVO and slot0.shipVO:isReachNextMaxLevel() then
		triggerButton(slot0.helpBtn, true)
		slot0:emit(ShipInfoMediator.MARK_MAXLEVELHELP_FLAG)
	end

	return
end

function slot0.moveUIPanels(slot0, slot1, slot2)
	if slot1 == slot0.PAGE.EQUIPMENT then
		setAnchoredPosition(slot0.equipmentR, {
			x = slot2
		})
		setAnchoredPosition(slot0.equipmentL, {
			x = -slot2
		})
	else
		if slot1 == slot0.PAGE.INTENSIFY and slot0.modPanel then
			setAnchoredPosition(slot0.modPanel, {
				x = 620 + slot2
			})
		else
			if slot1 == slot0.PAGE.DETAIL then
				setAnchoredPosition(slot0.detailPanel, {
					x = slot2
				})
			else
				if slot1 == slot0.PAGE.FASHION then
					setAnchoredPosition(slot0.stylePanel, {
						x = slot2
					})
				end
			end
		end
	end

	return
end

function slot0.resetAllPage(slot0, slot1)
	slot0:switchPanel(slot0.detailPanel, slot0.detailPanel.rect.width, nil, nil, nil, true)
	slot0:switchPanel(slot0.equipmentR, slot0.equipmentR.rect.width, nil, nil, nil, true)
	slot0:switchPanel(slot0.equipmentL, -slot0.equipmentL.rect.width, nil, nil, nil, true)
	slot0:switchPanel(slot0.stylePanel, slot0.stylePanel.rect.width, nil, nil, nil, true)

	if slot1 == slot0.PAGE.EQUIPMENT then
		slot0:switchPanel(slot0.equipmentR, 0, nil, nil, slot1)
		slot0:switchPanel(slot0.equipmentL, 0, nil, nil, slot1)
	else
		if slot1 == slot0.PAGE.DETAIL then
			slot0:switchPanel(slot0.detailPanel, 0, nil, nil, slot1)
		else
			if slot1 == slot0.PAGE.FASHION then
				slot0:switchPanel(slot0.stylePanel, 0, nil, nil, slot1)
			end
		end
	end

	return
end

function slot0.switchPanel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot4 = defaultValue(slot4, slot0)

	if slot6 then
		LeanTween.cancel(go(slot1))
	end

	slot7 = Vector3.New(tf(slot1).localPosition.x, tf(slot1).localPosition.y, tf(slot1).localPosition.z)

	if slot2 then
		slot7.x = slot2
	end

	if slot3 then
		slot7.y = slot3
	end

	slot8 = LeanTween.move(rtf(slot1), slot7, slot4):setEase(LeanTweenType.easeInOutSine)

	if slot5 then
		slot8:setDelay(slot5)
	end

	return slot8
end

function slot0.switchPainting(slot0, slot1, slot2, slot3)
	if not slot2 then
		slot4 = ""
	end

	slot0.paintingFrameName = slot4
	slot4 = GetOrAddComponent(findTF(slot1, "fitter"), "PaintingScaler")

	slot4:Snapshoot()

	slot4.FrameName = slot0.paintingFrameName

	return LeanTween.value(go(slot1), 0, 1, slot3):setOnUpdate(System.Action_float(function (slot0)
		slot0.Tween = slot0

		return
	end)):setEase(LeanTweenType.easeInOutSine)
end

function slot0.loadPainting(slot0, slot1)
	if slot0.paintingCode ~= slot1 then
		if slot0.paintingCode then
			retPaintingPrefab(slot0.painting, slot0.paintingCode)
		end

		slot0.paintingCode = slot1

		if slot0.paintingCode then
			setPaintingPrefabAsync(slot0.painting, slot0.paintingCode, slot0.paintingFrameName, function ()
				Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingCode)

				return
			end)
		end
	end

	return
end

function slot0.loadSkinBg(slot0, slot1, slot2)
	if slot0.shipSkinBg ~= slot1 or slot0.isDesign ~= slot2 then
		slot0.shipSkinBg = slot1
		slot0.isDesign = slot2

		if slot0.isDesign then
			if not slot0.designBg then
				PoolMgr.GetInstance():GetUI("raritydesign5", true, function (slot0)
					slot0.designBg = slot0

					slot0.transform:SetParent(slot0._tf, false)

					slot0.transform.localPosition = Vector3(1, 1, 1)
					slot0.transform.localScale = Vector3(1, 1, 1)

					slot0.transform:SetSiblingIndex(1)
					setActive(slot0, true)

					return
				end)
			else
				setActive(slot0.designBg, true)
			end
		else
			if slot0.designBg then
				setActive(slot0.designBg, slot0.isDesign)
			end
		end

		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot1, "", function (slot0)
			if not slot0.exited and slot0.shipSkinBg ==  then
				setImageSprite(slot0.background, slot0)
			end

			return
		end)
	end

	return
end

function slot0.getInitmacyWords(slot0)
	return "feeling" .. Mathf.Clamp(slot0.shipVO:getIntimacyLevel(), 1, 5)
end

function slot0.paintView(slot0)
	slot0.inPaintingView = true
	slot1 = {}
	slot2 = slot0._tf.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0._tf:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0.main and slot4 ~= slot0.background then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	slot2 = slot0.main.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0.main:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0.shipInfo then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	slot1[#slot1 + 1] = slot0.chat

	openPortrait()
	setActive(slot0.common, false)

	slot0.mainMask.enabled = false

	slot0.mainMask:PerformClipping()

	slot5 = slot0.painting.anchoredPosition.x
	slot6 = slot0.painting.anchoredPosition.y
	slot9 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot10 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot11 = slot0.painting.rect.width / 2
	slot12 = slot0.painting.rect.height / 2
	slot13, slot14 = nil

	GetOrAddComponent(slot0.background, "MultiTouchZoom").SetZoomTarget(slot15, slot0.painting)

	slot16 = GetOrAddComponent(slot0.background, "EventTriggerListener")
	slot17 = true
	slot18 = false

	slot16:AddPointDownFunc(function (slot0)
		if Input.touchCount == 1 or Application.isEditor then
			slot0 = true
			slot1 = true
		else
			if Input.touchCount >= 2 then
				slot1 = false
				slot0 = false
			end
		end

		return
	end)
	slot16:AddPointUpFunc(function (slot0)
		if Input.touchCount <= 2 then
			slot0 = true
		end

		return
	end)
	slot16:AddBeginDragFunc(function (slot0, slot1)
		slot0 = false
		slot5 = slot1.position.x *  - slot1.position.x - tf(slot4.painting).localPosition.x.position.y * slot6 - slot7 - tf(slot4.painting.painting).localPosition.y

		return
	end)
	slot16:AddDragFunc(function (slot0, slot1)
		if slot0 then
			tf(slot1.painting).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
		end

		return
	end)
	onButton(slot0, slot0.background, function ()
		slot0:hidePaintView()

		return
	end, SFX_CANCEL)
	setAnchoredPosition(slot0.background, {
		x = -88
	})

	function slot0.hidePaintView(slot0, slot1)
		if not slot1 and not slot0 then
			return
		end

		Input.multiTouchEnabled = false

		setActive(slot0.common, true)
		slot0:switchPanel(slot0.shipInfo, 275, nil, slot1 * 2)

		slot0.switchPanel.enabled = false
		false.enabled = false

		for slot5, slot6 in ipairs(slot4) do
			setActive(slot6, true)
		end

		closePortrait()

		slot0.painting.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(slot0.painting, {
			x = 1,
			y = 1
		})
		setAnchoredPosition(slot0.background, {
			x = 0
		})

		slot0.background:GetComponent("Button").enabled = false
		slot0.painting:GetComponent("CanvasGroup").blocksRaycasts = true
		slot0.mainMask.enabled = true

		slot0.mainMask:PerformClipping()

		slot0.inPaintingView = false

		return
	end

	slot0:switchPanel(slot0.shipInfo, slot2, nil, slot1 * 2):setOnComplete(System.Action(function ()
		slot0.enabled = true
		true.enabled = true
		slot2.background:GetComponent("Button").enabled = true
		slot2.painting:GetComponent("CanvasGroup").blocksRaycasts = false

		return
	end))

	return
end

function slot0.unPartialBlur(slot0)
	setParent(slot0.common, slot0._go)
	pg.UIMgr.GetInstance():PartialBlur(slot0.toggles, false)

	return
end

slot7 = 0.2

function slot0.displayRecordPanel(slot0)
	if not slot0.shipVO then
		return
	end

	slot0.isShowRecord = true

	setActive(slot0.recordPanel, true)

	if LeanTween.isTweening(go(slot0.recordPanel)) then
		LeanTween.cancel(go(slot0.recordPanel))
	end

	LeanTween.scaleY(go(slot0.recordPanel), 1, slot0):setFrom(0):setEase(LeanTweenType.linear)

	for slot4, slot5 in ipairs(slot0.recordBtns) do
		onButton(slot0, slot5, function ()
			slot0:emit(ShipInfoMediator.ON_RECORD_EQUIPMENT, slot0.shipVO.id, slot0, 1)

			return
		end, SFX_PANEL)
	end

	for slot4, slot5 in ipairs(slot0.equipRecordBtns) do
		onButton(slot0, slot5, function ()
			slot0:emit(ShipInfoMediator.ON_RECORD_EQUIPMENT, slot0.shipVO.id, slot0, 2)

			return
		end, SFX_PANEL)
	end

	for slot4, slot5 in ipairs(slot0.recordEquipmentsTFs) do
		slot0:updateRecordEquipments(slot4)
	end

	return
end

function slot0.closeRecordPanel(slot0)
	if slot0.isShowRecord then
		slot0.isShowRecord = nil

		if LeanTween.isTweening(go(slot0.recordPanel)) then
			LeanTween.cancel(go(slot0.recordPanel))
		end

		LeanTween.scaleY(go(slot0.recordPanel), 0, slot0):setFrom(1):setEase(LeanTweenType.linear)
		setActive(slot0.recordPanel, false)
	end

	return
end

function slot0.updateRecordEquipments(slot0, slot1)
	slot2 = slot0.recordEquipmentsTFs[slot1]

	if not slot0.shipVO:getEquipmentRecord(slot0.player.id)[slot1] then
		slot4 = {}
	end

	for slot8 = 1, 5, 1 do
		if tonumber(slot4[slot8]) then
			if slot9 == -1 then
				slot10 = false
			else
				slot10 = true
			end
		end

		slot11 = slot2:Find("equipment_" .. slot8)

		setActive(slot13, slot10)
		setActive(slot11:Find("empty"), not slot10)

		if slot10 then
			slot14 = slot0.equipmentProxy:getEquipmentById(slot9)

			if not slot0.shipVO.equipments[slot8] or slot15.id ~= slot9 then
				slot16 = false

				if false then
					slot16 = false
				end
			else
				slot16 = true
			end

			if slot16 or (slot14 and slot14.count > 0) then
				slot17 = false
			else
				slot17 = true
			end

			setActive(slot13:Find("tip"), slot17)
			updateEquipment(slot13, Equipment.New({
				id = slot9
			}))

			if slot17 then
				onButton(slot0, slot13, function ()
					pg.TipsMgr:GetInstance():ShowTips(i18n("ship_quick_change_nofreeequip"))

					return
				end, SFX_PANEL)
			end
		else
			removeOnButton(slot13)
		end
	end

	return
end

function slot0.switch2EquipmentSkinPage(slot0)
	if slot0.equipmentSkinPanel:isTweening() then
		return
	end

	slot0.equipmentSkinPanel:doSwitchAnim(slot0.contextData.isInEquipmentSkinPage)

	slot0.contextData.isInEquipmentSkinPage = not slot0.contextData.isInEquipmentSkinPage

	setActive(slot0.equipSkinBtn:Find("unsel"), not slot0.contextData.isInEquipmentSkinPage)
	setActive(slot0.equipSkinBtn:Find("sel"), slot0.contextData.isInEquipmentSkinPage)
	slot0.equipmentSkinPanel:updateAll(slot0.shipVO)

	return
end

function slot0.willExit(slot0)
	Input.multiTouchEnabled = true

	if slot0.designBg then
		PoolMgr.GetInstance():ReturnUI("raritydesign5", slot0.designBg)
	end

	slot0.intensifyToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	slot0.upgradeToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	LeanTween.cancel(slot0.chat.gameObject)

	if slot0.paintingCode then
		retPaintingPrefab(slot0.painting, slot0.paintingCode)
	end

	removeAllChildren(slot0.equipmentsGrid)
	clearImageSprite(slot0.background)
	slot0.resPanel:exit()

	slot0.resPanel = nil

	if slot0.recordPanel then
		if LeanTween.isTweening(go(slot0.recordPanel)) then
			LeanTween.cancel(go(slot0.recordPanel))
		end

		slot0.recordPanel = nil
	end

	if slot0.equipmentSkinPanel then
		slot0.equipmentSkinPanel:detach()
	end

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end

	if slot0.intimacyTimer then
		slot0.intimacyTimer:Stop()

		slot0.intimacyTimer = nil
	end

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	slot0:clearFashion()
	slot0:hideHuntingRange()
	cameraPaintViewAdjust(false)

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	for slot4, slot5 in ipairs(slot0.equipmentNames) do
		slot5:destroy()
	end

	slot0.equipmentNames = nil

	slot0.shipDetailPanel:clear()

	if slot0.scrollTxt then
		slot0.scrollTxt:destroy()
	end

	return
end

return slot0
