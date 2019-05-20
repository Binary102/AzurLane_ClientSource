slot0 = class("LevelStageView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "LevelStageView"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
	slot0:AddListener()

	if Application.isEditor then
		chapter_skip_battle = PlayerPrefs.GetInt("chapter_skip_battle") or 0

		function switch_chapter_skip_battle()
			chapter_skip_battle = 1 - chapter_skip_battle

			PlayerPrefs.SetInt("chapter_skip_battle", chapter_skip_battle)
			PlayerPrefs.Save()
			pg.TipsMgr:GetInstance():ShowTips((chapter_skip_battle == 1 and "已开启战斗跳略") or "已关闭战斗跳略")
		end
	end

	slot0.isFrozen = nil

	setActive(slot0._tf, true)
end

function slot0.OnDestroy(slot0)
	if slot0.stageTimer then
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
	end
end

function slot0.InitUI(slot0)
	slot0.topStage = slot0:findTF("top_stage", slot0._tf)
	slot0.resStage = slot0:findTF("resources", slot0.topStage)
	slot0.resPanel1 = PlayerResource.New()

	slot0.resPanel1:setParent(slot0.resStage, false)
	slot0.resPanel1:setResources(getProxy(PlayerProxy):getData())
	setActive(slot0.topStage, true)

	slot0.bottomStage = slot0:findTF("bottom_stage", slot0._tf)
	slot0.funcBtn = slot0:findTF("func_button", slot0.bottomStage)
	slot0.retreatBtn = slot0:findTF("retreat_button", slot0.bottomStage)
	slot0.switchBtn = slot0:findTF("switch_button", slot0.bottomStage)
	slot0.resetBtn = slot0:findTF("reset_button", slot0.bottomStage)

	setActive(slot0.bottomStage, true)

	slot0.helpBtn = slot0:findTF("help_button", slot0.bottomStage)
	slot0.leftStage = slot0:findTF("left_stage", slot0._tf)

	setActive(slot0.leftStage, true)

	slot0.rightStage = slot0:findTF("right_stage", slot0._tf)
	slot0.bombPanel = slot0.rightStage:Find("bomb_panel")
	slot0.panelBarrier = slot0:findTF("panel_barrier", slot0.rightStage)
	slot0.shamShopBtn = slot0:findTF("btn_sham_shop", slot0.rightStage)

	setActive(slot0.panelBarrier, false)
	setActive(slot0.rightStage, true)

	slot0.airSupremacy = slot0:findTF("msg_panel/air_supremacy", slot0.topStage)

	setAnchoredPosition(slot0.topStage, {
		y = slot0.topStage.rect.height
	})
	setAnchoredPosition(slot0.leftStage, {
		x = -slot0.leftStage.rect.width - 200
	})
	setAnchoredPosition(slot0.rightStage, {
		x = slot0.rightStage.rect.width + 200
	})
	setAnchoredPosition(slot0.bottomStage, {
		y = -slot0.bottomStage.rect.height
	})
end

function slot0.AddListener(slot0)
	onButton(slot0, slot0:findTF("option", slot0.topStage), function ()
		slot0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("back_button", slot0.topStage), function ()
		if slot0.contextData.chapterVO and slot0:getDataType() == ChapterConst.TypeGuild then
			slot0:emit(slot1.ON_BACK)

			return
		end

		slot0:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(slot0, slot0.retreatBtn, function ()
		slot1 = "levelScene_whether_to_retreat"

		if slot0.contextData.chapterVO:existOni() then
			slot1 = "levelScene_oni_retreat"
		elseif slot0:isPlayingWithBombEnemy() then
			slot1 = "levelScene_bomb_retreat"
		elseif slot0:getPlayType() == ChapterConst.TypeTransport then
			slot1 = "levelScene_escort_retreat"
		end

		slot0:HandleShowMsgBox({
			content = i18n(slot1),
			onYes = function ()
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end
		})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(slot0, slot0.switchBtn, function ()
		if slot0.contextData.chapterVO.getDataType(slot0) == ChapterConst.TypeSham then
			slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
		elseif slot1 == ChapterConst.TypeNone then
			if slot0:getNextValidIndex() > 0 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSwitch,
					id = slot0.fleets[slot2].id
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("formation_switch_failed"))
			end
		elseif slot1 == ChapterConst.TypeGuild then
			slot0:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.resetBtn, function ()
		if slot0.contextData.chapterVO:getDataType() == ChapterConst.TypeSham then
			if ChapterConst.ShamResetCountLimit <= slot0.contextData.chapterVO.shamResetCount then
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_reset_err_limit"))

				return
			end

			if slot0.contextData.chapterVO.active then
				slot0:HandleShowMsgBox({
					modal = true,
					content = i18n("sham_reset_confirm"),
					onYes = function ()
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpRetreat
						})
					end
				})
			else
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end
		elseif slot0 == ChapterConst.TypeGuild and slot0.contextData.chapterVO.active then
			slot0:HandleShowMsgBox({
				modal = true,
				content = i18n("sham_reset_confirm"),
				onYes = function ()
					slot0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shamShopBtn, function ()
		slot0:emit(LevelUIConst.IS_Frozen)

		if slot0.emit.isFrozen then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_SHAM_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0.funcBtn, function ()
		slot1 = slot0.contextData.chapterVO.getDataType(slot0)

		if not slot0.contextData.chapterVO:inWartime() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_time_out"))

			return
		end

		slot4 = slot0:getChapterCell(slot0.fleet.line.row, slot0.fleet.line.column)
		slot5 = false

		if slot0:existChampion(slot0.fleet.line.row, slot0.fleet.line.column) then
			slot5 = true

			if chapter_skip_battle == 1 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = slot2.id
				})
			else
				slot0:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachAmbush and slot4.flag == 2 then
			slot6 = nil

			coroutine.wrap(function ()
				slot0:emit(LevelUIConst.DO_AMBUSH_WARNING, slot0)
				coroutine.yield()
				coroutine.yield:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, coroutine.yield)
				coroutine.yield()
			end)()

			slot5 = true
		elseif Application.isEditor and (slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachBoss) and chapter_skip_battle == 1 then
			if slot4.flag == 0 then
				slot5 = true

				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = slot2.id
				})
			end
		elseif slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachBoss then
			if slot4.flag == 0 then
				slot5 = true

				slot0:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachBox then
			if slot4.flag == 0 then
				slot5 = true

				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBox,
					id = slot2.id
				})
			end
		elseif slot4.attachment == ChapterConst.AttachSupply and slot4.attachmentId > 0 then
			slot5 = true
			slot6, slot7 = slot0:getFleetAmmo(slot0.fleet)

			if slot7 < slot6 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSupply,
					id = slot2.id
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("level_ammo_enough"))
			end
		elseif slot4.attachment == ChapterConst.AttachStory then
			slot5 = true
			slot6 = pg.StoryMgr:GetInstance():GetStoryByName("index")
			slot8 = pg.map_event_template[slot4.attachmentId].gametip

			if pg.map_event_template[slot4.attachmentId].memory == 0 then
				return
			end

			pg.ConnectionMgr.GetInstance():Send(11017, {
				story_id = slot7
			}, 11018, function (slot0)
				return
			end)
			pg.StoryMgr:GetInstance():Play(slot6[slot7], function ()
				slot1 = (pg.StoryMgr:GetInstance():getSelectedOptions() and (slot0[1] or 1)) or 1

				if slot0.flag == 0 then
					slot1:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpStory,
						id = slot2.id,
						arg1 = slot1
					})
				end

				if slot3 ~= "" then
					slot2 = nil

					for slot6, slot7 in pairs(pg.memory_template) do
						if slot7.story == slot4 then
							slot2 = slot7.title
						end
					end

					pg.TipsMgr:GetInstance():ShowTips(i18n(pg.TipsMgr.GetInstance().ShowTips, slot2))
				end
			end)
		elseif slot4.attachment == ChapterConst.AttachRival then
			if slot4.flag == 0 then
				slot5 = true

				if slot2:isValid() then
					slot0:emit(LevelMediator2.ON_PVP, slot4.rival)
				else
					slot0:HandleShowMsgBox({
						modal = true,
						content = i18n("formation_reform_tip"),
						onYes = function ()
							slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
						end
					})
				end
			end
		elseif slot4.attachment == ChapterConst.AttachAreaBoss and slot4.flag == 0 then
			slot5 = true

			slot0:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end

		if not slot5 then
			if slot0:getRound() == ChapterConst.RoundEnemy then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		if slot0.contextData.chapterVO then
			if slot0:getDataType() == ChapterConst.TypeSham then
				slot0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("sham_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeGuild then
				slot0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("guild_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeNone then
				if slot0:existOni() then
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("levelScene_sphunt_help_tip")
					})
				elseif slot0:isPlayingWithBombEnemy() then
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("levelScene_bomb_help_tip")
					})
				elseif pg.map_event_list[slot0.id] and pg.map_event_list[slot0.id].help_pictures and next(pg.map_event_list[slot0.id].help_pictures) ~= nil then
					slot2 = {
						disableScroll = true,
						pageMode = true,
						defaultpage = 1,
						ImageMode = true,
						windowSize = {
							x = 836,
							y = 740
						},
						windowPos = {
							y = 15
						},
						helpSize = {
							x = 836,
							y = 660
						}
					}

					for slot6, slot7 in pairs(pg.map_event_list[slot0.id].help_pictures) do
						table.insert(slot2, {
							icon = {
								path = "",
								atlas = slot7
							}
						})
					end

					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = slot2
					})
				else
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = pg.gametip.help_level_ui.tip
					})
				end
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.airSupremacy, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
end

