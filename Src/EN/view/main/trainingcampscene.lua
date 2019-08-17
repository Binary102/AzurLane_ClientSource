slot0 = class("TrainingCampScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TrainingCampUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.init(slot0)
	slot0.togglesTF = slot0:findTF("bg/frame/toggles")
	slot0.uilist = UIItemList.New(slot0:findTF("bg/frame/main/scrollrect/content"), slot0:findTF("bg/frame/main/scrollrect/content/task"))
	slot0.phaseTF = slot0:findTF("bg/frame/main/progress")
	slot0.frameTF = slot0:findTF("bg/frame")
	slot0.awardMsg = slot0:findTF("bg/awards")

	slot0:closeMsgBox()
end

function slot0.didEnter(slot0)
	slot0:initToggles()
	onButton(slot0, slot0:findTF("top/left_top/back_button"), function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("top/help"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.newplayer_help_tip.tip
		})
	end, SFX_PANEL)
end

function slot0.initToggles(slot0)
	slot0.toggles = {
		slot0:findTF("phase1", slot0.togglesTF),
		slot0:findTF("phase2", slot0.togglesTF),
		slot0:findTF("phase3", slot0.togglesTF)
	}

	slot0:updatePhase()

	for slot4, slot5 in pairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				if slot0.phaseId <  then
					pg.TipsMgr.GetInstance():ShowTips(i18n("newplayer_notice_7"))
					triggerToggle(slot0.toggles[slot0.contextData.pageId], true)
				else
					slot0:switchPage(slot0.switchPage)
				end
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot0.toggles[slot0.phaseId], true)
end

function slot0.updatePhase(slot0)
	slot1 = 1
	slot2 = slot0.activity:getConfig("config_data")[3]
	slot3 = getProxy(TaskProxy)

	function slot4(slot0)
		if slot0 > 1 then
			return slot1:getFinishTaskById(slot0[slot0 - 1][2]) ~= nil
		end
	end

	for slot8 = #slot0.toggles, 1, -1 do
		if _.all(slot2[slot8][1], function (slot0)
			return (slot0:getTaskById(slot0) or slot0:getFinishTaskById(slot0)) ~= nil
		end) or slot4(slot8) then
			slot1 = slot8

			break
		end
	end

	slot0.phaseId = slot1 or 1

	for slot8, slot9 in ipairs(slot0.toggles) do
		setActive(slot9:Find("disable"), slot0.phaseId < slot8)
	end
end

function slot0.updateTask(slot0, slot1, slot2, slot3)
	slot5 = slot2:Find("got")
	slot6 = slot2:Find("go")
	slot7 = getProxy(TaskProxy)
	slot9 = setActive
	slot10 = slot2:Find("get")

	if slot0:getTask(slot3, slot1) and slot8:isFinish() then
		slot11 = not slot8:isReceive()
	end

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot5

	if slot8 then
		slot11 = slot8:isReceive()
	end

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot6

	if slot8 then
		if slot8 then
			slot11 = not slot8:isFinish()

			if not slot8.isFinish() then
				slot11 = false
			end
		end
	else
		slot11 = true
	end

	slot9(slot10, slot11)

	if slot8 and slot8:isClientTrigger() and not slot8:isFinish() then
		slot0:emit(TrainingCampMediator.ON_UPDATE, slot8)
	end

	slot8 = slot8 or Task.New({
		id = slot1
	})

	setText(slot2:Find("title"), slot8 or Task.New():getConfig("desc"))
	updateDrop(slot2:Find("item"), {
		type = slot8 or Task.New():getConfig("award_display")[1][1],
		id = slot8 or Task.New().getConfig("award_display")[1][2],
		count = slot8 or Task.New().getConfig("award_display")[1][3]
	})
	setText(slot2:Find("progress"), math.min(slot8.progress, slot8:getConfig("target_num")) .. "/" .. slot8:getConfig("target_num"))
	onButton(slot0, slot4, function ()
		slot0:emit(TrainingCampMediator.ON_GET, slot0)

		return
	end, SFX_PANEL)
	onButton(slot0, slot6, function ()
		slot0:emit(TrainingCampMediator.ON_GO, slot0)

		return
	end, SFX_PANEL)

	return

	slot8 = Task.New()
end

