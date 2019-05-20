slot0 = class("NewPtAccuPage", import(".TemplatePage.PtTemplatePage"))
slot0.TIME = 300

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.value2 = slot0:findTF("AD/value2"):GetComponent(typeof(Text))
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot0.value2.text = slot0.ptData:GetValue2()

	slot0.super.GetWorldPtData(slot0, slot0.TIME)
end

return slot0
