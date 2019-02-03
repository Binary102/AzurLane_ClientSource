return {
	time = 0,
	name = "复纵阵回避",
	init_effect = "",
	id = 211,
	picture = "",
	desc = "舰队伤害降低50%",
	stack = 1,
	color = "yellow",
	icon = 211,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = -0.5,
				attr = "damageRatioBullet"
			}
		}
	}
}
