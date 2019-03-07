slot0 = class("LevelScene2", import("..base.BaseUI"))
slot1 = 0.5

if Application.isEditor then
	chapter_skip_battle = PlayerPrefs.GetInt("chapter_skip_battle") or 0

	function switch_chapter_skip_battle()
		chapter_skip_battle = 1 - chapter_skip_battle

		PlayerPrefs.SetInt("chapter_skip_battle", chapter_skip_battle)
		PlayerPrefs.Save()
		pg.TipsMgr:GetInstance():ShowTips((chapter_skip_battle == 1 and "已开启战斗跳略") or "已关闭战斗跳略")
	end
end

slot2 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

function slot0.getUIName(slot0)
	return "LevelUI2"
end

function slot0.preload(slot0, slot1)
	slot0.maps = getProxy(ChapterProxy):getMaps()

	if slot0.maps[slot0:selectMap(slot2)]:getConfig("bg") and #slot5 > 0 then
		GetSpriteFromAtlasAsync("levelmap/" .. slot4:getConfig("bg"), "", slot1)
	elseif slot4:getConfig("animtor") == 1 then
		PoolMgr.GetInstance():GetUI(slot4:getConfig("ani_name"), true, function (slot0)
			slot0:SetActive(false)

			slot0.tornadoTF = slot0
			slot0.aniName = slot0

			slot0()
		end)
	end
end

function slot0.init(slot0)
	slot0._guiderLoaded = true
	slot0.tweens = {}
	slot0.topPanel = slot0:findTF("top")
	slot0.topChapter = slot0:findTF("top_chapter", slot0.topPanel)
	slot0.leftChapter = slot0:findTF("left_chapter")
	slot0.leftCanvasGroup = slot0.leftChapter:GetComponent(typeof(CanvasGroup))
	slot0.rightChapter = slot0:findTF("right_chapter")
	slot0.rightCanvasGroup = slot0.rightChapter:GetComponent(typeof(CanvasGroup))
	slot0.topStage = slot0:findTF("top_stage", slot0.topPanel)
	slot0.bottomStage = slot0:findTF("bottom_stage", slot0.topPanel)
	slot0.leftStage = slot0:findTF("left_stage", slot0.topPanel)
	slot0.rightStage = slot0:findTF("right_stage", slot0.topPanel)
	slot0.chapterPanel = slot0:findTF("stage_info", slot0.topPanel)
	slot0.rescueSelect = slot0:findTF("rescue_select", slot0.topPanel)
	slot0.funcBtn = slot0:findTF("func_button", slot0.bottomStage)
	slot0.retreatBtn = slot0:findTF("retreat_button", slot0.bottomStage)
	slot0.resetBtn = slot0:findTF("reset_button", slot0.bottomStage)
	slot0.strategyInfo = slot0:findTF("strategy_info", slot0.topPanel)
	slot0.ambushInfo = slot0:findTF("ambush_info", slot0.topPanel)
	slot0.fleetSelect = slot0:findTF("fleet_select", slot0.topPanel)
	slot0.fleetEdit = slot0:findTF("fleet_select", slot0.topPanel)
	slot0.switchBtn = slot0:findTF("switch_button", slot0.bottomStage)
	slot0.repairWindow = slot0:findTF("repair_window", slot0.topPanel)
	slot0.shamShopBtn = slot0:findTF("btn_sham_shop", slot0.rightStage)
	slot0.damageText = slot0:findTF("damage", slot0.topPanel)
	slot0.mapHelpBtn = slot0:findTF("help_button", slot0.topPanel)
	slot0.avoidText = slot0:findTF("text_avoid", slot0.topPanel)
	slot0.moveDownText = slot0:findTF("text_move_down", slot0.topPanel)
	slot0.commanderTinkle = slot0:findTF("neko_tinkle", slot0.topPanel)
	slot0.remasterWindow = slot0:findTF("remaster_window", slot0.topPanel)
	slot0.panelBarrier = slot0:findTF("panel_barrier", slot0.rightStage)
	slot0.spResult = slot0:findTF("sp_result", slot0.topPanel)

	setActive(slot0.topChapter, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	setActive(slot0.topStage, true)
	setActive(slot0.leftStage, true)
	setActive(slot0.bottomStage, true)
	setActive(slot0.rightStage, true)
	setActive(slot0.chapterPanel, false)
	setActive(slot0.rescueSelect, false)
	setActive(slot0.strategyInfo, false)
	setActive(slot0.ambushInfo, false)
	setActive(slot0.fleetSelect, false)
	setActive(slot0.fleetEdit, false)
	setActive(slot0.repairWindow, false)
	setActive(slot0.damageText, false)
	setActive(slot0.mapHelpBtn, false)
	setActive(slot0.commanderTinkle, false)
	setActive(slot0.remasterWindow, false)
	setActive(slot0.panelBarrier, false)
	setActive(slot0.spResult, false)
	setAnchoredPosition(slot0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(slot0.rightChapter, {
		x = 0
	})
	setAnchoredPosition(slot0.topChapter, {
		y = 0
	})
	setAnchoredPosition(slot0.topStage, {
		y = slot0.topStage.rect.height
	})
	setAnchoredPosition(slot0.bottomStage, {
		y = -slot0.bottomStage.rect.height
	})
	setAnchoredPosition(slot0.rightStage, {
		x = slot0.rightStage.rect.width
	})
	setAnchoredPosition(slot0.leftStage, {
		x = -slot0.leftStage.rect.width
	})

	slot0.map = slot0:findTF("map")
	slot0.mapWidth = 1280
	slot0.mapHeight = 960
	slot0.UIFXList = slot0:findTF("map/UI_FX_list")

	for slot5 = 0, slot0.UIFXList:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
		slot1[slot5].sortingOrder = -1
	end

	slot0.float = slot0:findTF("float")
	slot0.clouds = slot0:findTF("clouds", slot0.float)
	slot0.chapters = slot0:findTF("levels", slot0.float)
	slot0.chapterTpl = slot0:findTF("level_tpl", slot0.float)
	slot0.escortChapters = slot0:findTF("escort_levels", slot0.float)
	slot0.escortChapterTpl = slot0:findTF("escort_level_tpl", slot0.float)
	slot0.resources = slot0:findTF("resources")
	slot0.shipTpl = slot0:findTF("ship_tpl", slot0.resources)
	slot0.subTpl = slot0:findTF("sub_tpl", slot0.resources)
	slot0.transportTpl = slot0:findTF("transport_tpl", slot0.resources)
	slot0.transportTargetTpl = slot0:findTF("transport_target_tpl", slot0.resources)
	slot0.enemyTpl = slot0:findTF("enemy_tpl", slot0.resources)
	slot0.deadTpl = slot0:findTF("dead_tpl", slot0.resources)
	slot0.boxTpl = slot0:findTF("box_tpl", slot0.resources)
	slot0.supplyTpl = slot0:findTF("supply_tpl", slot0.resources)
	slot0.rivalTpl = slot0:findTF("rival_tpl", slot0.resources)
	slot0.championTpl = slot0:findTF("champion_tpl", slot0.resources)
	slot0.oniTpl = slot0:findTF("oni_tpl", slot0.resources)
	slot0.spineTpl = slot0:findTF("spine_tpl", slot0.resources)
	slot0.oniTargetTpl = slot0:findTF("oni_target_tpl", slot0.resources)
	slot0.bombEnemyTpl = slot0:findTF("bomb_enemy_tpl", slot0.resources)
	slot0.arrowTarget = slot0:findTF("arrow_target", slot0.resources)

	setActive(slot0.arrowTarget, false)

	slot0.btnSpecial = slot0:findTF("right_chapter/event_btns/event_container/btn_special")
	slot0.dailyBtn = slot0:findTF("right_chapter/event_btns/event_container/daily_button")
	slot0.activityBtn = slot0:findTF("right_chapter/event_btns/activity_btn")
	slot0.shamBtn = slot0:findTF("right_chapter/event_btns/event_container/sham_button")
	slot0.ptTotal = slot0:findTF("right_chapter/event_btns/pt_text")
	slot0.ticketTxt = slot0:findTF("right_chapter/event_btns/tickets/Text")
	slot0.actExchangeShopBtn = slot0:findTF("right_chapter/event_btns/btn_exchange")
	slot0.mirrorBtn = slot0:findTF("right_chapter/event_btns/event_container/btn_mirror")
	slot0.countDown = slot0:findTF("right_chapter/event_btns/count_down")
	slot0.eventContainer = slot0:findTF("right_chapter/event_btns/event_container")
	slot0.actExtraRank = slot0:findTF("right_chapter/event_btns/act_extra_rank")
	slot0.btnPrev = slot0:findTF("left_chapter/btn_prev")
	slot0.militaryExerciseBtn = slot0:findTF("right_chapter/event_btns/event_container/btn_pvp")
	slot0.escortBtn = slot0:findTF("right_chapter/event_btns/event_container/btn_escort")
	slot0.signalBtn = slot0:findTF("right_chapter/btn_signal")
	slot0.scenario = slot0:findTF("left_chapter/btn_scenario")
	slot0.eliteBtn = slot0:findTF("left_chapter/buttons/btn_elite")
	slot0.normalBtn = slot0:findTF("left_chapter/buttons/btn_normal")
	slot0.remasterBtn = slot0:findTF("left_chapter/buttons/btn_remaster")
	slot0.btnNext = slot0:findTF("right_chapter/btn_next")
	slot0.chapterName = slot0:findTF("left_chapter/title_chapter/name")
	slot0.chapterNoTitle = slot0:findTF("left_chapter/title_chapter/chapter")
	slot0.chapterNoTitleSp = slot0:findTF("left_chapter/title_chapter/chapter/name_sp")
	slot0.chapterNo = slot0:findTF("left_chapter/title_chapter/chapter/number")
	slot0.chapterNoEn = slot0:findTF("left_chapter/title_chapter/number")
	slot0.escortBar = slot0:findTF("left_chapter/escort_bar")
	slot0.eliteQuota = slot0:findTF("left_chapter/elite_quota")
	slot0.actNormalBtn = slot0:findTF("left_chapter/buttons/btn_act_normal/bg")

	setActive(slot0.actNormalBtn.parent, false)

	slot0.actEliteBtn = slot0:findTF("left_chapter/buttons/btn_act_elite/bg")

	setActive(slot0.actEliteBtn.parent, false)

	slot0.actExtraBtn = slot0:findTF("left_chapter/buttons/btn_act_extra/bg")
	slot0.actExtraBtnAnim = slot0.actExtraBtn:GetComponent(typeof(Animation))

	setActive(slot0.actExtraBtn.parent, false)
	setActive(slot0.chapters, true)
	setActive(slot0.chapterTpl, false)
	setActive(slot0.escortChapters, true)
	setActive(slot0.escortChapterTpl, false)
	setActive(slot0.clouds, true)
	setActive(slot0.resources, false)
	setActive(slot0.btnSpecial, true)
	setActive(slot0.scenario, false)
	setActive(slot0.eliteQuota, false)
	setActive(slot0.signalBtn, false)

	slot0.resChapter = slot0:findTF("resources", slot0.topChapter)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0.resChapter, false)

	slot0.resStage = slot0:findTF("resources", slot0.topStage)
	slot0.resPanel1 = PlayerResource.New()

	slot0.resPanel1:setParent(slot0.resStage, false)

	slot0:findTF("event/arrow/arr", slot0.rightStage).localScale = Vector3(1, 1, 1)
	slot0.levelCamIndices = 1
	slot0.levelCam = GameObject.Find("LevelCamera"):GetComponent(typeof(Camera))
	slot0.levelGrid = slot0:findTF("Canvas/UIMain/LevelGrid", slot0.levelCam)

	setActive(slot0.levelGrid, false)

	slot0.uiCam = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0.frozenCount = 0
	slot0.canvasGroup = slot0.topPanel:GetComponent("CanvasGroup")
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts

	slot0:updateClouds()

	slot0.helpPage = slot0:findTF("help_page", slot0.topPanel)
	slot0.helpImage = slot0:findTF("icon", slot0.helpPage)
	slot0.helpBtn = slot0:findTF("help_button", slot0.bottomStage)

	setActive(slot0.helpPage, false)

	slot0.bossActivityBossTF = slot0:findTF("top/act_boss_battle")
	slot0.contextData.huntingRangeVisibility = 2
	slot0.mapItemTimer = {}
	slot0.commanderFormationPanel = CmdLevelFormationPanel.New(slot0:findTF("top/commander_panel"))

	slot0.commanderFormationPanel:attach(slot0)

	slot0.bombPanel = slot0.rightStage:Find("bomb_panel")
end

function slot0.updateBattleActivitys(slot0, slot1)
	slot0.battleActivitys = slot1
end

function slot0.updateBattleActivity(slot0, slot1)
	slot2 = Map.New({
		id = slot1
	})
	slot0.battleActivity = slot0.battleActivitys[1]
	slot3 = slot2:getConfig("on_activity")

	if slot2:getConfig("on_activity") ~= 0 then
		for slot7, slot8 in ipairs(slot0.battleActivitys) do
			if slot8.id == slot3 then
				slot0.battleActivity = slot8

				break
			end
		end
	end
end

function slot0.updatePtActivity(slot0, slot1)
	slot0.ptActivity = slot1

	slot0:updateActivityRes()
end

function slot0.updateActivityRes(slot0)
	slot2 = findTF(slot0.ptTotal, "icon/Image")

	if findTF(slot0.ptTotal, "Text") and slot2 and slot0.ptActivity then
		setText(slot1, "x" .. slot0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(pg.item_data_statistics[id2ItemId(tonumber(slot0.ptActivity:getConfig("config_id")))].icon, "", slot2, true)
	end
end

function slot0.updateBossBattleAct(slot0, slot1)
	slot0.bossBattleActivity = slot1

	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:update(slot0.bossBattleActivity)
	end
end

function slot0.didEnter(slot0)
	slot0.openedCommanerSystem = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

	onButton(slot0, slot0:findTF("back_button", slot0.topStage), function ()
		if slot0.contextData.chapterVO and slot0:getDataType() == ChapterConst.TypeGuild then
			slot0:emit(slot1.ON_BACK)

			return
		end

		slot0:switchToMap()
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("back_button", slot0.topChapter), function ()
		if slot0.contextData.map and (slot0:isActivity() or slot0:isEscort()) then
			slot0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnSpecial, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		if slot0.contextData.chapterVO then
			if slot0:getDataType() == ChapterConst.TypeSham then
				pg.MsgboxMgr.GetInstance():ShowHelpWindow({
					helps = i18n("sham_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeGuild then
				pg.MsgboxMgr.GetInstance():ShowHelpWindow({
					helps = i18n("guild_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeNone then
				if slot0:existCoastalGunNoMatterLiveOrDead() then
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = i18n("levelScene_coastalgun_help_tip")
					})
				elseif slot0:existOni() then
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = i18n("levelScene_sphunt_help_tip")
					})
				elseif slot0:isPlayingWithBombEnemy() then
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
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

					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = slot2
					})
				else
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = pg.gametip.help_level_ui.tip
					})
				end
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.scenario, function ()
		for slot4, slot5 in pairs(slot0.maps) do
			if slot5:isUnlock() and slot5:getMapType() == Map.SCENARIO then
				slot0 = slot5.id
			end
		end

		slot0:setMap(slot0)
	end)
	onButton(slot0, slot0.dailyBtn, function ()
		if slot0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		DailyLevelProxy:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(slot0, slot0.militaryExerciseBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(slot0, slot0.shamBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

		if slot0 then
			slot0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.retreatBtn, function ()
		slot1 = "levelScene_whether_to_retreat"

		if slot0.contextData.chapterVO:existOni() then
			slot1 = "levelScene_oni_retreat"
		elseif slot0:isPlayingWithBombEnemy() then
			slot1 = "levelScene_bomb_retreat"
		elseif slot0:getPlayType() == ChapterConst.TypeTransport then
			slot1 = "levelScene_escort_retreat"
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
				slot0:doAmbushWarning(slot0)
				coroutine.yield()
				coroutine.yield:displayAmbushInfo(coroutine.yield)
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
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
	onButton(slot0, slot0.resetBtn, function ()
		if slot0.contextData.chapterVO:getDataType() == ChapterConst.TypeSham then
			if ChapterConst.ShamResetCountLimit <= slot0.contextData.chapterVO.shamResetCount then
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_reset_err_limit"))

				return
			end

			if slot0.contextData.chapterVO.active then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
	onButton(slot0, slot0.normalBtn:Find("bg"), function ()
		if slot0:isfrozen() then
			return
		end

		slot0:setMap(slot0.contextData.map:getBindMap())
	end, SFX_PANEL)
	onButton(slot0, slot0.eliteBtn:Find("bg"), function ()
		if slot0:isfrozen() then
			return
		end

		if slot0.contextData.map:getBindMap() == 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unusable"))

			if getProxy(ChapterProxy):getUseableMaxEliteMap() then
				slot0:setMap(slot1.configId)
				pg.TipsMgr:GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif slot0.contextData.map:isEliteEnabled() then
			slot0:setMap(slot0.contextData.map:getBindMap())
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(slot0, slot0.remasterBtn:Find("bg"), function ()
		if slot0:isfrozen() then
			return
		end

		slot0:displayRemasterPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.shamShopBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_SHAM_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0.escortBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "Escort")

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		if not slot0.contextData.map:isEscort() then
			if #getProxy(ChapterProxy).escortMaps == 0 or _.any(slot4, function (slot0)
				return slot0:shouldFetch()
			end) then
				slot0:emit(LevelMediator2.ON_FETCH_ESCORT)
			else
				slot0:setMap(slot4[1].id)
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.signalBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:displaySignalPanel()
	end, SFX_PANEL)
	setActive(slot0:findTF("lock", slot0.btnSpecial), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "EventMediator"))

	slot0:findTF("pic", slot0.btnSpecial):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "EventMediator") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)
	slot0:findTF("pic_activity", slot0.btnSpecial):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "EventMediator") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)

	setActive(slot0:findTF("lock", slot0.dailyBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "DailyLevelMediator"))

	slot0:findTF("pic", slot0.dailyBtn):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "DailyLevelMediator") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)

	setActive(slot0:findTF("lock", slot0.militaryExerciseBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "MilitaryExerciseMediator"))

	slot0:findTF("pic", slot0.militaryExerciseBtn):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "MilitaryExerciseMediator") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)
	slot0:findTF("text", slot0.militaryExerciseBtn):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "MilitaryExerciseMediator") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)

	if OPEN_ESCORT then
		setActive(slot0:findTF("lock", slot0.escortBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "Escort"))

		slot0.escortBtn:GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "Escort") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)
		slot0:findTF("pic", slot0.escortBtn):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "Escort") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)
		slot0:findTF("text", slot0.escortBtn):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "Escort") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)

		setActive(slot0.escortBtn, true)
	else
		setActive(slot0.escortBtn, false)
	end

	setActive(slot0.shamBtn, not ChapterConst.ActivateMirror and getProxy(ChapterProxy).getShamChapter(slot7):isOpen())

	if slot9 then
		setText(slot0:findTF("day", slot0.shamBtn), slot8:getRestDays())
	end

	setActive(slot0:findTF("lock", slot0.shamBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator"))

	slot0:findTF("pic", slot0.shamBtn):GetComponent(typeof(Image)).color = (not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "ShamPreCombatMediator") and Color(0.3, 0.3, 0.3, 1)) or Color(1, 1, 1, 1)

	slot0:emit(LevelMediator2.ON_EVENT_LIST_UPDATE)

	if slot0.contextData.editEliteChapter then
		slot0:displayFleetEdit(slot0.contextData.editEliteChapter)

		slot0.contextData.editEliteChapter = nil
	end

	for slot17, slot18 in ipairs(getProxy(ContextProxy).getContextByMediator(slot12, LevelMediator2).children) do
		function slot18.onRemoved()
			slot0:onSubLayerClose()
		end
	end

	if #slot13.children > 0 then
		slot0:onSubLayerOpen()
	else
		slot0:onSubLayerClose()
	end

	if not slot0.contextData.isSwitchToChapter then
		slot0:tryPlaySubGuide()
	end

	slot0:triggerCommanderPanel()
end

function slot0.tryPlaySubGuide(slot0)
	slot1 = false

	if slot0.subRefreshCount > 0 and slot0.player.level >= 20 then
		slot3 = getProxy(ChapterProxy).getChapterById(slot2, 304)

		if not pg.GuideMgr:GetInstance():isPlayed("NG001") and slot3:isClear() then
			if slot2:getActiveChapter() then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end

			if slot0.contextData.map:isActivity() then
				slot0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)
			end

			slot1 = true

			pg.GuideMgr:GetInstance():play("NG001", (slot0.contextData.map.id == 3 and {}) or {
				1
			})
		end
	end

	if not slot1 and not pg.GuideMgr:GetInstance():isPlayed("NG002") then
		slot3 = getProxy(FleetProxy):getFleetById(11)

		if getProxy(TaskProxy):getTaskById(10302) and slot2:isFinish() and not slot2:isReceive() and slot3:isEmpty() then
			if getProxy(ChapterProxy):getActiveChapter() then
				slot0:switchToMap()
			end

			pg.GuideMgr:GetInstance():play("NG002", (_.any(getProxy(BayProxy):getShips(), function (slot0)
				return slot0 and slot0.configId == 308031
			end) and {
				2
			}) or {
				2,
				1
			})

			slot1 = true
		end
	end
