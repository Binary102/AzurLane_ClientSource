return {
	uiEffect = "",
	name = "勇敢1-2",
	cd = 0,
	id = 11951,
	picture = "0",
	desc = "队伍中英驱触发",
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
				"TargetAllHelp",
				"TargetNationality",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 11952,
				nationality = 2,
				ship_type_list = {
					1
				}
			}
		}
	}
}
