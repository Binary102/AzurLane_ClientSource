slot0 = class("LevelMediator2", import("..base.ContextMediator"))
slot0.ON_TRACKING = "LevelMediator2:ON_TRACKING"
slot0.ON_ELITE_TRACKING = "LevelMediator2:ON_ELITE_TRACKING"
slot0.ON_UPDATE_CUSTOM_FLEET = "LevelMediator2:ON_UPDATE_CUSTOM_FLEET"
slot0.ON_OP = "LevelMediator2:ON_OP"
slot0.ON_STAGE = "LevelMediator2:ON_STAGE"
slot0.ON_PVP = "LevelMediator2:ON_PVP"
slot0.ON_GO_TO_TASK_SCENE = "LevelMediator2:ON_GO_TO_TASK_SCENE"
slot0.ON_OPEN_EVENT_SCENE = "LevelMediator2:ON_OPEN_EVENT_SCENE"
slot0.ON_DAILY_LEVEL = "LevelMediator2:ON_DAILY_LEVEL"
slot0.ON_OPEN_MILITARYEXERCISE = "LevelMediator2:ON_OPEN_MILLITARYEXERCISE"
slot0.ON_OVERRIDE_CHAPTER = "LevelMediator2:ON_OVERRIDE_CHAPTER"
slot0.ON_TIME_UP = "LevelMediator2:ON_TIME_UP"
slot0.ON_EVENT_LIST_UPDATE = "LevelMediator2:ON_EVENT_LIST_UPDATE"
slot0.ON_OPEN_SHAM = "LevelMediator2:ON_OPEN_SHAM"
slot0.ON_OPEN_SHAM_PRE_COMABT = "LevelMediator2:ON_OPEN_SHAM_PRE_COMABT"
slot0.ON_OPEN_SHAM_SHOP = "LevelMediator2.ON_OPEN_SHAM_SHOP"
slot0.ON_PERFORM_COMBAT = "LevelMediator2.ON_PERFORM_COMBAT"
slot0.ON_ELITE_OEPN_DECK = "LevelMediator2:ON_ELITE_OEPN_DECK"
slot0.ON_ELITE_CLEAR = "LevelMediator2:ON_ELITE_CLEAR"
slot0.ON_ELITE_RECOMMEND = "LevelMediator2:ON_ELITE_RECOMMEND"
slot0.ON_ACTIVITY_MAP = "LevelMediator2:ON_ACTIVITY_MAP"
slot0.ON_SWITCH_ACT_MAP = "LevelMediator2:ON_SWITCH_ACT_MAP"
slot0.GO_ACT_SHOP = "LevelMediator2:GO_ACT_SHOP"
slot0.ON_SWITCH_NORMAL_MAP = "LevelMediator2:ON_SWITCH_NORMAL_MAP"
slot0.NOTICE_AUTOBOT_ENABLED = "LevelMediator2:NOTICE_AUTOBOT_ENABLED"
slot0.ON_OPEN_GUILD_PRE_COMABT = "LevelMediator2:ON_OPEN_GUILD_PRE_COMABT"
slot0.ON_FLEET_SHIPINFO = "LevelMediator2:ON_FLEET_SHIPINFO"
slot0.ON_ENTER_EXTRA_CHAPTER = "LevelMediator2:ON_ENTER_EXTRA_CHAPTER"
slot0.ON_EXTRA_RANK = "LevelMediator2:ON_EXTRA_RANK"
slot0.ON_FETCH_ESCORT = "LevelMediator2:ON_FETCH_ESCORT"
slot0.ON_FETCH_SUB_CHAPTER = "LevelMediator2:ON_FETCH_SUB_CHAPTER"
slot0.ON_REFRESH_SUB_CHAPTER = "LevelMediator2:ON_REFRESH_SUB_CHAPTER"
slot0.ON_STRATEGYING_CHAPTER = "LevelMediator2:ON_STRATEGYING_CHAPTER"
slot0.ON_SELECT_COMMANDER = "LevelMediator2:ON_SELECT_COMMANDER"
slot0.ON_SELECT_ELITE_COMMANDER = "LevelMediator2:ON_SELECT_ELITE_COMMANDER"
slot0.ON_COMMANDER_SKILL = "LevelMediator2:ON_COMMANDER_SKILL"
slot0.ON_ACTIVATE_REMASTER = "LevelMediator2:ON_ACTIVATE_REMASTER"

