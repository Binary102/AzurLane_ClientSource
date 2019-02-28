slot0 = class("MilitaryExerciseProxy", import(".NetProxy"))
slot0.SEASON_INFO_ADDED = "MilitaryExerciseProxy SEASON_INFO_ADDED"
slot0.SEASON_INFO_UPDATED = "MilitaryExerciseProxy SEASON_INFO_UPDATED"
slot0.ARENARANK_UPDATED = "MilitaryExerciseProxy ARENARANK_UPDATED"
slot0.EXERCISE_FLEET_UPDATED = "MilitaryExerciseProxy EXERCISE_FLEET_UPDATED"
slot0.RIVALS_UPDATED = "MilitaryExerciseProxy RIVALS_UPDATED"
slot0.POWERRANK_UPDATED = "MilitaryExerciseProxy POWERRANK_UPDATED"
slot0.MYPOWERRANK_UPDATED = "MilitaryExerciseProxy MYPOWERRANK_UPDATED"
slot0.RANK_TYPE_LIST = {
	"RANK_TYPE_POWER",
	"RANK_TYPE_COLLECT",
	"RANK_TYPE_PT",
	"RANK_TYPE_PLEDGE",
	"RANK_TYPE_CHALLENGE",
	"RANK_TYPE_EXTRA_CHAPTER",
	"RANK_TYPE_ACT_BOSS_BATTLE",
	RANK_TYPE_POWER = {
		medal_small = "props/powericon",
		type = 1
	},
	RANK_TYPE_COLLECT = {
		type = 2
	},
	RANK_TYPE_PT = {
		type = 3,
		act_type = ActivityConst.ACTIVITY_TYPE_PT_RANK
	},
	RANK_TYPE_PLEDGE = {
		type = 4
	},
	RANK_TYPE_CHALLENGE = {
		type = 5,
		act_type = ActivityConst.ACTIVITY_TYPE_CHALLENGE_RANK
	},
	RANK_TYPE_EXTRA_CHAPTER = {
		type = 6,
		act_type = ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK
	},
	RANK_TYPE_ACT_BOSS_BATTLE = {
		type = 7,
		act_type = ActivityConst.ACTIVITY_TYPE_BOSS_RANK
	}
}

function slot0.register(slot0)
	slot0:on(18005, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.target_list) do
			table.insert(slot1, Rival.New(slot6))
		end

		slot2 = slot0:getSeasonInfo()

		slot2:updateScore(slot0.score + SeasonInfo.INIT_POINT)
		slot2:updateRank(slot0.rank)
		slot2:updateRivals(slot1)
		slot0:updateSeasonInfo(slot2)

		slot3 = getProxy(PlayerProxy)
		slot4 = slot3:getData()

		slot4:updateScoreAndRank(slot2.score, slot2.rank)
		slot3:updatePlayer(slot4)
	end)

	slot0.MyPowerPoint = {}
	slot0.MyPowerRank = {}
	slot0.nextTime = {}
	slot0.powerRankList = {}
	slot0.powerrankFirstPage = {}
end

function slot0.addSeasonInfo(slot0, slot1)
	slot0.seasonInfo = slot1

	slot0:sendNotification(slot0.SEASON_INFO_ADDED, slot1:clone())
	slot0:addRefreshCountTimer()
end

function slot0.addRefreshCountTimer(slot0)
	slot0:removeRefreshTimer()

	function slot1()
		slot0:sendNotification(GAME.EXERCISE_COUNT_RECOVER_UP)
	end

	if slot0.seasonInfo.resetTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		slot0.refreshCountTimer = Timer.New(function ()
			slot0()
		end, slot2, 1)

		slot0.refreshCountTimer:Start()
	else
		slot1()
	end
end

function slot0.addSeasonOverTimer(slot0)
	slot0:removeSeasonOverTimer()

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE) and not slot2:isEnd() then
		function slot3()
			slot0:sendNotification(GAME.GET_SEASON_INFO)
			slot0.sendNotification:removeSeasonOverTimer()

			slot0 = slot0.sendNotification.removeSeasonOverTimer:getSeasonInfo()

			slot0:setExerciseCount(SeasonInfo.RECOVER_UP_COUNT)
			slot0:updateSeasonInfo(slot0)
		end

		if slot2.stopTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			slot0.SeasonOverTimer = Timer.New(function ()
				slot0()
			end, slot5, 1)

			slot0.SeasonOverTimer:Start()
		else
			slot3()
		end
	end
end

function slot0.removeRefreshTimer(slot0)
	if slot0.refreshCountTimer then
		slot0.refreshCountTimer:Stop()

		slot0.refreshCountTimer = nil
	end
end

function slot0.removeSeasonOverTimer(slot0)
	if slot0.SeasonOverTimer then
		slot0.SeasonOverTimer:Stop()

		slot0.SeasonOverTimer = nil
	end
end

function slot0.remove(slot0)
	slot0:removeRefreshTimer()
	slot0:removeSeasonOverTimer()
end

function slot0.updateSeasonInfo(slot0, slot1)
	slot0.seasonInfo = slot1

	slot0:sendNotification(slot0.SEASON_INFO_UPDATED, slot1:clone())
end

function slot0.getSeasonInfo(slot0)
	return Clone(slot0.seasonInfo)
