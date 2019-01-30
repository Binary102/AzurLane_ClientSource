return {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "",
	name = "杜尔拉汗",
	init_effect = "",
	id = 11710,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 11710,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				skill_id = 11710,
				target = "TargetSelf",
				quota = 1,
				hpRatioList = {
					0.3
				}
			}
		}
	}
}
