slot0 = class("DefenseFormationScene", import("..base.BaseUI"))
slot0.RADIUS = 60
slot0.LONGPRESS_Y = 30
slot0.INTERVAL = math.pi / 2 / 6
slot0.MAX_FLEET_NUM = 4
slot0.MAX_SHIPP_NUM = 5
slot0.TOGGLE_DETAIL = "_detailToggle"
slot0.TOGGLE_FORMATION = "_formationToggle"
slot0.BUFF_TYEP = {
	blue = "blue",
	pink = "pink",
	cyan = "cyan"
}

function slot0.getUIName(slot0)
	return "ExerciseFormationUI"
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0._blurLayer = slot0:findTF("blur_container")
	slot0.backBtn = slot0:findTF("top/title/back", slot0._blurLayer)
	slot0._bottomPanel = slot0:findTF("blur_container/bottom")
	slot0._detailToggle = slot0:findTF("blur_container/bottom/toggle_list/detail_toggle")
	slot0._formationToggle = slot0:findTF("blur_container/bottom/toggle_list/formation_toggle")
	slot0._starTpl = slot0:findTF("star_tpl")
	slot0._starEmptyTpl = slot0:findTF("star_empty_tpl")
	slot0._heroInfoTpl = slot0:findTF("heroInfo")
	slot0._gridTFs = {
		vanguard = {},
		main = {}
	}
	slot0._gridFrame = slot0:findTF("GridFrame")

	for slot4 = 1, 3, 1 do
		slot0._gridTFs[Fleet.MAIN][slot4] = slot0._gridFrame:Find("main_" .. slot4)
		slot0._gridTFs[Fleet.VANGUARD][slot4] = slot0._gridFrame:Find("vanguard_" .. slot4)
	end

	slot0._heroContainer = slot0:findTF("HeroContainer")
	slot0._fleetNameText = slot0:findTF("blur_container/fleet_info/fleet_name")
	slot0._buffPanel = slot0:findTF("buff_list")
	slot0._buffGroup = slot0:findTF("buff_group", slot0._buffPanel)
	slot0._buffModel = slot0:getTpl("buff_model", slot0._buffPanel)
	slot0._cannonPower = slot0:findTF("blur_container/property_frame/titles/cannon/value")
	slot0._torpedoPower = slot0:findTF("blur_container/property_frame/titles/torpedo/value")
	slot0._AAPower = slot0:findTF("blur_container/property_frame/titles/anti_air/value")
	slot0._airPower = slot0:findTF("blur_container/property_frame/titles/air/value")
	slot0._cost = slot0:findTF("blur_container/property_frame/titles/cost/value")
	slot0._airDominance = slot0:findTF("blur_container/property_frame/titles/ac/value")

	setText(slot0:findTF("blur_container/property_frame/titles/cannon/Text"), i18n("word_attr_cannon"))
	setText(slot0:findTF("blur_container/property_frame/titles/torpedo/Text"), i18n("word_attr_torpedo"))
	setText(slot0:findTF("blur_container/property_frame/titles/anti_air/Text"), i18n("word_attr_antiaircraft"))
	setText(slot0:findTF("blur_container/property_frame/titles/air/Text"), i18n("word_attr_air"))
	setText(slot0:findTF("blur_container/property_frame/titles/cost/Text"), i18n("word_attr_luck"))
	setText(slot0:findTF("blur_container/property_frame/titles/ac/Text"), i18n("word_attr_ac"))

	slot0._mainGS = slot0:findTF("gear_score/main/Text")
	slot0._vanguardGS = slot0:findTF("gear_score/vanguard/Text")
	slot0._attrFrame = slot0:findTF("blur_container/attr_frame")
	slot0._cardTpl = slot0:getTpl("ship", slot0._attrFrame)
	slot0._cards = {
		[Fleet.MAIN] = {},
		[Fleet.VANGUARD] = {}
	}

	setActive(slot0._attrFrame, false)
	setActive(slot0._cardTpl, false)
	setAnchoredPosition(slot0._bottomPanel, {
		y = -90
	})
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.SetFleet(slot0, slot1)
	slot0._currentFleetVO = slot1
