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
	desc_get = "队伍中存在克利夫兰级的角色时，机队变化",
	name = "天之骑士",
	init_effect = "",
	id = 11920,
	time = 0,
	picture = "",
	desc = "空袭时额外机队攻击，队伍中存在克利夫兰级的角色时，机队变化",
	stack = 1,
	color = "yellow",
	icon = 11920,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrikeSteady"
			},
			arg_list = {
				check_target = "TargetTemplate",
				minTargetNumber = 1,
				skill_id = 11920,
				target = "TargetSelf",
				targetTemplateIDList = {
					102091,
					102092,
					102093,
					102094,
					102101,
					102102,
					102102,
					102104,
					102141,
					102142,
					102143,
					102144,
					102151,
					102152,
					102153,
					102154
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrikeSteady"
			},
			arg_list = {
				check_target = "TargetTemplate",
				skill_id = 11921,
				maxTargetNumber = 0,
				target = "TargetSelf",
				targetTemplateIDList = {
					102091,
					102092,
					102093,
					102094,
					102101,
					102102,
					102102,
					102104,
					102141,
					102142,
					102143,
					102144,
					102151,
					102152,
					102153,
					102154
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				check_target = "TargetTemplate",
				minTargetNumber = 1,
				skill_id = 11922,
				target = "TargetSelf",
				targetTemplateIDList = {
					102091,
					102092,
					102093,
					102094,
					102101,
					102102,
					102102,
					102104,
					102141,
					102142,
					102143,
					102144,
					102151,
					102152,
					102153,
					102154
				}
			}
		}
	}
}
