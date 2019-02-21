slot0 = class("ShipProfileScene", import("..base.BaseUI"))
slot0.SHOW_SKILL_INFO = "event show skill info"
slot0.SHOW_EVALUATION = "event show evalution"
slot0.WEDDING_REVIEW = "ShipInfoMediator:WEDDING_REVIEW"
slot0.INDEX_DETAIL = 1
slot0.INDEX_PROFILE = 2
slot0.INDEX_ARCHIVE = 3
slot1 = 0.35
slot2 = 19.8
slot0.CHAT_SHOW_TIME = 3
slot0.CHAT_ANIMATION_TIME = 0.3
slot3 = {}

for slot7, slot8 in pairs(pg.character_voice) do
	slot3[#slot3 + 1] = setmetatable({}, {
		__index = slot8
	})
end

table.sort(slot3, function (slot0, slot1)
	return slot0.profile_index < slot1.profile_index
end)

function slot0.getUIName(slot0)
	return "ShipProfileUI"
end

function slot0.preload(slot0, slot1)
	slot5 = getProxy(CollectionProxy).getShipGroup(slot2, slot0.contextData.groupId).groupConfig
	slot6 = getProxy(CollectionProxy).getShipGroup(slot2, slot0.contextData.groupId).shipConfig.rarity

	if slot0.contextData.showTrans and slot3.trans then
		slot6 = slot6 + 1
	end

	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. ((slot3:isBluePrintGroup() and "1") or "") .. shipRarity2bgPrint(slot6, slot0.contextData.groupId * 10 + ((slot0.contextData.showTrans and slot3.trans and 9) or 0)), "", slot1)
end

function slot0.reloadCVKey(slot0)
	slot0.currentSkin = slot0.groupSkinList[1]
	slot0.currentSkinWord = pg.ship_skin_words[slot0.currentSkin.id]

	if slot0.currentSkinWord.voice_key >= 0 then
		slot1 = Ship.getCVKeyID(slot0.currentSkin.id)

		function slot2()
			if slot1.exited then
				pg.CriMgr.UnloadCVBank(slot0)
				pg.CriMgr.UnloadCVBank(slot1)
			else
				slot1.loadedCVBankName = slot0
				slot1.loadedCVBattleBankName = slot1
			end
		end

		if slot0.loadedCVBankName then
			pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

			slot0.loadedCVBankName = nil
		end

		if slot0.loadedCVBattleBankName then
			pg.CriMgr.UnloadCVBank(slot0.loadedCVBattleBankName)

			slot0.loadedCVBattleBankName = nil
		end

		pg.CriMgr:LoadCV(slot1, slot2)
		pg.CriMgr:LoadBattleCV(slot1, slot2)
	end
end

function slot0.setShipGroup(slot0, slot1)
	slot0.shipGroup = slot1
	slot0.groupSkinList = ShipGroup.getSkinList(slot0.shipGroup.id)

	for slot5 = #slot0.groupSkinList, 1, -1 do
		if slot0.groupSkinList[slot5].skin_type == 3 then
			table.remove(slot0.groupSkinList, slot5)
		end
	end

	slot0:reloadCVKey()
end

function slot0.setShowTrans(slot0, slot1)
	slot0.showTrans = slot1
end

function slot0.setOwnedSkinList(slot0, slot1)
	slot0.ownedSkinList = slot1
end

function slot0.flushHearts(slot0)
	SetActive(slot0.labelHeartplus, slot0.shipGroup.hearts > 999)
	setText(slot0.labelHeart, (slot1 > 999 and "999") or slot1)

	slot0.labelHeart:GetComponent("Text").color = (slot0.shipGroup.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)

	setActive(slot0:findTF("unlike", slot0.btnLike), not slot0.shipGroup.iheart)
	setActive(slot0:findTF("like", slot0.btnLike), slot0.shipGroup.iheart)
end