function slot0.SetSeriesOperation(slot0, slot1)
	slot0.seriesOperation = slot1
end

function slot0.SetGrid(slot0, slot1)
	slot0.grid = slot1
end

function slot0.SwitchToChapter(slot0, slot1)
	slot5 = findTF(slot0.rightStage, "target")
	slot6 = findTF(slot0.rightStage, "skip_events")

	setActive(slot3, slot1:existAmbush())
	setActive(slot0.airSupremacy, OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0)
	setActive(findTF(slot0.topStage, "msg_panel/sham_progress"), slot1:getDataType() == ChapterConst.TypeSham)
	setActive(findTF(slot0.rightStage, "btn_sham_shop"), slot1.getDataType() == ChapterConst.TypeSham)

	if slot2 == ChapterConst.TypeSham then
		setActive(slot7, getProxy(ChapterProxy):getShamShop() ~= nil)
	end

	setActive(slot0.resetBtn, slot2 == ChapterConst.TypeSham or slot2 == ChapterConst.TypeGuild)
	setImageColor(slot0.resetBtn, (slot2 == ChapterConst.TypeSham and ChapterConst.ShamResetCountLimit <= slot1.shamResetCount and Color(1, 1, 10, 0.5882352941176471)) or Color(1, 1, 1, 1))

	slot0.achieveOriginalY = -240

	setText(slot6:Find("Label"), i18n("map_event_skip"))

	if slot1:getConfig("event_skip") == 1 then
		if slot1.progress > 0 or slot1.defeatCount > 0 or slot1.passCount > 0 then
			setActive(slot6, true)

			slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY - 40)
			GetComponent(slot6, typeof(Toggle)).isOn = PlayerPrefs.GetInt("skip_events_on_" .. slot1.id, 1) == 1

			onToggle(slot0, slot6, function (slot0)
				PlayerPrefs.SetInt(slot0, (slot0 and 1) or 0)
			end)
		else
			setActive(slot6, false)

			if not PlayerPrefs.HasKey(key) then
				PlayerPrefs.SetInt(key, 0)
			end
		end
	else
		setActive(slot6, false)

		slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY)
	end

	setActive(slot5, slot1:existAchieve())
	setActive(slot0.retreatBtn, slot2 == ChapterConst.TypeNone)
	slot0.seriesOperation()
