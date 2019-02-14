slot0 = class("BattleResultLayer", import("..base.BaseUI"))
slot0.DURATION_WIN_FADE_IN = 0.5
slot0.DURATION_LOSE_FADE_IN = 1.5
slot0.DURATION_GRADE_LAST = 1.5
slot0.DURATION_MOVE = 0.7
slot0.DURATION_WIN_SCALE = 0.7

function slot0.getUIName(slot0)
	return "BattleResultUI"
end

function slot0.setRivalVO(slot0, slot1)
	slot0.rivalVO = slot1
end

function slot0.setRank(slot0, slot1, slot2)
	slot0.player = slot1
	slot0.season = slot2

	setText(slot0._playerName, slot0.player.name)

	slot4, slot5 = SeasonInfo.getNextMilitaryRank(slot2.score, slot2.rank)

	setText(slot0._playerLv, SeasonInfo.getMilitaryRank(slot2.score, slot2.rank).name)

	slot0._playerExpProgress:GetComponent(typeof(Image)).fillAmount = slot2.score / slot5

	setText(slot0._playerBonusExp, i18n("word_rankScore") .. "+0")

	slot0.playerProgressLabel = i18n("word_rankScore") .. "+"
	slot0.calcPlayerProgress = slot0.calcPlayerRank
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	setText(slot0._playerName, slot0.player.name)
	setText(slot0._playerLv, "Lv." .. slot0.player.level)

	slot0._playerExpProgress:GetComponent(typeof(Image)).fillAmount = slot0.player.exp / getConfigFromLevel1(pg.user_level, slot0.player.level).exp_interval

	if slot0.player.level == pg.user_level[#pg.user_level].level then
		slot0._playerExpProgress:GetComponent(typeof(Image)).fillAmount = 1
	end

	setText(slot0._playerBonusExp, "EXP+0")

	slot0.playerProgressLabel = "EXP+"
	slot0.calcPlayerProgress = slot0.calcPlayerExp
end

function slot0.setExpBuff(slot0, slot1)
	slot0.expBuff = slot1
end

function slot0.init(slot0)
	slot0._grade = slot0:findTF("grade")
	slot0._gradeLabel = slot0:findTF("label", slot0._grade)
	slot0._gradeLabelImg = slot0._gradeLabel:GetComponent(typeof(Image))
	slot0._levelText = slot0:findTF("Text", slot0._grade)
	slot0.clearFX = slot0:findTF("clear")
	slot0._main = slot0:findTF("main")
	slot0._blurConatiner = slot0:findTF("blur_container")
	slot0._bg = slot0:findTF("main/bg")
	slot0._rankBG = slot0:findTF("main/rank")
	slot0._rankBG.localScale = Vector3(1, 0, 1)
	rtf(slot0._rankBG).anchoredPosition = Vector2(0, 0)
	slot0._painting = slot0:findTF("painting", slot0._blurConatiner)
	slot0._failPainting = slot0:findTF("fail", slot0._painting)
	slot0._chat = slot0:findTF("chat", slot0._painting)
	slot0._leftPanel = slot0:findTF("leftPanel", slot0._main)
	slot0.commanderBtn = slot0:findTF("exp_bar/commanderExp", slot0._leftPanel)
	slot0.commander2Btn = slot0:findTF("exp_bar/commanderExp2", slot0._leftPanel)
	slot0.commanderMsg = slot0:findTF("commander_panel")

	setActive(slot0.commanderMsg, false)
	setActive(slot0.commanderBtn, false)
	setActive(slot0.commander2Btn, false)

	slot0._expResult = slot0:findTF("expResult", slot0._leftPanel)
	slot0._expContainer = slot0:findTF("expContainer", slot0._expResult)
	slot0._extpl = slot0:getTpl("exp_tpl", slot0._expContainer)
	slot0._playerExp = slot0:findTF("exp_bar/playerExp", slot0._leftPanel)
	slot0._playerName = slot0:findTF("name_text", slot0._playerExp)
	slot0._playerLv = slot0:findTF("lv_text", slot0._playerExp)
	slot0._playerExpProgress = slot0:findTF("exp_progress", slot0._playerExp)
	slot0._playerBonusExp = slot0:findTF("exp_text", slot0._playerExp)
	slot0._atkBG = slot0:findTF("atkPanel", slot0._blurConatiner)
	slot0._atkPanel = slot0:findTF("atkResult", slot0._atkBG)
	slot0._atkResult = slot0:findTF("atkResult/result", slot0._atkBG)
	slot0._atkContainer = slot0:findTF("Grid", slot0._atkResult)
	slot0._atkTpl = slot0:getTpl("resulttpl", slot0._atkResult)
	slot0._rightBottomPanel = slot0:findTF("rightBottomPanel", slot0._blurConatiner)
	slot0._confirmBtn = slot0:findTF("confirmBtn", slot0._rightBottomPanel)
	slot0._statisticsBtn = slot0:findTF("statisticsBtn", slot0._rightBottomPanel)
	slot0._subExpResult = slot0:findTF("subExpResult", slot0._leftPanel)
	slot0._subExpContainer = slot0:findTF("expContainer", slot0._subExpResult)
	slot0._subToggle = slot0:findTF("switchFleet", slot0._leftPanel)
	slot0._skipBtn = slot0:findTF("skipLayer", slot0._tf)
	slot0.UIMain = pg.UIMgr:GetInstance().UIMain
	slot0.overlay = pg.UIMgr:GetInstance().OverlayMain
	slot2 = nil

	LoadImageSpriteAsync("battlescore/" .. ((slot0.contextData.score <= 0 or ({
		"grade_label_d",
		"grade_label_over_time",
		"grade_label_b",
		"grade_label_a",
		"grade_label_s"
	})[slot3 + 1]) and ((slot0.contextData.statistics._scoreMark == ys.Battle.BattleConst.DEAD_FLAG and "grade_label_flag_destroy") or "grade_label_team_kill")), slot0._gradeLabel, true)
	SetActive(slot0._levelText, false)
end

function slot0.displayerCommanders(slot0)
	slot0.commanderExps = slot0.contextData.commanderExps or {}

	setActive(slot0.commanderBtn, #slot0.commanderExps > 0)

	if #slot0.commanderExps > 0 then
		setText(slot0.commanderBtn:Find("Text"), "EXP+" .. slot0.commanderExps[1].exp)
		setActive(slot0.commanderBtn:Find("levelup"), getProxy(CommanderProxy).getCommanderById(slot2, slot0.commanderExps[1].commander_id):isLevelUp(slot0.commanderExps[1].exp))
	end

	setActive(slot0.commander2Btn, #slot0.commanderExps > 1)

	if #slot0.commanderExps > 1 then
		setText(slot0.commander2Btn:Find("Text"), "EXP+" .. slot0.commanderExps[2].exp)
		setActive(slot0.commander2Btn:Find("levelup"), getProxy(CommanderProxy).getCommanderById(slot3, slot0.commanderExps[2].commander_id):isLevelUp(slot0.commanderExps[2].exp))
	end
end

function slot0.openCommanderMsg(slot0)
	if #slot0.commanderExps <= 0 then
		return
	end

	if not slot0.isInitCommanderMsg then
		slot0.isInitCommanderMsg = true

		onButton(slot0, slot0.commanderMsg:Find("window/top/btnBack"), function ()
			slot0:closeCommanderMsg()
		end, SFX_PANEL)
	end

	function slot1(slot0, slot1, slot2)
		GetImageSpriteFromAtlasAsync("commandericon/" .. slot1:getPainting(), "", slot0:Find("icon"))
		setText(slot0:Find("name/Text"), slot1:getName())
		setText(slot0:Find("level"), "LV." .. slot1.level)
		setFillAmount(slot0:Find("expslider/bar"), slot1.exp / slot1:getNextLevelExp())
		setText(slot0:Find("expslider/Text"), "EXP+" .. slot2)
	end

	setActive(slot0.commanderMsg, true)

	slot2 = getProxy(CommanderProxy)

	for slot6 = 1, 4, 1 do
		slot7 = slot0:findTF("window/content/commanders/commander" .. slot6, slot0.commanderMsg)

		if slot0.commanderExps[slot6] then
			slot1(slot7, slot2:getCommanderById(slot8.commander_id), slot8.exp)
		end

		setActive(slot7, slot8)
	end
end

function slot0.closeCommanderMsg(slot0)
	setActive(slot0.commanderMsg, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.commanderBtn, function ()
		slot0:openCommanderMsg()
	end, SFX_PANEL)
	onButton(slot0, slot0.commander2Btn, function ()
		slot0:openCommanderMsg()
	end, SFX_PANEL)
	onButton(slot0, slot0.commanderMsg, function ()
		slot0:closeCommanderMsg()
	end)

	if slot0.contextData.system and slot0.contextData.system == SYSTEM_DUEL then
		setText(slot0._levelText, slot0.rivalVO.name)
	else
		setText(slot0._levelText, pg.expedition_data_template[slot0.contextData.stageId].name)
	end

	slot0._gradeUpperLeftPos = rtf(slot0._grade).localPosition
	rtf(slot0._grade).localPosition = Vector3(0, 15, 0)
	slot0._gradeLabelImg.color = Color.New(1, 1, 1, 0)

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot0._grade.transform.localScale = Vector3(1.5, 1.5, 0)

	shiftPanel(slot0._rankBG, nil, 10, 0.7, nil)
	LeanTween.scale(slot0._rankBG, Vector3(1, 1, 1), 0.7)
	LeanTween.value(go(slot0._gradeLabel), 0, 1, slot0.DURATION_WIN_FADE_IN):setOnUpdate(System.Action_float(function (slot0)
		slot0._gradeLabelImg.color = Color.New(1, 1, 1, 1)
	end))
	LeanTween.scale(slot0._grade, Vector3(0.88, 0.88, 1), slot0.DURATION_WIN_SCALE):setEase(LeanTweenType.easeInExpo):setOnComplete(System.Action(function ()
		SetActive(slot0._levelText, true)
		SetActive:rankAnimaFinish()
	end))

	slot0._tf:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0.5)

	SetActive(slot0._skipBtn, false)
	SetActive(slot0._atkBG, false)
	onToggle(slot0, slot0._subToggle, function (slot0)
		SetActive(slot0:findTF("switchFleet/off", slot0._leftPanel), not slot0)
		SetActive(slot0:findTF("switchFleet/on", slot0._leftPanel), slot0)
		SetActive(slot0._subExpResult, not slot0)
		SetActive(slot0._expResult, slot0)
		setActive(slot0:findTF("off", slot0._subToggle), not slot0)
	end, SFX_PANEL)

	slot0._stateFlag = "rankAnima"
end

function slot0.rankAnimaFinish(slot0)
	onButton(slot0, slot0._bg, function ()
		slot0._bg:GetComponent("Button").enabled = false

		slot0._bg.GetComponent("Button"):showRewardInfo()
	end, SFX_CONFIRM)
	SetActive(slot0:findTF("main/tips"), true)

	slot1 = slot0:findTF("main/condition")

	SetActive(slot1, true)

	slot4 = slot1:Find("condition_1")
	slot5 = slot1:Find("condition_2")
	slot6 = slot1:Find("condition_3")

	if pg.expedition_data_template[slot0.contextData.stageId].limit_type == 1 or slot3.limit_type == 4 then
		slot7 = nil

		slot0:setCondition(slot4, i18n("battle_result_victory"), slot0.contextData.score > 1)
		slot0:setCondition(slot5, (slot3.sink_limit >= 2 or i18n("battle_result_undefeated")) and i18n("battle_result_sink_limit", slot3.sink_limit), not slot0.contextData.statistics._deadUnit)

		if slot3.limit_type == 1 then
			slot0:setCondition(slot6, i18n("battle_result_time_limit", slot3.time_limit), not slot0.contextData.statistics._badTime)
		elseif slot3.limit_type == 4 then
			slot0:setCondition(slot6, i18n("battle_result_boss_destruct"), slot0.contextData.statistics._boss_destruct < 1)
		end
	elseif slot3.limit_type == 2 then
		setActive(slot4, false)
		setActive(slot5, false)
		slot0:setCondition(slot6, i18n("battle_preCombatLayer_time_hold", slot3.time_limit), slot0.contextData.score > 1)
	elseif slot3.limit_type == 3 then
		slot0:setCondition(slot6, i18n("battle_result_defeat_all_enemys"), slot0.contextData.score > 1)
		setActive(slot4, false)
		setActive(slot5, false)
	end

	slot0._stateFlag = "report"
end

function slot0.setCondition(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = slot1:Find("label"):GetComponent(typeof(Text))

	if slot3 then
		slot4 = "resources/condition_done"
		slot5.text = setColorStr(slot2, COLOR_GREEN)
	else
		slot4 = "resources/condition_fail"
		slot5.text = setColorStr(slot2, "#FFFFFFFF")
	end

	slot0:setSpriteTo(slot4, slot1:Find("icon"), true)
end

function slot0.showRewardInfo(slot0)
	SetActive(slot0:findTF("main/tips"), false)
	setParent(slot0._tf, slot0.UIMain)

	slot1 = nil
	slot1 = coroutine.create(function ()
		slot0 = slot0.contextData.drops

		if getProxy(ActivityProxy):getActivityById(ActivityConst.UTAWARERU_ACTIVITY_PT_ID) and not slot2:isEnd() then
			slot3 = slot2:getConfig("config_client").pt_id

			if _.detect(slot1:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function (slot0)
				return slot0:getConfig("config_id") == slot0
			end):getData1() >= 1500 then
				slot4 = slot4 - 1500
				slot0 = _.filter(slot0, function (slot0)
					return slot0.dropType ~= DROP_TYPE_RESOURCE or slot0.id ~= slot0
				end)

				if _.detect(slot0, function (slot0)
					return slot0.dropType == DROP_TYPE_RESOURCE and slot0.id == slot0
				end) and slot4 < slot5.count then
					slot5.count = slot5.count - slot4

					table.insert(slot0, slot5)
				end
			end
		end

		if table.getCount(slot0) > 0 then
			slot0:emit(BaseUI.ON_AWARD, {
				items = slot0,
				onYes = slot1
			})
			coroutine.yield()

			for slot9 = math.max(1, #getProxy(BayProxy).getNewShip(slot4, true) - #_.filter(slot0, function (slot0)
				return slot0.type == DROP_TYPE_SHIP
			end) + 1), #getProxy(BayProxy).getNewShip(slot4, true), 1 do
				slot11 = PlayerPrefs.GetInt(DISPLAY_SHIP_GET_EFFECT) == 1 or slot5[slot9].virgin or ShipRarity.Purple <= slot5[slot9]:getRarity()

				if slot11 then
					slot0:emit(BattleResultMediator.GET_NEW_SHIP, slot10, slot1)
					coroutine.yield()
				end
			end
		end

		setParent(slot0._tf, slot0.overlay)
		slot0:displayBG()
	end)

	function ()
		if slot0 and coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

function slot0.displayBG(slot0)
	SetActive(slot0:findTF("main/condition"), false)
	LeanTween.scale(slot0._grade, Vector3(0.6, 0.6, 1), slot0.DURATION_MOVE)
	LeanTween.moveLocal(go(slot1), slot0._gradeUpperLeftPos, slot0.DURATION_MOVE)
	slot0:displayShips()
	slot0:displayPlayerInfo()
	slot0:displayerCommanders()
	SetActive(slot0._skipBtn, true)
	onButton(slot0, slot0._skipBtn, function ()
		slot0:skip()
	end, SFX_CONFIRM)

	slot0._stateFlag = "display"
end

function slot0.displayPlayerInfo(slot0)
	slot1 = slot0:calcPlayerProgress()

	SetActive(slot0._leftPanel, true)

	slot0._main:GetComponent("Animator").enabled = true

	LeanTween.moveX(rtf(slot0._leftPanel), 0, 0.5):setOnComplete(System.Action(function ()
		slot0:playExEnter()
		LeanTween.value(go(slot0._tf), 0, , 1):setOnUpdate(System.Action_float(function (slot0)
			setText(slot0._playerBonusExp, slot0.playerProgressLabel .. math.floor(slot0))
		end))
	end))
end

function slot0.calcPlayerExp(slot0)
	slot2 = slot0.contextData.oldPlayer.level
	slot3 = slot0.player.level
	slot4 = slot0.player.exp - slot0.contextData.oldPlayer.exp

	while slot2 < slot3 do
		slot4 = slot4 + pg.user_level[slot2].exp
		slot2 = slot2 + 1
	end

	if slot2 == pg.user_level[#pg.user_level].level then
		slot4 = 0
	end

	return slot4
end

function slot0.calcPlayerRank(slot0)
	slot2 = slot0.contextData.oldRank.score

	return slot0.season.score - slot0.contextData.oldRank.score
end

function slot0.displayShips(slot0)
	slot0._expTFs = {}
	slot0._nameTxts = {}
	slot0._initExp = {}
	slot0._skipExp = {}
	slot0._subSkipExp = {}
	slot0._subCardAnimaFuncList = {}
	slot0._maxRightDelay = 0
	slot0._maxSubRightDelay = 0
	slot1 = {}
	slot2 = slot0.contextData.prefabFleet or slot0.shipVOs

	for slot6, slot7 in ipairs(slot2) do
		slot1[slot7.id] = slot7
	end

	slot3 = slot0.contextData.statistics

	for slot7, slot8 in ipairs(slot2) do
		if slot3[slot8.id] then
			slot3[slot8.id].vo = slot8
		end
	end

	slot4, slot5 = nil
	slot5 = (slot3.mvpShipID == 0 or slot3[slot3.mvpShipID].output) and 0
	slot6 = slot0.contextData.prefabFleet or slot0.contextData.oldMainShips
	slot7 = 0.5
	slot0._atkFuncs = {}
	slot0._commonAtkTplList = {}
	slot0._subAtkTplList = {}
	slot8 = 0
	slot9 = 0

	for slot13, slot14 in ipairs(slot6) do
		slot15 = slot1[slot14.id]

		if slot3[slot14.id] then
			if not (ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(slot14.configId).type == ShipType.Qianting) then
				i = slot8 + 1
			else
				i = slot9 + 1
			end

			slot17 = cloneTplTo(slot0._atkTpl, slot0._atkContainer)
			slot18 = slot0:findTF("result", slot17)
			slot20 = slot0:findTF("result/atk", slot17)
			slot22 = slot0:findTF("result/mvp", slot17)

			setText(slot21, slot3[slot14.id].kill_count)

			slot0:findTF("result/icon", slot17).GetComponent(slot19, typeof(Image)).sprite = LoadSprite("herohrzicon/" .. slot14:getPainting())
			slot0:findTF("result/dmg_progress/progress_bar", slot17).GetComponent(slot23, typeof(Image)).fillAmount = 0
			slot26 = slot3[slot14.id].output / slot5 * 1

			setImageSprite(slot24, slot27, true)
			table.insert(slot0._atkFuncs, function ()
				LeanTween.value(go(slot0._tf), 0, , ):setOnUpdate(System.Action_float(function (slot0)
					slot0:GetComponent(typeof(Image)).fillAmount = slot0
				end)):setOnComplete(System.Action(function ()
					if slot0.id == slot1.id then
						SetActive(slot2, true)
					end
				end))

				if slot7 ~= 0 then
					LeanTween.value(go(slot0._tf), 0, slot8[slot4.id].output, ):setOnUpdate(System.Action_float(function (slot0)
						setText(slot0, math.floor(slot0))

						return
					end))
					LeanTween.value(go(slot0._tf), 0, slot8[0.id].kill_count, ):setOnUpdate(System.Action_float(function (slot0)
						setText(slot0, math.floor(slot0))

						return
					end))
				else
					setText(slot9, 0)
					setText(slot10, 0)
				end
			end)

			slot29, slot30 = nil

			if slot16 then
				slot29 = cloneTplTo(slot0._extpl, slot0._subExpContainer)
				slot30 = slot0._maxSubRightDelay
			else
				slot29 = cloneTplTo(slot0._extpl, slot0._expContainer)
				slot30 = slot0._maxRightDelay
			end

			slot29.transform.anchoredPosition = Vector3(slot29.transform.anchoredPosition.x + (16.2 + rtf(slot29).rect.width) * (i - 1), slot29.transform.anchoredPosition.y, slot29.transform.anchoredPosition.z)
			slot0._expTFs[#slot0._expTFs + 1] = slot29
			slot0._nameTxts[#slot0._nameTxts + 1] = ScrollTxt.New(findTF(slot29, "ship_icon/frame/info/name_mask"), findTF(slot29, "ship_icon/frame/info/name_mask/name"))
			slot34 = findTF(slot29, "ship_icon/frame/info/stars")
			slot35 = findTF(slot29, "ship_icon/frame/info/stars/star_tpl")
			slot36 = findTF(slot17, "result/stars")
			slot37 = findTF(slot17, "result/stars/star_tpl")
			slot40 = slot14:getMaxStar() - slot14:getStar()
			slot41 = findTF(slot29, "heartsfly")
			slot42 = findTF(slot29, "heartsbroken")

			for slot46 = 1, slot14.getMaxStar(), 1 do
				slot48 = cloneTplTo(slot35, slot34)

				SetActive(cloneTplTo(slot37, slot36):Find("empty"), slot46 <= slot40)
				SetActive(slot47:Find("star"), slot40 < slot46)
				SetActive(slot48:Find("empty"), slot46 <= slot40)
				SetActive(slot48:Find("star"), slot40 < slot46)
			end

			setImageSprite(findTF(slot29, "ship_icon"), slot43, true)

			slot44 = findTF(slot29, "bg"):GetComponent(typeof(Image))

			LoadSpriteAsync("bg/star_level_card_" .. slot14:rarity2bgPrint(), function (slot0)
				if not slot0.exited then
					slot1.sprite = slot0
				end

				return
			end)
			setImageSprite(findTF(slot29, "ship_icon/frame/info/type"), slot45, true)
			setActive(findTF(slot29, "ship_icon/frame/info/npc"), slot14:isActivityNpc())
			slot33:setText(slot14:getName())

			slot47 = "shipframe"
			slot48 = (slot14.propose and "prop") or slot14:rarity2bgPrint()

			setImageSprite(findTF(slot29, "ship_icon/frame/bg"), GetSpriteFromAtlas, true)
			setActive(findTF(slot29, "ship_icon/duang"), slot14.propose)

			slot47 = findTF(slot29, "ship_icon/frame/mvpLabel")

			if slot4 and slot14.id == slot4.id then
				slot0.mvpShipVO = slot14
				slot48, slot49 = nil

				if slot0.contextData.score > 1 then
					slot48, slot49 = Ship.getWords(slot0.mvpShipVO.skinId, "win_mvp")
				else
					slot48, slot49 = Ship.getWords(slot0.mvpShipVO.skinId, "lose")
				end

				if slot49 then
					if slot0._currentVoice then
						slot0._currentVoice:Stop(true)
					end

					slot0._currentVoice = playSoundEffect(slot49)
				end

				SetActive(slot47, true)
			end

			if slot14.id == slot3._flagShipID then
				slot0.flagShipVO = slot14
			end

			slot49 = findTF(slot29, "ship_icon/frame/info/lv_bg/levelUpLabel")
			slot50 = findTF(slot29, "ship_icon/frame/info/lv_bg/levelup")

			setText(slot48, slot14.level)

			slot51 = findTF(slot29, "exp/exp_text")
			slot53 = findTF(slot29, "exp/exp_progress").GetComponent(slot52, typeof(Image))

			setActive(findTF(slot29, "exp/exp_buff"), slot0.expBuff)

			if slot0.expBuff then
				setText(slot54, slot0.expBuff:getConfig("name"))
			end

			slot30 = math.max(slot30, slot15.level - slot14.level + i * 0.5)

			function slot55()
				SetActive(findTF(SetActive, "exp"), true)

				slot0 = SetActive
				slot1 = findTF(SetActive, "exp")
				slot2 = true:getIntimacy() < true:getIntimacy()

				SetActive(findTF(SetActive, "exp"), true.getIntimacy() < true.getIntimacy())
				SetActive(slot4, true.getIntimacy() < true.getIntimacy():getIntimacy() < true.getIntimacy() < true.getIntimacy():getIntimacy())

				slot1 = getConfigFromLevel1(pg.ship_level, slot3.level).exp
				slot5.fillAmount = true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy():getExp() / getConfigFromLevel1(pg.ship_level, true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy().level).exp
				slot2 = false

				if false then
					slot2 = true
				end

				slot2 = false

				if false then
					slot2 = true
				end

				if slot5.level < true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy().getExp() / getConfigFromLevel1(pg.ship_level, true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy().level).exp.level then
					for slot6 = slot2.level, slot3.level - 1, 1 do
						slot2 = slot2 + getConfigFromLevel1(pg.ship_level, slot6).exp
					end

					slot6:PlayAnimation(slot0, 0, (slot2 + slot3:getExp()) - slot2:getExp(), 1, 0, function (slot0)
						setText(slot0, "EXP+" .. math.ceil(slot0))

						return
					end)

					function slot3(slot0)
						SetActive(slot0, true)
						SetActive(SetActive, true)
						LeanTween.moveY(rtf(slot0), slot0.localPosition.y + 30, 0.5):setOnComplete(System.Action(function ()
							SetActive(SetActive, false)

							SetActive.localPosition = SetActive

							playSoundEffect(SFX_BOAT_LEVEL_UP)

							return
						end))

						if slot0 <= LeanTween.moveY(rtf(slot0), slot0.localPosition.y + 30, 0.5).setOnComplete.level then
							setText(slot3, slot0)
						end

						return
					end

					slot4 = slot2.level

					function (slot0, slot1, slot2, slot3)
						LeanTween.value(go(slot0), slot0, slot1, slot2):setOnUpdate(System.Action_float(function (slot0)
							slot0.fillAmount = slot0

							return
						end)):setOnComplete(System.Action(function ()
							slot0 = slot0 + 1

							if slot1 then
								slot2(slot2)
							end

							if slot3.level ==  then
								if slot0 == slot3:getMaxLevel() then
									slot4.fillAmount = 1
								else
									slot5(0, slot3:getExp() / slot6, 1, false)
								end
							else
								if slot3.level <  then
									slot5(0, 1, 0.7, true)
								end
							end

							return
						end))

						return
					end(slot2:getExp() / slot0, 1, 0.7, true)

					return
				end

				slot2 = math.ceil(slot3:getExp() - slot2:getExp())

				setText(slot7, "EXP+" .. slot2)

				if slot2.level == slot2:getMaxLevel() then
					slot5.fillAmount = 1

					return
				end

				slot6:PlayAnimation(slot0, slot2:getExp() / slot0, slot3:getExp() / slot0, 1, 0, function (slot0)
					slot0.fillAmount = slot0

					return
				end)
			end

			slot56 = nil

			if slot16 then
				slot56 = slot0._subSkipExp
				slot0._maxSubRightDelay = slot30
			else
				slot56 = slot0._skipExp
				slot0._maxRightDelay = slot30
			end

			slot56[#slot56 + 1] = function ()
				LeanTween.cancel(go(LeanTween.cancel))
				LeanTween.cancel(go(go))

				slot0 = SetActive
				slot1 = go

				if slot3:getIntimacy() >= slot4:getIntimacy() then
					slot2 = false
				else
					slot2 = true
				end

				slot0(slot1, slot2)

				slot0 = SetActive
				slot1 = slot5

				if slot4:getIntimacy() >= slot3:getIntimacy() then
					slot2 = false
				else
					slot2 = true
				end

				slot0(slot1, slot2)
				SetActive(slot1:Find("exp"), true)
				setText(slot6, slot4.level)

				if slot3.level == slot3:getMaxLevel() then
					setText(slot7, "EXP+" .. math.ceil(slot4:getExp() - slot3:getExp()))

					slot8.fillAmount = 1
				else
					if slot3.level < slot4.level then
						slot0 = 0

						for slot4 = slot3.level, slot4.level - 1, 1 do
							slot0 = slot0 + getConfigFromLevel1(pg.ship_level, slot4).exp
						end

						setText(slot7, "EXP+" .. (slot0 + slot4:getExp()) - slot3:getExp())
					else
						setText(slot7, "EXP+" .. math.ceil(slot4:getExp() - slot3:getExp()))
					end

					slot8.fillAmount = slot4:getExp() / getConfigFromLevel1(pg.ship_level, slot4.level).exp
				end

				SetActive(SetActive, false)

				SetActive:GetComponent("CanvasGroup").alpha = 1
				rtf(1).anchoredPosition = Vector2(rtf(slot1).anchoredPosition.x, 0)

				return
			end

			slot57 = slot29:GetComponent("CanvasGroup")
			slot58 = i * 0.1

			function slot59()
				LeanTween.moveY(rtf(slot0), 0, 0.2):setOnComplete(System.Action(function ()
					slot0()

					return
				end)):setDelay(System.Action)
				LeanTween.value(go(slot3._tf), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
					slot0.alpha = slot0

					return
				end)):setDelay(System.Action_float)

				return
			end

			if slot16 then
				slot0._subCardAnimaFuncList[#slot0._subCardAnimaFuncList + 1] = slot59
			else
				slot59()
			end
		end
	end

	slot0._expContainer.transform.anchoredPosition = Vector3(slot8 * -81.5 + 619, 18, 0)
	slot0._subExpContainer.transform.anchoredPosition = Vector3(slot9 * -81.5 + 619, 18, 0)
	slot0._submarineCount = slot9
end

function slot0.showPainting(slot0)
	slot1, slot2 = nil

	SetActive(slot0._painting, true)

	if slot0.contextData.score > 1 then
		if not slot0.mvpShipVO then
			slot3 = slot0.flagShipVO
		end

		slot0.paintingName = slot3:getPainting()

		setPaintingPrefabAsync(slot0._painting, slot0.paintingName, "jiesuan")

		slot1, slot2 = Ship.getWords(slot3.skinId, "win_mvp")

		SetActive(slot0._failPainting, false)
	else
		slot1, slot2 = Ship.getWords(slot0.contextData.oldMainShips[math.random(#slot0.contextData.oldMainShips)].skinId, "lose")
	end

	setText(slot0._chat:Find("Text"), slot1)

	if CHAT_POP_STR_LEN < #slot0._chat:Find("Text"):GetComponent(typeof(Text)).text then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end

	SetActive(slot0._chat, true)

	slot0._chat.transform.localScale = Vector3.New(0, 0, 0)

	LeanTween.cancel(go(slot0._painting))
	LeanTween.moveX(rtf(slot0._painting), 50, 0.25):setOnComplete(System.Action(function ()
		LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
			if slot0._atkFuncs ~= nil then
				slot0._atkFuncs = nil
				slot0._statisticsBtn:GetComponent("Button").enabled = true
				slot0._statisticsBtn.GetComponent("Button")._confirmBtn:GetComponent("Button").enabled = true
				slot0._statisticsBtn.GetComponent("Button")._confirmBtn.GetComponent("Button")._atkBG:GetComponent("Button").enabled = true
			end

			return
		end))

		return
	end))

	return
end

function slot0.hidePainting(slot0)
	SetActive(slot0._chat, false)

	slot0._chat.transform.localScale = Vector3.New(0, 0, 0)

	LeanTween.cancel(go(slot0._painting))
	LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(0, 0, 0), 0.1):setEase(LeanTweenType.easeOutBack)
	LeanTween.moveX(rtf(slot0._painting), 720, 0.2):setOnComplete(System.Action(function ()
		SetActive(slot0._painting, false)

		return
	end))

	return
end

function slot0.skip(slot0)
	if slot0._rightTimer then
		if slot0._rightTimer.running then
			LeanTween.cancel(go(slot0._leftPanel))

			rtf(slot0._leftPanel).anchoredPosition = Vector2(0, rtf(slot0._leftPanel).anchoredPosition.y)

			LeanTween.cancel(go(slot0._tf))
			setText(slot0._playerBonusExp, slot0.playerProgressLabel .. slot1)

			for slot5, slot6 in ipairs(slot0._skipExp) do
				slot6()
			end

			slot0._rightTimer:Stop()
		else
			if slot0._submarineCount > 0 then
				slot0:playSubExEnter()
			else
				slot0:showRightBottomPanel()
			end
		end
	else
		if slot0._subRightTimer then
			if slot0._subRightTimer.running then
				for slot4, slot5 in ipairs(slot0._subSkipExp) do
					slot5()
				end

				slot0._subRightTimer:Stop()
			end

			slot0:showRightBottomPanel()
		end
	end

	return
end

function slot0.playExEnter(slot0)
	slot0._rightTimer = Timer.New(function ()
		if slot0._submarineCount <= 0 then
			slot0:showRightBottomPanel()
		end

		return
	end, slot0._maxRightDelay, 1)

	slot0._rightTimer:Start()

	return
end

function slot0.playSubExEnter(slot0)
	slot0._rightTimer = nil

	triggerToggle(slot0._subToggle, false)

	for slot4, slot5 in ipairs(slot0._subCardAnimaFuncList) do
		slot5()
	end

	slot0._subRightTimer = Timer.New(function ()
		slot0:showRightBottomPanel()

		return
	end, slot0._maxSubRightDelay, 1)

	slot0._subRightTimer:Start()

	return
end

function slot0.showRightBottomPanel(slot0)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0._rightBottomPanel, true)

	slot1 = SetActive
	slot2 = slot0._subToggle

	if slot0._submarineCount <= 0 then
		slot3 = false
	else
		slot3 = true
	end

	slot1(slot2, slot3)
	onButton(slot0, slot0._statisticsBtn, function ()
		if slot0._atkBG.gameObject.activeSelf then
			slot0:closeStatistics()
		else
			slot0:showStatistics()
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0._confirmBtn, function ()
		if slot0.contextData.system == SYSTEM_DUEL then
			slot0:emit(BattleResultMediator.ON_BACK_TO_DUEL_SCENE)
		else
			slot0:emit(BattleResultMediator.ON_BACK_TO_LEVEL_SCENE)
		end

		return
	end, SFX_CONFIRM)
	onButton(slot0, slot0._atkBG, function ()
		slot0:closeStatistics()

		return
	end, SFX_CANCEL)

	slot0._stateFlag = nil

	return
end

function slot0.showStatistics(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._blurConatiner)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	SetActive(slot0._atkBG, true)

	if slot0._atkFuncs then
		slot0._atkBG:GetComponent("Button").enabled = false
		slot0._confirmBtn:GetComponent("Button").enabled = false
		slot0._statisticsBtn:GetComponent("Button").enabled = false

		slot0:showPainting()
		LeanTween.moveX(rtf(slot0._atkPanel), 0, 0.25):setOnComplete(System.Action(function ()
			for slot3, slot4 in ipairs(slot0._atkFuncs) do
				slot4()
			end

			return
		end))
	else
		slot0:showPainting()

		slot0._atkBG:GetComponent("Button").enabled = true

		LeanTween.cancel(slot0._atkPanel.gameObject)
		LeanTween.moveX(rtf(slot0._atkPanel), 0, 0.25)
	end

	return
end

function slot0.closeStatistics(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._blurConatiner, slot0._tf)
	slot0:hidePainting()

	slot0._atkBG:GetComponent("Button").enabled = false

	LeanTween.cancel(slot0._atkPanel.gameObject)
	LeanTween.moveX(rtf(slot0._atkPanel), -700, 0.2):setOnComplete(System.Action(function ()
		SetActive(slot0._atkBG, false)

		return
	end))

	return
end

function slot0.PlayAnimation(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	LeanTween.value(slot1.gameObject, slot2, slot3, slot4):setDelay(slot5):setOnUpdate(System.Action_float(function (slot0)
		slot0(slot0)

		return
	end))

	return
end

function slot0.onBackPressed(slot0)
	if slot0._stateFlag == "rankAnima" then
	else
		if slot0._stateFlag == "report" then
			triggerButton(slot0._bg)
		else
			if slot0._stateFlag == "display" then
				triggerButton(slot0._skipBtn)
			else
				triggerButton(slot0._confirmBtn)
			end
		end
	end

	return
end

function slot0.willExit(slot0)
	LeanTween.cancel(go(slot0._tf))

	if slot0._atkBG.gameObject.activeSelf then
		pg.UIMgr.GetInstance():UnblurPanel(slot0._blurConatiner, slot0._tf)
	end

	if slot0.paintingName then
		retPaintingPrefab(slot0._painting, slot0.paintingName)
	end

	if slot0._rightTimer then
		slot0._rightTimer:Stop()
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if not slot0._nameTxts then
		slot1 = {}
	end

	slot0._nameTxts = slot1

	for slot4 = #slot0._nameTxts, 1, -1 do
		slot0._nameTxts[slot4]:destroy()
		table.remove(slot0._nameTxts, slot4)
	end

	slot0._nameTxts = nil

	return
end

return slot0