end

function slot0.onBackPressed(slot0)
	if slot0:isfrozen() or isActive(slot0.ambushInfo) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] and slot0[slot5]._go and isActive(slot0[slot5]._go) then
			slot0[slot6](slot0)

			return
		end
	end

	if isActive(slot0.fleetEdit) then
		slot0:hideFleetEdit()

		return
	end

	if isActive(slot0.helpPage) then
		setActive(slot0.helpPage, false)

		return
	end

	if slot0.contextData.chapterVO and slot2:getDataType() ~= ChapterConst.TypeGuild then
		slot0:switchToMap()

		return
	end

	triggerButton(slot0:findTF("back_button", slot0.topChapter))
end

function slot0.updateEventActivityStyle(slot0, slot1)
	setActive(slot0.btnSpecial:Find("pic"), slot1 == nil)
	setActive(slot0.btnSpecial:Find("pic_activity"), slot1 ~= nil)
end

function slot0.selectMap(slot0, slot1)
	if not slot0.contextData.mapIdx then
		if Map.lastMap and slot1[Map.lastMap] then
			slot2 = Map.lastMap
		else
			for slot6, slot7 in pairs(slot1) do
				if slot7:isUnlock() and slot7:getMapType() == Map.SCENARIO then
					slot2 = slot7.id
				end
			end
		end
	end

	return slot2
end

function slot0.setMaps(slot0, slot1)
	slot0.maps = slot1

	slot0:initMapBtn(slot0.btnPrev, -1)
	slot0:initMapBtn(slot0.btnNext, 1)
	slot0:setMap(slot0:selectMap(slot1))
end

function slot0.setShipGroups(slot0, slot1)
	slot0.shipGroups = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)
	slot0.resPanel1:setResources(slot1)

	slot0.player = slot1
end

function slot0.setEliteQuota(slot0, slot1, slot2)
	slot3 = slot2 - slot1
	slot5 = slot0:findTF("bg/Text", slot0.eliteQuota):GetComponent(typeof(Text))

	if slot1 == slot2 then
		slot5.color = Color.red
	else
		slot5.color = Color.New(0.47, 0.89, 0.27)
	end

	slot5.text = slot3 .. "/" .. slot2
end

function slot0.updateSubInfo(slot0, slot1, slot2)
	slot0.subRefreshCount = slot1
	slot0.subProgress = slot2

	setText(slot0.signalBtn:Find("nums"), slot0.subRefreshCount)
end

function slot0.updateLastFleet(slot0, slot1)
	slot0.lastFleetIndex = slot1
end

function slot0.updateEvent(slot0, slot1)
	setActive(slot0:findTF("tip", slot0.btnSpecial), slot1:hasFinishState())
end

function slot0.updateFleet(slot0, slot1)
	slot0.fleets = slot1
end

function slot0.updateChapterVO(slot0, slot1, slot2)
	if slot1:getDataType() == ChapterConst.TypeNone then
		slot0.maps[slot1:getConfig("map")].updateChapter(slot5, slot1)
		slot0.maps[slot1.getConfig("map")]:updateChapters(slot0.maps[slot1.getConfig("map") - 1])

		if not slot0.contextData.chapterVO then
			if slot0.contextData.mapIdx == slot4 then
				slot0:updateMapItems()
			end

			if slot0.signalPanel and isActive(slot0.signalPanel._tf) then
				slot0.signalPanel:flush()
			end
		end
	end

	if slot0.contextData.chapterVO and slot0.contextData.chapterVO:getDataType() == slot3 and slot0.contextData.chapterVO.id == slot1.id and slot1.active then
		slot0:setChapter(slot1)

		slot4 = false

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyFleet) > 0 then
			slot0:updateStageFleet()
			slot0:updateAmbushRate(slot1.fleet.line, true)
			slot0:updateFleetBuff()

			if slot0.grid then
				slot0.grid:clearFleets()
				slot0.grid:initFleets()

				slot4 = true
			end
		end

		if (slot2 < 0 or bit.band(slot2, ChapterConst.DirtyChampion) > 0) and slot0.grid then
			slot0.grid:updateFleets()
			slot0.grid:clearChampions()
			slot0.grid:initChampions()

			slot4 = true
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAchieve) > 0 then
			slot0:updateStageAchieve()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAttachment) > 0 then
			slot0:updateAmbushRate(slot1.fleet.line, true)

			if slot3 == ChapterConst.TypeSham then
				slot0:updateShamProgress()
			end

			if slot0.grid then
				if slot2 >= 0 and bit.band(slot2, ChapterConst.DirtyFleet) <= 0 then
					slot0.grid:updateFleet(slot1.findex)
				end

				slot0.grid:updateAttachments()

				if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
					slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					slot4 = true
				end
			end
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyStrategy) > 0 then
			slot0:updateStageStrategy()
			slot0:updateFleetBuff()
			slot0:updateStageBarrier()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
			slot0:tryAutoAction()
		elseif slot4 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end
	end
end

function slot0.updateClouds(slot0)
	slot0.cloudRTFs = {}
	slot0.cloudRects = {}

	for slot4 = 1, 6, 1 do
		table.insert(slot0.cloudRTFs, slot6)
		table.insert(slot0.cloudRects, rtf(slot5).rect.width)
	end

	slot0:initCloudsPos()

	slot0.cloudTimer = FrameTimer.New(function ()
		for slot3, slot4 in ipairs(slot0.cloudRTFs) do
			slot4.anchoredPosition.x = (slot0.initPositions[slot3] or Vector2(0, 0).x + (30 - slot0.initPositions[slot3] or Vector2(0, 0).y / 20) * Time.time) % (slot0.mapWidth + slot0.cloudRects[slot3]) - slot0.cloudRects[slot3]
			slot4.anchoredPosition = slot4.anchoredPosition
		end
	end, 1, -1)

	slot0.cloudTimer:Start()
	slot0.cloudTimer.func()
end

function slot0.updateCouldAnimator(slot0)
	if slot0.contextData.map:getConfig("animtor") == 1 then
		slot1 = slot0.contextData.map:getConfig("ani_name")

		if slot0.tornadoTF and slot0.aniName ~= slot1 then
			slot0:destroyCloudAnimator()
		end

		if IsNil(slot0.tornadoTF) then
			if slot0.animtorLoading then
				return
			end

			slot0.animtorLoading = slot1

			PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
				if not slot0.contextData then
					return
				end

				if slot0.animtorLoading ~= slot0.contextData.map:getConfig("ani_name") then
					slot0.animtorLoading = nil

					return
				end

				slot0.animtorLoading = nil

				slot0:SetActive(slot0.contextData.map:getConfig("animtor") == 1 and not slot0.isSubLayerOpen)

				slot0.tornadoTF = slot0

				setParent(slot0, slot0:findTF("map"))
				tf(slot0.tornadoTF):SetSiblingIndex(1)

				slot0.aniName = slot1
			end)
		else
			setParent(slot0.tornadoTF, slot0:findTF("map"))
			tf(slot0.tornadoTF):SetSiblingIndex(1)
			setActive(slot0.tornadoTF, true)
		end

		return
	end

	if not IsNil(slot0.tornadoTF) then
		setActive(slot0.tornadoTF, false)
	end
end

