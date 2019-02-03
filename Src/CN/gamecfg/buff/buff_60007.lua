return {
	time = 0,
	name = "测试-菲尼克斯-不死鸟buff",
	init_effect = "",
	picture = "",
	desc = "测试-不死鸟buff",
	stack = 1,
	id = 60007,
	icon = 60007,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 60008,
				target = "TargetSelf",
				hpRatioList = {
					0.3
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				skill_id = 60012,
				target = "TargetSelf",
				hpRatioList = {
					0.3
				}
			}
		}
	}
}