end

function slot0.updateRivals(slot0, slot1)
	slot0.seasonInfo:updateRivals(slot1)
	slot0:sendNotification(slot0.RIVALS_UPDATED, Clone(slot1))
end

function slot0.getRivals(slot0)
	return Clone(slot0.seasonInfo.rivals)
end

function slot0.getRivalById(slot0, slot1)
	for slot5, slot6 in ipairs(slot0:getRivals()) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function slot0.getPreRivalById(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.seasonInfo.preRivals) do
		if slot6.id == slot1 then
			return Clone(slot6)
		end
	end
end

function slot0.getExerciseFleet(slot0)
	return Clone(slot0.seasonInfo.fleet)
end

function slot0.updateExerciseFleet(slot0, slot1)
	slot0.seasonInfo:updateFleet(slot1)
	slot0:sendNotification(slot0.EXERCISE_FLEET_UPDATED, slot1:clone())
end

function slot0.increaseExerciseCount(slot0)
	slot0.seasonInfo:increaseExerciseCount()
end

function slot0.reduceExerciseCount(slot0)
	slot0.seasonInfo:reduceExerciseCount()
end

function slot0.updateArenaRankLsit(slot0, slot1)
	slot0.arenaRankLsit = slot1

	slot0:sendNotification(slot0.ARENARANK_UPDATED, Clone(slot1))
end

function slot0.getArenaRankList(slot0)
	return slot0.arenaRankLsit
end

function slot0.getData(slot0)
	return Clone(slot0.seasonInfo)
end

function slot0.updatePowerRankList(slot0, slot1, slot2, slot3, slot4)
	slot0.powerRankList[slot0:getRankMsgId(slot2, slot4)][slot3] = slot1

	if slot3 == 1 then
		if not slot0.powerrankFirstPage then
			slot0.powerrankFirstPage = {}
		end

		slot0.powerrankFirstPage[slot5] = slot1
	end

	slot0:sendNotification(slot0.POWERRANK_UPDATED, {
		list = slot1,
		nextTime = slot0.nextTime[slot5] or 0,
		page = slot3,
		type = slot2,
		act_id = slot4
	})
end

function slot0.clearPowerRankList(slot0, slot1, slot2)
	slot0.powerRankList[slot0:getRankMsgId(slot1, slot2)] = {}
end

function slot0.getPowerRankList(slot0, slot1, slot2, slot3)
	if not slot0.powerRankList[slot0:getRankMsgId(slot1, slot3)] then
		slot0.powerRankList[slot4] = {}
	end

	return slot0.powerRankList[slot4][slot2]
end

function slot0.setPlayerPowerRank(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:getRankMsgId(slot1, slot4)
	slot0.MyPowerPoint[slot5] = slot2
	slot0.MyPowerRank[slot5] = slot3

	slot0:sendNotification(slot0.MYPOWERRANK_UPDATED, {
		point = slot0.MyPowerPoint[slot5],
		rank = slot0.MyPowerRank[slot5],
		type = slot1,
		act_id = slot4
	})
end

function slot0.getPlayerPowerRank(slot0, slot1, slot2)
	return slot0.MyPowerPoint[slot0:getRankMsgId(slot1, slot2)], slot0.MyPowerRank[slot0.getRankMsgId(slot1, slot2)]
end

function slot0.setNextTime(slot0, slot1, slot2, slot3)
	slot0.nextTime[slot0:getRankMsgId(slot1, slot3)] = slot2
end

function slot0.getNextTime(slot0, slot1, slot2)
	return slot0.nextTime[slot0:getRankMsgId(slot1, slot2)]
end

function slot0.getPowerRank(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:getRankMsgId(slot1, slot4)

	if slot2 == 1 then
		return slot0.powerrankFirstPage[slot5][slot3]
	end

	return slot0.powerRankList[slot5][slot2][slot3]
end

function slot0.checkAndBuildRankMsg(slot0)
	if slot0.rankMsgList and slot0.rankMsgInfo then
		return
	end

	slot0.rankMsgList = {}
	slot0.rankMsgInfo = {}
	slot1 = getProxy(ActivityProxy)

	for slot5, slot6 in ipairs(slot0.RANK_TYPE_LIST) do
		slot8 = nil

		if slot0.RANK_TYPE_LIST[slot6].act_type then
			for slot12, slot13 in ipairs(slot8) do
				slot0.rankMsgInfo[slot13.id] = {
					type = slot7.type,
					act_id = slot13.id,
					medal_small = slot7.medal_small
				}

				table.insert(slot0.rankMsgList, slot13.id)
			end
		elseif slot7.type ~= 4 then
			slot0.rankMsgInfo[slot7.type] = {
				type = slot7.type,
				medal_small = slot7.medal_small
			}

			table.insert(slot0.rankMsgList, slot7.type)
		end
	end
end

function slot0.getRankMsgId(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.rankMsgList) do
		if slot0.rankMsgInfo[slot7].type == slot1 and (not slot2 or slot2 == slot8.act_id) then
			return slot2 or slot1, slot0.rankMsgInfo[slot7]
		end
	end

	return nil
end

function slot0.getRankMsg(slot0)
	return slot0.rankMsgList, slot0.rankMsgInfo
end

return slot0
