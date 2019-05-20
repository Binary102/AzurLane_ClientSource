pg = pg or {}
pg.benefit_buff_template = {
	{
		max_time = 86400,
		name = "",
		icon = "Props/haijungali",
		benefit_effect = "5",
		id = 1,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高5%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高10%"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "后宅经验加成提高20%"
	},
	{
		max_time = 0,
		name = "经验加成",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "指挥官等级小于30级时，在普通关卡、困难关卡、每日活动中获得的指挥官经验和角色经验提高100%",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	{
		max_time = 0,
		name = "石油消耗增加",
		icon = "Props/xinshou",
		benefit_effect = "200",
		id = 5,
		benefit_condition = "",
		benefit_type = "more_oil",
		desc = "普通关卡、困难关卡、活动关卡的油耗增加200%"
	},
	{
		max_time = 0,
		name = "指挥官经验加成",
		icon = "Props/xinshou",
		benefit_effect = "200",
		id = 6,
		benefit_condition = "",
		benefit_type = "user_battle_exp",
		desc = "普通关卡、困难关卡、活动关卡的指挥官经验获取提高200%"
	},
	{
		max_time = 0,
		name = "舰娘经验加成",
		icon = "Props/xinshou",
		benefit_effect = "200",
		id = 7,
		benefit_condition = "",
		benefit_type = "ship_battle_exp",
		desc = "普通关卡、困难关卡、活动关卡的角色经验获取提高200%"
	},
	{
		max_time = 0,
		name = "掉落加成",
		icon = "Props/xinshou",
		benefit_effect = "1",
		id = 8,
		benefit_condition = "",
		benefit_type = "extra_drop",
		desc = "普通关卡、困难关卡、活动关卡额外掉落一次"
	},
	{
		max_time = 0,
		name = "活动掉落加成",
		icon = "Props/xinshou",
		benefit_effect = "1",
		id = 9,
		benefit_condition = "",
		benefit_type = "extra_activity_drop",
		desc = "活动掉落额外掉落一次，不与每日首次掉落叠加"
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9
	}
}

return
