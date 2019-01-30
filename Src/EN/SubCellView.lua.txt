slot0 = class("SubCellView", import(".SpineCellView"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.tfShadow = slot0.tf:Find("shadow")
	slot0.tfAmmo = slot0.tf:Find("ammo")
	slot0.tfAmmoText = slot0.tfAmmo:Find("text")
end

slot0.getOrder = function (slot0)
	return 3
end

return slot0
