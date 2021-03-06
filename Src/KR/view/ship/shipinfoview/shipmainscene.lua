slot0 = class("ShipMainScene", import("...base.BaseUI"))
slot1 = 0
slot2 = 0.2
slot3 = 0.3
slot4 = 3
slot5 = 0.5
slot6 = 11

function slot0.getUIName(slot0)
	return "ShipMainScene"
end

function slot0.preload(slot0, slot1)
	slot3 = getProxy(BayProxy).getShipById(slot2, slot0.contextData.shipId)

	parallelAsync({
		function (slot0)
			GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot0:rarity2bgPrintForGet(), "", slot0)
		end,
		function (slot0)
			if not PoolMgr.GetInstance():HasCacheUI("ShipDetailView") then
				slot1:GetUI(slot2, true, function (slot0)
					slot0:ReturnUI(slot0.ReturnUI, slot0)
					slot0()
				end)
			else
				slot0()
			end
		end
	}, slot1)
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0:GetShareData():SetPlayer(slot1)

	if slot0._resPanel then
		slot0._resPanel:setResources(slot1)
	end
end

function slot0.setShipList(slot0, slot1)
	slot0.shipList = slot1
end

function slot0.setShip(slot0, slot1)
	slot0:GetShareData():SetShipVO(slot1)

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

	setActive(slot0.npcFlagTF, slot1:isActivityNpc())

	if slot2 and not slot0:checkToggleActive(ShipViewConst.currentPage) then
		triggerToggle(slot0.detailToggle, true)
	end

	slot0:setToggleEnable()

	slot0.isSpBg = pg.ship_skin_template[slot0.shipVO.skinId].rarity_bg and slot3.rarity_bg ~= ""

	slot0:updatePreference(slot1)
	slot0.shipDetailView:ActionInvoke("UpdateUI")
	slot0.shipFashionView:ActionInvoke("UpdateUI")
	slot0.shipEquipView:ActionInvoke("UpdateUI")
end

function slot0.setToggleEnable(slot0)
	for slot4, slot5 in pairs(slot0.togglesList) do
		setActive(slot5, slot0:checkToggleActive(slot4))
	end

	setActive(slot0.technologyToggle, slot0.shipVO:isBluePrintShip())
end

function slot0.checkToggleActive(slot0, slot1)
	if slot1 == ShipViewConst.PAGE.DETAIL then
		return true
	elseif slot1 == ShipViewConst.PAGE.EQUIPMENT then
		return true
	elseif slot1 == ShipViewConst.PAGE.INTENSIFY then
		return not slot0.shipVO:isTestShip() and not slot0.shipVO:isBluePrintShip()
	elseif slot1 == ShipViewConst.PAGE.UPGRADE then
		return not slot0.shipVO:isTestShip() and not slot0.shipVO:isBluePrintShip()
	elseif slot1 == ShipViewConst.PAGE.REMOULD then
		return not slot0.shipVO:isTestShip() and not slot0.shipVO:isBluePrintShip() and pg.ship_data_trans[slot0.shipVO.groupId]
	elseif slot1 == ShipViewConst.PAGE.FASHION then
		return slot0:hasFashion()
	else
		return false
	end
end

function slot0.setSkinList(slot0, slot1)
	slot0.shipFashionView:ActionInvoke("SetSkinList", slot1)
end

function slot0.updateLock(slot0)
	slot0.shipDetailView:ActionInvoke("UpdateLock")
end

function slot0.updatePreferenceTag(slot0)
	slot0.shipDetailView:ActionInvoke("UpdatePreferenceTag")
end

function slot0.closeRecordPanel(slot0)
	slot0.shipDetailView:ActionInvoke("CloseRecordPanel")
end

function slot0.updateRecordEquipments(slot0, slot1)
	slot0.shipDetailView:UpdateRecordEquipments(slot1)
end

function slot0.setModPanel(slot0, slot1)
	slot0.modPanel = slot1
end

function slot0.setMaxLevelHelpFlag(slot0, slot1)
	slot0.maxLevelHelpFlag = slot1
end

function slot0.checkMaxLevelHelp(slot0)
	if not slot0.maxLevelHelpFlag and slot0.shipVO and slot0.shipVO:isReachNextMaxLevel() then
		slot0:openHelpPage()

		slot0.maxLevelHelpFlag = true

		getProxy(SettingsProxy):setMaxLevelHelp(true)
	end
end

function slot0.GetShareData(slot0)
	if not slot0.shareData then
		slot0.shareData = ShipViewShareData.New(slot0.contextData)

		slot0.shipDetailView:SetShareData(slot0.shareData)
		slot0.shipFashionView:SetShareData(slot0.shareData)
		slot0.shipEquipView:SetShareData(slot0.shareData)
		slot0.shipEquipView:ActionInvoke("InitEvent")
		slot0.shipHuntingRangeView:SetShareData(slot0.shareData)
		slot0.shipCustomMsgBox:SetShareData(slot0.shareData)
		slot0.shipChangeNameView:SetShareData(slot0.shareData)
	end

	return slot0.shareData