end

function slot0.UpdateFleetView(slot0, slot1)
	slot0:displayFleetInfo()
	slot0:resetGrid(Fleet.VANGUARD)
	slot0:resetGrid(Fleet.MAIN)
	slot0:resetFormationComponent()
	slot0:updateAttrFrame()

	if slot1 then
		slot0:loadAllCharacter()
	else
		slot0:setAllCharacterPos()
	end
end

function slot0.SetFleetNameLabel(slot0)
	setText(slot0._fleetNameText, i18n("exercise_formation_title"))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		if slot0._currentDragDelegate then
			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if slot0._attrFrame.gameObject.activeSelf then
			triggerToggle(slot0._formationToggle, true)
		else
			slot0:emit(DefenseFormationMedator.COMMIT_FLEET, function ()
				slot0:emit(slot1.ON_BACK)
			end)
		end
	end, SOUND_BACK)
	onToggle(slot0, slot0._detailToggle, function (slot0)
		if slot0._currentDragDelegate then
			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if slot0 then
			slot0:displayAttrFrame()
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0._formationToggle, function (slot0)
		if slot0._currentDragDelegate then
			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if slot0 then
			slot0:hideAttrFrame()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0._attrFrame, function ()
		triggerToggle(slot0._formationToggle, true)
	end, SFX_PANEL)
	slot0:UpdateFleetView(true)

	if slot0.contextData.toggle ~= nil then
		triggerToggle(slot0[slot0.contextData.toggle], true)
	end

	shiftPanel(slot0._bottomPanel, nil, 0, nil, 0.5, true, true)
	PoolMgr.GetInstance():GetUI("al_bg01", true, function (slot0)
		slot0:SetActive(true)
		setParent(slot0, slot0._tf)
		slot0.transform:SetAsFirstSibling()
	end)
end

