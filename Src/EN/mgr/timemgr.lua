pg = pg or {}
pg.TimeMgr = singletonClass("TimeMgr")
pg.TimeMgr._Timer = nil
pg.TimeMgr._BattleTimer = nil
pg.TimeMgr._deltaTime = 0
pg.TimeMgr._begin = 0
slot2 = 3600
slot3 = 86400
slot4 = 604800

function pg.TimeMgr.Ctor(slot0)
	slot0._battleTimerList = {}
end

function pg.TimeMgr.Init(slot0)
	print("initializing time manager...")

	slot0._Timer = TimeUtil.NewUnityTimer()

	UpdateBeat:Add(slot0.Update, slot0)
end

function pg.TimeMgr.Update(slot0)
	if slot0._stopCombatTime > 0 then
		slot0._cobTime = slot0._stopCombatTime - slot0._waitTime
	else
		slot0._cobTime = Time.time - slot0._waitTime
	end

	slot0._Timer:Schedule()
end

function pg.TimeMgr.AddTimer(slot0, slot1, slot2, slot3, slot4)
	return slot0._Timer:SetTimer(slot1, slot2 * 1000, slot3 * 1000, slot4)
end

function pg.TimeMgr.RemoveTimer(slot0, slot1)
	if slot1 == nil or slot1 == 0 then
		return
	end

	slot0._Timer:DeleteTimer(slot1)
end

pg.TimeMgr._waitTime = 0
pg.TimeMgr._stopCombatTime = 0
pg.TimeMgr._cobTime = 0

function pg.TimeMgr.GetCombatTime(slot0)
	return slot0._cobTime
end

function pg.TimeMgr.ResetCombatTime(slot0)
	slot0._waitTime = 0
	slot0._cobTime = Time.time
end

function pg.TimeMgr.GetCombatDeltaTime()
	return Time.fixedDeltaTime
end

function pg.TimeMgr.PauseBattleTimer(slot0)
	slot0._stopCombatTime = Time.time

	for slot4, slot5 in pairs(slot0._battleTimerList) do
		slot4:Pause()
	end
end

function pg.TimeMgr.ResumeBattleTimer(slot0)
	slot0._waitTime = (slot0._waitTime + Time.time) - slot0._stopCombatTime
	slot0._stopCombatTime = 0

	for slot4, slot5 in pairs(slot0._battleTimerList) do
		slot4:Resume()
	end
end