function slot0.init(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.painting = slot0:findTF("paint")
	slot0.chat = slot0:findTF("chat", slot0.painting)
	slot0.chatBg = slot0:findTF("chatbgtop", slot0.chat)
	slot0.initChatBgH = slot0.chatBg.sizeDelta.y
	slot0.chatText = slot0:findTF("Text", slot0.chatBg)
	slot0.chat.localScale = Vector3(0, 0)

	setActive(slot0.chat, false)

	slot0.name = slot0:findTF("name")
	slot0.labelName = slot0:findTF("Text", slot0.name)
	slot0.labelEnName = slot0:findTF("english_name", slot0.name)
	slot0.shipType = slot0:findTF("ship_type/type", slot0.name)
	slot0.stars = slot0:findTF("stars", slot0.name)
	slot0.star = slot0:findTF("star_tpl", slot0.stars)
	slot0.btnBack = slot0:findTF("top/back")
	slot0.leftProfile = slot0:findTF("profile_left_panel")
	slot0.profile = slot0:findTF("profile_panel")

	setText(slot0:findTF("bg/lines_panel/title/label_common/GameObject", slot0.profile), i18n("ship_profile_label_common"))
	setText(slot0:findTF("bg/lines_panel/title/label_diff/GameObject", slot0.profile), i18n("ship_profile_label_diff"))

	slot0.live2dBtn = slot0:findTF("L2D_btn")
	slot0.live2dToggle = slot0.live2dBtn:Find("toggle")
	slot0.live2dState = slot0.live2dBtn:Find("state")
	slot0.toggles = {
		slot0:findTF("bottom/detail"),
		slot0:findTF("bottom/profile"),
		slot0:findTF("bottom/archive")
	}
	slot0.toggleInits = {
		"initDetail",
		"initProfile",
		"initArchive"
	}

	setActive(slot0.star, false)

	slot0.top = slot0:findTF("top")
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.top, {
		y = 83
	})
	shiftPanel(slot0.top, nil, 0, slot2, slot1, true, true)

	slot0.tweens = topAnimation(slot0:findTF("bg/left", slot0.top), slot0:findTF("bg/right", slot0.top), slot0:findTF("bg/title_data", slot0.top), slot0:findTF("bg/profile", slot0.top), 0.3, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.top, nil, 83, 0.3, 0, true, true)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()
	onButton(slot0, slot0.btnBack, function ()
		slot0:uiExitAnimating()
		slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.3)
	end, SFX_CANCEL)

	for slot4, slot5 in ipairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 ~= 2 then
				slot1:switchLive2d(false)
			end

			if slot0 >= 3 and slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
				triggerToggle(slot1.toggles[1], true)

				return
			end

			if slot0 then
				if slot1.toggleInits[slot0] then
					slot1[slot1.toggleInits[slot0]](slot1[slot1.toggleInits[slot0]])

					slot1[slot1.toggleInits[slot0]].toggleInits[slot0] = nil
				end

				slot1:switchTo(slot0)
			end
		end, SFX_PANEL)
	end

	slot0:initCommon()
	triggerToggle(slot0.toggles[1], true)
	slot0:switchLive2d(false)
end

function slot0.onBackPressed(slot0)
	if LeanTween.isTweening(go(slot0.painting)) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if slot0.paintPreview then
		slot0:hidePaintView(true)

		return
	end

	triggerButton(slot0.btnBack)
end

function slot0.switchLive2d(slot0, slot1)
	slot0.l2dIsOn = slot1
	slot2 = "live2d/" .. slot0.paintingName

	if Live2DUpdateMgr.Inst.state == DownloadState.None or slot4 == DownloadState.CheckFailure then
		slot3:CheckD()
	end

	if slot3:CheckF(slot2) == DownloadState.CheckToUpdate or slot5 == DownloadState.UpdateFailure then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dState, false)
		setActive(slot0.live2dToggle, true)
		setActive(slot0.live2dToggle:Find("on"), false)
		setActive(slot0.live2dToggle:Find("off"), true)
		onButton(slot0, slot0.live2dBtn, function ()
			slot0:UpdateF(slot0, true)
		end, SFX_PANEL)
	elseif slot5 == DownloadState.Updating then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dToggle, false)
		setActive(slot0.live2dState, true)
		removeOnButton(slot0.live2dBtn)
	else
		setActive(slot0.live2dBtn, PathMgr.FileExists(PathMgr.getAssetBundle(slot2)))

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot2)) then
			slot0.live2dChecked = slot1

			setActive(slot0.live2dState, false)
			setActive(slot0.live2dToggle, true)
			setActive(slot0.live2dToggle:Find("on"), slot0.live2dChecked)
			setActive(slot0.live2dToggle:Find("off"), not slot0.live2dChecked)
			setActive(slot0:findTF("view_btn", slot0.profile), not slot0.live2dChecked)

			if slot0.live2dChecked then
				slot0:createLive2D(slot0.paintingName)
			else
				slot0:hideLive2D()
			end

			onButton(slot0, slot0.live2dBtn, function ()
				slot0:switchLive2d(not slot0.live2dChecked)
				slot0.switchLive2d:switchVoiceList(slot0.live2dChecked)
			end, SFX_PANEL)
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot5 == DownloadState.CheckToUpdate or slot5 == DownloadState.UpdateFailure or slot5 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			slot0:switchLive2d((slot0:CheckF(slot0) == DownloadState.UpdateSuccess and true) or slot3)
		end, 0.5, 1)

		slot0.live2dTimer:Start()
	end
end

