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
end

function slot0.set(slot0, slot1, slot2)
	slot0.templates = slot1
	slot0.tickets = slot2

	slot0:flush()
end

function slot0.flush(slot0)
	slot1 = pg.TimeMgr.GetInstance()

	UIItemList.New(slot0.content, slot0.item).make(slot2, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3(slot2:Find("left"), slot0.temp[slot1 * 2 + 1])
			function (slot0, slot1)
				setActive(slot2, false)
				setActive(slot3, false)
				setActive(slot0:Find("wait"), false)

				if not slot1 then
					setActive(slot4, true)
					onButton(slot0, slot4, function ()
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
					end, SFX_PANEL)
				elseif slot1:GetServerTime() < slot1:parseTimeFromConfig(slot1.time[2], true) or slot1:parseTimeFromConfig(slot1.time[3], true) < slot1:GetServerTime() then
					setActive(slot3, true)
					onButton(slot0, slot3, function ()
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
					end, SFX_PANEL)
				else
					setActive(slot2, true)
					GetImageSpriteFromAtlasAsync("activitybanner/" .. slot1.bg, "", slot2)
					setSlider(slot2:Find("progress"), 0, 1, #_.filter(pg.memory_group[slot1.memory_group].memories, function (slot0)
						return pg.StoryMgr.GetInstance():IsPlayed(pg.memory_template[slot0].story)
					end) / #pg.memory_group[slot1.memory_group].memories)
					setText(slot2:Find("progress_text"), math.floor(#_.filter(pg.memory_group[slot1.memory_group].memories, function (slot0)
						return pg.StoryMgr.GetInstance().IsPlayed(pg.memory_template[slot0].story)
					end) / #pg.memory_group[slot1.memory_group].memories * 100) .. "%")
					setText(slot2:Find("index"), (slot2 + 1 < 10 and "0" .. slot2 + 1) or slot2 + 1)
					onButton(slot0, slot2, function ()
						slot0.onItem(slot1)
					end, SFX_PANEL)
				end
			end(slot2:Find("right"), slot0.temp[slot1 * 2 + 2])
		end
	end)
	setText(slot0.numsTxt, slot0.tickets .. "/" .. pg.gameset.reactivity_ticket_max.key_value)
	onButton(slot0, slot0.bg, function ()
		slot0.onCancel()
	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = i18n("levelScene_remaster_help_tip")
		})
	end, SFX_PANEL)

	for slot7, slot8 in ipairs(slot3) do
		onToggle(slot0, slot8, function (slot0)
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

	triggerToggle(slot3[2], true)
end

return slot0
