slot0 = class("MainUIMediator", import("..base.ContextMediator"))
slot0.OPEN_LEVEL = "MainUIMediator:OPEN_LEVEL"
slot0.OPEN_CHUANWUSTART = "MainUIMediator:OPEN_CHUANWUSTART"
slot0.OPEN_EQUIPDEV = "MainUIMediator:OPEN_EQUIPDEV"
slot0.OPEN_SETTINGS = "MainUIMediator:OPEN_SETTINGS"
slot0.OPEN_TASK = "MainUIMediator:OPEN_TASK"
slot0.OPEN_MAIL = "MainUIMediator:OPEN_MAIL"
slot0.GETBOAT = "MainUIMediator:GETBOAT"
slot0.OPEN_BIANDUI = "MainUIMediator:OPEN_BIANDUI"
slot0.OPEN_EQUIPSYNTHESIS = "MainUIMediator:OPEN_EQUIPSYNTHESIS"
slot0.OPEN_CHATVIEW = "MainUIMediator:OPEN_CHATVIEW"
slot0.OPEN_EQUIPSCENE = "MainUIMediator:OPEN_EQUIPSCENE"
slot0.OPEN_ARMORYSCENE = "MainUIMediator:OPEN_ARMORYSCENE"
slot0.TEST1 = "MainUIMediator:TEST1"
slot0.OPEN_SCHOOLSCENE = "MainUIMediator:OPEN_SCHOOLSCENE"
slot0.OPEN_BACKYARD = "MainUIMediator:OPEN_BACKYARD"
slot0.OPEN_PLAYER_INFO_LAYER = "MainUIMediator:OPEN_PLAYER_INFO_LAYER"
slot0.ON_SHIP_DETAIL = "MainUIMediator:ON_SHIP_DETAIL"
slot0.OPEN_COLLECT_SHIP = "MainUIMediator:OPEN_COLLECT_SHIP"
slot0.OPEN_ACTIVITY_PANEL = "MainUIMediator:OPEN_ACTIVITY_PANEL"
slot0.OPEN_EVENT = "MainUIMediator:OPEN_EVENT"
slot0.GO_SCENE = "MainUIMediator:OPEN_SCENE"
slot0.OPEN_FRIEND = "MainUIMediator.OPEN_FRIEND"
slot0.GO_MALL = "MainUIMediator:GO_MALL"
slot0.OPEN_COMMISSION_INFO = "MainUIMediator:OPEN_COMMISSION_INFO"
slot0.OPEN_RANK = "MainUIMediator:OPEN_RANK"
slot0.TMP_DEBUG = "MainUIMediator:TMP_DEBUG"
slot0.OPEN_GUILD = "MainUIMediator:OPEN_GUILD"
slot0.OPEN_MONTH_CARD_SET = "MainUIMediator:OPEN_MONTH_CARD_SET"
slot0.OPEN_SHOP_LAYER = "MainUIMediator:OPEN_SHOP_LAYER"
slot0.ON_ACTIVITY = "MainUIMediator:ON_ACTIVITY"
slot0.ON_ACTIVITY_MAP = "MainUIMediator:ON_ACTIVITY_MAP"
slot0.ON_ACTIVITY_PT = "MainUIMediator:ON_ACTIVITY_PT"
slot0.ON_VOTE = "MainUIMediator:ON_VOTE"
slot0.ON_TOUCHSHIP = "MainUIMediator:ON_TOUCHSHIP"
slot0.ON_LOTTERY = "MainUIMediator:ON_LOTTERY"
slot0.OPEN_SCROLL = "MainUIMediator:OPEN_SCROLL"
slot0.ON_TASK_OPEN = "MainUIMediator:ON_TASK_OPEN"
slot0.ON_ANNIVERSARY = "MainUIMediator:ON_ANNIVERSARY"
slot0.OPEN_SNAPSHOT = "MainUIMediator:OPEN_SNAPSHOT"
slot0.OPEN_TRANINGCAMP = "MainUIMediator:OPEN_TRANINGCAMP"
slot0.OPEN_COMMANDER = "MainUIMediator:OPEN_COMMANDER"
slot0.OPEN_BULLETINBOARD = "MainUIMediator:OPEN_BULLETINBOARD"
slot0.OPEN_TECHNOLOGY = "MainUIMediator:OPEN_TECHNOLOGY"
slot0.ON_BOSS_BATTLE = "MainUIMediator:ON_BOSS_BATTLE"
slot0.ON_MONOPOLY = "MainUIMediator:ON_MONOPOLY"
slot0.ON_BLACKWHITE = "MainUIMediator:ON_BLACKWHITE"
slot0.ON_MEMORYBOOK = "MainUIMediator:ON_MEMORYBOOK"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot1:setSelectShipId(nil)
	slot0.viewComponent:setShips(slot2)
	slot0.viewComponent:setFlagShip(slot5)
	slot0.viewComponent:updatePlayerInfo(slot4)
	slot0:updateCourseNotices(false)

	slot6 = getProxy(TaskProxy)
	slot10 = _.any(slot9, function (slot0)
		slot3 = slot0:getTaskById((slot0:getTaskShip() and slot0:getAcademyTask(slot1.groupId)) or nil)

		return slot1 and ((((slot0.getTaskShip() and slot0.getAcademyTask(slot1.groupId)) or nil) and not slot3 and not slot0:getFinishTaskById((slot0.getTaskShip() and slot0.getAcademyTask(slot1.groupId)) or nil)) or (slot3 and slot3:isFinish()))
	end)
	slot11 = false

	if getProxy(NavalAcademyProxy).getCourse(slot8):inClass() and AcademyCourse.MaxStudyTime <= pg.TimeMgr.GetInstance():GetServerTime() - slot12.timestamp then
		slot11 = true
	end

	slot13 = getProxy(CollectionProxy):unclaimTrophyCount() > 0

	if slot10 or slot11 or slot13 then
		slot0:updateCourseNotices()
	end

	slot0.viewComponent:updateBuffList(slot14)
	slot0:updateTaskNotices()
	slot0:updateBackYardNotices()
	slot0:updateMailAttachmentNotices()
	slot0:updateBuildNotices()
	slot0:navalAcademyNotices()
	slot0:updateAttireTip()
	slot0:updateCollectNotices()
	slot0:updateChat()
	slot0:updateFriendNotification()
	slot0:updateBanner()
	slot0:updateEvent()
	slot0:updateCommissionNotices()
	slot0:updateSettingsNotice()
	slot0:updateExSkinNotice()
	slot0:updateCommanderNotices(getProxy(CommanderProxy).haveFinishedBox(slot15))
	slot0:bind(slot0.ON_MONOPOLY, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = MonopolyMediator,
			viewComponent = MonopolyLayer
		}))
	end)
	slot0:bind(slot0.OPEN_COMMANDER, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM)
	end)
	slot0.viewComponent:updateTraningCampBtn()
	slot0.viewComponent:updateRefluxBtn()
	slot0:bind(slot0.OPEN_TRANINGCAMP, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TRAININGCAMP)
	end)
	slot0:bind(slot0.ON_BOSS_BATTLE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACT_BOSS_BATTLE, {
			showAni = true
		})
	end)
	slot0:bind(slot0.ON_TASK_OPEN, function (slot0, slot1)
		if not getProxy(TaskProxy):isFinishPrevTasks(slot1) then
			return
		end

		slot0:sendNotification(GAME.TRIGGER_TASK, slot1)
	end)
	slot0:bind(slot0.ON_SHIP_DETAIL, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1.id
		})
	end)
	slot0:bind(slot0.OPEN_CHUANWUSTART, function (slot0, slot1)
		if slot1 == DockyardScene.MODE_OVERVIEW then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				showTagNoBlock = true,
				mode = slot1,
				flags = {
					inEvent = true,
					inFleet = true,
					inClass = true,
					inActivity = true,
					inBackyard = true
				}
			})
		elseif slot1 == DockyardScene.MODE_DESTROY then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
				blockLock = true,
				prevFlag = false,
				mode = slot1,
				leftTopInfo = i18n("word_destroy"),
				onShip = Ship.canDestroyShip
			})
		end
	end)
	slot0:bind(slot0.OPEN_LEVEL, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = getProxy(ChapterProxy).getActiveChapter(slot1) and slot2.id,
			mapIdx = slot2 and slot2:getConfig("map")
		})
	end)
	slot0:bind(slot0.OPEN_BIANDUI, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BIANDUI, {
			fleetId = slot1
		})
	end)
	slot0:bind(slot0.OPEN_BACKYARD, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD, {
			fromMain = true
		})
	end)
	slot0:bind(slot0.OPEN_GUILD, function (slot0)
		if getProxy(PlayerProxy) and slot1:getData() then
			slot3, slot4 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot2.level, "NewGuildMediator")

			if not slot3 then
				pg.TipsMgr:GetInstance():ShowTips(slot4)

				return
			end
		end

		if getProxy(GuildProxy):getData() then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.GUILD)
		else
			slot0:sendNotification(GAME.GO_SCENE, SCENE.NEWGUILD)
		end
	end)
	slot0:bind(slot0.OPEN_COLLECT_SHIP, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COLLECTSHIP)
	end)
	slot0:bind(slot0.OPEN_ARMORYSCENE, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE)
	end)
	slot0:bind(slot0.GETBOAT, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT)
	end)
	slot0:bind(slot0.OPEN_MAIL, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = MailMediator,
			viewComponent = MailLayer,
			onRemoved = function ()
				slot0.viewComponent:enablePartialBlur()
			end
		}))
	end)
	slot0:bind(slot0.TMP_DEBUG, function (slot0)
		slot0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_DEBUG
		})
	end)
	slot0:bind(slot0.OPEN_TASK, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TASK)
	end)
	slot0:bind(slot0.OPEN_CHATVIEW, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			onRemoved = function ()
				slot0:updateChat()
				slot0.updateChat.viewComponent:enablePartialBlur()
			end
		}))
	end)
	slot0:bind(slot0.OPEN_SCHOOLSCENE, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE)
	end)
	slot0:bind(slot0.OPEN_SETTINGS, function (slot0)
		slot0.CanUpdateCV = false

		slot0:sendNotification(GAME.GO_SCENE, SCENE.SETTINGS)
	end)
	slot0:bind(slot0.OPEN_RANK, function (slot0)
		if getProxy(PlayerProxy) and slot1:getData() then
			slot3, slot4 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot2.level, "BillboardMediator")

			if not slot3 then
				pg.TipsMgr:GetInstance():ShowTips(slot4)

				return
			end
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			index = PowerRank.TYPE_POWER
		})
	end)
	slot0:bind(slot0.OPEN_PLAYER_INFO_LAYER, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.PLAYER_INFO)
	end)
	slot0:bind(slot0.OPEN_ACTIVITY_PANEL, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(slot0.OPEN_FRIEND, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.FRIEND)
	end)
	slot0:bind(slot0.GO_MALL, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = ChargeScene.TYPE_MENU
		})
	end)
	slot0:bind(slot0.OPEN_EVENT, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	slot0:bind(slot0.GO_SCENE, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, slot1[1], slot1[2])
	end)
	slot0:bind(slot0.OPEN_COMMISSION_INFO, function (slot0)
		slot0:addSubLayers(Context.New({
			viewComponent = CommissionInfoLayer,
			mediator = CommissionInfoMediator,
			onRemoved = function ()
				slot0.viewComponent:enablePartialBlur()
			end
		}))
	end)
	slot0:bind(slot0.OPEN_SHOP_LAYER, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ShopsMediator,
			viewComponent = ShopsLayer,
			data = {
				warp = ShopsLayer.TYPE_ACTIVITY
			}
		}))
	end)
	slot0:bind(slot0.OPEN_MONTH_CARD_SET, function (slot0)
		if getProxy(PlayerProxy).getRawData(slot1):getCardById(VipCard.MONTH) and not slot3:isExpire() then
			slot0:addSubLayers(Context.New({
				viewComponent = MonthCardSetLayer,
				mediator = MonthCardSetMediator
			}))
		end
	end)
	slot0:bind(slot0.OPEN_SNAPSHOT, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SNAPSHOT, slot1)
	end)
	slot0:bind(slot0.OPEN_BULLETINBOARD, function (slot0, slot1)
		if #getProxy(ServerNoticeProxy).getServerNotices(slot2, false) > 0 then
			slot0:addSubLayers(Context.New({
				mediator = BulletinBoardMediator,
				viewComponent = BulletinBoardLayer,
				onRemoved = function ()
					slot0.viewComponent:enablePartialBlur()
				end
			}))
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("no_notice_tip"))
		end
	end)
	slot0.viewComponent:updateActivityMapBtn(slot7:getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT))
	slot0:bind(slot0.ON_BLACKWHITE, function ()
		slot0.viewComponent:disableTraningCampAndRefluxTip()
		slot0.viewComponent.disableTraningCampAndRefluxTip:addSubLayers(Context.New({
			viewComponent = BlackWhiteGridLayer,
			mediator = BlackWhiteGridMediator
		}))
	end)
	slot0:bind(slot0.ON_MEMORYBOOK, function ()
		slot0:addSubLayers(Context.New({
			viewComponent = MemoryBookLayer,
			mediator = MemoryBookMediator
		}))
	end)
	slot0:bind(slot0.ON_ACTIVITY, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(slot0.ON_ACTIVITY_MAP, function (slot0, slot1)
		slot8.mapIdx, slot8.chapterId = getProxy(ChapterProxy):getLastMapForActivity()

		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot3,
			mapIdx = slot2
		})
	end)
	slot0:bind(slot0.ON_ACTIVITY_PT, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(slot0.ON_ANNIVERSARY, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ANNIVERSARY)
	end)
	slot0:bind(slot0.ON_LOTTERY, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			viewComponent = LotteryLayer,
			mediator = LotteryMediator,
			data = {
				activityId = slot1
			}
		}))
	end)
	slot0:bind(slot0.OPEN_SCROLL, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = InvestigationMediator,
			viewComponent = InvestigationLayer,
			data = {
				activityId = slot1
			}
		}))
	end)
	slot0:bind(slot0.OPEN_TECHNOLOGY, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SELTECHNOLOGY)
	end)
	slot0:bind(slot0.ON_VOTE, function ()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_VOTE) or slot1:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))

			return
		end

		if not _.detect(pg.activity_vote.all, function (slot0)
			return pg.TimeMgr.GetInstance():inTime(pg.activity_vote[slot0].time)
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))

			return
		end

		slot0:sendNotification(GAME.REQUEST_VOTE_INFO, {
			activityId = slot1.id,
			configId = slot2,
			callback = function ()
				slot0:sendNotification(GAME.GO_SCENE, SCENE.VOTE)
			end
		})
	end)

	if not getProxy(MilitaryExerciseProxy):getData() then
		slot0:sendNotification(GAME.GET_SEASON_INFO)
	end

	pg.SystemOpenMgr:GetInstance():notification(slot4.level)

	if getProxy(GuildProxy):getData() then
		if (slot18:getDutyByMemberId(slot4.id) == GuildMember.DUTY_COMMANDER or slot19 == GuildMember.DUTY_DEPUTY_COMMANDER) and not slot17:getRequests() then
			slot0:sendNotification(GAME.GUILD_GET_REQUEST_LIST, slot18.id)
		end

		slot0:updateGuildNotices()
	end

	slot0:bind(slot0.ON_TOUCHSHIP, function (slot0, slot1)
		slot2 = getProxy(TaskProxy)
		slot3 = getProxy(ActivityProxy)

		for slot7, slot8 in ipairs(pg.task_data_trigger.all) do
			v = pg.task_data_trigger[slot8]

			if v.group_id == slot1 then
				slot10 = v.args[1][2]

				if slot3:getActivityById(v.activity_id) and not slot11:isEnd() and not slot2:getTaskById(slot10) and not slot2:getFinishTaskById(slot10) then
					slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
						cmd = 1,
						activity_id = slot9
					})

					return
				end
			end
		end
	end)

	if getProxy(MailProxy).total >= 1000 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("warning_mail_max_2"))
	elseif slot19.total >= 950 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("warning_mail_max_1", slot19.total))
	end
