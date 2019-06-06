pg = pg or {}
pg.item_data_chat = {
	[0] = {
		name = "기본 데코레이션 ",
		time_second = 0,
		id = 0,
		time_limit_type = 0,
		desc = "말풍선을 설정하지 않음 ",
		scene = {}
	},
	[101] = {
		name = "1주년 기념",
		time_second = 0,
		id = 101,
		time_limit_type = 0,
		desc = "항구에서 1년 동안 계속해서 분투를 하신 지휘관 님들께 바칩니다.\n<color=#A7A7AAFF> [재탄생의 새벽]을 개시하면 기념 코인을 획득할 수 있습니다.</color>",
		scene = {}
	},
	[300] = {
		name = "발령자",
		time_second = 2592000,
		id = 300,
		time_limit_type = 1,
		desc = "<color=#ffffff>동원 지령에 응답하여 주셔서 감사합니다，지휘관</color>\n유효기간 30일",
		scene = {}
	},
	[301] = {
		name = "도전 모드 말풍선",
		time_second = 2592000,
		id = 301,
		time_limit_type = 1,
		desc = "X작전 첫 회 완료 시 획득할 수 있습니다.",
		scene = {}
	},
	all = {
		0,
		101,
		300,
		301
	}
}

return