function slot0.register(slot0)
	slot1 = getProxy(PlayerProxy)

	slot0:bind(slot0.ON_SELECT_COMMANDER, function (slot0, slot1, slot2)
		FormationMediator.onSelectCommander(slot1, slot2)
	end)
	slot0:bind(slot0.ON_SELECT_ELITE_COMMANDER, function (slot0, slot1, slot2, slot3)
		slot5 = getProxy(ChapterProxy).getChapterById(slot4, slot3)
		slot0.contextData.editEliteChapter = slot5
		slot7 = slot4:getSameMapChapters(slot5)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM, {
			maxCount = 1,
			mode = CommandRoomScene.MODE_SELECT,
			activeCommanderId = slot5:getEliteFleetCommanders()[slot1] or {}[slot2],
			ignoredIds = {},
			onCommander = function (slot0)
				return true
			end,
			onSelected = function (slot0, slot1)
				if slot0[slot1] ~= slot0[1] then
					slot3 = getProxy(CommanderProxy)
					slot6 = pairs
					slot7 = slot2:getFleetCommander(slot3, slot3:getCommanderById(slot2)) or {}

					for slot9, slot10 in slot6(slot7) do
						if slot3:getCommanderById(slot10).groupId == slot4.groupId and slot9 ~= slot1 then
							pg.TipsMgr:GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

							return
						end
					end
				end

				for slot7, slot8 in pairs(slot3) do
					for slot12, slot13 in pairs(slot8) do
						if slot2 == slot13 then
							pg.TipsMgr:GetInstance():ShowTips(i18n("commander_is_in_fleet_already"))

							return
						end
					end
				end

				for slot7, slot8 in pairs(slot5) do
					slot8:updateCommander(slot4, slot1, slot2)
					slot2:updateChapter(slot8)
				end

				slot6:updateCommander(slot6.updateCommander, slot1, slot2)
				slot2:updateChapter(slot6.updateCommander)
				slot1()
			end,
			onQuit = function (slot0)
				for slot4, slot5 in pairs(slot0) do
					slot5:updateCommander(slot1, slot2, nil)
					slot3:updateChapter(slot5)
				end

				slot4:updateCommander(slot4.updateCommander, slot4, nil)
				slot3:updateChapter(slot4)
				slot0()
			end
		})
	end)
	slot0:bind(slot0.ON_TRACKING, function (slot0, slot1, slot2)
		slot0:setFlag("lastFleetIndex", slot2)
		slot1:sendNotification(GAME.TRACKING, {
			chapterId = slot1,
			fleetIds = slot2
		})
		slot1.viewComponent:updateLastFleet(slot0:getFlag("lastFleetIndex"))
	end)
	slot0:bind(slot0.ON_UPDATE_CUSTOM_FLEET, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.UPDATE_CUSTOM_FLEET, {
			chapterId = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_ELITE_TRACKING, function (slot0, slot1)
		slot0:sendNotification(GAME.TRACKING, {
			chapterId = slot1
		})
	end)
	slot0:bind(slot0.ON_OP, function (slot0, slot1)
		if slot0.contextData.chapterVO.getDataType(slot2) == ChapterConst.TypeSham then
			slot0:sendNotification(GAME.SHAM_OP, slot1)
		elseif slot3 == ChapterConst.TypeNone then
			slot0:sendNotification(GAME.CHAPTER_OP, slot1)
		elseif slot3 == ChapterConst.TypeGuild then
			slot0:sendNotification(GAME.GUILD_OP, slot1)
		end
	end)
	slot0:bind(slot0.ON_SWITCH_NORMAL_MAP, function (slot0)
		slot1 = nil

		if Map.lastMap and slot0.viewComponent.maps[Map.lastMap] and not slot0.viewComponent.maps[Map.lastMap]:isEscort() then
			slot1 = Map.lastMap
		else
			for slot5, slot6 in pairs(slot0.viewComponent.maps) do
				if slot6:isUnlock() and slot6:getMapType() == Map.SCENARIO then
					slot1 = slot6.id
				end
			end
		end

		if slot1 then
			slot0.viewComponent:setMap(slot1)
		end
	end)
	slot0:bind(slot0.ON_STAGE, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ChapterPreCombatMediator,
			viewComponent = ChapterPreCombatLayer,
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_PVP, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = RivalInfoMediator,
			viewComponent = RivalInfoLayer,
			data = {
				rival = slot1,
				type = RivalInfoLayer.TYPE_SHAM
			},
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_OPEN_MILITARYEXERCISE, function ()
		if getProxy(ActivityProxy):getMilitaryExerciseActivity() then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.MILITARYEXERCISE)
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_notStartOrEnd"))
		end
	end)
	slot0:bind(slot0.ON_DAILY_LEVEL, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.DAILYLEVEL)
	end)
	slot0:bind(slot0.ON_GO_TO_TASK_SCENE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TASK)
	end)
	slot0:bind(slot0.ON_OPEN_EVENT_SCENE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	slot0:bind(slot0.ON_OPEN_SHAM, function ()
		if getProxy(ChapterProxy).getShamChapter(slot0).active then
			slot0.viewComponent:switchToChapter(slot1)
		else
			slot0.viewComponent:emit(slot1.ON_OPEN_SHAM_PRE_COMABT)
		end
	end)
	slot0:bind(slot0.ON_OPEN_SHAM_PRE_COMABT, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ShamPreCombatMediator,
			viewComponent = ShamPreCombatLayer,
			data = {
				shamChapter = getProxy(ChapterProxy).getShamChapter(slot1)
			},
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_OVERRIDE_CHAPTER, function ()
		slot2 = getProxy(ChapterProxy)

		if slot0.contextData.chapterVO.getDataType(slot0) == ChapterConst.TypeSham then
			slot2:updateShamChapter(slot0)
		elseif slot1 == ChapterConst.TypeNone then
			slot2:updateChapter(slot0)
		elseif slot1 == ChapterConst.TypeGuild then
			slot2:updateGuildChapter(slot0)
		end
	end)
	slot0:bind(slot0.ON_TIME_UP, function ()
		slot0:onTimeUp()
	end)
	slot0:bind(slot0.ON_EVENT_LIST_UPDATE, function ()
		slot0:OnEventUpdate()
	end)
	slot0:bind(slot0.ON_ELITE_CLEAR, function (slot0, slot1)
		slot1.chapterVO.clearEliterFleetByIndex(slot3, slot2)

		slot4 = getProxy(ChapterProxy)

		slot4:updateChapter(slot3)
		slot4:duplicateEliteFleet(slot3, true)
		slot0:duplicateEliteFleet(slot3)
		slot0.viewComponent:flushFleetEditButton(slot1.chapterVO)
	end)
	slot0:bind(slot0.NOTICE_AUTOBOT_ENABLED, function (slot0, slot1)
		slot0:sendNotification(GAME.COMMON_FLAG, {
			flagID = BATTLE_AUTO_ENABLED
		})
	end)
	slot0:bind(slot0.ON_ELITE_RECOMMEND, function (slot0, slot1)
		slot4 = getProxy(ChapterProxy)

		slot4:eliteFleetRecommend(slot3, slot2)
		slot4:updateChapter(slot3)
		slot4:duplicateEliteFleet(slot3, true)
		slot0:duplicateEliteFleet(slot3)
		slot0.viewComponent:flushFleetEditButton(slot1.chapterVO)
	end)
	slot0:bind(slot0.ON_ELITE_OEPN_DECK, function (slot0, slot1)
		slot2 = slot1.shipType

		if slot1.fleetIndex == 3 then
			slot2 = ShipType.Qianting
		end

		slot4 = slot1.shipVO
		slot5 = slot1.fleet
		slot6 = slot1.chapter
		slot7 = slot1.teamType
		slot10 = {}

		for slot14, slot15 in pairs(slot9) do
			if slot15:getTeamType() ~= slot7 then
				table.insert(slot10, slot14)
			elseif type(slot2) == "number" then
				if slot2 ~= 0 and not table.contains({
					slot2
				}, slot15:getShipType()) then
					table.insert(slot10, slot14)
				end
			elseif type(slot2) == "string" and not table.contains(Clone(ShipType.BundleList[slot2]), slot15:getShipType()) then
				table.insert(slot10, slot14)
			end
		end

		slot11, slot12 = nil

		if slot4 == nil then
			slot11 = false
			slot12 = nil
		else
			slot11 = true
			slot12 = slot4.id
		end

		slot0.contextData.editEliteChapter = slot6
		slot21.onShip, slot21.confirmSelect, slot21.onSelected = slot0:getDockCallbackFuncs(slot5, slot4, slot6, slot3)

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			selectedMax = 1,
			ignoredIds = slot10,
			activeShipId = slot12,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = slot11,
			leftTopInfo = i18n("word_formation"),
			onShip = slot14,
			confirmSelect = slot15,
			onSelected = slot16,
			flags = {
				inAdmiral = false,
				inEvent = true,
				inFleet = false,
				inClass = false,
				inTactics = false,
				inBackyard = false,
				inElite = slot6.id
			}
		})
	end)
	slot0:bind(slot0.ON_ACTIVITY_MAP, function ()
		slot0 = getProxy(ChapterProxy)
		slot5, slot2 = slot0:getLastMapForActivity()

		slot0.viewComponent:setMap(slot1)

		if slot2 then
			slot0.viewComponent:switchToChapter(slot0:getChapterById(slot2))
		end
	end)
	slot0:bind(slot0.ON_SWITCH_ACT_MAP, function (slot0, slot1, slot2)
		if getProxy(ChapterProxy):getUnlockActMapBytype(slot2, slot1) then
			slot0.viewComponent:setMap(slot3.id)
		end
	end)
	slot0:bind(slot0.ON_OPEN_SHAM_SHOP, function ()
		if getProxy(ChapterProxy).getShamShop(slot0):isOpen() then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, {
				warp = ShopsLayer.TYPE_SHAM_SHOP
			})
		end
	end)
	slot0:bind(slot0.ON_OPEN_GUILD_PRE_COMABT, function ()
		slot0 = getProxy(ChapterProxy)

		slot0:addSubLayers(Context.New({
			mediator = GuildPreCombatMediator,
			viewComponent = GuildPreCombatLayer,
			data = {
				guildChapter = slot0:getGuildChapter()
			},
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.GO_ACT_SHOP, function ()
		slot0, slot1 = nil
		slot2 = {}

		if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY) and not slot3:isEnd() then
			slot0 = LotteryMediator
			slot1 = LotteryLayer
			slot2 = {
				activityId = slot3.id
			}
		else
			slot0 = ShopsMediator
			slot1 = ShopsLayer
			slot2 = {
				warp = ShopsLayer.TYPE_ACTIVITY
			}
		end

		slot0:addSubLayers(Context.New({
			mediator = slot0,
			viewComponent = slot1,
			data = slot2,
			onRemoved = function ()
				slot0.viewComponent:onSubLayerClose()
			end
		}), false, function ()
			slot0.viewComponent:onSubLayerOpen()
		end)
	end)
	slot0:bind(slot0.ON_FLEET_SHIPINFO, function (slot0, slot1)
		if not slot1.shipInfoList or table.getCount(slot2) == 0 then
			return
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.shipVO.id,
			shipVOs = slot2
		})

		slot0.contextData.editEliteChapter = slot1.chapter
	end)
	slot0:bind(slot0.ON_ENTER_EXTRA_CHAPTER, function (slot0)
		if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot1:isEnd() then
			slot2 = getProxy(ChapterProxy)
			slot3 = ActivityLevelConst.getMapsByActivityType(slot0.viewComponent.maps, slot1:getConfig("type"))
			slot4 = ActivityLevelConst.hasExtraMap(slot3)
			slot8 = (slot0.contextData.map:existHardMap() and ActivityLevelConst.isClearMaps(slot3, Map.ACTIVITY_HARD)) or (not slot5 and ActivityLevelConst.isClearMaps(slot3, Map.ACTIVITY_EASY))

			if slot4 and slot8 then
				slot9 = slot2:getUnlockActMapBytype(Map.ACT_EXTRA, slot4:getConfig("on_activity"))

				slot0.viewComponent:setMap(slot9.id)

				if slot9:getActiveChapter() then
					slot0.viewComponent:switchToChapter(slot10)
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n((slot5 and "extra_chapter_locked_tip") or "extra_chapter_locked_tip_1"))
			end
		end
	end)
	slot0:bind(slot0.ON_EXTRA_RANK, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			index = BillboardLayer.PAGE_EXTRA_CHAPTER,
			view = slot0.viewComponent.__cname
		})
	end)
	slot0:bind(slot0.ON_FETCH_ESCORT, function (slot0)
		slot0:sendNotification(GAME.ESCORT_FETCH)
	end)
	slot0:bind(slot0.ON_REFRESH_SUB_CHAPTER, function (slot0)
		slot0:sendNotification(GAME.SUB_CHAPTER_REFRESH)
	end)
	slot0:bind(slot0.ON_FETCH_SUB_CHAPTER, function (slot0)
		slot0:sendNotification(GAME.SUB_CHAPTER_FETCH)
	end)
	slot0:bind(slot0.ON_STRATEGYING_CHAPTER, function (slot0)
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			yesText = "text_go",
			content = i18n("levelScene_chapter_is_activation", getProxy(ChapterProxy):getActiveChapter():getConfig("chapter_name")),
			onYes = function ()
				slot0.viewComponent:switchToChapter(slot0.viewComponent)
			end,
			onNo = function ()
				slot0.contextData.chapterVO = slot1

				slot0.contextData.viewComponent:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat,
					exittype = ChapterConst.ExitFromMap
				})
			end,
			onClose = function ()
				return
			end,
			noBtnType = pg.MsgboxMgr.BUTTON_RETREAT
		})
	end)
	slot0:bind(slot0.ON_COMMANDER_SKILL, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = slot1
			}
		}))
	end)
	slot0:bind(slot0.ON_ACTIVATE_REMASTER, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.ACTIVATE_REMASTER, {
			id = slot1,
			callback = slot2
		})
	end)
	slot0:bind(slot0.ON_PERFORM_COMBAT, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = slot1,
			exitCallback = slot2
		})
	end)

	slot0.player = slot1:getData()

	slot0.viewComponent:updateRes(slot0.player)
	slot0.viewComponent:updateLastFleet(slot1:getFlag("lastFleetIndex"))
	slot0.viewComponent:updateEvent(slot2)
	slot0.viewComponent:updateFleet(slot4)
	slot0:sendNotification(GAME.SET_SHIP_FLAG, {
		shipsById = getProxy(BayProxy).getRawData(slot5),
		flags = {
			inEvent = true
		}
	})

	slot7 = getProxy(ActivityProxy)

	slot0.viewComponent:updateEventActivityStyle(slot8)
	slot0.viewComponent:updateBattleActivitys(slot9)

	for slot14, slot15 in ipairs(slot10) do
		if slot15:getConfig("config_id") == pg.gameset.activity_res_id.key_value then
			slot0.viewComponent:updatePtActivity(slot15)

			break
		end
	end

	slot0.viewComponent:setEliteQuota(getProxy(DailyLevelProxy).eliteCount, pg.gameset.elite_quota.key_value)

	slot12 = getProxy(ChapterProxy)

	slot12:updateActiveChapterShips()
	slot12:updateShamChapterShips()
	slot12:updateGuildChapterShips()
	slot0.viewComponent:updateSubInfo(slot12.subRefreshCount, slot12.subProgress)

	slot13 = slot0.viewComponent.maps
	slot14 = slot0.contextData.mapIdx
	slot15 = slot0.contextData.chapterId
	slot17 = ChapterConst.TypeNone

	if slot0.contextData.chapterVO then
		slot17 = slot16:getDataType()
	end

	if slot17 == ChapterConst.TypeSham then
		slot0.contextData.chapterVO = slot12:getShamChapter()
	elseif slot17 == ChapterConst.TypeGuild then
		slot0.contextData.chapterVO = slot12:getGuildChapter()
	elseif slot17 == ChapterConst.TypeNone and slot15 and slot13[slot14] then
		slot0.contextData.chapterVO = slot18:getChapter(slot15)
	end

	slot0.viewComponent:setMaps(slot13)

	if slot0.contextData.chapterVO and slot16.active then
		slot0.contextData.isSwitchToChapter = true

		slot0.viewComponent:switchToChapter(slot16, function ()
			slot0:OnSwitchChapterDone()
		end)
	end
