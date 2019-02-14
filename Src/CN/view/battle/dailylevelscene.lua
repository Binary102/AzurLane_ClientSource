slot0 = class("DailyLevelScene", import("..base.BaseUI"))
slot1 = 3
slot2 = 4

function slot0.getUIName(slot0)
	return "dailylevelui"
end

function slot0.getBGM(slot0)
	return "level"
end

slot3 = 501

function slot0.init(slot0)
	slot0._guiderLoaded = true
	slot0.top = slot0:findTF("top")
	slot0.backBtn = slot0:findTF("top/title/back")
	slot0.resPanel = PlayerResource.New()

	SetParent(slot0.resPanel._go, slot0:findTF("top/title/resources"), false)

	slot0.content = slot0:findTF("list")

	setActive(slot0.content, false)

	slot0.dailylevelTpl = slot0:getTpl("list/captertpl")
	slot0.descPanel = slot0:findTF("desc_panel")
	slot0.descMain = slot0:findTF("main", slot0.descPanel)
	slot0.descChallengeNum = slot0:findTF("challenge_count", slot0.descPanel)
	slot0.descChallengeText = slot0:findTF("Text", slot0.descChallengeNum)
	slot0.stageTpl = slot0:getTpl("scrollview/content/stagetpl", slot0.descMain)
	slot0.stageContain = slot0:findTF("scrollview/content", slot0.descMain)
	slot0.arrows = slot0:findTF("arrows")
	slot0.paint = slot0:findTF("paint", slot0.descPanel)

	setActive(slot0.paint, false)

	slot0.itemTpl = slot0:getTpl("item_tpl")

	slot0:uiStartAnimating()

	slot0.challengeStageView = slot0:findTF("stage_info")
	slot0.challengeSetting = slot0:findTF("panel/setting", slot0.challengeStageView)
	slot0.challengeBrief = slot0:findTF("panel/progress", slot0.challengeStageView)

	onButton(slot0, slot0:findTF("panel/btnBack", slot0.challengeStageView), function ()
		slot0:closeChallengeSettingView()
	end)

	slot0.fleetEditView = slot0:findTF("fleet_edit")
	slot0.resource = slot0:findTF("resource")

	slot0:initItems()
end

function slot0.getWeek(slot0)
	return pg.TimeMgr.GetInstance():GetServerWeek()
end

function slot0.setDailyCounts(slot0, slot1)
	slot0.dailyCounts = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setChallengeInfo(slot0, slot1)
	slot0.challengeInfo = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)

	slot0.player = slot1
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.top, {
		y = slot0.top.rect.height
	})
	shiftPanel(slot0.top, nil, 0, 0.3, 0, true, true, nil, function ()
		slot0:dispatchUILoaded(true)
	end)

	slot0.tweens = topAnimation(slot0:findTF("title/bg/left", slot0.top), slot0:findTF("title/bg/right", slot0.top), slot0:findTF("title/bg/title_task", slot0.top), slot0:findTF("title/bg/daily", slot0.top), nil, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.top, nil, slot0.top.rect.height, 0.3, 0, true, true)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("help_btn"), function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = pg.gametip.help_daily_task.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.descMode then
			slot0:enableDescMode(false)
		else
			slot0:uiExitAnimating()
			slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.1)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("rank_btn", slot0.challengeSetting), function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("rank_btn", slot0.challengeBrief), function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_RANK)
	end)
	slot0:displayDailyLevels()

	if slot0.challengeInfo.battleScore > 0 and slot0.challengeInfo:isActive() then
		slot0:tryOpenDesc(slot0.tryOpenDesc)
		slot0:openChallengeView()
	elseif slot0.contextData.challenge and not slot0.challengeInfo:isActive() then
		slot0:tryOpenDesc(slot0.tryOpenDesc)
		slot0:openChallengeFleetEditView()
	elseif slot0.contextData.dailyLevelId then
		slot0:tryOpenDesc(slot0.contextData.dailyLevelId)
	else
		slot0:enableDescMode(false)
	end
end

