pg = pg or {}
pg.strategy_data_template = {
	{
		buff_id = 100,
		name = "单纵阵突入",
		type = 1,
		id = 1,
		icon = "1",
		desc = "下一场战斗，舰队全员炮击、雷击提高15%，机动降低10%",
		arg = {}
	},
	{
		buff_id = 110,
		name = "复纵阵前进",
		type = 1,
		id = 2,
		icon = "2",
		desc = "下一场战斗，舰队全员机动提高30%，炮击、雷击降低5%",
		arg = {}
	},
	{
		buff_id = 120,
		name = "轮型阵护卫",
		type = 1,
		id = 3,
		icon = "3",
		desc = "下一场战斗，舰队全员防空提高20%",
		arg = {}
	},
	{
		buff_id = 0,
		name = "紧急维修",
		type = 2,
		id = 4,
		icon = "4",
		desc = "当前舰队存活角色回复总血量的10%",
		arg = {
			healthy,
			10
		}
	},
	[9] = {
		buff_id = 0,
		name = "交换",
		type = 2,
		id = 9,
		icon = "9",
		desc = "与友方队伍交换位置",
		arg = {
			exchange
		}
	},
	[10001] = {
		buff_id = 200,
		name = "弹药充足",
		type = 1000,
		id = 10001,
		icon = "10001",
		desc = "弹药充足，状态良好，舰队伤害提高10%",
		arg = {}
	},
	[10002] = {
		buff_id = 210,
		name = "弹药匮乏",
		type = 1000,
		id = 10002,
		icon = "10002",
		desc = "弹尽粮绝，需要补给，舰队伤害降低50%",
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
