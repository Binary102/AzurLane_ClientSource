slot0 = class("Activity", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.stopTime = slot1.stop_time
	slot0.data1 = defaultValue(slot1.data1, 0)
	slot0.data2 = defaultValue(slot1.data2, 0)
	slot0.data3 = defaultValue(slot1.data3, 0)
	slot0.data4 = defaultValue(slot1.data4, 0)
	slot0.data1_list = {}

	for slot5, slot6 in ipairs(slot1.data1_list) do
		table.insert(slot0.data1_list, slot6)
	end

	slot0.data2_list = {}

	for slot5, slot6 in ipairs(slot1.data2_list) do
		table.insert(slot0.data2_list, slot6)
	end

	slot0.data3_list = {}

	for slot5, slot6 in ipairs(slot1.data3_list) do
		table.insert(slot0.data3_list, slot6)
	end

	slot0.data1KeyValueList = {}
	slot2 = ipairs
	slot3 = slot1.date1_key_value_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.data1KeyValueList[slot6.key] = {}
		slot7 = ipairs
		slot8 = slot6.value_list or {}

		for slot10, slot11 in slot7(slot8) do
			slot0.data1KeyValueList[slot6.key][slot11.key] = slot11.value
		end
	end
end

function slot0.updateDataList(slot0, slot1)
	table.insert(slot0.data1_list, slot1)
end

function slot0.updateKVPList(slot0, slot1, slot2, slot3)
	if not slot0.data1KeyValueList[slot1] then
		slot0.data1KeyValueList[slot1] = {}
	end

	slot0.data1KeyValueList[slot1][slot2] = slot3
end

function slot0.getKVPList(slot0, slot1, slot2)
	if not slot0.data1KeyValueList[slot1] then
		slot0.data1KeyValueList[slot1] = {}
	end

	return slot0.data1KeyValueList[slot1][slot2] or 0
end

function slot0.getData1(slot0)
	return slot0.data1
end

function slot0.getData3(slot0)
	return slot0.data3
end

function slot0.getData1List(slot0)
	return slot0.data1_list
end

function slot0.bindConfigTable(slot0)
	return pg.activity_template
end

function slot0.getDataConfigTable(slot0)
	slot2 = slot0:getConfig("config_id")

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		return pg.activity_event_nianshou[tonumber(slot2)]
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return pg.activity_event_monopoly[tonumber(slot2)]
	end
end

function slot0.getDataConfig(slot0, slot1)
	return slot0:getDataConfigTable()[slot1]
end

function slot0.isEnd(slot0)
	return slot0.stopTime > 0 and slot0.stopTime <= pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.increaseUsedCount(slot0, slot1)
	if slot1 == 1 then
		slot0.data1 = slot0.data1 + 1
	elseif slot1 == 2 then
		slot0.data2 = slot0.data2 + 1
	end
end

function slot0.readyToAchieve(slot0)
	slot1 = false

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LEVELAWARD then
		slot3 = getProxy(PlayerProxy):getRawData()

		for slot8 = 1, #pg.activity_level_award[slot0:getConfig("config_id")].front_drops, 1 do
			if slot4.front_drops[slot8][1] <= slot3.level and not _.include(slot0.data1_list, slot10) then
				slot1 = true

				break
			end
		end
	elseif slot2 == ActivityConst.ACTIVITY_TYPE_TASKS then
		slot3, slot4, slot5 = GetDoingTask(slot0)
		slot1 = slot5 and slot5:isFinish() and not slot5:isReceive()
	elseif slot2 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		if slot0:getConfig("config_id") == 2 or slot0:getConfig("config_id") == 3 then
			slot3, slot4, slot5 = GetDoingTask(slot0)
			slot1 = slot5 and slot5:isFinish() and not slot5:isReceive()
		end
	elseif slot2 == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		return not (slot0:getDataConfig("hp") <= slot0.data3) and slot0:getCountForHitMonster() > 0
	elseif slot2 == ActivityConst.ACTIVITY_TYPE_DODGEM then
		slot3 = pg.TimeMgr.GetInstance()

		return (slot0.data4 == 0 and slot0.data2 >= 7) or defaultValue(slot0.data2_list[1], 0) > 0 or defaultValue(slot0.data2_list[2], 0) > 0 or slot0.data2 < math.min(slot3:DiffDay(slot0.data1, slot3:GetServerTime()) + 1, 7) or slot0.data3 < slot3.DiffDay(slot0.data1, slot3.GetServerTime()) + 1
	elseif slot2 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return (math.ceil((pg.TimeMgr.GetInstance():GetServerTime() - slot0.data1) / 86400) * slot0:getDataConfig("daily_time") + slot0.data1_list[1]) - slot0.data1_list[2] > 0 or slot0.data2_list[1] - slot0.data2_list[2] > 0
	end

	return slot1
end

function slot0.isShow(slot0)
	return slot0:getConfig("is_show") > 0
end

function slot0.getShowPriority(slot0)
	return slot0:getConfig("is_show")
end

function slot0.left4Day(slot0)
	if slot0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function slot0.getAwardInfos(slot0)
	return slot0.data1KeyValueList or {}
end

function slot0.updateData(slot0, slot1, slot2)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not slot0:getAwardInfos()[slot1] then
			slot0.data1KeyValueList[slot1] = {}
		end

		for slot8, slot9 in ipairs(slot2) do
			if slot0.data1KeyValueList[slot1][slot9] then
				slot0.data1KeyValueList[slot1][slot9] = slot0.data1KeyValueList[slot1][slot9] + 1
			else
				slot0.data1KeyValueList[slot1][slot9] = 1
			end
		end
	end
end

function slot0.getTaskShip(slot0)
	return slot0:getConfig("config_client")[1]
end

function slot0.getNotificationMsg(slot0)
	slot2 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SHOP then
		slot2 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		slot2 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		slot2 = ActivityProxy.ACTIVITY_HITMONSTER_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		slot2 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	end

	return slot2
end

function slot0.getCountForHitMonster(slot0)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		return ((pg.TimeMgr:GetInstance():parseTimeFrom(pg.TimeMgr:GetInstance():GetServerTime() - pg.TimeMgr:GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2])) + 1) * slot0:getDataConfig("daily_count") + slot0:getDataConfig("first_extra_count")) - slot0.data2
	end
end

function slot0.getDayIndex(slot0)
	slot2 = pg.TimeMgr.GetInstance()

	return slot2:DiffDay(pg.TimeMgr:GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2]), slot2:GetServerTime()) + 1
end

function slot0.getStartTime(slot0)
	return pg.TimeMgr:GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2])
end

return slot0
