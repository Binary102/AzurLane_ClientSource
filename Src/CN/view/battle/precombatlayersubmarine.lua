slot0 = class("PreCombatLayerSubmarine", import(".PreCombatLayer"))
slot1 = import("..ship.FormationUI")
slot0.FORM_EDIT = "EDIT"
slot0.FORM_PREVIEW = "PREVIEW"

function slot0.getUIName(slot0)
	return "PreCombatUI"
end

function slot0.init(slot0)
	slot0.super.init(slot0)

	slot1 = slot0:findTF("middle")

	SetActive(slot2, false)
	SetActive(slot0._gridFrame, false)
	SetActive(slot1:Find("gear_score/main"), false)
	SetActive(slot1:Find("gear_score/vanguard"), false)
	SetActive(slot1:Find("gear_score/submarine"), true)

	slot0._subFrame = slot1:Find("mask/bg_sub")

	SetActive(slot0._subFrame, true)

	slot0._gridTFs = {
		[Fleet.SUBMARINE] = {}
	}

	for slot6 = 1, 3, 1 do
		slot0._gridTFs[Fleet.SUBMARINE][slot6] = slot0._subFrame:Find("submarine_" .. slot6)
	end
end

function slot0.SetFleets(slot0, slot1)
	slot0._fleetVOs = {}
	slot0._fleetIDList = {}

	_.each(_.filter(_.values(slot1), function (slot0)
		return slot0:getFleetType() == FleetType.Submarine
	end), function (slot0)
		if #slot0.ships > 0 then
			slot0._fleetVOs[slot0.id] = slot0

			table.insert(slot0._fleetIDList, slot0.id)

			slot1 = table.insert + 1
		end
	end)

	if 0 == 0 then
		slot0._fleetVOs[11] = slot2[1]

		table.insert(slot0._fleetIDList, 11)
	else
		table.sort(slot0._fleetIDList, function (slot0, slot1)
			return slot0 < slot1
		end)
	end
end

function slot0.SetCurrentFleet(slot0, slot1)
	slot0._currentFleetVO = slot0._fleetVOs[slot1 or slot0._fleetIDList[1]]
end

function slot0.UpdateFleetView(slot0, slot1)
	slot0:displayFleetInfo()
	slot0:resetGrid(Fleet.SUBMARINE)

	if slot1 then
		slot0:loadAllCharacter()
	else
		slot0:setAllCharacterPos(true)
	end
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._backBtn, function ()
		if slot0._currentForm == slot1.FORM_EDIT and slot0._editedFlag then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false,
				zIndex = -100,
				content = i18n("battle_preCombatLayer_save_confirm"),
				onYes = function ()
					slot0:emit(PreCombatMediator.ON_COMMIT_EDIT, function ()
						pg.TipsMgr:GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))

						GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

						slot0:uiExitAnimating()
						LeanTween.delayedCall(0.3, System.Action(function ()
							slot0:emit(slot1.ON_CLOSE)
						end))
					end)
				end,
				onNo = function ()
					slot0:emit(PreCombatMediator.ON_ABORT_EDIT)

					GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

					slot0:uiExitAnimating()
					LeanTween.delayedCall(0.3, System.Action(function ()
						slot0:emit(slot1.ON_CLOSE)
					end))
				end
			})
		else
			GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

			slot0:uiExitAnimating()
			LeanTween.delayedCall(0.3, System.Action(function ()
				slot0:emit(slot1.ON_CLOSE)
			end))
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0._startBtn, function ()
		if slot0._currentForm == slot1.FORM_EDIT and slot0._editedFlag then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false,
				zIndex = -100,
				content = i18n("battle_preCombatLayer_save_march"),
				onYes = function ()
					slot0:emit(PreCombatMediator.ON_COMMIT_EDIT, function ()
						pg.TipsMgr:GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
						pg.TipsMgr.GetInstance().ShowTips:emit(PreCombatMediator.ON_START, slot0._currentFleetVO.id)
					end)
				end
			})
		else
			slot0:emit(PreCombatMediator.ON_START, slot0._currentFleetVO.id)
		end
	end, SFX_UI_WEIGHANCHOR)
	onButton(slot0, slot0._nextPage, function ()
		if slot0:getNextFleetID() then
			slot0:emit(PreCombatMediator.ON_CHANGE_FLEET, slot0, true)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0._prevPage, function ()
		if slot0:getPrevFleetID() then
			slot0:emit(PreCombatMediator.ON_CHANGE_FLEET, slot0, true)
		end
	end, SFX_PANEL)
	slot0:UpdateFleetView(true)

	if slot0.contextData.form == slot0.FORM_EDIT then
		slot0._editedFlag = true

		slot0:switchToEditMode()

		if slot0._characterList then
			slot0:enabledTeamCharacter(Fleet.SUBMARINE, true)
		end

		slot0:setAllCharacterPos(false)
	else
		slot0:swtichToPreviewMode()
	end

	slot0.contextData.form = nil

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	setActive(slot0._autoToggle, false)
	onNextTick(function ()
		slot0:uiStartAnimating()
	end)

	if slot0.contextData.system == SYSTEM_ACT_BOSS then
		PoolMgr.GetInstance():GetUI("al_bg01", true, function (slot0)
			slot0:SetActive(true)
			setParent(slot0, slot0._tf)
			slot0.transform:SetAsFirstSibling()
		end)
	end

	if slot0._currentForm == slot0.FORM_PREVIEW and slot0.contextData.system == SYSTEM_DUEL and #slot0._currentFleetVO.mainShips <= 0 then
		triggerButton(slot0._checkBtn)
	end
