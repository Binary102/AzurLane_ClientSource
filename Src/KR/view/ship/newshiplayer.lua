slot0 = class("NewShipLayer", import("..base.BaseUI"))
slot0.PAINT_DURATION = 0.35
slot0.STAR_DURATION = 0.5
slot0.STAR_ANIMATION_DUR1 = 0.075
slot0.STAR_ANIMATION_DUR2 = 0.1
slot0.STAR_ANIMATION_DUR3 = 0.4
slot0.STAR_ANIMATION_DUR4 = 0.26
slot1 = 19

function slot0.getUIName(slot0)
	return "NewShipUI"
end

function slot0.preload(slot0, slot1)
	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot0.contextData.ship.rarity2bgPrintForGet(slot2), "", slot1)
end

function slot0.init(slot0)
	slot0._guiderLoaded = true
	slot0._shake = slot0:findTF("shake_panel")
	slot0.commanderIcon = slot0:findTF("commander", slot0._shake)
	slot0._shade = slot0:findTF("shade")
	slot0._bg = slot0._shake:Find("bg")
	slot0._drag = slot0._shake:Find("drag")
	slot0._paintingTF = slot0._shake:Find("paint")
	slot0._paintingShadowTF = slot0._shake:Find("bg/shadow")
	slot0._dialogue = slot0._shake:Find("dialogue")
	slot0._shipName = slot0._dialogue:Find("name_bg/Text"):GetComponent(typeof(Text))
	slot0._shipType = slot0._dialogue:Find("type_bg/type"):GetComponent("Image")
	slot0._dialogueText = slot0._dialogue:Find("desc/Text")
	slot0._left = slot0._shake:Find("left_panel")
	slot0._lockBtn = slot0._left:Find("lock/lock")
	slot0._unlockBtn = slot0._left:Find("lock/unlock_btn")
	slot0._viewBtn = slot0._left:Find("view_btn")
	slot0._evaluationBtn = slot0._left:Find("evaluation_btn")
	slot0._shareBtn = slot0._left:Find("share_btn")
	slot0.audioBtn = slot0._shake:Find("property_btn")
	slot0.clickTF = slot0._shake:Find("click")
	slot0.npc = slot0:findTF("shake_panel/npc")

	setActive(slot0.npc, false)

	slot0.rightPanel = slot0._shake:Find("right_panel")
	slot0.skillContainer = slot0:findTF("bg/skill_panel/frame/skill_list/viewport/content", slot0.rightPanel)
	slot0.skillTpl = slot0:getTpl("bg/skill_panel/frame/skilltpl", slot0.rightPanel)
	slot0.emptyTpl = slot0:getTpl("bg/skill_panel/frame/emptytpl", slot0.rightPanel)
	slot0.addTpl = slot0:getTpl("bg/skill_panel/frame/addtpl", slot0.rightPanel)
	slot0.newTF = slot0._shake:Find("New")
	slot0.rarityTF = slot0._shake:Find("rarity")
	slot0.starsTF = slot0._shake:Find("rarity/stars")
	slot0.starsCont = slot0:findTF("content", slot0.starsTF)
	slot0.rarityType = slot0._shake:Find("rarity/type")
	slot0._skipButton = slot0._shake:Find("skip")

	setActive(slot0._skipButton, slot0.contextData.canSkipBatch)
	setActive(slot0._left, not slot0.contextData.canSkip)
	setActive(slot0.audioBtn, not slot0.contextData.canSkip)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf)

	slot0.isLoadBg = true
	slot0.propertyPanel = PropertyPanel.New(slot0.rightPanel:Find("bg/property_panel/frame"))
	slot0.rarityEffect = {}
end

function slot0.voice(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2()
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedCVBankName then
		slot2()
	else
		pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0._shipVO.skinId), function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot1.loadedCVBankName = slot0

				slot2()
			end

			slot1.loadedCVBankName = slot0

			slot2()
		end)
	end
