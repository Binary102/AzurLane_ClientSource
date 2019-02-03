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
	name = "荣光",
	init_effect = "",
	id = 11330,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 11330,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 11330
			}
		},
		{
			type = "BattleBuffAura",
			trigger = {},
			arg_list = {
				buff_id = 11331,
				target = "TargetTemplate",
				targetTemplateIDList = {
					304011,
					304012,
					304013,
					304014,
					304021,
					304022,
					304023,
					304024,
					304031,
					304032,
					304033,
					304034,
					304041,
					304042,
					304043,
					304044
				}
			}
		}
	}
}
