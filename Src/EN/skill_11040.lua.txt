return {
	uiEffect = "",
	name = "鞍山技能",
	cd = 0,
	picture = "0",
	desc = "鞍山技能",
	painting = 1,
	id = 11040,
	castCV = "skill",
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetAllHelp",
			arg_list = {
				buff_id = 11041,
				effectFilter = {
					{
						"TargetID",
						"=",
						501011
					},
					{
						"TargetID",
						"=",
						501012
					},
					{
						"TargetID",
						"=",
						501013
					},
					{
						"TargetID",
						"=",
						501014
					},
					{
						"TargetID",
						"=",
						501021
					},
					{
						"TargetID",
						"=",
						501022
					},
					{
						"TargetID",
						"=",
						501023
					},
					{
						"TargetID",
						"=",
						501024
					},
					{
						"TargetID",
						"=",
						501031
					},
					{
						"TargetID",
						"=",
						501032
					},
					{
						"TargetID",
						"=",
						501033
					},
					{
						"TargetID",
						"=",
						501034
					},
					{
						"TargetID",
						"=",
						501041
					},
					{
						"TargetID",
						"=",
						501042
					},
					{
						"TargetID",
						"=",
						501043
					},
					{
						"TargetID",
						"=",
						501044
					}
				}
			}
		}
	}
}