end

function slot0.onBluePrintNotify(slot0)
	slot3, slot4 = pg.SystemOpenMgr:GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "TechnologyMediator")

	slot0.viewComponent:notifyTechnology((OPEN_TEC_TREE_SYSTEM and getProxy(TechnologyNationProxy):getShowRedPointTag()) or ((SelectTechnologyMediator.onBlueprintNotify() or SelectTechnologyMediator.onTechnologyNotify()) and slot3))

	if getProxy(TechnologyProxy):getBuildingBluePrint() then
		slot9 = false

		for slot13, slot14 in ipairs(slot8) do
			if slot7:getTaskOpenTimeStamp(slot14) <= pg.TimeMgr.GetInstance():GetServerTime() then
				slot17 = getProxy(TaskProxy):isFinishPrevTasks(slot14)

				if not (getProxy(TaskProxy):getTaskById(slot14) or getProxy(TaskProxy):getFinishTaskById(slot14)) and slot17 then
					slot9 = true

					slot0.viewComponent:emit(slot0.ON_TASK_OPEN, slot14)
				end
			end
		end

		if slot9 and not slot0.DontNotifyBluePrintTaskAgain then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("blueprint_task_update_tip", slot7:getShipVO():getConfig("name")),
				weight = LayerWeightConst.SECOND_LAYER,
				onYes = function ()
					slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT)
				end,
				onNo = function ()
					slot0.DontNotifyBluePrintTaskAgain = true
				end
			})
		end
	end
