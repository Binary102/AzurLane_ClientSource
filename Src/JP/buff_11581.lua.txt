return {
	time = 6,
	name = "半人马减速",
	init_effect = "",
	picture = "",
	desc = "6s减速",
	stack = 1,
	id = 11581,
	icon = 11580,
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
