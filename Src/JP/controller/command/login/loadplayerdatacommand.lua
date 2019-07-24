class("LoadPlayerDataCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().isNewPlayer

	print("loading player data: " .. slot4)
	slot0.facade:registerProxy(PlayerProxy.New())
	slot0.facade:registerProxy(BayProxy.New({}))
	slot0.facade:registerProxy(FleetProxy.New({}))
	slot0.facade:registerProxy(EquipmentProxy.New({}))
	slot0.facade:registerProxy(ChapterProxy.New({}))
	slot0.facade:registerProxy(BagProxy.New({}))
	slot0.facade:registerProxy(TaskProxy.New({}))
	slot0.facade:registerProxy(MailProxy.New({}))
	slot0.facade:registerProxy(NavalAcademyProxy.New({}))
	slot0.facade:registerProxy(DormProxy.New({}))
	slot0.facade:registerProxy(ChatProxy.New({}))
	slot0.facade:registerProxy(FriendProxy.New({}))
	slot0.facade:registerProxy(NotificationProxy.New({}))
	slot0.facade:registerProxy(BuildShipProxy.New({}))
	slot0.facade:registerProxy(CollectionProxy.New({}))
	slot0.facade:registerProxy(EventProxy.New({}))
	slot0.facade:registerProxy(ActivityProxy.New({}))
	slot0.facade:registerProxy(MilitaryExerciseProxy.New({}))
	slot0.facade:registerProxy(ServerNoticeProxy.New())
	slot0.facade:registerProxy(DailyLevelProxy.New())
	slot0.facade:registerProxy(ShopsProxy.New())
	slot0.facade:registerProxy(GuildProxy.New())
	slot0.facade:registerProxy(VoteProxy.New())
	slot0.facade:registerProxy(ChallengeProxy.New())
	slot0.facade:registerProxy(CommanderProxy.New())
	slot0.facade:registerProxy(ColoringProxy.New())
	slot0.facade:registerProxy(AnswerProxy.New())
	slot0.facade:registerProxy(TechnologyProxy.New())
	slot0.facade:registerProxy(BillboardProxy.New())
	slot0.facade:registerProxy(TechnologyNationProxy.New())
	slot0.facade:registerProxy(AttireProxy.New())
	slot0.facade:registerProxy(ShipSkinProxy.New())
	slot0.facade:registerProxy(SecondaryPWDProxy.New({}))
	slot0.facade:registerProxy(SkirmishProxy.New())
	slot0.facade:registerProxy(PrayProxy.New())
	slot0.facade:registerProxy(EmojiProxy.New())
	pg.ConnectionMgr.GetInstance():setPacketIdx(1)
	pg.ConnectionMgr.GetInstance():Send(11001, {
		timestamp = 0
	}, 11002, function (slot0)
		print("player loaded: " .. slot0.timestamp)
		pg.TimeMgr.GetInstance():SetServerTime(slot0.timestamp, slot0.monday_0oclock_timestamp)

		slot2 = getProxy(PlayerProxy).getData(slot1)

		if slot0 then
			pg.StoryMgr:GetInstance():Reset()
			pg.PushNotificationMgr:GetInstance():Reset()

			if not isAiriJP() then
				BilibiliSdkMgr.inst:createRole(slot2.id, slot2.name, slot2.level, 1000 * slot2.registerTime, "vip0", slot2:getTotalGem())
			end
		end

		pg.SeriesGuideMgr:GetInstance():setPlayer(slot2)

		slot6 = getProxy(ServerProxy).getLastServer(slot5, getProxy(UserProxy).getData(slot3).uid)

		if not isAiriJP() then
			BilibiliSdkMgr.inst:enterServer(tostring(slot6.id), slot6.name, slot2.id, slot2.name, slot2.registerTime * 1000, slot2.level, "vip0", slot2:getTotalGem())
		end

		slot5:recordLoginedServer(slot4.uid, slot6.id)
		slot1:sendNotification(GAME.LOAD_PLAYER_DATA_DONE)
		BilibiliSdkMgr.inst:callSdkApi("bindCpu", nil)
		getProxy(PlayerProxy).setInited(slot7, true)
		pg.SecondaryPWDMgr.GetInstance():FetchData()
	end)
end

return class("LoadPlayerDataCommand", pm.SimpleCommand)
