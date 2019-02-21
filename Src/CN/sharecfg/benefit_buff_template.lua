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
		desc = "指挥官等级小于30级时，在普通关卡、困难关卡、每日活动中获得的指挥官经验和舰娘经验提高100%",
		benefit_condition = {
			"lv",
			"<",
			30
		}
	},
	all = {
		1,
		2,
		3,
		4
	}
}

return