function slot0.switchTo(slot0, slot1)
	if slot0.index ~= slot1 then
		if slot1 == slot0.INDEX_DETAIL then
			LeanTween.moveX(rtf(slot0.detailLeft), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.detailRight), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.profile), 680, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.leftProfile), -265, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveY(rtf(slot0.live2dBtn), -70, slot1):setEase(LeanTweenType.easeInOutSine)
		end

		if slot1 == slot0.INDEX_PROFILE then
			LeanTween.moveX(rtf(slot0.profile), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.leftProfile), 0, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveX(rtf(slot0.detailRight), 680, slot1):setEase(LeanTweenType.easeInOutSine)
			LeanTween.moveY(rtf(slot0.live2dBtn), 60, slot1):setEase(LeanTweenType.easeInOutSine)
		end

		slot0.index = slot1
	end
end

function slot0.initCommon(slot0)
	slot0:loadSkinBg(shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot0.shipGroup.id * 10))

	slot0.paintingName = slot0.shipGroup:getPainting(slot0.showTrans)
	slot0.live2dOffset = BuildVector3(pg.ship_skin_template[slot0.shipGroup.id * 10 + ((slot0.showTrans and 9) or 0)].live2d_offset)

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "chuanwu")
	setImageSprite(slot0.shipType, GetSpriteFromAtlas("shiptype", slot0.shipGroup:getShipType(slot0.showTrans)))
	setText(slot0.labelName, slot0.shipGroup:getName(slot0.showTrans))
	setText(slot0.labelEnName, slot0.shipGroup.shipConfig.english_name)

	for slot8 = 1, slot1.star, 1 do
		cloneTplTo(slot0.star, slot0.stars)
	end
end

function slot0.initDetail(slot0)
	slot0.detailLeft = slot0:findTF("detail_left_panel")
	slot0.lockBtn = slot0:findTF("lock_btn", slot0.detailLeft)
	slot0.unlockBtn = slot0:findTF("unlock_btn", slot0.detailLeft)
	slot0.labelHeart = slot0:findTF("heart/label/heart", slot0.detailLeft)
	slot0.labelHeartplus = slot0:findTF("heart/label/heart+", slot0.detailLeft)
	slot0.btnLike = slot0:findTF("heart/btnLike", slot0.detailLeft)
	slot0.detailRight = slot0:findTF("detail_right_panel")
	slot0.viewBtn = slot0:findTF("view_btn", slot0.detailRight)
	slot0.evaBtn = slot0:findTF("eva_btn", slot0.detailRight)
	slot0.shareBtn = slot0:findTF("share_btn", slot0.detailRight)
	slot0.skillContainer = slot0:findTF("bg/skill_panel/frame/skill_list/viewport/content", slot0.detailRight)
	slot0.skillTpl = slot0:getTpl("bg/skill_panel/frame/skilltpl", slot0.detailRight)
	slot0.emptyTpl = slot0:getTpl("bg/skill_panel/frame/emptytpl", slot0.detailRight)
	slot0.addTpl = slot0:getTpl("bg/skill_panel/frame/addtpl", slot0.detailRight)

	slot0:flushHearts()
	slot0:initSkills()

	slot0.propertyPanel = PropertyPanel.New(slot0.detailRight:Find("bg/property_panel/frame"))

	if slot0.showTrans and slot0.shipGroup.trans then
		slot0.propertyPanel:initRadar(slot0.shipGroup.groupConfig.trans_radar_chart)
	else
		slot0.propertyPanel:initProperty(slot0.shipGroup.shipConfig.id)
	end

	setActive(slot0.evaBtn, not slot0.showTrans)
	onButton(slot0, slot0.viewBtn, function ()
		slot0:paintView()
	end, SFX_PANEL)
	onButton(slot0, slot0.evaBtn, function ()
		slot0:emit(slot1.SHOW_EVALUATION)
	end, SFX_PANEL)
	onButton(slot0, slot0.shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeShipProfile)
	end, SFX_PANEL)
end

function slot0.initSkills(slot0)
	slot2 = 0
	slot3 = Clone(pg.ship_data_template[slot0.shipGroup:getShipConfigId(slot0.showTrans)].buff_list_display)

	if not slot0.showTrans then
		_.each(slot0.shipGroup.groupConfig.trans_skill, function (slot0)
			table.removebyvalue(slot0, slot0)
		end)
	end

	for slot7, slot8 in ipairs(slot3) do
		onButton(slot0, slot10, function ()
			slot0:emit(slot1.SHOW_SKILL_INFO, slot2.id, {
				id = slot2.id,
				level = pg.skill_data_template[slot2.id].max_level
			})
		end, SFX_PANEL)

		slot2 = slot2 + 1

		LoadImageSpriteAsync("skillicon/" .. getSkillConfig(slot8).icon, findTF(cloneTplTo(slot0.skillTpl, slot0.skillContainer), "icon"))
	end

	for slot7 = 1, 3 - slot2, 1 do
		cloneTplTo(slot0.addTpl, slot0.skillContainer)
	end

	if slot2 > 3 then
		slot0.skillContainer.pivot = Vector2.New(0, 1)
		slot0.skillContainer.anchoredPosition = Vector2.zero
	end
