slot0 = class("BattleScene", import("..base.BaseUI"))
slot0.IN_VIEW_FRIEND_SKILL_OFFSET = Vector3(-5, 0, 6)
slot0.IN_VIEW_FOE_SKILL_OFFSET = Vector3(-15, 0, 6)
slot0.FOE_SIDE_X_OFFSET = 250
slot0.SIDE_ALIGNMENT = {
	{
		-120,
		-45,
		-195
	},
	{
		30,
		105,
		180
	},
	{
		-270,
		-345,
		-420
	}
}

function slot0.getUIName(slot0)
	return "CombatUI"
end

function slot0.getBGM(slot0)
	return ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot1).bgm or "battle-1"
end

function slot0.init(slot0)
	slot1 = GameObject.Find("MainCamera")
	slot0.uiCanvas = findTF(slot2, "Canvas/UIMain")
	slot0.skillTips = slot0:findTF("Skill_Activation")
	slot0.skillRoot = slot0:findTF("Skill_Activation/Root")
	slot0.skillTpl = slot0:findTF("Skill_Activation/mask").gameObject
	slot0._skillFloatPool = pg.Pool.New(slot0.skillRoot, slot0.skillTpl, 4, 10, true, false):InitSize()
	slot0.skillCMDRoot = slot0:findTF("Skill_Activation/Root_cmd")
	slot0.skillCMDTpl = slot0:findTF("Skill_Activation/mask_cmd").gameObject
	slot0._skillFloatCMDPool = pg.Pool.New(slot0.skillCMDRoot, slot0.skillCMDTpl, 2, 4, true, false):InitSize()
	slot0.popupTpl = slot0:getTpl("popup")

	SetActive(slot0._go, false)

	slot0._skillPaintings = {}
	slot0._skillFloat = true
	slot0._cacheSkill = {}
	slot0._commanderSkillList = {}
	slot0._sideSkillFloatStateList = {
		[ys.Battle.BattleConfig.FRIENDLY_CODE] = {
			{},
			{},
			{}
		},
		[ys.Battle.BattleConfig.FOE_CODE] = {
			{},
			{},
			{}
		}
	}

	slot0:initPainting()
end

function slot0.initPainting(slot0)
	slot2 = ys.Battle.BattleResourceManager:GetInstance().InstSkillPaintingUI(slot1)

	setParent(slot2, slot0.uiCanvas, false)

	slot0._paintingUI = slot2
	slot0._paintingAnimator = slot2:GetComponent(typeof(Animator))
	slot0._paintingAnimator.enabled = false
	slot0._paintingParticleContainer = findTF(slot2, "particleContainer")
	slot0._paintingParticles = findTF(slot0._paintingParticleContainer, "effect")
	slot0._paintingParticleSystem = slot0._paintingParticles:GetComponent(typeof(ParticleSystem))

	slot0._paintingParticleSystem:Stop(true)

	slot0._paintingFitter = findTF(slot2, "hero/fitter")

	removeAllChildren(slot0._paintingFitter)

	GetOrAddComponent(slot0._paintingFitter, "PaintingScaler").FrameName = "lihuisha"
	GetOrAddComponent(slot0._paintingFitter, "PaintingScaler").Tween = 1

	slot2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		setActive(slot0._currentPainting, false)

		slot0._currentPainting = nil
	end)
end

function slot0.EnableSkillFloat(slot0, slot1)
	if slot1 == slot0._skillFloat then
		return
	end

	slot0._skillFloat = slot1

	if slot0._skillFloat then
		for slot5, slot6 in ipairs(slot0._cacheSkill) do
			slot0:appendSkill(slot6.skillName, slot6.caster)
		end

		slot0._cacheSkill = {}
	else
		slot0._skillFloatPool:AllRecycle()
		slot0._skillFloatCMDPool:AllRecycle()

		slot0._preCommanderSkillTF = nil
		slot0._preSkillTF = nil
	end

	SetActive(slot0.skillTips, slot1)
