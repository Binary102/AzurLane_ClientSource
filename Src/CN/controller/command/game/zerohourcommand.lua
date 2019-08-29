class("ZeroHourCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = getProxy(PlayerProxy).getData(slot2)

	slot3:resetBuyOilCount()

	for slot7, slot8 in pairs(slot3.vipCards) do
		if slot8:isExpire() then
			slot3.vipCards[slot8.id] = nil
		end
	end

	slot2:updatePlayer(slot3)
	getProxy(EventProxy).resetFlushTimes(slot4)

	if getProxy(ShopsProxy):getShopStreet() then
		slot6:resetflashCount()
		slot5:setShopStreet(slot6)
	end

	getProxy(CollectionProxy).resetEvaCount(slot7)

	slot8 = getProxy(MilitaryExerciseProxy)
	slot9 = slot8:getSeasonInfo()

	slot9:resetFlashCount()
	slot8:updateSeasonInfo(slot9)
	getProxy(DailyLevelProxy).resetDailyCount(slot10)

	slot11 = getProxy(ChapterProxy)

	slot11:resetRepairTimes()
	slot11:resetShamChapter()
	slot11:resetEscortChallengeTimes()

	for slot16, slot17 in pairs(slot12) do
		if slot17.todayDefeatCount > 0 then
			slot17.todayDefeatCount = 0

			slot11:updateChapter(slot17)
		end
	end

	getProxy(DailyLevelProxy):clearChaptersDefeatCount()

	if pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t").day == 1 and not ChapterConst.ActivateMirror then
		slot11:getShamChapter().simId = slot13.month

		slot11:updateShamChapter(slot15)
		slot11.shamShop:update(slot13.month, {})
	end

	for slot18, slot19 in ipairs(getProxy(ActivityProxy).getPanelActivities(slot14)) do
		if slot20() then
			slot14:updateActivity(slot19)
		end
	end

	if slot14:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot15:isEnd() then
		slot15.data1KeyValueList = {
			{}
		}

		slot14:updateActivity(slot15)
	end

	if getProxy(VoteProxy):getVoteGroup() then
		slot16.votes = 0

		slot16:updateVoteGroup(slot17)
	end

	if getProxy(GuildProxy):getData() then
		slot19:resetGuildContributeFlag()
		slot18:updateGuild(slot19)
	end

	slot0:sendNotification(GAME.CLASS_FORCE_UPDATE)
	getProxy(TechnologyProxy).updateRefreshFlag(slot20, 0)
	PlayerPrefs.SetInt("stop_remind_operation", 0)
	PlayerPrefs.Save()

	slot21 = getProxy(TaskProxy)
	slot22 = getProxy(ActivityProxy)

	_.each(slot23, function (slot0)
		if slot0 and not slot0:isEnd() and slot0:getConfig("config_id") == 3 then
			slot1 = slot0:getConfig("config_data")

			if slot0.data1 < pg.TimeMgr.GetInstance():GetServerTime() then
				slot3 = math.clamp(slot2:DiffDay(slot0.data1, slot2:GetServerTime()) + 1, 1, #slot1)

				if slot0.data3 == 0 or (slot4 < slot3 and _.all(_.flatten({
					slot1[slot4]
				}), function (slot0)
					return slot0:getFinishTaskById(slot0) ~= nil
				end)) then
					pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
						cmd = 1,
						activity_id = slot0.id
					})
				end
			end
		end
	end)
	getProxy(CommanderProxy):resetBoxUseCnt()

	if slot22:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot24:isEnd() then
		slot24.data1KeyValueList = {}

		slot22:updateActivity(slot24)
	end

	if slot22:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY) and not slot25:isEnd() then
		slot22:updateActivity(slot25)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot26:isEnd() then
		slot0:sendNotification(GAME.CHALLENGE2_INFO, {})
	end

	slot0:sendNotification(GAME.REQUEST_MINI_GAME, {
		type = MiniGameRequestCommand.REQUEST_HUB_DATA
	})
end

return class("ZeroHourCommand", pm.SimpleCommand)