end

function slot0.SwitchToMap(slot0)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function slot0.updateStageInfo(slot0)
	slot2 = slot0.contextData.chapterVO.getDataType(slot1)
	slot4 = findTF(slot0.topStage, "unlimit")

	setWidgetText(findTF(slot0.topStage, "timer"), "--:--:--")

	if slot0.stageTimer then
		slot0.stageTimer:Stop()
	end

	if slot1:getConfig("time") < slot1:getRemainTime() or slot1:getConfig("time") >= 8640000 then
		setActive(slot3, false)
		setActive(slot4, true)
	else
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.stageTimer = Timer.New(function ()
			setWidgetText(setWidgetText, pg.TimeMgr:GetInstance():DescCDTime(slot0:getRemainTime()))
		end, 1, -1)

		slot0.stageTimer:Start()
		slot0.stageTimer.func()
	end
end

function slot0.updateAmbushRate(slot0, slot1, slot2)
	if not slot0.contextData.chapterVO:existAmbush() then
		return
	end

	slot5 = slot3.fleet.getInvestSums(slot4)
	slot6 = slot3:getAmbushRate(slot3.fleet, slot1)
	slot7 = ChapterConst.GetAmbushDisplay
	slot8 = (not slot2 or not slot3:existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column)) and slot6
	slot15, slot15 = slot7(slot8)

	setText(slot9, i18n("level_scene_title_word_1"))
	setText(slot10, i18n("level_scene_title_word_2"))
	setText(slot11, math.floor(slot5))
	setText(slot12, slot7)
	setTextColor(findTF(slot0.topStage, "msg_panel/ambush/value2"), slot8)

	return

	if not slot3.existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then
		slot8 = slot6
	else
		slot8 = false

		if false then
			slot8 = true
		end
	end
end

function slot0.updateStageAchieve(slot0)
	if not slot0.contextData.chapterVO:existAchieve() then
		return
	end

	slot3 = findTF(slot0.rightStage, "target")

	setActive(slot3, true)

	slot4 = findTF(slot3, "detail")
	slot7 = findTF(slot4, "click")

	setActive(slot5, false)
	setActive(slot9, false)
	removeAllChildren(slot6)
	removeAllChildren(slot10)

	for slot14, slot15 in ipairs(slot2) do
		setActive(findTF(slot16, "star"), slot17)
		setText(slot18, ChapterConst.GetAchieveDesc(slot15.type, slot1))

		slot19 = setTextColor
		slot20 = findTF(slot16, "desc")

		if not ChapterConst.IsAchieved(slot15) or not Color.yellow then
			slot21 = Color.white
		end

		slot19(slot20, slot21)

		cloneTplTo(slot9, slot10):GetComponent(typeof(Image)).enabled = slot17
	end

	onButton(slot0, slot7, function ()
		shiftPanel(shiftPanel, slot0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
	end, SFX_PANEL)
	onButton(slot0, slot8, function ()
		shiftPanel(shiftPanel, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, slot1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
	end, SFX_PANEL)

	if not slot0.isAchieveFirstInit then
		slot0.isAchieveFirstInit = true

		triggerButton(slot7)
	end

	return
end

function slot0.updateStageBarrier(slot0)
	setActive(slot0.panelBarrier, slot0.contextData.chapterVO:existOni())

	if slot0.contextData.chapterVO:existOni() then
		slot2 = slot0.panelBarrier:Find("btn_barrier")

		setText(slot2:Find("nums"), slot1.modelCount)
		onButton(slot0, slot2, function ()
			slot0:emit(LevelUIConst.IS_Frozen)

			if slot0.emit.isFrozen then
				return
			end

			if slot0.grid.quadState == ChapterConst.QuadStateStrategy then
				slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

				return
			end

			slot0:selectSquareBarrieredCell(1, function (slot0, slot1)
				if not slot0:existBarrier(slot0, slot1) and slot0.modelCount <= 0 then
					return
				end

				slot1:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBarrier,
					id = slot0.fleet.id,
					arg1 = slot0,
					arg2 = slot1
				})

				return
			end)

			return
		end, SFX_PANEL)
	end

	return