end

function slot0.paintView(slot0)
	slot1 = {}
	slot2 = slot0._tf.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0._tf:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0.painting and slot4 ~= slot0.bg then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	slot0.painting:GetComponent("CanvasGroup").blocksRaycasts = false
	slot5 = slot0.painting.anchoredPosition.x
	slot6 = slot0.painting.anchoredPosition.y
	slot9 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot10 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot11 = slot0.painting.rect.width / 2
	slot12 = slot0.painting.rect.height / 2
	slot14 = slot0.painting:Find("fitter"):GetChild(0)

	LeanTween.moveX(slot0.painting, 0, 0.3):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function ()
		openPortrait()

		slot1 = false
		slot2, slot3 = nil
		slot4 = GetOrAddComponent(slot0.bg, "MultiTouchZoom")

		slot4:SetZoomTarget(slot0.painting)

		slot5 = GetOrAddComponent(slot0.bg, "EventTriggerListener")
		slot0.dragTrigger = slot5
		slot4.enabled = true
		slot5.enabled = true

		slot5:AddPointDownFunc(function (slot0)
			if Input.touchCount == 1 or Application.isEditor then
				slot0 = true
				slot1 = true
			elseif Input.touchCount >= 2 then
				slot1 = false
				slot0 = false
			end
		end)
		slot5:AddPointUpFunc(function (slot0)
			if Input.touchCount <= 2 then
				slot0 = true
			end
		end)
		slot5:AddBeginDragFunc(function (slot0, slot1)
			slot0 = false
			slot5 = slot1.position.x *  - slot1.position.x - tf(slot4.painting).localPosition.x.position.y * slot6 - slot7 - tf(slot4.painting.painting).localPosition.y
		end)
		slot5:AddDragFunc(function (slot0, slot1)
			if slot0 then
				tf(slot1.painting).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
			end
		end)

		slot0.bg:GetComponent("Button").enabled = true

		onButton(slot0, slot0.bg, function ()
			slot0:hidePaintView()
		end, SFX_CANCEL)

		function slot5.hidePaintView(slot0, slot1)
			if not slot1 and not slot0 then
				return
			end

			slot1.enabled = false
			slot1.enabled = false

			for slot5, slot6 in ipairs(false) do
				setActive(slot6, true)
			end

			closePortrait()

			slot0.painting.localScale = Vector3(1, 1, 1)

			setAnchoredPosition(slot0.painting, {
				x = slot4,
				y = slot4
			})

			slot0.bg:GetComponent("Button").enabled = false
			slot6.blocksRaycasts = true
			slot0.paintPreview = false
		end
	end))

	slot0.paintPreview = true
end