function slot0.updateActivityBtns(slot0)
	slot2 = slot0.contextData.map:isRemaster()
	slot3 = slot0.contextData.map:getConfig("type")

	setActive(slot0.activityBtn, not slot0.contextData.map:isActivity() and slot0.battleActivity and not slot0.battleActivity:isEnd())

	if slot0.contextData.map:isEscort() then
		setActive(slot0.activityBtn, false)
	end

	setActive(slot0.signalBtn, getProxy(ChapterProxy).getChapterById(slot5, 304) and slot6:isClear() and (slot3 == Map.SCENARIO or slot3 == Map.ELITE))

	slot7 = false
	slot9 = nil

	if ActivityLevelConst.hasExtraMap(slot0.maps) then
		slot7 = _.any(slot0.battleActivitys or {}, function (slot0)
			if slot0.id == slot0:getConfig("on_activity") then
				slot1 = slot0:getConfig("type")
			end

			return slot0.id == slot0:getConfig("on_activity")
		end)
	end

	slot13 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_EASY)
	slot14 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_HARD)

	setActive(slot0.actExtraBtn.parent, slot7 and slot1 and not (slot7 and slot3 == Map.ACT_EXTRA) and not slot2)
	setActive(slot0.actEliteBtn.parent, slot0.contextData.map:existHardMap() and ((slot3 == Map.ACTIVITY_EASY and (slot4 or slot2)) or (slot1 and slot7 and slot3 == Map.ACT_EXTRA)))
	setActive(slot0.actNormalBtn.parent, (slot3 == Map.ACTIVITY_HARD and (slot4 or slot2)) or (slot1 and slot7 and slot3 == Map.ACT_EXTRA))
	setActive(slot0.actExtraRank, slot1 and slot7 and slot3 == Map.ACT_EXTRA)
	setActive(slot0.remasterBtn, (OPEN_REMASTER and slot3 == Map.SCENARIO) or slot3 == Map.ELITE or slot2)
	setActive(slot0.ticketTxt.parent, slot2)

	if slot2 then
		setText(slot0.ticketTxt, slot5.remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	end

	if slot1 then
		setActive(slot0.eliteQuota, false)
		slot0:updateActivityRes()
	end

	slot15 = false

	if slot0.bossBattleActivity and not slot0.bossBattleActivity:isEnd() and table.contains(slot0.bossBattleActivity:getConfig("config_data")[3], slot0.contextData.map.id) then
		if not slot0.activityBossBattlePanel then
			slot0.activityBossBattlePanel = BossBattleActivityPanel.New(slot0.bossActivityBossTF)
		end

		slot0.activityBossBattlePanel:update(slot0.bossBattleActivity)

		slot15 = true
	end

	setActive(slot0.bossActivityBossTF, slot15)

	if ActivityConst.BATTLE_MAP_TYPE == Map.SINGLE_MAP then
		setActive(slot0.ptTotal, false)
		setActive(slot0.actExchangeShopBtn, false)
		setActive(slot0.mirrorBtn, false)
		setActive(slot0.eventContainer, true)
	elseif ActivityConst.BATTLE_MAP_TYPE == Map.MUTIL_MAP then
		setActive(slot0.ptTotal, not ActivityConst.HIDE_PT_PANELS and slot0.ptActivity and not slot0.ptActivity:isEnd() and slot1 and not slot2)
		setActive(slot0.actExchangeShopBtn, slot1 and not ActivityConst.HIDE_PT_PANELS and slot4)
		setActive(slot0.mirrorBtn, false)
		setActive(slot0.eventContainer, not slot1)
	end

	slot16 = (slot11 and slot14) or (not slot11 and slot13)

	if slot7 and slot1 and not slot10 and slot16 then
		slot0.actExtraBtnAnim:Play("btn_act_elite_ani")
	else
		slot0.actExtraBtnAnim:Stop("btn_act_elite_ani")
	end

	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and not slot10 then
		Map.lastMapForActivity = slot0.contextData.mapIdx
	end
end

function slot0.updateBossBattleMsg(slot0, slot1)
	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:updateMsg(slot1)
	end
end

function slot0.updateCountDown(slot0)
	if slot0.newChapterCDTimer then
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
	end

	slot1 = 0

	if slot0.contextData.map:isRemaster() then
		if slot0.contextData.map.remasterId == getProxy(ChapterProxy):getActiveRemaster() then
			slot1 = math.max(slot2.remasterTime - pg.TimeMgr.GetInstance():GetServerTime(), 0)
		end

		setActive(slot0.countDown, true)
		setText(slot0.countDown:Find("title"), i18n((slot1 > 0 and "levelScene_chapter_open_count_down") or "levelScene_chapter_not_open"))
	elseif slot0.contextData.map:isActivity() then
		slot2 = getProxy(ActivityProxy)
		slot3 = pg.TimeMgr.GetInstance()

		_.each(pg.chapter_template.all, function (slot0)
			if (pg.expedition_data_by_map[pg.chapter_template[slot0].map].type == Map.ACTIVITY_HARD or slot2.type == Map.ACTIVITY_HARD) and pg.activity_template[slot1.act_id] and slot3.time and #slot3.time == 3 and slot0:parseTimeFromConfig(slot3.time[2]) - slot0:GetServerTime() > 0 then
				slot1 = (slot1 == 0 and slot4) or math.min(slot1, slot4)

				return
			end
		end)
		setActive(slot0.countDown, slot1 > 0)
		setText(slot0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(slot0.countDown, false)
	end

	if slot1 > 0 then
		setText(slot0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(slot1))

		slot0.newChapterCDTimer = Timer.New(function ()
			if slot0 - 1 <= 0 then
				slot1:updateCountDown()

				if not slot1.contextData.chapterVO then
					slot1 = getProxy(ChapterProxy).getMaps(slot0)

					slot1:setMaps(slot1)
					slot1:setMap(slot1.contextData.mapIdx)
				end
			else
				setText(slot1.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(setText))
			end
		end, 1, -1)

		slot0.newChapterCDTimer:Start()
	else
		setText(slot0.countDown:Find("time"), "")
	end
end

function slot0.updateEscortInfo(slot0)
	setActive(slot0.escortBar, slot0.contextData.map.isEscort(slot1))
	setActive(slot0.mapHelpBtn, slot0.contextData.map:isEscort())

	if slot0.contextData.map:isEscort() then
		slot2 = getProxy(ChapterProxy)

		setText(slot0.escortBar:Find("times/text"), slot2:getMaxEscortChallengeTimes() - slot2.escortChallengeTimes .. "/" .. slot3)
		onButton(slot0, slot0.mapHelpBtn, function ()
			pg.MsgboxMgr.GetInstance():ShowHelpWindow({
				helps = i18n("levelScene_escort_help_tip")
			})
		end, SFX_PANEL)
	end
end

function slot0.registerActBtn(slot0)
	if slot0.isRegisterBtn then
		return
	end

	slot0.isRegisterBtn = true

	onButton(slot0, slot0.actExtraRank, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0.actExtraBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_ENTER_EXTRA_CHAPTER)
	end, SFX_PANEL)
	onButton(slot0, slot0.activityBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.actExchangeShopBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.mirrorBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

		if slot0 then
			slot0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		end
	end, SFX_UI_CLICK)

	function slot1()
		for slot4, slot5 in pairs(slot0.maps) do
			if slot5:getActiveChapter() then
				slot0 = slot6:getConfig("name")

				break
			end
		end

		if slot0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("activity_level_inwarime_tip", slot0)
			})

			return true
		end

		return false
	end

	function slot2(slot0, slot1)
		if ActivityLevelConst.getMapsByType(slot0.maps, slot0, slot1)[1] and slot0.maps[slot3.id - 1] and not slot4:isClearForActivity() then
			return false
		end

		return true
	end

	onButton(slot0, slot0.actEliteBtn, function ()
		if slot0:isfrozen() then
			return
		end

		if slot0.contextData.map:isRemaster() then
			if slot0.maps[slot0:getBindMap() - 1] and not slot2:isClearForActivity() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

				return
			end

			slot0:setMap(slot0:getBindMap())

			return
		end

		if slot1() then
			return
		end

		if not slot2(Map.ACTIVITY_HARD, slot0.battleActivity.id) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
		end

		slot0:emit(LevelMediator2.ON_SWITCH_ACT_MAP, slot0.battleActivity.id, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(slot0, slot0.actNormalBtn, function ()
		if slot0:isfrozen() then
			return
		end

		if slot0.contextData.map:isRemaster() then
			slot0:setMap(slot0:getBindMap())

			return
		end

		if slot1() then
			return
		end

		if not slot2(Map.ACTIVITY_EASY, slot0.battleActivity.id) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
		end

		slot0:emit(LevelMediator2.ON_SWITCH_ACT_MAP, slot0.battleActivity.id, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
end

function slot0.destroyCloudAnimator(slot0)
	if not IsNil(slot0.tornadoTF) then
		PoolMgr.GetInstance():ReturnUI(slot0.aniName, slot0.tornadoTF)

		slot0.tornadoTF = nil
	end
end

function slot0.initCloudsPos(slot0, slot1)
	slot0.initPositions = {}
	slot3 = pg.expedition_data_by_map[slot1 or 1].clouds_pos

	for slot7, slot8 in ipairs(slot0.cloudRTFs) do
		if slot3[slot7] then
			slot8.anchoredPosition = Vector2(slot9[1], slot9[2])

			table.insert(slot0.initPositions, slot8.anchoredPosition)
		else
			setActive(slot8, false)
		end
	end
end

function slot0.initMapBtn(slot0, slot1, slot2)
	onButton(slot0, slot1, function ()
		if slot0:isfrozen() then
			return
		end

		if slot0.maps[slot0.contextData.mapIdx + slot1] then
			if slot1:getMapType() == Map.ELITE and not slot1:isEliteEnabled() then
				slot0 = slot0.maps[slot1:getBindMap()].id

				pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unusable"))
			end

			if slot2 == Map.ACTIVITY_EASY or slot2 == Map.ACTIVITY_HARD then
				if slot0.maps[slot0 - 1] and not slot3:isClearForActivity() then
					pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_map_lock"))

					return
				elseif not slot1:isUnlock() then
					pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

					return
				end
			end

			if not slot1:isUnlock() then
				slot3 = i18n("levelScene_map_lock")

				if slot0.maps[slot0 - 1] and slot4:isClear() then
					slot3 = i18n("levelScene_chapter_unlock_tip", slot1:getConfig("level_limit"))
				end

				pg.TipsMgr:GetInstance():ShowTips(slot3)

				return
			end

			slot0:setMap(slot0)
		end
	end, SFX_PANEL)
end

function slot0.setMap(slot0, slot1)
	slot0.contextData.mapIdx = slot1
	slot0.contextData.map = slot0.maps[slot1]

	slot0:updateBattleActivity(slot1)
	slot0:updateMap()
	slot0:tryPlayMapStory()
end

function slot0.updateMap(slot0)
	playBGM(slot0.contextData.map.getConfig(slot1, "bgm"))

	if slot0.contextData.map:getConfig("bg") and #slot2 > 0 then
		GetSpriteFromAtlasAsync("levelmap/" .. slot2, "", function (slot0)
			if not IsNil(slot0.map) and slot1 == slot0.contextData.map then
				setImageSprite(slot0.map, slot0, true)

				slot0.float.sizeDelta = slot0.map.sizeDelta
				slot0.float.localPosition = slot0.map.localPosition
				slot3 = Vector2.New(slot0.map.parent.rect.width / UnityEngine.Screen.width, slot0.map.parent.rect.height / UnityEngine.Screen.height)
				slot4 = Vector2.New((slot0.map.rect.width - slot0.map.parent.rect.width) / 2, (slot0.map.rect.height - slot0.map.parent.rect.height) / 2)
				slot5 = GetOrAddComponent(slot0.map, "EventTriggerListener")
				slot0.dragTrigger = slot5
				slot5.enabled = true

				slot5:AddDragFunc(function (slot0, slot1)
					slot0.map.localPosition.x = math.clamp(slot0.map.localPosition.x + slot1.delta.x * slot1.x, -slot2.x, slot2.x)
					slot0.map.localPosition.y = math.clamp(slot0.map.localPosition.y + slot1.delta.y * slot1.y, -slot2.y, slot2.y)
					slot0.map.localPosition = slot0.map.localPosition
					slot0.float.localPosition = slot0.map.localPosition
				end)
			end
		end)

		GetComponent(slot0.map, "Image").enabled = true
	else
		setImageSprite(slot0.map, nil)
		slot0:updateCouldAnimator()
	end

	setActive(slot0.btnPrev, slot3)
	setActive(slot0.btnNext, slot4)
	setImageColor(slot0.btnPrev, (slot0.maps[slot1.id - 1] and slot3:isUnlock() and Color.white) or Color.New(0.5, 0.5, 0.5, 1))
	setImageColor(slot0.btnNext, (slot4 and slot4:isUnlock() and Color.white) or Color.New(0.5, 0.5, 0.5, 1))
	setActive(slot0.chapterNo, #string.split(slot1:getConfig("name"), "||") <= 1)
	setActive(slot0.chapterNoTitleSp, #setImageColor > 3)

	if #slot6 <= 1 then
		setText(slot0.chapterNoTitle, (slot1:isEscort() and "") or "第       章")
		setText(slot0.chapterName, slot6[1])
		setText(slot0.chapterNo, setText)
		setText(slot0.chapterNoEn, "CHAPTER " .. ((tonumber(setText) and string.format("%02u", slot0.chapterNoTitle)) or setText))
	else
		setText(slot0.chapterNoTitle, slot6[2])
		setText(slot0.chapterName, slot6[1])
		setText(slot0.chapterNoEn, slot6[3])

		if #slot6 > 3 then
			setText(slot0.chapterNoTitle, "")
			setText(slot0.chapterNoTitleSp, slot6[4])
		end
	end

	setActive(slot0.topChapter:Find("type_chapter"), not slot1:isEscort())
	setActive(slot0.topChapter:Find("type_escort"), slot1:isEscort())
	slot0:updateEscortInfo()

	if not slot0.contextData.chapterVO or not slot7.active then
		slot0:updateMapItems()
		slot0:switchDifficulty()
		slot0:updateActivityBtns()
		slot0:updateCouldAnimator()
	end

	if slot0.contextData.openChapterId then
		if slot0.chapterTFsById[slot0.contextData.openChapterId] then
			triggerButton((isActive(slot8:Find("main")) and slot9) or slot8:Find("sub"))
		end

		slot0.contextData.openChapterId = nil
	end
end

function slot0.updateMapItems(slot0)
	for slot4 = 1, slot0.UIFXList.childCount, 1 do
		if slot0.UIFXList:GetChild(slot4 - 1) then
			setActive(slot5, false)
		end
	end

	if slot0.contextData.map:getConfig("cloud_suffix") == "" then
		setActive(slot0.clouds, false)
	else
		setActive(slot0.clouds, true)

		for slot6, slot7 in ipairs(slot1:getConfig("clouds_pos")) do
			slot0.cloudRTFs[slot6].GetComponent(slot8, typeof(Image)).enabled = false

			GetSpriteFromAtlasAsync("clouds/cloud_" .. slot6 .. "_" .. slot2, "", function (slot0)
				if not slot0.exited and not IsNil(IsNil) and slot2 == slot0.contextData.map then
					slot1.enabled = true
					slot1.sprite = slot0

					slot1:SetNativeSize()

					slot0.cloudRects[slot3] = slot4.rect.width
				end
			end)
		end
	end

	setActive(slot0.chapters, false)
	setActive(slot0.escortChapters, false)

	if slot1:isEscort() then
		setActive(slot0.escortChapters, true)

		slot6 = UIItemList.New(slot0.escortChapters, slot0.escortChapterTpl)

		slot6:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot1:updateEscortItem(slot2, slot0[slot1 + 1].escortId, slot0[slot1 + 1].chapter)
			end
		end)
		slot6:align(#_.detect(getProxy(ChapterProxy).escortMaps, function (slot0)
			return slot0.id == slot0.id
		end).chapters)

		return
	end

	setActive(slot0.chapters, true)

	slot0.chapterTFsById = {}

	_.each(Chapter.bindConfigTable().all, function (slot0)
		if slot0:getChapter(slot0) and slot1:getConfig("map") == slot0.id and slot1:isValid() then
			table.insert(slot1, slot1)
		end
	end)

	slot5 = UIItemList.New(slot0.chapters, slot0.chapterTpl)

	slot5:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1:updateMapItem(slot2, slot0[slot1 + 1], function ()
				if slot0:isUnlock() then
					slot1:dispatchUILoaded(true)
				end
			end)

			slot2.name = "Chapter_" .. slot0[slot1 + 1].id
			slot1.chapterTFsById[slot0[slot1 + 1].id] = slot2

			return
		end

		if slot0 == UIItemList.EventExcess and slot1.mapItemTimer[slot2] then
			slot1.mapItemTimer[slot2]:Stop()

			slot1.mapItemTimer[slot2] = nil
		end
	end)
	slot5:align(#{})
end

function slot0.updateEscortItem(slot0, slot1, slot2, slot3)
	slot1.name = "chapter_" .. slot3.id
	slot1.anchoredPosition = Vector2(slot0.escortChapters.rect.width * tonumber(pg.escort_template[slot2].pos_x), slot0.escortChapters.rect.height * tonumber(pg.escort_template[slot2].pos_y))

	setActive(slot1:Find("fighting"), getProxy(ChapterProxy).getActiveChapter(slot5) and slot6.id == slot3.id)
	slot0:DeleteTween("fighting" .. slot3.id)

	if slot8 then
		setImageAlpha(slot7, 1)
		slot0:RecordTween("fighting" .. slot3.id, LeanTween.alpha(slot7, 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	GetImageSpriteFromAtlasAsync("levelmap/mapquad/" .. slot4.pic, "", slot1, true)

	slot9 = slot1:Find("anim")
	slot12 = ({
		Color.green,
		Color.yellow,
		Color.red
	})[table.indexof(pg.gameset.gardroad_count.description[1], slot2) or 1]

	for slot17 = 0, slot9:GetComponentsInChildren(typeof(Image)).Length - 1, 1 do
		slot13[slot17].color = slot12
	end

	setImageColor(slot1, slot12)
	onButton(slot0, slot1, function ()
		if slot0 then
			if slot0.id == slot1.id then
				slot2:switchToChapter(slot2.switchToChapter)
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_strategying", slot0:getConfig("chapter_name")))
			end
		else
			slot2:displayChapterPanel(slot2.displayChapterPanel, Vector3(slot3.transform.localPosition.x, slot3.transform.localPosition.y))
		end
	end, SFX_PANEL)
end

function slot0.updateChapterTF(slot0, slot1)
	slot3 = slot0.contextData.map:getChapter(slot1)

	if slot0.chapterTFsById[slot1] and slot3 then
		slot0:updateMapItem(slot2, slot3)
	end
end

function slot0.updateMapItem(slot0, slot1, slot2, slot3)
	setAnchoredPosition(slot1, {
		x = slot0.mapWidth * slot2:getConfigTable().pos_x,
		y = slot0.mapHeight * slot2.getConfigTable().pos_y
	})

	if slot0.mapItemTimer[slot1] then
		slot0.mapItemTimer[slot1]:Stop()

		slot0.mapItemTimer[slot1] = nil
	end

	slot5 = findTF(slot1, "main")
	slot6 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then
		setActive(slot5, false)
		setActive(slot6, true)

		slot7 = findTF(slot6, "mask/count_down")
		slot0.mapItemTimer[slot1] = Timer.New(slot8, 1, -1)

		slot0.mapItemTimer[slot1]:Start()
		slot8()
		setActive(slot9, false)
		setActive(slot10, false)
		slot0:DeleteTween("fighting" .. slot2.id)

		slot6:GetComponent("Animator").enabled = true

		slot6:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			slot0.enabled = false

			if slot0.active then
				if slot1:existOni() then
					slot2 = slot3
				end

				setActive(slot2, true)
				setImageAlpha(slot2, 1)
				slot4:RecordTween("fighting" .. slot1.id, LeanTween.alpha(rtf(slot2), 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end)
	else
		setActive(slot5, true)
		setActive(slot6, false)

		slot7 = findTF(slot5, "circle/clear")
		slot8 = findTF(slot5, "circle/fighting")
		slot9 = findTF(slot5, "circle/oni")

		setText(findTF(slot5, "info/bk/title_form/title_index"), slot4.chapter_name .. "  ")
		setText(findTF(slot5, "info/bk/title_form/title"), string.split(slot4.name, "|")[1])
		setText(findTF(slot5, "info/bk/title_form/title_en"), string.split(slot4.name, "|")[2] or "")
		setFillAmount(findTF(slot5, "circle/progress"), slot2.progress / 100)
		setText(findTF(slot5, "circle/progress_text"), string.format("%d%%", slot2.progress))
		setActive(findTF(slot5, "circle/stars"), slot2:existAchieve())

		if slot2:existAchieve() then
			for slot17, slot18 in ipairs(slot2.achieves) do
				setActive(findTF(slot12, "star" .. slot17 .. "/empty"), not ChapterConst.IsAchieved(slot18))
			end
		end

		slot0:DeleteTween("fighting" .. slot2.id)
		setActive(slot8, false)
		setActive(slot9, false)
		triggerToggle(slot7, false)
		setActive(slot11, true)

		if not slot2:isUnlock() and not slot2:activeAlways() then
			setActive(slot5, false)
		else
			setActive(slot5, true)

			if slot2.active then
				if slot2:existOni() then
					slot8 = slot9
				end

				setActive(slot8, true)
				setImageAlpha(slot8, 1)
				slot0:RecordTween("fighting" .. slot2.id, LeanTween.alpha(rtf(slot8), 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			elseif slot2:isClear() then
				triggerToggle(slot7, true)
				setActive(slot11, false)
			end
		end

		slot15 = findTF(slot5, "circle")

		LeanTween.cancel(go(slot15))

		slot15.localScale = Vector3.zero

		LeanTween.scale(slot15, Vector3(1, 1, 1), 0.2):setDelay(0.3)
		setAnchoredPosition(slot16, {
			x = -1 * slot5:Find("info").rect.width
		})
		shiftPanel(slot16, 0, nil, 0.4, 0.4, true, true, nil, slot3)

		slot18 = pg.expedition_data_template[slot2:getConfig("boss_expedition_id")]
		slot19 = findTF(slot5, "mark")

		if not slot0.markRawPos then
			slot0.markRawPos = slot19.anchoredPosition
		end

		slot19.anchoredPosition = slot0.markRawPos
		slot22 = slot2:getOniChapterInfo()

		setActive(slot19:Find("bonus"), not slot0.contextData.map:isRemaster() and slot18.bonus_time > 0 and math.max(slot18.bonus_time - slot2.todayDefeatCount, 0) > 0)
		setActive(slot19:Find("oni_maybe"), false)
		setActive(slot19, not slot0.contextData.map.isRemaster() and slot18.bonus_time > 0 and math.max(slot18.bonus_time - slot2.todayDefeatCount, 0) > 0)

		if slot21 then
			slot24 = slot19.anchoredPosition.y
			slot19:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot19))
			LeanTween.value(go(slot19), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
				slot0.alpha = slot0
				slot0.anchoredPosition.y = slot2 * slot0
				slot0.anchoredPosition.anchoredPosition = slot0.anchoredPosition
			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
		end
	end

	onButton(slot0, (isActive(slot5) and slot5) or slot6, function ()
		if slot0:isfrozen() then
			return
		end

		if not slot1:isUnlock() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", slot1:getPrevChapterName()))

			return
		end

		if slot0.player.level < slot1:getConfig("unlocklevel") then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
		end

		slot1 = nil

		for slot5, slot6 in pairs(slot0.maps) do
			if slot6:getActiveChapter() then
				break
			end
		end

		if slot1 and slot1 ~= slot1 then
			slot0:emit(LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
		end

		if slot1.active then
			slot0:switchToChapter(slot1)
		else
			slot0:displayChapterPanel(slot1, Vector3(slot2.localPosition.x - 10, slot2.localPosition.y + 150))
			slot0:tryPlayChapterInfoGuide(slot1)
		end

		return
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function slot0.tryPlayChapterInfoGuide(slot0, slot1)
	if slot1:existLoop() then
		pg.GuideMgr:GetInstance():play("NG0013", {})
	end

	return
end

function slot0.tryPlayMapStory(slot0)
	if slot0.contextData.map:getConfig("enter_story") and slot1 ~= "" and pg.GuideMgr2.ENABLE_GUIDE == false and not pg.SystemOpenMgr:GetInstance().active then
		pg.StoryMgr.GetInstance():Play(slot1, function (slot0)
			if not slot0 then
				if slot0.contextData.map:getConfig("guide_id") and slot1 ~= "" then
					pg.GuideMgr2:GetInstance():Reset()
					pg.GuideMgr2:GetInstance():updateSystemGuideStep(slot1)
					pg.GuideMgr2:GetInstance():dispatch({
						viewComponent = slot0.__cname,
						event = slot0.__cname
					})
				else
					pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
				end
			else
				pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
			end

			return
		end)
	else
		pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
	end

	return
end

function slot0.displaySignalPanel(slot0)
	slot0.signalPanel = slot0.signalPanel or SignalPanel.New(slot0.rescueSelect)

	slot0.signalPanel:attach(slot0)
	slot0.signalPanel:set(slot0.maps, slot0.subRefreshCount, slot0.subProgress)

	function slot0.signalPanel.onGo(slot0)
		slot0:hideSignalPanel()

		if slot0.active then
			slot0:switchToChapter(slot0)
		else
			if slot0.contextData.mapIdx ~= slot0:getConfig("map") then
				slot0:setMap(slot0:getConfig("map"))
			end
		end

		return
	end

	function slot0.signalPanel.onSearch()
		slot0:hideSignalPanel()
		slot0.hideSignalPanel:emit(LevelMediator2.ON_REFRESH_SUB_CHAPTER)

		return
	end

	function slot0.signalPanel.onCancel()
		slot0:hideSignalPanel()

		return
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.signalPanel._tf)

	return
end

function slot0.hideSignalPanel(slot0)
	if slot0.signalPanel then
		slot0.signalPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.signalPanel._tf, slot0._tf)
		setParent(slot0.signalPanel._tf, slot0.topPanel, false)
	end

	return
end

function slot0.displaySpResult(slot0, slot1, slot2)
	setActive(slot0.spResult, true)
	slot0:doPlayAnim((slot1 == 1 and "SpUnitWin") or "SpUnitLose", function (slot0)
		onButton(slot0, slot0, function ()
			removeOnButton(removeOnButton)
			setActive(setActive, false)
			setActive:hideSpResult()
			false()

			return
		end, SFX_PANEL)

		return
	end)

	return
end

function slot0.hideSpResult(slot0)
	setActive(slot0.spResult, false)

	return
end

function slot0.displayBombResult(slot0, slot1)
	setActive(slot0.spResult, true)
	slot0:doPlayAnim("SpBombRet", function (slot0)
		onButton(slot0, slot0, function ()
			removeOnButton(removeOnButton)
			setActive(setActive, false)
			setActive:hideBombResult()
			false()

			return
		end, SFX_PANEL)

		return
	end, function (slot0)
		setText(slot0.transform:Find("right/name_bg/en"), slot0.contextData.chapterVO.modelCount)

		return
	end)

	return
end

function slot0.hideBombResult(slot0)
	setActive(slot0.spResult, false)

	return
end

function slot0.displayChapterPanel(slot0, slot1, slot2)
	slot0.levelInfoPanel = slot0.levelInfoPanel or LevelInfoPanel.New(slot0.chapterPanel)

	slot0.levelInfoPanel:attach(slot0)
	slot0.levelInfoPanel:set(slot1, slot2)

	function slot0.levelInfoPanel.onConfirm(slot0)
		if slot0.player.ship_bag_max <= getProxy(BayProxy).getShipCount(slot1) then
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
		end

		slot0:hideChapterPanel()

		slot3 = slot1:clone()
		slot3.loopFlag = slot0

		if slot3:getConfig("type") == Chapter.CustomFleet then
			slot0:displayFleetEdit(slot3)
		else
			slot0:displayFleetSelect(slot3)
		end

		return
	end

	function slot0.levelInfoPanel.onCancel()
		slot0:hideChapterPanel()

		return
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.levelInfoPanel._tf)

	return
end

function slot0.hideChapterPanel(slot0)
	if slot0.levelInfoPanel then
		slot0.levelInfoPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.levelInfoPanel._tf, slot0._tf)
		setParent(slot0.levelInfoPanel._tf, slot0.topPanel, false)
	end

	return
end

function slot0.displayFleetSelect(slot0, slot1)
	slot0.levelFleetPanel = slot0.levelFleetPanel or LevelFleetPanel.New(slot0.fleetSelect.gameObject)

	slot0.levelFleetPanel:attach(slot0)
	slot0.levelFleetPanel:set(slot1, slot0.fleets, slot1:selectFleets(slot0.lastFleetIndex, slot0.fleets))

	function slot0.levelFleetPanel.onConfirm(slot0)
		if slot0:getConfig("npc_data") then
			slot4 = getProxy(TaskProxy):getTaskById(slot1[3])

			if (slot1[3] == 0 or (slot4 and not slot4:isFinish())) and #slot1.fleets[slot0[1]]:getTeamByName((pg.ship_data_by_type[pg.ship_data_statistics[slot1[1]].type].team_type == TeamType.Vanguard and Fleet.VANGUARD) or Fleet.MAIN) == 3 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("chapter_tip_with_npc", slot5.name)
				})

				return
			end
		end

		slot2 = false
		slot3 = ""

		for slot7, slot8 in ipairs(slot0) do
			slot2, slot3 = slot1.fleets[slot8]:GetEnergyStatus()

			if slot9 then
				break
			end
		end

		function slot4()
			slot0:hideFleetSelect()

			if not slot0:isValid() then
				return
			end

			slot0:trackChapter(slot0, function ()
				slot0:emit(LevelMediator2.ON_TRACKING, slot1.id, , slot1.loopFlag)

				return
			end)

			return
		end

		if slot2 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = slot3,
				onYes = slot4
			})
		else
			slot4()
		end

		return
	end

	function slot0.levelFleetPanel.onCancel()
		slot0:hideFleetSelect()

		return
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.levelFleetPanel._tf)

	return
end

function slot0.hideFleetSelect(slot0)
	if slot0.levelFleetPanel then
		slot0.levelFleetPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.levelFleetPanel._tf, slot0._tf)
		setParent(slot0.levelFleetPanel._tf, slot0.topPanel, false)
	end

	return
