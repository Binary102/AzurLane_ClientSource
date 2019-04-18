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
	name = "加斯科涅弹幕",
	init_effect = "",
	id = 19260,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 19260,
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
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 19262,
				time = 20,
				target = "TargetSelf"
			}
		}
	}
}