end

function slot0.updateBombPanel(slot0, slot1)
	setActive(slot0.bombPanel, slot0.contextData.chapterVO:isPlayingWithBombEnemy())

	if slot0.contextData.chapterVO:isPlayingWithBombEnemy() then
		setText(slot0.bombPanel:Find("tx_step"), slot2:getBombChapterInfo().action_times - math.floor(slot2.roundIndex / 2))

		slot4 = tonumber(getText(slot3))
		slot5 = slot2.modelCount

		LeanTween.cancel(go(slot0.bombPanel:Find("tx_score")))

		if slot1 and slot4 ~= slot5 then
			LeanTween.scale(go(slot3), Vector3(1.5, 1.5, 1), 0.2)
			LeanTween.value(go(slot3), slot4, slot5, (slot5 - slot4) * 0.1):setOnUpdate(System.Action_float(function (slot0)
				setText(slot0, math.floor(slot0))

				return
			end)):setOnComplete(System.Action(function ()
				setText(setText, )

				return
			end)):setEase(LeanTweenType.easeInOutSine):setDelay(0.2)
			LeanTween.scale(go(slot3), Vector3.one, 0.3):setDelay(1 + (slot5 - slot4) * 0.1)
		else
			slot3.localScale = Vector3.one

			setText(slot3, slot5)
		end
	end

	return
end

function slot0.updateFleetBuff(slot0)
	setActive(slot6, false)

	slot7 = UIItemList.New(slot5, slot6)

	slot7:make(function (slot0, slot1, slot2)
		setActive(findTF(slot2, "frame"), false)
		setActive(findTF(slot2, "Text"), false)

		if slot0 == UIItemList.EventUpdate then
			if slot1 + 1 <= #slot0 then
				GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot0[slot1 + 1]].icon, "", slot2)
				onButton(slot1, slot2, function ()
					slot0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = "",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = slot1.id,
							cfg = slot0
						}
					})

					return
				end, SFX_PANEL)

				return
			end

			GetImageSpriteFromAtlasAsync("commanderskillicon/" .. slot2[(slot1 + 1) - #slot0].getConfig(slot3, "icon"), "", slot2)
			setText(findTF(slot2, "Text"), "Lv." .. slot2[(slot1 + 1) - #slot0].getConfig(slot3, "lv"))
			setActive(findTF(slot2, "Text"), true)
			setActive(findTF(slot2, "frame"), true)
			onButton(slot1, slot2, function ()
				slot0:emit(LevelMediator2.ON_COMMANDER_SKILL, slot0)

				return
			end, SFX_PANEL)
		end
	end)
	slot7:align(#slot0.contextData.chapterVO.getFleetStgIds(slot1, slot2) + #_.map(_.values(slot0.contextData.chapterVO.fleet.getCommanders(slot2)), function (slot0)
		return slot0:getSkills()[1]
	end))

	if OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0 then
		slot0:updateAirDominance()
	end

	slot0:updateChapterBuff()

	return
end

function slot0.updateChapterBuff(slot0)
	SetActive(findTF(slot0.topStage, "chapter_buff"), slot0.contextData.chapterVO.hasMitigation(slot1))

	if slot0.contextData.chapterVO.hasMitigation(slot1) then
		setImageSprite(slot2, slot5, false)
		onButton(slot0, slot2, function ()
			if not slot0:hasMitigation() then
				return
			end

			slot1:HandleShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM,
				name = slot0:getChapterState(),
				sprite = slot2,
				content = i18n("level_risk_level_mitigation_rate", slot0:getRemainPassCount(), slot0:getMitigationRate())
			})

			return
		end, SFX_PANEL)
	end

	return
end

function slot0.updateAirDominance(slot0)
	slot1, slot2, slot3 = slot0.contextData.chapterVO:getAirDominanceValue()

	if not slot3 or slot3 ~= slot2 then
		slot0.contextData.chapterVO:setAirDominanceStatus(slot2)
		getProxy(ChapterProxy):updateChapter(slot0.contextData.chapterVO)
	end

	if slot3 then
		if slot2 == 0 then
			slot4 = 3
		else
			slot4 = slot2
		end

		if slot3 == 0 then
			slot5 = 3
		else
			slot5 = slot3
		end

		slot4 = slot4 - slot5
	end

	slot0.isChange = slot4
	slot5 = slot0
	slot4 = slot0.updateAirDominanceTitle
	slot6 = slot1
	slot7 = slot2

	if not slot0.isChange then
		slot8 = 0
	end

	slot4(slot5, slot6, slot7, slot8)

	return