function slot0.loadAllCharacter(slot0)
	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		vanguard = {},
		main = {}
	}

	function slot1(slot0, slot1, slot2, slot3)
		if slot0.exited then
			return
		end

		slot5 = tf(Instantiate(slot0._heroInfoTpl))
		slot5.name = slot0.name

		slot5:SetParent(slot0._heroContainer, false)
		SetActive(slot5, true)

		slot6 = slot0.shipVOs[slot1].getConfigTable(slot4)
		slot7 = pg.ship_data_template[slot0.shipVOs[slot1].configId]
		slot9 = findTF(slot8, "stars")

		for slot14 = 1, slot0.shipVOs[slot1].getStar(slot4), 1 do
			cloneTplTo(slot0._starTpl, slot9)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot4:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot4.configId)
		end

		setImageSprite(findTF(slot8, "type"), slot11, true)
		setText(findTF(slot8, "frame/lv_contain/lv"), slot4.level)

		slot12 = tf(slot0)

		slot12:SetParent(slot5, false)

		slot0.name = "model"
		slot0:GetComponent("SkeletonGraphic").raycastTarget = false
		slot12.localScale = Vector3(0.5, 0.5, 1)

		pg.ViewUtils.SetLayer(slot12, Layer.UI)
		slot8:SetSiblingIndex(2)

		slot0._characterList[slot2][slot3] = slot5
		slot14 = GameObject("mouseChild")

		tf(slot14):SetParent(tf(slot0))

		tf(slot14).localPosition = Vector3.zero
		slot15 = GetOrAddComponent(slot14, "ModelDrag")
		slot16 = GetOrAddComponent(slot14, "UILongPressTrigger")
		slot17 = GetOrAddComponent(slot14, "EventTriggerListener")
		slot0.eventTriggers[slot17] = true

		slot15:Init()

		slot18 = slot14:GetComponent(typeof(RectTransform))
		slot18.sizeDelta = Vector2(3, 3)
		slot18.pivot = Vector2(0.5, 0)
		slot18.anchoredPosition = Vector2(0, 0)

		pg.DelegateInfo.Add(slot0, slot16.onLongPressed)

		slot16.longPressThreshold = 1

		slot16.onLongPressed:RemoveAllListeners()
		slot16.onLongPressed:AddListener(function ()
			slot0:emit(DefenseFormationMedator.OPEN_SHIP_INFO, slot1.id, slot0._currentFleetVO, slot2.TOGGLE_FORMATION)
			playSoundEffect(SFX_PANEL)
		end)

		slot19, slot20, slot21, slot22, slot23 = nil

		pg.DelegateInfo.Add(slot0, slot15.onModelClick)
		slot15.onModelClick:AddListener(function ()
			slot0:emit(DefenseFormationMedator.CHANGE_FLEET_SHIP, slot0, )
			playSoundEffect(SFX_PANEL)
		end)
		slot17:AddBeginDragFunc(function ()
			setButtonEnabled(slot0.backBtn, false)
			setToggleEnabled(slot0._detailToggle, false)

			setToggleEnabled._currentDragDelegate = slot0._detailToggle
			slot2 = rtf(slot0._tf).rect.width / UnityEngine.Screen.width
			slot3 = rtf(slot0._tf).rect.height / UnityEngine.Screen.height
			slot4 = rtf(slot0._heroContainer).rect.width / 2
			slot5 = rtf(slot0._heroContainer).rect.height / 2

			LeanTween.cancel(slot6)
			slot7:SetAsLastSibling()
			slot7.SetAsLastSibling:switchToShiftMode(slot7, slot8)
			SetAction(go(slot6), "tuozhuai")
			SetActive(slot9, false)
		end)
		slot17:AddDragFunc(function (slot0, slot1)
			slot0.localPosition = Vector3(slot1.position.x * slot1 - slot2, slot1.position.y * slot3 - slot4, -22)
		end)
		slot17:AddDragEndFunc(function (slot0, slot1)
			setButtonEnabled(slot0.backBtn, true)
			setToggleEnabled(slot0._detailToggle, true)

			slot0._currentDragDelegate = nil

			SetAction(slot1, "stand")
			SetActive(SetActive, true)

			function slot2()
				slot0:switchToDisplayMode()
				slot0.switchToDisplayMode:sortSiblingIndex()
				slot0.switchToDisplayMode.sortSiblingIndex:emit(DefenseFormationMedator.CHANGE_FLEET_SHIPS_ORDER, slot0._currentFleetVO)
			end

			function slot3()
				for slot3, slot4 in ipairs(ipairs) do
					if slot4 == slot1 then
						Object.Destroy(slot2.gameObject)
						PoolMgr.GetInstance():ReturnSpineChar(slot3:getPrefab(), slot4)
						table.remove(slot0, slot3)

						break
					end
				end

				slot5:switchToDisplayMode()
				slot5:sortSiblingIndex()
				slot5:emit(DefenseFormationMedator.REMOVE_SHIP, slot3, slot5._currentFleetVO)
			end

			slot4, slot5 = slot0._currentFleetVO:getShipPos(slot0._currentFleetVO)

			if slot1.position.x < UnityEngine.Screen.width * 0.15 or slot1.position.x > UnityEngine.Screen.width * 0.87 or slot1.position.y < UnityEngine.Screen.height * 0.18 or slot1.position.y > UnityEngine.Screen.height * 0.7 then
				if not slot0._currentFleetVO:canRemove(slot5) then
					pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot5:getName(), "", Fleet.C_TEAM_NAME[slot5]))
					slot2()
				elseif (table.getCount(slot0._currentFleetVO.mainShips) == 1 and slot5 == Fleet.MAIN) or (table.getCount(slot0._currentFleetVO.vanguardShips) == 1 and slot5 == Fleet.VANGUARD) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("exercise_clear_fleet_tip"),
						onYes = slot3,
						onNo = slot2
					})
				else
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideNo = false,
						zIndex = -30,
						content = i18n("ship_formationUI_quest_remove", slot5:getName()),
						onYes = slot3,
						onNo = slot2
					})
				end
			else
				slot2()
			end
		end)
		slot0:setCharacterPos(slot2, slot3, slot5)
	end

	slot3(slot0._currentFleetVO.vanguardShips, Fleet.VANGUARD)
	slot3(slot0._currentFleetVO.mainShips, Fleet.MAIN)
	pg.UIMgr:GetInstance():LoadingOn()
	parallelAsync({}, function (slot0)
		pg.UIMgr:GetInstance():LoadingOff()

		if slot0.exited then
			return
		end

		slot0:sortSiblingIndex()
	end)
