return {
	uiEffect = "",
	name = "killer_Airplane",
	cd = 0,
	picture = "0",
	desc = "killer_Airplanes",
	painting = 1,
	id = 11651,
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
				buff_id = 11652
			}
		}
	}
}
