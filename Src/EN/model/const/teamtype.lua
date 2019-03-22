slot0 = class("TeamType")
slot0.Vanguard = "vanguard"
slot0.Main = "main"
slot0.Submarine = "submarine"
slot0.VanguardShipType = {
	1,
	2,
	3,
	9,
	11
}
slot0.MainShipType = {
	4,
	5,
	6,
	7,
	10,
	12,
	13
}
slot0.SubShipType = {
	8
}
slot0.VanguardMax = 3
slot0.MainMax = 3
slot0.SubmarineMax = 3

function slot0.TeamToTypeList(slot0)
	if slot0 == slot0.Vanguard then
		return slot0.VanguardShipType
	elseif slot0 == slot0.Main then
		return slot0.MainShipType
	elseif slot0 == slot0.Submarine then
		return slot0.SubShipType
	end
end

return slot0
