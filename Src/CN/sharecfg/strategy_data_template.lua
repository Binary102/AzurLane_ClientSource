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
	[90] = {
		buff_id = 90,
		name = "危机出现!",
		type = 90,
		id = 90,
		icon = "90",
		desc = "下一场战斗中会出现绊爱的干扰：潜艇召唤/舰载机攻击/鱼雷发射/主炮跨射功能将陷入瘫痪（包括自律模式），连续点击出现的绊爱即可消除影响",
		arg = {}
	},
	[91] = {
		buff_id = 91,
		name = "危机回避~",
		type = 90,
		id = 91,
		icon = "91",
		desc = "危机规避~战斗中不会出现干扰了",
		arg = {}
	},
	[9500] = {
		buff_id = 9500,
		name = "魔方活性化",
		type = 10,
		id = 9500,
		icon = "9500",
		desc = "受到魔方活性化效果影响，舰队全员造成的伤害提高20%，受到的伤害提高20%",
		arg = {}
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
	[10011] = {
		buff_id = 220,
		name = "制空权确保",
		type = 1001,
		id = 10011,
		icon = "10011",
		desc = "舰队全员航空攻击伤害提高20%，受到的航空攻击伤害降低10%，命中提高10%，受到伏击的概率降低8% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			800
		}
	},
	[10012] = {
		buff_id = 230,
		name = "制空权优势",
		type = 1001,
		id = 10012,
		icon = "10012",
		desc = "舰队全员航空攻击伤害提高12%，受到的航空攻击伤害降低6%，命中提高5%，受到伏击的概率降低5% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			500
		}
	},
	[10013] = {
		buff_id = 240,
		name = "势均力敌",
		type = 1001,
		id = 10013,
		icon = "10013",
		desc = "舰队全员航空攻击伤害降低6%，受到的航空攻击伤害降低3% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			0
		}
	},
	[10014] = {
		buff_id = 250,
		name = "制空权劣势",
		type = 1001,
		id = 10014,
		icon = "10014",
		desc = "舰队全员航空攻击伤害降低12%，受到的航空攻击伤害提高6%，命中、机动降低3% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			0
		}
	},
	[10015] = {
		buff_id = 260,
		name = "制空权丧失",
		type = 1001,
		id = 10015,
		icon = "10015",
		desc = "舰队全员航空攻击伤害降低20%，受到的航空攻击伤害提高10%，命中、机动降低8% (航空攻击伤害提高或降低不影响点燃进水伤害)",
		arg = {
			0
		}
	},
	all = {
		1,
		2,
		3,
		4,
		9,
		90,
		91,
		9500,
		10001,
		10002,
		10011,
		10012,
		10013,
		10014,
		10015
	}
}

return