end

function slot0.updateAirDominanceTitle(slot0, slot1, slot2, slot3)
	slot7 = findTF(slot0.airSupremacy, "value2")

	setText(slot4, i18n("level_scene_title_word_3"))
	setText(slot5, i18n("level_scene_title_word_4"))
	setText(slot6, math.floor(slot1))
	setActive(slot8, false)
	setActive(findTF(slot0.airSupremacy, "down"), false)

	if slot3 ~= 0 then
		if LeanTween.isTweening(go(slot7)) then
			LeanTween.cancel(go(slot7))
		end

		LeanTween.value(go(slot7), 1, 0, 0.5):setOnUpdate(System.Action_float(function (slot0)
			setTextAlpha(slot0, slot0)

			return
		end)):setOnComplete(System.Action(function ()
			setText(setText, ChapterConst.AirDominance[setText].name)
			setTextColor(setTextColor, ChapterConst.AirDominance[setTextColor].color)
			LeanTween.value(go(slot0), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
				setTextAlpha(slot0, slot0)

				return
			end))

			return
		end))
		slot8:GetComponent(typeof(DftAniEvent)):SetEndEvent(slot10)
		slot9:GetComponent(typeof(DftAniEvent)):SetEndEvent(slot10)

		slot11 = setActive
		slot12 = slot8

		if slot3 <= 0 then
			slot13 = false
		else
			slot13 = true
		end

		slot11(slot12, slot13)

		slot11 = setActive
		slot12 = slot9

		if slot3 >= 0 then
			slot13 = false
		else
			slot13 = true
		end

		slot11(slot12, slot13)
	else
		setText(slot7, ChapterConst.AirDominance[slot2].name)
		setTextColor(slot7, ChapterConst.AirDominance[slot2].color)
	end

	return
end

function slot0.updateShamProgress(slot0)
	setText(findTF(slot0.topStage, "msg_panel/sham_progress/value"), slot0.contextData.chapterVO.progress .. " / " .. ChapterConst.ShamEnemyLimit)

	return
end