end

function slot0.updateAttireTip(slot0)
	slot0.viewComponent:updateAttireBtn(_.any(getProxy(AttireProxy):needTip(), function (slot0)
		return slot0 == true
	end))
end

function slot0.navalAcademyNotices(slot0)
	getProxy(NavalAcademyProxy):notification()
end

function slot0.updateTaskNotices(slot0)
	slot1 = getProxy(TaskProxy)

	slot0.viewComponent:updateTaskNotices(slot1:getCanReceiveCount(), slot1:getNotFinishCount())
end

function slot0.updateCourseNotices(slot0, slot1)
	slot0.viewComponent:updateLessonNotices(slot1)
end

function slot0.updateCommanderNotices(slot0, slot1)
	slot0.viewComponent:updateCommanderNotices(slot1)
end

function slot0.updateGuildNotices(slot0)
	slot1 = getProxy(GuildProxy)

	slot0.viewComponent:updateGuildNotices(slot1.eventTip or slot1:isNoticesApply())
end

function slot0.updateCommissionNotices(slot0)
	slot3 = getProxy(NavalAcademyProxy)

	slot0.viewComponent:updateCommissionNotices(getProxy(EventProxy).hasFinishState(slot1) or slot3:GetOilVO().isCommissionNotify(slot6, getProxy(PlayerProxy).getData(slot4).oilField) or slot3:GetGoldVO().isCommissionNotify(slot7, getProxy(PlayerProxy).getData(slot4).goldField))
