pg = pg or {}
pg.expedition_daily_template = {
	[201] = {
		tips = "Escort Mission available on every Monday, Thursday and Sunday",
		pic = "daily1",
		limit_time = 3,
		id = 201,
		title = "商船护送",
		des = "Our Cargo ship is damaged by enemy torpedoes! Escort it to get a large number of Equipment Materials",
		weekday = {
			1,
			4,
			7
		},
		expedition_and_lv_limit_list = {
			{
				2000,
				10
			},
			{
				2001,
				10
			},
			{
				2002,
				25
			},
			{
				2003,
				25
			},
			{
				2004,
				35
			},
			{
				2005,
				35
			},
			{
				2006,
				50
			},
			{
				2007,
				50
			},
			{
				2008,
				70
			},
			{
				2009,
				70
			}
		}
	},
	[301] = {
		tips = "Maritime Attack available on every Tuesday, Friday and Sunday",
		pic = "daily2",
		limit_time = 3,
		id = 301,
		title = "海域突进",
		des = "Enemy self-destruction boats are zerging around! Clear them will have a chance to get Tactical Materials",
		weekday = {
			2,
			5,
			7
		},
		expedition_and_lv_limit_list = {
			{
				3000,
				10
			},
			{
				3001,
				25
			},
			{
				3002,
				35
			},
			{
				3003,
				50
			},
			{
				3004,
				70
			}
		}
	},
	[401] = {
		tips = "Beheading Operation available on every Wednesday, Saturday and Sunday",
		pic = "daily3",
		limit_time = 3,
		id = 401,
		title = "斩首行动",
		des = "Warning! Enemy Bosses on sight! Destroy them will have a chance to get Mystery Tech Packs",
		weekday = {
			3,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				4000,
				10
			},
			{
				4001,
				25
			},
			{
				4002,
				35
			},
			{
				4003,
				50
			},
			{
				4004,
				70
			}
		}
	},
	[501] = {
		tips = "Coming Soon",
		pic = "daily4",
		limit_time = 0,
		id = 501,
		title = "敬请期待",
		des = "Coming Soon",
		weekday = {},
		expedition_and_lv_limit_list = {}
	},
	[601] = {
		tips = "Coming Soon",
		pic = "daily4",
		limit_time = 0,
		id = 601,
		title = "战术研修",
		des = "Coming Soon",
		weekday = {},
		expedition_and_lv_limit_list = {}
	},
	all = {
		201,
		301,
		401,
		501,
		601
	}
}

return
