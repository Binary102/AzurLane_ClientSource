slot0 = class("ChallengePreCombatLayer", import("..base.BaseUI"))
slot1 = import("..ship.FormationUI")
slot2 = {
	[99.0] = true
}

function slot0.getUIName(slot0)
	return "ChallengePreCombatUI"
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0._guiderLoaded = true
	slot0._startBtn = slot0:findTF("right/start")
	slot0._backBtn = slot0:findTF("top/title/back")
	slot0._moveLayer = slot0:findTF("moveLayer")
	slot1 = slot0:findTF("middle")
	slot0._mainGS = slot1:Find("gear_score/main/Text")
	slot0._vanguardGS = slot1:Find("gear_score/vanguard/Text")

	setText(slot0._mainGS, 0)
	setText(slot0._vanguardGS, 0)

	slot0._gridTFs = {
		vanguard = {},
		main = {}
	}
	slot0._gridFrame = slot1:Find("mask/GridFrame")

	for slot5 = 1, 3, 1 do
		slot0._gridTFs[TeamType.Vanguard][slot5] = slot0._gridFrame:Find("vanguard_" .. slot5)
		slot0._gridTFs[TeamType.Main][slot5] = slot0._gridFrame:Find("main_" .. slot5)
	end

	slot0._heroContainer = slot1:Find("HeroContainer")
	slot0._strategy = slot1:Find("strategy")

	setActive(slot0._strategy, true)

	slot0._playerResOb = slot0:findTF("top/title/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0._spoilsContainer = slot0:findTF("right/infomation/spoils/items/items_container")
	slot0._goals = slot0:findTF("right/infomation/goal")
	slot0._challenge = slot0:findTF("right/infomation/challenge/goal")
	slot0._heroInfo = slot0:getTpl("heroInfo")
	slot0._starTpl = slot0:getTpl("star_tpl")
	slot0._middle = slot0:findTF("middle")
	slot0._right = slot0:findTF("right")
	slot0._fleet = slot0:findTF("middle/fleet")
	slot0._ship_tpl = findTF(slot0._fleet, "shiptpl")
	slot0._empty_tpl = findTF(slot0._fleet, "emptytpl")

	setActive(slot0._ship_tpl, false)
	setActive(slot0._empty_tpl, false)

	slot0.topPanel = slot0:findTF("top")
	slot0.strategyInfo = slot0:findTF("strategy_info", slot0.topPanel)

	setActive(slot0.strategyInfo, false)
	setAnchoredPosition(slot0._middle, {
		x = -840
	})
	setAnchoredPosition(slot0._right, {
		x = 470
	})

	slot0._attachmentList = {}
end

function slot0.uiStartAnimating(slot0)
	shiftPanel(slot0._middle, 0, nil, 0.3, 0, true, true)
	shiftPanel(slot0._right, 0, nil, 0.3, 0, true, true, nil, function ()
		slot0:dispatchUILoaded(true)
	end)
	shiftPanel(slot0.topPanel, nil, 0, slot2, slot1, true, true, nil, nil)

	slot0.tweens = topAnimation(slot0:findTF("title/bg/left", slot0.topPanel), slot0:findTF("title/bg/right", slot0.topPanel), slot0:findTF("title/bg/title_formation", slot0.topPanel), slot0:findTF("title/bg/formation", slot0.topPanel), 0.27, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0._middle, -840, nil, dur, delay, true, true)
	shiftPanel(slot0._right, 470, nil, dur, delay, true, true)
	shiftPanel(slot0.topPanel, nil, slot0.topPanel.rect.height, dur, delay, true, true, nil, nil)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._backBtn, function ()
		GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

		slot0:uiExitAnimating()
		LeanTween.delayedCall(0.3, System.Action(function ()
			slot0:emit(slot1.ON_CLOSE)
		end))
	end, SFX_CANCEL)
	onButton(slot0, slot0._startBtn, function ()
		slot0:emit(ChallengePreCombatMediator.ON_START)
	end, SFX_UI_WEIGHANCHOR)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	setAnchoredPosition(slot0.topPanel, {
		y = slot0.topPanel.rect.height
	})
	onNextTick(function ()
		slot0:uiStartAnimating()
	end)
end

function slot0.onBackPressed(slot0)
	if slot0.strategyPanel and slot0.strategyPanel._go and isActive(slot0.strategyPanel._go) then
		playSoundEffect(SFX_CANCEL)
		slot0:hideStrategyInfo()
	else
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0._backBtn)
	end
end

function slot0.setPlayerInfo(slot0, slot1)
	slot0._resPanel:setResources(slot1)