end

function slot0.updateBackYardNotices(slot0)
	slot1 = getProxy(DormProxy)

	slot0.viewComponent:updateBackYardNotices(slot1:isLackOfFood() or slot1:havePopEvent())
end

function slot0.updateMailAttachmentNotices(slot0, slot1)
	slot0.viewComponent:updateMailAttachmentCount(getProxy(MailProxy).GetAttachmentCount(slot2))
end

function slot0.updateFriendNotification(slot0)
	slot0.viewComponent:friendNotification(getProxy(NotificationProxy).getRequestCount(slot1) > 0 or getProxy(FriendProxy):getNewMsgCount() > 0)
end

function slot0.updateBuildNotices(slot0)
	slot0.viewComponent:updateBuildNotices(getProxy(BuildShipProxy):getFinishCount())
end

function slot0.updateCollectNotices(slot0)
	slot0.viewComponent:updateCollectNotices(getProxy(CollectionProxy):hasFinish())
end

function slot0.updateChat(slot0)
	slot1 = {}

	if not getProxy(ChatProxy) then
		return
	end

	_.each(slot2:getRawData(), function (slot0)
		table.insert(slot0, slot0)
	end)

	if getProxy(GuildProxy):getRawData() then
		_.each(slot3:getChatMsgs(), function (slot0)
			table.insert(slot0, slot0)
		end)
	end

	_.each(getProxy(FriendProxy).getCacheMsgList(slot4), function (slot0)
		table.insert(slot0, slot0)
	end)

	slot6 = NotificationLayer.ChannelBits.recv
	slot7 = bit.lshift(1, ChatConst.ChannelAll)

	slot0.viewComponent:updateChat(_.slice(_.filter(_(slot1):chain():filter(function (slot0)
		return not slot0:isInBlackList(slot0.playerId)
	end):sort(function (slot0, slot1)
		return slot0.timestamp < slot1.timestamp
	end):value(), function (slot0)
		return slot0 ==  or bit.band(slot0, bit.lshift(1, slot0.type)) > 0
	end), #_.filter(_(slot1).chain().filter(function (slot0)
		return not slot0.isInBlackList(slot0.playerId)
	end).sort(function (slot0, slot1)
		return slot0.timestamp < slot1.timestamp
	end).value(), function (slot0)
		return slot0 ==  or bit.band(slot0, bit.lshift(1, slot0.type)) > 0
	end) - 4 + 1, 4))