function slot0.initProfile(slot0)
	slot0.authorPanel = slot0:findTF("bg/author_panel", slot0.profile)
	slot0.linesPanel = slot0:findTF("bg/lines_panel", slot0.profile)
	slot0.prototypePanel = slot0:findTF("bg/prototype_panel", slot0.profile)

	setActive(slot0.chat, true)

	slot0.chat.localScale = Vector3(0, 0)
	slot0.voiceTpl = slot0:getTpl("frame/lines_list/lines_tpl", slot0.linesPanel)
	slot0.voiceContainer = slot0:findTF("frame/lines_list/Grid", slot0.linesPanel)
	slot0.voiceScroll = slot0:findTF("frame/lines_list", slot0.linesPanel).gameObject:GetComponent(typeof(ScrollRect))
	slot1 = 1

	if slot0.showTrans then
		slot2 = ShipGroup.getModSkin(slot0.shipGroup.id).id

		for slot6, slot7 in ipairs(slot0.groupSkinList) do
			if slot7.id == slot2 then
				slot1 = slot6

				break
			end
		end
	end

	setText(slot0:findTF("bg/author_panel/illustrator/Text", slot0.profile), Nation.Nation2facionName(slot2) .. "-" .. Nation.Nation2Name(slot0.shipGroup.shipConfig.nationality))
	slot0:shiftSkin(slot1)
	slot0:setProfileInfo()

	slot0.skinList = slot0:findTF("skin_container", slot0.leftProfile)

	if #slot0.groupSkinList == 1 or slot0.showTrans then
		setActive(slot0.skinList, false)
	else
		setActive(slot0.skinList, true)

		slot3 = slot0:getTpl("skin_tpl", slot0.skinList)

		for slot7, slot8 in ipairs(slot0.groupSkinList) do
			slot10 = ScrollTxt.New(findTF(slot9, "mask"), findTF(cloneTplTo(slot3, slot0.skinList), "mask/Text"))

			if slot8.skin_type == Ship.SKIN_TYPE_DEFAULT or table.contains(slot0.ownedSkinList, slot8.id) or (slot8.skin_type == Ship.SKIN_TYPE_REMAKE and slot0.shipGroup.trans) or (slot8.skin_type == Ship.SKIN_TYPE_PROPOSE and slot0.shipGroup.married == 1) then
				slot10:setText(HXSet.hxLan(slot8.name))
				onButton(slot0, slot9, function ()
					slot0:shiftSkin(slot0)
				end)
			else
				slot10:setText(HXSet.hxLan(slot8.name))
				onButton(slot0, slot9, function ()
					pg.TipsMgr:GetInstance():ShowTips(i18n("ship_profile_skin_locked"))
				end)
			end
		end
	end

	slot3 = slot0:findTF("bg/wedding", slot0.profile)

	if slot0.shipGroup.married == 1 then
		setActive(slot3, true)
		onButton(slot0, slot3, function ()
			slot0:emit(slot1.WEDDING_REVIEW, {
				groupID = slot0.shipGroup.id,
				skinID = slot0.currentSkin.id
			})
		end)
	elseif slot0.shipGroup.married == 0 then
		setActive(slot3, false)
	end

	onButton(slot0, slot0:findTF("view_btn", slot0.profile), function ()
		slot0:paintView()
	end, SFX_PANEL)

	if not slot0.showTrans then
		onButton(slot0, slot0:findTF("eva_btn", slot0.profile), function ()
			slot0:emit(slot1.SHOW_EVALUATION)
		end, SFX_PANEL)
	end

	setActive(slot0:findTF("eva_btn", slot0.profile), not slot0.showTrans)
	onButton(slot0, slot0:findTF("share_btn", slot0.profile), function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeShipProfile)
	end, SFX_PANEL)

	slot0.languageChangeTF = slot0:findTF("bg/language_change", slot0.profile)
	slot0.languageBtnCH = slot0:findTF("btn_ch", slot0.languageChangeTF)
	slot0.languageBtnJP = slot0:findTF("btn_jp", slot0.languageChangeTF)
	slot5 = pg.ship_skin_words[slot0.currentSkin.id / 10 * 10].voice_key

	if pg.ship_skin_words[slot0.currentSkin.id / 10 * 10].voice_key_2 >= 0 or slot4 == -2 then
		slot0.languageType = PlayerPrefs.GetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group)

		if slot0.languageType == 0 and slot4 > 0 then
			slot0.languageType = pg.gameset.language_default.key_value

			PlayerPrefs.SetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group, slot0.languageType)
		end

		setActive(slot0.languageBtnJP, slot0.languageType ~= 2)
		setActive(slot0.languageBtnCH, slot0.languageType == 2)
	else
		setActive(slot0.languageBtnCH, false)
		setActive(slot0.languageBtnJP, false)
	end

	onButton(slot0, slot0.languageBtnCH, function ()
		if slot0 < 0 then
			pg.TipsMgr:GetInstance():ShowTips("敬请期待！")

			return
		end

		PlayerPrefs.SetInt("CV_LANGUAGE_" .. slot1.currentSkin.ship_group, 1)

		"CV_LANGUAGE_" .. slot1.currentSkin.ship_group.languageType = 1

		setActive(1.languageBtnCH, false)
		setActive(1.languageBtnCH.languageBtnJP, true)
		1.languageBtnCH.languageBtnJP:reloadCVKey()
		1.languageBtnCH.languageBtnJP.setAuthorInfo(slot1, (slot1.languageType == 2 and slot1.currentSkin.voice_actor_2) or slot1.currentSkin.voice_actor, slot1.currentSkin.illustrator)
	end, SFX_PANEL)
	onButton(slot0, slot0.languageBtnJP, function ()
		if slot0 < 0 then
			pg.TipsMgr:GetInstance():ShowTips("敬请期待！")

			return
		end

		PlayerPrefs.SetInt("CV_LANGUAGE_" .. slot1.currentSkin.ship_group, 2)

		"CV_LANGUAGE_" .. slot1.currentSkin.ship_group.languageType = 2

		setActive(2.languageBtnCH, true)
		setActive(2.languageBtnCH.languageBtnJP, false)
		2.languageBtnCH.languageBtnJP:reloadCVKey()
		2.languageBtnCH.languageBtnJP.setAuthorInfo(slot1, (slot1.languageType == 2 and slot1.currentSkin.voice_actor_2) or slot1.currentSkin.voice_actor, slot1.currentSkin.illustrator)
	end, SFX_PANEL)
end