function slot0.initItems(slot0)
	slot0.dailyLevelTFs = {}

	for slot6, slot7 in pairs(slot2) do
		if table.contains(pg.expedition_daily_template[slot7].weekday, tonumber(slot0:getWeek())) then
			table.remove(slot2, slot6)
			table.insert(slot2, math.ceil(#slot1.all / 2), slot7)

			break
		end
	end

	for slot6, slot7 in pairs(slot2) do
		slot0.dailyLevelTFs[slot7] = cloneTplTo(slot0.dailylevelTpl, slot0.content, slot7)
	end
end

function slot0.displayDailyLevels(slot0)
	for slot4, slot5 in pairs(slot0.dailyLevelTFs) do
		slot0:initDailyLevel(slot4)
	end

	slot0.content:GetComponent(typeof(EnhancelScrollView)).onCenterClick = function (slot0)
		slot0:tryOpenDesc(tonumber(slot0.name))
	end
end

function slot0.tryOpenDesc(slot0, slot1)
	slot2 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0:openDailyDesc(slot1)
	else
		pg.TipsMgr:GetInstance():ShowTips(slot3.tips)
	end
end

function slot0.initDailyLevel(slot0, slot1)
	slot3 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0.index = slot1
	end

	setText(findTF(slot3, "name"), slot2.title)
	setActive(findTF(slot3, "time"), false)
	setImageSprite(findTF(slot3, "icon"), GetSpriteFromAtlas("dailylevelicon/" .. slot2.pic, ""), true)

	if slot0 == slot1 then
		slot6 = 0

		if slot0.challengeInfo then
			setText(findTF(slot3, "Text"), slot0.challengeInfo.maxScore or 0)
		end
	else
		setText(findTF(slot3, "Text"), "")
	end

	slot6 = findTF(slot3, "count")
	slot7 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(slot6, "N/A")
	else
		setText(slot6, string.format("%d/%d", slot2.limit_time - slot7, slot2.limit_time))
	end

	setActive(slot6, slot2.limit_time > 0)
end

function slot0.openDailyDesc(slot0, slot1)
	slot0:enableDescMode(true)
	slot0:displayStageList(slot1)
end

function slot0.displayStageList(slot0, slot1)
	slot0.dailyLevelId = slot1
	slot0.contextData.dailyLevelId = slot0.dailyLevelId
	slot2 = pg.expedition_daily_template[slot1]
	slot3 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(slot0.descChallengeText, i18n("challenge_count_unlimit"))
	else
		setText(slot0.descChallengeText, string.format("%d/%d", slot2.limit_time - slot3, slot2.limit_time))
	end

	removeAllChildren(slot0.stageContain)

	slot0.stageTFs = {}

	for slot8, slot9 in ipairs(slot4) do
		slot0.stageTFs[slot9[1]] = cloneTplTo(slot0.stageTpl, slot0.stageContain)
		slot12 = {
			id = slot9[1],
			level = slot9[2]
		}

		if slot1 == slot0 then
			slot0:updateChallenge(slot12)
		else
			slot0:updateStage(slot12)
		end
	end
end

function slot0.updateChallenge(slot0, slot1)
	slot2 = getProxy(ChallengeProxy):getChallenge(slot1.id)

	setText(findTF(slot3, "left_panel/name"), "挑战模式")
	setText(findTF(slot3, "left_panel/lv/Text"), "Lv." .. slot1.level)
	setActive(findTF(slot3, "left_panel/class"), false)
	setImageSprite(slot3, getImageSprite(findTF(slot0.resource, "challenge_bg")))
	setActive(findTF(slot3, "score"), true)
	setActive(slot0:findTF("mask", slot3), slot0.player.level < slot1.level)

	if slot0.player.level < slot1.level then
		setText(slot0:findTF("msg/msg_contain/Text", slot4), "Lv." .. slot1.level .. " ")
		setText(findTF(slot3, "score"), "- - -")
	else
		setText(findTF(slot3, "score"), comma_value(getProxy(ChallengeProxy):getCurrentChallengeInfo().maxScore))
	end

	onButton(slot0, slot3, function ()
		if slot1.player.level < slot0.level then
			pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_unopened"))

			return
		end

		slot1:emit(DailyLevelMediator.ON_CHALLENGE, slot1.emit)
	end, SFX_PANEL)
end

function slot0.openChallengeView(slot0)
	if slot0.challengeInfo:isActive() then
		slot0:openChallengeBriefingView()
	else
		slot0:openChallengeSettingView()
	end

	onButton(slot0, slot0:findTF("panel/right/rule_btn", slot0.challengeStageView), function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = i18n("challenge_rule")
		})
	end, SFX_PANEL)

	slot1 = slot0.challengeInfo:getCurrentChallengeTemplate()

	setImageSprite(slot0:findTF("panel/head/Image", slot0.challengeStageView), LoadSprite("qicon/" .. slot1.char_icon[1]))
	setText(slot2, slot1.chapter_name[1])
	setText(slot3, slot1.chapter_name[2])
	setText(slot4, slot1.chapter_name[3])
	setText(slot0:findTF("panel/intro", slot0.challengeStageView), slot1.chapter_description)
