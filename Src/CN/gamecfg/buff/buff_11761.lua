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
	name = "龙骧SignalAxe",
	init_effect = "",
	id = 11761,
	time = 3,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 11760,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 11762,
				target = "TargetSelf"
			}
		}
	}
}