function slot0.updateStageStrategy(slot0)
	slot5 = findTF(slot4, "click")
	slot8 = findTF(slot3, "collapse")

	setActive(slot7, false)

	slot10 = {}
	slot11 = {}

	_.each(slot9, function (slot0)
		if pg.strategy_data_template[slot0.id].type == ChapterConst.StgTypeForm then
			table.insert(slot0, slot0.id)
		else
			table.insert(slot1, slot0)
		end

		return
	end)

	if _.any(slot0.contextData.chapterVO.fleets, function (slot0)
		if slot0:getFleetType() ~= FleetType.Submarine then
			slot1 = false
		else
			slot1 = true
		end

		return slot1
	end) then
		table.insert(slot11, 2, {
			id = ChapterConst.StrategySubAutoAttack
		})
		table.insert(slot11, 2, {
			id = ChapterConst.StrategyHuntingRange
		})
	end

	table.insert(slot11, 1, {
		id = slot2:getFormationStg()
	})

	slot13 = UIItemList.New(slot6, slot7)

	slot13:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4, slot5 = nil

			if slot0[slot1 + 1].id == ChapterConst.StrategyHuntingRange then
				slot4 = 1

				if slot1.contextData.huntingRangeVisibility % 2 == 1 then
					slot5 = "range_invisible"
				else
					slot5 = "range_visible"
				end
			else
				if slot3.id == ChapterConst.StrategySubAutoAttack then
					slot4 = 1

					if slot2.subAutoAttack == 0 then
						slot5 = "sub_dont_auto_attack"
					else
						slot5 = "sub_auto_attack"
					end
				else
					slot4 = pg.strategy_data_template[slot3.id].type
					slot5 = pg.strategy_data_template[slot3.id].icon
				end
			end

			GetImageSpriteFromAtlasAsync("strategyicon/" .. slot5, "", slot2:Find("icon"))
			onButton(slot1, slot2, function ()
				if slot0.grid.quadState == ChapterConst.QuadStateStrategy and slot0.grid.quadClickProxy then
					slot0.grid.quadClickProxy()

					return
				end

				if slot1.id == ChapterConst.StrategyHuntingRange then
					slot0.grid:toggleHuntingRange()
					slot2.callback(slot3, slot4, slot5)
				else
					if slot1.id == ChapterConst.StrategySubAutoAttack then
						pg.TipsMgr.GetInstance():ShowTips(i18n("ai_change_" .. 1 - slot6.subAutoAttack + 1))
						pg.TipsMgr.GetInstance().ShowTips:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpSubState,
							arg1 = 1 - slot6.subAutoAttack
						})
					else
						if slot1.id == ChapterConst.StrategyExchange then
							if slot6:getNextValidIndex(slot6.findex) > 0 and slot1.count > 0 then
								slot0:HandleShowMsgBox({
									content = i18n("levelScene_who_to_exchange"),
									onYes = function ()
										slot0:emit(LevelMediator2.ON_OP, {
											type = ChapterConst.OpStrategy,
											id = slot1.id,
											arg1 = ChapterConst.StrategyExchange,
											arg2 = slot2.fleets[].id
										})

										return
									end
								})
							end

							return
						end

						if slot8 == ChapterConst.StgTypeForm then
							slot0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpStrategy,
								id = slot7:getNextStgUser(slot1.id),
								arg1 = slot9[table.indexof(slot9, slot1.id) % #slot9 + 1]
							})
						else
							slot0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, slot0)
						end
					end
				end
			end, SFX_PANEL)

			if slot4 == 1 then
				setText(slot2:Find("nums"), "")
				setActive(slot2:Find("mask"), false)

				slot7 = slot2:Find("selected")

				if setActive ~= slot3.id then
					slot8 = false
				else
					slot8 = true
				end

				slot6(slot7, slot8)
			else
				setText(slot2:Find("nums"), slot3.count)

				slot6 = setActive
				slot7 = slot2:Find("mask")

				if slot3.count ~= 0 then
					slot8 = false
				else
					slot8 = true
				end

				slot6(slot7, slot8)
				setActive(slot2:Find("selected"), false)
			end
		end

		return
	end)
	slot13:align(#slot11)
	onButton(slot0, slot5, function ()
		shiftPanel(shiftPanel, slot0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
	end, SFX_PANEL)
	onButton(slot0, slot8, function ()
		shiftPanel(shiftPanel, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, slot1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
	end, SFX_PANEL)

	return
end

function slot0.updateStageFleet(slot0)
	slot2 = findTF(slot0.leftStage, "fleet")

	setActive(slot3, false)
	setText(slot4, slot0.contextData.chapterVO.fleet.id)
	slot5(slot2:Find("main"), slot0.contextData.chapterVO.fleet:getShipsByTeam(TeamType.Main, true))
	slot5(slot2:Find("vanguard"), slot0.contextData.chapterVO.fleet:getShipsByTeam(TeamType.Vanguard, true))
	slot0.contextData.chapterVO.fleet:clearShipHpChange()

	return
end

function slot0.shiftStagePanel(slot0)
	shiftPanel(slot0.bottomStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	return
end

function slot0.clickGridCell(slot0, slot1)
	slot3 = slot0.contextData.chapterVO.getDataType(slot2)
	slot5 = slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column)

	if _.detect(slot0.contextData.chapterVO.fleets, function (slot0)
		if slot0:getFleetType() ~= FleetType.Normal or slot0.line.row ~= slot0.row or slot0.line.column ~= slot0.column then
			slot1 = false
		else
			slot1 = true
		end

		return slot1
	end) and slot3 == ChapterConst.TypeNone and slot6:isValid() and slot6.id ~= slot4.id then
		slot0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSwitch,
			id = slot6.id
		})

		return
	end

	if slot2:checkAnyInteractive() then
		triggerButton(slot0.funcBtn)
	else
		if slot2:getRound() == ChapterConst.RoundEnemy then
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpEnemyRound
			})
		else
			if slot6 and slot3 == ChapterConst.TypeSham then
				slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
			else
				if slot1.row ~= slot4.line.row or slot1.column ~= slot4.line.column then
					if slot2:getChapterCell(slot1.row, slot1.column).attachment == ChapterConst.AttachStory and slot8.data == ChapterConst.StoryObstacle and slot8.flag == 3 then
						pg.TipsMgr:GetInstance():ShowTips(i18n("map_event_stop_tip"))

						return
					else
						if not slot2:considerAsStayPoint(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then
							return
						else
							if slot2:existMoveLimit() and not _.any(slot2:calcWalkableCells(ChapterConst.SubjectPlayer, slot4.line.row, slot4.line.column, slot4:getSpeed()), function (slot0)
								if slot0.row ~= slot0.row or slot0.column ~= slot0.column then
									slot1 = false
								else
									slot1 = true
								end

								return slot1
							end) then
								pg.TipsMgr.GetInstance():ShowTips(i18n("destination_not_in_range"))

								return
							end
						end
					end

					if slot2:findPath(ChapterConst.SubjectPlayer, slot4.line, {
						row = slot1.row,
						column = slot1.column
					}) < PathFinding.PrioObstacle then
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpMove,
							id = slot4.id,
							arg1 = slot1.row,
							arg2 = slot1.column
						})
					else
						if slot9 < PathFinding.PrioForbidden then
							pg.TipsMgr:GetInstance():ShowTips(i18n("destination_can_not_reach"))
						else
							pg.TipsMgr:GetInstance():ShowTips(i18n("destination_can_not_reach"))
						end
					end
				end
			end
		end
	end

	return
end

