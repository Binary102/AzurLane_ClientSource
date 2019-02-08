slot0 = class("BattleDodgemResultLayer", import("..base.BaseUI"))
slot0.DURATION_WIN_FADE_IN = 0.5
slot0.DURATION_LOSE_FADE_IN = 1.5
slot0.DURATION_GRADE_LAST = 1.5
slot0.DURATION_MOVE = 0.7
slot0.DURATION_WIN_SCALE = 0.7

function slot0.getUIName(slot0)
	return "BattleResultUI"
end

function slot0.setPlayer(slot0)
	return
end

function slot0.setShips(slot0)
	return
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
	slot0._rightBottomPanel = slot0:findTF("dodgem_confirm", slot0._main)
	slot0._exitBtn = slot0:findTF("confirm_btn", slot0._rightBottomPanel)
	slot0._skipBtn = slot0:findTF("skipLayer", slot0._tf)
	slot0._dodgem = slot0:findTF("dodgem", slot0._main)
	slot0._scoreText = slot0:findTF("score/value", slot0._dodgem)
	slot0._comboText = slot0:findTF("combo/value", slot0._dodgem)

	SetActive(slot0._dodgem, false)

	slot0.UIMain = pg.UIMgr:GetInstance().UIMain
	slot0.overlay = pg.UIMgr:GetInstance().OverlayMain
	slot1 = nil

	LoadImageSpriteAsync("battlescore/" .. ((slot0.contextData.score < 4 and "grade_label_b") or "grade_label_s"), slot0._gradeLabel, true)
	SetActive(slot0._levelText, false)
end

function slot0.didEnter(slot0)
	setText(slot0._levelText, pg.expedition_data_template[slot0.contextData.stageId].name)

	slot0._gradeUpperLeftPos = rtf(slot0._grade).localPosition
	rtf(slot0._grade).localPosition = Vector3(0, 15, 0)
	slot0._gradeLabelImg.color = Color.New(1, 1, 1, 0)

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot0._grade.transform.localScale = Vector3(1.5, 1.5, 0)

	shiftPanel(slot0._rankBG, nil, 10, 0.7, nil)
	LeanTween.scale(slot0._rankBG, Vector3(1, 1, 1), 0.7)
	LeanTween.value(go(slot0._tf), 0, 1, slot0.DURATION_WIN_FADE_IN):setOnUpdate(System.Action_float(function (slot0)
		slot0._gradeLabelImg.color = Color.New(1, 1, 1, 1)
	end))
	LeanTween.scale(slot0._grade, Vector3(0.88, 0.88, 1), slot0.DURATION_WIN_SCALE):setEase(LeanTweenType.easeInExpo):setOnComplete(System.Action(function ()
		SetActive(slot0._levelText, true)
		SetActive:rankAnimaFinish()
	end))

	slot0._tf:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0.5)

	setText(slot0._scoreText, 0)
	setText(slot0._comboText, 0)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0:findTF("main/condition"), false)

	slot0._stateFlag = "rankAnima"
end

function slot0.rankAnimaFinish(slot0)
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
	SetActive(slot0._skipBtn, true)
	slot0:displayScore()
	onButton(slot0, slot0._skipBtn, function ()
		slot0:skip()
	end, SFX_CONFIRM)

	slot0._stateFlag = "display"
end

function slot0.displayScore(slot0)
	SetActive(slot0._dodgem, true)
	LeanTween.value(go(slot0._tf), 0, slot0.contextData.statistics.dodgemResult.score, 1):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0._scoreText, math.floor(slot0))
	end)):setDelay(1):setOnComplete(System.Action(function ()
		slot0:showRightBottomPanel()

		return
	end))
	LeanTween.value(go(slot0._tf), 0, slot0.contextData.statistics.dodgemResult.maxCombo, 1):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0._comboText, math.floor(slot0))

		return
	end))
end

function slot0.skip(slot0)
	LeanTween.cancel(go(slot0._tf))
	setText(slot0._scoreText, slot0.contextData.statistics.dodgemResult.score)
	setText(slot0._comboText, slot0.contextData.statistics.dodgemResult.maxCombo)
	slot0:showRightBottomPanel()

	return
end

function slot0.showRightBottomPanel(slot0)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0._rightBottomPanel, true)
	onButton(slot0, slot0._exitBtn, function ()
		slot0:emit(BattleResultMediator.ON_BACK_TO_LEVEL_SCENE)

		return
	end, SFX_CONFIRM)

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
