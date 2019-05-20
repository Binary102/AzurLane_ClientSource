slot0 = class("MonthSignPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.items = slot0:findTF("items")
	slot0.item = slot0:findTF("item", slot0.items)
end

function slot0.OnDataSetting(slot0)
	slot0.config = pg.activity_month_sign[slot0.activity.data2]

	if not slot0.config then
		return true
	end

	slot0.monthDays = pg.TimeMgr.GetInstance():CalcMonthDays(slot0.activity.data1, slot0.activity.data2)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)

	slot0.list = UIItemList.New(slot0.items, slot0.item)

	slot0.list:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			updateDrop(slot2, _.map(slot0.config["day" .. slot3], function (slot0)
				return {
					type = slot0[1],
					id = slot0[2],
					count = slot0[3]
				}
			end)[1])
			onButton(slot0, slot2, function ()
				if #slot0 == 1 then
					slot1:emit(BaseUI.ON_DROP, slot0[1])
				else
					slot1:emit(BaseUI.ON_DROP_LIST, {
						content = "",
						item2Row = true,
						itemList = slot1.emit
					})
				end
			end, SFX_PANEL)
			setText(slot2:Find("day/Text"), "Day " .. slot3)
			setActive(slot2:Find("got"), slot1 + 1 <= #slot0.activity.data1_list)
			setActive(slot2:Find("today"), slot3 == #slot0.activity.data1_list)
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.list:align(slot0.monthDays)
end

function slot0.OnDestroy(slot0)
	removeAllChildren(slot0.items)
end

return slot0