end

function slot0.updateBanner(slot0)
	slot0.viewComponent:updateBanner(getProxy(ActivityProxy):getBannerDisplays())
end

function slot0.updateEvent(slot0)
	slot0.viewComponent:updateEvent(getProxy(EventProxy))
end

function slot0.updateSeverNotices(slot0)
	slot1 = getProxy(ServerNoticeProxy)

	slot0.viewComponent:updateSeverNotices(#slot1:getServerNotices(false) > 0 and not slot1:isStopMainTip())
end

function slot0.updateSettingsNotice(slot0)
	slot0.viewComponent:updateSettingsNotice(slot0.CanUpdateCV)
end

function slot0.updateExSkinNotice(slot0)
	slot0.viewComponent:updateExSkinBtn(_.select(_.values(slot2), function (slot0)
		return slot0:isExpireType() and not slot0:isExpired()
	end))
end

function slot0.updateExSkinOverDue(slot0)
	if #getProxy(ShipSkinProxy).getOverDueSkins(slot1) > 0 then
		slot0.viewComponent:showOverDueExSkins(slot2)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		BayProxy.SHIP_REMOVED,
		FleetProxy.FLEET_RENAMED,
		NotificationProxy.FRIEND_REQUEST_ADDED,
		NotificationProxy.FRIEND_REQUEST_REMOVED,
		FriendProxy.FRIEND_NEW_MSG,
		FriendProxy.FRIEND_UPDATED,
		TaskProxy.TASK_UPDATED,
		MailProxy.UPDATE_ATTACHMENT_COUNT,
		BuildShipProxy.TIMEUP,
		NavalAcademyProxy.BUILDING_FINISH,
		CollectionProxy.TROPHY_UPDATE,
		GAME.CHANGE_PLAYER_ICON_DONE,
		ChatProxy.NEW_MSG,
		GAME.LOAD_SCENE_DONE,
		GAME.BEGIN_STAGE_DONE,
		GAME.GUIDE_FINISH,
		ChapterProxy.CHAPTER_TIMESUP,
		GAME.EVENT_LIST_UPDATE,
		GAME.GUILD_GET_REQUEST_LIST_DONE,
		GuildProxy.REQUEST_DELETED,
		GuildProxy.REQUEST_COUNT_UPDATED,
		ServerNoticeProxy.SERVER_NOTICES_UPDATE,
		DormProxy.INIMACY_AND_MONEY_ADD,
		GAME.REMOVE_LAYERS,
		ShopsMediator.OPEN,
		LotteryMediator.OPEN,
		GAME.BOSS_EVENT_START_DONE,
		GuildProxy.NEW_MSG_ADDED,
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		TaskProxy.TASK_ADDED,
		GAME.CHAPTER_OP_DONE,
		CommanderProxy.COMMANDER_BOX_FINISHED,
		GAME.FETCH_NPC_SHIP_DONE,
		GAME.MAINUI_ACT_BTN_DONE,
		NewShipMediator.OPEN,
		GAME.OPEN_MSGBOX_DONE,
		GAME.CLOSE_MSGBOX_DONE,
		TechnologyConst.UPDATE_REDPOINT_ON_TOP,
		GAME.HANDLE_OVERDUE_ATTIRE_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:updatePlayerInfo(slot3)
		slot3:display()
		slot0:updateCommissionNotices()
	elseif slot2 == BayProxy.SHIP_REMOVED then
		slot3:display()
	elseif slot2 == FleetProxy.FLEET_RENAMED then
		slot3:display()
	elseif slot2 == NotificationProxy.FRIEND_REQUEST_ADDED or slot2 == NotificationProxy.FRIEND_REQUEST_REMOVED or slot2 == FriendProxy.FRIEND_NEW_MSG or slot2 == FriendProxy.FRIEND_UPDATED then
		slot0:updateFriendNotification()
		slot0:updateChat()
	elseif slot2 == TaskProxy.TASK_UPDATED then
		slot0:updateTaskNotices()
	elseif slot2 == DormProxy.INIMACY_AND_MONEY_ADD then
		slot0:updateBackYardNotices()
	elseif slot2 == MailProxy.UPDATE_ATTACHMENT_COUNT then
		slot0:updateMailAttachmentNotices()
	elseif slot2 == BuildShipProxy.TIMEUP then
		slot0:updateBuildNotices()
	elseif slot2 == NavalAcademyProxy.BUILDING_FINISH then
		slot0:updateCourseNotices()
	elseif slot2 == CollectionProxy.TROPHY_UPDATE then
		if getProxy(CollectionProxy).unclaimTrophyCount(slot4) > 0 then
			slot0:updateCourseNotices()
		end
	elseif slot2 == GAME.CHANGE_PLAYER_ICON_DONE then
		slot0.viewComponent:setFlagShip(slot3.ship)
	elseif slot2 == ChatProxy.NEW_MSG or slot2 == GuildProxy.NEW_MSG_ADDED then
		slot0:updateChat()
	elseif slot2 == GAME.LOAD_SCENE_DONE or slot2 == GAME.GUIDE_FINISH then
		if not LOCK_TECHNOLOGY and pg.SystemOpenMgr:GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "TechnologyMediator") then
			if not pg.StoryMgr.GetInstance():IsPlayed("FANGAN1") then
				slot0:sendNotification(GAME.GO_SCENE, SCENE.SELTECHNOLOGY)
				pg.StoryMgr:GetInstance():Play("FANGAN1", function ()
					return
				end, true)
			else
				slot0:handleEnterMainUI()
			end
		else
			slot0:handleEnterMainUI()
		end
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == ChapterProxy.CHAPTER_TIMESUP then
		slot0:onChapterTimeUp()
	elseif slot2 == GAME.EVENT_LIST_UPDATE then
		slot0:updateEvent()
		slot0:updateCommissionNotices()
	elseif slot2 == GAME.GUILD_GET_REQUEST_LIST_DONE or slot2 == GuildProxy.REQUEST_DELETED or slot2 == GuildProxy.REQUEST_COUNT_UPDATED then
		slot0:updateGuildNotices()
	elseif slot2 == ServerNoticeProxy.SERVER_NOTICES_UPDATE then
		slot0:updateSeverNotices()
	elseif slot2 == ShopsMediator.OPEN or slot2 == LotteryMediator.OPEN then
		slot0.viewComponent:activeEffect(false)
	elseif slot2 == GAME.REMOVE_LAYERS then
		if slot3.context.mediator == ShopsMediator or slot3.context.mediator == LotteryMediator then
			slot0.viewComponent:activeEffect(true)
		elseif slot3.context.mediator == LevelDifficultySelMediator then
			setActive(slot0.viewComponent.effectTF, slot0.viewComponent.flagShip and slot0.viewComponent.flagShip.propose)
		elseif slot3.context.mediator == BulletinBoardMediator then
			slot0:tryPlayGuide()
		elseif slot3.context.mediator == CommissionInfoMediator then
			slot0.viewComponent:resetCommissionBtn()
		end

		slot0.viewComponent:updateTraningCampBtn()
		slot0.viewComponent:updateRefluxBtn()
	elseif GAME.BOSS_EVENT_START_DONE == slot2 then
		slot0:updateGuildNotices()
	elseif ActivityProxy.ACTIVITY_OPERATION_DONE == slot2 then
	elseif TaskProxy.TASK_ADDED == slot2 then
		slot0.viewComponent:stopCurVoice()
	elseif slot2 == GAME.CHAPTER_OP_DONE then
		if slot3.items and #slot3.items > 0 then
			slot0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = slot3.items
			}, (slot0.retreateMapType == Map.ESCORT and AwardInfoLayer.TITLE.ESCORT) or nil)
		end
	elseif slot2 == CommanderProxy.COMMANDER_BOX_FINISHED then
		slot0:updateCommanderNotices(true)
	elseif slot2 == GAME.FETCH_NPC_SHIP_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.items, slot3.callback)
	elseif slot2 == GAME.MAINUI_ACT_BTN_DONE then
		slot0.viewComponent:notifyActivitySummary(slot3.cnt, slot3.priority)
	elseif slot2 == NewShipMediator.OPEN then
		slot0.viewComponent:stopCurVoice()
	elseif slot2 == GAME.OPEN_MSGBOX_DONE then
	elseif slot2 == GAME.CLOSE_MSGBOX_DONE then
	elseif slot2 == TechnologyConst.UPDATE_REDPOINT_ON_TOP then
		slot0:onBluePrintNotify()
	elseif slot2 == GAME.HANDLE_OVERDUE_ATTIRE_DONE then
		slot0.viewComponent:showOverDueAttire(slot3)
	end