end

function slot0.updateChallenge(slot0, slot1, slot2)
	slot0.challengeInfo = slot1

	slot0:updateView(true)
end

function slot0.updateView(slot0, slot1)
	slot2 = nil

	coroutine.wrap(function ()
		pg.UIMgr:GetInstance():LoadingOn()
		pg.UIMgr.GetInstance().LoadingOn:resetGrid(TeamType.Vanguard)
		pg.UIMgr.GetInstance().LoadingOn.resetGrid:resetGrid(TeamType.Main)

		if pg.UIMgr.GetInstance().LoadingOn.resetGrid then
			slot0:updateStageView()
			onNextTick(slot2)
			coroutine.yield()
			coroutine.yield:loadAllCharacter(function ()
				onNextTick(onNextTick)
			end)
			coroutine.yield()
		else
			slot0:setAllCharacterPos(true)
		end

		slot0:updateBattleFleetView()
		onNextTick(slot2)
		coroutine.yield()
		coroutine.yield:updateStrategyIcon()
		coroutine.yield.updateStrategyIcon:displayFleetInfo()
		pg.UIMgr:GetInstance():LoadingOff()
	end)()
end

function slot0.updateStageView(slot0)
	setActive(slot2, false)
	setActive(slot3, false)
	setWidgetText(slot1, i18n("battle_preCombatLayer_victory"))
	setWidgetText(slot4, i18n("challenge_current_level", slot0.challengeInfo.challengeLevel))
	setWidgetText(slot5, i18n("challenge_current_score", slot0.challengeInfo.currentScore))
	setWidgetText(findTF(slot0._challenge, "goal_time"), i18n("challenge_total_score", slot0.challengeInfo.maxScore))
end

function slot0.updateBattleFleetView(slot0)
	slot1(slot0._fleet:Find("main"), slot0.challengeInfo.fleet.getShipsByTeam(slot2, TeamType.Main, true))
	function (slot0, slot1)
		removeAllChildren(slot0)

		for slot5 = 1, 3, 1 do
			if slot1[slot5] then
				slot6 = cloneTplTo(slot0._ship_tpl, slot0)

				updateShip(slot6, slot1[slot5])

				slot8 = findTF(slot6, "blood")

				setActive(findTF(slot6, "blood/fillarea/green"), ChapterConst.HpGreen <= slot1[slot5].hpRant)
				setActive(findTF(slot6, "blood/fillarea/red"), slot7 < ChapterConst.HpGreen)

				slot8:GetComponent(typeof(Slider)).fillRect = (ChapterConst.HpGreen <= slot7 and slot9) or findTF(slot6, "blood/fillarea/red")

				setSlider(slot8, 0, 10000, slot7)
				setActive(findTF(slot6, "mask"), slot7 <= 0)
			end
		end
	end(slot0._fleet:Find("vanguard"), slot0.challengeInfo.fleet:getShipsByTeam(TeamType.Vanguard, true))
end

function slot0.loadAllCharacter(slot0, slot1)
	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		[TeamType.Vanguard] = {},
		[TeamType.Main] = {}
	}

	function slot2(slot0, slot1, slot2, slot3)
		if slot0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(slot1:getPrefab(), slot0)

			return
		end

		slot0._characterList[slot2][slot3] = slot0

		tf(slot0):SetParent(slot0._heroContainer, false)

		tf(slot0).localScale = Vector3(0.5, 0.5, 1)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
		slot0:enabledCharacter(slot0, true, slot1, slot2)
		slot0:setCharacterPos(slot2, slot3, slot0)
		slot0:sortSiblingIndex()

		for slot8, slot9 in pairs(slot4) do
			if slot9.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot10, slot10, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
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

		slot5 = cloneTplTo(slot0._heroInfo, slot0)

		setAnchoredPosition(slot5, {
			x = 0,
			y = 0
		})

		slot5.localScale = Vector3(2, 2, 1)

		SetActive(slot5, true)

		slot5.name = "info"
		slot7 = findTF(slot6, "stars")

		for slot12 = 1, slot1:getStar(), 1 do
			cloneTplTo(slot0._starTpl, slot7)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot1.configId)
		end

		setImageSprite(findTF(slot6, "type"), slot9, true)
		setText(findTF(slot6, "frame/lv_contain/lv"), slot1.level)
		setActive(findTF(slot10, "fillarea/green"), ChapterConst.HpGreen <= slot1.hpRant)
		setActive(findTF(slot10, "fillarea/red"), slot1.hpRant < ChapterConst.HpGreen)

		slot10:GetComponent(typeof(Slider)).fillRect = (ChapterConst.HpGreen <= slot1.hpRant and slot11) or findTF(slot10, "fillarea/red")

		setSlider(slot10, 0, 10000, slot1.hpRant)
	end

	slot4(TeamType.Vanguard)
	slot4(TeamType.Main)
	seriesAsync({}, function (slot0)
		if slot0 then
			slot0()
		end
	end)
