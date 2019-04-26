slot0 = class("DaysLoginPanel", import(".ActivityPanel"))

function slot0.getDefaultBg(slot0)
	return "Clutter/14days_login"
end

function slot0.onInit(slot0)
	slot0.items = slot0:findTF("items")
	slot0.uilist = UIItemList.New(slot0.items, slot0.items:Find("item"))

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			onButton(slot1, slot2, function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
			updateDrop(slot2, {
				type = slot0.front_drops[slot1 + 1][1],
				id = slot0.front_drops[slot1 + 1][2],
				count = slot0.front_drops[slot1 + 1][3]
			})

			if slot2.id == ActivityConst.BANAI_4DAYS_LOGIN then
				slot2:Find("icon_bg/bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/activityui_atlas", "bg" .. ({
					"1",
					"1",
					"3",
					"2",
					"3"
				})[slot3])
			end
		end
	end)
	slot0.uilist:align(#pg.activity_7_day_sign[slot0.activity.getConfig(slot1, "config_id")].front_drops)
end

function slot0.onUpdate(slot0)
	slot1 = slot0.activity

	slot0.uilist:each(function (slot0, slot1)
		setActive(slot1:Find("mask"), slot0 + 1 <= slot0.data1)
	end)
end

return slot0
