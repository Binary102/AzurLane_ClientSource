pg = pg or {}
pg.re_map_template = {
	[2] = {
		activity_type = 2,
		name = "Z舰队常驻复刻",
		memory_group = 101,
		id = 2,
		bg = "temp_zjiandui",
		config_data = {
			2200001,
			2200002,
			2200003
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
					2022,
					12,
					31
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
		2
	}
}

return
