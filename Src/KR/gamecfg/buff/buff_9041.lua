return {
	desc_get = "",
	name = "U556切换模式",
	init_effect = "",
	id = 9040,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 9040,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffShiftBullet",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				bullet_id = 9006,
				index = {
					1,
					2,
					3
				}
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onSubmarineDive"
			},
			arg_list = {
				count = 1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 9041,
				target = "TargetSelf"
			}
		}
	}
}