function slot0.doSafeCheck(slot0)
	slot2 = slot0.contextData.chapterVO.getDataType(slot1)
	slot4 = slot0.contextData.chapterVO.fleet.line

	_.each(slot0.contextData.chapterVO.fleets, function (slot0)
		if slot0:getFleetType() == FleetType.Submarine and not slot0:isValid() then
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpRetreat,
				id = slot0.id
			})
		end

		return
	end)

	if slot0.contextData.chapterVO.getPlayType(slot1) == ChapterConst.TypeTransport then
		slot6 = slot1:findChapterCell(ChapterConst.AttachTransport_Target)

		if not _.detect(slot1.fleets, function (slot0)
			if slot0:getFleetType() ~= FleetType.Transport then
				slot1 = false
			else
				slot1 = true
			end

			return slot1
		end):isValid() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_lose"))
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpRetreat
			})

			return true
		else
			if slot5.line.row == slot6.row and slot5.line.column == slot6.column and not slot1:existEnemy(ChapterConst.SubjectPlayer, slot6.row, slot6.column) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_win"))
				slot0:emit(LevelMediator2.ON_OP, {
					win = true,
					type = ChapterConst.OpRetreat
				})

				return true
			end
		end
	end

	if slot1:existOni() then
		if slot1:checkOniState() == 1 then
			slot0:emit(LevelMediator2.ON_OP, {
				win = true,
				type = ChapterConst.OpRetreat
			})

			return true
		else
			if slot5 == 2 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})

				return true
			end
		end
	else
		if slot1:isPlayingWithBombEnemy() then
			if slot1:getBombChapterInfo().action_times * 2 <= slot1.roundIndex then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})

				return true
			end
		else
			if slot1:findChapterCell(ChapterConst.AttachBoss) and slot5.flag == 1 then
				slot0:emit(LevelMediator2.ON_OP, {
					win = true,
					type = ChapterConst.OpRetreat
				})

				slot6 = pg.TimeMgr.GetInstance()

				if slot1:getConfig("type") == Chapter.CustomFleet and not slot1:isActivity() and slot6:IsSameDay(slot1:getStartTime(), slot6:GetServerTime()) then
					getProxy(DailyLevelProxy):EliteCountPlus()
				end

				pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_win"))

				slot7 = getProxy(PlayerProxy):getData()

				if slot1.id == 103 and not slot7:GetCommonFlag(BATTLE_AUTO_ENABLED) then
					slot0:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("battle_autobot_unlock")
					})
					slot0:emit(LevelMediator2.NOTICE_AUTOBOT_ENABLED, {})
				end

				return true
			end
		end
	end

	if slot2 == ChapterConst.TypeSham and ChapterConst.ShamEnemyLimit <= slot1.progress then
		if slot1.shamResetCount < ChapterConst.ShamResetCountLimit then
			slot0:HandleShowMsgBox({
				modal = true,
				content = i18n("sham_count_reset"),
				onYes = function ()
					slot0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})

					return
				end,
				onNo = function ()
					slot0:switchToMap()

					return
				end
			})
		else
			slot0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("sham_count_limit"),
				onYes = function ()
					slot0:switchToMap()

					return
				end,
				onNo = function ()
					slot0:switchToMap()

					return
				end
			})
		end

		return true
	end

	if not slot1:inWartime() then
		slot0:emit(LevelMediator2.ON_TIME_UP)

		return true
	end

	if not slot3:isValid() then
		if slot2 == ChapterConst.TypeSham then
			if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
				slot7 = slot6:getContextByMediator(ShamPreCombatMediator)
			end

			if not slot7 then
				slot0:HandleShowMsgBox({
					modal = true,
					content = i18n("formation_reform_tip"),
					onYes = function ()
						slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)

						return
					end
				})
			end

			return true
		else
			if slot2 == ChapterConst.TypeNone then
				if slot1:getNextValidIndex() > 0 then
					slot0:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("formation_switch_tip", slot1.fleets[slot5].name),
						onYes = function ()
							slot0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpSwitch,
								id = slot1.id
							})

							return
						end,
						onNo = function ()
							slot0.emit(LevelMediator2.ON_OP, )

							return
						end
					})
				else
					slot0:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("formation_invalide"),
						onYes = function ()
							slot0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpRetreat
							})

							return
						end,
						onNo = function ()
							slot0.emit(LevelMediator2.ON_OP, )

							return
						end
					})
				end

				return true
			end
		end
	end

	slot5 = slot1:getConfig("act_id")

	if not slot0.contextData.map:isRemaster() and slot5 ~= 0 and (not getProxy(ActivityProxy):getActivityById(slot5) or slot7:isEnd()) then
		slot0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRetreat
		})

		return true
	end

	if slot1:getChapterCell(slot4.row, slot4.column).attachment == ChapterConst.AttachBox and slot6.flag ~= 1 then
		triggerButton(slot0.funcBtn)

		return true
	end

	return false
end

function slot0.tryAutoTrigger(slot0)
	if not slot0:doSafeCheck() then
		if slot0.contextData.chapterVO:checkAnyInteractive() then
			triggerButton(slot0.funcBtn)
		else
			if slot2:getRound() == ChapterConst.RoundEnemy then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				if slot2:existMoveLimit() and slot2:getRound() == ChapterConst.RoundPlayer then
					slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				end
			end
		end
	end

	return
end