end

function slot0.isCrossStoryLimit(slot0, slot1)
	slot2 = true

	if slot1 ~= "" and #slot1 > 0 then
		slot2 = _.all(slot1, function (slot0)
			if slot0[1] == 1 then
				return getProxy(TaskProxy):getTaskById(slot0[2]) and not slot2:isFinish()
			end

			return false
		end)
	end

	return slot2
end

function slot0.switchDifficulty(slot0)
	slot2 = slot0.contextData.map.getConfig(slot1, "type")

	if slot0.contextData.map:getConfig("uifx") ~= "" then
		setActive(slot0:findTF(slot3, slot0.UIFXList), true)
	end

	setActive(slot0.scenario, false)

	if Map.EVENT == slot2 then
		setActive(slot0.normalBtn, false)
		setActive(slot0.eliteBtn, false)
	else
		setActive(slot0.normalBtn, slot2 == Map.ELITE)
		setActive(slot0.eliteQuota, slot2 == Map.ELITE)
		setActive(slot0.eliteBtn, slot2 == Map.SCENARIO)
		setActive(slot0.eliteBtn:Find("bg/pic_activity"), getProxy(ActivityProxy).getActivityById(setActive, ActivityConst.ELITE_AWARD_ACTIVITY_ID) and not slot0.eliteBtn:isEnd())
	end

	slot4 = pairs
	slot5 = slot0.chapterTFsById or {}

	for slot7, slot8 in slot4(slot5) do
		if slot1:getChapter(slot7) and (slot9:isUnlock() or slot9:activeAlways()) then
			setActive(slot8, true)
		else
			setActive(slot8, false)
		end
	end

	return