end

function slot0.setShip(slot0, slot1)
	slot0:recyclePainting()

	slot0._shipVO = slot1
	slot0.isRemoulded = slot1:isRemoulded()

	GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot1:rarity2bgPrintForGet(), "", function (slot0)
		setImageSprite(slot0._bg, slot0, true)

		slot0.isLoadBg = true

		slot0:dispatchUILoaded(true)
	end)

	if slot1:isBluePrintShip() then
		if not slot0.designBg then
			PoolMgr.GetInstance():GetUI("raritydesign5", true, function (slot0)
				slot0.designBg = slot0

				slot0.transform:SetParent(slot0._shake, false)

				slot0.transform.localPosition = Vector3(1, 1, 1)
				slot0.transform.localScale = Vector3(1, 1, 1)

				slot0.transform:SetSiblingIndex(1)
				setActive(slot0, true)
			end)
		else
			setActive(slot0.designBg, true)
		end
	end

	if slot1.virgin and not slot0.isRemoulded and not slot1:isActivityNpc() then
		setActive(slot0.newTF, true)
		LoadImageSpriteAsync("clutter/new", slot0.newTF)
	else
		setActive(slot0.newTF, false)
	end

	setActive(slot0.audioBtn, not slot0.isRemoulded)
	slot0:UpdateLockButton(slot0._shipVO:GetLockState())

	slot3 = slot0._shipVO:getConfigTable()

	if slot0.isRemoulded then
		setPaintingPrefabAsync(slot0._paintingTF, slot0._shipVO:getRemouldPainting(), "huode")
		setPaintingPrefabAsync(slot0._paintingShadowTF, slot0._shipVO:getRemouldPainting(), "huode")
	else
		setPaintingPrefabAsync(slot0._paintingTF, slot0._shipVO:getPainting(), "huode")
		setPaintingPrefabAsync(slot0._paintingShadowTF, slot0._shipVO:getPainting(), "huode")
	end

	slot0._shipType.sprite = GetSpriteFromAtlas("shiptype", tostring(slot0._shipVO:getShipType()))

	slot0._shipType:SetNativeSize()

	slot0._shipName.text = slot1:getName()
	slot4 = ""
	slot5 = nil

	if slot0.isRemoulded then
		slot0._wordsConfig = Ship.getShipWords(slot1:getRemouldSkinId())

		if slot0._wordsConfig.unlock == "" then
			slot4 = Ship.getWords(slot6, "drop_descrip")
		else
			slot4, slot5 = Ship.getWords(slot6, "unlock")
		end
	else
		slot4, slot5 = Ship.getWords(slot0._shipVO.skinId, "unlock")
	end

	setWidgetText(slot0._dialogue, slot4, "desc/Text")

	slot0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(slot0._dialogue, false)
	LeanTween.delayedCall(0.5, System.Action(function ()
		SetActive(slot0._dialogue, true)
		LeanTween.scale(slot0._dialogue, Vector3(1, 1, 1), 0.1)
		LeanTween.scale:voice(LeanTween.scale)
	end))

	slot6 = slot1:getRarity()
	slot0.rarityTF.localPosition = (slot2 and Vector3(368, 0, 0)) or Vector3(368, 49, 0)
	slot8 = slot0._shipVO:getStar()
	slot10 = (pg.ship_data_template[slot3.id].star_max % 2 == 0 and pg.ship_data_template[slot3.id].star_max / 2) or math.floor(pg.ship_data_template[slot3.id].star_max / 2) + 1
	slot11 = 15

	for slot15 = 1, 6, 1 do
		slot16 = slot0.starsTF:Find("content/star_" .. slot15)

		setActive(slot16:Find("star_empty"), slot8 < slot15)
		setActive(slot16:Find("star"), slot15 <= slot8)

		if slot7 < slot15 then
			setActive(slot16, false)
		elseif not slot2 then
			if slot9 and slot15 == slot7 / 2 + 1 then
				slot10 = slot10 + 1
			end

			slot17.localPosition = Vector3(0, slot19, 0)
			slot18.localPosition = Vector3(0, slot17.localPosition.y + math.abs(slot10 - slot15) * slot11, 0)
		end
	end

	slot12 = slot0._shake:Find("nation")
	slot13 = LoadSprite
	slot14 = "prints/"
	slot15 = nation2print(slot3.nationality)
	slot16 = (slot2 and "") or "_1"

	if not slot13(slot14 .. slot15 .. slot16) then
		warning("找不到印花, shipConfigId: " .. slot1.configId)
		setActive(slot12, false)
	else
		rtf(slot12).pivot = getSpritePivot(slot13)

		setImageSprite(slot12, slot13, true)
		setActive(slot12, true)
	end

	LoadImageSpriteAsync("shiprarity/" .. ((slot2 and "1") or "") .. slot6, slot0._shake:Find("rarity/type"), true)
	setActive(slot12, false)
	setActive(slot0.rarityTF, false)
	setActive(slot0._shade, true)

	slot0.inAnimating = true

	LeanTween.delayedCall(0.5, System.Action(function ()
		setActive(setActive, true)
		setActive(setActive.rarityTF, true)
		setActive.rarityTF:starsAnimation()
	end))

	slot17 = slot0._shake:Find("ship_type"):Find("stars/startpl")

	setText(slot18, slot0._shipVO:getConfig("english_name"))

	slot20 = slot0._shipVO:getStar()

	for slot25 = slot15:Find("stars").childCount, slot0._shipVO:getMaxStar() - 1, 1 do
		cloneTplTo(slot17, slot16)
	end

	slot22 = slot21 - slot20

	for slot26 = 0, slot16.childCount - 1, 1 do
		slot16:GetChild(slot26).gameObject:SetActive(slot26 < slot21)
		SetActive(slot27:Find("star"), slot22 <= slot26)
		SetActive(slot27:Find("empty"), slot26 < slot22)
	end

	slot23 = slot0._shipVO:getConfigTable()
	findTF(slot15, "type_bg/type"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("shiptype", tostring(slot0._shipVO:getShipType()))

	slot0._shipType:SetNativeSize()
	setText(slot0:findTF("name_bg/Text", slot15), slot0._shipVO:getName())
	setActive(slot0.commanderIcon, slot1:hasCommander())

	if slot1.hasCommander() then
		setImageSprite(slot0:findTF("icon", slot0.commanderIcon), LoadSprite("QIcon/" .. getProxy(CommanderProxy):getCommanderById(slot1:getCommander()):getPainting()), true)
	end

	if not slot0.rarityEffect[slot6] then
		PoolMgr.GetInstance():GetUI("getrole_" .. slot6, true, function (slot0)
			if IsNil(slot0._tf) then
				return
			end

			slot0.rarityEffect[] = slot0

			slot0.transform:SetParent(slot0._tf, false)

			slot0.transform.localPosition = Vector3(1, 1, 1)
			slot0.transform.localScale = Vector3(1, 1, 1)

			slot0.transform:SetSiblingIndex(1)
			setActive(slot0, true)
		end)
	else
		setActive(slot0.rarityEffect[slot6], true)
	end
end

function slot0.updateShip(slot0, slot1)
	slot0._shipVO = slot1
end

function slot0.switch2Property(slot0)
	setActive(slot0.newTF, false)
	setActive(slot0.rightPanel, true)
	slot0:initSkills()
	slot0.propertyPanel:initProperty(slot0._shipVO.configId)
	setActive(slot0._dialogue, false)
	setActive(slot1, true)
	LeanTween.move(rtf(slot0.rightPanel), Vector3(-50, -12.5, 0), 0.3)
	LeanTween.move(rtf(slot1), Vector3(0, 0, 0), 0.3)
	LeanTween.move(rtf(slot0._paintingTF), Vector3(-59, 21, 0), 0.2)
	setActive(slot0.rarityTF, false)
	setActive(slot0._shake:Find("nation"), false)
	onButton(slot0, slot0._shake:Find("right_panel/qr_btn"), function ()
		if not slot0.isLoadBg then
			return
		end

		slot0:showExitTip()
	end, SFX_CONFIRM)
end

function slot0.showExitTip(slot0, slot1)
	slot2 = slot0._shipVO:GetLockState()

	if slot0._shipVO.virgin and slot2 == Ship.LOCK_STATE_UNLOCK then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_lock_tip"),
			onYes = function ()
				triggerButton(slot0._lockBtn)

				if slot0._lockBtn then
					slot1()
				else
					slot0:emit(NewShipMediator.ON_EXIT)
				end
			end,
			onNo = function ()
				if slot0 then
					slot0()
				else
					slot1:emit(NewShipMediator.ON_EXIT)
				end
			end
		})
	elseif slot1 then
		slot1()
	else
		slot0:emit(NewShipMediator.ON_EXIT)
	end
