return {
	uiEffect = "",
	name = "Z2BUFF",
	cd = 0,
	picture = "0",
	desc = "Z2BUFF",
	painting = 1,
	id = 11970,
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
			target_choise = {
				"TargetSelf"
			},
			arg_list = {
				buff_id = 11971
			}
		}
	}
}
