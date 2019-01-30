pg = pg or {}
pg.open_systems_limited = {
	{
		scene = "MAINUI",
		name = "숙소",
		guid_end_id = 801,
		guidId = 800,
		id = 1,
		mediator = "BackYardMediator",
		level = 8
	},
	{
		scene = "MAINUI",
		name = "데일리",
		guid_end_id = 0,
		guidId = 0,
		id = 2,
		mediator = "DailyLevelMediator",
		level = 10
	},
	{
		scene = "MAINUI",
		name = "함대",
		guid_end_id = 802,
		guidId = 802,
		id = 3,
		mediator = "NewGuildMediator",
		level = 11
	},
	{
		scene = "MAINUI",
		name = "군사의뢰",
		guid_end_id = 804,
		guidId = 804,
		id = 4,
		mediator = "EventMediator",
		level = 12
	},
	{
		scene = "MAINUI",
		name = "군사연습",
		guid_end_id = 805,
		guidId = 805,
		id = 5,
		mediator = "MilitaryExerciseMediator",
		level = 15
	},
	{
		scene = "MAINUI",
		name = "랭킹",
		guid_end_id = 806,
		guidId = 806,
		id = 6,
		mediator = "BillboardMediator",
		level = 16
	},
	{
		scene = "MAINUI",
		name = "거울해역 ",
		guid_end_id = 0,
		guidId = 0,
		id = 7,
		mediator = "ShamPreCombatMediator",
		level = 10
	},
	{
		scene = "MAINUI",
		name = "모의전 교환",
		guid_end_id = 0,
		guidId = 0,
		id = 8,
		mediator = "ShamShop",
		level = 10
	},
	{
		scene = "MAINUI",
		name = "대강당",
		guid_end_id = 0,
		guidId = 0,
		id = 9,
		mediator = "ClassMediator",
		level = 50
	},
	{
		scene = "MAINUI",
		name = "개발 도크",
		guid_end_id = 0,
		guidId = 0,
		id = 10,
		mediator = "ShipBluePrintMediator",
		level = 30
	},
	{
		scene = "MAINUI",
		name = "과학연구실",
		guid_end_id = 0,
		guidId = 0,
		id = 11,
		mediator = "TechnologyMediator",
		level = 30
	},
	[14] = {
		scene = "MAINUI",
		name = "지휘냥",
		guid_end_id = 0,
		guidId = 0,
		id = 14,
		mediator = "CommandRoomMediator",
		level = 40
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
		9,
		10,
		11,
		14
	}
}

return