function slot0.tryAutoAction(slot0)
	slot1 = slot0.contextData.chapterVO
	slot2 = nil

	coroutine.wrap(function ()
		slot1 = false

		for slot5, slot6 in pairs(slot0.cells) do
			if slot6.trait == ChapterConst.TraitLurk then
				slot0 = true

				break
			end
		end

		for slot5, slot6 in ipairs(slot0.champions) do
			if slot6.trait == ChapterConst.TraitLurk then
				slot0 = true

				if slot6.attachment == ChapterConst.AttachOni then
					slot1 = slot6

					break
				end
			end
		end

		slot2 = slot0:isPlayingWithBombEnemy()

		if (slot0:findChapterCell(ChapterConst.AttachBoss) and slot3.flag == 1) or slot0:existOni() then
			if slot0:getDefeatStory(slot0.defeatCount) and type(slot5) == "number" and not pg.StoryMgr.GetInstance():IsPlayed(slot5) then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = slot5
				})
				slot1:emit(LevelMediator2.ON_PERFORM_COMBAT, slot5)
			end

			if slot5 and type(slot5) == "string" then
				pg.StoryMgr.GetInstance():Play(slot5)
			end
		end

		if slot0 then
			slot1:emit(LevelUIConst.FROZEN)

			if slot1 or slot2 then
				slot4 = nil

				if slot1 then
					slot4 = "SpUnit"
				end

				if slot2 then
					slot4 = "SpBomb"
				end

				if slot4 then
					slot1:doPlayAnim(slot4, function (slot0)
						setActive(slot0, false)
						slot0()

						return
					end)
					coroutine.yield()
				end

				if slot0:getSpAppearStory() and #slot5 > 0 then
					pg.StoryMgr.GetInstance():Play(slot5, function ()
						if slot0:getSpAppearGuide() and #slot0 > 0 then
							pg.GuideMgr:GetInstance():play(slot0, nil, onNextTick(pg.GuideMgr.GetInstance().play))
						else
							onNextTick(onNextTick)
						end

						return
					end)
					coroutine.yield()
				end
			else
				slot1:emit(LevelUIConst.DO_TRACKING, slot2)
				coroutine.yield()
			end

			if not slot1.contextData.chapterVO then
				return
			end

			slot1:tryPlayChapterStory()

			if slot0:findChapterCell(ChapterConst.AttachBoss) and slot4.trait == ChapterConst.TraitLurk then
				slot1.grid:focusOnCell(slot4, slot2)
				coroutine.yield()
			end

			slot1:updateTrait(ChapterConst.TraitVirgin)
			slot1.grid:updateAttachments()
			slot1.grid:updateChampions()
			slot1:updateTrait(ChapterConst.TraitNone)
			slot1:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
			Timer.New(slot2, 0.5, 1):Start()
			coroutine.yield()
			slot1:emit(LevelUIConst.UN_FROZEN)
		end

		if not slot1:doSafeCheck() then
			slot1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end

		return
	end)()

	return
end

function slot0.tryPlayChapterStory(slot0)
	if slot0.contextData.chapterVO.getDataType(slot1) == ChapterConst.TypeNone then
		slot4 = slot1:getWaveCount()

		if slot1:getConfig("story_refresh") and slot3[slot4] and slot3[slot4] ~= "" then
			if slot4 == 1 and pg.map_event_list[slot1.id] and pg.map_event_list[slot1.id].help_open == 1 then
				pg.StoryMgr.GetInstance():Play(slot3[slot4], function ()
					if PlayerPrefs.GetInt("help_displayed_on_" .. slot0.id, 0) == 0 then
						triggerButton(GameObject.Find("OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"))
						PlayerPrefs.SetInt("help_displayed_on_" .. slot0.id, 1)
					end

					return
				end)
			else
				pg.StoryMgr.GetInstance():Play(slot3[slot4])
			end
		else
			if slot4 == 1 and pg.map_event_list[slot1.id] and pg.map_event_list[slot1.id].help_open == 1 and PlayerPrefs.GetInt("help_displayed_on_" .. slot1.id, 0) == 0 then
				triggerButton(GameObject.Find("OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"))
				PlayerPrefs.SetInt("help_displayed_on_" .. slot1.id, 1)
			end
		end

		if slot1:getConfig("story_refresh_boss") and slot5 ~= "" and slot1:bossRefreshed() then
			pg.StoryMgr.GetInstance():Play(slot5)
		end
	end

	if slot1:getPlayType() == ChapterConst.TypeMainSub then
		pg.StoryMgr:GetInstance():PlayGuide("NG003")
	else
		if slot1.id == 1160002 then
			pg.StoryMgr:GetInstance():PlayGuide("NG0011")
		end
	end

	return
end

function slot0.updateTrait(slot0, slot1)
	for slot6, slot7 in pairs(slot0.contextData.chapterVO.cells) do
		if slot7.trait ~= ChapterConst.TraitNone then
			slot7.trait = slot1
		end
	end

	for slot6, slot7 in ipairs(slot2.champions) do
		if slot7.trait ~= ChapterConst.TraitNone then
			slot7.trait = slot1
		end
	end

	return
end

function slot0.ShiftPanelToChapter(slot0)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.bottomStage, 0, -slot0.bottomStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, -slot0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, slot0.rightStage.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	return
end

function slot0.HandleShowMsgBox(slot0, slot1)
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)

	return
end

return slot0
