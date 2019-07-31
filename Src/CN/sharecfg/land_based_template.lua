pg = pg or {}
pg.land_based_template = {
	{
		name = "岸防炮",
		prefab = "anfangpao1",
		type = 1,
		id = 1,
		function_args = {
			-3,
			0
		}
	},
	{
		name = "岸防炮",
		prefab = "anfangpao2",
		type = 1,
		id = 2,
		function_args = {
			3,
			0
		}
	},
	{
		name = "岸防炮",
		prefab = "anfangpao3",
		type = 1,
		id = 3,
		function_args = {
			0,
			-3
		}
	},
	{
		name = "岸防炮",
		prefab = "anfangpao4",
		type = 1,
		id = 4,
		function_args = {
			0,
			3
		}
	},
	[10] = {
		name = "港口",
		prefab = "gangkou",
		type = 2,
		id = 10,
		function_args = {
			1
		}
	},
	[11] = {
		name = "船坞",
		prefab = "chuanwu",
		type = 3,
		id = 11,
		function_args = {
			800,
			3
		}
	},
	all = {
		1,
		2,
		3,
		4,
		10,
		11
	}
}

return