function pg.TimeMgr.AddBattleTimer(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0._battleTimerList[Timer.New(slot4, slot3, slot2 or -1, slot5 or false)] = true

	if not (slot6 or false) then
		slot7:Start()
	end

	if slot0._stopCombatTime ~= 0 then
		slot7:Pause()
	end

	return slot7
end

function pg.TimeMgr.ScaleBattleTimer(slot0, slot1)
	Time.timeScale = slot1
end

function pg.TimeMgr.RemoveBattleTimer(slot0, slot1)
	if slot1 then
		slot0._battleTimerList[slot1] = nil

		slot1:Stop()
	end
end

function pg.TimeMgr.RemoveAllBattleTimer(slot0)
	for slot4, slot5 in pairs(slot0._battleTimerList) do
		slot4:Stop()
	end

	slot0._battleTimerList = {}
end

function pg.TimeMgr.RealtimeSinceStartup(slot0)
	return math.ceil(Time.realtimeSinceStartup)
end

function pg.TimeMgr.SetServerTime(slot0, slot1, slot2)
	SwitchTimeZone(slot1)

	slot0._deltaTime = slot1 - slot0:RealtimeSinceStartup()

	print("self._deltaTime :", slot0._deltaTime, slot0:RealtimeSinceStartup())

	slot0._begin = slot2
end

function pg.TimeMgr.GetServerWeek(slot0)
	return math.ceil((slot0:GetServerTime() - slot0._begin) % slot0 / slot0.GetServerTime())
end

function pg.TimeMgr.GetServerTime(slot0)
	return slot0:RealtimeSinceStartup() + slot0._deltaTime
end

function pg.TimeMgr.DescClientTime(slot0, slot1, slot2)
	return os.date(slot2 or "%Y%m%d%H%M%S", slot1)
end

function pg.TimeMgr.DescTime(slot0, slot1, slot2, slot3)
	slot2 = slot2 or "%Y/%m/%d %H:%M:%S"

	if slot3 then
		return os.date(slot2, slot1)
	else
		return os.date(slot2, (slot1 - slot0._deltaTime + os.time()) - slot0:RealtimeSinceStartup())
	end
end

function pg.TimeMgr.ServerTimeDesc(slot0, slot1, slot2)
	return slot0:DescTime(slot0:GetServerTime(), slot1, slot2)
end

function pg.TimeMgr.GetNextTime(slot0, slot1, slot2, slot3, slot4)
	return math.floor((slot0:GetServerTime() - (slot0._begin + slot1 * 3600 + slot2 * 60 + slot3)) / (slot4 or 86400) + 1) * (slot4 or 86400) + slot0._begin + slot1 * 3600 + slot2 * 60 + slot3
end

function pg.TimeMgr.GetNextWeekTime(slot0, slot1, slot2, slot3, slot4)
	return math.floor((slot0:GetServerTime() - slot0._begin) / 604800 + 1) * 604800 + slot0._begin
end

function pg.TimeMgr.ParseTime(slot0, slot1)
	return os.server_time({
		year = tonumber(slot1) / 100 / 100 / 100 / 100 / 100,
		month = (tonumber(slot1) / 100 / 100 / 100 / 100) % 100,
		day = (tonumber(slot1) / 100 / 100 / 100) % 100,
		hour = (tonumber(slot1) / 100 / 100) % 100,
		min = (tonumber(slot1) / 100) % 100,
		sec = tonumber(slot1) % 100
	})
end

function pg.TimeMgr.ParseTimeEx(slot0, slot1, slot2)
	if slot2 == nil then
		slot2 = "(%d+)%-(%d+)%-(%d+)%s(%d+)%:(%d+)%:(%d+)"
	end

	slot10.year, slot10.month, slot10.day, slot10.hour, slot10.min, slot10.sec = slot1:match(slot2)

	return os.server_time({
		year = slot3,
		month = slot4,
		day = slot5,
		hour = slot6,
		min = slot7,
		sec = slot8
	})
end

function pg.TimeMgr.parseTimeFromConfig(slot0, slot1)
	return os.server_time({
		year = slot1[1][1],
		month = slot1[1][2],
		day = slot1[1][3],
		hour = slot1[2][1],
		min = slot1[2][2],
		sec = slot1[2][3]
	})
end

function pg.TimeMgr.DescCDTime(slot0, slot1)
	return string.format("%02d:%02d:%02d", math.floor(slot1 / 3600), math.floor((slot1 - math.floor(slot1 / 3600) * 3600) / 60), (slot1 - math.floor(slot1 / 3600) * 3600) % 60)
end

function pg.TimeMgr.parseTimeFrom(slot0, slot1)
	return math.floor(slot1 / 86400), math.fmod(math.floor(slot1 / 3600), 24), math.fmod(math.floor(slot1 / 60), 60), math.fmod(slot1, 60)
end

function pg.TimeMgr.DiffDay(slot0, slot1, slot2)
	if slot0:IsSameDay(slot1, slot2) then
		return 0
	else
		return math.floor((slot2 - (math.ceil((slot1 + SERVER_TIME_ZONE) / 86400) * 86400 - SERVER_TIME_ZONE)) / 86400) + ((math.ceil((slot1 + SERVER_TIME_ZONE) / 86400) * 86400 - SERVER_TIME_ZONE == slot1 and 0) or 1)
	end
end

function pg.TimeMgr.IsSameDay(slot0, slot1, slot2)
	return os.server_date("%x", slot1) == os.server_date("%x", slot2)
end

function pg.TimeMgr.IsPassTimeByZero(slot0, slot1, slot2)
	return slot2 < slot1 - (math.ceil((slot1 + SERVER_TIME_ZONE) / 86400) * 86400 - SERVER_TIME_ZONE)
end

function pg.TimeMgr.CalcMonthDays(slot0, slot1, slot2)
	slot3 = 30

	if slot2 == 2 then
		slot3 = (slot1 % 4 == 0 and 29) or 28
	elseif _.include({
		1,
		3,
		5,
		7,
		8,
		10,
		12
	}, slot2) then
		slot3 = 31
	end

	return slot3
end

function pg.TimeMgr.LaterThan(slot0, slot1, slot2)
	if slot1.year ~= slot2.year then
		return slot2.year < slot1.year
	elseif slot1.month ~= slot2.month then
		return slot2.month < slot1.month
	elseif slot1.day ~= slot2.day then
		return slot2.day < slot1.day
	elseif slot1.hour ~= slot2.hour then
		return slot2.hour < slot1.hour
	elseif slot1.min ~= slot2.min then
		return slot2.min < slot1.min
	elseif slot1.sec ~= slot2.sec then
		return slot2.sec < slot1.sec
	end

	return false
end

function pg.TimeMgr.inTime(slot0, slot1)
	if not slot1 then
		return true
	end

	if type(slot1) == "string" then
		return slot1 == "always"
	end

	function slot2(slot0)
		return {
			year = slot0[1][1],
			month = slot0[1][2],
			day = slot0[1][3],
			hour = slot0[2][1],
			min = slot0[2][2],
			sec = slot0[2][3]
		}
	end

	slot3 = nil

	if #slot1 > 0 then
		slot3 = slot2(slot1[1] or {
			{
				2000,
				1,
				1
			},
			{
				0,
				0,
				0
			}
		})
	end

	slot4 = nil

	if #slot1 > 1 then
		slot4 = slot2(slot1[2] or {
			{
				2000,
				1,
				1
			},
			{
				0,
				0,
				0
			}
		})
	end

	slot5 = nil

	if slot3 and slot4 then
		slot5 = (slot0:LaterThan(slot3, os.server_date("*t", slot0:GetServerTime())) and slot3) or (slot0:LaterThan(slot4, slot6) and slot4) or nil

		if slot0:LaterThan(slot3, slot6) or slot0:LaterThan(slot6, slot4) then
			return false, slot5
		end
	end

	return true, slot5
end

return
