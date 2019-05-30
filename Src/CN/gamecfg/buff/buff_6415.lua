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
	name = "",
	init_effect = "",
	id = 6415,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6410,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				buff_id = 6417,
				minWeaponNumber = 1,
				check_weapon = true,
				weapon_group = {
					720
				}
			}
		}
	}
}
