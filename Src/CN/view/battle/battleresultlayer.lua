slot0 = class("BattleResultLayer", import("..base.BaseUI"))
slot0.DURATION_MOVE = 0.35
slot0.DURATION_WIN_SCALE = 0.4
slot0.CONDITIONS_FREQUENCE = 0.15
slot0.STATE_RANK_ANIMA = "rankAnima"
slot0.STATE_REPORT = "report"
slot0.STATE_REPORTED = "reported"
slot0.STATE_REWARD = "reward"
slot0.STATE_DISPLAY = "display"
slot0.STATE_DISPLAYED = "displayed"
slot0.STATE_SUB_DISPLAY = "subDisplay"
slot0.STATE_SUB_DISPLAYED = "subDisplayed"
slot0.ObjectiveList = {
	"battle_result_victory",
	"battle_result_undefeated",
	"battle_result_sink_limit",
	"battle_preCombatLayer_time_hold",
	"battle_result_time_limit",
	"battle_result_boss_destruct",
	"battle_preCombatLayer_damage_before_end",
	"battle_result_defeat_all_enemys"
}

function slot0.getUIName(slot0)
	return "BattleResultUI"
end

function slot0.setRivalVO(slot0, slot1)
	slot0.rivalVO = slot1
end

function slot0.setRank(slot0, slot1, slot2)
	slot0.player = slot1
	slot0.season = slot2

	setText(slot0._playerName, "<color=#FFFFFF>" .. slot0.player.name .. "</color><size=32> / C O M M A N D E R</size>")

	slot4, slot5 = SeasonInfo.getNextMilitaryRank(slot2.score, slot2.rank)

	setText(slot0._playerLv, SeasonInfo.getMilitaryRank(slot2.score, slot2.rank).name)
	setText(slot0._playerExpLabel, i18n("word_rankScore"))

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

	setText(slot0._playerName, "<color=#FFFFFF>" .. slot0.player.name .. "</color><size=32> / C O M M A N D E R</size>")
	setText(slot0._playerLv, "Lv." .. slot0.player.level)

	slot0._playerExpProgress:GetComponent(typeof(Image)).fillAmount = slot0.player.exp / getConfigFromLevel1(pg.user_level, slot0.player.level).exp_interval

	if slot0.player.level == pg.user_level[#pg.user_level].level then
		slot0._playerExpProgress:GetComponent(typeof(Image)).fillAmount = 1
	end

	setText(slot0._playerBonusExp, "0")

	slot0.calcPlayerProgress = slot0.calcPlayerExp
	slot3 = slot0.contextData.extraBuffList
end

function slot0.setExpBuff(slot0, slot1)
	slot0.expBuff = slot1
end

function slot0.init(slot0)
	slot0._grade = slot0:findTF("grade")
	slot0._levelText = slot0:findTF("chapterName/Text22", slot0._grade)
	slot0.clearFX = slot0:findTF("clear")
	slot0._main = slot0:findTF("main")
	slot0._blurConatiner = slot0:findTF("blur_container")
	slot0._bg = slot0:findTF("main/jiesuanbeijing")
	slot0._painting = slot0:findTF("painting", slot0._blurConatiner)
	slot0._failPainting = slot0:findTF("fail", slot0._painting)
	slot0._chat = slot0:findTF("chat", slot0._painting)
	slot0._leftPanel = slot0:findTF("leftPanel", slot0._main)
	slot0._expResult = slot0:findTF("expResult", slot0._leftPanel)
	slot0._expContainer = slot0:findTF("expContainer", slot0._expResult)
	slot0._extpl = slot0:getTpl("ShipCardTpl", slot0._expContainer)
	slot0._playerExp = slot0:findTF("playerExp", slot0._leftPanel)
	slot0._playerName = slot0:findTF("name_text", slot0._playerExp)
	slot0._playerLv = slot0:findTF("lv_text", slot0._playerExp)
	slot0._playerExpLabel = slot0:findTF("exp_label", slot0._playerExp)
	slot0._playerExpProgress = slot0:findTF("exp_progress", slot0._playerExp)
	slot0._playerBonusExp = slot0:findTF("exp_text", slot0._playerExp)
	slot0._playerExpExtra = slot0:findTF("operation_bonus", slot0._playerExp)
	slot0._atkBG = slot0:findTF("atkPanel", slot0._blurConatiner)
	slot0._atkPanel = slot0:findTF("atkResult", slot0._atkBG)
	slot0._atkResult = slot0:findTF("atkResult/result", slot0._atkBG)
	slot0._atkContainer = slot0:findTF("Grid", slot0._atkResult)
	slot0._atkContainerNext = slot0:findTF("Grid_next", slot0._atkResult)
	slot0._atkToggle = slot0:findTF("switchAtk", slot0._atkPanel)
	slot0._atkTpl = slot0:getTpl("resulttpl", slot0._atkResult)
	slot0._mvpFX = slot0:findTF("mvpFX", slot0._atkPanel)
	slot0._rightBottomPanel = slot0:findTF("rightBottomPanel", slot0._blurConatiner)
	slot0._confirmBtn = slot0:findTF("confirmBtn", slot0._rightBottomPanel)
	slot0._statisticsBtn = slot0:findTF("statisticsBtn", slot0._rightBottomPanel)
	slot0._subExpResult = slot0:findTF("subExpResult", slot0._leftPanel)
	slot0._subExpContainer = slot0:findTF("expContainer", slot0._subExpResult)
	slot0._subToggle = slot0:findTF("switchFleet", slot0._leftPanel)
	slot0._skipBtn = slot0:findTF("skipLayer", slot0._tf)
	slot0.UIMain = pg.UIMgr:GetInstance().UIMain
	slot0.overlay = pg.UIMgr:GetInstance().OverlayMain
	slot0._conditions = slot0:findTF("main/conditions")
	slot0._conditionContainer = slot0:findTF("bg16/list", slot0._conditions)
	slot0._conditionTpl = slot0:findTF("bg16/conditionTpl", slot0._conditions)
	slot0._cmdExp = slot0:findTF("commanderExp", slot0._leftPanel)
	slot0._cmdContainer = slot0:findTF("commander_container", slot0._cmdExp)
	slot0._cmdTpl = slot0:findTF("commander_tpl", slot0._cmdExp)
	slot1 = {
		"d",
		"c",
		"b",
		"a",
		"s"
	}
	slot2 = slot0:findTF("grade/Xyz/bg13")
	slot3 = slot0:findTF("grade/Xyz/bg14")
	slot4, slot5, slot6 = nil
	slot8 = nil

	setActive(slot0:findTF("jieuan01/BG/bg_victory", slot0._bg), slot0.contextData.score > 0)
	setActive(slot0:findTF("jieuan01/BG/bg_fail", slot0._bg), not (slot0.contextData.score > 0))

	if slot9 then
		slot4 = "battlescore/battle_score_" .. slot6 .. "/letter_" .. slot6
		slot5 = "battlescore/battle_score_" .. slot1[slot7 + 1] .. "/label_" .. slot1[slot7 + 1]
	else
		if slot0.contextData.statistics._scoreMark == ys.Battle.BattleConst.DEAD_FLAG then
			slot6 = slot1[2]
			slot8 = "flag_destroy"
		else
			slot6 = slot1[1]
		end

		slot4 = "battlescore/battle_score_" .. slot6 .. "/letter_" .. slot6
		slot5 = "battlescore/battle_score_" .. slot6 .. "/label_" .. (slot8 or slot6)
	end

	LoadImageSpriteAsync(slot4, slot2, false)
	LoadImageSpriteAsync(slot5, slot3, false)
	SetActive(slot0._levelText, false)

	slot0._delayLeanList = {}
end

function slot0.displayerCommanders(slot0, slot1)
	slot0.commanderExps = slot0.contextData.commanderExps or {}
	slot2 = getProxy(CommanderProxy)

	removeAllChildren(slot0._cmdContainer)

	slot3 = nil

	if slot1 then
		slot3 = slot0.commanderExps.submarineCMD or {}
	else
		slot3 = slot0.commanderExps.surfaceCMD or {}

		setActive(slot0._cmdExp, true)
	end

	for slot7, slot8 in ipairs(slot3) do
		slot9 = slot2:getCommanderById(slot8.commander_id)
		slot10 = cloneTplTo(slot0._cmdTpl, slot0._cmdContainer)

		GetImageSpriteFromAtlasAsync("commandericon/" .. slot9:getPainting(), "", slot10:Find("icon/mask/pic"))
		setText(slot10:Find("exp/name_text"), slot9:getName())
		setText(slot10:Find("exp/lv_text"), "Lv." .. slot9.level)
		setText(slot10:Find("exp/exp_text"), "+" .. slot8.exp)

		slot11 = nil
		slot10:Find("exp/exp_progress"):GetComponent(typeof(Image)).fillAmount = (slot9:isMaxLevel() and 1) or slot8.curExp / slot9:getNextLevelExp()
	end
end

function slot0.didEnter(slot0)
	slot0:setStageName()

	slot0._gradeUpperLeftPos = rtf(slot0._grade).localPosition
	rtf(slot0._grade).localPosition = Vector3(0, 25, 0)

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot0._grade.transform.localScale = Vector3(1.5, 1.5, 0)

	LeanTween.scale(slot0._grade, Vector3(0.88, 0.88, 1), slot0.DURATION_WIN_SCALE):setOnComplete(System.Action(function ()
		SetActive(slot0._levelText, true)
		SetActive:rankAnimaFinish()
	end))

	slot0._tf:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0.5)

	SetActive(slot0._atkBG, false)
	onToggle(slot0, slot0._subToggle, function (slot0)
		SetActive(slot0._subExpResult, not slot0)
		SetActive(slot0._expResult, slot0)
		setActive(slot0:findTF("off", slot0._subToggle), not slot0)
		slot0:displayerCommanders(not slot0)
	end, SFX_PANEL)

	slot0._stateFlag = slot0.STATE_RANK_ANIMA

	onButton(slot0, slot0._skipBtn, function ()
		slot0:skip()
	end, SFX_CONFIRM)