end

function slot0.appendSkill(slot0, slot1, slot2, slot3)
	if not slot0._skillFloat then
		table.insert(slot0._cacheSkill, {
			skillName = slot1,
			caster = slot2,
			commander = slot3
		})

		return
	end

	slot4 = ys.Battle.BattleResourceManager:GetInstance()
	slot5, slot6 = nil

	if slot3 then
		if slot0._commanderSkillList[slot3] and slot0._commanderSkillList[slot3][slot1] then
			return
		end

		slot5 = slot0._skillFloatCMDPool
		slot6 = slot4:GetCommanderHrzIcon(slot3)
	else
		slot5 = slot0._skillFloatPool

		setText(findTF(slot8, "skill/skill_name/Text"), HXSet.hxLan(slot1))

		findTF(slot8, "skill/icon").GetComponent(slot9, typeof(Image)).sprite = (slot2:GetUnitType() ~= ys.Battle.BattleConst.UnitType.PLAYER_UNIT or slot4:GetCharacterIcon(slot2:GetTemplate().painting)) and slot4:GetCharacterIcon(pg.enemy_data_statistics[slot2:GetTemplateID()].icon)
		slot11, slot12 = slot2:GetIFF()
		findTF(slot8, "skill/skill_name"):GetComponent(typeof(Image)).color = (slot2:GetIFF() ~= ys.Battle.BattleConfig.FRIENDLY_CODE or Color.New(1, 1, 1, 1)) and Color.New(1, 0.33, 0.33, 1)
		findTF(slot8, "skill"):GetComponent(typeof(Image)).color = (slot2.GetIFF() ~= ys.Battle.BattleConfig.FRIENDLY_CODE or Color.New(1, 1, 1, 1)) and Color.New(1, 0.33, 0.33, 1)
	end

	if slot3 then
		slot0:commanderSkillFloat(slot3, slot1, slot7)
	elseif ys.Battle.BattleCameraUtil:GetInstance():GetCharacterArrowBarPosition(ys.Battle.BattleVariable.CameraPosToUICamera(slot2:GetPosition())) == nil or (not slot2:IsMainFleetUnit() and slot2:GetTemplate().type ~= ShipType.Qianting) then
		slot8.position = Vector3((slot11 ~= ys.Battle.BattleConfig.FRIENDLY_CODE or ys.Battle.BattleVariable.CameraPosToUICamera(slot2:GetPosition() + slot0.IN_VIEW_FRIEND_SKILL_OFFSET)) and ys.Battle.BattleVariable.CameraPosToUICamera(slot2:GetPosition() + slot0.IN_VIEW_FOE_SKILL_OFFSET).x, (slot11 ~= ys.Battle.BattleConfig.FRIENDLY_CODE or ys.Battle.BattleVariable.CameraPosToUICamera(slot2.GetPosition() + slot0.IN_VIEW_FRIEND_SKILL_OFFSET)) and ys.Battle.BattleVariable.CameraPosToUICamera(slot2.GetPosition() + slot0.IN_VIEW_FOE_SKILL_OFFSET).y, -2)

		if slot0._preSkillTF then
			slot0.handleSkillFloatCld(slot0._preSkillTF, slot8)
		end

		slot0._preSkillTF = slot8

		slot8:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
			slot0._preSkillTF = nil

			slot0:Recycle(slot0)
		end)
	else
		slot15, slot16 = slot2:GetMainUnitIndex()
		slot17 = slot0.SIDE_ALIGNMENT[slot15]

		for slot22 = 1, #slot0._sideSkillFloatStateList[slot11][slot15], 1 do
			if slot18[slot22] then
				slot16 = slot22

				break
			end
		end

		if slot16 == nil then
			slot16 = #slot18 + 1
		end

		slot18[slot16] = false
		slot8.position = slot14
		slot8.anchoredPosition.y = slot17[slot16]

		if slot11 == ys.Battle.BattleConfig.FOE_CODE then
			slot19.x = slot0.FOE_SIDE_X_OFFSET
		end

		slot8.anchoredPosition = slot19

		slot8:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
			slot0[] = true

			slot0:Recycle(true)
		end)
	end
