return {
	uiEffect = "",
	name = "勇敢1",
	cd = 0,
	picture = "0",
	desc = "勇敢1",
	painting = 1,
	id = 11950,
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
				buff_id = 11951
			}
		}
	}
}