function slot0.shiftSkin(slot0, slot1)
	slot0.languageType = PlayerPrefs.GetInt("CV_LANGUAGE_" .. slot0.currentSkin.ship_group)

	slot0:hideLive2D()

	slot0.currentSkin = slot0.groupSkinList[slot1]
	slot0.currentSkinWord = pg.ship_skin_words[slot0.currentSkin.id]

	slot0:setAuthorInfo((slot0.languageType == 2 and slot0.currentSkin.voice_actor_2) or slot0.currentSkin.voice_actor, slot0.currentSkin.illustrator)
	slot0:switchVoiceList(false)
	slot0:loadModel()
	slot0:shiftPainting()
	slot0:loadSkinBg((slot0.currentSkin.bg and #slot0.currentSkin.bg > 0 and slot0.currentSkin.bg) or shipRarity2bgPrint(slot0.shipGroup:getRarity(slot0.showTrans), slot0.currentSkin.id))
	slot0:switchLive2d(false)
end

function slot0.switchVoiceList(slot0, slot1)
	removeAllChildren(slot0.voiceContainer)

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	if slot1 then
		for slot5, slot6 in ipairs(pg.AssistantInfo.action2Words) do
			if pg.character_voice[slot6] and not pg.AssistantInfo.isDisableSpecialClick(slot6) then
				slot0:appendVoiceButton(pg.character_voice[slot6], true)
			end
		end

		setText(slot0:findTF("bg/lines_panel/title/Text", slot0.profile), i18n("ship_profile_action_words"))
	else
		for slot5, slot6 in ipairs(slot0) do
			if not pg.AssistantInfo.isDisableSpecialClick(slot6.key) then
				slot0:appendVoiceButton(slot6, false)
			end
		end

		setText(slot0:findTF("bg/lines_panel/title/Text", slot0.profile), i18n("ship_profile_words"))
	end

	slot0.voiceScroll.enabled = false
	slot0.voiceScroll.enabled = true

	LeanTween.cancel(slot0.chat.gameObject)

	slot0.chat.localScale = Vector3(0, 0)
end

function slot0.loadSkinBg(slot0, slot1)
	slot0.isDesign = slot0.shipGroup:isBluePrintGroup()

	if slot0.shipSkinBg ~= slot1 then
		slot0.shipSkinBg = slot1

		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. ((slot0.isDesign and "1") or "") .. slot1, "", function (slot0)
			if not slot0.exited and slot0.shipSkinBg ==  then
				setImageSprite(slot0.bg, slot0)
			end
		end)

		if slot0.isDesign then
			if not slot0.designBg then
				PoolMgr.GetInstance():GetUI("raritydesign5", true, function (slot0)
					slot0.designBg = slot0

					slot0.transform:SetParent(slot0.bg, false)

					slot0.transform.localScale = Vector3(1, 1, 1)
					slot0.transform.localPosition = Vector3(0, 0, 0)

					setActive(slot0, true)
				end)
			else
				setActive(slot0.designBg, true)
			end
		elseif slot0.designBg then
			setActive(slot0.designBg, slot0.isDesign)
		end
	end
end

function slot0.shiftPainting(slot0)
	if slot0.currentSkin.painting == slot0.paintingName then
		return
	end

	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)
	end

	slot0.paintingName = slot0.currentSkin.painting
	slot0.live2dOffset = BuildVector3(slot0.currentSkin.live2d_offset)

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "chuanwu")
end

function slot0.loadModel(slot0)
	slot1 = slot0:findTF("model", slot0.leftProfile)

	if not IsNil(slot0.characterModel) then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.modelName, slot0.characterModel)
	end

	PoolMgr.GetInstance():GetSpineChar(slot0.currentSkin.prefab, true, function (slot0)
		slot0.name = slot0
		slot0.transform.localPosition = Vector3.zero
		slot0.transform.localScale = Vector3(0.4, 0.4, 1)

		slot0.transform:SetParent(slot0.transform.SetParent, false)
		slot0:GetComponent(typeof(SpineAnimUI)).SetAction(slot2, slot2.currentSkin.show_skin or "stand", true)

		slot2.characterModel = slot0
		slot2.modelName = slot0
	end)
end

function slot0.setAuthorInfo(slot0, slot1, slot2, slot3)
	slot4 = nil

	setText(slot0:findTF("cv/Text", slot0.authorPanel), (slot1 == -1 and "-") or pg.voice_actor_CN[slot1].actor_name)
end

function slot0.setProfileInfo(slot0)
	slot5, slot2 = Ship.getWords(slot0.currentSkin.id, "profile")

	setText(slot0:findTF("frame/description/desc/Text", slot0.prototypePanel), slot1)

	slot3 = slot0:findTF("playButton", slot0.prototypePanel)

	if slot0.currentSkinWord.voice_key >= 0 then
		setActive(slot3, true)
		onButton(slot0, slot3, function ()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			slot2, slot4 = Ship.getWords(slot0.currentSkin.id, "profile")
			slot0._currentVoice = playSoundEffect(slot1)
		end)
	else
		setActive(slot3, false)
	end
