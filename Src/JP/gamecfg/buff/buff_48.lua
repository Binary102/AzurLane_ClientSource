return {
	time = 0,
	name = "绝地反击",
	init_effect = "",
	picture = "",
	desc = "减速，别抽风",
	stack = 1,
	id = 48,
	icon = 48,
	last_effect = "",
	limit = {},
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = -3000,
				attr = "velocity"
			}
		}
	}
}