end

function slot0.flushFleetEditButton(slot0, slot1)
	slot2 = findTF(slot0.fleetEdit, "panel/fleet")
	slot3 = findTF(slot0.fleetEdit, "panel/sub")
	slot4 = findTF(slot0.fleetEdit, "panel/shiptpl")
	slot5 = findTF(slot0.fleetEdit, "panel/emptytpl")

	setActive(findTF(slot0.fleetEdit, "mask"), false)
	setActive(findTF(slot0.fleetEdit, "panel/limit"), false)
	setActive(findTF(slot0.fleetEdit, "panel/limit_tip"), #slot1:getConfig("property_limitation") == 0)
	setActive(findTF(slot0.fleetEdit, "panel/limit_elite"), #slot8 ~= 0)
	removeAllChildren(findTF(slot0.fleetEdit, "panel/limit_elite/limit_list"))

	if slot8 ~= 0 then
		slot10, slot11 = slot1:IsPropertyLimitationSatisfy()

		setActive(slot12, false)

		for slot16, slot17 in ipairs(slot8) do
			slot18 = slot17[1]
			slot19 = slot17[2]
			slot20 = slot17[3]
			slot21 = cloneTplTo(slot12, slot9)

			if slot10[slot16] == 1 then
				slot0:findTF("Text", slot21):GetComponent(typeof(Text)).color = Color.New(1, 0.9607843137254902, 0.5019607843137255)
			else
				slot0:findTF("Text", slot21):GetComponent(typeof(Text)).color = Color.New(0.9568627450980393, 0.30196078431372547, 0.30196078431372547)
			end

			setActive(slot21, true)
			setText(slot0:findTF("Text", slot21), AttributeType.EliteCondition2Name(slot18) .. AttributeType.eliteConditionCompare[slot19] .. slot20 .. "（" .. slot11[slot18] .. "）")
		end

		setActive(slot7:Find("sub"), slot1:getConfig("submarine_num") > 0)
	end

	slot10 = slot1:getEliteFleetList()

	function slot11(slot0, slot1, slot2, slot3)
		slot5 = {}
		slot6 = {}

		for slot10, slot11 in ipairs(slot4) do
			slot5[slot1.shipVOs[slot11]] = true

			if slot1 == slot1.shipVOs[slot11]:getTeamType() then
				table.insert(slot6, slot11)
			end
		end

		removeAllChildren(slot7)

		slot8 = 0
		slot9 = false
		slot10 = 0

		table.sort(slot2, function (slot0, slot1)
			if type(slot0) == type(slot1) then
				return slot3 < slot2
			else
				if slot1 == 0 or (slot3 == "string" and slot0 ~= 0) then
					return true
				else
					return false
				end
			end

			return
		end)

		slot11 = {}
		slot12 = {}

		for slot16 = 1, 3, 1 do
			slot17, slot18, slot19 = nil
			slot20 = (slot6[slot16] and slot1.shipVOs[slot6[slot16]]) or nil

			if slot20 then
				for slot24, slot25 in ipairs(slot2) do
					if type(slot25) == "number" then
						if slot25 == 0 or slot20:getShipType() == slot25 then
							slot18 = slot20
							slot19 = slot25

							table.remove(slot2, slot24)
							table.insert(slot11, slot24)

							slot9 = slot9 or slot20:getShipType() == slot25

							break
						end
					else
						if type(slot25) == "string" and table.contains(Clone(ShipType.BundleList[slot25]), slot20:getShipType()) then
							slot18 = slot20
							slot19 = slot25

							table.remove(slot2, slot24)
							table.insert(slot11, slot24)

							slot9 = true

							break
						end
					end
				end
			else
				slot19 = slot2[1]

				table.remove(slot2, 1)
				table.insert(slot11, 1)
			end

			if slot19 == 0 then
				slot10 = slot10 + 1
			end

			table.insert(slot12, (slot18 and cloneTplTo(slot2, slot7)) or cloneTplTo(slot3, slot7))
			setActive((slot18 and cloneTplTo(slot2, slot7)) or cloneTplTo(slot3, slot7), true)

			if slot18 then
				updateShip(slot21, slot18)
				setActive(slot1:findTF("event_block", slot21), slot18.inEvent)

				slot5[slot18] = true
			else
				slot8 = slot8 + 1
			end

			slot17 = findTF(slot21, "icon_bg")

			setActive(slot1:findTF("ship_type", slot21), true)

			if type(slot19) == "number" then
				if slot19 ~= 0 then
					setImageSprite(slot1:findTF("ship_type", slot21), GetSpriteFromAtlas("shiptype", ShipType.Type2CNLabel(slot19)), true)
				else
					setActive(slot1:findTF("ship_type", slot21), false)
				end
			else
				if type(slot19) == "string" then
					setImageSprite(slot1:findTF("ship_type", slot21), GetSpriteFromAtlas("shiptype", ShipType.BundleType2CNLabel(slot19)), true)
				end
			end

			setActive(slot1:findTF("ship_type", slot21), not slot18 and slot19 ~= 0)
			table.sort(setActive, function (slot0, slot1)
				return slot0[slot0:getTeamType()] < slot0[slot1:getTeamType()] or (slot0[slot0:getTeamType()] == slot0[slot1:getTeamType()] and table.indexof(slot1, slot0.id) < table.indexof(slot1, slot1.id))
			end)

			slot23 = GetOrAddComponent(slot17, typeof(UILongPressTrigger))

			function slot24()
				slot0:hideFleetEdit()
				slot0.hideFleetEdit:emit(LevelMediator2.ON_ELITE_OEPN_DECK, {
					shipType = slot1,
					fleet = slot2,
					chapter = slot3,
					shipVO = slot3,
					fleetIndex = slot5,
					teamType = slot6
				})

				return
			end

			slot23.onReleased:RemoveAllListeners()
			slot23.onLongPressed:RemoveAllListeners()
			slot23.onReleased:AddListener(function ()
				slot0()

				return
			end)
			slot23.onLongPressed:AddListener(function ()
				if not slot0 then
					slot1()
				else
					slot2:hideFleetEdit()
					slot2:emit(LevelMediator2.ON_FLEET_SHIPINFO, {
						shipId = slot0.id,
						shipVOs = slot3,
						chapter = slot3
					})
				end

				return
			end)
		end

		for slot16 = 3, 1, -1 do
			slot12[slot16]:SetSiblingIndex(slot11[slot16] - 1)
		end

		if (slot9 == true or slot10 == 3) and slot8 ~= 3 then
			return true
		else
			return false
		end

		return
	end

	function slot12(slot0, slot1, slot2)
		slot4 = slot2:getEliteFleetCommanders()[slot0]

		for slot8 = 1, 2, 1 do
			slot10 = nil

			if slot4[slot8] then
				slot10 = getProxy(CommanderProxy):getCommanderById(slot9)
			end

			slot11 = slot1:Find("pos" .. slot8)

			setActive(slot12, not slot10)
			setActive(slot11:Find("info"), slot10)

			if slot10 then
				setImageSprite(slot13:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. slot14))
				GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot10:getPainting(), "", slot13:Find("mask/icon"))
			end

			slot14 = slot2:wrapEliteFleet(slot0)

			onButton(slot0, slot12, function ()
				slot0:openCommanderPanel(slot0, slot2.id, )

				return
			end, SFX_PANEL)
			onButton(slot0, slot13, function ()
				slot0:openCommanderPanel(slot0, slot2.id, )

				return
			end, SFX_PANEL)
		end

		return
	end

	slot13 = slot1:getConfig("limitation")

	for slot17 = 1, 2, 1 do
		slot18 = slot2:GetChild(slot17 - 1)

		setActive(slot21, false)
		setActive(findTF(slot18, "selected"), false)
		setActive(findTF(slot18, TeamType.Main), slot17 <= slot1:getConfig("group_num"))
		setActive(findTF(slot18, TeamType.Vanguard), slot17 <= slot1.getConfig("group_num"))
		setActive(slot0:findTF("btn_clear", slot18), slot17 <= slot1.getConfig("group_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("btn_recom", slot18), slot17 <= slot1.getConfig("group_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("blank", slot18), not (slot17 <= slot1.getConfig("group_num")))
		setActive(slot0:findTF("commander", slot18), slot0.contextData.EditingCommander and slot17 <= slot1.getConfig("group_num"))
		setText(slot0:findTF("bg/name", slot18), (slot17 <= slot1.getConfig("group_num") and Fleet.DEFAULT_NAME[slot17]) or "")

		if slot24 then
			slot29 = slot11(slot18, TeamType.Vanguard, slot27, slot17)

			slot12(slot17, slot23, slot1)

			if slot11(slot18, TeamType.Main, slot26, slot17) and slot29 then
				setActive(slot0:findTF("selected", slot18), true)
			end

			onButton(slot0, slot19, function ()
				if #slot0[slot1] ~= 0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()
							slot0:emit(LevelMediator2.ON_ELITE_CLEAR, {
								index = slot1,
								chapterVO = LevelMediator2.ON_ELITE_CLEAR
							})

							return
						end
					})
				end

				return
			end)
			onButton(slot0, slot20, function ()
				if #slot0[slot1] ~= 6 then
					if slot0 ~= 0 then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()
								slot0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
									index = slot1,
									chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
								})

								return
							end
						})
					else
						slot2:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
							index = slot1,
							chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
						})
					end
				end

				return
			end)
		end
	end

	for slot17 = 1, 1, 1 do
		slot19 = slot3:GetChild(slot17 - 1)

		setActive(slot22, false)
		setActive(findTF(slot19, "selected"), false)
		setActive(findTF(slot19, TeamType.Submarine), slot17 <= slot1:getConfig("submarine_num"))
		setActive(slot0:findTF("btn_clear", slot19), slot17 <= slot1:getConfig("submarine_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("btn_recom", slot19), slot17 <= slot1:getConfig("submarine_num") and not slot0.contextData.EditingCommander)
		setActive(slot0:findTF("blank", slot19), slot1:getConfig("submarine_num") < slot17)
		setActive(slot0:findTF("commander", slot19), slot17 <= slot1:getConfig("submarine_num") and slot0.contextData.EditingCommander)
		setText(slot0:findTF("bg/name", slot19), (slot17 <= slot1:getConfig("submarine_num") and Fleet.DEFAULT_NAME[(Fleet.SUBMARINE_FLEET_ID + slot17) - 1]) or "")
		slot12(slot17 + 2, slot0.findTF("commander", slot19), slot1)

		if slot17 <= slot1:getConfig("submarine_num") then
			if slot11(slot19, TeamType.Submarine, {
				0,
				0,
				0
			}, slot18) then
				setActive(slot0:findTF("selected", slot19), true)
			end

			onButton(slot0, slot20, function ()
				if #slot0[slot1] ~= 0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()
							slot0:emit(LevelMediator2.ON_ELITE_CLEAR, {
								index = slot1,
								chapterVO = LevelMediator2.ON_ELITE_CLEAR
							})

							return
						end
					})
				end

				return
			end)
			onButton(slot0, slot21, function ()
				if #slot0[slot1] ~= 3 then
					if slot0 ~= 0 then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()
								slot0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
									index = slot1,
									chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
								})

								return
							end
						})
					else
						slot2:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
							index = slot1,
							chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
						})
					end
				end

				return
			end)
		end
	end

	return
end

function slot0.displayFleetEdit(slot0, slot1)
	setActive(slot0.fleetEdit, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.fleetEdit)

	slot4 = findTF(slot0.fleetEdit, "panel/commander_btn")

	slot0:flushFleetEditButton(slot1)
	onButton(slot0, slot2, function ()
		slot0:hideFleetEdit(slot0)

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0.fleetEdit, function ()
		slot0:hideFleetEdit(slot0)

		return
	end, SFX_CANCEL)
	onToggle(slot0, slot4, function (slot0)
		slot0.contextData.EditingCommander = slot0

		slot0:flushFleetEditButton(slot0.flushFleetEditButton)

		return
	end, SFX_PANEL)
	triggerToggle(slot4, slot0.contextData.EditingCommander)
	setActive(slot4, slot0.openedCommanerSystem)
	onButton(slot0, findTF(slot0.fleetEdit, "panel/start_button"), function ()
		slot0, slot1 = slot0:IsEliteFleetLegal()

		if slot0 then
			function slot2()
				slot0:hideFleetEdit()
				slot0.hideFleetEdit:trackChapter(slot0.hideFleetEdit, function ()
					slot0:emit(LevelMediator2.ON_ELITE_TRACKING, slot1.id, slot1.loopFlag)

					return
				end)
				playSoundEffect(SFX_UI_WEIGHANCHOR_BATTLE)

				return
			end

			if slot1 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					content = i18n("elite_fleet_confirm", Fleet.DEFAULT_NAME[slot1]),
					onYes = slot2
				})
			else
				slot2()
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		end

		return
	end, SFX_UI_WEIGHANCHOR_GO)

	return
end

function slot0.hideFleetEdit(slot0, slot1, slot2)
	if slot1 then
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id, slot2)
	end

	setActive(slot0.fleetEdit, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetEdit, slot0._tf)
	setParent(slot0.fleetEdit, slot0.topPanel, false)

	return
end

function slot0.trackChapter(slot0, slot1, slot2)
	slot3 = nil

	coroutine.wrap(function ()
		slot1 = getProxy(ChapterProxy)

		if slot0.contextData.map:isRemaster() and slot0.remasterId ~= slot1:getActiveRemaster() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("levelScene_activate_remaster"),
				onYes = function ()
					onNextTick(onNextTick)

					return
				end
			})
			coroutine.yield()

			if slot1.remasterTickets <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))

				return
			end

			slot0:emit(LevelMediator2.ON_ACTIVATE_REMASTER, slot0.remasterId, function ()
				onNextTick(onNextTick)

				return
			end)
			coroutine.yield()
		end

		slot3 = slot2:getConfig("enter_story_limit")

		if slot2:getConfig("enter_story") and slot2 ~= "" and slot0:isCrossStoryLimit(slot3) then
			pg.StoryMgr.GetInstance():Play(slot2, function ()
				onNextTick(onNextTick)

				return
			end)
			coroutine.yield()
		end

		if slot3 then
			slot3()
		end

		return
	end)()

	return
end

function slot0.setChapter(slot0, slot1)
	slot2 = nil

	if slot1 then
		slot2 = slot1.id

		if slot1:getDataType() == ChapterConst.TypeNone then
			slot1 = slot0.maps[slot0.contextData.mapIdx]:getChapter(slot2)
		end
	end

	slot0.contextData.chapterId = slot2
	slot0.contextData.chapterVO = slot1

	return