end

function slot0.shipSkillFloat(slot0)
	return
end

function slot0.handleSkillFloatCld(slot0, slot1)
	if math.floor(math.abs(slot1.anchoredPosition.y - slot0.anchoredPosition.y)) <= 75 then
		slot2.y = slot3 + 75
		slot1.anchoredPosition = slot2
	end
end

function slot0.handleSkillSinkCld(slot0, slot1)
	return
end

function slot0.commanderSkillFloat(slot0, slot1, slot2, slot3)
	slot0._commanderSkillList[slot1] = slot0._commanderSkillList[slot1] or {}
	slot0._commanderSkillList[slot1][slot2] = true
	slot3.transform.anchoredPosition.x = 0
	slot3.transform.anchoredPosition.y = 0
	slot3.transform.anchoredPosition = slot3.transform.anchoredPosition

	if slot0._preCommanderSkillTF and math.floor(math.abs(slot5.y - slot0._preCommanderSkillTF.anchoredPosition.y)) <= 65 then
		slot5.y = slot6 - 65
	end

	slot4.anchoredPosition = slot5
	slot0._preCommanderSkillTF = slot4

	slot4:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		slot0._commanderSkillList[][slot0._commanderSkillList] = nil
		slot0._preCommanderSkillTF = nil

		slot0._skillFloatCMDPool:Recycle(nil)
	end)
end

function slot0.painting(slot0, slot1, slot2, slot3)
	if slot0._currentPainting then
		slot0._paintingAnimator.enabled = false

		setActive(slot0._currentPainting, false)
	end

	if slot0._skillPaintings[slot1.id] == nil then
		slot4 = nil

		if HXSet.isHx() then
			slot4 = slot1.painting
		else
			if slot1.painting_hx == "" or not slot1.painting_hx then
				slot4 = slot1.painting
			end
		end

		slot6 = ys.Battle.BattleResourceManager:GetInstance()
		slot5 = ys.Battle.BattleResourceManager.GetInstance().InstPainting
		slot7 = slot4 or slot1.prefab
		slot0._skillPaintings[slot1.id] = slot5(ys.Battle.BattleResourceManager.GetInstance(), slot7)

		setParent(slot5(ys.Battle.BattleResourceManager.GetInstance(), slot7), slot0._paintingFitter, false)

		slot7 = slot1.prefab
	end

	slot0._currentPainting = slot0._skillPaintings[slot1.id]

	setActive(slot0._currentPainting, true)
	LuaHelper.SetParticleSpeed(slot0._paintingUI, slot2)

	slot0._paintingUI.transform.localScale = Vector3(slot3, 1, 1)
	slot0._paintingParticleContainer.transform.localScale = Vector3(slot3, 1, 1)
	slot0._paintingParticles.transform.localEulerAngles = Vector3(0, 90 * slot3, 0)

	slot0._paintingParticleSystem:Play(true)

	slot0._paintingAnimator.speed = slot2
	slot0._paintingAnimator.enabled = true

	slot0._paintingAnimator:Play("skill_painting", -1, 0)
end

