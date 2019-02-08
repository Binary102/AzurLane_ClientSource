slot0 = class("PropertyPanel")
slot1 = 24.5
slot2 = {
	"cannon",
	"torpedo",
	"air",
	"dodge",
	"antiaircraft",
	"durability"
}
slot3 = {
	E = 1,
	C = 3,
	A = 5,
	D = 2,
	S = 6,
	B = 4
}

function slot4(slot0)
	return 0.66 * slot0[slot0]
end

slot5 = 2
slot6 = 5

function slot0.Ctor(slot0, slot1, slot2)
	slot3 = slot2 or slot0
	slot2 or slot0.tf = slot1
	slot2 or slot0.propertyTFs = findTF(slot2 or slot0.tf, "property")
	slot2 or slot0.drawTF = findTF(slot2 or slot0.tf, "property/draw")
	slot3.drawPolygon = slot2 or slot0.drawTF:GetComponent("DrawPolygon")

	return

	slot3 = slot0
end

function slot0.initProperty(slot0, slot1)
	slot0:initRadar(pg.ship_data_statistics[slot1].grades)

	return
end

function slot0.initRadar(slot0, slot1)
	slot3 = {}

	table.insert(slot2, Vector3(0, 0, 0))

	for slot7, slot8 in ipairs(slot0) do
		slot0:setSpriteTo("resources/" .. slot10, slot0.propertyTFs:Find(slot8 .. "_grade").Find(slot9, "grade"), true)

		slot11 = slot1(slot10)

		if slot7 == slot2 then
			table.insert(slot2, Vector3(-slot11 * slot3, 0, 0))
		else
			if slot7 == slot4 then
				table.insert(slot2, Vector3(slot11 * slot3, 0, 0))
			else
				table.insert(slot2, slot0:getGradeCoordinate(slot10, slot7))
			end
		end

		table.insert(slot3, 0)
		table.insert(slot3, slot7)

		if slot7 + 1 > #slot0 then
			table.insert(slot3, 1)
		else
			table.insert(slot3, slot7 + 1)
		end
	end

	slot0.drawPolygon:draw(slot2, slot3)

	return
end

slot7 = 1
slot8 = 3
slot9 = 4

function slot0.getGradeCoordinate(slot0, slot1, slot2)
	slot5 = math.sin(math.rad(slot3)) * slot0(slot1) * slot1
	slot6 = math.cos(math.rad(60)) * slot0(slot1) * slot1

	if slot2 == slot2 then
		slot6 = -slot6
	else
		if slot2 == slot3 then
			slot6 = -slot6
			slot5 = -slot5
		else
			if slot2 == slot4 then
				slot5 = -slot5
			end
		end
	end

	return Vector3(slot6, slot5, 0)
end

function slot0.setSpriteTo(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).sprite = findTF(slot0.tf, slot1):GetComponent(typeof(Image)).sprite

	if slot3 then
		slot4:SetNativeSize()
	end

	return
end

return slot0
