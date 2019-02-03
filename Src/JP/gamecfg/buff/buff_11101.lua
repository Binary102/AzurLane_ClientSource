return {
	time = 6,
	name = "约克公爵1技能",
	init_effect = "",
	picture = "",
	desc = "6s减速",
	stack = 1,
	id = 11101,
	icon = 11101,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				number = -4000,
				attr = "velocity"
			}
		}
	}
}
