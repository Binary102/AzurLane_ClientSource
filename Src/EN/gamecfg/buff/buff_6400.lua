return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6400,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6400,
	last_effect = "",
	limit = {
		SYSTEM_DUEL
	},
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				quota = 1,
				skill_id = 6400,
				check_target = {
					"TargetSelf",
					"TargetNationality"
				},
				nationality = {
					104
				}
			}
		}
	}
}
