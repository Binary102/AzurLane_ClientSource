return {
	time = 8,
	name = "减速",
	init_effect = "",
	picture = "",
	desc = "8s减速",
	stack = 1,
	id = 18,
	icon = 18,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -3000,
				attr = "velocity",
				group = {
					id = 18,
					level = 1
				}
			}
		}
	}
}