end

function slot0.updateStageBarrier(slot0)
	setActive(slot0.panelBarrier, slot0.contextData.chapterVO:existOni())

	if slot0.contextData.chapterVO:existOni() then
		slot2 = slot0.panelBarrier:Find("btn_barrier")

		setActive(slot3, false)
		setText(slot2:Find("nums"), slot1.modelCount)
		onButton(slot0, slot2, function ()
			if slot0:isfrozen() then
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

function slot0.switchToChapter(slot0, slot1, slot2)
	slot0:frozen(function ()
		slot0:tryAutoAction()

		return
	end)

	slot4 = slot0.contextData.map:getConfig("type")

	if (slot1:getDataType() == ChapterConst.TypeSham and slot4 ~= Map.SHAM) or (slot3 == ChapterConst.TypeGuild and slot4 ~= Map.GUILD_BOSS) then
		slot0.contextData.chapterMapIdx = slot0.contextData.mapIdx
	end

	if slot0.contextData.mapIdx ~= slot1:getConfig("map") then
		slot0:setMap(slot1:getConfig("map"))
	end

	slot0:setChapter(slot1)
	slot0:hideFleetSelect()
	setActive(slot0.clouds, false)
	setActive(slot0.chapters, false)
	setActive(slot0.escortChapters, false)
	setActive(slot0.topStage, true)
	setActive(slot0.bottomStage, true)
	setActive(slot0.leftStage, true)
	setActive(slot0.rightStage, true)
	setActive(slot0.bossActivityBossTF, false)

	slot0.leftCanvasGroup.blocksRaycasts = false
	slot0.rightCanvasGroup.blocksRaycasts = false
	slot7 = findTF(slot0.rightStage, "target")
	slot8 = findTF(slot0.rightStage, "skip_events")

	setActive(slot5, slot1:existAmbush())
	setActive(findTF(slot0.topStage, "sham_progress"), slot3 == ChapterConst.TypeSham)
	setActive(findTF(slot0.rightStage, "btn_sham_shop"), slot3 == ChapterConst.TypeSham)

	if slot3 == ChapterConst.TypeSham then
		setActive(slot9, getProxy(ChapterProxy):getShamShop() ~= nil)
	end

	setActive(slot0.resetBtn, slot3 == ChapterConst.TypeSham or slot3 == ChapterConst.TypeGuild)
	setImageColor(slot0.resetBtn, (slot3 == ChapterConst.TypeSham and ChapterConst.ShamResetCountLimit <= slot1.shamResetCount and Color(1, 1, 10, 0.5882352941176471)) or Color(1, 1, 1, 1))
	setActive(findTF(slot0.switchBtn, "switch2"), not (slot3 == ChapterConst.TypeNone))
	setActive(findTF(slot0.switchBtn, "switch1"), slot3 == ChapterConst.TypeNone)

	slot0.achieveOriginalY = -148.5

	setText(slot8:Find("Label"), i18n("map_event_skip"))

	if slot1:getConfig("event_skip") == 1 then
		if slot1.progress > 0 or slot1.defeatCount > 0 or slot1.passCount > 0 then
			setActive(slot8, true)

			slot7.anchoredPosition = Vector2.New(slot7.anchoredPosition.x, slot0.achieveOriginalY - 40)
			GetComponent(slot8, typeof(Toggle)).isOn = PlayerPrefs.GetInt("skip_events_on_" .. slot1.id, 1) == 1

			onToggle(slot0, slot8, function (slot0)
				PlayerPrefs.SetInt(slot0, (slot0 and 1) or 0)

				return
			end)
		else
			setActive(slot8, false)

			if not PlayerPrefs.HasKey(key) then
				PlayerPrefs.SetInt(key, 0)
			end
		end
	else
		setActive(slot8, false)

		slot7.anchoredPosition = Vector2.New(slot7.anchoredPosition.x, slot0.achieveOriginalY)
	end

	setActive(slot7, slot1:existAchieve())
	setActive(slot0.retreatBtn, slot3 == ChapterConst.TypeNone)
	slot0:onSubLayerContextChange()
	seriesAsync({
		function (slot0)
			pg.UIMgr.GetInstance():BlurPanel(slot0.topPanel)
			onNextTick(slot0)

			return
		end,
		function (slot0)
			slot0:updateStageInfo()
			slot0:updateAmbushRate(slot1.fleet.line, true)
			slot0:updateStageAchieve()
			slot0:updateStageBarrier()
			slot0:updateBombPanel()

			if slot0 == ChapterConst.TypeSham then
				slot0:updateShamProgress()
			end

			onNextTick(slot0)

			return
		end,
		function (slot0)
			slot0:updateStageStrategy()
			onNextTick(slot0)

			return
		end,
		function (slot0)
			slot0:updateStageFleet()
			slot0:updateFleetBuff()
			onNextTick(slot0)

			return
		end,
		function (slot0)
			slot1 = slot0:getConfig("scale")

			slot1:RecordTween("mapScale", LeanTween.value(go(slot1.map), slot1.map.localScale, Vector3.New(slot1[3], slot1[3], 1), LeanTween.value):setOnUpdateVector3(function (slot0)
				slot0.map.localScale = slot0
				slot0.float.localScale = slot0

				return
			end):setOnComplete(System.Action(slot0)):setEase(LeanTweenType.easeOutSine).uniqueId)

			slot3 = LeanTween.value(go(slot1.map), slot1.map.pivot, Vector2.New(slot1[1], slot1[2]), slot2)

			slot3:setOnUpdateVector2(function (slot0)
				slot0.map.pivot = slot0
				slot0.float.pivot = slot0

				return
			end):setEase(LeanTweenType.easeOutSine)
			slot1:RecordTween("mapPivot", slot3.uniqueId)
			shiftPanel(slot1.leftChapter, -slot1.leftChapter.rect.width, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.rightChapter, slot1.rightChapter.rect.width, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.bottomStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.topChapter, 0, 60, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

			return
		end
	}, function ()
		setActive(slot0.topChapter, false)
		setActive(slot0.leftChapter, false)
		setActive(slot0.rightChapter, false)

		setActive.leftCanvasGroup.blocksRaycasts = true
		setActive.leftCanvasGroup.rightCanvasGroup.blocksRaycasts = true

		setActive.leftCanvasGroup.rightCanvasGroup:initGrid()

		setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.huntingRangeVisibility = slot0.contextData.huntingRangeVisibility - 1

		setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.grid:toggleHuntingRange()
		setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.grid.toggleHuntingRange:unfrozen()

		if setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.grid.toggleHuntingRange then
			slot1()
		end

		return
	end)

	return
end

function slot0.switchToMap(slot0)
	slot2 = ChapterConst.TypeNone

	if slot0.contextData.chapterVO then
		slot2 = slot1:getDataType()
	end

	slot3 = getProxy(ChapterProxy)

	if slot1:getMapType() == Map.ESCORT and (#slot3.escortMaps == 0 or _.any(slot4, function (slot0)
		return slot0:shouldFetch()
	end)) then
		slot0:emit(LevelMediator2.ON_FETCH_ESCORT)

		return
	end

	if slot3.subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then
		slot0:emit(LevelMediator2.ON_FETCH_SUB_CHAPTER)

		return
	end

	slot0:frozen()
	slot0:destroyGrid()
	slot0:RecordTween("mapScale", LeanTween.value(go(slot0.map), slot0.map.localScale, Vector3.New(1, 1, 1), slot0):setOnUpdateVector3(function (slot0)
		slot0.map.localScale = slot0
		slot0.float.localScale = slot0

		return
	end):setOnComplete(System.Action(function ()
		if not slot0.contextData.chapterVO then
			setActive(slot0.topStage, false)
			setActive(slot0.bottomStage, false)
			setActive(slot0.leftStage, false)
			setActive(slot0.rightStage, false)
		end

		slot0:unfrozen()

		return
	end)):setEase(LeanTweenType.easeOutSine).uniqueId)

	slot5 = LeanTween.value(go(slot0.map), slot0.map.pivot, Vector2.New(0.5, 0.5), slot0)

	slot5:setOnUpdateVector2(function (slot0)
		slot0.map.pivot = slot0
		slot0.float.pivot = slot0

		return
	end):setEase(LeanTweenType.easeOutSine)
	slot0:RecordTween("mapPivot", slot5.uniqueId)
	setActive(slot0.topChapter, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	shiftPanel(slot0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.bottomStage, 0, -slot0.bottomStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, slot0.rightStage.rect.width, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, -slot0.leftStage.rect.width, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	if slot0.stageTimer then
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
	setActive(slot0.ambushInfo, false)
	setActive(slot0.strategyInfo, false)

	if slot0.ambushWarning and slot0.ambushWarning.activeSelf then
		slot0.ambushWarning:SetActive(false)
		slot0:unfrozen()
	end

	slot0:onSubLayerContextChange()
	slot0:setChapter(nil)
	slot0:updateEscortInfo()

	if slot2 == ChapterConst.TypeSham then
		slot0.contextData.mapIdx = slot0.contextData.chapterMapIdx
		slot0.contextData.chapterMapIdx = nil

		slot0:setMap(slot0:selectMap(slot0.maps))
	else
		if slot2 == ChapterConst.TypeNone then
			slot0:updateMapItems()
			slot0:switchDifficulty()
			slot0:updateActivityBtns()
			slot0:updateCouldAnimator()
		end
	end

	return
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

			return
		end, 1, -1)

		slot0.stageTimer:Start()
		slot0.stageTimer.func()
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
					pg.MsgboxMgr.GetInstance():showSingleItemBox({
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = slot0.id,
							cfg = pg.MsgboxMgr.GetInstance().showSingleItemBox
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

			pg.MsgboxMgr.GetInstance():showNonDropItem({
				hideNo = true,
				sprite = slot1,
				name = slot0:getChapterState(),
				content = i18n("level_risk_level_mitigation_rate", slot0:getRemainPassCount(), slot0:getMitigationRate())
			})

			return
		end, SFX_PANEL)
	end

	return
end

function slot0.updateShamProgress(slot0)
	setText(findTF(slot0.topStage, "sham_progress/value"), slot0.contextData.chapterVO.progress .. " / " .. ChapterConst.ShamEnemyLimit)

	return
end

function slot0.updateAmbushRate(slot0, slot1, slot2)
	if not slot0.contextData.chapterVO:existAmbush() then
		return
	end

	slot7, slot8 = ChapterConst.GetAmbushDisplay(slot6)
	slot10 = findTF(slot0.topStage, "ambush/value2")

	setText(findTF(slot0.topStage, "ambush/value1"), math.floor(slot3.fleet.getInvestSums(slot4)))

	if slot2 and slot3:existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then
		setText(slot10, "遇敌")
		setTextColor(slot10, Color.New(0.9607843137254902, 0.3764705882352941, 0.2823529411764706))
	else
		setText(slot10, slot7)
		setTextColor(slot10, slot8)
	end

	return
end

function slot0.displayAmbushInfo(slot0, slot1)
	GetImageSpriteFromAtlasAsync("enemies/" .. pg.expedition_data_template[slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column).attachmentId].icon, "", slot9)
	setText(slot7, pg.expedition_data_template[slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column).attachmentId].name)
	setText(slot8, pg.expedition_data_template[slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column).attachmentId].level)
	setText(slot10, math.floor(slot0.contextData.chapterVO.getAmbushDodge(slot2, slot0.contextData.chapterVO.fleet) * 100) .. "%")
	onButton(slot0, slot11, function ()
		slot0:emit(LevelMediator2.ON_OP, {
			arg1 = 0,
			type = ChapterConst.OpAmbush,
			id = slot1.id
		})
		setActive(slot0.ambushInfo, false)

		return
	end, SFX_UI_WEIGHANCHOR_ATTACK)
	onButton(slot0, slot12, function ()
		slot0:emit(LevelMediator2.ON_OP, {
			arg1 = 1,
			type = ChapterConst.OpAmbush,
			id = slot1.id
		})
		setActive(slot0.ambushInfo, false)

		return
	end, SFX_UI_WEIGHANCHOR_AVOID)
	setActive(slot0.ambushInfo, true)

	findTF(slot0.ambushInfo, "window").localScale = Vector3(1, 0, 1)

	LeanTween.scaleY(findTF(slot0.ambushInfo, "window").gameObject, 1, 0.3):setOnComplete(System.Action(slot1))

	return
end

function slot0.updateStageAchieve(slot0)
	if not slot0.contextData.chapterVO:existAchieve() then
		return
	end

	slot3 = findTF(slot0.rightStage, "target")

	setActive(slot3, true)
	setActive(slot4, false)
	setActive(slot7, false)
	removeAllChildren(slot5)
	removeAllChildren(slot8)

	for slot12, slot13 in ipairs(slot2) do
		slot14 = cloneTplTo(slot4, slot5)
		slot15 = ChapterConst.IsAchieved(slot13)

		setActive(findTF(slot14, "star"), slot15)
		setActive(findTF(slot14, "star_empty"), not slot15)
		setText(slot16, ChapterConst.GetAchieveDesc(slot13.type, slot1))
		setTextColor(findTF(slot14, "desc"), (slot15 and Color.yellow) or Color.white)

		slot17 = cloneTplTo(slot7, slot8)
		slot17.localScale = Vector3(1, 1, 1)

		setActive(findTF(slot17, "star"), slot15)
		setActive(findTF(slot17, "star_empty"), not slot15)
	end

	setActive(findTF(slot6, "arr"), slot6.localScale.x == -1)
	setActive(slot8, slot6.localScale.x ~= -1)
	onButton(slot0, slot6, function ()
		slot0.localScale.x = slot0.localScale.x * -1
		slot0.localScale = slot0.localScale

		slot1(shiftPanel, ((slot0.localScale.x == -1 and 0) or slot1.sizeDelta.x) + 2, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		setActive(findTF(slot0, "arr"), slot0.x == -1)
		setActive(findTF(slot0, "arr"), slot0.x ~= -1)

		return
	end, SFX_PANEL)

	if not slot0.isAchieveFirstInit then
		slot0.isAchieveFirstInit = true
		slot6.localScale.x = 1
		slot6.localScale = slot6.localScale
		slot3.anchoredPosition = Vector2(slot3.sizeDelta.x + 2, slot3.anchoredPosition.y)

		setActive(findTF(slot6, "arr"), slot6.localScale.x == -1)
		setActive(slot8, slot9.x ~= -1)
	end

	return
end

function slot0.updateStageStrategy(slot0)
	slot5 = findTF(slot4, "arr")

	setActive(slot7, false)

	slot9 = {}
	slot10 = {}

	_.each(slot8, function (slot0)
		if pg.strategy_data_template[slot0.id].type == ChapterConst.StgTypeForm then
			table.insert(slot0, slot0.id)
		else
			table.insert(slot1, slot0)
		end

		return
	end)

	if _.any(slot0.contextData.chapterVO.fleets, function (slot0)
		return slot0:getFleetType() == FleetType.Submarine
	end) then
		table.insert(slot10, 2, {
			id = ChapterConst.StrategySubAutoAttack
		})
		table.insert(slot10, 2, {
			id = ChapterConst.StrategyHuntingRange
		})
	end

	table.insert(slot10, 1, {
		id = slot2:getFormationStg()
	})

	slot12 = UIItemList.New(slot6, slot7)

	slot12:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4, slot5 = nil

			if slot0[slot1 + 1].id == ChapterConst.StrategyHuntingRange then
				slot4 = 1
				slot5 = (slot1.contextData.huntingRangeVisibility % 2 == 1 and "range_invisible") or "range_visible"
			else
				if slot3.id == ChapterConst.StrategySubAutoAttack then
					slot4 = 1
					slot5 = (slot2.subAutoAttack == 0 and "sub_dont_auto_attack") or "sub_auto_attack"
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
								pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
							slot0:displayStrategyInfo(slot0)
						end
					end
				end
			end, SFX_PANEL)

			if slot4 == 1 then
				setText(slot2:Find("nums"), "")
				setActive(slot2:Find("mask"), false)
				slot6(slot2:Find("selected"), setActive == slot3.id)
			else
				setText(slot2:Find("nums"), slot3.count)
				setActive(slot2:Find("mask"), slot3.count == 0)
				setActive(slot2:Find("selected"), false)
			end
		end

		return
	end)
	slot12:align(#slot10)

	slot3.anchoredPosition = Vector2(slot13(), slot3.anchoredPosition.y)

	onButton(slot0, slot4, function ()
		slot0.localScale.x = slot0.localScale.x * -1
		slot0.localScale = slot0.localScale

		shiftPanel(shiftPanel, slot2(), nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
	end, SFX_PANEL)

	return
end

function slot0.displayStrategyInfo(slot0, slot1)
	slot0.strategyPanel = slot0.strategyPanel or StrategyPanel.New(slot0.strategyInfo)

	slot0.strategyPanel:attach(slot0)
	slot0.strategyPanel:set(slot1)

	function slot0.strategyPanel.onConfirm()
		slot3 = pg.strategy_data_template[slot1.id]

		if not slot0.contextData.chapterVO.fleet:canUseStrategy(slot0.contextData.chapterVO.getDataType(slot0)) then
			return
		end

		slot4 = slot2:getNextStgUser(slot1.id)

		if slot3.type == ChapterConst.StgTypeForm then
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot4,
				arg1 = slot1.id
			})
		else
			if slot3.type == ChapterConst.StgTypeConsume then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpStrategy,
					id = slot4,
					arg1 = slot1.id
				})
			end
		end

		slot0:hideStrategyInfo()

		return
	end

	function slot0.strategyPanel.onCancel()
		slot0:hideStrategyInfo()

		return
	end

	return