end

function slot0.OnSwitchChapterDone(slot0)
	slot0.viewComponent:tryPlaySubGuide()
end

function slot0.listNotificationInterests(slot0)
	return {
		ChapterProxy.CHAPTER_ADDED,
		ChapterProxy.CHAPTER_UPDATED,
		ChapterProxy.CHAPTER_TIMESUP,
		ChapterProxy.SHAM_CHAPTER_UPDATED,
		ChapterProxy.GUILD_CHAPTER_UPDATED,
		PlayerProxy.UPDATED,
		DailyLevelProxy.ELITE_QUOTA_UPDATE,
		GAME.TRACKING_DONE,
		GAME.CHAPTER_OP_DONE,
		GAME.EVENT_LIST_UPDATE,
		GAME.SET_SHIP_FLAG_DONE,
		GAME.SHAM_ENTER_DONE,
		GAME.SHAM_OP_DONE,
		GAME.GUILD_OP_DONE,
		GAME.MILITARY_STARTED,
		GAME.BEGIN_STAGE_DONE,
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.ACTIVITY_BOSS_MSG_ADDED,
		GAME.ESCORT_FETCH_DONE,
		GAME.SUB_CHAPTER_REFRESH_DONE,
		GAME.SUB_CHAPTER_FETCH_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:updateRes(slot3)
	elseif slot2 == GAME.TRACKING_DONE or slot2 == GAME.SHAM_ENTER_DONE then
		slot0.viewComponent:resetLevelGrid()
		slot0.viewComponent:switchToChapter(slot3, function ()
			slot0:loadSubState(slot1.subAutoAttack)
		end)
	elseif slot2 == ChapterProxy.CHAPTER_UPDATED then
		slot0.viewComponent:updateChapterVO(slot3.chapter, slot3.dirty)
	elseif slot2 == ChapterProxy.CHAPTER_ADDED then
		slot0.viewComponent:updateChapterVO(slot3.chapter, 0)
	elseif slot2 == ChapterProxy.SHAM_CHAPTER_UPDATED then
		slot0.viewComponent:updateChapterVO(slot3.shamChapter, slot3.dirty)
	elseif slot2 == ChapterProxy.GUILD_CHAPTER_UPDATED then
		slot0.viewComponent:updateChapterVO(slot3.guildChapter, slot3.dirty)
	else
		if slot2 == GAME.CHAPTER_OP_DONE or slot2 == GAME.SHAM_OP_DONE or slot2 == GAME.GUILD_OP_DONE then
			slot4 = nil
			slot4 = coroutine.create(function ()
				slot1 = slot1.contextData.chapterVO

				if slot0.type == ChapterConst.OpRetreat and slot1:existOni() and slot1:checkOniState() then
					slot1.viewComponent:displaySpResult(slot2, slot2)
					coroutine.yield()
				end

				if slot0 == ChapterConst.OpRetreat and slot1:isPlayingWithBombEnemy() then
					slot1.viewComponent:displayBombResult(slot1.viewComponent.displayBombResult)
					coroutine.yield()
				end

				if slot0.items and #slot2 > 0 then
					if slot0 == ChapterConst.OpRetreat and slot1.contextData.map:isEscort() then
						slot1.viewComponent:emit(BaseUI.ON_AWARD, {
							items = slot2
						}, AwardInfoLayer.TITLE.ESCORT, slot2)
					else
						slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot2, function ()
							if _.any(_.any, function (slot0)
								return slot0.type == DROP_TYPE_STRATEGY
							end) then
								slot1.viewComponent:popStageStrategy()
							end

							slot2()
						end)
					end

					coroutine.yield()
				end

				slot3 = slot1.contextData.chapterVO

				if slot0 == ChapterConst.OpRetreat and slot0.exittype and slot0.exittype == ChapterConst.ExitFromMap then
					slot1.contextData.chapterVO = nil

					slot1.viewComponent:updateChapterTF(slot3.id)

					return
				end

				if slot0 == ChapterConst.OpSkipBattle then
					slot1.viewComponent:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpRetreat then
					if slot3:getDataType() == ChapterConst.TypeGuild then
						slot1.viewComponent:emit(BaseUI.ON_BACK)

						return
					end

					if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
						slot5 = {}

						if slot4:getContextByMediator(ChapterPreCombatMediator) then
							table.insert(slot5, slot6)
						end

						if slot4:getContextByMediator(RivalInfoMediator) then
							table.insert(slot5, slot7)
						end

						_.each(slot5, function (slot0)
							slot0:sendNotification(GAME.REMOVE_LAYERS, {
								context = slot0
							})
						end)
					end

					if slot0.id then
						return
					end

					if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN) and not slot6.autoActionForbidden and not slot6.achieved and slot6.data1 == 7 and slot3.id == 204 and slot3:isClear() then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							modal = true,
							hideNo = true,
							content = "有新的签到奖励可以领取，点击确定前往",
							onYes = function ()
								slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
							end,
							onNo = function ()
								slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)
							end
						})

						return
					end

					slot1.viewComponent:switchToMap()

					if slot3 == GAME.SHAM_OP_DONE and not slot4:getContextByMediator(ShamPreCombatMediator) then
						slot1.viewComponent:emit(slot4.ON_OPEN_SHAM_PRE_COMABT)
					end

					if Map.autoNextPage then
						Map.autoNextPage = nil

						triggerButton(slot1.viewComponent.btnNext)
					end
				elseif slot0 == ChapterConst.OpMove then
					seriesAsync({
						function (slot0)
							slot0.viewComponent.grid:moveFleet(slot1.path, slot1.fullpath, slot0)
						end,
						function (slot0)
							if slot0.aiActs then
								slot1:playAIActions(slot0.aiActs, slot0)
							else
								slot0()
							end
						end
					}, function ()
						if _.any(slot1.contextData.chapterVO:getFleetStgs(slot0.fleet), function (slot0)
							return slot0.id == ChapterConst.StrategyExchange and slot0.count > 0
						end) then
							slot1.viewComponent:popStageStrategy()
						end

						slot1.viewComponent:updateBombPanel()
						slot1.viewComponent.updateBombPanel.viewComponent:tryAutoTrigger()
						slot1.viewComponent.updateBombPanel.viewComponent.tryAutoTrigger.viewComponent:dispatchGuide()
					end)
				elseif slot0 == ChapterConst.OpAmbush then
					slot1.viewComponent:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpBox then
					if pg.box_data_template[slot3:getChapterCell(slot3.fleet.line.row, slot3.fleet.line.column).attachmentId].type == ChapterConst.BoxAirStrike then
						slot1.viewComponent:doPlayAirStrike(ChapterConst.SubjectChampion, false, slot2)
						coroutine.yield()

						if slot0.aiActs and #slot0.aiActs > 0 then
							slot1.viewComponent:doPlayCommander(slot8, slot2)
							coroutine.yield()
							slot1.viewComponent:easeAvoid(slot1.viewComponent.grid.cellFleets[slot3.findex].tf.position, slot2)
							coroutine.yield()
						end
					elseif slot6.type == ChapterConst.BoxTorpedo then
						if slot3.fleet:canClearTorpedo() then
							pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_destroy_torpedo"))
						else
							slot1.viewComponent:doPlayTorpedo(slot2)
							coroutine.yield()
						end
					end

					slot1.viewComponent:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpStory then
					slot1.viewComponent:tryAutoTrigger()
				elseif slot0 == ChapterConst.OpSwitch then
					slot1.viewComponent.grid:adjustCameraFocus()
				elseif slot0 == ChapterConst.OpEnemyRound then
					slot1:playAIActions(slot0.aiActs, function ()
						slot0.contextData.chapterVO.roundIndex = slot0.contextData.chapterVO.roundIndex + 1

						getProxy(ChapterProxy).updateChapter(slot1, slot0)
						slot0.viewComponent:updateBombPanel(true)
						slot0.viewComponent:tryAutoTrigger()
					end)
				elseif slot0 == ChapterConst.OpSubState then
					slot1:saveSubState(slot3.subAutoAttack)
				elseif slot0 == ChapterConst.OpStrategy then
					if slot0.arg1 == ChapterConst.StrategyExchange then
						for slot9, slot10 in ipairs(slot5) do
							if slot10:GetType() == FleetSkill.TypeStrategy and slot10:GetArgs()[1] == ChapterConst.StrategyExchange then
								slot1.viewComponent:doPlayCommander(slot3.fleet:findCommanderBySkillId(slot10.id))

								break
							end
						end
					end
				elseif slot0 == ChapterConst.OpBarrier then
					slot1.viewComponent:tryAutoTrigger()
				end
			end)

			function ()
				if coroutine.status(coroutine.status) == "suspended" then
					slot0, slot1 = coroutine.resume(coroutine.resume)
				end
			end()

			return
		end

		if slot2 == ChapterProxy.CHAPTER_TIMESUP then
			slot0:onTimeUp()
		elseif slot2 == GAME.EVENT_LIST_UPDATE then
			slot0:OnEventUpdate()
		elseif slot2 == GAME.SET_SHIP_FLAG_DONE then
			slot0.viewComponent:setShips(slot3.shipsById)
		elseif slot2 == DailyLevelProxy.ELITE_QUOTA_UPDATE then
			slot0.viewComponent:setEliteQuota(getProxy(DailyLevelProxy).eliteCount, pg.gameset.elite_quota.key_value)
		elseif slot2 == GAME.MILITARY_STARTED then
			slot0.viewComponent:emit(slot0.ON_OPEN_SHAM_PRE_COMABT)
		elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE then
			slot4 = getProxy(ActivityProxy):getActivityById(slot3)
		elseif slot2 == ActivityProxy.ACTIVITY_UPDATED then
			if slot3 and slot3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_RANK then
				slot0.viewComponent:updatePtActivity(slot3)
			end
		elseif slot2 == GAME.ACTIVITY_BOSS_MSG_ADDED then
			slot4 = getProxy(ActivityProxy)
		elseif slot2 == GAME.ESCORT_FETCH_DONE then
			if slot0.contextData.chapterVO then
				slot0.viewComponent:switchToMap()
			elseif not slot0.contextData.map:isEscort() then
				slot0.viewComponent:setMap(getProxy(ChapterProxy).escortMaps[1].id)
			else
				slot0.viewComponent:updateMap()
			end
		elseif slot2 == GAME.SUB_CHAPTER_REFRESH_DONE then
			slot4 = slot3
			slot5 = nil
			slot5 = coroutine.create(function ()
				slot0 = getProxy(ChapterProxy)

				slot0.viewComponent:updateSubInfo(slot0.subRefreshCount, slot0.subProgress)
				slot0.viewComponent:doSignalSearch(slot0.viewComponent.doSignalSearch)
				coroutine.yield()

				if slot0:getChapterById(slot2.id) then
					slot1.expireTime = slot2.expireTime
					slot1.awardIndex = slot2.expireTime.awardIndex

					slot0:updateChapter(slot1)
				else
					slot0:addChapter(slot0.addChapter)
				end

				if slot0.contextData.map.id ~= slot2:getConfig("map") then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("levelScene_jump_to_sub_confirm", pg.expedition_data_by_map[slot2].name, slot2),
						onYes = function ()
							slot0.viewComponent:setMap(slot0.viewComponent)
						end
					})
				end
			end)

			function ()
				if coroutine.status(coroutine.status) == "suspended" then
					slot0, slot1 = coroutine.resume(coroutine.resume)
				end
			end()
		elseif slot2 == GAME.SUB_CHAPTER_FETCH_DONE then
			if slot0.contextData.chapterVO then
				slot0.viewComponent:switchToMap()
			else
				slot0.viewComponent:updateMap()
			end
		end
	end
