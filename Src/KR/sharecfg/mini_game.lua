pg = pg or {}
pg.mini_game = {
	{
		name = "测试小游戏",
		view_name = "TestView",
		mediator_name = "MiniHubMediator",
		type = 1,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 1,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			test = {
				1,
				2,
				3
			}
		}
	},
	{
		name = "小吃小游戏",
		view_name = "SnackView",
		mediator_name = "MiniHubMediator",
		type = 1,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 2,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			memory_time = 5,
			select_time = 10,
			correct_value = {
				[0] = 0,
				1,
				2,
				5
			},
			score_level = {
				0,
				5,
				12,
				20
			}
		}
	},
	{
		name = "神社小游戏",
		view_name = "ShrineView",
		mediator_name = "MiniHubMediator",
		type = 3,
		config_csv_key = "",
		config_csv = "",
		id = 3,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			target = 100000
		},
		config_data = {
			5,
			{
				10,
				11,
				12
			}
		}
	},
	{
		name = "制作烟花",
		view_name = "FireworkFactoryView",
		mediator_name = "FireworkFactoryMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 4,
		hub_id = 1,
		request_data = 1,
		simple_config_data = {
			roundTime = 50,
			score_reference = {
				{
					140,
					160
				},
				{
					120,
					180
				},
				{
					90,
					210
				}
			}
		}
	},
	{
		name = "打靶游戏",
		view_name = "ShootingGameView",
		mediator_name = "ShootingGameMediator",
		type = 2,
		config_csv_key = "",
		config_data = "",
		config_csv = "",
		id = 5,
		hub_id = 1,
		request_data = 0,
		simple_config_data = {
			moveSpeed = 4,
			fireCD = 1,
			baseTime = 12,
			bonusTime = 0,
			targetScore = {
				10,
				5,
				2
			},
			score_level = {
				0,
				10,
				25,
				35
			}
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5
	}
}

return