end

function slot0.setAllCharacterPos(slot0)
	for slot4, slot5 in ipairs(slot0._characterList.vanguard) do
		slot0:setCharacterPos(Fleet.VANGUARD, slot4, slot5)
	end

	for slot4, slot5 in ipairs(slot0._characterList.main) do
		slot0:setCharacterPos(Fleet.MAIN, slot4, slot5)
	end
end

function slot0.setCharacterPos(slot0, slot1, slot2, slot3)
	slot4 = findTF(slot3, "model")

	SetActive(slot4, true)
	LeanTween.cancel(go(slot4))

	slot3.localPosition = Vector3(slot0._gridTFs[slot1][slot2].localPosition.x, slot0._gridTFs[slot1][slot2].localPosition.y, -15 + slot0._gridTFs[slot1][slot2].localPosition.z + slot2)
	slot4.localPosition = Vector3(0, 20, 0)

	LeanTween.moveY(slot4, 0, 0.5):setDelay(0.5)
	SetActive(slot0._gridTFs[slot1][slot2].Find(slot5, "shadow"), true)
	SetAction(slot4, "stand")
end

function slot0.resetGrid(slot0, slot1)
	slot2 = slot0._currentFleetVO:getTeamByName(slot1)

	for slot7, slot8 in ipairs(slot3) do
		SetActive(slot8:Find("shadow"), false)
		SetActive(slot8:Find("tip"), false)
	end

	if slot1 == Fleet.MAIN and #slot0._currentFleetVO:getTeamByName(Fleet.VANGUARD) == 0 then
		return
	end

	if #slot2 < 3 then
		slot6 = slot3[slot4 + 1].Find(slot5, "tip")
		slot6:GetComponent("Button").enabled = true

		onButton(slot0, slot6, function ()
			slot0:emit(DefenseFormationMedator.CHANGE_FLEET_SHIP, nil, slot0)
		end, SFX_PANEL)

		slot6.localScale = Vector3(0, 0, 1)

		SetActive(slot6, true)
		LeanTween.value(go(slot6), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
		end)):setEase(LeanTweenType.easeOutBack)
	end
end

function slot0.resetFormationComponent(slot0)
	removeAllChildren(slot0._buffGroup)

	for slot5, slot6 in ipairs(slot1) do
		slot7 = cloneTplTo(slot0._buffModel, slot0._buffGroup)

		tf(slot7):SetAsFirstSibling()
		SetActive(slot7:Find("dot_list/" .. slot6.type), true)

		slot7:Find("buff_describe"):GetComponent(typeof(Text)).text = slot6.describe
	end

	return
end