end

function slot0.selectStrategyTarget(slot0, slot1, slot2)
	slot5 = slot0.contextData.chapterVO.fleet.line
	slot6 = {}

	if slot1.id == ChapterConst.StrategyAirStrike then
		slot6 = slot3:calcAreaCells(slot5.row, slot5.column, slot1.arg[2], slot1.arg[3])
	else
		if slot1.id == ChapterConst.StrategyCannon then
			slot6 = slot3:calcAreaCells(slot5.row, slot5.column, 0, slot1.arg[2])
		end
	end

	_.each(slot6, function (slot0)
		slot0.grid:shiningTarget(slot0.row, slot0.column, true)

		return
	end)
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, _.filter(slot6, function (slot0)
		return not slot0:existFleet(nil, slot0.row, slot0.column)
	end), function (slot0)
		_.each(slot0, function (slot0)
			slot0.grid:shiningTarget(slot0.row, slot0.column, false)

			return
		end)

		if slot0 and _.any(slot0, function (slot0)
			return slot0.row == slot0.row and slot0.column == slot0.column
		end) and slot2:existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) then
			slot3(slot0.row, slot0.column)
		else
			slot1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end

		return
	end)

	return
end

function slot0.selectSquareBarrieredCell(slot0, slot1, slot2)
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, slot0.contextData.chapterVO.calcSquareBarrierCells(slot3, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column, slot1), function (slot0)
		if slot0 and _.any(slot0, function (slot0)
			return slot0.row == slot0.row and slot0.column == slot0.column
		end) then
			slot1(slot0.row, slot0.column)
		else
			slot2.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end

		return
	end)

	return
end

function slot0.hideStrategyInfo(slot0)
	if slot0.strategyPanel then
		slot0.strategyPanel:detach()
	end

	return
end

function slot0.updateStageFleet(slot0)
	slot2 = findTF(slot0.leftStage, "fleet")
	slot5 = slot0:findTF("fleet_info/number_list", slot0.topStage)

	setActive(slot3, false)
	setActive(slot4, false)
	_.each({
		1,
		2,
		3,
		4,
		5,
		6
	}, function (slot0)
		slot1(slot0:Find(slot0), slot0 == slot1.fleet.id)

		return
	end)
	slot6(slot2:Find("main"), slot0.contextData.chapterVO.fleet:getShipsByTeam(TeamType.Main, true))
	slot6(slot2:Find("vanguard"), slot0.contextData.chapterVO.fleet:getShipsByTeam(TeamType.Vanguard, true))
	slot0.contextData.chapterVO.fleet:clearShipHpChange()

	return
end

function slot0.displayRepairWindow(slot0, slot1)
	slot4 = getProxy(ChapterProxy)
	slot5, slot6, slot7, slot8 = nil

	if slot0.contextData.chapterVO.getDataType(slot2) == ChapterConst.TypeSham then
		slot5 = slot2.repairTimes
		slot6, slot7, slot8 = ChapterConst.GetShamRepairParams()
	else
		if slot3 == ChapterConst.TypeNone then
			slot5 = slot4.repairTimes
			slot6, slot7, slot8 = ChapterConst.GetRepairParams()
		end
	end

	slot0.repairPanel = slot0.repairPanel or RepairPanel.New(slot0.repairWindow)

	slot0.repairPanel:attach(slot0)
	slot0.repairPanel:set(slot5, slot6, slot7, slot8)

	function slot0.repairPanel.onConfirm()
		if slot0 - math.min(math.min, slot0) == 0 and slot2.player:getTotalGem() < slot3 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		slot2:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = slot4.fleet.id,
			arg1 = slot4.fleet.id.id
		})
		slot2:hideRepairWindow()

		return
	end

	function slot0.repairPanel.onCancel()
		slot0:hideRepairWindow()

		return
	end

	return
end

function slot0.hideRepairWindow(slot0)
	if slot0.repairPanel then
		slot0.repairPanel:detach()
	end

	return
end

function slot0.displayRemasterPanel(slot0)
	slot1 = getProxy(ChapterProxy)
	slot0.remasterPanel = slot0.remasterPanel or RemasterPanel.New(slot0.remasterWindow)

	slot0.remasterPanel:attach(slot0)

	slot2 = {}
	slot3 = pg.TimeMgr.GetInstance()

	for slot7, slot8 in ipairs(pg.re_map_template.all) do
		table.insert(slot2, pg.re_map_template[slot8])
	end

	slot0.remasterPanel:set(slot2, slot1.remasterTickets)

	function slot0.remasterPanel.onItem(slot0)
		slot0:setMap(pg.chapter_template[slot0.config_data[1]].map)
		slot0:hideRemasterPanel()

		return
	end

	function slot0.remasterPanel.onCancel()
		slot0:hideRemasterPanel()

		return
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.remasterPanel._tf)

	return
end

function slot0.hideRemasterPanel(slot0)
	if slot0.remasterPanel then
		slot0.remasterPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.remasterPanel._tf, slot0._tf)
		setParent(slot0.remasterPanel._tf, slot0.topPanel, false)
	end

	return
end

function slot0.initGrid(slot0)
	slot0.grid = LevelGrid.New(slot0.levelGrid)

	slot0.grid:attach(slot0)
	slot0.grid:setItems(slot0.shipTpl, slot0.subTpl, slot0.transportTpl, slot0.transportTargetTpl, slot0.enemyTpl, slot0.deadTpl, slot0.boxTpl, slot0.supplyTpl, slot0.rivalTpl, slot0.championTpl, slot0.spineTpl, slot0.oniTpl, slot0.oniTargetTpl, slot0.bombEnemyTpl, slot0.arrowTarget)

	function slot0.grid.onCellClick(slot0)
		slot0:clickGridCell(slot0)

		return
	end

	if slot0.contextData.chapterVO.getDataType(slot1) == ChapterConst.TypeNone then
		function slot0.grid.onShipStepChange(slot0)
			slot0:updateAmbushRate(slot0)

			return
		end
	end

	function slot0.grid.onShipArrived()
		slot0:overrideChapter()
		slot0:updateAmbushRate(slot0.overrideChapter.contextData.chapterVO.fleet.line, true)
		slot0:updateStageStrategy()

		return
	end

	slot0.grid:initAll()
	slot0:enableLevelCamera()

	return
end

function slot0.destroyGrid(slot0)
	if slot0.grid then
		slot0.grid:detach()

		slot0.grid = nil

		slot0:disableLevelCamera()
	end

	return
end

function slot0.clickGridCell(slot0, slot1)
	if not slot0:isfrozen() then
		slot3 = slot0.contextData.chapterVO.getDataType(slot2)
		slot5 = slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column)

		if _.detect(slot0.contextData.chapterVO.fleets, function (slot0)
			return slot0:getFleetType() == FleetType.Normal and slot0.line.row == slot0.row and slot0.line.column == slot0.column
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
									return slot0.row == slot0.row and slot0.column == slot0.column
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
	end

	return
end

function slot0.dispatchGuide(slot0)
	pg.GuideMgr2:GetInstance():dispatch({
		viewComponent = "LevelScene2",
		event = "CharMoveEnd"
	})

	return
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
			slot1:frozen()

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
				slot1:doTracking(slot2)
				coroutine.yield()
			end

			if not slot1.contextData.chapterVO then
				return
			end

			slot1:tryPlayChapterStory()
			slot1:updateTrait(ChapterConst.TraitVirgin)
			slot1.grid:updateAttachments()
			slot1.grid:updateChampions()
			slot1:updateTrait(ChapterConst.TraitNone)
			slot1:overrideChapter()
			Timer.New(slot2, 0.5, 1):Start()
			coroutine.yield()
			slot1:unfrozen()
		end

		if not slot1:doSafeCheck() then
			slot1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end

		slot1:dispatchUILoaded(true)

		return
	end)()

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
			return slot0:getFleetType() == FleetType.Transport
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
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
			if not (getProxy(ContextProxy):getContextByMediator(LevelMediator2) and slot6:getContextByMediator(ShamPreCombatMediator)) then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
		pg.GuideMgr:GetInstance():play("NG003")
	else
		if slot1.id == 1160002 then
			pg.GuideMgr:GetInstance():play("NG0011")
		else
			if slot1.id == 1200001 then
				pg.GuideMgr:GetInstance():play("NG0014")
			end
		end
	end

	return
end

function slot0.doTracking(slot0, slot1)
	slot0:frozen()

	function slot2()
		slot0.radar:SetActive(true)

		slot0 = tf(slot0.radar)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetSiblingIndex(1)
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)
			slot0.radar:SetActive(false)
			slot0:unfrozen()
			slot0.unfrozen()

			return
		end)
		playSoundEffect(SFX_UI_WEIGHANCHOR_SEARCH)

		return
	end

	if not slot0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function (slot0)
			slot0:SetActive(true)

			slot0.radar = slot0

			slot0()

			return
		end)
	else
		slot2()
	end

	return
end

function slot0.destroyTracking(slot0)
	if slot0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", slot0.radar)

		slot0.radar = nil
	end

	return
end

function slot0.doAmbushWarning(slot0, slot1)
	slot0:frozen()

	function slot2()
		slot0.ambushWarning:SetActive(true)

		slot0 = tf(slot0.ambushWarning)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetSiblingIndex(1)

		slot1 = slot0:GetComponent("DftAniEvent")

		slot1:SetTriggerEvent(function (slot0)
			slot0()

			return
		end)
		slot1:SetEndEvent(function (slot0)
			slot0.ambushWarning:SetActive(false)
			slot0:unfrozen()

			return
		end)
		playSoundEffect(SFX_UI_WARNING)
		Timer.New(function ()
			playSoundEffect(SFX_UI_WARNING)

			return
		end, 1, 1):Start()

		return
	end

	if not slot0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function (slot0)
			slot0:SetActive(true)

			slot0.ambushWarning = slot0

			slot0()

			return
		end)
	else
		slot2()
	end

	return
end

function slot0.destroyAmbushWarn(slot0)
	if slot0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", slot0.ambushWarning)

		slot0.ambushWarning = nil
	end

	return
end

function slot0.doPlayAirStrike(slot0, slot1, slot2, slot3)
	function slot4()
		slot0.playing = true

		slot0:frozen()
		slot0.frozen.airStrike:SetActive(true)

		slot0 = tf(slot0.airStrike)

		slot0:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot0:SetAsLastSibling()
		slot1(slot0:Find("words/be_striked"), setActive == ChapterConst.SubjectChampion)
		slot1(slot0:Find("words/strike_enemy"), setActive == ChapterConst.SubjectPlayer)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function ()
			slot0.playing = false

			SetActive(slot0.airStrike, false)

			if slot0.airStrike then
				slot1()
			end

			slot0:unfrozen()

			return
		end)

		if slot0.GetComponent("DftAniEvent").SetEndEvent then
			onButton(slot0, slot0, slot1, SFX_PANEL)
		else
			removeOnButton(slot0)
		end

		playSoundEffect(SFX_UI_WARNING)

		return
	end

	if not slot0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function (slot0)
			slot0:SetActive(true)

			slot0.airStrike = slot0

			slot0()

			return
		end)
	else
		slot4()
	end

	return
end

function slot0.destroyAirStrike(slot0)
	if slot0.airStrike then
		slot0.airStrike:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", slot0.airStrike)

		slot0.airStrike = nil
	end

	return
end

function slot0.doPlayAnim(slot0, slot1, slot2, slot3)
	slot0:frozen()

	slot0.uiAnims = slot0.uiAnims or {}

	function slot5()
		slot0.playing = true

		true:SetActive(true)

		if true then
			slot2(slot1)
		end

		slot0 = tf(slot1)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)
			slot0.playing = false

			slot0(false)
			slot0:unfrozen()

			return
		end)
		playSoundEffect(SFX_UI_WARNING)

		return
	end

	if not slot0.uiAnims[slot1] then
		PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
			slot0:SetActive(true)

			slot0.uiAnims[] = slot0
			slot2 = slot0.uiAnims[]

			true()

			return
		end)
	else
		slot5()
	end

	return
end

function slot0.destroyUIAnims(slot0)
	if slot0.uiAnims then
		for slot4, slot5 in pairs(slot0.uiAnims) do
			slot5:GetComponent("DftAniEvent").SetEndEvent(slot6, nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
		end

		slot0.uiAnims = nil
	end

	return
end

function slot0.doPlayTorpedo(slot0, slot1)
	function slot2()
		slot0.playing = true

		slot0:frozen()
		slot0.frozen.torpetoAni:SetActive(true)

		slot0 = tf(slot0.torpetoAni)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)
			slot0.playing = false

			SetActive(slot0.torpetoAni, false)

			if SetActive then
				slot1()
			end

			slot0:unfrozen()

			return
		end)
		playSoundEffect(SFX_UI_WARNING)

		return
	end

	if not slot0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function (slot0)
			slot0:SetActive(true)

			slot0.torpetoAni = slot0

			slot0()

			return
		end)
	else
		slot2()
	end

	return