end

function slot0.onChapterTimeUp(slot0)
	if getProxy(ChapterProxy):getActiveChapter() and not slot2:inWartime() then
		slot0.retreateMapType = slot2:getMapType()

		slot0:sendNotification(GAME.CHAPTER_OP, {
			type = ChapterConst.OpRetreat
		})
		pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_timeout"))
	end
end

function slot0.handleEnterMainUI(slot0)
	slot0:updateSeverNotices()

	if pg.SeriesGuideMgr:GetInstance():isEnd() then
		slot1 = nil

		function slot2()
			if coroutine.status(coroutine.status) == "suspended" then
				slot0, slot1 = coroutine.resume(coroutine.resume)
			end
		end

		coroutine.resume(coroutine.create(function ()
			slot0:playStroys(function ()
				onNextTick(onNextTick)
			end)
			coroutine.yield()
			coroutine.yield:handleReturnAwardAct()
			coroutine.yield.handleReturnAwardAct:handleReturnAwardAct()
			coroutine.yield.handleReturnAwardAct.handleReturnAwardAct:accepetActivityTask()
			coroutine.yield.handleReturnAwardAct.handleReturnAwardAct.accepetActivityTask:tryRequestColoring()

			if getProxy(ActivityProxy):findNextAutoActivity() then
				slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY)

				return
			end

			if slot0:findRefluxAutoActivity() then
				slot0:sendNotification(GAME.GO_SCENE, SCENE.REFLUX)

				return
			end

			if #getProxy(ServerNoticeProxy).getServerNotices(slot3, false) > 0 and not slot3:getStopRemind() and not slot3.__autoPopped then
				slot3.__autoPopped = true

				slot0:addSubLayers(Context.New({
					mediator = BulletinBoardMediator,
					viewComponent = BulletinBoardLayer
				}))
			else
				slot0:tryPlayGuide()
			end

			slot0:onChapterTimeUp()

			if not LOCK_SUBMARINE then
				slot0:tryRequestMainSub()
			end

			slot0:tryRequestVersion()
			slot0:checkCV()
			slot0:storyStorageFix()
			slot0:onBluePrintNotify()
			getProxy(TaskProxy).pushAutoSubmitTask(slot5)
			slot0:handlingSpecialActs()
			slot0:handlingActivityBtn()
			slot0:handleOverdueAttire()
			slot0:updateExSkinOverDue()
		end))
	end