end

function slot0.setAllCharacterPos(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._characterList[TeamType.Vanguard]) do
		slot0:setCharacterPos(TeamType.Vanguard, slot5, slot6, slot1)
	end

	for slot5, slot6 in ipairs(slot0._characterList[TeamType.Main]) do
		slot0:setCharacterPos(TeamType.Main, slot5, slot6, slot1)
	end

	slot0:sortSiblingIndex()
end

function slot0.setCharacterPos(slot0, slot1, slot2, slot3, slot4)
	SetActive(slot3, true)

	slot6 = slot0._gridTFs[slot1][slot2].localPosition

	LeanTween.cancel(go(slot3))

	if slot4 then
		tf(slot3).localPosition = Vector3(slot6.x + 2, slot6.y - 80, slot6.z)

		LeanTween.moveLocalY(go(slot3), slot6.y - 110, 0.5):setDelay(0.5)
	else
		tf(slot3).localPosition = Vector3(slot6.x + 2, slot6.y - 110, slot6.z)
	end

	SetActive(slot5:Find("shadow"), true)
	slot3:GetComponent("SpineAnimUI"):SetAction("stand", 0)
end

function slot0.resetGrid(slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		SetActive(slot7:Find("shadow"), false)
	end
end

function slot0.switchToEditMode(slot0)
	slot1(slot0._characterList[TeamType.Vanguard])
	slot1(slot0._characterList[TeamType.Main])

	slot0._shiftIndex = nil

	slot0:updateView(false)
end

function slot0.switchToShiftMode(slot0, slot1, slot2)
	for slot6 = 1, 3, 1 do
		setActive(slot0._gridTFs[TeamType.Vanguard][slot6].Find(slot7, "tip"), false)
		setActive(slot0._gridTFs[TeamType.Main][slot6].Find(slot8, "tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot8 ~= slot1 then
			LeanTween.moveLocalY(go(slot8), slot0._gridTFs[slot2][slot7].localPosition.y - 80, 0.5)

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

function slot0.shift(slot0, slot1, slot2, slot3)
	tf(slot8).localPosition = Vector3(slot0._gridTFs[slot3][slot1].localPosition.x + 2, slot0._gridTFs[slot3][slot1].localPosition.y - 80, slot0._gridTFs[slot3][slot1].localPosition.z)

	LeanTween.cancel(go(slot8))

	slot0._characterList[slot3][slot2] = slot0._characterList[slot3][slot1]
	slot0._characterList[slot3][slot1] = slot0._characterList[slot3][slot2]

	slot0.challengeInfo.fleet.switchShip(slot6, slot0.challengeInfo.fleet.getShipsByTeam(slot6, slot3, false)[slot1].id, slot0.challengeInfo.fleet.getShipsByTeam(slot6, slot3, false)[slot2].id)

	slot0._shiftIndex = slot2

	slot0:sortSiblingIndex()
end

function slot0.sortSiblingIndex(slot0)
	slot1 = 3
	slot2 = 0

	while slot1 > 0 do
		slot4 = slot0._characterList[TeamType.Vanguard][slot1]

		if slot0._characterList[TeamType.Main][slot1] then
			tf(slot3):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
		end

		if slot4 then
			tf(slot4):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
		end

		slot1 = slot1 - 1
	end
end

function slot0.enabledTeamCharacter(slot0, slot1, slot2)
	slot4 = slot0.challengeInfo.fleet[slot1]

	for slot8, slot9 in ipairs(slot3) do
		slot0:enabledCharacter(slot9, slot2, slot4[slot8], slot1)
	end
end

function slot0.enabledCharacter(slot0, slot1, slot2, slot3, slot4)
	if slot2 then
		slot5, slot6, slot7 = tf(slot1):Find("mouseChild")

		if slot5 then
			SetActive(slot5, true)
		else
			tf(slot5):SetParent(tf(slot1))

			tf(slot5).localPosition = Vector3.zero
			slot0.eventTriggers[GetOrAddComponent(slot5, "EventTriggerListener")] = true

			GetOrAddComponent(slot5, "ModelDrag").Init(slot6)

			slot8 = GameObject("mouseChild").GetComponent(slot5, typeof(RectTransform))
			slot8.sizeDelta = Vector2(2.5, 2.5)
			slot8.pivot = Vector2(0.5, 0)
			slot8.anchoredPosition = Vector2(0, 0)

			GetOrAddComponent(slot5, "EventTriggerListener").AddBeginDragFunc(slot7, function ()
				screenWidth = UnityEngine.Screen.width
				screenHeight = UnityEngine.Screen.height
				widthRate = rtf(slot0._tf).rect.width / screenWidth
				heightRate = rtf(slot0._tf).rect.height / screenHeight

				LeanTween.cancel(go(go))
				LeanTween.cancel:switchToShiftMode(LeanTween.cancel, )
				LeanTween.cancel:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)
				tf(LeanTween.cancel.GetComponent("SpineAnimUI")):SetParent(slot0._moveLayer, false)
				playSoundEffect(SFX_UI_HOME_DRAG)
			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddDragFunc(slot7, function (slot0, slot1)
				rtf(slot0).anchoredPosition = Vector2((slot1.position.x - screenWidth / 2) * widthRate + 20, (slot1.position.y - screenHeight / 2) * heightRate - 20)
			end)
			GetOrAddComponent(slot5, "EventTriggerListener"):AddDragEndFunc(function (slot0, slot1)
				slot0:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)
				tf(slot0):SetParent(slot1._heroContainer, false)
				slot1:switchToEditMode()
				slot1:sortSiblingIndex()
				slot1:updateFleet()
				playSoundEffect(SFX_UI_HOME_PUT)
			end)
		end
	else
		SetActive(tf(slot1):Find("mouseChild"), false)
	end
end

function slot0.updateFleet(slot0)
	slot0:emit(ChallengePreCombatMediator.ON_UPDATE_FLEET, slot0.challengeInfo.fleet)
end

function slot0.displayFleetInfo(slot0)
	slot4, slot5 = slot0.challengeInfo.fleet.getCost(slot1)
	slot6 = slot4.oil + slot5.oil

	slot0.tweenNumText(slot0._vanguardGS, slot2)
	slot0.tweenNumText(slot0._mainGS, _.reduce(slot0.challengeInfo.fleet.getShipsByTeam(slot1, TeamType.Main, false), 0, function (slot0, slot1)
		return slot0 + slot1:getShipCombatPower()
	end))
end

function slot0.updateStrategyIcon(slot0)
	slot2 = _.detect(slot1, function (slot0)
		return slot0.id == ChapterConst.StrategyRepair
	end)

	GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot2.id].icon, "", slot0._strategy:Find("icon"))
	onButton(slot0, slot0._strategy, function ()
		slot0:displayStrategyInfo(slot0)
	end, SFX_PANEL)
	setText(slot0._strategy:Find("nums"), slot2.count)
	setActive(slot0._strategy:Find("mask"), slot2.count == 0)
	setActive(slot0._strategy:Find("selected"), false)