end

function slot0.setStageName(slot0)
	if slot0.contextData.system and slot0.contextData.system == SYSTEM_DUEL then
		setText(slot0._levelText, slot0.rivalVO.name)
	else
		setText(slot0._levelText, pg.expedition_data_template[slot0.contextData.stageId].name)
	end
end

function slot0.rankAnimaFinish(slot0)
	SetActive(slot1, true)
	slot4(pg.expedition_data_template[slot0.contextData.stageId].objective_1)
	slot4(pg.expedition_data_template[slot0.contextData.stageId].objective_2)
	slot4(pg.expedition_data_template[slot0.contextData.stageId].objective_3)
	table.insert(slot0._delayLeanList, LeanTween.delayedCall(1, System.Action(function ()
		slot0._stateFlag = slot1.STATE_REPORTED

		SetActive(slot0:findTF("jieuan01/tips", slot0._bg), true)
	end)).id)

	slot0._stateFlag = slot0.STATE_REPORT
end

function slot0.objectiveCheck(slot0, slot1)
	if slot0 == 1 or slot0 == 4 or slot0 == 8 then
		return slot1.score > 1
	elseif slot0 == 2 or slot0 == 3 then
		return not slot1.statistics._deadUnit
	elseif slot0 == 6 then
		return slot1.statistics._boss_destruct < 1
	elseif slot0 == 5 then
		return not slot1.statistics._badTime
	elseif slot0 == 7 then
		return true
	end