end

function slot0.playStroys(slot0, slot1)
	slot3 = {}
	slot4 = pg.StoryMgr:GetInstance()

	for slot8, slot9 in pairs(slot2) do
		if slot9:getConfig("story_id") and slot10 ~= "" and not slot4:IsPlayed(slot10) then
			table.insert(slot3, function (slot0)
				slot0:Play(slot0.Play, slot0, true, true)
			end)
		end
	end

	if getProxy(PlayerProxy):getData().level >= 40 and not slot4:IsPlayed("ZHIHUIMIAO1") then
		table.insert(slot3, function (slot0)
			slot0:Play("ZHIHUIMIAO1", slot0, true, true)
		end)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot5:isEnd() then
		slot6 = pg.expedition_data_template

		if table.contains(slot5.data1_list, table.remove(slot8, 1).config.id) then
			slot11 = slot5:getConfig("config_client").story
			slot13 = pg.extraenemy_template[slot5.data1]

			if slot5.data4 - slot5.data2 <= 0 then
				slot14 = 0
			end

			slot15 = math.floor(slot14 / slot5.data4 * 10000)

			for slot19, slot20 in pairs(slot11) do
				if slot20[1] < slot15 then
					break
				end

				if slot20[2] and slot21 ~= "" and not slot4:IsPlayed(slot21) then
					table.insert(slot3, function (slot0)
						slot0:Play(slot0.Play, slot0, true, true)
					end)
				end
			end
		end
	end

	if getProxy(ActivityProxy):getActivityById(ActivityConst.ACT_NPC_SHIP_ID) and not slot6:isEnd() then
		slot8 = slot6:getConfig("config_client").npc[1]
		slot9 = slot6.getConfig("config_client").npc[2]
		slot10 = {
			function (slot0)
				if slot0 == "" or pg.StoryMgr:GetInstance():IsPlayed(slot0) then
					slot0()
				else
					pg.StoryMgr:GetInstance():Play(slot0, slot0, true, true)
				end
			end,
			function (slot0)
				if (getProxy(TaskProxy):getTaskById(slot0) or slot1:getFinishTaskById(slot0)) and slot2:isFinish() and not slot2:isReceive() then
					slot1:sendNotification(GAME.FETCH_NPC_SHIP, {
						taskId = slot2.id,
						callback = slot0
					})
				else
					slot0()
				end
			end
		}

		table.insert(slot3, function (slot0)
			seriesAsync(slot0, slot0)
		end)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) and not slot7:isEnd() then
		if type(slot7:getConfig("config_client")) == "table" and slot8[2] and type(slot8[2]) == "string" and not pg.StoryMgr:GetInstance():IsPlayed(slot8[2]) then
			table.insert(slot3, function (slot0)
				slot0:Play(slot1[2], slot0, true, true)
			end)
		end
	end

	seriesAsync(slot3, slot1)
end

function slot0.tryPlayGuide(slot0)
	slot2 = getProxy(FleetProxy):getFleetById(11)
	slot3 = {}
	slot4 = true

	if getProxy(TaskProxy):getTaskById(10302) and slot1:isFinish() and not slot1:isReceive() and slot2:isEmpty() then
		pg.StoryMgr:GetInstance():PlayGuide("NG002", (_.any(getProxy(BayProxy):getShips(), function (slot0)
			return slot0 and slot0.configId == 308031
		end) and {}) or {
			1
		})

		slot4 = pg.GuideMgr:GetInstance():isPlayed("NG002")
	end

	if slot4 and slot0.viewComponent.openTraningCamp then
		pg.StoryMgr:GetInstance():PlayGuide("NG004", {})

		slot4 = pg.GuideMgr:GetInstance():isPlayed("NG004")
	end

	if slot4 and getProxy(PlayerProxy):getData().level >= 40 then
		pg.StoryMgr:GetInstance():PlayGuide("NG005", {})

		slot4 = pg.GuideMgr:GetInstance():isPlayed("NG005")
	end
end

function slot0.tryRequestMainSub(slot0)
	if getProxy(ChapterProxy).subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then
		slot0:sendNotification(GAME.SUB_CHAPTER_FETCH)
	end
end

