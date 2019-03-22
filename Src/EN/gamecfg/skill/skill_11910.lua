return {
	uiEffect = "",
	name = "独立技能1",
	cd = 0,
	picture = "0",
	desc = "独立技能1",
	painting = 1,
	id = 11910,
	castCV = "skill",
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetSelf",
			arg_list = {
				buff_id = 11911
			}
		}
	}
}