end

function slot0.openChallengeBriefingView(slot0)
	setActive(slot0.challengeStageView, true)
	setActive(slot0.challengeBrief, true)
	setActive(slot0.challengeSetting, false)
	setText(slot1, i18n("challenge_current_progress", slot0.challengeInfo.challengeLevel))
	setText(slot0:findTF("score/level", slot0.challengeBrief), slot0.challengeInfo.currentScore)
	onButton(slot0, slot0:findTF("reset_button", slot0.challengeBrief), function ()
		slot0:emit(DailyLevelMediator.ON_RESET_CHALLENGE)
	end)
	onButton(slot0, slot0:findTF("continue_button", slot0.challengeBrief), function ()
		slot0:emit(DailyLevelMediator.ON_CONTINUE_CHALLENGE)
	end)
end

function slot0.openChallengeSettingView(slot0)
	setActive(slot0.challengeStageView, true)
	setActive(slot0.challengeBrief, false)
	setActive(slot0.challengeSetting, true)
	function (slot0, slot1, slot2, slot3, slot4)
		slot5 = slot0:GetComponent(typeof(Slider))
		slot6 = findTF(slot0, "Fill Area/Fill"):GetComponent(typeof(Image))
		slot7 = #slot3

		onSlider(slot0, slot0, function (slot0)
			slot0.fillAmount = (slot0 - 1) / (slot1 - 1)

			setText(slot1 - 1, "X " .. slot2[slot0].rate)
			setText("X " .. slot2[slot0].rate, slot2[slot0].content)
		end)

		slot8 = 1

		for slot12, slot13 in ipairs(slot3) do
			if slot13.rate == slot4 then
				slot8 = slot12
			end
		end

		setSlider(slot5, 1, slot7, slot8)
		slot5.onValueChanged:Invoke(slot8)
	end(slot0:findTF("meters/damage_slider/Slider", slot0.challengeSetting), slot0:findTF("meters/damage_slider/rate", slot0.challengeSetting), slot0:findTF("meters/damage_slider/value", slot0.challengeSetting), ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_DAMAGE], slot0.challengeInfo:getDamageRate() or ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_DAMAGE][1])
	function (slot0, slot1, slot2, slot3, slot4)
		slot5 = slot0.GetComponent(typeof(Slider))
		slot6 = findTF(slot0, "Fill Area/Fill").GetComponent(typeof(Image))
		slot7 = #slot3

		onSlider(slot0, slot0, function (slot0)
			slot0.fillAmount = (slot0 - 1) / (slot1 - 1)

			setText(slot1 - 1, "X " .. slot2[slot0].rate)
			setText("X " .. slot2[slot0].rate, slot2[slot0].content)
		end)

		slot8 = 1

		for slot12, slot13 in ipairs(slot3) do
			if slot13.rate == slot4 then
				slot8 = slot12
			end
		end

		setSlider(slot5, 1, slot7, slot8)
		slot5.onValueChanged.Invoke(slot8)
	end(slot0:findTF("meters/level_slider/Slider", slot0.challengeSetting), slot0:findTF("meters/level_slider/rate", slot0.challengeSetting), slot0:findTF("meters/level_slider/value", slot0.challengeSetting), ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_LEVEL], slot0.challengeInfo:getLevelRate() or ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_LEVEL][1])
	onButton(slot0, slot0:findTF("start_button", slot0.challengeSetting), function ()
		slot4:emit(DailyLevelMediator.ON_CHALLENGE_EDIT_FLEET, {
			damageRateID = slot0[slot1:GetComponent(typeof(Slider)).value].id,
			levelRateID = slot1[typeof:GetComponent(typeof(Slider)).value].id
		})

		return
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0.challengeStageView)
end

function slot0.closeChallengeSettingView(slot0)
	setActive(slot0.challengeStageView, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.challengeStageView, slot0._tf)

	return
end