end

function slot0.hasFashion(slot0)
	return slot0.shareData:HasFashion()
end

function slot0.DisplayRenamePanel(slot0, slot1)
	slot0.shipChangeNameView:Load()
	slot0.shipChangeNameView:ActionInvoke("DisplayRenamePanel", slot1)
end

function slot0.init(slot0)
	slot0:initShip()
	slot0:initPages()
	slot0:initEvents()

	slot0.mainCanvasGroup = slot0._tf:GetComponent(typeof(CanvasGroup))
	slot0.commonCanvasGroup = slot0:findTF("blur_panel/adapt"):GetComponent(typeof(CanvasGroup))
	Input.multiTouchEnabled = false
end

function slot0.initShip(slot0)
	slot0.shipInfo = slot0:findTF("main/character")

	setActive(slot0.shipInfo, true)

	slot0.tablePainting = {
		slot0:findTF("painting", slot0.shipInfo),
		slot0:findTF("painting2", slot0.shipInfo)
	}
	slot0.nowPainting = nil
	slot0.isRight = true
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.common = slot0.blurPanel:Find("adapt")
	slot0.npcFlagTF = slot0.common:Find("name/npc")
	slot0.shipName = slot0.common:Find("name")
	slot0.shipInfoStarTpl = slot0.shipName:Find("star_tpl")
	slot0.nameEditFlag = slot0.shipName:Find("nameRect/editFlag")

	setActive(slot0.shipName, true)
	setActive(slot0.shipInfoStarTpl, false)
	setActive(slot0.nameEditFlag, false)

	slot0.energyTF = slot0.shipName:Find("energy")
	slot0.energyDescTF = slot0.energyTF:Find("desc")
	slot0.energyText = slot0.energyTF:Find("desc/desc")

	setActive(slot0.energyDescTF, false)

	slot0.character = slot0:findTF("main/character")
	slot0.chat = slot0:findTF("main/character/chat")
	slot0.chatBg = slot0:findTF("main/character/chat/chatbgtop")
	slot0.chatText = slot0:findTF("Text", slot0.chat)
	rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)
	slot0.initChatBgH = slot0.chatBg.sizeDelta.y

	pg.UIMgr.GetInstance():OverlayPanel(slot0.chat, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})

	slot0._playerResOb = slot0:findTF("blur_panel/adapt/top/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)
end

function slot0.initPages(slot0)
	ShipViewConst.currentPage = nil
	slot0.background = slot0:findTF("background")

	setActive(slot0.background, true)

	slot0.main = slot0:findTF("main")
	slot0.mainMask = slot0.main:GetComponent(typeof(RectMask2D))
	slot0.toggles = slot0:findTF("left_length/frame/root", slot0.common)
	slot0.detailToggle = slot0.toggles:Find("detail_toggle")
	slot0.equipmentToggle = slot0.toggles:Find("equpiment_toggle")
	slot0.intensifyToggle = slot0.toggles:Find("intensify_toggle")
	slot0.upgradeToggle = slot0.toggles:Find("upgrade_toggle")
	slot0.remouldToggle = slot0.toggles:Find("remould_toggle")
	slot0.technologyToggle = slot0.toggles:Find("technology_toggle")
	slot0.togglesList = {
		[ShipViewConst.PAGE.DETAIL] = slot0.detailToggle,
		[ShipViewConst.PAGE.EQUIPMENT] = slot0.equipmentToggle,
		[ShipViewConst.PAGE.INTENSIFY] = slot0.intensifyToggle,
		[ShipViewConst.PAGE.UPGRADE] = slot0.upgradeToggle,
		[ShipViewConst.PAGE.REMOULD] = slot0.remouldToggle
	}
	slot0.detailContainer = slot0.main:Find("detail_container")

	setAnchoredPosition(slot0.detailContainer, {
		x = 1300
	})

	slot0.fashionContainer = slot0.main:Find("fashion_container")

	setAnchoredPosition(slot0.fashionContainer, {
		x = 900
	})

	slot0.equipContainer = slot0.main:Find("equip_container")
	slot0.equipLCon = slot0.equipContainer:Find("equipment_l_container")
	slot0.equipRCon = slot0.equipContainer:Find("equipment_r_container")

	setAnchoredPosition(slot0.equipRCon, {
		x = 750
	})
	setAnchoredPosition(slot0.equipLCon, {
		x = -700
	})

	slot0.shipDetailView = ShipDetailView.New(slot0.detailContainer, slot0.event, slot0.contextData)
	slot0.shipFashionView = ShipFashionView.New(slot0.fashionContainer, slot0.event, slot0.contextData)
	slot0.shipEquipView = ShipEquipView.New(slot0.equipContainer, slot0.event, slot0.contextData)
	slot0.shipHuntingRangeView = ShipHuntingRangeView.New(slot0._tf, slot0.event, slot0.contextData)
	slot0.shipCustomMsgBox = ShipCustomMsgBox.New(slot0._tf, slot0.event, slot0.contextData)
	slot0.shipChangeNameView = ShipChangeNameView.New(slot0._tf, slot0.event, slot0.contextData)
	slot0.viewList = {
		[ShipViewConst.PAGE.DETAIL] = slot0.shipDetailView,
		[ShipViewConst.PAGE.FASHION] = slot0.shipFashionView,
		[ShipViewConst.PAGE.EQUIPMENT] = slot0.shipEquipView
	}

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
end

function slot0.initEvents(slot0)
	slot0:bind(ShipViewConst.SWITCH_TO_PAGE, function (slot0, slot1)
		slot0:gotoPage(slot1)
	end)
	slot0:bind(ShipViewConst.LOAD_PAINTING, function (slot0, slot1, slot2)
		slot0:loadPainting(slot1, slot2)
	end)
	slot0:bind(ShipViewConst.LOAD_PAINTING_BG, function (slot0, slot1, slot2)
		slot0:loadSkinBg(slot1, slot2, slot0.isSpBg)
	end)
	slot0:bind(ShipViewConst.HIDE_SHIP_WORD, function (slot0)
		slot0:hideShipWord()
	end)
	slot0:bind(ShipViewConst.SET_CLICK_ENABLE, function (slot0, slot1)
		slot0.mainCanvasGroup.blocksRaycasts = slot1
		slot0.commonCanvasGroup.blocksRaycasts = slot1
	end)
	slot0:bind(ShipViewConst.SHOW_CUSTOM_MSG, function (slot0, slot1)
		slot0.shipCustomMsgBox:Load()
		slot0.shipCustomMsgBox:ActionInvoke("showCustomMsgBox", slot1)
	end)
	slot0:bind(ShipViewConst.HIDE_CUSTOM_MSG, function (slot0)
		slot0.shipCustomMsgBox:ActionInvoke("hideCustomMsgBox")
	end)
	slot0:bind(ShipViewConst.DISPLAY_HUNTING_RANGE, function (slot0, slot1)
		if slot1 then
			slot0.shipHuntingRangeView:Load()
			slot0.shipHuntingRangeView:ActionInvoke("DisplayHuntingRange")
		else
			slot0.shipHuntingRangeView:HideHuntingRange()
		end
	end)
	slot0:bind(ShipViewConst.PAINT_VIEW, function (slot0, slot1)
		if slot1 then
			slot0:paintView()
		else
			slot0:hidePaintView(true)
		end
	end)
end

function slot0.didEnter(slot0)
	slot0:addRingDragListenter()
	onButton(slot0, slot0:findTF("top/back_btn", slot0.common), function ()
		GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

		LeanTween.delayedCall(0.3, System.Action(function ()
			slot0:emit(slot1.ON_BACK)
		end))
	end, SFX_CANCEL)
	onButton(slot0, slot0.npcFlagTF, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_actnpc.tip
		})
	end, SFX_PANEL)

	slot0.helpBtn = slot0:findTF("help_btn", slot0.common)

	onButton(slot0, slot0.helpBtn, function ()
		slot0:openHelpPage(ShipViewConst.currentPage)
	end, SFX_PANEL)

	for slot4, slot5 in pairs(slot0.togglesList) do
		if slot5 == slot0.upgradeToggle or slot5 == slot0.remouldToggle or slot5 == slot0.equipmentToggle then
			onToggle(slot0, slot5, function (slot0)
				if slot0 then
					if LeanTween.isTweening(go(slot0.chat)) then
						LeanTween.cancel(go(slot0.chat))
					end

					rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)
					slot0.chatFlag = false

					slot0:switchToPage(slot0.switchToPage)
				end
			end, SFX_PANEL)
		else
			onToggle(slot0, slot5, function (slot0)
				if slot0 then
					slot0:switchToPage(slot0.switchToPage)
				end
			end, SFX_PANEL)
		end
	end

	onButton(slot0, slot0.technologyToggle, function ()
		slot0:emit(ShipMainMediator.ON_TECHNOLOGY, slot0.shipVO)
	end, SFX_PANEL)
	onButton(slot0, tf(slot0.character), function ()
		if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
			slot0:displayShipWord("detail")
		end
	end)
	onButton(slot0, slot0.energyTF, function ()
		slot0:showEnergyDesc()
	end)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})
	slot0:gotoPage((slot0:checkToggleActive(slot0.contextData.page) and slot0.contextData.page) or ShipViewConst.PAGE.DETAIL)

	if ShipViewConst.currentPage == ShipViewConst.PAGE.DETAIL then
		slot0:displayShipWord(slot0:getInitmacyWords())
		slot0:checkMaxLevelHelp()
	end