end

function slot0.getNextFleetID(slot0)
	slot1 = nil

	for slot5, slot6 in ipairs(slot0._fleetIDList) do
		if slot6 == slot0._currentFleetVO.id then
			slot1 = slot5

			break
		end
	end

	return slot0._fleetIDList[slot1 + 1]
end

function slot0.getPrevFleetID(slot0)
	slot1 = nil

	for slot5, slot6 in ipairs(slot0._fleetIDList) do
		if slot6 == slot0._currentFleetVO.id then
			slot1 = slot5

			break
		end
	end

	return slot0._fleetIDList[slot1 - 1]
end

function slot0.swtichToPreviewMode(slot0)
	slot0._editedFlag = nil
	slot0._currentForm = slot0.FORM_PREVIEW
	slot0._checkBtn:GetComponent("Button").interactable = true

	setActive(slot0._checkBtn:Find("save"), false)
	setActive(slot0._checkBtn:Find("edit"), true)
	slot0:resetGrid(Fleet.SUBMARINE)
	slot0:setAllCharacterPos(false)
	onButton(slot0, slot0._checkBtn, function ()
		slot0:switchToEditMode()

		if slot0.switchToEditMode._characterList then
			slot0:enabledTeamCharacter(Fleet.SUBMARINE, true)
		end

		slot0:setAllCharacterPos(false)
	end, SFX_PANEL)
	slot0:disableAllStepper()
	slot0:SetFleetStepper()

	if slot0._characterList then
		slot0:enabledTeamCharacter(Fleet.SUBMARINE, false)
	end
end

function slot0.switchToEditMode(slot0)
	slot0._currentForm = slot0.FORM_EDIT
	slot0._checkBtn:GetComponent("Button").interactable = true

	setActive(slot0._checkBtn:Find("save"), true)
	setActive(slot0._checkBtn:Find("edit"), false)
	onButton(slot0, slot0._checkBtn, function ()
		slot0:emit(PreCombatMediator.ON_COMMIT_EDIT, function ()
			if slot0._editedFlag then
				pg.TipsMgr:GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
			end

			slot0:swtichToPreviewMode()
		end)
	end, SFX_CONFIRM)
	slot0:EnableAddGrid(Fleet.SUBMARINE)
	slot1(slot0._characterList[Fleet.SUBMARINE])

	slot0._shiftIndex = nil

	slot0:disableAllStepper()
end

