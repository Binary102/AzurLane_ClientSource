ys = ys or {}
ys.Battle.BattleSkillDamage = class("BattleSkillDamage", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillDamage.__name = "BattleSkillDamage"

function ys.Battle.BattleSkillDamage.Ctor(slot0, slot1)
	slot0.Battle.BattleSkillDamage.super.Ctor(slot0, slot1, lv)

	slot0._number = slot0._tempData.arg_list.number
end

function ys.Battle.BattleSkillDamage.DoDataEffect(slot0, slot1, slot2)
	slot2:UpdateHP(-slot0._number, {
		isMiss = false,
		isCri = false,
		isHeal = false
	})

	if not slot2:IsAlive() then
		slot0.Battle.BattleAttr.Spirit(slot2)
		slot0.Battle.BattleAttr.Whosyourdaddy(slot2)
	end
end

return
