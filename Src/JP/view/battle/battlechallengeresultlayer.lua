slot0 = class("BattleChallengeResultLayer", import("..base.BaseUI"))
slot0.DURATION_WIN_FADE_IN = 0.5
slot0.DURATION_LOSE_FADE_IN = 1.5
slot0.DURATION_GRADE_LAST = 1.5
slot0.DURATION_MOVE = 0.7
slot0.DURATION_WIN_SCALE = 0.7

function slot0.getUIName(slot0)
	return "BattleResultUI"
end

function slot0.setChallengeInfo(slot0, slot1)
	slot0.challenge = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
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
	slot0._rightBottomPanel = slot0:findTF("challenge_confirm", slot0._main)
	slot0._continueBtn = slot0:findTF("continue_btn", slot0._rightBottomPanel)
	slot0._exitBtn = slot0:findTF("quit_btn", slot0._rightBottomPanel)
	slot0._endBtn = slot0:findTF("end_btn", slot0._rightBottomPanel)
	slot0._rankBtn = slot0:findTF("rank_btn", slot0._rightBottomPanel)
	slot0._skipBtn = slot0:findTF("skipLayer", slot0._tf)
	slot0._scoreRate = slot0:findTF("challenge_score", slot0._main)
	slot0._gsRate = slot0:findTF("gs_rate/text", slot0._scoreRate)
	slot0._difficultyRate = slot0:findTF("difficulty_rate/text", slot0._scoreRate)
	slot0._rateIconList = slot0:findTF("challenge_score/rate_icon_list", slot0._main)
	slot0._iconLevelRate = slot0:findTF("level/value", slot0._rateIconList)
	slot0._iconDamageRate = slot0:findTF("damage/value", slot0._rateIconList)
	slot0._iconGSRate = slot0:findTF("gs/value", slot0._rateIconList)
	slot0._score = slot0:findTF("score", slot0._main)
	slot0._battleScoreText = slot0:findTF("current/value", slot0._score)
	slot0._totalScoreText = slot0:findTF("total/value", slot0._score)
	slot0._totalScore = slot0:findTF("final", slot0._score)
	slot0._finalScore = slot0:findTF("final", slot0._totalScore)

	SetActive(slot0._finalScore, false)

	slot0._maxScoreText = slot0:findTF("max/value", slot0._totalScore)
	slot0.UIMain = pg.UIMgr:GetInstance().UIMain
	slot0.overlay = pg.UIMgr:GetInstance().OverlayMain
	slot1 = {
		"grade_label_d",
		"grade_label_over_time",
		"grade_label_b",
		"grade_label_a",
		"grade_label_s"
	}
	slot2 = nil

	if slot0.contextData.score > 0 then
		slot2 = slot1[slot3 + 1]
	else
		slot2 = (slot0.contextData.statistics._scoreMark == ys.Battle.BattleConst.DEAD_FLAG and "grade_label_flag_destroy") or "grade_label_team_kill"

		SetActive(slot0._continueBtn, false)
	end

	LoadImageSpriteAsync("battlescore/" .. slot2, slot0._gradeLabel, true)
	SetActive(slot0._levelText, false)
end

function slot0.didEnter(slot0)
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

	setText(slot0._gsRate, "x" .. slot0.challenge.gsFactor)
	setText(slot0._difficultyRate, "x" .. slot0.challenge:getDifficultyRate())
	setText(slot0._iconLevelRate, "x" .. slot0.challenge:getLevelRate())
	setText(slot0._iconDamageRate, "x" .. slot0.challenge:getDamageRate())
	setText(slot0._iconGSRate, "x" .. slot0.challenge.gsFactor)
	setText(slot0._battleScoreText, 0)
	setText(slot0._totalScoreText, 0)
	setText(slot0._maxScoreText, 0)
	SetActive(slot0._totalScore, slot0.challenge:isClear())
	SetActive(slot0._gsRate, true)
	SetActive(slot0._difficultyRate, true)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0:findTF("main/condition"), false)

	slot0._stateFlag = "rankAnima"
end