end

slot0.CONDITION_FORBIDDEN = -1
slot0.CONDITION_CLEAR = 0
slot0.CONDITION_INTIMACY = 1
slot0.CONDITION_MARRIED = 2

function slot0.voiceReplayCodition(slot0, slot1)
	slot2 = true
	slot3 = ""

	if slot0.shipGroup:isBluePrintGroup() and not table.contains(getProxy(TechnologyProxy):getBluePrintById(slot0.shipGroup.id).getUnlockVoices(slot4), slot1.key) and slot4:getUnlockLevel(slot1.key) > 0 then
		return false, i18n("ship_profile_voice_locked_design", slot6)
	end

	if slot1.unlock_condition[1] == slot0.CONDITION_INTIMACY then
		if slot0.shipGroup.maxIntimacy < slot1.unlock_condition[2] then
			slot2 = false
			slot3 = i18n("ship_profile_voice_locked_intimacy", math.floor(slot1.unlock_condition[2] / 100))
		end
	elseif slot1.unlock_condition[1] == slot0.CONDITION_MARRIED and slot0.shipGroup.married == 0 then
		slot2 = false
		slot3 = i18n("ship_profile_voice_locked_propose")
	end

	return slot2, slot3
end

function slot0.appendVoiceButton(slot0, slot1, slot2)
	slot4 = Ship.getWords(slot0.currentSkin.id, slot3)

	if slot1.unlock_condition[1] < 0 then
		return
	end

	slot5 = Ship.getOriginalSkinId(slot0.currentSkin.id)
	slot6, slot7 = nil

	if string.find(slot3, "main") then
		if string.split(slot0.currentSkinWord.main, "|")[tonumber(string.split(slot3, "main")[1])] == nil then
			return
		end
	elseif slot4 == nil and not slot2 then
		return
	end

	setActive(slot8, true)

	slot9, slot10 = slot0:voiceReplayCodition(slot1)

	if slot9 then
		setText(slot0:findTF("Text", slot8), slot1.voice_name)
	else
		setText(slot0:findTF("Text", slot8), "???")
	end

	setActive(slot0:findTF("tag_common", slot8), true)

	slot11 = slot0:findTF("tag_diff", slot8)

	if slot5 ~= slot0.currentSkin.id and ((slot0.currentSkinWord[slot3] ~= "" and slot0.currentSkinWord[slot3] ~= nil) or (string.find(slot3, "main") and slot7 ~= "nil")) then
		setActive(slot11, true)
	else
		setActive(slot11, false)
	end

	onButton(slot0, slot8, function ()
		if slot0 then
			if slot1._currentVoice then
				slot1._currentVoice:Stop(true)
			end

			if slot2 == "headtouch" and slot3 == nil then
				LeanTween.cancel(slot1.chat.gameObject)

				slot1.chat.localScale = Vector3(0, 0)
			else
				slot1:showChat(slot2, slot4)
			end

			if slot1.characterModel then
				slot0 = nil

				slot1.characterModel:GetComponent(typeof(SpineAnimUI)):SetAction((slot5.spine_action == "" and "stand") or slot5.spine_action, 0)
			end

			if slot1.live2dChecked and slot1.l2dChar then
				slot1.l2dChar:SetAction(pg.AssistantInfo.action2Id[slot5.l2d_action])
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(slot6)
		end
	end)
end