end

function slot0.openHelpPage(slot0, slot1)
	if slot1 == ShipViewConst.PAGE.EQUIPMENT then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_equip.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	elseif slot1 == ShipViewConst.PAGE.DETAIL then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_detail.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	elseif slot1 == ShipViewConst.PAGE.INTENSIFY then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_intensify.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	elseif slot1 == ShipViewConst.PAGE.UPGRADE then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_upgrate.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	elseif slot1 == ShipViewConst.PAGE.FASHION then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_fashion.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_shipinfo_maxlevel.tip,
			weight = LayerWeightConst.THIRD_LAYER
		})
	end
end

function slot0.showAwakenCompleteAni(slot0, slot1)
	function slot2()
		slot0.awakenAni:SetActive(true)

		slot0.awakenAni.SetActive.awakenPlay = true

		onButton(onButton, slot0.awakenAni, function ()
			slot0.awakenAni:GetComponent("Animator"):SetBool("endFlag", true)
		end)

		slot0 = tf(slot0.awakenAni)

		pg.UIMgr.GetInstance():BlurPanel(slot0)
		setText(slot0:findTF("window/desc", slot0.awakenAni), setText)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			slot0.awakenAni:GetComponent("Animator"):SetBool("endFlag", false)
			pg.UIMgr.GetInstance():UnblurPanel(pg.UIMgr.GetInstance().UnblurPanel, slot0.common)
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