function slot0.rankAnimaFinish(slot0)
	SetActive(slot0._scoreRate, true)
	SetActive(slot0._rateIconList, false)
	onButton(slot0, slot0._bg, function ()
		slot0._bg:GetComponent("Button").enabled = false

		slot0._bg.GetComponent("Button"):displayBG()
	end, SFX_CONFIRM)
	SetActive(slot0:findTF("main/tips"), true)
	SetActive(slot0:findTF("main/condition"), false)

	slot0._stateFlag = "report"
end

function slot0.displayBG(slot0)
	SetActive(slot0:findTF("main/tips"), false)
	LeanTween.scale(slot0._grade, Vector3(0.6, 0.6, 1), slot0.DURATION_MOVE)
	LeanTween.moveLocal(go(slot1), slot0._gradeUpperLeftPos, slot0.DURATION_MOVE)
	SetActive(slot0._score, true)
	SetActive(slot0._skipBtn, true)
	slot0:displayScore()
	onButton(slot0, slot0._skipBtn, function ()
		slot0:skip()
	end, SFX_CONFIRM)

	slot0._stateFlag = "display"
end

function slot0.displayScore(slot0)
	slot3 = slot0.challenge.currentScore - slot0.challenge.battleScore

	function slot4()
		LeanTween.value(go(slot0._tf), 0, slot0.challenge.maxScore, 1):setOnUpdate(System.Action_float(function (slot0)
			setText(slot0._maxScoreText, math.floor(slot0))
		end)):setDelay(1):setOnComplete(System.Action(function ()
			slot0:showRightBottomPanel()

			return
		end))
	end

	if slot0.contextData.score > 1 then
		setText(slot0._totalScoreText, slot3)
		LeanTween.value(go(slot0._tf), 0, slot1, 1):setOnUpdate(System.Action_float(function (slot0)
			setText(slot0._battleScoreText, math.floor(slot0))

			return
		end)):setOnComplete(System.Action(function ()
			LeanTween.value(go(slot0._tf), , , 1):setOnUpdate(System.Action_float(function (slot0)
				setText(slot0._totalScoreText, math.floor(slot0))

				return
			end)):setDelay(1):setOnComplete(System.Action(function ()
				if slot0.challenge:isClear() then
					slot1()
				else
					slot0:showRightBottomPanel()
				end

				return
			end))

			return
		end))
	else
		setText(slot0._totalScoreText, slot2)
		slot4()
	end
end

function slot0.skip(slot0)
	LeanTween.cancel(go(slot0._tf))
	setText(slot0._battleScoreText, slot0.challenge.battleScore)
	setText(slot0._totalScoreText, slot0.challenge.currentScore)

	if slot0.challenge:isClear() or slot0.contextData.score <= 1 then
		setText(slot0._maxScoreText, slot0.challenge.maxScore)
	end

	slot0:showRightBottomPanel()

	return
end

function slot0.showRightBottomPanel(slot0)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0._rightBottomPanel, true)

	if not slot0.challenge:isClear() then
		SetActive(slot0._continueBtn, slot0.contextData.score > 1)
		SetActive(slot0._exitBtn, true)
		SetActive(slot0._endBtn, false)
		SetActive(slot0._rankBtn, false)
		onButton(slot0, slot0._continueBtn, function ()
			slot0:emit(BattleResultMediator.ON_NEXT_CHALLENGE)

			return
		end, SFX_CONFIRM)
		onButton(slot0, slot0._exitBtn, function ()
			slot0:emit(BattleResultMediator.ON_BACK_TO_LEVEL_SCENE)

			return
		end, SFX_CONFIRM)
	else
		SetActive(slot0._continueBtn, false)
		SetActive(slot0._exitBtn, false)
		SetActive(slot0._endBtn, true)
		SetActive(slot0._rankBtn, true)
		onButton(slot0, slot0._endBtn, function ()
			slot0:emit(BattleResultMediator.ON_BACK_TO_LEVEL_SCENE)

			return
		end, SFX_CONFIRM)
		onButton(slot0, slot0._rankBtn, function ()
			slot0:emit(BattleResultMediator.ON_CHALLENGE_RANK)

			return
		end, SFX_CONFIRM)
	end

	slot0._stateFlag = nil

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
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	return
end

return slot0
