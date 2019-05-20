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
	name = "腓特烈弹幕技能",
	init_effect = "",
	id = 19220,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 19220,
	last_effect = "",
	limit = {
		SYSTEM_SCENARIO,
		SYSTEM_ROUTINE,
		SYSTEM_SHAM,
		SYSTEM_CHALLENGE,
		SYSTEM_ACT_BOSS
	},
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				minTargetNumber = 1,
				range = 85,
				check_target = "TargetHarmNearest",
				quota = 1,
				skill_id = 19222
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpUpperBound = 1,
				quota = 1,
				skill_id = 19222
			}
		}
	}
}
