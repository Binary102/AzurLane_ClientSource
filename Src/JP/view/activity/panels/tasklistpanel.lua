slot0 = class("TaskListPanel", import(".ActivityPanel"))

function slot0.getDefaultBg(slot0)
	return "Clutter/banai_daily"
end

function slot0.onInit(slot0)
	slot0.dayTF = slot0:findTF("layer/day")
	slot0.item = slot0:findTF("layer/item")
	slot0.items = slot0:findTF("layer/items")
	slot0.layout = slot0:findTF("layout", slot0.items)
	slot0.uilist = UIItemList.New(slot0.layout, slot0.item)

	setActive(slot0.item, false)
end

function slot0.onUpdate(slot0)
	slot2 = slot0.activity.data3
	slot3 = getProxy(TaskProxy)
	slot4 = slot0.activity.getConfig(slot1, "config_data")

	if slot0.activity:getConfig("config_client").story and slot5[slot2] and slot5[slot2][1] and not pg.StoryMgr.GetInstance():IsPlayed(slot5[slot2][1]) then
		slot6:Play(slot5[slot2][1])
	end

	if slot0.dayTF then
		setText(slot0.dayTF, tostring(slot2))
	end

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			updateDrop(slot4, slot8)
			onButton(slot0, slot4, function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)

			slot9 = slot0:findTF("btn", slot2)
			slot9:GetComponent(typeof(Image)).enabled = false

			setButtonEnabled(slot9, false)

			slot10 = slot3:getTaskById(slot1[slot2][slot1 + 1]) or slot3:getFinishTaskById(slot5)

			if slot10 then
				setText(slot0:findTF("description", slot2), slot10:getConfig("desc"))
				setSlider(slot0:findTF("progress", slot2), 0, slot12, slot11)
				setText(slot0:findTF("progressText", slot2), slot11 .. "/" .. slot10:getConfig("target_num"))

				slot9:GetComponent(typeof(Image)).enabled = not slot10:isFinish()

				setActive(slot9:Find("get"), slot10:isFinish() and not slot10:isReceive())
				setActive(slot9:Find("achieved"), slot10:isReceive())
				setButtonEnabled(slot9, not slot10:isReceive())
				onButton(slot0, slot9, function ()
					if not slot0:isFinish() then
						slot1:emit(ActivityMediator.ON_TASK_GO, slot1.emit)
					else
						slot1:emit(ActivityMediator.ON_TASK_SUBMIT, slot1.emit)
					end
				end, SFX_PANEL)
			end
		end
	end)
	slot0.uilist:align(#slot4[slot2])
end

function slot0.onDispose(slot0)
	eachChild(slot0.layout, function (slot0)
		Destroy(slot0)
	end)
end

return slot0