function slot0.switchToShiftMode(slot0, slot1, slot2)
	slot0:disableAllStepper()

	slot0._checkBtn:GetComponent("Button").interactable = false

	for slot6 = 1, 3, 1 do
		setActive(slot0._gridTFs[Fleet.SUBMARINE][slot6].Find(slot7, "tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot8 ~= slot1 then
			LeanTween.moveLocalY(go(slot8), slot0._gridTFs[slot2][slot7].localPosition.y + 80, 0.5)

			slot10 = tf(slot8):Find("mouseChild"):GetComponent("EventTriggerListener")
			slot0.eventTriggers[slot10] = true

			slot10:AddPointEnterFunc(function ()
				for slot3, slot4 in ipairs(ipairs) do
					if slot4 == slot1 then
						slot2:shift(slot2._shiftIndex, slot3, slot3)

						break
					end
				end
			end)
		else
			slot0._shiftIndex = slot7
			tf(slot8):Find("mouseChild"):GetComponent(typeof(Image)).enabled = false
		end

		slot8:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end
end

function slot0.loadAllCharacter(slot0)
	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		[Fleet.SUBMARINE] = {}
	}
	slot0._infoList = {
		[Fleet.SUBMARINE] = {}
	}

	function slot1(slot0, slot1, slot2, slot3)
		slot5 = slot0._shipVOs[slot1].getConfigTable(slot4)

		if slot0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(slot4:getPrefab(), slot0)

			return
		end

		for slot10, slot11 in pairs(slot6) do
			if slot11.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot12, slot12, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if slot0.exited then
					else
						slot1 = Object.Instantiate(slot0)
						slot0._attachmentList[#slot0._attachmentList + 1] = slot1

						tf(slot1):SetParent(tf(slot1))

						tf(slot1).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
					end
				end), true, true)
			end
		end

		slot0._characterList[slot2][slot3] = slot0

		tf(slot0):SetParent(slot0._heroContainer, false)

		tf(slot0).localScale = Vector3(0.65, 0.65, 1)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)

		slot0:GetComponent("SkeletonGraphic").raycastTarget = false

		slot0:enabledCharacter(slot0, true, slot7, slot2)
		slot0:setCharacterPos(slot2, slot3, slot0)
		slot0:sortSiblingIndex()

		slot8 = cloneTplTo(slot0._heroInfo, slot0)

		setAnchoredPosition(slot8, {
			x = 0,
			y = 0
		})

		slot8.localScale = Vector3(2, 2, 1)

		SetActive(slot8, true)

		slot8.name = "info"
		slot10 = findTF(slot9, "stars")
		slot11 = slot0._shipVOs[slot1].energy <= Ship.ENERGY_MID
		slot12 = findTF(slot9, "energy")

		if slot11 then
			slot17, slot14 = slot7:getEnergyPrint()

			if not GetSpriteFromAtlas("energy", slot13) then
				warning("找不到疲劳")
			end

			setImageSprite(slot12, slot15)
		end

		setActive(slot12, slot11 and slot0.contextData.system ~= SYSTEM_DUEL)

		for slot17 = 1, slot7:getStar(), 1 do
			cloneTplTo(slot0._starTpl, slot10)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot7:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot7.configId)
		end

		setImageSprite(findTF(slot9, "type"), slot14, true)
		setText(findTF(slot9, "frame/lv_contain/lv"), slot7.level)
	end

	slot3(slot0._currentFleetVO.subShips, Fleet.SUBMARINE)
	pg.UIMgr:GetInstance():LoadingOn()
	parallelAsync({}, function (slot0)
		pg.UIMgr:GetInstance():LoadingOff()
	end)
end

function slot0.setAllCharacterPos(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._characterList[Fleet.SUBMARINE]) do
		slot0:setCharacterPos(Fleet.SUBMARINE, slot5, slot6, slot1)
	end

	slot0:sortSiblingIndex()
end

function slot0.setCharacterPos(slot0, slot1, slot2, slot3, slot4)
	SetActive(slot3, true)

	slot6 = slot0._gridTFs[slot1][slot2].position

	LeanTween.cancel(go(slot3))

	if slot4 then
		tf(slot3).position = Vector3(slot6.x, slot6.y + 0.9, slot6.z)

		LeanTween.moveY(go(slot3), slot6.y, 0.5):setDelay(0.5)
	else
		tf(slot3).position = Vector3(slot6.x, slot6.y, slot6.z)
	end

	SetActive(slot5:Find("shadow"), true)
	slot3:GetComponent("SpineAnimUI"):SetAction("stand", 0)
