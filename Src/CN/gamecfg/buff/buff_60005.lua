return {
	time = 0,
	name = "测试-根据血量比例触发buff",
	init_effect = "",
	picture = "",
	desc = "每个比例触发一次",
	stack = 1,
	id = 60005,
	icon = 60005,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 60006,
				target = "TargetAllHelp",
				hpRatioList = {
					0.7,
					0.4,
					0.1
				}
			}
		}
	}
}