function slot0.updatePreference(slot0, slot1)
	slot0.scrollTxt = ScrollTxt.New(slot0.shipName:Find("nameRect/name_mask"), slot0.shipName:Find("nameRect/name_mask/Text"))

	slot0.scrollTxt:setText(slot3)
	setText(slot0:findTF("english_name", slot0.shipName), slot1:getConfigTable().english_name)
	setActive(slot0.nameEditFlag, slot1.propose)

	if not GetSpriteFromAtlas("energy", slot1:getEnergyPrint()) then
		warning("找不到疲劳")
	end

	setImageSprite(slot0.energyTF, slot4, true)
	setActive(slot0.energyTF, true)
	removeAllChildren(slot5)

	slot6 = slot1:getStar()

	for slot11 = 1, slot1:getMaxStar(), 1 do
		setActive(cloneTplTo(slot0.shipInfoStarTpl, slot5, "star_" .. slot11):Find("star_tpl"), slot11 <= slot6)
		setActive(slot12:Find("empty_star_tpl"), true)
	end

	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
		slot0:loadPainting(slot0.shipVO:getPainting())
		slot0:loadSkinBg(slot0.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip(), slot0.isSpBg)
	end

	if not GetSpriteFromAtlas("shiptype", slot1:getShipType()) then
		warning("找不到船形, shipConfigId: " .. slot1.configId)
	end

	setImageSprite(slot0:findTF("type", slot0.shipName), slot8, true)
end

function slot0.doUpgradeMaxLeveAnim(slot0, slot1, slot2, slot3)
	slot0.inUpgradeAnim = true

	slot0.shipDetailView:DoLeveUpAnim(slot1, slot2, function ()
		if slot0 then
			slot0()
		end

		slot1.inUpgradeAnim = nil
	end)
end

function slot0.addRingDragListenter(slot0)
	slot1 = GetOrAddComponent(slot0._tf, "EventTriggerListener")
	slot2 = nil
	slot3 = 0
	slot4 = nil

	slot1:AddBeginDragFunc(function ()
		slot0 = 0
		slot1 = nil
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		if not slot0.inPaintingView then
			slot2 = slot1.position

			if not slot1 then
				slot1 = slot2
			end

			slot2 = slot2.x - slot1.x
		end
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if not slot0.inPaintingView then
			if slot1 < -50 then
				if not slot0.isLoading then
					slot0:emit(ShipMainMediator.NEXTSHIP, -1)
				end
			elseif slot1 > 50 and not slot0.isLoading then
				slot0:emit(ShipMainMediator.NEXTSHIP)
			end
		end
	end)
end

function slot0.showEnergyDesc(slot0)
	if slot0.energyTimer then
		return
	end

	setActive(slot0.energyDescTF, true)

	slot1, slot6 = slot0.shipVO:getEnergyPrint()

	setText(slot0.energyText, i18n(slot2))

	slot0.energyTimer = Timer.New(function ()
		setActive(slot0.energyDescTF, false)
		setActive.energyTimer:Stop()

		setActive.energyTimer.Stop.energyTimer = nil
	end, 2, 1)

	slot0.energyTimer:Start()
