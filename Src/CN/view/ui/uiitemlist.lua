slot0 = class("UIItemList")
slot0.EventInit = 1
slot0.EventUpdate = 2
slot0.EventExcess = 3

function slot0.Ctor(slot0, slot1, slot2)
	slot0.container = slot1
	slot0.item = slot2
end

function slot0.make(slot0, slot1)
	slot0.callback = slot1
end

function slot0.align(slot0, slot1)
	for slot5 = slot1, slot0.container.childCount - 1, 1 do
		setActive(slot0.container:GetChild(slot5), false)

		if slot0.callback then
			slot0.callback(slot0.EventExcess, slot5, slot6)
		end
	end

	for slot5 = slot0.container.childCount, slot1 - 1, 1 do
		slot6 = cloneTplTo(slot0.item, slot0.container)

		if slot0.callback then
			slot0.callback(slot0.EventInit, slot5, slot6)
		end
	end

	for slot5 = 0, slot1 - 1, 1 do
		setActive(slot0.container:GetChild(slot5), true)

		if slot0.callback then
			slot0.callback(slot0.EventUpdate, slot5, slot6)
		end
	end
end

function slot0.each(slot0, slot1)
	for slot5 = slot0.container.childCount - 1, 0, -1 do
		slot1(slot5, slot0.container:GetChild(slot5))
	end
end

return slot0
