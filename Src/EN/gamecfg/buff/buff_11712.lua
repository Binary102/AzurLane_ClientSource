return {
	time = 16,
	name = "杜尔拉汗-回复效果",
	init_effect = "",
	picture = "",
	desc = "杜尔拉汗-回复效果",
	stack = 1,
	id = 11712,
	icon = 11710,
	last_effect = "Health",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 11711,
				time = 3,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				number = -2,
				attr = "velocity"
			}
		}
	}
}
