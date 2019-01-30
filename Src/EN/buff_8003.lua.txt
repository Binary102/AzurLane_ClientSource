return {
	time = 10,
	name = "自爆船冲撞自杀buff加速等效果",
	init_effect = "",
	picture = "",
	desc = "自爆船冲撞自杀buff加速等效果",
	stack = 1,
	id = 8003,
	icon = 8003,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach"
			},
			arg_list = {
				group = 8003,
				number = 8000,
				attr = "velocity"
			}
		},
		{
			type = "BattleBuffDeath",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 5
			}
		},
		{
			type = "BattleBuffNewAI",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ai_onAttach = 80007
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				group = 60037,
				number = 1,
				attr = "immuneMaxAreaLimit"
			}
		}
	}
}
