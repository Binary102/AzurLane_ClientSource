pg = pg or {}
pg.strategy_data_template = {
	{
		buff_id = 100,
		name = "단종진",
		type = 1,
		id = 1,
		icon = "1",
		desc = "다음 전투에서 모든 함선의 포격, 뇌장+15%, 기동-10%",
		arg = {}
	},
	{
		buff_id = 110,
		name = "복종진",
		type = 1,
		id = 2,
		icon = "2",
		desc = "다음 전투에서 모든 함선의 기동+30%, 포격, 뇌장-5%",
		arg = {}
	},
	{
		buff_id = 120,
		name = "윤형진",
		type = 1,
		id = 3,
		icon = "3",
		desc = "다음 전투에서 모든 함선의 대공+20%",
		arg = {}
	},
	{
		buff_id = 0,
		name = "긴급수리",
		type = 2,
		id = 4,
		icon = "4",
		desc = "전투에 참여할 수 있는 함선의 HP를 10% 회복",
		arg = {
			healthy,
			10
		}
	},
	[9] = {
		buff_id = 0,
		name = "교환",
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
		name = "완벽보급",
		type = 1000,
		id = 10001,
		icon = "10001",
		desc = "탄약 충분, 상태 양호, 모든 함선의 대미지+10%",
		arg = {}
	},
	[10002] = {
		buff_id = 210,
		name = "탄약고갈",
		type = 1000,
		id = 10002,
		icon = "10002",
		desc = "탄약 고갈, 보급 필요, 모든 함선의 대미지-50%",
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
