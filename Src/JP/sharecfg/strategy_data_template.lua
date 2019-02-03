pg = pg or {}
pg.strategy_data_template = {
	{
		buff_id = 100,
		name = "単縦陣",
		type = 1,
		id = 1,
		icon = "1",
		desc = "次の戦闘で、全艦火力・雷装+15%、回避-10%。",
		arg = {}
	},
	{
		buff_id = 110,
		name = "複縦陣",
		type = 1,
		id = 2,
		icon = "2",
		desc = "次の戦闘で、全艦回避+30%、火力・雷装-5%。",
		arg = {}
	},
	{
		buff_id = 120,
		name = "輪形陣",
		type = 1,
		id = 3,
		icon = "3",
		desc = "次の戦闘で、全艦対空+20%。",
		arg = {}
	},
	{
		buff_id = 0,
		name = "緊急補修",
		type = 2,
		id = 4,
		icon = "4",
		desc = "戦闘参加可能な艦のHPが10%回復する。",
		arg = {
			healthy,
			10
		}
	},
	[9] = {
		buff_id = 0,
		name = "交換",
		type = 2,
		id = 9,
		icon = "9",
		desc = "隣の交戦中の味方艦隊と位置を交換する",
		arg = {
			exchange
		}
	},
	[10001] = {
		buff_id = 200,
		name = "完全補給",
		type = 1000,
		id = 10001,
		icon = "10001",
		desc = "弾薬満タン、艦隊ダメージ+10%。",
		arg = {}
	},
	[10002] = {
		buff_id = 210,
		name = "弾薬不足",
		type = 1000,
		id = 10002,
		icon = "10002",
		desc = "弾切れ寸前、艦隊ダメージ-50%。",
		arg = {}
	},
	all = {
		1,
		2,
		3,
		4,
		9,
		10001,
		10002
	}
}

return