end

function slot0.setCondition(slot0, slot1, slot2)
	slot3 = cloneTplTo(slot0._conditionTpl, slot0._conditionContainer)

	setActive(slot3, false)

	slot4 = nil
	slot5 = slot3:Find("text"):GetComponent(typeof(Text))

	if slot2 then
		slot4 = "resources/condition_done"
		slot5.text = setColorStr(slot1, "#FFFFFFFF")
	else
		slot4 = "resources/condition_fail"
		slot5.text = setColorStr(slot1, "#FFFFFF80")
	end

	slot0:setSpriteTo(slot4, slot3:Find("checkBox"), true)

	if slot0._conditionContainer.childCount - 1 > 0 then
		table.insert(slot0._delayLeanList, LeanTween.delayedCall(slot0.CONDITIONS_FREQUENCE * slot6, System.Action(function ()
			setActive(setActive, true)
		end)).id)
	else
		setActive(slot3, true)
	end
end

function slot0.showRewardInfo(slot0)
	slot0._stateFlag = slot0.STATE_REWARD

	SetActive(slot0:findTF("jieuan01/tips", slot0._bg), false)
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

		slot3 = {}

		for slot7, slot8 in ipairs(slot0.contextData.drops) do
			table.insert(slot3, slot8)
		end

		for slot7, slot8 in ipairs(slot0.contextData.extraDrops) do
			slot8.riraty = true

			table.insert(slot3, slot8)
		end

		slot4 = false
		slot5 = slot0.contextData.extraBuffList

		if table.getCount(slot0) > 0 then
			slot0:emit(BaseUI.ON_AWARD, {
				items = slot0,
				onYes = slot1
			})
			coroutine.yield()

			for slot12 = math.max(1, #getProxy(BayProxy).getNewShip(slot7, true) - #_.filter(slot3, function (slot0)
				return slot0.type == DROP_TYPE_SHIP
			end) + 1), #getProxy(BayProxy).getNewShip(slot7, true), 1 do
				slot14 = PlayerPrefs.GetInt(DISPLAY_SHIP_GET_EFFECT) == 1 or slot8[slot12].virgin or ShipRarity.Purple <= slot8[slot12]:getRarity()

				if slot14 then
					slot0:emit(BattleResultMediator.GET_NEW_SHIP, slot13, slot1)
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
	LeanTween.moveX(rtf(slot0._conditions), 1300, slot0.DURATION_MOVE)
	LeanTween.scale(slot0._grade, Vector3(0.6, 0.6, 0), slot0.DURATION_MOVE)
	LeanTween.moveLocal(go(slot1), slot0._gradeUpperLeftPos, slot0.DURATION_MOVE):setOnComplete(System.Action(function ()
		slot0:displayShips()
		slot0.displayShips:displayPlayerInfo()
		slot0.displayShips.displayPlayerInfo:displayerCommanders()

		slot0.displayShips.displayPlayerInfo.displayerCommanders._stateFlag = slot0.displayShips.displayPlayerInfo.STATE_DISPLAY
	end))
	setActive(slot0:findTF("jieuan01/Bomb", slot0._bg), false)
