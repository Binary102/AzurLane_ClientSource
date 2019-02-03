pg = pg or {}
pg.expedition_daily_template = {
	[201] = {
		tips = "月・木・日曜日開放！",
		pic = "daily1",
		limit_time = 3,
		id = 201,
		title = "商船护送",
		des = "海上通商を担う商船から敵PTボート群を引きつけ、強化パーツ報酬を手に入れろ！",
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
		tips = "火・金・日曜日開放！",
		pic = "daily2",
		limit_time = 3,
		id = 301,
		title = "海域突进",
		des = "海域に跋扈する自爆ボートを掃討し、スキル習熟訓練用の教材を捜索せよ！",
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
		tips = "水・土・日曜日開放！",
		pic = "daily3",
		limit_time = 3,
		id = 401,
		title = "斩首行动",
		des = "複数に出現する敵主力艦を撃破し、装備箱を入手せよ！",
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
		tips = "乞うご期待！",
		pic = "daily4",
		limit_time = 0,
		id = 501,
		title = "敬请期待",
		des = "乞うご期待！",
		weekday = {},
		expedition_and_lv_limit_list = {}
	},
	[601] = {
		tips = "战术研修每天开启",
		pic = "daily6",
		limit_time = 3,
		id = 601,
		title = "战术研修",
		des = "强大的特战敌人出现了！击破有几率获得战术升级材料",
		weekday = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		expedition_and_lv_limit_list = {
			{
				6000,
				60
			},
			{
				6001,
				60
			},
			{
				6002,
				60
			}
		}
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
