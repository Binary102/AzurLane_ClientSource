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
	name = "邦克山",
	init_effect = "",
	id = 11980,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 11980,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				skill_id = 11980,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onConsort"
			},
			arg_list = {
				skill_id = 11981,
				target = "TargetSelf"
			}
		}
	}
}