end

function slot0.resetGrid(slot0, slot1)
	slot2 = slot0._currentFleetVO:getTeamByName(slot1)

	for slot7, slot8 in ipairs(slot3) do
		SetActive(slot8:Find("shadow"), false)
		SetActive(slot8:Find("tip"), false)
	end
end

function slot0.EnableAddGrid(slot0, slot1)
	slot3 = slot0._gridTFs[slot1]

	if #slot0._currentFleetVO:getTeamByName(slot1) < 3 then
		slot6 = slot3[slot4 + 1].Find(slot5, "tip")
		slot6:GetComponent("Button").enabled = true

		onButton(slot0, slot6, function ()
			slot0:emit(PreCombatMediator.CHANGE_FLEET_SHIP, nil, slot0._currentFleetVO, slot0)
		end, SFX_UI_FORMATION_ADD)

		slot6.localScale = Vector3(0, 0, 1)

		SetActive(slot6, true)
		LeanTween.value(go(slot6), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
		end)):setEase(LeanTweenType.easeOutBack)
	end
end

function slot0.shift(slot0, slot1, slot2, slot3)
	slot6 = slot0._currentFleetVO:getTeamByName(slot3)
	tf(slot7).position = Vector3(slot0._gridTFs[slot3][slot1].position.x, slot0._gridTFs[slot3][slot1].position.y + 0.9, slot0._gridTFs[slot3][slot1].position.z)

	LeanTween.cancel(go(slot0._characterList[slot3][slot2]))

	slot0._characterList[slot3][slot2] = slot0._characterList[slot3][slot1]
	slot0._characterList[slot3][slot1] = slot0._characterList[slot3][slot2]
	slot6[slot2] = slot6[slot1]
	slot6[slot1] = slot6[slot2]
	slot0._shiftIndex = slot2

	slot0:sortSiblingIndex()

	return
end

function slot0.sortSiblingIndex(slot0)
	slot1 = 3
	slot2 = 0

	while slot1 > 0 do
		if slot0._characterList[Fleet.SUBMARINE][slot1] then
			tf(slot3):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
		end

		slot1 = slot1 - 1
	end

	return
end

function slot0.enabledTeamCharacter(slot0, slot1, slot2)
	slot4 = slot0._currentFleetVO:getTeamByName(slot1)

	for slot8, slot9 in ipairs(slot3) do
		slot0:enabledCharacter(slot9, slot2, slot0._shipVOs[slot4[slot8]], slot1)
	end

	return
end

