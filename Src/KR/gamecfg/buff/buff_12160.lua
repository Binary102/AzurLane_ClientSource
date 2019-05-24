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
	name = "日不落的辉光",
	init_effect = "",
	id = 12160,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12160,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetNationalityFriendly",
				buff_id = 12161,
				minTargetNumber = 3,
				nationality = 2
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 12161,
				target = "TargetSelf"
			}
		}
	}
}
