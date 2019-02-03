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
	time = 0,
	name = "发射鱼雷完全回避",
	init_effect = "",
	id = 11740,
	picture = "",
	desc = "发射鱼雷时，有25%（满级45%）几率，接下来5S完全闪避",
	stack = 1,
	color = "blue",
	icon = 11740,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				buff_id = 11741,
				target = "TargetSelf"
			}
		}
	}
}
