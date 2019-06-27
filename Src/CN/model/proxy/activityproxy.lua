slot0 = class("ActivityProxy", import(".NetProxy"))
slot0.ACTIVITY_ADDED = "ActivityProxy ACTIVITY_ADDED"
slot0.ACTIVITY_UPDATED = "ActivityProxy ACTIVITY_UPDATED"
slot0.ACTIVITY_DELETED = "ActivityProxy ACTIVITY_DELETED"
slot0.ACTIVITY_OPERATION_DONE = "ActivityProxy ACTIVITY_OPERATION_DONE"
slot0.ACTIVITY_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOW_AWARDS"
slot0.ACTIVITY_SHOP_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOP_SHOW_AWARDS"
slot0.ACTIVITY_SHOW_BB_RESULT = "ActivityProxy ACTIVITY_SHOW_BB_RESULT"
slot0.ACTIVITY_LOTTERY_SHOW_AWARDS = "ActivityProxy ACTIVITY_LOTTERY_SHOW_AWARDS"
slot0.ACTIVITY_HITMONSTER_SHOW_AWARDS = "ActivityProxy ACTIVITY_HITMONSTER_SHOW_AWARDS"
slot0.ACTIVITY_SHOW_REFLUX_AWARDS = "ActivityProxy ACTIVITY_SHOW_REFLUX_AWARDS"
slot0.ACTIVITY_OPERATION_ERRO = "ActivityProxy ACTIVITY_OPERATION_ERRO"
slot0.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT = "ActivityProxy ACTIVITY_SHOW_LOTTERY_AWARD_RESULT"
slot0.ACTIVITY_PT_ID = 110

function slot0.register(slot0)
	slot0:on(11200, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.activity_list) do
			if not pg.activity_template[slot5.id] then
				Debugger.LogError("活动acvitity_template不存在: " .. slot5.id)
			else
				if Activity.New(slot5).getConfig(slot6, "type") == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 or slot7 == ActivityConst.ACTIVITY_TYPE_CHALLENGE then
					slot0:updateActivityFleet(slot5)
				end

				slot0.data[slot5.id] = slot6
			end
		end

		if slot0.data[ActivityConst.MILITARY_EXERCISE_ACTIVITY_ID] then
			getProxy(MilitaryExerciseProxy):addSeasonOverTimer()
		end

		if ChapterConst.ActivateMirror then
			getProxy(ChapterProxy):checkMirrorCount()
		end

		if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot1:isEnd() then
			slot0:sendNotification(GAME.CHALLENGE2_INFO, {})
		end

		if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot2:isEnd() and slot2.data1 == 0 then
			slot0:monitorTaskList(slot2)
		end
	end)
	slot0:on(11201, function (slot0)
		if not slot0.data[Activity.New(slot0.activity_info).id] then
			slot0:addActivity(slot1)
		else
			slot0:updateActivity(slot1)
		end

		if pg.activity_template[slot1.id].type == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			slot0:updateActivityFleet(slot0.activity_info)
		end
	end)
end