function slot0.enabledCharacter(slot0, slot1, slot2, slot3, slot4)
	if slot2 then
		slot5, slot6, slot7, slot8 = tf(slot1):Find("mouseChild")

		if slot5 then
			SetActive(slot5, true)
		else
			tf(slot5):SetParent(tf(slot1))

			tf(slot5).localPosition = Vector3.zero
			slot0.eventTriggers[GetOrAddComponent(slot5, "EventTriggerListener")] = true

			GetOrAddComponent(slot5, "ModelDrag").Init(slot6)

			slot9 = GameObject("mouseChild").GetComponent(slot5, typeof(RectTransform))
			slot9.sizeDelta = Vector2(2.5, 2.5)
			slot9.pivot = Vector2(0.5, 0)
			slot9.anchoredPosition = Vector2(0, 0)
			GetOrAddComponent(slot5, "UILongPressTrigger").longPressThreshold = 1

			pg.DelegateInfo.Add(slot0, GetOrAddComponent(slot5, "UILongPressTrigger").onLongPressed)
			GetOrAddComponent(slot5, "UILongPressTrigger").onLongPressed:AddListener(function ()
				if slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS then
					slot0:emit(PreCombatMediator.OPEN_SHIP_INFO, slot1.id, slot0._currentFleetVO)
				end

				return
			end)
			pg.DelegateInfo.Add(slot0, GetOrAddComponent(slot5, "ModelDrag").onModelClick)
			GetOrAddComponent(slot5, "ModelDrag").onModelClick:AddListener(function ()
				playSoundEffect(SFX_UI_CLICK)
				playSoundEffect:emit(PreCombatMediator.CHANGE_FLEET_SHIP, playSoundEffect, slot0._currentFleetVO, )

				return
			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddBeginDragFunc(slot8, function ()
				screenWidth = UnityEngine.Screen.width
				screenHeight = UnityEngine.Screen.height
				widthRate = rtf(slot0._tf).rect.width / screenWidth
				heightRate = rtf(slot0._tf).rect.height / screenHeight

				LeanTween.cancel(go(go))
				LeanTween.cancel:switchToShiftMode(LeanTween.cancel, )
				LeanTween.cancel:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)
				tf(LeanTween.cancel.GetComponent("SpineAnimUI")):SetParent(slot0._moveLayer, false)
				playSoundEffect(SFX_UI_HOME_DRAG)

				return
			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddDragFunc(slot8, function (slot0, slot1)
				rtf(slot0).anchoredPosition = Vector2((slot1.position.x - screenWidth / 2) * widthRate + 20, (slot1.position.y - screenHeight / 2) * heightRate - 20)

				return
			end)
			GetOrAddComponent(slot5, "EventTriggerListener"):AddDragEndFunc(function (slot0, slot1)
				slot0:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)

				function slot2()
					tf(tf):SetParent(slot1._heroContainer, false)
					tf(tf):emit(PreCombatMediator.CHANGE_FLEET_SHIPS_ORDER, slot1._currentFleetVO)
					tf(tf):switchToEditMode()
					tf(tf):sortSiblingIndex()

					return
				end

				if slot1.position.x > UnityEngine.Screen.width * 0.65 or slot1.position.y < UnityEngine.Screen.height * 0.25 then
					if not slot1._currentFleetVO:canRemove(slot2) then
						slot3, slot4 = slot1._currentFleetVO:getShipPos(slot2)

						pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot2:getConfigTable().name, slot1._currentFleetVO.name, Fleet.C_TEAM_NAME[slot4]))
						slot2()
					else
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							hideNo = false,
							zIndex = -100,
							content = i18n("battle_preCombatLayer_quest_leaveFleet", slot2:getConfigTable().name),
							onYes = function ()
								for slot4, slot5 in ipairs(slot0) do
									if slot5 == slot2 then
										PoolMgr.GetInstance():ReturnSpineChar(slot3:getPrefab(), slot2)
										table.remove(slot0, slot4)

										break
									end
								end

								slot0:emit(PreCombatMediator.REMOVE_SHIP, , slot0._currentFleetVO)
								slot0:switchToEditMode()
								slot0:sortSiblingIndex()

								return
							end,
							onNo = slot2
						})
					end
				else
					slot2()
				end

				playSoundEffect(SFX_UI_HOME_PUT)

				return
			end)
		end
	else
		if not IsNil(tf(slot1):Find("mouseChild")) then
			setActive(slot5, false)
		end
	end

	return
end

function slot0.displayFleetInfo(slot0)
	slot1 = slot0._currentFleetVO:GetPropertiesSum()

	setActive(slot0._popup, true)
	slot0.tweenNumText(slot0._costText, slot0._currentFleetVO:GetCostSum().oil)
	slot0.tweenNumText(slot0._subGS, slot2)
	setText(slot0._fleetNameText, slot0.defaultFleetName(slot0._currentFleetVO))
	setText(slot0._fleetNumText, slot0._currentFleetVO.id - 10)

	return
end

function slot0.SetFleetStepper(slot0)
	setActive(slot0._nextPage, slot0:getNextFleetID() ~= nil)
	setActive(slot0._prevPage, slot0:getPrevFleetID() ~= nil)

	return
end

function slot0.willExit(slot0)
	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	slot0:recycleCharacterList(slot0._currentFleetVO.subShips, slot0._characterList[Fleet.SUBMARINE])

	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end

	for slot4, slot5 in ipairs(slot0._attachmentList) do
		Object.Destroy(slot5)
	end

	slot0._attachmentList = nil

	return
end

return slot0
