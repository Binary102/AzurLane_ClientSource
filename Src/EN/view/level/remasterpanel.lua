slot0 = class("RemasterPanel", import("..base.BasePanel"))

function slot0.init(slot0)
	slot0.super.init(slot0)

	slot0.bg = slot0:findTF("bg")
	slot0.content = slot0:findTF("list/content")
	slot0.item = slot0.content:Find("item")
	slot0.numsTxt = slot0:findTF("nums/text")
	slot0.helpBtn = slot0:findTF("help")

	setActive(slot0.item, false)

	slot0.onItem = nil
	slot0.onCancel = nil
	slot0.exToggle = slot0:findTF("toggles/EX")
	slot0.spToggle = slot0:findTF("toggles/SP")
	slot0.getRemasterTF = slot0:findTF("getBtn/state_before")
	slot0.gotRemasterTF = slot0:findTF("getBtn/state_after")
end

function slot0.set(slot0, slot1, slot2, slot3)
	slot0.templates = slot1
	slot0.tickets = slot2

	slot0:flush(slot3)
end

function slot0.flush(slot0, slot1)
	slot2 = pg.TimeMgr.GetInstance()

	UIItemList.New(slot0.content, slot0.item).make(slot3, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3(slot2:Find("left"), slot1 * 2 + 1)
			function (slot0, slot1)
				setActive(slot3, false)
				setActive(slot4, false)
				setActive(slot0:Find("wait"), false)

				if not slot0.temp[slot1] then
					setActive(slot5, true)
					onButton(slot0, slot5, function ()
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
					end, SFX_PANEL)
				elseif slot1:GetServerTime() < slot1:parseTimeFromConfig(slot2.time[2], true) or slot1:parseTimeFromConfig(slot2.time[3], true) < slot1:GetServerTime() then
					setActive(slot4, true)
					onButton(slot0, slot4, function ()
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
					end, SFX_PANEL)
				else
					setActive(slot3, true)
					GetImageSpriteFromAtlasAsync("activitybanner/" .. slot2.bg, "", slot3)
					setSlider(slot3:Find("progress"), 0, 1, #_.filter(pg.memory_group[slot2.memory_group].memories, function (slot0)
						return pg.StoryMgr.GetInstance():IsPlayed(pg.memory_template[slot0].story)
					end) / #pg.memory_group[slot2.memory_group].memories)
					setText(slot3:Find("progress_text"), math.floor(#_.filter(pg.memory_group[slot2.memory_group].memories, function (slot0)
						return pg.StoryMgr.GetInstance().IsPlayed(pg.memory_template[slot0].story)
					end) / #pg.memory_group[slot2.memory_group].memories * 100) .. "%")
					setText(slot3:Find("index"), (slot1 < 10 and "0" .. slot1) or slot1)
					onButton(slot0, slot3, function ()
						slot0.onItem(slot1)
					end, SFX_PANEL)
				end
			end(slot2:Find("right"), slot1 * 2 + 2)
		end
	end)
	setText(slot0.numsTxt, slot0.tickets .. "/" .. pg.gameset.reactivity_ticket_max.key_value)
	onButton(slot0, slot0.bg, function ()
		slot0.onCancel()
	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("levelScene_remaster_help_tip")
		})
	end, SFX_PANEL)

	for slot8, slot9 in ipairs(slot4) do
		onToggle(slot0, slot9, function (slot0)
			if slot0 then
				slot0.temp = _.filter(slot0.templates, function (slot0)
					return slot0.activity_type == slot0
				end)

				_.filter(slot0.templates, function (slot0)
					return slot0.activity_type == slot0
				end):align(math.max(math.ceil(#slot0.temp / 2), 2))
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot4[slot1 or 1], true)

	if getProxy(ChapterProxy).remasterDailyCount > 1 then
		SetActive(slot0.getRemasterTF, false)
		SetActive(slot0.gotRemasterTF, true)
	else
		SetActive(slot0.getRemasterTF, true)
		SetActive(slot0.gotRemasterTF, false)
		onButton(slot0, slot0.getRemasterTF, function ()
			if pg.gameset.reactivity_ticket_max.key_value < slot0.remasterTickets + pg.gameset.reactivity_ticket_daily.key_value then
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("tack_tickets_max_warning", math.max(pg.gameset.reactivity_ticket_max.key_value - slot0.remasterTickets, 0)),
					onYes = function ()
						slot0:emit(LevelMediator2.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN)
					end
				})

				return
			end

			slot1:emit(LevelMediator2.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN)
		end, SFX_PANEL)
	end
end

return slot0