end

function slot0.displayShipWord(slot0, slot1, slot2)
	if ShipViewConst.currentPage == ShipViewConst.PAGE.EQUIPMENT or ShipViewConst.currentPage == ShipViewConst.PAGE.UPGRADE then
		rtf(slot0.chat).localScale = Vector3.New(0, 0, 1)

		return
	end

	if slot2 or not slot0.chatFlag then
		slot0.chatFlag = true
		slot0.chat.localScale = Vector3.zero

		setActive(slot0.chat, true)

		slot0.chat.localPosition = Vector3(slot0.character.localPosition.x + 100, slot0.chat.localPosition.y, 0)
		slot3 = slot0.shipVO:getIntimacy() / 100 + ((slot0.shipVO.propose and 1000) or 0)

		slot0.chat:SetAsLastSibling()

		if findTF(slot0.nowPainting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.nowPainting, "fitter"):GetChild(0), slot0.paintingCode, slot1, slot3)
		end

		slot8, slot5 = Ship.getWords(slot0.shipVO.skinId, slot1, nil, nil, slot3)

		setText(slot0.chatText, slot4)

		if CHAT_POP_STR_LEN < #slot0.chatText:GetComponent(typeof(Text)).text then
			slot6.alignment = TextAnchor.MiddleLeft
		else
			slot6.alignment = TextAnchor.MiddleCenter
		end

		if slot0.initChatBgH < slot6.preferredHeight + 120 then
			slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot7)
		else
			slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot0.initChatBgH)
		end

		slot8 = slot0

		function slot9()
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
				end)).uniqueId
			end)).uniqueId
		end

		if slot5 then
			function slot10()
				if slot0._currentVoice then
					slot0._currentVoice:Stop(true)
				end

				nil._currentVoice, slot0 = playSoundEffect(slot1)

				if slot3 then
					slot2 = long2int(slot0.length) * 0.001
				end

				slot3()
			end

			if slot0.loadedCVBankName then
				slot10()
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
				end)
			end
		else
			slot9()
		end
	end
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
	end, slot0, 1)

	slot0.chatTimer:Start()
end

function slot0.hideShipWord(slot0)
	if slot0.chatFlag then
		if slot0.chatani1Id then
			LeanTween.cancel(slot0.chatani1Id)
		end

		if slot0.chatani2Id then
			LeanTween.cancel(slot0.chatani2Id)
		end

		LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), slot0):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()
			slot0.chatFlag = nil
		end))
	end

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end
end

function slot0.gotoPage(slot0, slot1)
	if slot1 == ShipViewConst.PAGE.FASHION then
		slot0:switchToPage(slot1)
	else
		triggerToggle(slot0.togglesList[slot1], true)
	end
end