end

function slot0.initSkills(slot0)
	slot3 = 1

	for slot7, slot8 in ipairs(pg.ship_data_template[slot0._shipVO:getMaxConfigId()].buff_list) do
		slot9 = getSkillConfig(slot8)
		slot11 = nil

		if slot0._shipVO.skills[slot8] then
			onButton(slot0, cloneTplTo(slot0.skillTpl, slot0.skillContainer), function ()
				slot0:emit(NewShipMediator.ON_SKILLINFO, slot1.id, "", slot2[slot1.id])
			end, SFX_PANEL)
		else
			setActive(cloneTplTo(slot0.emptyTpl, slot0.skillContainer).Find(slot11, "mask"), true)
			onButton(slot0, cloneTplTo(slot0.emptyTpl, slot0.skillContainer), function ()
				slot0:emit(NewShipMediator.ON_SKILLINFO, slot1.id, i18n("ship_skill_unlock_tip"))
			end, SFX_PANEL)
		end

		slot3 = slot3 + 1

		LoadImageSpriteAsync("skillicon/" .. slot9.icon, findTF(slot11, "icon"))
	end

	for slot7 = slot3, 3, 1 do
		cloneTplTo(slot0.addTpl, slot0.skillContainer)
	end
end

function slot0.UpdateLockButton(slot0, slot1)
	setActive(slot0._lockBtn, slot1 ~= Ship.LOCK_STATE_LOCK)
	setActive(slot0._unlockBtn, slot1 ~= Ship.LOCK_STATE_UNLOCK)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._lockBtn, function ()
		slot0:emit(NewShipMediator.ON_LOCK, {
			slot0._shipVO.id
		}, Ship.LOCK_STATE_LOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0._unlockBtn, function ()
		slot0:emit(NewShipMediator.ON_LOCK, {
			slot0._shipVO.id
		}, Ship.LOCK_STATE_UNLOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0._viewBtn, function ()
		slot0.isInView = true

		slot0:paintView()
		setActive(slot0.clickTF, false)
	end, SFX_PANEL)
	onButton(slot0, slot0._evaluationBtn, function ()
		slot0:emit(NewShipMediator.ON_EVALIATION, slot0._shipVO:getGroupId())
	end, SFX_PANEL)
	onButton(slot0, slot0._shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewShip)
	end, SFX_PANEL)
	onButton(slot0, slot0.clickTF, function ()
		if slot0.isInView or not slot0.isLoadBg then
			return
		end

		slot0:showExitTip()
	end, SFX_CANCEL)
	onButton(slot0, slot0.audioBtn, function ()
		if slot0.isInView then
			return
		end

		if not slot0.isOpenProperty then
			slot0:switch2Property()

			slot0.switch2Property.isOpenProperty = true
		end

		slot0(slot0.audioBtn, not slot0.isRemoulded and not slot0.isOpenProperty)
	end, SFX_PANEL)
	onButton(slot0, slot0._skipButton, function ()
		slot0:showExitTip(function ()
			slot0:emit(NewShipMediator.ON_SKIP_BATCH)
		end)
	end, SFX_PANEL)
	playSoundEffect(SFX_UI_DOCKYARD_CHARGET)

	slot0.hideParentList = {}

	eachChild(slot0._tf.parent, function (slot0)
		if slot0 ~= slot0._tf and slot0.gameObject.activeSelf then
			setActive(slot0, false)
			table.insert(slot0.hideParentList, slot0)
		end
	end)