function slot0.didEnter(slot0)
	slot0.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)
	slot1 = ys.Battle.BattleState.GetInstance()

	slot1:SetBattleUI(slot0)
	onButton(slot0, slot0:findTF("PauseBtn"), function ()
		slot0:emit(BattleMediator.ON_PAUSE)

		return
	end, SFX_CONFIRM)
	onButton(slot0, slot2, function ()
		slot0:emit(BattleMediator.ON_CHAT, slot0:findTF("chatContainer"))
		setActive(slot0, false)

		return
	end)
	setActive(slot2, false)
	onToggle(slot0, slot0:findTF("AutoBtn"), function (slot0)
		slot0:emit(BattleMediator.ON_AUTO, {
			isOn = not slot0,
			toggle = slot0:findTF("AutoBtn")
		})
		slot0.emit:ActiveBot(BattleScene.autoBotIsAcitve)

		slot1 = setActive
		slot2 = slot0.emit

		if BattleScene.autoBotIsAcitve then
			if slot0.hideChatFlag and slot0.hideChatFlag == 1 then
				slot3 = false
			else
				slot3 = true
			end
		end

		slot1(slot2, slot3)

		return
	end, SFX_PANEL, SFX_PANEL)
	slot1:ConfigBattleEndFunc(function (slot0)
		slot0:clear()
		slot0:emit(BattleMediator.ON_BATTLE_RESULT, slot0)

		return
	end)
	slot0:emit(BattleMediator.ENTER)
	slot0:initPauseWindow()

	if slot0.contextData.prePause then
		triggerButton(slot0:findTF("PauseBtn"))
	end

	return
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.pauseWindow) then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.continueBtn)
	end

	return
end

function slot0.activeBotHelp(slot0, slot1)
	slot2 = getProxy(PlayerProxy)

	if not slot1 then
		if slot0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if slot2.botHelp then
		return
	end

	slot0.autoBotHelp = true

	pg.MsgboxMgr.GetInstance():ShowHelpWindow({
		helps = i18n("help_battle_auto"),
		custom = {
			{
				text = "text_confirm",
				sound = SFX_CANCEL
			}
		},
		onClose = function ()
			slot0.autoBotHelp = false

			return
		end
	})

	slot2.botHelp = true

	return
end

function slot0.exitBattle(slot0, slot1)
	if not slot1 then
		slot0:emit(BattleMediator.ON_BACK_PRE_SCENE)
	else
		if slot1 == "kick" then
		end
	end

	return
end

function slot0.setChapter(slot0, slot1)
	slot0._chapter = slot1

	return
end

function slot0.setFleet(slot0, slot1, slot2)
	slot0._mainShipVOs = slot1
	slot0._vanShipVOs = slot2

	return
end

