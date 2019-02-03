slot0 = class("RemasterPanel", import("..base.BasePanel"))

function slot0.init(slot0)
	slot0.super.init(slot0)

	slot0.content = slot0:findTF("list/content")
	slot0.item = slot0.content:Find("item")
	slot0.numsTxt = slot0:findTF("nums/text")
	slot0.helpBtn = slot0:findTF("help")

	setActive(slot0.item, false)

	slot0.onItem = nil
	slot0.onCancel = nil
end

function slot0.set(slot0, slot1, slot2)
	slot0.templates = slot1
	slot0.tickets = slot2

	slot0:flush()
end

function slot0.flush(slot0)
	slot1 = pg.TimeMgr.GetInstance()
	slot2 = UIItemList.New(slot0.content, slot0.item)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot0.templates[slot1 + 1]

			setActive(slot2:Find("right"), slot1 % 2 == 0)
			setActive(setActive, false)
			setActive(slot2.Find("right"), false)
			setActive(slot2:Find("bg/wait"), false)

			if not slot3 then
				setActive(slot6, true)
				onButton(slot0, slot6, function ()
					pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
				end, SFX_PANEL)
			elseif slot1:GetServerTime() < slot1:parseTimeFromConfig(slot3.time[2], true) or slot1:parseTimeFromConfig(slot3.time[3], true) < slot1:GetServerTime() then
				setActive(slot5, true)
				onButton(slot0, slot5, function ()
					pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
				end, SFX_PANEL)
			else
				setActive(slot4, true)
				GetImageSpriteFromAtlasAsync("activitybanner/" .. slot3.bg, "", slot4)
				setSlider(slot4:Find("progress"), 0, 1, #_.filter(pg.memory_group[slot3.memory_group].memories, function (slot0)
					return pg.StoryMgr.GetInstance():IsPlayed(pg.memory_template[slot0].story)
				end) / #pg.memory_group[slot3.memory_group].memories)
				setText(slot4:Find("progress_text"), math.floor(#_.filter(pg.memory_group[slot3.memory_group].memories, function (slot0)
					return pg.StoryMgr.GetInstance().IsPlayed(pg.memory_template[slot0].story)
				end) / #pg.memory_group[slot3.memory_group].memories * 100) .. "%")
				setText(slot4:Find("index"), (slot1 + 1 < 10 and "0" .. slot1 + 1) or slot1 + 1)
				onButton(slot0, slot4, function ()
					slot0.onItem(slot1)
				end, SFX_PANEL)
			end
		end
	end)
	slot2:align(math.ceil(#slot0.templates / 4) * 4)
	setText(slot0.numsTxt, slot0.tickets .. "/" .. pg.gameset.reactivity_ticket_max.key_value)
	onButton(slot0, slot0._tf, function ()
		slot0.onCancel()
	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = i18n("levelScene_remaster_help_tip")
		})
	end, SFX_PANEL)
end

return slot0
