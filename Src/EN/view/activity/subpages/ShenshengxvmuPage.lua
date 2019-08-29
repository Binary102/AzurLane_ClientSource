slot0 = class("ShenshengxvmuPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)
	setActive(slot0.displayBtn, false)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)
	setActive(slot0.battleBtn, false)

	slot1, slot2, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.step, (slot3 >= 1 and setColorStr(slot1, COLOR_GREEN)) or slot1)
	setText(slot0.progress, "/" .. slot2)
end

return slot0
