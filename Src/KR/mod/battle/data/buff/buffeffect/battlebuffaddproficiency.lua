ys = ys or {}
slot1 = class("BattleBuffAddProficiency", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAddProficiency = slot1
slot1.__name = "BattleBuffAddProficiency"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._group = slot0._tempData.arg_list.group or slot2:GetID()
	slot0._nationalityList = slot0._tempData.arg_list.nationality
	slot0._weaponTypeList = slot0._tempData.arg_list.type
	slot0._number = slot0._tempData.arg_list.number
end

function slot1.onAttach(slot0, slot1, slot2)
	slot0:calcEnhancement(slot1:GetAllWeapon(), true)
end

function slot1.onRemove(slot0, slot1, slot2)
	slot0:calcEnhancement(slot1:GetAllWeapon(), false)
end

function slot1.calcEnhancement(slot0, slot1, slot2)
	slot3 = slot0._number

	if not slot2 then
		slot3 = slot3 * -1
	end

	for slot7, slot8 in ipairs(slot1) do
		slot9 = 1

		if slot0._weaponTypeList and not table.contains(slot0._weaponTypeList, slot8:GetTemplateData().type) then
			slot9 = slot9 * 0
		end

		if slot0._nationalityList and not table.contains(slot0._nationalityList, slot8:GetNationality()) then
			slot9 = slot9 * 0
		end

		if slot9 == 1 then
			slot8:SetPotentialFactor(slot8:GetPotential() + slot3)
		end
	end
end

return