function slot0.switchPage(slot0, slot1)
	slot0.contextData.pageId = slot1
	slot2 = getProxy(TaskProxy)

	function slot6(slot0)
		if slot0:isReceive() then
			return 0
		else
			if slot0:isFinish() then
				return 2
			else
				if not slot0:isFinish() then
					return 1
				end
			end
		end

		return -1
	end

	table.sort(slot4, function (slot0, slot1)
		if not slot0:getTaskById(slot0) and not slot0:getFinishTaskById(slot0) then
			slot2 = Task.New({
				id = slot0
			})
		end

		if not slot0:getTaskById(slot1) and not slot0:getFinishTaskById(slot1) then
			slot3 = Task.New({
				id = slot1
			})
		end

		if slot1(slot2) == slot1(slot3) then
			if slot2.id >= slot3.id then
				slot6 = false
			else
				slot6 = true
			end

			return slot6
		else
			if slot5 >= slot4 then
				slot6 = false
			else
				slot6 = true
			end

			return slot6
		end

		return
	end)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0:updateTask(slot1[slot1 + 1], slot2, slot2)
		end

		return
	end)
	slot0.uilist:align(#slot0.activity:getConfig("config_data")[3][slot1][1])

	function slot7()
		return _.all(_.all, function (slot0)
			if slot0:getFinishTaskById(slot0) == nil then
				slot1 = false
			else
				slot1 = true
			end

			return slot1
		end)
	end

	function slot8()
		return _.any(_.any, function (slot0)
			if not slot0:getFinishTaskById(slot0) then
				slot1 = slot0:getTaskById(slot0)
			end

			if slot1 ~= nil then
				slot2 = false
			else
				slot2 = true
			end

			return slot2
		end)
	end

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("get")

	if slot0:getTask(slot1, slot5) and slot9:isFinish() then
		slot12 = not slot9:isReceive()
	end

	slot10(slot11, slot12)
	setActive(slot0.phaseTF:Find("lock"), not slot9)

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("go")

	if slot9 then
		slot12 = not slot9:isFinish()
	end

	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("pass")

	if slot9 then
		slot12 = slot9:isReceive()
	end

	slot10(slot11, slot12)

	if slot1 == slot0.phaseId and slot8() then
		slot0:emit(TrainingCampMediator.ON_TRIGGER, {
			cmd = 1,
			activity_id = slot0.activity.id
		})
	end

	if slot9 and slot9:isClientTrigger() and not slot9:isFinish() then
		slot0:emit(TrainingCampMediator.ON_UPDATE, slot9)
	end

	if not slot9 then
		slot9 = Task.New({
			id = slot5
		})

		if slot7() then
			slot0:emit(TrainingCampMediator.ON_TRIGGER, {
				cmd = 2,
				activity_id = slot0.activity.id
			})
		end

		setText(slot0.phaseTF:Find("slider/label"), i18n("newplayer_notice_" .. slot1))
		_.each(slot4, function (slot0)
			if slot0:getFinishTaskById(slot0) ~= nil then
				slot1 = slot1 + 1
			end

			return
		end)
		setText(slot0.phaseTF:Find("slider/Text"), slot10 .. "/" .. #slot4)
	else
		setText(slot0.phaseTF:Find("slider/label"), slot9:getConfig("desc"))
		setText(slot0.phaseTF:Find("slider/Text"), math.min(slot9.progress, slot9:getConfig("target_num")) .. "/" .. slot9:getConfig("target_num"))
	end

	slot0.phaseTF:Find("slider"):GetComponent(typeof(Slider)).value = slot9.progress / slot9:getConfig("target_num")
	slot0.phaseTF:Find("icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/trainingcampui_atlas", "icon_" .. slot1)

	setText(slot0.phaseTF:Find("tip"), i18n("newplayer_notice_" .. 3 + slot1))
	onButton(slot0, slot0.phaseTF:Find("get"), function ()
		if slot0:isSelectable() then
			slot1:openMsgbox(function (slot0)
				slot0:emit(TrainingCampMediator.ON_SELECTABLE_GET, slot0.emit, slot0)

				return
			end)
		else
			slot1:emit(TrainingCampMediator.ON_GET, slot1.emit)
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.phaseTF:Find("go"), function ()
		slot0:emit(TrainingCampMediator.ON_GO, slot0)

		return
	end, SFX_PANEL)

	return
end

function slot0.getTask(slot0, slot1, slot2)
	slot3 = getProxy(TaskProxy)
	slot4 = nil

	if slot0.phaseId <= slot1 then
		if not slot3:getTaskById(slot2) then
			slot4 = slot3:getFinishTaskById(slot2)
		end
	else
		Task.New({
			id = slot2
		}).progress = Task.New():getConfig("target_num")
		Task.New().submitTime = 1
	end

	return slot4
end

function slot0.openMsgbox(slot0, slot1)
	setActive(slot0.awardMsg, true)
	setActive(slot0.frameTF, false)

	slot2 = nil

	for slot7 = 1, slot0.awardMsg:Find("photos").childCount, 1 do
		onToggle(slot0, slot3:GetChild(slot7 - 1), function (slot0)
			if slot0 then
				slot0 = slot1
			end

			return
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.awardMsg:Find("confirm_btn"), function ()
		if slot0 then
			if slot1 then
				slot1(slot1)
			end

			slot2:closeMsgBox()
		end

		return
	end, SFX_PANEL)

	return
end

function slot0.closeMsgBox(slot0)
	setActive(slot0.awardMsg, false)
	setActive(slot0.frameTF, true)

	return
end

function slot0.willExit(slot0)
	return
end

return slot0
