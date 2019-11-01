slot0 = class("HalloweenSkinPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.stage = slot0:findTF("AD/Text"):GetComponent(typeof(Text))
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)

	slot0.tasks = _.flatten(slot0.activity:getConfig("config_data"))
end

function slot0.OnUpdateFlush(slot0)
	slot1 = slot0.activity
	slot2 = 0
	slot3 = getProxy(TaskProxy)

	for slot7 = #slot0.tasks, 1, -1 do
		if slot3:getTaskVO(slot0.tasks[slot7]) and slot9:isReceive() then
			slot2 = slot7
		elseif slot9 and not slot9:isReceive() then
			slot2 = slot7 - 1
		end
	end

	slot0.stage.text = slot2 .. "/" .. #slot0.tasks
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