function slot0.switchToPage(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		if slot0 == ShipViewConst.PAGE.DETAIL then
			if not slot1 or not {
				slot0.detailContainer.rect.width + 200,
				0
			} then
				slot2 = {
					0,
					slot0.detailContainer.rect.width + 200
				}
			end

			shiftPanel(slot0.detailContainer, slot2[2], 0, slot1, 0):setFrom(slot2[1])
		else
			if slot0 == ShipViewConst.PAGE.EQUIPMENT then
				if not slot1 or not {
					-(slot0.equipLCon.rect.width + 190),
					190
				} then
					slot2 = {
						190,
						-(slot0.equipLCon.rect.width + 190)
					}
				end

				if not slot1 or not {
					slot0.equipRCon.rect.width,
					10
				} then
					slot3 = {
						10,
						slot0.equipRCon.rect.width
					}
				end

				shiftPanel(slot0.equipLCon, slot2[2], 0, slot1, 0):setFrom(slot2[1])
				shiftPanel(slot0.equipRCon, slot3[2], 0, slot1, 0):setFrom(slot3[1])
			else
				if slot0 == ShipViewConst.PAGE.FASHION then
					slot2 = (slot1 and {
						slot0.fashionContainer.rect.width + 150,
						0
					}) or {
						0,
						slot0.fashionContainer.rect.width + 150
					}

					shiftPanel(slot0.fashionContainer, (slot1 and ) or [2], 0, slot1, 0):setFrom((slot1 and ) or [1])
					slot0.shipFashionView:ActionInvoke("UpdateFashion")

					if not  then
						slot2 = 
					end
				else
					if slot0 == ShipViewConst.PAGE.INTENSIFY then
						if slot1 then
							slot0:emit(ShipMainMediator.OPEN_INTENSIFY)
						else
							slot0:emit(ShipMainMediator.CLOSE_INTENSIFY)
						end
					else
						if slot0 == ShipViewConst.PAGE.UPGRADE then
							if slot1 then
								slot0:emit(ShipMainMediator.ON_UPGRADE)
							else
								slot0:emit(ShipMainMediator.CLOSE_UPGRADE)
							end
						else
							if slot0 == ShipViewConst.PAGE.REMOULD then
								if slot1 then
									slot0:emit(ShipMainMediator.OPEN_REMOULD)
								else
									slot0:emit(ShipMainMediator.CLOSE_REMOULD)
								end
							end
						end
					end
				end
			end
		end

		slot0:blurPage(slot0, slot1)

		if slot0 ~= ShipViewConst.PAGE.FASHION then
			slot0.fashionSkinId = slot0.shipVO.skinId

			slot0:loadPainting(slot0.shipVO:getPainting())
		end

		if slot0.bgEffect[slot0.shipVO:getRarity()] then
			setActive(slot2, slot0 ~= ShipViewConst.PAGE.REMOULD)

			slot5 = false

			if false then
				slot5 = true
			end
		end

		setActive(slot0.helpBtn, slot0 ~= ShipViewConst.PAGE.REMOULD)

		return

		slot5 = false

		if false then
			slot5 = true
		end
	end

	function switchHandler()
		if slot0 == ShipViewConst.currentPage and slot1 then
			slot2(slot2, true)
		else
			if slot0 ~= ShipViewConst.currentPage then
				if ShipViewConst.currentPage then
					slot2(ShipViewConst.currentPage, false)
				end

				ShipViewConst.currentPage = ShipViewConst
				slot3.contextData.page = slot3.contextData

				slot2(slot2, true)
				slot3:switchPainting()
			end
		end

		return
	end

	if slot0.viewList[slot1] ~= nil then
		if not slot0.viewList[slot1]:GetLoaded() then
			slot4:Load()
			slot4:AddLoadedCallback(switchHandler)
		else
			switchHandler()
		end
	else
		switchHandler()
	end
end

function slot0.blurPage(slot0, slot1, slot2)
	slot3 = pg.UIMgr.GetInstance()

	if slot1 == ShipViewConst.PAGE.DETAIL then
		slot0.shipDetailView:ActionInvoke("OnSelected", slot2)
	else
		if slot1 == ShipViewConst.PAGE.EQUIPMENT then
			slot0.shipEquipView:ActionInvoke("OnSelected", slot2)
		else
			if slot1 == ShipViewConst.PAGE.FASHION then
				slot0.shipFashionView:ActionInvoke("OnSelected", slot2)
			else
				if slot1 == ShipViewConst.PAGE.INTENSIFY then
				else
					if slot1 == ShipViewConst.PAGE.UPGRADE then
					else
						if slot1 == ShipViewConst.PAGE.REMOULD then
						end
					end
				end
			end
		end
	end

	return
end

function slot0.switchPainting(slot0)
	slot1 = setActive
	slot2 = slot0.shipInfo

	if ShipViewConst.currentPage == ShipViewConst.PAGE.REMOULD then
		slot3 = false
	else
		slot3 = true
	end

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.shipName

	if ShipViewConst.currentPage == ShipViewConst.PAGE.REMOULD then
		slot3 = false
	else
		slot3 = true
	end

	slot1(slot2, slot3)

	if ShipViewConst.currentPage == ShipViewConst.PAGE.EQUIPMENT then
		shiftPanel(slot0.shipInfo, -20, 0, slot0, 0)

		slot0.paintingFrameName = "zhuangbei"
	else
		shiftPanel(slot0.shipInfo, -460, 0, slot0, 0)

		slot0.paintingFrameName = "chuanwu"
	end

	slot1 = GetOrAddComponent(findTF(slot0.nowPainting, "fitter"), "PaintingScaler")

	slot1:Snapshoot()

	slot1.FrameName = slot0.paintingFrameName
	slot2 = LeanTween.value(go(slot0.nowPainting), 0, 1, slot0):setOnUpdate(System.Action_float(function (slot0)
		slot0.Tween = slot0
		slot0.chat.localPosition = Vector3(slot1.character.localPosition.x + 100, slot1.chat.localPosition.y, 0)

		return
	end)):setEase(LeanTweenType.easeInOutSine)

	return
end

function slot0.setPreOrNext(slot0, slot1)
	if slot1 then
		slot0.isRight = true
	else
		slot0.isRight = false
	end

	return
end

function slot0.loadPainting(slot0, slot1, slot2)
	if slot0.isLoading == true then
		return
	end

	for slot6, slot7 in pairs(slot0.tablePainting) do
		slot7.localScale = Vector3(1, 1, 1)
	end

	if slot0.LoadShipVOId and not slot2 and slot0.LoadShipVOId == slot0.shipVO.id and slot0.LoadPaintingCode == slot1 and not slot2 then
		return
	end

	slot3 = 0

	if slot0.isRight then
		slot3 = 1800
	else
		slot3 = -1800
	end

	slot0.isLoading = true
	slot5 = slot0.paintingCode

	if slot0:getPaintingFromTable(false) then
		LeanTween.cancel(go(slot7))
		LeanTween.alphaCanvas(slot7, 0, 0.3):setFrom(1):setUseEstimatedTime(true)
		LeanTween.moveX(slot6, -slot3, 0.3):setFrom(0):setOnComplete(System.Action(function ()
			retPaintingPrefab(retPaintingPrefab, )

			retPaintingPrefab.isLoading = false

			return
		end))
	end

	slot6 = slot0:getPaintingFromTable(true)
	slot0.paintingCode = slot1

	if slot0.paintingCode and slot6 then
		slot7 = slot6:GetComponent(typeof(RectTransform))
		slot0.nowPainting = slot6
		slot8 = setPaintingPrefabAsync
		slot9 = slot6
		slot10 = slot0.paintingCode

		if not slot0.paintingFrameName then
			slot11 = "chuanwu"
		end

		slot8(slot9, slot10, slot11, function ()
			Ship.SetExpression(findTF(slot0, "fitter"):GetChild(0), slot1.paintingCode)

			return
		end)
		LeanTween.cancel(go(slot7))
		LeanTween.moveX(slot7, 0, 0.3):setFrom(slot3):setOnComplete(System.Action(function ()
			slot0.isLoading = false

			return
		end))
		LeanTween.alphaCanvas(slot8, 1, 0.3):setFrom(0):setUseEstimatedTime(true)
	end

	slot0.LoadShipVOId = slot0.shipVO.id
	slot0.LoadPaintingCode = slot1

	return
end

function slot0.getPaintingFromTable(slot0, slot1)
	if slot0.tablePainting == nil then
		print("self.tablePainting为空")

		return
	end

	for slot5 = 1, #slot0.tablePainting, 1 do
		if findTF(slot0.tablePainting[slot5], "fitter").childCount == 0 then
			if slot1 == true and slot0.tablePainting[slot5] then
				return slot0.tablePainting[slot5]
			end
		else
			if slot1 == false and slot0.tablePainting[slot5] then
				return slot0.tablePainting[slot5]
			end
		end
	end

	return
end

function slot0.loadSkinBg(slot0, slot1, slot2, slot3)
	if not slot0.bgEffect then
		slot0.bgEffect = {}
	end

	if slot0.shipSkinBg ~= slot1 or slot0.isDesign ~= slot2 then
		slot0.shipSkinBg = slot1
		slot0.isDesign = slot2

		if slot0.isDesign then
			if slot0.designBg and slot0.designName ~= "raritydesign" .. slot0.shipVO:getRarity() then
				PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)

				slot0.designBg = nil
			end

			if not slot0.designBg then
				PoolMgr.GetInstance():GetUI("raritydesign" .. slot0.shipVO:getRarity(), true, function (slot0)
					slot0.designBg = slot0
					slot0.designName = "raritydesign" .. slot0.shipVO:getRarity()

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
				setActive(slot0.designBg, false)
			end

			for slot7 = 1, 5, 1 do
				slot8 = slot0.shipVO:getRarity()

				if slot0.bgEffect[slot7] then
					slot9 = setActive
					slot10 = slot0.bgEffect[slot7]

					if slot7 == slot8 and ShipViewConst.currentPage ~= ShipViewConst.PAGE.REMOULD then
						slot11 = not slot3
					else
						slot11 = false

						if false then
							slot11 = true
						end
					end

					slot9(slot10, slot11)
				else
					if slot8 > 2 and slot8 == slot7 and not slot3 then
						PoolMgr.GetInstance():GetUI("al_bg02_" .. slot8 - 1, true, function (slot0)
							slot0.bgEffect[] = slot0

							slot0.transform:SetParent(slot0._tf, false)

							slot0.transform.localPosition = Vector3(0, 0, 0)
							slot0.transform.localScale = Vector3(1, 1, 1)

							slot0.transform:SetSiblingIndex(1)

							slot1 = setActive
							slot2 = slot0

							if ShipViewConst.currentPage == ShipViewConst.PAGE.REMOULD then
								slot3 = false
							else
								slot3 = true
							end

							slot1(slot2, slot3)

							return
						end)
					end
				end
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
	slot0.character:GetComponent("Image").enabled = false
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

	for slot8 = 1, tf(pg.UIMgr.GetInstance().OverlayMain).childCount, 1 do
		if slot4:GetChild(slot8 - 1).gameObject.activeSelf then
			slot1[#slot1 + 1] = slot9

			setActive(slot9, false)
		end
	end

	slot1[#slot1 + 1] = slot0.chat

	openPortrait()
	setActive(slot0.common, false)

	slot0.mainMask.enabled = false

	slot0.mainMask:PerformClipping()

	slot6 = slot0.nowPainting.anchoredPosition.x
	slot7 = slot0.nowPainting.anchoredPosition.y
	slot10 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot11 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot12 = slot0.nowPainting.rect.width / 2
	slot13 = slot0.nowPainting.rect.height / 2
	slot14, slot15 = nil

	GetOrAddComponent(slot0.background, "MultiTouchZoom").SetZoomTarget(slot16, slot0.nowPainting)

	slot17 = GetOrAddComponent(slot0.background, "EventTriggerListener")
	slot18 = true
	slot19 = false

	slot17:AddPointDownFunc(function (slot0)
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
	slot17:AddPointUpFunc(function (slot0)
		if Input.touchCount <= 2 then
			slot0 = true
		end

		return
	end)
	slot17:AddBeginDragFunc(function (slot0, slot1)
		slot0 = false
		slot5 = slot1.position.x *  - slot1.position.x - tf(slot4.nowPainting).localPosition.x.position.y * slot6 - slot7 - tf(slot4.nowPainting.nowPainting).localPosition.y

		return
	end)
	slot17:AddDragFunc(function (slot0, slot1)
		if slot0 then
			tf(slot1.nowPainting).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
		end

		return
	end)
	onButton(slot0, slot0.background, function ()
		slot0:hidePaintView()

		return
	end, SFX_CANCEL)

	function slot0.hidePaintView(slot0, slot1)
		if not slot1 and not slot0 then
			return
		end

		slot0.character:GetComponent("Image").enabled = true
		Input.multiTouchEnabled = false

		setActive(slot0.common, true)
		SwitchPanel(slot0.shipInfo, -460, nil, slot1 * 2)

		SwitchPanel.enabled = false
		false.enabled = false

		for slot5, slot6 in ipairs(slot4) do
			setActive(slot6, true)
		end

		closePortrait()

		slot0.nowPainting.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(slot0.nowPainting, {
			x = 1,
			y = 1
		})

		slot0.background:GetComponent("Button").enabled = false
		slot0.nowPainting:GetComponent("CanvasGroup").blocksRaycasts = true
		slot0.mainMask.enabled = true

		slot0.mainMask:PerformClipping()

		slot0.inPaintingView = false

		return
	end

	SwitchPanel(slot0.shipInfo, slot2, nil, slot1 * 2):setOnComplete(System.Action(function ()
		slot0.enabled = true
		true.enabled = true
		slot2.background:GetComponent("Button").enabled = true
		slot2.nowPainting:GetComponent("CanvasGroup").blocksRaycasts = false

		return
	end))

	return
end

function slot0.onBackPressed(slot0)
	if slot0.inUpgradeAnim then
		return
	end

	if slot0.awakenPlay then
		return
	end

	if slot0.shipChangeNameView.isOpenRenamePanel then
		slot0.shipChangeNameView:ActionInvoke("DisplayRenamePanel", false)

		return
	end

	if slot0.shipCustomMsgBox.isShowCustomMsgBox then
		slot0.shipCustomMsgBox:ActionInvoke("hideCustomMsgBox")

		return
	end

	if slot0.shipHuntingRangeView.onSelected then
		slot0.shipHuntingRangeView:ActionInvoke("HideHuntingRange")

		return
	end

	if slot0.inPaintingView then
		slot0:hidePaintView(true)

		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0:findTF("top/back_btn", slot0.common))

	return
end

function slot0.willExit(slot0)
	Input.multiTouchEnabled = true

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.chat, slot0.character)
	slot0:blurPage(ShipViewConst.currentPage)
	setActive(slot0.background, false)

	if slot0.designBg then
		PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)
	end

	slot0.intensifyToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	slot0.upgradeToggle:GetComponent("Toggle").onValueChanged:RemoveAllListeners()
	LeanTween.cancel(slot0.chat.gameObject)

	if slot0.paintingCode then
		for slot4 = 1, #slot0.tablePainting, 1 do
			if LeanTween.isTweening(go(slot0.tablePainting[slot4])) then
				LeanTween.cancel(go(slot5))
			end
		end

		retPaintingPrefab(slot0.nowPainting, slot0.paintingCode)
	end

	slot0.shipDetailView:Destroy()
	slot0.shipFashionView:Destroy()
	slot0.shipEquipView:Destroy()
	slot0.shipHuntingRangeView:Destroy()
	slot0.shipCustomMsgBox:Destroy()
	slot0.shipChangeNameView:Destroy()
	clearImageSprite(slot0.background)

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
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

	cameraPaintViewAdjust(false)

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.scrollTxt then
		slot0.scrollTxt:destroy()
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)

	slot0.shareData = nil

	return
end

return slot0
