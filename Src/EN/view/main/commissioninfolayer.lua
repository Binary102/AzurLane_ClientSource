slot0 = class("CommissionInfoLayer", import("..base.BaseUI"))
slot1 = 0.25

function slot0.getUIName(slot0)
	return "CommissionInfoUI"
end

function slot0.setEvents(slot0, slot1, slot2)
	slot0.eventList = slot1
	slot0.maxFleetNums = slot2

	slot0:updateMissions()
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	slot0:updateResource(slot1)
end

function slot0.init(slot0)
	slot0.frame = slot0:findTF("frame")

	pg.UIMgr:GetInstance():BlurPanel(slot0.frame)

	slot0.resourcesTF = slot0:findTF("info/resources", slot0.frame)
	slot0.oilTF = slot0:findTF("container/oil/bubble/Text", slot0.resourcesTF):GetComponent(typeof(Text))
	slot0.goldTF = slot0:findTF("container/gold/bubble/Text", slot0.resourcesTF):GetComponent(typeof(Text))
	slot0.oilbubbleTF = slot0:findTF("container/oil/bubble", slot0.resourcesTF)
	slot0.goldbubbleTF = slot0:findTF("container/gold/bubble", slot0.resourcesTF)
	slot0.switchBtn = GameObject.Find("/UICamera/Canvas/UIMain/MainUI(Clone)/leftPanel/commissionButton")
	slot0.missionTF = slot0:findTF("info/missions", slot0.frame)
	slot0.missionContainerTF = slot0:findTF("contiainer", slot0.missionTF)

	LeanTween.moveX(rtf(slot0.frame), 0, slot0):setFrom(-1 * slot0.frame.rect.width)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.oilbubbleTF, function ()
		if LeanTween.isTweening(go(slot0.frame)) then
			return
		end

		slot0:emit(CommissionInfoMediator.GET_OIL_RES)
	end, SFX_PANEL)
	onButton(slot0, slot0.goldbubbleTF, function ()
		if LeanTween.isTweening(go(slot0.frame)) then
			return
		end

		slot0:emit(CommissionInfoMediator.GET_GOLD_RES)
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		if LeanTween.isTweening(go(slot0.frame)) then
			return
		end

		if slot0.contextData.inFinished then
			return
		end

		LeanTween.moveX(rtf(slot0.frame), -1 * slot0.frame.rect.width, ):setOnComplete(System.Action(function ()
			LeanTween.moveX(rtf(slot0.switchBtn), 0, 0.15)
			LeanTween.moveX:emit(slot1.ON_CLOSE)
		end))
	end, SOUND_BACK)
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot0.updateMissions(slot0)
	slot0.activeEvents = {}

	for slot4, slot5 in pairs(slot0.eventList) do
		if slot5.state == EventInfo.StateActive or slot5.state == EventInfo.StateFinish then
			table.insert(slot0.activeEvents, slot5)
		end
	end

	table.sort(slot0.activeEvents, function (slot0, slot1)
		if ((slot0.state == EventInfo.StateFinish and 1) or 0) == ((slot1.state == EventInfo.StateFinish and 1) or 0) then
			return slot3 < slot2
		else
			return slot0.finishTime < slot1.finishTime
		end
	end)

	slot1 = pairs
	slot2 = slot0.timers or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:Stop()
	end

	slot0.timers = {}
	slot0.missionTFs = {}

	for slot4 = 1, 4, 1 do
		slot5 = slot0.missionContainerTF:Find("mission_" .. slot4)
		slot6 = nil

		if slot0.maxFleetNums < slot4 then
			slot6 = "lock"

			setText(slot5:Find("lock/container/title"), i18n("commission_no_open"))
			setText(slot5:Find("lock/container/condition"), i18n("commission_open_tip", slot0:getChapterByCount(slot4).chapter_name))
		elseif slot4 > #slot0.activeEvents then
			slot6 = "empty"

			onButton(slot0, slot5:Find("empty/active_btn"), function ()
				if LeanTween.isTweening(go(slot0.frame)) then
					return
				end

				slot0:emit(CommissionInfoMediator.ON_ACTIVE_EVENT)
			end, SFX_PANEL)
			onButton(slot0, slot5, function ()
				if LeanTween.isTweening(go(slot0.frame)) then
					return
				end

				slot0:emit(CommissionInfoMediator.ON_ACTIVE_EVENT)
			end, SFX_PANEL)
			setText(slot5:Find("empty/title"), i18n("commission_idle"))
		else
			slot6 = "active"
			slot0.missionTFs[slot0.activeEvents[slot4].id] = slot5

			slot0:updateMission(slot0.activeEvents[slot4])
		end

		eachChild(slot5, function (slot0)
			if slot0 ~= "active" then
				setActive(slot0, slot0 and slot0.gameObject.name == slot0)
			end
		end)
	end
end

function slot0.getChapterByCount(slot0, slot1)
	for slot6, slot7 in pairs(pg.chapter_template.all) do
		if slot2[slot7].collection_team == slot1 then
			return slot2[slot7]
		end
	end
end

function slot0.updateResource(slot0, slot1)
	setActive(slot0.oilbubbleTF, slot1.oilField ~= 0)
	setActive(slot0.goldbubbleTF, slot1.goldField ~= 0)

	slot0.oilTF.text = slot1.oilField
	slot0.goldTF.text = slot1.goldField
end

function slot0.updateMission(slot0, slot1)
	setActive(slot0.missionTFs[slot1.id].Find(slot2, "finish"), slot1.state == EventInfo.StateFinish)
	setActive(slot0.missionTFs[slot1.id].Find(slot2, "active"), slot1.state == EventInfo.StateActive)
	setActive(slot2:Find("lock"), false)
	setActive(slot2:Find("empty"), false)

	slot5 = nil

	if slot1.state == EventInfo.StateActive then
		slot5 = slot0:findTF("title", slot4)
		slot6 = slot0:findTF("time", slot4)
		slot0.timers[slot1.id] = Timer.New(function ()
			if slot0.finishTime - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
				setText(slot1, pg.TimeMgr.GetInstance():DescCDTime(slot1))
			else
				slot0.state = EventInfo.StateFinish

				slot0.timers[slot0.id]:Stop()

				slot0.timers[slot0.id].Stop.timers[slot0.id] = nil

				slot0.timers[slot0.id].Stop.timers:updateMission(slot0)
			end
		end, 1, -1)

		slot0.timers[slot1.id]:Start()
		slot0.timers[slot1.id].func()
	elseif slot1.state == EventInfo.StateFinish then
		slot5 = slot0:findTF("title", slot3)

		onButton(slot0, slot0:findTF("finish_btn", slot3), function ()
			if LeanTween.isTweening(go(slot0.frame)) then
				return
			end

			slot0:emit(CommissionInfoMediator.FINISH_EVENT, slot0)
		end, SFX_PANEL)
		onButton(slot0, slot3, function ()
			if LeanTween.isTweening(go(slot0.frame)) then
				return
			end

			slot0:emit(CommissionInfoMediator.FINISH_EVENT, slot0)
		end, SFX_PANEL)
	else
		return
	end

	setText(slot5, ((slot1.template.type == 2 and i18n("commission_urgency")) or i18n("commission_normal")) .. "\n" .. slot1.template.title)
end

function slot0.willExit(slot0)
	pg.UIMgr:GetInstance():UnblurPanel(slot0.frame, slot0._tf)

	slot1 = pairs
	slot2 = slot0.timers or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:Stop()
	end

	slot0.timers = nil
end

return slot0