function slot0.openChallengeFleetEditView(slot0)
	slot0:closeChallengeSettingView()
	setActive(slot0.fleetEditView, true)

	slot1 = findTF(slot0.fleetEditView, "panel/fleet")

	slot0:flushFleetEditButton()
	onButton(slot0, findTF(slot0.fleetEditView, "panel/bg/btnBack"), function ()
		slot0:closeChallengeFleetEditView()
		slot0.closeChallengeFleetEditView:openChallengeView()

		slot0.closeChallengeFleetEditView.openChallengeView.contextData.challenge = nil

		return
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0.fleetEditView)

	return
end

function slot0.closeChallengeFleetEditView(slot0)
	setActive(slot0.fleetEditView, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetEditView, slot0._tf)

	return
end

function slot0.flushFleetEditButton(slot0)
	slot2 = findTF(slot0.fleetEditView, "panel/fleet")
	slot3 = slot0.challengeInfo.getShips(slot1)
	slot9 = slot4(slot2, "main", slot7)
	slot10 = slot4(slot2, "vanguard", slot8)

	setText(findTF(slot0.fleetEditView, "panel/gear_score/text"), math.floor(slot0.challengeInfo.getFleetGS(slot1)))
	setText(findTF(slot0.fleetEditView, "panel/rateList/difficulty/text"), "x " .. slot0.challengeInfo.getDifficultyRate(slot1))

	slot11, slot12 = slot0.challengeInfo.getGSRateID(slot1)

	setActive(findTF(slot0.fleetEditView, "panel/rateList/gs"), false)
	onButton(slot0, findTF(slot0.fleetEditView, "panel/start_button"), function ()
		if slot0 and slot1 then
			slot2.contextData.challenge = nil

			slot2:emit(DailyLevelMediator.ON_REQUEST_CHALLENGE, {})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end

		return
	end)
	onButton(slot0, slot5, function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_FLEET_CLEAR, {})

		return
	end)
	onButton(slot0, slot0:findTF("recommendation", slot2), function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_FLEET_RECOMMEND, {})

		return
	end)

	return
end

function slot0.updateStage(slot0, slot1)
	setText(findTF(slot3, "left_panel/name"), pg.expedition_data_template[slot1.id].name)
	setText(findTF(slot3, "left_panel/lv/Text"), "Lv." .. slot1.level)
	setActive(findTF(slot3, "left_panel/class"), true)
	setActive(slot0:findTF("mask", slot3), slot0.player.level < slot1.level)

	if slot0.player.level < slot1.level then
		setText(slot0:findTF("msg/msg_contain/Text", slot4), "Lv." .. slot1.level .. " ")
	end

	slot5 = slot0:findTF("scrollView/right_panel", slot3)

	for slot9, slot10 in ipairs(slot2.award_display) do
		updateDrop(cloneTplTo(slot0.itemTpl, slot5), {
			type = slot10[1],
			id = slot10[2],
			count = slot10[3]
		})
	end

	setImageSprite(slot3, getImageSprite(findTF(slot0.resource, "normal_bg")))
	setActive(findTF(slot3, "score"), false)
	onButton(slot0, slot3, function ()
		if slot0.limit_time <= (slot0.dailyCounts[slot0.dailyLevelId] or 0) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

			return
		end

		slot0:emit(DailyLevelMediator.ON_STAGE, slot0.emit)

		return
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_unopened"))

		return
	end, SFX_PANEL)

	return
end

function slot0.enableDescMode(slot0, slot1)
	slot0.descMode = slot1

	setActive(slot0:findTF("help_btn"), not slot1)

	function slot2(slot0, slot1, slot2)
		if LeanTween.isTweening(go(slot0)) then
			LeanTween.cancel(go(slot0))
		end

		LeanTween.moveX(rtf(slot0), slot1, 0.5):setEase(LeanTweenType.easeInOutBack):setOnComplete(System.Action(function ()
			if slot0 then
				slot0()
			end

			return
		end))

		return
	end

	function slot3()
		setActive(slot0.content, not slot1)
		setActive(slot0.descPanel, )
		setActive(slot0.arrows, not slot1)

		return
	end

	if slot1 then
		slot3()
		slot2(slot0.descMain, 0)
		slot2(slot0.descChallengeNum, 35)
		setActive(slot0.paint, true)
		slot2(slot0.paint, 0)
	else
		slot3()
		slot2(slot0.descMain, 895)
		slot2(slot0.descChallengeNum, -214)
		slot2(slot0.paint, -700, function ()
			setActive(slot0.paint, false)

			return
		end)
	end

	return
end

function slot0.willExit(slot0)
	slot0:closeChallengeSettingView()
	slot0:closeChallengeFleetEditView()

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end

	return
end

return slot0
