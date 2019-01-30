return {
	time = 0,
	name = "测试",
	init_effect = "",
	picture = "",
	desc = "测试用航速buff",
	stack = 1,
	id = 900000,
	icon = 900000,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 200,
				attr = "velocity"
			}
		}
	}
}