function slot0.switchToShiftMode(slot0, slot1, slot2)
	for slot6 = 1, 3, 1 do
		setActive(slot0._gridTFs[Fleet.VANGUARD][slot6].Find(slot7, "tip"), false)
		setActive(slot0._gridTFs[Fleet.MAIN][slot6].Find(slot8, "tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
	end

	for slot7, slot8 in ipairs(slot3) do
		slot9 = findTF(slot8, "model")

		if slot8 ~= slot1 then
			LeanTween.moveY(rtf(slot9), slot9.localPosition.y + 20, 0.5)

			slot10 = tf(slot9):Find("mouseChild"):GetComponent("EventTriggerListener")
			slot0.eventTriggers[slot10] = true

			slot10:AddPointEnterFunc(function ()
				for slot3, slot4 in ipairs(ipairs) do
					if slot4 == slot1 then
						slot2:shift(slot2._shiftIndex, slot3, slot3)

						break
					end
				end

				return
			end)
		else
			slot0._shiftIndex = slot7
			tf(slot9):Find("mouseChild"):GetComponent(typeof(Image)).enabled = false
		end

		SetAction(slot9, "normal")
	end

	return
end

function slot0.switchToDisplayMode(slot0)
	slot1(slot0._characterList[Fleet.VANGUARD])
	slot1(slot0._characterList[Fleet.MAIN])

	slot0._shiftIndex = nil

	return
end

function slot0.shift(slot0, slot1, slot2, slot3)
	slot6 = slot0._currentFleetVO:getTeamByName(slot3)
	slot0._characterList[slot3][slot2].localPosition = Vector3(slot0._gridTFs[slot3][slot1].localPosition.x, slot0._gridTFs[slot3][slot1].localPosition.y + 20, -15 + slot0._gridTFs[slot3][slot1].localPosition.z + slot1)

	LeanTween.cancel(go(slot8))

	slot0._characterList[slot3][slot2] = slot0._characterList[slot3][slot1]
	slot0._characterList[slot3][slot1] = slot0._characterList[slot3][slot2]
	slot6[slot2] = slot6[slot1]
	slot6[slot1] = slot6[slot2]

	if #slot0._cards[slot3] > 0 then
		slot11[slot2] = slot11[slot1]
		slot11[slot1] = slot11[slot2]
	end

	slot0._shiftIndex = slot2

	return
end

function slot0.sortSiblingIndex(slot0)
	slot1 = 0

	for slot6, slot7 in ipairs(slot2) do
		if slot0._characterList[Fleet.MAIN][slot7] then
			tf(slot8):SetSiblingIndex(slot1)

			slot1 = slot1 + 1
		end
	end

	slot3 = 3

	while slot3 > 0 do
		if slot0._characterList[Fleet.VANGUARD][slot3] then
			tf(slot4):SetSiblingIndex(slot1)

			slot1 = slot1 + 1
		end

		slot3 = slot3 - 1
	end

	slot5 = slot0._cards[Fleet.VANGUARD]

	if #slot0._cards[Fleet.MAIN] > 0 or #slot5 > 0 then
		for slot9 = 1, #slot4, 1 do
			slot4[slot9].tr:SetSiblingIndex(slot9)
		end

		for slot9 = 1, #slot5, 1 do
			slot5[slot9].tr:SetSiblingIndex(slot9)
		end
	end

	return
end

function slot0.displayFleetInfo(slot0)
	slot1 = slot0._currentFleetVO:GetPropertiesSum()
	slot2 = slot0._currentFleetVO:GetGearScoreSum(Fleet.VANGUARD)
	slot3 = slot0._currentFleetVO:GetGearScoreSum(Fleet.MAIN)

	slot0.tweenNumText(slot0._cannonPower, slot1.cannon)
	slot0.tweenNumText(slot0._torpedoPower, slot1.torpedo)
	slot0.tweenNumText(slot0._AAPower, slot1.antiAir)
	slot0.tweenNumText(slot0._airPower, slot1.air)
	slot0.tweenNumText(slot0._cost, slot0._currentFleetVO:GetCostSum().oil)

	if OPEN_AIR_DOMINANCE then
		setActive(slot0._airDominance.parent, true)
		slot0.tweenNumText(slot0._airDominance, slot0._currentFleetVO:getFleetAirDominanceValue())
	else
		setActive(slot0._airDominance.parent, false)
	end

	slot0.tweenNumText(slot0._vanguardGS, slot2)
	slot0.tweenNumText(slot0._mainGS, slot3)
	setActive(slot0:findTF("gear_score"), true)
	slot0:SetFleetNameLabel()

	return
end

function slot0.hideAttrFrame(slot0)
	SetActive(slot0._attrFrame, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._blurLayer, slot0._tf)

	return
end

function slot0.displayAttrFrame(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._blurLayer, false)
	SetActive(slot0._attrFrame, true)
	slot0:initAttrFrame()

	return
end

function slot0.initAttrFrame(slot0)
	slot1 = {
		[Fleet.MAIN] = "main",
		[Fleet.VANGUARD] = "vanguard"
	}
	slot3 = false

	for slot7, slot8 in pairs(slot2) do
		if #slot0._cards[slot7] == 0 then
			slot10 = slot0:findTF(slot1[slot7] .. "/list", slot0._attrFrame)

			for slot14 = 1, 3, 1 do
				table.insert(slot9, FormationCard.New(cloneTplTo(slot0._cardTpl, slot10).gameObject))
			end

			slot3 = true
		end
	end

	if slot3 then
		slot0:updateAttrFrame()
	end

	return
end

function slot0.updateAttrFrame(slot0)
	for slot5, slot6 in pairs(slot1) do
		if #slot0._cards[slot5] > 0 then
			for slot11 = 1, 3, 1 do
				if slot11 <= #slot6 then
					slot7[slot11]:update(slot12)
					slot7[slot11]:updateProps(slot0:getCardAttrProps(slot0.shipVOs[slot6[slot11]]))
				else
					slot7[slot11]:update(nil)
				end

				slot0:attachOnCardButton(slot7[slot11], slot5)
			end
		end
	end

	slot0:updateUltimateTitle()

	return
end

function slot0.updateUltimateTitle(slot0)
	slot2 = slot0._currentFleetVO.mainShips

	if #slot0._cards[Fleet.MAIN] > 0 then
		for slot6 = 1, #slot1, 1 do
			slot1[slot6].shipState:SetActive(slot6 == 1)
		end
	end

	return
end

function slot0.getCardAttrProps(slot0, slot1)
	return {
		{
			i18n("word_attr_durability"),
			tostring(math.floor(slot1:getProperties().durability))
		},
		{
			i18n("word_attr_luck"),
			"" .. tostring(math.floor(slot1:getBattleTotalExpend()))
		},
		{
			i18n("word_synthesize_power"),
			"<color=#ffff00>" .. math.floor(slot3) .. "</color>"
		}
	}
end

function slot0.attachOnCardButton(slot0, slot1, slot2)
	slot3 = GetOrAddComponent(slot1.go, "EventTriggerListener")
	slot0.eventTriggers[slot3] = true

	slot3:RemovePointDownFunc()
	slot3:RemovePointUpFunc()
	slot3:RemoveBeginDragFunc()
	slot3:RemoveDragFunc()
	slot3:RemoveDragEndFunc()

	slot4 = Vector2.zero

	slot3:AddPointDownFunc(function (slot0, slot1)
		slot0 = slot1.position

		return
	end)
	slot3:AddPointUpFunc(function (slot0, slot1)
		if slot0 == slot0.go and Vector2.Magnitude(slot1 - slot1.position) < 1 then
			if slot0.shipVO then
				slot2:emit(DefenseFormationMedator.OPEN_SHIP_INFO, slot0.shipVO.id, slot2._currentFleetVO, slot3.TOGGLE_DETAIL)
			else
				slot2:emit(DefenseFormationMedator.CHANGE_FLEET_SHIP, slot0.shipVO, )
			end

			playSoundEffect(SFX_PANEL)
		end

		slot1 = Vector2.zero

		return
	end)

	if slot1.shipVO then
		slot5 = slot0._cards[slot2]
		slot6 = slot1.tr.parent:GetComponent("ContentSizeFitter")
		slot7 = slot1.tr.parent:GetComponent("HorizontalLayoutGroup")
		slot8 = slot1.tr.rect.width * 0.5
		slot9 = nil
		slot10 = 0
		slot11 = {}

		function slot13()
			for slot3 = 1, #slot0, 1 do
				slot0[slot3].tr.anchoredPosition = slot1[slot3]
			end

			return
		end

		slot14 = Timer.New(slot12, 0.03333333333333333, -1)

		slot3:AddBeginDragFunc(function ()
			if slot0.carddrag then
				return
			end

			slot0._currentDragDelegate = slot1
			slot0.carddrag = slot2
			slot3.enabled = false
			slot4.enabled = false

			slot2.tr:SetSiblingIndex(#slot5)

			for slot3 = 1, #slot5, 1 do
				if slot5[slot3] == slot2 then
					slot0._shiftIndex = slot3
				end

				slot6[slot3] = slot5[slot3].tr.anchoredPosition
			end

			slot7:Start()
			LeanTween.scale(slot2.paintingTr, Vector3(1.1, 1.1, 0), 0.3)

			return
		end)
		slot3:AddDragFunc(function (slot0, slot1)
			if slot0.carddrag ~= slot1 then
				return
			end

			slot1.tr.localPosition.x = slot0:change2ScrPos(slot1.tr.parent, slot1.position).x
			slot1.tr.localPosition = slot1.tr.localPosition

			if Time.realtimeSinceStartup < slot1.tr.localPosition then
				slot3 = slot1

				return
			end

			slot3 = 1

			for slot7 = 1, #slot4, 1 do
				if slot4[slot7] ~= slot1 and slot4[slot7].shipVO and slot1.tr.localPosition.x > slot4[slot7].tr.localPosition.x + ((slot3 < slot0._shiftIndex and 1.1) or -1.1) * slot5 then
					slot3 = slot3 + 1
				end
			end

			if slot0._shiftIndex ~= slot3 then
				slot0:shift(slot0._shiftIndex, slot3, )

				slot2 = Time.realtimeSinceStartup + 0.15
			end

			return
		end)
		slot3:AddDragEndFunc(function (slot0, slot1)
			if slot0.carddrag ~= slot1 then
				return
			end

			slot0._currentDragDelegate = nil
			slot0.enabled = false

			LeanTween.value(slot1.go, slot1.tr.anchoredPosition.x, slot3[slot0._shiftIndex].x, math.min(math.abs(slot1.tr.anchoredPosition.x - slot3[slot0._shiftIndex].x) / 200, 1) * 0.3):setEase(LeanTweenType.easeOutCubic):setOnUpdate(System.Action_float(function (slot0)
				slot0.tr.anchoredPosition.x = slot0
				slot0.tr.anchoredPosition = slot0.tr.anchoredPosition

				return
			end)):setOnComplete(System.Action(function ()
				slot0()

				slot1.enabled = true
				slot2.enabled = true
				slot3._shiftIndex = nil

				slot4:Stop()
				slot3:updateUltimateTitle()
				slot3:sortSiblingIndex()
				slot3:emit(DefenseFormationMedator.CHANGE_FLEET_SHIPS_ORDER, slot3._currentFleetVO)
				LeanTween.scale(slot5.paintingTr, Vector3(1, 1, 0), 0.3)

				slot6.enabled = true
				0.3.carddrag = nil

				return
			end))

			return
		end)
	end

	return
end

function slot0.change2ScrPos(slot0, slot1, slot2)
	return LuaHelper.ScreenToLocal(slot1, slot2, GameObject.Find("OverlayCamera"):GetComponent("Camera"))
end

function slot0.tweenNumText(slot0, slot1, slot2)
	slot3 = LeanTween.value
	slot4 = go(slot0)
	slot5 = 0
	slot6 = math.floor(slot1)
	slot7 = slot2 or 0.7

	LeanTween.value(slot4, slot5, slot6, slot7):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0, math.floor(slot0))

		return
	end))

	return

	slot7 = 0.7