end

function slot0.OnEventUpdate(slot0)
	slot0.viewComponent:updateEvent(slot1)

	slot2, slot3 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "EventMediator")

	if slot2 and slot1.eventForMsg then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = false,
			hideNo = true,
			content = i18n("event_special_update", (pg.collection_template[slot1.eventForMsg.id or 0] and pg.collection_template[slot1.eventForMsg.id or 0].title) or "")
		})

		slot1.eventForMsg = nil
	end
end

function slot0.onTimeUp(slot0)
	if getProxy(ChapterProxy):getActiveChapter() and not slot2:inWartime() then
		function slot3()
			slot0:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		end

		if slot0.contextData.chapterVO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("battle_preCombatMediator_timeout"),
				onYes = slot3,
				onNo = slot3
			})
		else
			slot3()
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_timeout"))
		end
	end
end

function slot0.getDockCallbackFuncs(slot0, slot1, slot2, slot3, slot4)
	slot5 = getProxy(BayProxy)
	slot6 = getProxy(ChapterProxy)

	return function (slot0, slot1)
		slot2, slot3 = Ship.ShipStateConflict("inElite", slot0)

		if slot2 == Ship.STATE_CHANGE_FAIL then
			return false, i18n(slot3)
		elseif slot2 == Ship.STATE_CHANGE_CHECK then
			return Ship.ChangeStateCheckBox(slot3, slot0, slot1)
		end

		if slot0 and slot0:isSameKind(slot0) then
			return true
		end

		for slot7, slot8 in pairs(slot1) do
			if slot0:isSameKind(slot7) then
				return false, i18n("event_same_type_not_allowed")
			end
		end

		return true
	end, function (slot0, slot1, slot2)
		slot1()
	end, function (slot0)
		slot1 = slot0:getEliteFleetList()[]

		if slot0.getEliteFleetList() then
			slot2 = nil

			for slot6, slot7 in ipairs(slot1) do
				if slot7 == slot2.id then
					slot2 = slot6

					break
				end
			end

			table.remove(slot1, slot2)
		end

		slot1[#slot1 + 1] = slot0[1]

		slot0[1]:updateChapter(slot0)
		slot0[1]:duplicateEliteFleet(slot0)
	end
end

function slot0.playAIActions(slot0, slot1, slot2)
	if not slot0.viewComponent.grid then
		slot2()

		return
	end

	slot3 = getProxy(ChapterProxy)
	slot4 = nil
	slot4 = coroutine.create(function ()
		slot0.viewComponent:frozen()

		for slot3, slot4 in ipairs(slot0.viewComponent) do
			slot6, slot7 = slot4:applyTo(slot5, true)

			slot0:playAIAction(slot4, function ()
				slot0, slot1 = slot0:applyTo(slot0, false)

				if slot0 then
					slot2:updateChapter(slot1, slot1)
				end

				onNextTick(slot3)
			end)
			coroutine.yield()
		end

		slot4()
		slot4.viewComponent:unfrozen()
	end)

	function ()
		if coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

function slot0.playAIAction(slot0, slot1, slot2)
	slot3 = slot0.contextData.chapterVO

	if isa(slot1, ChapterAIAction) then
		if slot3:getChampionIndex(slot1.line.row, slot1.line.column) then
			if #slot1.movePath > 0 then
				slot0.viewComponent.grid:moveChampion(slot4, slot1.movePath, Clone(slot1.movePath), slot2)
			else
				slot2()
			end
		end
	elseif isa(slot1, SubAIAction) then
		if slot3:getFleetIndex(FleetType.Submarine, slot1.line.row, slot1.line.column) then
			if slot1.target then
				slot7 = "-" .. _.detect(slot1.cellUpdates, function (slot0)
					return slot0.row == slot0.target.row and slot0.column == slot0.target.column
				end).data / 100 .. "%"

				slot0.viewComponent:doPlayStrikeAnim(slot3:getTorpedoShip(slot5), "SubTorpedoUI", function ()
					slot0.viewComponent:strikeEnemy(slot1.target, , )
				end)

				return
			end

			if #slot1.movePath > 0 then
				slot0.viewComponent.grid:moveSub(slot4, slot1.movePath, Clone(slot1.movePath), slot2)
			else
				slot2()
			end
		end
	elseif isa(slot1, TransportAIAction) then
		if slot3:getFleetIndex(FleetType.Transport, slot1.line.row, slot1.line.column) then
			if #slot1.movePath > 0 then
				slot0.viewComponent.grid:moveTransport(slot4, slot1.movePath, Clone(slot1.movePath), slot2)
			else
				if slot3:getChapterCell(slot3.fleets[slot4].line.row, slot3.fleets[slot4].line.column) and slot6.attachment == ChapterConst.AttachBox and slot6.flag ~= 1 and pg.box_data_template[slot6.attachmentId].type == ChapterConst.BoxTorpedo then
					slot0.viewComponent:doPlayTorpedo(slot2)

					return
				end

				slot2()
			end
		end
	elseif isa(slot1, FleetAIAction) and slot3:getFleetIndex(FleetType.Normal, slot1.line.row, slot1.line.column) then
		if slot3:isPlayingWithBombEnemy() then
			if slot3:getMapShip(slot5).getShipType(slot6) == ShipType.QingHang or slot6:getShipType() == ShipType.ZhengHang then
				slot0.viewComponent:doPlayStrikeAnim(slot6, "AirStrikeUI", slot2)
			else
				slot0.viewComponent:doPlayStrikeAnim(slot6, "CannonUI", slot2)
			end
		elseif slot1.target then
			slot7 = "-" .. _.detect(slot1.cellUpdates, function (slot0)
				return slot0.row == slot0.target.row and slot0.column == slot0.target.column
			end).data / 100 .. "%"
			slot9 = slot3.fleets[slot4].getSkill(slot5, slot8)

			slot0.viewComponent:doPlayCommander(slot3.fleets[slot4].findCommanderBySkillId(slot5, slot8), function ()
				if slot0:GetType() == FleetSkill.TypeAttack then
					if slot0:GetArgs()[1] == "airfight" then
						slot1.viewComponent:doPlayAirStrike(ChapterConst.SubjectPlayer, true, function ()
							slot0.viewComponent:strikeEnemy(slot1.target, , )
						end)
					elseif slot0[1] == "torpedo" then
						slot1.viewComponent:doPlayStrikeAnim(slot5:getTorpedoShip(slot6), "SubTorpedoUI", function ()
							slot0.viewComponent:strikeEnemy(slot1.target, , )
						end)
					end
				end
			end)
		else
			slot2()
		end
	end
end

function slot0.saveSubState(slot0, slot1)
	PlayerPrefs.SetInt("chapter_submarine_ai_type_" .. slot2, slot1 + 1)
	PlayerPrefs.Save()
end

function slot0.loadSubState(slot0, slot1)
	if PlayerPrefs.GetInt("chapter_submarine_ai_type_" .. getProxy(PlayerProxy):getRawData().id) - 1 >= 0 and slot3 ~= slot1 then
		slot0.viewComponent:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpSubState,
			arg1 = slot3
		})
	end
end

function slot0.duplicateEliteFleet(slot0, slot1)
	slot2 = getProxy(ChapterProxy)

	for slot7, slot8 in pairs(slot0.viewComponent.maps[slot1:getConfig("map")].chapters) do
		if not slot2:getRawData()[slot8.id] then
			slot8:setEliteFleetList(slot1:getEliteFleetList())
		end
	end
end

return slot0