function slot0.initPauseWindow(slot0)
	slot0.pauseWindow = slot0:findTF("Msgbox")
	slot0.LeftTimeContainer = slot0:findTF("window/LeftTime", slot0.pauseWindow)
	slot0.LeftTime = slot0:findTF("window/LeftTime/Text", slot0.pauseWindow)
	slot0.mainTFs = {}
	slot0.vanTFs = {}

	function slot1(slot0, slot1, slot2)
		for slot6 = 1, 3, 1 do
			slot8 = setActive
			slot9 = slot1:Find("ship_" .. slot6)

			if slot2 then
				if slot6 > #slot2 then
					slot10 = false
				else
					slot10 = true
				end
			end

			slot8(slot9, slot10)

			if slot2 and slot6 <= #slot2 then
				updateShip(slot7, slot2[slot6])
			end

			slot8 = table.insert

			if not slot0 or not slot0.mainTFs then
				slot9 = slot0.vanTFs
			end

			slot8(slot9, slot7)
		end

		if slot2 then
			slot3 = 0

			for slot7, slot8 in ipairs(slot2) do
				slot3 = slot3 + slot8:getShipCombatPower()
			end

			setText(slot1:Find("power/value"), math.floor(slot3))
		end

		return
	end

	if slot0._mainShipVOs then
		slot1(true, slot0:findTF("window/main", slot0.pauseWindow), slot0._mainShipVOs)
		slot1(false, slot0:findTF("window/van", slot0.pauseWindow), slot0._vanShipVOs)
	end

	slot3 = findTF(slot0.pauseWindow, "window/Chapter")
	slot4 = findTF(slot0.pauseWindow, "window/Chapter/Text")

	if ys.Battle.BattleState.GetInstance().GetBattleType(slot2) == SYSTEM_SCENARIO then
		setText(slot3, slot0._chapter:getConfigTable().chapter_name)
		setText(slot4, slot0._chapter.getConfigTable().name)
	else
		if slot5 == SYSTEM_SHAM then
			setText(slot3, "SP")
			setText(slot4, slot0._chapter:getConfig("name"))
		else
			if slot5 == SYSTEM_ROUTINE or slot5 == SYSTEM_DUEL or slot5 == SYSTEM_HP_SHARE_ACT_BOSS or slot5 == SYSTEM_ACT_BOSS then
				setText(slot3, "SP")
				setText(slot4, pg.expedition_data_template[slot2:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().StageTmpId].name)
			else
				if slot5 == SYSTEM_DEBUG then
					setText(slot3, "??")
					setText(slot4, "碧蓝梦境")
				else
					if slot5 == SYSTEM_CHALLENGE then
						setText(slot3, "SP")
						setText(slot4, pg.expedition_data_template[slot0._chapter:getChallengeStageID()].name)
						setActive(slot0.LeftTimeContainer, false)
					end
				end
			end
		end
	end

	onButton(slot0, slot0:findTF("window/button_container/leave", slot0.pauseWindow), function ()
		slot0:emit(BattleMediator.ON_LEAVE)

		return
	end)

	slot0.continueBtn = slot0:findTF("window/button_container/continue", slot0.pauseWindow)

	onButton(slot0, slot0.continueBtn, function ()
		setActive(slot0.pauseWindow, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)
		pg.UIMgr.GetInstance():Resume()

		return
	end)
	onButton(slot0, slot0:findTF("help", slot0.pauseWindow), function ()
		if BATTLE_DEBUG and PLATFORM == 7 then
			setActive(slot0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)
			pg.UIMgr.GetInstance():Resume()
			pg.UIMgr.GetInstance():OpenConsole()
		else
			pg.MsgboxMgr.GetInstance():ShowHelpWindow({
				helps = i18n("help_battle_rule")
			})
		end

		return
	end)
	onButton(slot0, slot0:findTF("top/btnBack", slot0.pauseWindow), function ()
		triggerButton(slot0.continueBtn)

		return
	end)
	onButton(slot0, slot0.pauseWindow, function ()
		triggerButton(slot0.continueBtn)

		return
	end)
	setActive(slot0.pauseWindow, false)

	return
end

function slot0.updatePauseWindow(slot0)
	if not slot0.pauseWindow then
		return
	end

	setActive(slot0.pauseWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.pauseWindow)

	slot3 = ys.Battle.BattleState.GetInstance().GetProxyByName(slot2, ys.Battle.BattleDataProxy.__name)
	slot4 = slot3:GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE)

	slot1(slot0._mainShipVOs, slot5, slot0.mainTFs)
	slot1(slot0._vanShipVOs, slot6, slot0.vanTFs)
	setText(slot0.LeftTime, ys.Battle.BattleTimerView.formatTime(math.floor(slot3:GetCountDown())))

	return
end

function slot0.OnCloseChat(slot0)
	setActive(slot0:findTF("chatBtn"), ys.Battle.BattleState.GetInstance():IsBotActive())

	return
end

function slot0.clear(slot0)
	slot0._preSkillTF = nil
	slot0._preCommanderSkillTF = nil
	slot0._commanderSkillList = nil
	slot0._skillPaintings = nil
	slot0._currentPainting = nil

	Destroy(slot0._paintingUI)

	return
end

function slot0.willExit(slot0)
	slot0._skillFloatPool:Dispose()
	slot0._skillFloatCMDPool:Dispose()
	ys.Battle.BattleState.GetInstance():ExitBattle()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)

	return
end

return slot0
