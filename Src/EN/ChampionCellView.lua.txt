slot0 = class("ChampionCellView", import(".SpineCellView"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.tfFighting = slot0.tf:Find("fighting")
	slot0.tfEffectFound = slot0.tf:Find("effect_found")
	slot0.tfDamageCount = slot0.tf:Find("damage_count")
end

slot0.getOrder = function (slot0)
	return 2
end

return slot0