function slot0.showChat(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6 = nil

	if slot2 then
		if findTF(slot0.painting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingName, "main_" .. slot2)
		end

		slot3, slot4 = Ship.getWords(slot0.currentSkin.id, "main", slot2)
		slot5 = Ship.getCVCalibrate(slot0.currentSkin.id, "main", slot2)
		slot6 = Ship.getL2dSoundEffect(slot0.currentSkin.id, "main", slot2)
	else
		if findTF(slot0.painting, "fitter").childCount > 0 then
			Ship.SetExpression(findTF(slot0.painting, "fitter"):GetChild(0), slot0.paintingName, slot1)
		end

		slot3, slot4 = Ship.getWords(slot0.currentSkin.id, slot1)
		slot5 = Ship.getCVCalibrate(slot0.currentSkin.id, slot1)
		slot6 = Ship.getL2dSoundEffect(slot0.currentSkin.id, slot1)
	end

	slot7 = slot0.CHAT_SHOW_TIME

	if not slot0.live2dChecked then
		slot5 = 0
	end

	if slot5 and slot5 > 0 then
		slot7 = slot7 + slot5
	end

	if slot0.currentSkinWord.voice_key >= 0 then
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		function slot8()
			nil._currentVoice, slot0 = playSoundEffect(slot1)

			if slot3 then
				slot2 = long2int(slot0.length) * 0.001

				if slot3 and slot3 > 0 then
					slot2 = slot2 + slot3
				end
			end

			return
		end

		if slot0._delayVoiceTweenID then
			LeanTween.cancel(slot0._delayVoiceTweenID)

			slot0._delayVoiceTweenID = nil
		end

		if slot0.l2dChar and slot5 and slot5 ~= 0 then
			slot0._delayVoiceTweenID = LeanTween.delayedCall(slot5, System.Action(function ()
				slot0()

				slot1._delayVoiceTweenID = nil

				return
			end)).id
		else
			slot8()
		end
	end

	if slot0._delayL2dSeID then
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
	end

	if slot0.l2dChar and slot6 then
		slot0._delayL2dSeID = LeanTween.delayedCall(slot6[2], System.Action(function ()
			playSoundEffect("event:/ui/" .. slot0[1])

			"event:/ui/" .. slot0[1]._delayL2dSeID = nil

			return
		end)).id
	end

	setText(slot0.chatText, slot3)

	if CHAT_POP_STR_LEN < #slot0.chatText:GetComponent(typeof(Text)).text then
		slot8.alignment = TextAnchor.MiddleLeft
	else
		slot8.alignment = TextAnchor.MiddleCenter
	end

	if slot0.initChatBgH < slot8.preferredHeight + 26 then
		slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot9)
	else
		slot0.chatBg.sizeDelta = Vector2.New(slot0.chatBg.sizeDelta.x, slot0.initChatBgH)
	end

	LeanTween.cancel(slot0.chat.gameObject)

	slot0.chat.localScale = Vector3(0, 0)
	slot11 = LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack)
	slot10 = LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeOutBack).setDelay
	slot12 = (slot5 and slot5) or 0

	slot10(LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeOutBack), slot12):setOnComplete(System.Action(function ()
		LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(slot0.CHAT_ANIMATION_TIME + LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeInBack))

		return
	end))

	return

	if not slot5 then
		slot12 = 0
	end
end

function slot0.createLive2D(slot0, slot1)
	setActive(slot0.painting:Find("fitter"), false)

	if slot0.l2dLoading then
		return
	end

	slot0.l2dLoading = true

	if slot0.l2dChar then
		pg.Live2DMgr.GetInstance():AddRefCount(slot0.l2dChar.name)
		Destroy(slot0.l2dChar)

		slot0.l2dChar = nil
	end

	pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot1, function (slot0)
		slot0.l2dLoading = false

		if slot0.exited then
			Destroy(slot0)

			return
		end

		slot1 = slot0:findTF("live2d", slot0.painting)

		UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))
		slot0.transform.SetParent(slot2, slot1, true)

		slot0.transform.localScale = Vector3(52, 52, 52)
		slot0.transform.localPosition = Vector3(0, -40, 100) + slot0.live2dOffset
		slot0.l2dChar = GetComponent(slot0, "Live2dChar")
		slot0.l2dChar.name = slot1

		function slot0.l2dChar.FinishAction(slot0)
			if slot0 ~= slot0 then
				slot1.l2dChar:SetAction(slot0)
			end

			return
		end

		slot0.l2dChar:SetAction(slot3)
		setActive(slot1, true)

		if CSharpVersion > 18 then
			slot6 = pg.ship_skin_template[slot0.currentSkin.id].lip_smoothing

			if pg.ship_skin_template[slot0.currentSkin.id].lip_sync_gain and slot5 ~= 0 then
				slot1:GetChild(0):GetComponent("CubismCriSrcMouthInput").Gain = slot5
			end

			if slot6 and slot6 ~= 0 then
				slot1:GetChild(0):GetComponent("CubismCriSrcMouthInput").Smoothing = slot6
			end
		end

		if not slot0.l2dIsOn then
			slot0:hideLive2D()
		end

		return
	end)

	return
end

function slot0.hideLive2D(slot0)
	setActive(slot0.painting:Find("fitter"), true)

	if slot0.l2dChar then
		setActive(slot0:findTF("live2d", slot0.painting), false)
	end

	return
end

function slot0.willExit(slot0)
	if slot0._delayVoiceTweenID then
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
	end

	if slot0._delayL2dSeID then
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
	end

	if slot0.dragTrigger then
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)

		slot0.paintingName = nil
		slot0.live2dOffset = nil
	end

	cameraPaintViewAdjust(false)

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	if slot0.loadedCVBattleBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBattleBankName)

		slot0.loadedCVBattleBankName = nil
	end

	if not IsNil(slot0.characterModel) then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.modelName, slot0.characterModel)
	end

	if slot0.l2dChar then
		slot0.l2dChar:ClearPics()
		pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.l2dChar.name)

		slot0.l2dChar = nil
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	return
end

return slot0