end

function slot0.GetFleetCount(slot0)
	return 1
end

function slot0.recycleCharacterList(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		if slot2[slot6] then
			if findTF(slot2[slot6], "model") then
				PoolMgr.GetInstance():ReturnSpineChar(slot0.shipVOs[slot7]:getPrefab(), slot8.gameObject)
			end

			slot2[slot6] = nil
		end
	end

	return
end

function slot0.recyclePainting(slot0)
	for slot4, slot5 in pairs(slot0._cards) do
		for slot9, slot10 in ipairs(slot5) do
			slot10:clear()
		end
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

	if slot0._attrFrame.gameObject.activeSelf then
		pg.UIMgr.GetInstance():UnblurPanel(slot0._blurLayer, slot0._tf)
	end

	pg.TimeMgr:GetInstance():RemoveTimer(slot0.ActiveToggletimer1)

	slot0.ActiveToggletimer1 = nil

	pg.TimeMgr:GetInstance():RemoveTimer(slot0.ActiveToggletimer)

	slot0.ActiveToggletimer = nil

	slot0:recycleCharacterList(slot0._currentFleetVO.mainShips, slot0._characterList[Fleet.MAIN])
	slot0:recycleCharacterList(slot0._currentFleetVO.vanguardShips, slot0._characterList[Fleet.VANGUARD])
	slot0:recyclePainting()

	return
end

return slot0
