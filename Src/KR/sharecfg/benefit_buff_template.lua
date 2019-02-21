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
		desc = "숙소 경험치 5% UP"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/huangjialiaoli",
		benefit_effect = "10",
		id = 2,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 10% UP"
	},
	{
		max_time = 86400,
		name = "",
		icon = "Props/manhanquanxi",
		benefit_effect = "20",
		id = 3,
		benefit_condition = "",
		benefit_type = "dorm_exp",
		desc = "숙소 경험치 20% UP"
	},
	{
		max_time = 0,
		name = "경험치 추가 획득",
		icon = "Props/xinshou",
		benefit_effect = "100",
		id = 4,
		benefit_type = "rookie_battle_exp",
		desc = "지휘관 레벨 30 미만일 때, 통상 스테이지, 어려움 난이도 스테이지, 데일리 이벤트 중 획득하는 지휘관 경험치와 함선소녀 경험치가 100% 상승. ",
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