end

function slot0.displayStrategyInfo(slot0, slot1)
	slot0.strategyPanel = slot0.strategyPanel or StrategyPanel.New(slot0.strategyInfo)

	slot0.strategyPanel:attach(slot0)
	slot0.strategyPanel:set(slot1)

	function slot0.strategyPanel.onConfirm()
		if not slot0.challengeInfo.fleet:canUseStrategy(pg.strategy_data_template[slot1.id]) then
			return
		end

		slot0:emit(ChallengePreCombatMediator.ON_OP, {
			id = slot1.id,
			arg1 = slot1.id
		})
		slot0:hideStrategyInfo()
	end

	function slot0.strategyPanel.onCancel()
		slot0:hideStrategyInfo()
	end
end

function slot0.hideStrategyInfo(slot0)
	if slot0.strategyPanel then
		slot0.strategyPanel:detach()
	end
end

function slot0.recycleCharacterList(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot1) do
		if slot2[slot6] then
			PoolMgr.GetInstance():ReturnSpineChar(slot7:getPrefab(), slot2[slot6])

			slot2[slot6] = nil
		end
	end
end

function slot0.willExit(slot0)
	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end

	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	for slot4, slot5 in ipairs(slot0._attachmentList) do
		Object.Destroy(slot5)
	end

	slot0._attachmentList = nil

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	slot0:recycleCharacterList(slot0.challengeInfo.fleet.getShipsByTeam(slot1, TeamType.Main, false), slot0._characterList[TeamType.Main])
	slot0:recycleCharacterList(slot0.challengeInfo.fleet.getShipsByTeam(slot1, TeamType.Vanguard, false), slot0._characterList[TeamType.Vanguard])
end

return slot0