end

function slot0.onBackPressed(slot0)
	if slot0.inAnimating then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if slot0.isInView then
		slot0:hidePaintView(true)

		return
	end

	triggerButton(slot0.clickTF)
end

function slot0.paintView(slot0)
	slot1 = {}
	slot2 = slot0._shake.childCount
	slot3 = 0

	while slot2 > slot3 do
		if slot0._shake:GetChild(slot3).gameObject.activeSelf and slot4 ~= slot0._paintingTF and slot4 ~= slot0._bg and slot4 ~= slot0._drag then
			slot1[#slot1 + 1] = slot4

			setActive(slot4, false)
		end

		slot3 = slot3 + 1
	end

	openPortrait()

	slot5 = slot0._paintingTF.anchoredPosition.x
	slot6 = slot0._paintingTF.anchoredPosition.y
	slot9 = slot0._tf.rect.width / UnityEngine.Screen.width
	slot10 = slot0._tf.rect.height / UnityEngine.Screen.height
	slot11 = slot0._paintingTF.rect.width / 2
	slot12 = slot0._paintingTF.rect.height / 2
	slot13, slot14 = nil

	if not LeanTween.isTweening(go(slot0._paintingTF)) then
		LeanTween.moveX(rtf(slot4), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
	end

	slot15 = GetOrAddComponent(slot0._drag, "MultiTouchZoom")

	slot15:SetZoomTarget(slot0._paintingTF)

	slot16 = GetOrAddComponent(slot0._drag, "EventTriggerListener")
	slot0.dragTrigger = slot16
	slot17 = true
	slot15.enabled = true
	slot16.enabled = true
	slot18 = false

	slot16:AddPointDownFunc(function (slot0)
		if Input.touchCount == 1 or Application.isEditor then
			slot0 = true
			slot1 = true
		elseif Input.touchCount >= 2 then
			slot1 = false
			slot0 = false
		end
	end)
	slot16:AddPointUpFunc(function (slot0)
		if Input.touchCount <= 2 then
			slot0 = true
		end
	end)
	slot16:AddBeginDragFunc(function (slot0, slot1)
		slot0 = false
		slot5 = slot1.position.x *  - slot1.position.x - tf(slot4._paintingTF).localPosition.x.position.y * slot6 - slot7 - tf(slot4._paintingTF._paintingTF).localPosition.y
	end)
	slot16:AddDragFunc(function (slot0, slot1)
		if slot0 then
			tf(slot1._paintingTF).localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
		end
	end)
	onButton(slot0, slot0._drag, function ()
		slot0:hidePaintView()
	end, SFX_CANCEL)

	function slot0.hidePaintView(slot0, slot1)
		if not slot1 and not slot0 then
			return
		end

		slot1.enabled = false
		slot1.enabled = false

		for slot5, slot6 in ipairs(false) do
			setActive(slot6, true)
		end

		closePortrait()
		LeanTween.cancel(go(slot0._paintingTF))

		slot0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(slot0._paintingTF, {
			x = slot4,
			y = slot4
		})

		slot0.isInView = false

		setActive(slot0.clickTF, true)
	end
end

function slot0.recyclePainting(slot0)
	if slot0._shipVO then
		retPaintingPrefab(slot0._paintingTF, slot0._shipVO:getPainting())
		retPaintingPrefab(slot0._paintingShadowTF, slot0._shipVO:getPainting())
	end
end

function slot0.starsAnimation(slot0)
	slot0.inAnimating = true

	if slot0._shipVO:getMaxStar() >= 6 and PlayerPrefs.GetInt(RARE_SHIP_VIBRATE) == 1 then
		LuaHelper.Vibrate()
	end

	setActive(slot0.starsCont, false)

	slot2 = slot0._tf:GetComponent(typeof(DftAniEvent))

	slot2:SetTriggerEvent(function (slot0)
		LeanTween.scale(rtf(slot0.starsCont), Vector3.one, 0):setOnComplete(System.Action(function ()
			setActive(slot0.starsCont, true)
		end))

		slot1 = slot0.STAR_ANIMATION_DUR1

		for slot5 = 0, slot0.starsCont.childCount - 1, 1 do
			slot6 = slot0.starsCont:GetChild(slot5)

			setActive(slot7, false)
			setActive(slot8, false)
			LeanTween.scale(rtf(slot7), Vector3(1.8, 1.8, 1.8), 0):setDelay(slot9):setOnComplete(System.Action(function ()
				setActive(setActive, true)
				LeanTween.scale(rtf(slot0), Vector3(1, 1, 1), )
			end))
		end

		slot3 = slot0.STAR_ANIMATION_DUR2
		slot4 = slot0.STAR_ANIMATION_DUR3

		for slot8 = 0, slot0._shipVO:getStar() - 1, 1 do
			slot9 = slot0.starsCont:GetChild(slot8)
			slot10 = slot9:Find("star_empty")

			LeanTween.scale(rtf(slot11), Vector3(1.8, 1.8, 1.8), 0):setDelay(slot12):setOnStart(System.Action(function ()
				playSoundEffect(SFX_UI_DOCKYARD_STAR)
			end)):setOnComplete(System.Action(function ()
				setActive(setActive, false)
				setActive(setActive, true)
				LeanTween.scale(rtf(rtf), Vector3(1, 1, 1), )
			end))

			if slot9:Find("light") then
				LeanTween.delayedCall(slot12, System.Action(function ()
					if slot0.exited then
						return
					end

					setActive(slot1, true)

					return
				end))
				LeanTween.alpha(rtf(slot13), 0, slot4):setDelay(slot12):setOnComplete(System.Action(function ()
					SetActive(SetActive, false)
					LeanTween.alpha(rtf(slot0), 1, 0)

					return
				end))

				slot13.transform.localScale = Vector3(1, 1, 1)

				LeanTween.scale(rtf(slot13), Vector3(0.5, 1, 1), slot0.STAR_ANIMATION_DUR4):setDelay(slot12 + (slot4 * 1) / 3)
			end
		end
	end)
	slot2:SetEndEvent(function (slot0)
		slot0.inAnimating = false

		setActive(slot0.npc, slot0._shipVO:isActivityNpc())
		setActive(slot0._shade, false)

		return
	end)
end

function slot0.skipAnimation(slot0)
	LeanTween.cancelAll(true)

	return
end

function slot0.willExit(slot0)
	if slot0.designBg then
		PoolMgr.GetInstance():ReturnUI("raritydesign5", slot0.designBg)
	end

	for slot4, slot5 in ipairs(slot0.rarityEffect) do
		if slot5 then
			PoolMgr.GetInstance():ReturnUI("getrole_" .. slot4, slot5)
		end
	end

	if slot0.dragTrigger then
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
	end

	if slot0.inAnimating then
		slot0:skipAnimation()
	end

	if not slot0.isRemoulded then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_newShipLayer_get", pg.ship_data_by_type[slot0._shipVO:getShipType()].type_name, slot0._shipVO:getName()), COLOR_GREEN)
	end

	slot0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	cameraPaintViewAdjust(false)

	for slot4, slot5 in ipairs(slot0.hideParentList) do
		setActive(slot5, true)
	end

	return
end

return slot0