function slot0.getActivityByType(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function slot0.getActivitiesByType(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getActivitiesByTypes(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if table.contains(slot1, slot7:getConfig("type")) then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getMilitaryExerciseActivity(slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			slot1 = slot6

			break
		end
	end

	return Clone(slot1)
end

function slot0.getPanelActivities(slot0)
	slot1 = {
		ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN,
		ActivityConst.ACTIVITY_TYPE_LEVELAWARD,
		ActivityConst.ACTIVITY_TYPE_LEVELPLAN,
		ActivityConst.ACTIVITY_TYPE_MONTHSIGN,
		ActivityConst.ACTIVITY_TYPE_CHARGEAWARD,
		ActivityConst.ACTIVITY_TYPE_ZPROJECT,
		ActivityConst.ACTIVITY_TYPE_SHOP,
		ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN,
		ActivityConst.ACTIVITY_TYPE_DAILY_TASK,
		ActivityConst.ACTIVITY_TYPE_TASK_LIST,
		ActivityConst.ACTIVITY_TYPE_PUZZLA,
		ActivityConst.ACTIVITY_TYPE_BB,
		ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN,
		ActivityConst.ACTIVITY_TYPE_COLORING,
		ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE,
		ActivityConst.ACTIVITY_TYPE_CARD_PAIRS,
		ActivityConst.ACTIVITY_TYPE_ANSWER,
		ActivityConst.ACTIVITY_TYPE_TASKS,
		ActivityConst.ACTIVITY_TYPE_TASK_RES,
		ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA,
		ActivityConst.ACTIVITY_TYPE_LINK_LINK,
		ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD,
		ActivityConst.ACTIVITY_TYPE_MONOPOLY,
		ActivityConst.ACTIVITY_TYPE_BUILD,
		ActivityConst.ACTIVITY_TYPE_DODGEM,
		ActivityConst.ACTIVITY_TYPE_PT_ACCUM,
		ActivityConst.ACTIVITY_TYPE_RETURN_AWARD
	}

	return _(_.values(slot0.data)):chain():filter(function (slot0)
		if _.contains(slot0, slot0:getConfig("type")) and slot0:isShow() then
			if slot1 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				slot2 = slot0.data2 == 0
			elseif slot1 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				if slot0.data1 >= 7 then
					slot2 = not slot0.achieved

					if not slot0.achieved then
						slot2 = false

						if false then
							slot2 = true
						end
					end
				end
			else
				return (slot1 ~= ActivityConst.ACTIVITY_TYPE_DAILY_TASK or false) and not slot0:isEnd()
			end
		end
	end):sort(function (slot0, slot1)
		return slot0.id < slot1.id
	end):value()
end

function slot0.getBannerDisplays(slot0)
	return _(pg.activity_banner.all):chain():map(function (slot0)
		return pg.activity_banner[slot0]
	end):filter(function (slot0)
		return pg.TimeMgr.GetInstance():inTime(slot0.time)
	end):value()
end

function slot0.getNoticeBannerDisplays(slot0)
	return _.map(pg.activity_banner_notice.all, function (slot0)
		return pg.activity_banner_notice[slot0]
	end)
end

function slot0.findNextAutoActivity(slot0)
	slot1 = nil
	slot3 = pg.TimeMgr.GetInstance().GetServerTime(slot2)

	for slot7, slot8 in ipairs(slot0:getPanelActivities()) do
		if slot8:isShow() and not slot8.autoActionForbidden then
			if slot8:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				slot12 = #pg.activity_7_day_sign[slot8:getConfig("config_id")].front_drops + 1

				if slot8.getConfig("config_id") == 3 then
					slot12 = #slot11
				end

				if slot8.data1 < slot12 and not slot2:IsSameDay(slot3, slot8.data2) then
					slot1 = slot8

					break
				end
			else
				if slot9 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
					slot10 = getProxy(ChapterProxy)

					if (slot8.data1 < 7 and not slot2:IsSameDay(slot3, slot8.data2)) or (slot8.data1 == 7 and not slot8.achieved and slot10:isClear(204)) then
						slot1 = slot8

						break
					end
				else
					if slot9 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
						if pg.TimeMgr.GetInstance():STimeDescS(slot3, "*t").year ~= slot8.data1 or slot10.month ~= slot8.data2 then
							slot8.data1 = slot10.year
							slot8.data2 = slot10.month
							slot8.data1_list = {}
							slot1 = slot8

							break
						else
							if not table.contains(slot8.data1_list, slot10.day) then
								slot1 = slot8

								break
							end
						end
					end
				end
			end
		end
	end

	return slot1
end

function slot0.findRefluxAutoActivity(slot0)
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot1:isEnd() and not slot1.autoActionForbidden then
		slot2 = pg.TimeMgr.GetInstance()

		if slot1.data1_list[2] < #pg.return_sign_template.all and not slot2:IsSameDay(slot2:GetServerTime(), slot1.data1_list[1]) then
			return 1
		end
	end

	return
end

function slot0.existRefluxAwards(slot0)
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot1:isEnd() then
		for slot6 = #pg.return_pt_template.all, 1, -1 do
			if slot2[slot2.all[slot6]].pt_require <= slot1.data3 and slot1.data4 < slot7 then
				return true
			end
		end

		slot3 = getProxy(TaskProxy)

		if _.any(_(slot1:getConfig("config_data")[7]):chain():map(function (slot0)
			return slot0[2]
		end):flatten():map(function (slot0)
			return slot0:getTaskById(slot0) or slot0:getFinishTaskById(slot0) or false
		end):filter(function (slot0)
			return not not slot0
		end):value(), function (slot0)
			return slot0:getTaskStatus() == 1
		end) then
			return true
		end
	end

	return
end

function slot0.getActivityById(slot0, slot1)
	return Clone(slot0.data[slot1])
end

function slot0.updateActivity(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0.facade:sendNotification(slot0.ACTIVITY_UPDATED, slot1:clone())

	return
end

function slot0.addActivity(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0.facade:sendNotification(slot0.ACTIVITY_ADDED, slot1:clone())

	return
end

function slot0.deleteActivityById(slot0, slot1)
	slot0.data[slot1] = nil

	slot0.facade:sendNotification(slot0.ACTIVITY_DELETED, slot1)

	return
end

function slot0.readyToAchieveByType(slot0, slot1)
	slot2 = false

	for slot7, slot8 in ipairs(slot3) do
		if slot8:readyToAchieve() then
			slot2 = true

			break
		end
	end

	return slot2
end

function slot0.getBuildBgActivityByID(slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		if not slot7:isEnd() and slot7:getConfig("config_client") and slot8.id == slot1 then
			return slot8.bg
		end
	end

	return nil
end

function slot0.getBuffList(slot0)
	_.each(slot2, function (slot0)
		if slot0 and not slot0:isEnd() then
			table.insert(slot0, ActivityBuff.New(slot0.id, slot0:getConfig("config_id")))
		end

		return
	end)

	return _.filter({}, function (slot0)
		return slot0:isActivate()
	end)
end

function slot0.getVirtualItemNumber(slot0, slot1)
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot2:isEnd() then
		return (slot2.data1KeyValueList[1][slot1] and slot2.data1KeyValueList[1][slot1]) or 0
	end

	return 0
end

function slot0.removeVitemById(slot0, slot1, slot2)
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot3:isEnd() then
		slot3.data1KeyValueList[1][slot1] = slot3.data1KeyValueList[1][slot1] - slot2
	end

	slot0:updateActivity(slot3)

	return
end

function slot0.addVitemById(slot0, slot1, slot2)
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot3:isEnd() then
		if not slot3.data1KeyValueList[1][slot1] then
			slot3.data1KeyValueList[1][slot1] = 0
		end

		slot3.data1KeyValueList[1][slot1] = slot3.data1KeyValueList[1][slot1] + slot2
	end

	slot0:updateActivity(slot3)

	return
end

function slot0.monitorTaskList(slot0, slot1)
	if slot1 and not slot1:isEnd() and slot1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR and getProxy(TaskProxy):isReceiveTasks(slot1:getConfig("config_data")[1] or {}) then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot1.id
		})
	end

	return
end

function slot0.updateActivityFleet(slot0, slot1)
	getProxy(FleetProxy):addActivityFleet(slot1.id, slot1.group_list)

	return
end

function slot0.recommendActivityFleet(slot0, slot1, slot2)
	slot5 = getProxy(BayProxy)
	slot6 = getProxy(FleetProxy):getActivityFleets()[slot1][slot2]

	function slot7(slot0, slot1)
		for slot7, slot8 in ipairs(slot3) do
			slot1:insertShip(slot8, nil, slot0)
		end

		return
	end

	if Fleet.SUBMARINE_FLEET_ID <= slot2 then
		if not slot6:isFull() then
			slot7(TeamType.Submarine, TeamType.SubmarineMax - #slot6.subShips)
		end
	else
		slot9 = TeamType.MainMax - #slot6.mainShips

		if TeamType.VanguardMax - #slot6.vanguardShips > 0 then
			slot7(TeamType.Vanguard, slot8)
		end

		if slot9 > 0 then
			slot7(TeamType.Main, slot9)
		end
	end

	getProxy(FleetProxy):updateActivityFleet(slot1, slot2, slot6)

	return
end

return slot0
