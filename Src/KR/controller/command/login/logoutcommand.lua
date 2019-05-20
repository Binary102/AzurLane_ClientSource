class("LogoutCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	if ys.Battle.BattleState.GetInstance().GetState(slot3) ~= ys.Battle.BattleState.BATTLE_STATE_IDLE then
		warning("stop and clean battle.")
		slot3:Stop("kick")
	end

	slot0:sendNotification(GAME.STOP_BATTLE_LOADING, {})

	if pg.StoryMgr:GetInstance()._go.activeSelf then
		pg.StoryMgr:GetInstance():EndStory()
	end

	if pg.MsgboxMgr:GetInstance()._go.activeSelf then
		pg.MsgboxMgr:GetInstance():hide()
	end

	pg.PushNotificationMgr.GetInstance():PushAll()

	slot5 = getProxy(SettingsProxy)

	slot5:resetEquipSceneIndex()
	slot5:resetActivityLayerIndex()
	print("disconnect from server...-" .. tostring(slot2.code))
	pg.ConnectionMgr.GetInstance():Disconnect()

	BillboardMediator.time = nil
	Map.lastMap = nil
	BuildShipScene.Page = nil
	BuildShipScene.projectName = nil
	DockyardScene.selectedSort = nil
	DockyardScene.selectAsc = nil
	DockyardScene.indexFlag = nil
	DockyardScene.indexFlag2 = nil
	DockyardScene.indexFlag3 = nil
	LevelMediator2.prevRefreshBossTimeTime = nil
	ActivityMainScene.FetchReturnersTime = nil
	ActivityMainScene.Data2Time = nil
	InvestigationLayer.Caches = {}

	pg.SeriesGuideMgr.GetInstance():dispose()
	pg.GuideMgr.GetInstance():endGuider()
	PoolMgr.GetInstance():DestroyAllPrefab()

	if getProxy(UserProxy) and slot6:getRawData() then
		slot7:clear()
	end

	slot0.facade:removeProxy(PlayerProxy.__cname)
	slot0.facade:removeProxy(BayProxy.__cname)
	slot0.facade:removeProxy(FleetProxy.__cname)
	slot0.facade:removeProxy(EquipmentProxy.__cname)
	slot0.facade:removeProxy(ChapterProxy.__cname)
	slot0.facade:removeProxy(BagProxy.__cname)
	slot0.facade:removeProxy(TaskProxy.__cname)
	slot0.facade:removeProxy(MailProxy.__cname)
	slot0.facade:removeProxy(NavalAcademyProxy.__cname)
	slot0.facade:removeProxy(DormProxy.__cname)
	slot0.facade:removeProxy(ChatProxy.__cname)
	slot0.facade:removeProxy(FriendProxy.__cname)
	slot0.facade:removeProxy(NotificationProxy.__cname)
	slot0.facade:removeProxy(BuildShipProxy.__cname)
	slot0.facade:removeProxy(CollectionProxy.__cname)
	slot0.facade:removeProxy(EventProxy.__cname)
	slot0.facade:removeProxy(ActivityProxy.__cname)
	slot0.facade:removeProxy(MilitaryExerciseProxy.__cname)
	slot0.facade:removeProxy(ServerNoticeProxy.__cname)
	slot0.facade:removeProxy(DailyLevelProxy.__cname)
	slot0.facade:removeProxy(ShopsProxy.__cname)
	slot0.facade:removeProxy(GuildProxy.__cname)
	slot0.facade:removeProxy(VoteProxy.__cname)
	slot0.facade:removeProxy(ChallengeProxy.__cname)
	slot0.facade:removeProxy(ColoringProxy.__cname)
	slot0.facade:removeProxy(AnswerProxy.__cname)
	slot0.facade:removeProxy(TechnologyProxy.__cname)
	slot0.facade:removeProxy(TechnologyNationProxy.__cname)
	slot0.facade:removeProxy(AttireProxy.__cname)
	slot0.facade:removeProxy(ShipSkinProxy.__cname)
	slot0.facade:removeProxy(PrayProxy.__cname)
	slot0:sendNotification(GAME.LOAD_SCENE, {
		context = Context.New({
			cleanStack = true,
			scene = SCENE.LOGIN,
			mediator = LoginMediator,
			viewComponent = LoginScene,
			data = slot2
		})
	})
end

return class("LogoutCommand", pm.SimpleCommand)
