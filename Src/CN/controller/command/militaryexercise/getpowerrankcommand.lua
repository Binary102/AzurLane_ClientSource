slot1 = 100
slot2 = 5

class("GetPowerRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.type
	slot4 = slot2.force
	slot5 = slot2.activityId or 0
	slot6 = getProxy(BillboardProxy)

	if not slot4 and not slot6:canFetch(slot3) then
		print("this rank time has not arrived")

		return
	end

	function slot7(slot0, slot1, slot2)
		slot0:setListByType(slot0, slot1)
		slot0:setPlayerDataByType(slot0, slot2)
		slot1:sendNotification(GAME.GET_POWERRANK_DONE, {
			list = slot1,
			type = slot0,
			playerRankinfo = slot2,
			activityId = slot2
		})
	end

	if slot3 == PowerRank.TYPE_MILITARY_RANK then
		pg.ConnectionMgr.GetInstance():Send(18006, {
			type = 0
		}, 18007, function (slot0)
			slot1 = {}

			for slot5, slot6 in ipairs(slot0.arena_rank_lsit) do
				slot7 = PowerRank.New(slot6, slot0)

				slot7:setRank(slot5)
				table.insert(slot1, slot7)
			end

			slot2 = getProxy(PlayerProxy):getData()
			slot3 = getProxy(BayProxy):getShipById(slot2.character)
			slot5 = {
				user_id = slot2.id,
				point = getProxy(MilitaryExerciseProxy):getSeasonInfo().score,
				name = slot2.name,
				lv = slot2.level,
				icon = slot3:getConfig("id"),
				arena_rank = slot2.maxRank,
				skin_id = slot3.skinId,
				propose = (slot3.propose and 1) or 0,
				remoulded = (slot3:isRemoulded() and 1) or 0
			}
			slot6 = PowerRank.New(slot5, slot0)

			slot6:setRank(slot4.rank)
			slot1(slot0, slot1, slot6)
		end)
	else
		slot8 = {}

		function slot9(slot0, slot1, slot2)
			if #slot0 < (slot0 - 1) * slot1 / slot2 then
				slot1()

				return
			end

			pg.ConnectionMgr.GetInstance():Send(18201, {
				page = slot0,
				type = slot3,
				act_id = slot2
			}, 18202, function (slot0)
				for slot4, slot5 in ipairs(slot0.list) do
					table.insert(slot1, PowerRank.New(slot5, slot0))
				end

				slot2()
			end)
		end

		slot10 = nil

		function slot11(slot0, slot1)
			pg.ConnectionMgr.GetInstance():Send(18203, {
				type = slot0,
				act_id = slot1
			}, 18204, function (slot0)
				slot2 = getProxy(BayProxy):getShipById(getProxy(PlayerProxy):getData().character)
				slot3 = nil

				if slot0 == PowerRank.TYPE_POWER then
					slot3 = getProxy(BayProxy):getBayPower()
				elseif slot0 == PowerRank.TYPE_COLLECTION then
					slot3 = getProxy(CollectionProxy):getCollectionCount()
				elseif slot0 == PowerRank.TYPE_PT then
					slot3 = (getProxy(ActivityProxy):getActivityById(slot1) and slot4.data1) or slot0.point
				elseif slot0 == PowerRank.TYPE_CHALLENGE then
					slot3 = (getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE_RANK) and slot4.data1) or slot0.point
				elseif slot0 == PowerRank.TYPE_EXTRA_CHAPTER then
					slot3 = (getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK) and slot4.data1) or slot0.point
				else
					slot3 = slot0.point
				end

				slot4 = {
					user_id = slot1.id,
					point = slot3,
					name = slot1.name,
					lv = slot1.level,
					icon = slot2:getConfig("id"),
					arena_rank = slot1.maxRank,
					skin_id = slot2.skinId,
					propose = (slot2.propose and 1) or 0,
					remoulded = (slot2:isRemoulded() and 1) or 0
				}

				slot2:setRank(slot0.rank)
				slot3()
			end)
		end

		slot12 = {}

		for slot16 = 1, slot1, 1 do
			table.insert(slot12, function (slot0)
				slot0(slot0, slot0, )
			end)
		end

		table.insert(slot12, function (slot0)
			slot0(slot0, slot0)
		end)
		seriesAsync(slot12, function ()
			if #slot0 > 0 and slot1 then
				slot1 = 1

				for slot5, slot6 in ipairs(slot0) do
					if slot6.power < slot0 then
						slot1 = slot1 + 1
					end

					slot6:setRank(slot1)

					slot0 = slot6.power
				end
			end

			slot2(slot3, slot2, )
		end)
	end
end

return class("GetPowerRankCommand", pm.SimpleCommand)
