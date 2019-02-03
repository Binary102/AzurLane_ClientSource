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
	name = "复仇打击",
	init_effect = "",
	id = 10190,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 10190,
	last_effect = "Health",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				skill_id = 10190,
				target = "TargetSelf",
				quota = 1,
				hpRatioList = {
					0.2
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onTakeDamage"
			},
			arg_list = {
				quota = 1,
				skill_id = 10191,
				target = "TargetSelf"
			}
		}
	}
}
