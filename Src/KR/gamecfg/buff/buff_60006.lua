return {
	time = 0,
	name = "南达科他伤害减免触发",
	init_effect = "",
	picture = "",
	desc = "测试-伤害减免",
	stack = 1,
	id = 60006,
	icon = 60006,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				skill_id = 60013,
				target = "TargetSelf",
				hpRatioList = {
					0.7,
					0.4,
					0.1
				}
			}
		}
	}
}
