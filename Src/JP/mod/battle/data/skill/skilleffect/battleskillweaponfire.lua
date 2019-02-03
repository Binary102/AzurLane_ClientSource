ys = ys or {}
slot1 = class("BattleSkillWeaponFire", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillWeaponFire = slot1
slot1.__name = "BattleSkillWeaponFire"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1, lv)

	slot0._weaponType = slot0._tempData.arg_list.weaponType
end

function slot1.DoDataEffect(slot0, slot1, slot2)
	if slot0:_GetWeapon(slot1) then
		slot3:SingleFire(slot2)
	end
end

function slot1.DoDataEffectWithoutTarget(slot0, slot1)
	slot0:DoDataEffect(slot1, nil)
end

function slot1._GetWeapon(slot0, slot1)
	slot2 = nil

	return (slot0._weaponType ~= "ChargeWeapon" or slot1:GetChargeList()[1]) and (slot0._weaponType ~= "TorpedoWeapon" or slot1:GetTorpedoList()[1]) and (slot0._weaponType ~= "AirAssist" or slot1:GetAirAssistList()[1]) and slot1:GetAutoWeapons()[1]
end

return