function slot0.tryRequestVersion(slot0)
	if PLATFORM_CODE == PLATFORM_US and VersionMgr.Inst:OnProxyUsing() then
		return
	end

	if UpdateMgr.Inst.currentVersion.Major > 0 and (not slot0.lastRequestVersionTime or Time.realtimeSinceStartup - slot0.lastRequestVersionTime > 1800) then
		slot0.lastRequestVersionTime = Time.realtimeSinceStartup

		pg.UIMgr.GetInstance():LoadingOn()

		slot1 = true

		VersionMgr.Inst:FetchVersion(function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			if UpdateMgr.Inst.currentVersion.Build < false.Build then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("new_version_tip"),
					weight = LayerWeightConst.TOP_LAYER,
					onYes = function ()
						Application.Quit()
					end,
					onNo = function ()
						Application.Quit()
					end
				})
			end
		end)
		LeanTween.delayedCall(3, System.Action(function ()
			if slot0 then
				pg.UIMgr.GetInstance():LoadingOff()
			end
		end))
	end
end

function slot0.checkCV(slot0)
	if slot0.CVChecked then
		return
	end

	slot0.CVChecked = true

	CVUpdateMgr.Inst.CheckD(slot1)

	slot2 = nil

	Timer.New(function ()
		if slot0.state == DownloadState.CheckToUpdate then
			slot1.CanUpdateCV = true

			if slot2.viewComponent and not slot2.viewComponent.exited then
				slot2:updateSettingsNotice()
			end
		end

		if slot0.state ~= DownloadState.None then
			slot3:Stop()
		end
	end, 0.5, -1):Start()
end

function slot0.storyStorageFix(slot0)
	if slot0.StoryFixedOnce then
		return
	end

	slot0.StoryFixedOnce = true
	slot2 = slot0:getFixStoryList(5001, 5020, {})

	if getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID) and not slot3:isEnd() then
		slot5 = getProxy(PlayerProxy).getRawData(slot4)
		slot8 = nil

		for slot12 = #_.flatten(slot6), 1, -1 do
			if pg.task_data_template[slot7[slot12]].story_id and #slot15 > 0 then
				slot16 = slot5:IsPlayed(slot15)

				if slot8 then
					if not slot16 then
						table.insert(slot2, slot15)
					end
				else
					if slot16 then
						slot8 = slot12
					end
				end
			end
		end
	end

	if #slot2 > 0 then
		_.each(slot2, function (slot0)
			slot0:sendNotification(GAME.STORY_UPDATE, {
				storyId = slot0
			})

			return
		end)
	end

	return
end

function slot0.getFixStoryByStoryId(slot0, slot1, slot2, slot3)
	slot5 = getProxy(PlayerProxy).getRawData(slot4)
	slot6 = {}
	slot7 = false

	for slot11, slot12 in ipairs(slot1) do
		if slot3 then
			if not slot5:IsPlayed(slot12) then
				slot7 = true

				table.insert(slot6, slot12)
			end
		else
			if not slot5:IsPlayed(slot12) and not slot7 then
				table.insert(slot6, slot12)
			else
				if #slot6 > 0 then
					slot7 = true
				end
			end
		end
	end

	if slot7 then
		for slot11, slot12 in ipairs(slot6) do
			table.insert(slot2, slot12)
		end
	end

	return slot2
end

function slot0.getFixStoryList(slot0, slot1, slot2, slot3)
	slot4 = getProxy(TaskProxy)
	slot6 = getProxy(PlayerProxy):getRawData()
	slot3 = slot3 or {}
	slot7 = 0

	for slot11 = slot2, slot1, -1 do
		if slot4:getFinishTaskById(slot11) or slot4:getTaskById(slot11) then
			slot7 = slot11

			break
		end
	end

	for slot11 = slot7, slot1, -1 do
		if pg.task_data_template[slot11] and slot12.story_id and #slot13 > 0 and not slot6:IsPlayed(slot13) then
			table.insert(slot3, slot13)
		end
	end

	return slot3
end

function slot0.accepetActivityTask(slot0)
	slot0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)

	return
end

function slot0.tryRequestColoring(slot0)
	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA) and not slot1:isEnd() then
		slot0:sendNotification(GAME.COLORING_FETCH, {
			activityId = slot1.id
		})
	end

	return
end

function slot0.handlingSpecialActs(slot0)
	slot0:sendNotification(GAME.SPECIAL_ACT)

	return
end

function slot0.handlingActivityBtn(slot0)
	slot0:sendNotification(GAME.MAINUI_ACT_BTN)

	return
end

function slot0.remove(slot0)
	slot0.viewComponent:disablePartialBlur()

	return
end

function slot0.handleReturnAwardAct(slot0)
	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RETURN_AWARD) and not slot1:isEnd() and getProxy(PlayerProxy):getRawData().level >= 15 and (slot1.data1 == 0 or (slot1.data1 == 1 and slot1.data2 == 0)) then
		slot0:sendNotification(GAME.RETURN_AWARD_OP, {
			activity_id = slot1.id,
			cmd = ActivityConst.RETURN_AWARD_OP_ACTIVTION
		})
	end

	return
end

function slot0.handleOverdueAttire(slot0)
	slot0:sendNotification(GAME.HANDLE_OVERDUE_ATTIRE)

	return
end

return slot0
