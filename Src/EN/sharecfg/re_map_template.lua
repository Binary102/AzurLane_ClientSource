pg = pg or {}
pg.re_map_template = {
	{
		memory_group = 108,
		name = "红染常驻复刻",
		id = 1,
		bg = "temp_hongran",
		config_data = {
			2100001,
			2100002,
			2100003,
			2100004,
			2100005,
			2100006,
			2100011,
			2100012,
			2100013,
			2100014,
			2100015,
			2100016
		},
		time = {
			timer,
			{
				{
					2018,
					9,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					12,
					19
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	{
		memory_group = 102,
		name = "异色格常驻复刻",
		id = 2,
		bg = "temp_yisege",
		config_data = {},
		time = {
			timer,
			{
				{
					2018,
					9,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					19
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	{
		memory_group = 123,
		name = "凛冬常驻复刻",
		id = 3,
		bg = "temp_lingdong",
		config_data = {},
		time = {
			timer,
			{
				{
					2018,
					9,
					11
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					12,
					19
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	all = {
		1,
		2,
		3
	}
}

return
