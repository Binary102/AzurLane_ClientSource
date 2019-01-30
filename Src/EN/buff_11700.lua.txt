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
	desc_get = "航速机动↑炮击防空命中↓",
	name = "猛进射击",
	init_effect = "",
	id = 11700,
	time = 0,
	picture = "",
	desc = "航速机动↑炮击防空命中↓",
	stack = 1,
	color = "yellow",
	icon = 11700,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onLeader"
			},
			arg_list = {
				skill_id = 11700,
				target = "TargetSelf"
			}
		}
	}
}