end

function slot0.displayPlayerInfo(slot0)
	slot1 = slot0:calcPlayerProgress()

	SetActive(slot0._leftPanel, true)
	SetActive(slot0._playerExp, true)

	slot0._main:GetComponent("Animator").enabled = true

	table.insert(slot0._delayLeanList, LeanTween.moveX(rtf(slot0._leftPanel), 0, 0.5):setOnComplete(System.Action(function ()
		table.insert(slot0._delayLeanList, LeanTween.value(go(slot0._tf), 0, , 1):setOnUpdate(System.Action_float(function (slot0)
			setText(slot0._playerBonusExp, "+" .. math.floor(slot0))
		end)).id)
	end)).id)
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
	slot0._atkFuncs = {}
	slot0._commonAtkTplList = {}
	slot0._subAtkTplList = {}
	slot7, slot8 = nil

	SetActive(slot0._atkToggle, #(slot0.contextData.prefabFleet or slot0.contextData.oldMainShips) > 6)

	if #slot6 > 6 then
		onToggle(slot0, slot0._atkToggle, function (slot0)
			SetActive(slot0._atkContainer, slot0)
			SetActive(slot0._atkContainerNext, not slot0)

			if slot0 then
				slot0:skipAtkAnima(slot0._atkContainerNext)
			else
				slot0:skipAtkAnima(slot0._atkContainer)
			end
		end, SFX_PANEL)
	end

	slot9 = {}
	slot10 = {}

	for slot14, slot15 in ipairs(slot6) do
		slot16 = slot1[slot15.id]

		if slot3[slot15.id] then
			slot18 = table.contains(TeamType.SubShipType, slot17)
			slot19, slot20 = nil
			slot21 = 0

			if slot14 > 6 then
				slot20 = slot0._atkContainerNext
				slot21 = 7
			else
				slot20 = slot0._atkContainer
				slot21 = 1
			end

			cloneTplTo(slot0._atkTpl, slot20).localPosition.x = cloneTplTo(slot0._atkTpl, slot20).localPosition.x + (slot14 - slot21) * 74
			cloneTplTo(slot0._atkTpl, slot20).localPosition.y = cloneTplTo(slot0._atkTpl, slot20).localPosition.y + (slot14 - slot21) * -124
			cloneTplTo(slot0._atkTpl, slot20).localPosition = cloneTplTo(slot0._atkTpl, slot20).localPosition
			slot0:findTF("result/mask/icon", slot19).GetComponent(slot23, typeof(Image)).sprite = LoadSprite("herohrzicon/" .. slot15:getPainting())

			setImageSprite(slot24, slot26, true)
			slot0:setAtkAnima(cloneTplTo(slot0._atkTpl, slot20), slot20, slot3[slot15.id].output / slot5, slot5, slot4 and slot15.id == slot4.id, slot3[slot15.id].output, slot3[slot15.id].kill_count)

			slot27, slot28 = nil

			if not slot18 then
				slot28 = slot0._skipExp

				table.insert(slot9, cloneTplTo(slot0._extpl, slot0._expContainer))
			else
				slot28 = slot0._subSkipExp

				table.insert(slot10, cloneTplTo(slot0._extpl, slot0._subExpContainer))
			end

			flushShipCard(slot27, slot15)

			slot29 = findTF(slot27, "content")
			slot30 = findTF(slot29, "exp")
			slot0._expTFs[#slot0._expTFs + 1] = slot27
			slot0._nameTxts[#slot0._nameTxts + 1] = ScrollTxt.New(findTF(slot29, "info/name_mask"), findTF(slot29, "info/name_mask/name"))
			slot32 = findTF(slot19, "result/stars")
			slot33 = findTF(slot19, "result/stars/star_tpl")
			slot36 = slot15:getMaxStar() - slot15:getStar()
			slot37 = findTF(slot29, "heartsfly")
			slot38 = findTF(slot29, "heartsbroken")

			while slot35 > 0 do
				SetActive(cloneTplTo(slot33, slot32):Find("empty"), slot34 < slot35)
				SetActive(slot39:Find("star"), slot35 <= slot34)

				slot35 = slot35 - 1
			end

			slot31:setText(slot15:getName())

			if slot4 and slot15.id == slot4.id then
				slot0.mvpShipVO = slot15

				SetActive(findTF(slot29, "mvp"), true)

				slot39, slot40 = nil

				if slot0.contextData.score > 1 then
					slot39, slot40 = Ship.getWords(slot0.mvpShipVO.skinId, "win_mvp")
				else
					slot39, slot40 = Ship.getWords(slot0.mvpShipVO.skinId, "lose")
				end

				if slot40 then
					if slot0._currentVoice then
						slot0._currentVoice:Stop(true)
					end

					slot0._currentVoice = playSoundEffect(slot40)
				end
			end

			if slot15.id == slot3._flagShipID then
				slot0.flagShipVO = slot15
			end

			slot39 = slot15:getConfig("rarity")
			slot40 = findTF(slot29, "dockyard/lv/Text")
			slot41 = findTF(slot29, "dockyard/lv_bg/levelUpLabel")
			slot42 = findTF(slot29, "dockyard/lv_bg/levelup")
			slot43 = findTF(slot30, "exp_text")
			slot45 = findTF(slot30, "exp_progress").GetComponent(slot44, typeof(Image))

			setActive(findTF(slot30, "exp_buff"), slot0.expBuff)

			if slot0.expBuff then
				setText(slot46, slot0.expBuff:getConfig("name"))
			end

			function slot47()
				SetActive(SetActive, true)

				slot0 = SetActive
				slot1 = SetActive
				slot2 = true:getIntimacy() < true:getIntimacy()

				SetActive(SetActive, true.getIntimacy() < true.getIntimacy())
				SetActive(slot4, true.getIntimacy() < true.getIntimacy():getIntimacy() < true.getIntimacy() < true.getIntimacy():getIntimacy())

				slot1 = getExpByRarityFromLv1(slot5, slot3.level)
				slot6.fillAmount = true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy():getExp() / getExpByRarityFromLv1(slot5, true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy().level)
				slot2 = false

				if false then
					slot2 = true
				end

				slot2 = false

				if false then
					slot2 = true
				end

				if slot6.level < true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy().getExp() / getExpByRarityFromLv1(slot5, true.getIntimacy() < true.getIntimacy().getIntimacy() < true.getIntimacy() < true.getIntimacy().getIntimacy().level).level then
					for slot6 = slot2.level, slot3.level - 1, 1 do
						slot2 = slot2 + getExpByRarityFromLv1(slot5, slot6)
					end

					slot7:PlayAnimation(slot8, 0, (slot2 + slot3:getExp()) - slot2:getExp(), 1, 0, function (slot0)
						setText(slot0, "+" .. math.ceil(slot0))

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

				setText(slot9, "+" .. slot2)

				if slot2.level == slot2:getMaxLevel() then
					slot6.fillAmount = 1

					return
				end

				slot7:PlayAnimation(slot8, slot2:getExp() / slot0, slot3:getExp() / slot0, 1, 0, function (slot0)
					slot0.fillAmount = slot0

					return
				end)
			end

			slot27:GetComponent(typeof(DftAniEvent)).SetTriggerEvent(slot48, function (slot0)
				slot0()

				return
			end)
			setActive(slot27, false)

			if slot18 then
				if not slot8 then
					slot0._subFirstExpTF = slot27
				else
					slot8:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
						setActive(slot0, true)

						return
					end)
				end

				slot8 = slot27
			else
				if slot7 then
					slot7:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
						setActive(slot0, true)

						return
					end)
				else
					setActive(slot27, true)
				end

				slot7 = slot27
			end

			slot28[#slot28 + 1] = function ()
				slot0:GetComponent(typeof(Animator)).enabled = false

				SetActive(SetActive, true)
				SetActive(SetActive, true)
				SetActive(true, true)

				SetActive:GetComponent(typeof(CanvasGroup)).alpha = 1

				LeanTween.cancel(go(slot3))
				LeanTween.cancel(go(LeanTween.cancel))

				slot0 = SetActive
				slot1 = slot4

				if slot5:getIntimacy() >= slot6:getIntimacy() then
					slot2 = false
				else
					slot2 = true
				end

				slot0(slot1, slot2)

				slot0 = SetActive
				slot1 = slot7

				if slot6:getIntimacy() >= slot5:getIntimacy() then
					slot2 = false
				else
					slot2 = true
				end

				slot0(slot1, slot2)

				slot1.localPosition = Vector3(0, 0, 0)

				setText(slot8, slot6.level)

				if slot5.level == slot5:getMaxLevel() then
					setText(slot9, "+" .. math.ceil(slot6:getExp() - slot6:getExp()))

					slot10.fillAmount = 1
				else
					if slot5.level < slot6.level then
						slot0 = 0

						for slot4 = slot5.level, slot6.level - 1, 1 do
							slot0 = slot0 + getExpByRarityFromLv1(slot11, slot4)
						end

						setText(slot9, "+" .. (slot0 + slot6:getExp()) - slot6:getExp())
					else
						setText(slot9, "+" .. math.ceil(slot6:getExp() - slot6:getExp()))
					end

					slot10.fillAmount = slot6:getExp() / getExpByRarityFromLv1(slot11, slot6.level)
				end

				SetActive(slot3, false)

				return
			end
		end
	end

	slot9[#slot9].GetComponent(slot11, typeof(DftAniEvent)).SetEndEvent(slot12, function (slot0)
		slot0._stateFlag = slot1.STATE_DISPLAYED

		if not slot0._subFirstExpTF then
			slot0:skip()
		end

		return
	end)

	if #slot10 > 0 then
		slot10[#slot10].GetComponent(slot13, typeof(DftAniEvent)):SetEndEvent(function (slot0)
			slot0._stateFlag = slot1.STATE_SUB_DISPLAYED

			slot0:skip()

			return
		end)
	end
end

function slot0.setAtkAnima(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot12 = slot0:findTF("result", slot1).GetComponent(slot8, typeof(DftAniEvent))

	setText(slot9, 0)
	setText(slot11, 0)

	slot0:findTF("result/dmg_progress/progress_bar", slot1).GetComponent(slot10, typeof(Image)).fillAmount = 0

	if slot5 then
		setParent(slot0._mvpFX, slot13)

		slot0._mvpFX.localPosition = Vector3(-368.5, 0, 0)

		setActive(slot13, true)
		setActive(slot0:findTF("result/bg", slot1), false)
	end

	slot12:SetEndEvent(function (slot0)
		if slot0 then
			setActive(slot1._mvpFX, true)
		end

		LeanTween.value(go(go), 0, , ):setOnUpdate(System.Action_float(function (slot0)
			slot0:GetComponent(typeof(Image)).fillAmount = slot0

			return
		end))

		if 0 ~= 0 then
			LeanTween.value(go(go), 0, slot6, ):setOnUpdate(System.Action_float(function (slot0)
				setText(slot0, math.floor(slot0))

				return
			end))
			LeanTween.value(go(go), 0, slot8, ):setOnUpdate(System.Action_float(function (slot0)
				setText(slot0, math.floor(slot0))

				return
			end))
		end

		return
	end)

	if slot2.childCount > 1 then
		slot0:findTF("result", slot2:GetChild(slot2.childCount - 2)).GetComponent(slot13, typeof(DftAniEvent)):SetTriggerEvent(function (slot0)
			setActive(slot0, true)

			return
		end)
	else
		setActive(slot8, true)
	end

	function slot13()
		slot0:GetComponent(typeof(Image)).fillAmount = slot0

		setText(typeof, slot3)
		setText(slot4, slot5)

		slot6.localPosition = Vector3(280, 46, 0)
		slot6:GetComponent(typeof(Animator)).enabled = false

		setActive(slot6, true)
		setActive(slot7._mvpFX, true)

		return
	end

	if slot0._atkFuncs[slot2] == nil then
		slot0._atkFuncs[slot2] = {}
	end

	table.insert(slot0._atkFuncs[slot2], slot13)

	return
end

function slot0.skipAtkAnima(slot0, slot1)
	if slot0._atkFuncs[slot1] then
		for slot5, slot6 in ipairs(slot0._atkFuncs[slot1]) do
			slot6()
		end

		slot0._atkFuncs[slot1] = nil
	end

	return
end

function slot0.showPainting(slot0)
	slot1, slot2 = nil

	SetActive(slot0._painting, true)

	if slot0.contextData.score > 1 then
		if not slot0.mvpShipVO then
			slot3 = slot0.flagShipVO
		end

		slot0.paintingName = slot3:getPainting()

		setPaintingPrefabAsync(slot0._painting, slot0.paintingName, "jiesuan", function ()
			if findTF(slot0._painting, "fitter").childCount > 0 then
				Ship.SetExpression(findTF(slot0._painting, "fitter"):GetChild(0), slot0.paintingName, "win_mvp")
			end

			return
		end)

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
			slot0._statisticsBtn:GetComponent("Button").enabled = true
			slot0._statisticsBtn.GetComponent("Button")._confirmBtn:GetComponent("Button").enabled = true
			slot0._statisticsBtn.GetComponent("Button")._confirmBtn.GetComponent("Button")._atkBG:GetComponent("Button").enabled = true

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
	for slot4, slot5 in ipairs(slot0._delayLeanList) do
		LeanTween.cancel(slot5)
	end

	if slot0._stateFlag == slot0.STATE_RANK_ANIMA then
	else
		if slot0._stateFlag == slot0.STATE_REPORT then
			slot1 = slot0._conditionContainer.childCount

			while slot1 > 0 do
				SetActive(slot0._conditionContainer:GetChild(slot1 - 1), true)

				slot1 = slot1 - 1
			end

			SetActive(slot0:findTF("jieuan01/tips", slot0._bg), true)

			slot0._stateFlag = slot0.STATE_REPORTED
		else
			if slot0._stateFlag == slot0.STATE_REPORTED then
				slot0:showRewardInfo()
			else
				if slot0._stateFlag == slot0.STATE_REWARD then
				else
					if slot0._stateFlag == slot0.STATE_DISPLAY then
						for slot4, slot5 in ipairs(slot0._skipExp) do
							slot5()
						end

						slot0._skipExp = nil
						slot0._stateFlag = slot0.STATE_DISPLAYED

						setText(slot0._playerBonusExp, "+" .. slot0:calcPlayerProgress())

						if not slot0._subFirstExpTF then
							slot0:playSubExEnter()
						end
					else
						if slot0._stateFlag == slot0.STATE_DISPLAYED then
							setText(slot0._playerBonusExp, "+" .. slot0:calcPlayerProgress())
							slot0:playSubExEnter()
						else
							if slot0._stateFlag == slot0.STATE_SUB_DISPLAY then
								for slot4, slot5 in ipairs(slot0._subSkipExp) do
									slot5()
								end

								slot0._subSkipExp = nil
								slot0._stateFlag = slot0.STATE_SUB_DISPLAYED
							else
								if slot0._stateFlag == slot0.STATE_SUB_DISPLAYED then
									slot0:showRightBottomPanel()
								end
							end
						end
					end
				end
			end
		end
	end

	return
end

function slot0.playSubExEnter(slot0)
	slot0._stateFlag = slot0.STATE_SUB_DISPLAY

	if slot0._subFirstExpTF then
		triggerToggle(slot0._subToggle, false)
		setActive(slot0._subFirstExpTF, true)
	else
		slot0:showRightBottomPanel()
	end

	return
end

function slot0.showRightBottomPanel(slot0)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0._rightBottomPanel, true)

	slot1 = SetActive
	slot2 = slot0._subToggle

	if slot0._subFirstExpTF == nil then
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
	slot0._subFirstExpTF = nil

	return
end

function slot0.showStatistics(slot0)
	setActive(slot0._leftPanel, false)
	slot0:enabledStatisticsGizmos(false)
	SetActive(slot0._atkBG, true)

	slot0._atkBG:GetComponent("Button").enabled = false
	slot0._confirmBtn:GetComponent("Button").enabled = false
	slot0._statisticsBtn:GetComponent("Button").enabled = false

	slot0:showPainting()
	LeanTween.moveX(rtf(slot0._atkPanel), 0, 0.25):setOnComplete(System.Action(function ()
		SetActive(slot0._atkContainer, true)

		return
	end))

	return
end

function slot0.closeStatistics(slot0)
	setActive(slot0._leftPanel, true)
	slot0:skipAtkAnima(slot0._atkContainerNext)
	slot0:skipAtkAnima(slot0._atkContainer)
	slot0:enabledStatisticsGizmos(true)
	slot0:hidePainting()

	slot0._atkBG:GetComponent("Button").enabled = false

	LeanTween.cancel(slot0._atkPanel.gameObject)
	LeanTween.moveX(rtf(slot0._atkPanel), -700, 0.2):setOnComplete(System.Action(function ()
		SetActive(slot0._atkBG, false)

		return
	end))

	return
end

function slot0.enabledStatisticsGizmos(slot0, slot1)
	setActive(slot0:findTF("gizmos/xuxian_down", slot0._main), slot1)
	setActive(slot0:findTF("gizmos/xuxian_middle", slot0._main), slot1)

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
	if slot0._stateFlag == slot0.STATE_RANK_ANIMA then
	else
		if slot0._stateFlag == slot0.STATE_REPORT then
			triggerButton(slot0._bg)
		else
			if slot0._stateFlag == slot0.STATE_DISPLAY then
				triggerButton(slot0._skipBtn)
			else
				triggerButton(slot0._confirmBtn)
			end
		end
	end

	return
end

function slot0.willExit(slot0)
	slot0._atkFuncs = nil

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

	if slot0._nameTxts then
		for slot4 = #slot0._nameTxts, 1, -1 do
			slot0._nameTxts[slot4]:destroy()
			table.remove(slot0._nameTxts, slot4)
		end

		slot0._nameTxts = nil
	end

	return
end

return slot0
