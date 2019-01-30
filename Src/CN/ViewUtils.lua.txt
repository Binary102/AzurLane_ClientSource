pg = pg or {}
pg.ViewUtils = class("ViewUtils")
slot2 = nil

pg.ViewUtils.SetLayer = function (slot0, slot1)
	slot0.gameObject.layer = slot1

	for slot6 = 0, slot0.childCount - 1, 1 do
		slot0:GetChild(slot6).gameObject.layer = slot1

		slot0.SetLayer(slot0.GetChild(slot6), slot1)
	end
end

return