end

function slot0.destroyTorpedo(slot0)
	if slot0.torpetoAni then
		slot0.torpetoAni:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", slot0.torpetoAni)

		slot0.torpetoAni = nil
	end

	return
end

function slot0.doPlayStrikeAnim(slot0, slot1, slot2, slot3)
	slot0.strikeAnims = slot0.strikeAnims or {}
	slot4, slot5, slot6 = nil

	function slot7()
		if coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end

		return
	end

	slot6 = coroutine.create(function ()
		slot0.playing = true

		slot0:frozen()
		setActive(slot0, true)

		slot1 = tf(slot0)
		slot3 = findTF(slot1, "mask/painting")
		slot4 = findTF(slot1, "ship")

		setParent(slot2, slot3:Find("fitter"), false)
		setParent(slot3, slot4, false)
		setActive(slot4, false)
		setActive(slot2, false)
		slot1:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot5 = slot1:GetComponent("DftAniEvent")
		slot6 = slot3:GetComponent("SpineAnimUI")

		slot5:SetStartEvent(function (slot0)
			slot0:SetAction("attack", 0)

			slot0.SetAction.freeze = true

			return
		end)
		slot5:SetTriggerEvent(function (slot0)
			slot0.freeze = false

			slot0:SetActionCallBack(function (slot0)
				if slot0 == "action" then
				else
					if slot0 == "finish" then
						slot0.freeze = true
					end
				end

				return
			end)

			return
		end)
		slot5:SetEndEvent(function (slot0)
			slot0.freeze = false

			slot0()

			return
		end)
		onButton(slot0, slot1, slot4, SFX_CANCEL)
		coroutine.yield()

		slot6:GetComponent("SkeletonGraphic").freeze = false

		retPaintingPrefab(slot3, slot5:getPainting())
		PoolMgr.GetInstance():ReturnSpineChar(slot5:getPrefab(), slot3)
		setActive(slot0, false)

		slot0.playing = false

		slot0:unfrozen()

		if slot6 then
			slot6()
		end

		return
	end)

	function slot8()
		if slot0.strikeAnims[slot1] and slot2 and slot3 then
			slot4()
		end

		return
	end

	PoolMgr.GetInstance():GetPainting(slot1:getPainting(), true, function (slot0)
		slot0 = slot0

		slot1()

		return
	end)
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)
		slot0.transform.localScale = Vector3.one

		slot0.transform()

		return
	end)

	if not slot0.strikeAnims[slot2] then
		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)
			slot0.strikeAnims[] = slot0

			slot0.strikeAnims()

			return
		end)
	end

	return
end

function slot0.destroyStrikeAnim(slot0)
	if slot0.strikeAnims then
		for slot4, slot5 in pairs(slot0.strikeAnims) do
			slot5:GetComponent("DftAniEvent").SetEndEvent(slot6, nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
		end

		slot0.strikeAnims = nil
	end

	return
end

function slot0.doSignalSearch(slot0, slot1)
	slot0:frozen()

	function slot2()
		slot0.playing = true

		slot0.signalAni:SetActive(true)

		slot0 = tf(slot0.signalAni)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)
			slot0.playing = false

			SetActive(slot0.signalAni, false)

			if SetActive then
				slot1()
			end

			slot0:unfrozen()

			return
		end)
		playSoundEffect(SFX_UI_WARNING)

		return
	end

	if not slot0.signalAni then
		PoolMgr.GetInstance():GetUI("SignalUI", true, function (slot0)
			slot0:SetActive(true)

			slot0.signalAni = slot0

			slot0()

			return
		end)
	else
		slot2()
	end

	return
end

function slot0.destroySignalSearch(slot0)
	if slot0.signalAni then
		slot0.signalAni:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("SignalUI", slot0.signalAni)

		slot0.signalAni = nil
	end

	return
end

function slot0.doPlayCommander(slot0, slot1, slot2)
	slot0:frozen()
	setActive(slot0.commanderTinkle, true)
	setText(slot0.commanderTinkle:Find("name"), (#slot1:getSkills() > 0 and slot3[1]:getConfig("name")) or "")
	setImageSprite(slot0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. slot1:getConfig("painting"), ""))

	slot0.commanderTinkle:GetComponent(typeof(CanvasGroup)).alpha = 0
	slot5 = Vector2(248, 237)

	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
		slot0.commanderTinkle.localPosition.x = slot1.x + -100 * (1 - slot0)
		slot0.commanderTinkle.localPosition = slot0.commanderTinkle.localPosition
		slot0.commanderTinkle.alpha = slot0

		return
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function (slot0)
		slot0.commanderTinkle.localPosition.x = slot1.x + 100 * slot0
		slot0.commanderTinkle.localPosition = slot0.commanderTinkle.localPosition
		slot0.commanderTinkle.alpha = 1 - slot0

		return
	end)):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end

		slot1:unfrozen()

		return
	end))

	return
end

function slot0.strikeEnemy(slot0, slot1, slot2, slot3)
	slot0:frozen()

	slot0.damageText.position = slot0.uiCam:ScreenToWorldPoint(slot5)
	slot0.damageText.localPosition.y = slot0.damageText.localPosition.y + 40
	slot0.damageText.localPosition.z = 0

	slot0:easeDamage(slot0.damageText.localPosition, slot2, function ()
		slot0:unfrozen()
		slot0()

		return
	end)

	return
end

function slot0.easeDamage(slot0, slot1, slot2, slot3)
	slot0:frozen()
	setText(slot0.damageText, slot2)
	setActive(slot0.damageText, true)

	slot0.damageText.localPosition = slot1

	LeanTween.value(go(slot0.damageText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		slot0.damageText.localPosition.y = slot1.y + 60 * slot0
		slot0.damageText.localPosition = slot0.damageText.localPosition

		setTextAlpha(slot0.damageText, 1 - slot0)

		return
	end)):setOnComplete(System.Action(function ()
		setActive(slot0.damageText, false)
		setActive:unfrozen()

		if setActive then
			slot1()
		end

		return
	end))

	return
end

function slot0.easeAvoid(slot0, slot1, slot2)
	slot0:frozen()

	slot0.avoidText.position = slot0.uiCam:ScreenToWorldPoint(slot3)
	slot0.avoidText.localPosition.z = 0
	slot0.avoidText.localPosition = slot0.avoidText.localPosition

	setActive(slot0.avoidText, true)

	slot5 = slot0.avoidText:Find("avoid")

	LeanTween.value(go(slot0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		slot0.avoidText.localPosition.y = slot1.y + 100 * slot0
		slot0.avoidText.localPosition = slot0.avoidText.localPosition

		setImageAlpha(slot0.avoidText, 1 - slot0)
		setImageAlpha(setImageAlpha, 1 - slot0)

		return
	end)):setOnComplete(System.Action(function ()
		setActive(slot0.avoidText, false)
		setActive:unfrozen()

		if setActive then
			slot1()
		end

		return
	end))

	return
end

function slot0.easeMoveDown(slot0, slot1, slot2)
	slot0:frozen()

	slot0.moveDownText.position = slot0.uiCam:ScreenToWorldPoint(slot3)
	slot0.moveDownText.localPosition.y = slot0.moveDownText.localPosition.y + 100
	slot0.moveDownText.localPosition.z = 0
	slot0.moveDownText.localPosition = slot0.moveDownText.localPosition

	setActive(slot0.moveDownText, true)
	LeanTween.value(go(slot0.moveDownText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		slot0.moveDownText.localPosition.y = slot1.y - 100 * slot0
		slot0.moveDownText.localPosition = slot0.moveDownText.localPosition

		setImageAlpha(slot0.moveDownText, 1 - slot0)

		return
	end)):setOnComplete(System.Action(function ()
		setActive(slot0.moveDownText, false)
		setActive:unfrozen()

		if setActive then
			slot1()
		end

		return
	end))

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

function slot0.overrideChapter(slot0)
	slot0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)

	return
end

function slot0.onSubLayerOpen(slot0)
	setActive(slot0.topPanel, false)
	slot0:disableLevelCamera()

	slot0.visibilityForPreCombat = {
		leftChapter = isActive(slot0.leftChapter),
		rightChapter = isActive(slot0.rightChapter),
		clouds = isActive(slot0.clouds),
		chapters = isActive(slot0.chapters)
	}

	for slot4, slot5 in pairs(slot0.visibilityForPreCombat) do
		setActive(slot0[slot4], false)
	end

	slot2 = slot0.contextData.map.getConfig(slot1, "bg")

	if slot0.tornadoTF and slot2 and #slot2 > 0 then
		setActive(slot0.tornadoTF, false)
	end

	slot0.isSubLayerOpen = true

	return
end

function slot0.onSubLayerClose(slot0)
	if not slot0.exited then
		slot0:enableLevelCamera()

		if #getProxy(ContextProxy).getContextByMediator(slot1, LevelMediator2).children == 0 then
			setActive(slot0.topPanel, true)

			if slot0.visibilityForPreCombat then
				for slot6, slot7 in pairs(slot0.visibilityForPreCombat) do
					setActive(slot0[slot6], slot7)
				end

				slot0.visibilityForPreCombat = nil
			end
		end
	end

	if slot0.tornadoTF and slot0.contextData.map:getConfig("animtor") == 1 then
		setActive(slot0.tornadoTF, true)
	end

	slot0.isSubLayerOpen = nil

	return
end

function slot0.onSubLayerContextChange(slot0)
	slot0.visibilityForPreCombat = nil

	return
end

function slot0.popStageStrategy(slot0)
	if slot0:findTF("event/arrow", slot0.rightStage).Find(slot1, "arr").localScale.x == 1 then
		triggerButton(slot1)
	end

	return
end

function slot0.resetLevelGrid(slot0)
	slot0.levelGrid.localPosition = Vector3.zero

	return
end

function slot0.frozen(slot0, slot1)
	if slot1 then
		slot0.fcall = slot1
	end

	slot0.frozenCount = slot0.frozenCount + 1
	slot0.canvasGroup.blocksRaycasts = slot0.frozenCount == 0

	return
end

function slot0.unfrozen(slot0)
	if slot0.exited then
		return
	end

	slot0.frozenCount = slot0.frozenCount - 1
	slot0.canvasGroup.blocksRaycasts = slot0.frozenCount == 0

	if slot0.frozenCount == 0 and slot0.fcall then
		slot0.fcall = nil

		slot0.fcall()
	end

	return
end

function slot0.isfrozen(slot0)
	return slot0.frozenCount > 0
end

function slot0.enableLevelCamera(slot0)
	slot0.levelCamIndices = math.max(slot0.levelCamIndices - 1, 0)

	if slot0.levelCamIndices == 0 then
		slot0.levelCam.enabled = true
	end

	return
end

function slot0.disableLevelCamera(slot0)
	slot0.levelCamIndices = slot0.levelCamIndices + 1

	if slot0.levelCamIndices > 0 then
		slot0.levelCam.enabled = false
	end

	return
end

function slot0.RecordTween(slot0, slot1, slot2)
	slot0.tweens[slot1] = slot2

	return
end

function slot0.DeleteTween(slot0, slot1)
	if slot0.tweens[slot1] then
		LeanTween.cancel(slot2)

		slot0.tweens[slot1] = nil
	end

	return
end

function slot0.triggerCommanderPanel(slot0)
	if slot0.contextData.commanderSelected then
		slot0:displayFleetSelect(slot3)
		slot0:openCommanderPanel(slot0.fleets[slot0.contextData.commanderSelected.fleetId], slot0.contextData.commanderSelected.chapterId)

		slot0.contextData.commanderSelected = nil
	else
		if slot0.contextData.eliteCommanderSelected then
			slot0:openCommanderPanel(slot0.contextData.map:getChapter(slot2).wrapEliteFleet(slot3, slot1), slot0.contextData.eliteCommanderSelected.chapterId, slot0.contextData.eliteCommanderSelected.index)

			slot0.contextData.eliteCommanderSelected = nil
		end
	end

	return
end

function slot0.openCommanderPanel(slot0, slot1, slot2, slot3)
	slot4 = nil

	slot0.commanderFormationPanel:update(slot1, (slot3 or function (slot0)
		slot0.contextData.commanderSelected = {
			chapterId = slot1,
			fleetId = slot2.id
		}

		slot0:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0, slot2.id)

		return
	end) and function (slot0)
		slot0.contextData.eliteCommanderSelected = {
			index = slot1,
			pos = slot0,
			chapterId = 
		}

		slot0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, slot0.emit, slot0, slot0)

		return
	end)
	slot0.commanderFormationPanel:open()

	return
end

function slot0.closeCommanderPanel(slot0)
	slot0.commanderFormationPanel:close()

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

function slot0.willExit(slot0)
	if slot0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
	end

	if slot0.commanderFormationPanel then
		slot0.commanderFormationPanel:detach()
	end

	slot0:hideChapterPanel()
	slot0:hideFleetSelect()
	slot0:hideFleetEdit()
	slot0:hideRepairWindow()
	slot0:hideStrategyInfo()
	slot0:hideSignalPanel()
	slot0:hideRemasterPanel()
	slot0:hideSpResult()
	slot0:hideBombResult()
	slot0:destroyGrid()
	slot0:destroyAmbushWarn()
	slot0:destroyAirStrike()
	slot0:destroyTorpedo()
	slot0:destroyStrikeAnim()
	slot0:destroyTracking()
	slot0:destroyCloudAnimator()
	slot0:destroyUIAnims()

	for slot4, slot5 in pairs(slot0.mapItemTimer) do
		if slot5 then
			slot5:Stop()
		end
	end

	slot0.mapItemTimer = nil

	for slot4, slot5 in pairs(slot0.tweens) do
		LeanTween.cancel(slot5)
	end

	slot0.tweens = nil

	if slot0.stageTimer then
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
	end

	if slot0.cloudTimer then
		slot0.cloudTimer:Stop()

		slot0.cloudTimer = nil
	end

	if slot0.newChapterCDTimer then
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end

	if slot0.resPanel1 then
		slot0.resPanel1:exit()

		slot0.resPanel1 = nil
	end

	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:clear()
	end

	LeanTween.cancel(go(slot0.damageText))

	slot0.map.localScale = Vector3.one
	slot0.map.pivot = Vector2.New(0.5, 0.5)
	slot0.float.localScale = Vector3.one
	slot0.float.pivot = Vector2.New(0.5, 0.5)

	clearImageSprite(slot0.map)
	_.each(slot0.cloudRTFs, function (slot0)
		clearImageSprite(slot0)

		return
	end)

	slot1 = getProxy(ChapterProxy)

	if not slot0.contextData.map:isActivity() and not slot2:isSham() and not slot2:isGuildBoss() and not slot2:isEscort() then
		slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
	end

	if Map.lastMapForActivity then
		slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
	end

	return
end

return slot0
