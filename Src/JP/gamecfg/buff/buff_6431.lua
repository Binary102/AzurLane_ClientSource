return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6431,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6430,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minWeaponNumber = 1,
				check_weapon = true,
				skill_id = 6431,
				index = {
					1
				},
				type = {
					7
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minWeaponNumber = 1,
				check_weapon = true,
				skill_id = 6432,
				index = {
					2
				},
				type = {
					7
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minWeaponNumber = 1,
				check_weapon = true,
				skill_id = 6433,
				index = {
					3
				},
				type = {
					7
				}
			}
		}
	}
}
