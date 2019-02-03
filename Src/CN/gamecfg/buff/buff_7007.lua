return {
	time = 30,
	name = "精英怪-急速-加速",
	init_effect = "",
	picture = "",
	desc = "精英怪-急速-加速",
	stack = 10,
	id = 7007,
	icon = 7007,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				group = 70024,
				number = 3,
				attr = "velocity"
			}
		}
	}
}
