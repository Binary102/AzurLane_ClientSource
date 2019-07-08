pg = pg or {}
pg.shop_template = {
	{
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to increase gear capacity by 20",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "equip_bag_size",
		group = 0,
		num = 20,
		discount = 0,
		resource_type = 14,
		id = 1,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to increase dock capacity by 10",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 2,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to add 1 bed in your dorm",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 3,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				2,
				2
			}
		}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to add 1 bed in your dorm",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 4,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				3,
				3
			}
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "Food storage expansion 1-10: 100 Gems",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_food_max",
		group = 0,
		num = 2000,
		discount = 0,
		resource_type = 14,
		id = 5,
		genre = "backyard_food_extend",
		discount_time = {},
		limit_args = {
			"count",
			0,
			9
		}
	},
	{
		group_type = 0,
		resource_num = 200,
		desc = "Food storage expansion 11+: 200 Gems",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_food_max",
		group = 0,
		num = 2000,
		discount = 0,
		resource_type = 14,
		id = 6,
		genre = "backyard_food_extend",
		discount_time = {},
		limit_args = {
			"count",
			10,
			24
		}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "Upgrade Trading Port",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "tradingport_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 7,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "Upgrade Refinery",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "oilfield_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 8,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "Upgrade Trade Street",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "shop_street_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 9,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 50,
		desc = "Refresh Trade Street",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "shop_street_flash",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 10,
		genre = "shop_street_upgrade",
		discount_time = {},
		limit_args = {
			"count",
			0,
			3
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "Refresh Trade Street",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "shop_street_flash",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 11,
		genre = "shop_street_upgrade",
		discount_time = {},
		limit_args = {
			"count",
			4,
			9
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to buy 3000 Coins",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 3000,
		discount = 0,
		resource_type = 14,
		id = 12,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	{
		group_type = 0,
		resource_num = 50,
		desc = "Spend 50 Gems to buy 500 Oil",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 13,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			0,
			1
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to buy 500 Oil",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 14,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			2,
			5
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to buy 500 Oil",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 15,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			6,
			9
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 400,
		desc = "Spend 400 Gems to buy 500 Oil",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = -1,
		discount = 0,
		resource_type = 14,
		id = 16,
		genre = "buy_oil",
		discount_time = {},
		limit_args = {
			"count",
			10,
			15
		},
		effect_args = {
			2
		}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to add 1 dorm resting slot",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_fix_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 17,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 800,
		desc = "Spend 800 Gems to add 1 bed to your dorm",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_exp_pos",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 18,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"number",
				4,
				4
			}
		}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to unlock dorm's second floor furniture",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "dorm_floor",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 19,
		genre = "",
		discount_time = {},
		limit_args = {
			{
				"count",
				1,
				1
			},
			{
				"level",
				3
			}
		}
	},
	{
		group_type = 0,
		resource_num = -1,
		desc = "Upgrade Lecture Hall",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "class_room_level",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 20,
		genre = "",
		discount_time = {},
		limit_args = {}
	},
	{
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to unlock the 3rd training slot in Tactical Classroom ",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "skill_room_pos",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 21,
		genre = "skill_room_upgrade",
		discount_time = {
			{
				{
					2018,
					9,
					20
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
					10,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {
			{
				"number",
				2,
				2
			}
		}
	},
	[21001] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 Quick Finish item",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21001,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[21002] = {
		group_type = 0,
		resource_num = 600,
		desc = "Spend 600 Coins to buy 1 T1 offensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21002,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16001
		}
	},
	[21003] = {
		group_type = 0,
		resource_num = 600,
		desc = "Spend 600 Coins to buy 1 T1 defensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21003,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16011
		}
	},
	[21004] = {
		group_type = 0,
		resource_num = 600,
		desc = "Spend 600 Coins to buy 1 T1 support skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21004,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16021
		}
	},
	[21005] = {
		group_type = 0,
		resource_num = 750,
		desc = "Spend 750 Coins to buy 1 T1 general part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21005,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17001
		}
	},
	[21006] = {
		group_type = 0,
		resource_num = 750,
		desc = "Spend 750 Coins to buy 1 T1 main gun part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21006,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17011
		}
	},
	[21007] = {
		group_type = 0,
		resource_num = 750,
		desc = "Spend 750 Coins to buy 1 T1 torpedo part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21007,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17021
		}
	},
	[21008] = {
		group_type = 0,
		resource_num = 750,
		desc = "Spend 750 Coins to buy 1 T1 AA gun part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21008,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17031
		}
	},
	[21009] = {
		group_type = 0,
		resource_num = 750,
		desc = "Spend 750 Coins to buy 1 T1 aircraft part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21009,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17041
		}
	},
	[21010] = {
		group_type = 0,
		resource_num = 1200,
		desc = "Spend 1200 Coins to buy 1 T2 offensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21010,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16002
		}
	},
	[21011] = {
		group_type = 0,
		resource_num = 1200,
		desc = "Spend 1200 Coins to buy 1 T2 defensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21011,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16012
		}
	},
	[21012] = {
		group_type = 0,
		resource_num = 1200,
		desc = "Spend 1200 Coins to buy 1 T2 support skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21012,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16022
		}
	},
	[21013] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 T2 general part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21013,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17002
		}
	},
	[21014] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 T2 main gun part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21014,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17012
		}
	},
	[21015] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 T2 torpedo part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21015,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17022
		}
	},
	[21016] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 T2 AA gun part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21016,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17032
		}
	},
	[21017] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 1 T2 aircraft part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21017,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17042
		}
	},
	[21018] = {
		group_type = 0,
		resource_num = 2400,
		desc = "Spend 2400 Coins to buy 1 T3 offensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21018,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16003
		}
	},
	[21019] = {
		group_type = 0,
		resource_num = 2400,
		desc = "Spend 2400 Coins to buy 1 T3 defensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21019,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16013
		}
	},
	[21020] = {
		group_type = 0,
		resource_num = 2400,
		desc = "Spend 2400 Coins to buy 1 T3 support skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21020,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16023
		}
	},
	[21021] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Spend 3000 Coins to buy 1 T3 general part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21021,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17003
		}
	},
	[21022] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Spend 3000 Coins to buy 1 T3 main gun part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21022,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17013
		}
	},
	[21023] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Spend 3000 Coins to buy 1 T3 torpedo part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21023,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17023
		}
	},
	[21024] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Spend 3000 Coins to buy 1 T3 AA gun part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21024,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17033
		}
	},
	[21025] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Spend 3000 Coins to buy 1 T3 aircraft part",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 21025,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			17043
		}
	},
	[21026] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Spend 2000 Coins to buy 1 Wisdom Cube",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 21026,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[21027] = {
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Coins to buy 10 Oxy-colas",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21027,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50001
		}
	},
	[21028] = {
		group_type = 0,
		resource_num = 900,
		desc = "Spend 900 Coins to buy 10 Secret Coolants",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21028,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50002
		}
	},
	[21029] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Spend 1500 Coins to buy 10 Torpedo Tempura",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21029,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50003
		}
	},
	[21030] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Spend 3000 Coins to buy 10 Watermelons",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21030,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50004
		}
	},
	[21031] = {
		group_type = 0,
		resource_num = 6000,
		desc = "Spend 6000 Coins to buy 10 Royal Gourmet",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21031,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50005
		}
	},
	[21032] = {
		group_type = 0,
		resource_num = 12000,
		desc = "Spend 12000 Coins to buy 10 Full Courses",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 1,
		id = 21032,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50006
		}
	},
	[23001] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Merit for 1 Wisdom Cube",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 23001,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[24001] = {
		group_type = 0,
		resource_num = 20,
		desc = "Spend 20 Gems to buy 1 Quick Finish item",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24001,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[24002] = {
		group_type = 0,
		resource_num = 40,
		desc = "Spend 40 Gems to buy 2 Quick Finish items",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 2,
		discount = 0,
		resource_type = 14,
		id = 24002,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[24003] = {
		group_type = 0,
		resource_num = 30,
		desc = "Spend 30 Gems to buy 1 Wisdom Cube",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24003,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[24004] = {
		group_type = 0,
		resource_num = 60,
		desc = "Spend 60 Gems to buy 2 Wisdom Cubes",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 2,
		discount = 0,
		resource_type = 14,
		id = 24004,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[24005] = {
		group_type = 0,
		resource_num = 20,
		desc = "Spend 20 Gems to buy 1 T1 offensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24005,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16001
		}
	},
	[24006] = {
		group_type = 0,
		resource_num = 20,
		desc = "Spend 20 Gems to buy 1 T1 defensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24006,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16011
		}
	},
	[24007] = {
		group_type = 0,
		resource_num = 20,
		desc = "Spend 20 Gems to buy 1 T1 support skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24007,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16021
		}
	},
	[24008] = {
		group_type = 0,
		resource_num = 40,
		desc = "Spend 40 Gems to buy 1 T2 offensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24008,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16002
		}
	},
	[24009] = {
		group_type = 0,
		resource_num = 40,
		desc = "Spend 40 Gems to buy 1 T2 defensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24009,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16012
		}
	},
	[24010] = {
		group_type = 0,
		resource_num = 40,
		desc = "Spend 40 Gems to buy 1 T2 support skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24010,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16022
		}
	},
	[24011] = {
		group_type = 0,
		resource_num = 80,
		desc = "Spend 80 Gems to buy 1 T3 offensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24011,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16003
		}
	},
	[24012] = {
		group_type = 0,
		resource_num = 80,
		desc = "Spend 80 Gems to buy 1 T3 defensive skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24012,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16013
		}
	},
	[24013] = {
		group_type = 0,
		resource_num = 80,
		desc = "Spend 80 Gems to buy 1 T3 support skill book",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 24013,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			16023
		}
	},
	[31011] = {
		group_type = 0,
		resource_num = 80,
		desc = "Exchange 80 Coins for 1 T1 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31011,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30011
		}
	},
	[31012] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 1 T2 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31012,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30012
		}
	},
	[31013] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 1 T3 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31013,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30013
		}
	},
	[31014] = {
		group_type = 0,
		resource_num = 5000,
		desc = "Exchange 5000 Coins for 1 T4 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31014,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30014
		}
	},
	[31111] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 5 T1 Eagle Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31111,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30011
		}
	},
	[31112] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 5 T2 Eagle Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31112,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30012
		}
	},
	[31113] = {
		group_type = 0,
		resource_num = 10000,
		desc = "Exchange 10000 Coins for 5 T3 Eagle Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31113,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30013
		}
	},
	[31114] = {
		group_type = 0,
		resource_num = 25000,
		desc = "Exchange 25000 Coins for 5 T4 Eagle Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31114,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30014
		}
	},
	[31021] = {
		group_type = 0,
		resource_num = 80,
		desc = "Exchange 80 Coins for 1 T1 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31021,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30021
		}
	},
	[31022] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 1 T2 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31022,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30022
		}
	},
	[31023] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 1 T3 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31023,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30023
		}
	},
	[31024] = {
		group_type = 0,
		resource_num = 5000,
		desc = "Exchange 5000 Coins for 1 T4 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31024,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30024
		}
	},
	[31121] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 5 T1 Royal Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31121,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30021
		}
	},
	[31122] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 5 T2 Royal Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31122,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30022
		}
	},
	[31123] = {
		group_type = 0,
		resource_num = 10000,
		desc = "Exchange 10000 Coins for 5 T3 Royal Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31123,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30023
		}
	},
	[31124] = {
		group_type = 0,
		resource_num = 25000,
		desc = "Exchange 25000 Coins for 5 T4 Royal Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31124,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30024
		}
	},
	[31031] = {
		group_type = 0,
		resource_num = 80,
		desc = "Exchange 80 Coins for 1 T1 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31031,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30031
		}
	},
	[31032] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 1 T2 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31032,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30032
		}
	},
	[31033] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 1 T3 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31033,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30033
		}
	},
	[31034] = {
		group_type = 0,
		resource_num = 5000,
		desc = "Exchange 5000 Coins for 1 T4 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31034,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30034
		}
	},
	[31131] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 5 T1 Sakura Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31131,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30031
		}
	},
	[31132] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 5 T2 Sakura Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31132,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30032
		}
	},
	[31133] = {
		group_type = 0,
		resource_num = 10000,
		desc = "Exchange 10000 Coins for 5 T3 Sakura Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31133,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30033
		}
	},
	[31134] = {
		group_type = 0,
		resource_num = 25000,
		desc = "Exchange 25000 Coins for 5 T4 Sakura Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31134,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30034
		}
	},
	[31041] = {
		group_type = 0,
		resource_num = 80,
		desc = "Exchange 80 Coins for 1 T1 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31041,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30041
		}
	},
	[31042] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 1 T2 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31042,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30042
		}
	},
	[31043] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 1 T3 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31043,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30043
		}
	},
	[31044] = {
		group_type = 0,
		resource_num = 5000,
		desc = "Exchange 5000 Coins for 1 T4 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31044,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30044
		}
	},
	[31141] = {
		group_type = 0,
		resource_num = 400,
		desc = "Exchange 400 Coins for 5 T1 Ironblood Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31141,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30041
		}
	},
	[31142] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Exchange 2000 Coins for 5 T2 Ironblood Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31142,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30042
		}
	},
	[31143] = {
		group_type = 0,
		resource_num = 10000,
		desc = "Exchange 10000 Coins for 5 T3 Ironblood Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31143,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30043
		}
	},
	[31144] = {
		group_type = 0,
		resource_num = 25000,
		desc = "Exchange 25000 Coins for 5 T4 Ironblood Tech Packs",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 5,
		discount = 0,
		resource_type = 1,
		id = 31144,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30044
		}
	},
	[31988] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个绊爱联动外观装备箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31988,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30313
		}
	},
	[31989] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个外观装备箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31989,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30312
		}
	},
	[31990] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个外观装备箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31990,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30311
		}
	},
	[31991] = {
		group_type = 0,
		resource_num = 7000,
		desc = "7000物资兑换1个外观装备箱",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31991,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30310
		}
	},
	[31996] = {
		group_type = 0,
		resource_num = 7000,
		desc = "Exchange 7000 Coins for 1 Gear Skin Box",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31996,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30305
		}
	},
	[31997] = {
		group_type = 0,
		resource_num = 7000,
		desc = "Exchange 7000 Coins for 1 Gear Skin Box",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31997,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30304
		}
	},
	[31998] = {
		group_type = 0,
		resource_num = 7000,
		desc = "Exchange 7000 Coins for 1 Neptune Link Gear Box",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31998,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30303
		}
	},
	[31999] = {
		group_type = 0,
		resource_num = 7000,
		desc = "Exchange 7000 Coins for 1 Gear Skin Box",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 1,
		id = 31999,
		genre = "shopping_street",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30306
		}
	},
	[33011] = {
		group_type = 0,
		resource_num = 100,
		desc = "Exchange 100 Merit for 1 T1 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33011,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30011
		}
	},
	[33012] = {
		group_type = 0,
		resource_num = 300,
		desc = "Exchange 300 Merit for 1 T2 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33012,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30012
		}
	},
	[33013] = {
		group_type = 0,
		resource_num = 600,
		desc = "Exchange 600 Merit for 1 T3 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33013,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30013
		}
	},
	[33014] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Exchange 1500 Merit for 1 T4 Eagle Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33014,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30014
		}
	},
	[33021] = {
		group_type = 0,
		resource_num = 100,
		desc = "Exchange 100 Merit for 1 T1 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33021,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30021
		}
	},
	[33022] = {
		group_type = 0,
		resource_num = 300,
		desc = "Exchange 300 Merit for 1 T2 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33022,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30022
		}
	},
	[33023] = {
		group_type = 0,
		resource_num = 600,
		desc = "Exchange 600 Merit for 1 T3 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33023,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30023
		}
	},
	[33024] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Exchange 1500 Merit for 1 T4 Royal Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33024,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30024
		}
	},
	[33031] = {
		group_type = 0,
		resource_num = 100,
		desc = "Exchange 100 Merit for 1 T1 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33031,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30031
		}
	},
	[33032] = {
		group_type = 0,
		resource_num = 300,
		desc = "Exchange 300 Merit for 1 T2 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33032,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30032
		}
	},
	[33033] = {
		group_type = 0,
		resource_num = 600,
		desc = "Exchange 600 Merit for 1 T3 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33033,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30033
		}
	},
	[33034] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Exchange 1500 Merit for 1 T4 Sakura Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33034,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30034
		}
	},
	[33041] = {
		group_type = 0,
		resource_num = 100,
		desc = "Exchange 100 Merit for 1 T1 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33041,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30041
		}
	},
	[33042] = {
		group_type = 0,
		resource_num = 300,
		desc = "Exchange 300 Merit for 1 T2 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33042,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30042
		}
	},
	[33043] = {
		group_type = 0,
		resource_num = 600,
		desc = "Exchange 600 Merit for 1 T3 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33043,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30043
		}
	},
	[33044] = {
		group_type = 0,
		resource_num = 1500,
		desc = "Exchange 1500 Merit for 1 T4 Ironblood Tech Pack",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 33044,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			30044
		}
	},
	[43001] = {
		group_type = 0,
		resource_num = 20000,
		desc = "Exchange 8000 Merit for Eldridge",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43001,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101261
		}
	},
	[43002] = {
		group_type = 0,
		resource_num = 20000,
		desc = "Exchange 8000 Merit for South Dakota",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43002,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			105141
		}
	},
	[43003] = {
		group_type = 0,
		resource_num = 3000,
		desc = "Exchange 3000 Merit for Engineer",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43003,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			100001
		}
	},
	[43004] = {
		group_type = 0,
		resource_num = 15000,
		desc = "Exchange 10000 Merit for Universal Bulin MKII",
		type = 4,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 3,
		id = 43004,
		genre = "arena_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			100011
		}
	},
	[50002] = {
		group_type = 0,
		resource_num = 50,
		desc = "Spend 50 Gems to buy 1 Quick Build item",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50002,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[50003] = {
		group_type = 0,
		resource_num = 50,
		desc = "Spend 50 Gems to buy 1 Quick Rest item",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50003,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15004
		}
	},
	[50004] = {
		group_type = 0,
		resource_num = 10,
		desc = "Spend 10 Oil to buy 1 Oxy-cola",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50004,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50001
		}
	},
	[50005] = {
		group_type = 0,
		resource_num = 20,
		desc = "Spend 20 Oil to buy 1 Secret Coolant",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50005,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50002
		}
	},
	[50006] = {
		group_type = 0,
		resource_num = 30,
		desc = "Spend 30 Oil to buy 1 Torpedo Tempura",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50006,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50003
		}
	},
	[50007] = {
		group_type = 0,
		resource_num = 50,
		desc = "Spend 50 Oil to buy 1 Watermelon",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 2,
		id = 50007,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50004
		}
	},
	[50008] = {
		group_type = 0,
		resource_num = 10,
		desc = "Spend 10 Gems to buy 1 Royal Gourmet",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50008,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50005
		}
	},
	[50009] = {
		group_type = 0,
		resource_num = 20,
		desc = "Spend 20 Gems to buy 1 Full Course",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 50009,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			50006
		}
	},
	[50011] = {
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Decor Tokens to expand the dorm",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 6,
		id = 50011,
		genre = "backyard_upgrade",
		discount_time = {},
		limit_args = {
			{
				"count",
				0,
				0
			}
		},
		effect_args = {
			15005
		}
	},
	[50012] = {
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Decor Tokens to expand the dorm",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 6,
		id = 50012,
		genre = "backyard_upgrade",
		discount_time = {},
		limit_args = {
			{
				"count",
				1,
				1
			}
		},
		effect_args = {
			15005
		}
	},
	[50013] = {
		group_type = 0,
		resource_num = 1000,
		desc = "Spend 1000 Decor Tokens to expand the dorm",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 6,
		id = 50013,
		genre = "backyard_upgrade",
		discount_time = {},
		limit_args = {
			{
				"count",
				2,
				2
			}
		},
		effect_args = {
			15005
		}
	},
	[60000] = {
		group_type = 0,
		resource_num = 120,
		desc = "Spend 120 Gems to buy Oil Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60000,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40105
		},
		time = {
			{
				{
					2018,
					10,
					8
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
					10,
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
	[60001] = {
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to buy a Lv. 10 Pack",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60001,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				10,
				1
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40005
		}
	},
	[60002] = {
		group_type = 0,
		resource_num = 600,
		desc = "Spend 600 Gems to buy a Lv. 20 Pack",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60002,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				20,
				1
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40006
		}
	},
	[60003] = {
		group_type = 0,
		resource_num = 1000,
		desc = "Spend 1000 Gems to buy a Lv. 30 Pack",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60003,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				30,
				1
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40007
		}
	},
	[60004] = {
		group_type = 0,
		resource_num = 2000,
		desc = "Spend 2000 Gems to buy a Lv. 50 Pack",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60004,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"level",
				50,
				1
			},
			{
				"time",
				1
			}
		},
		effect_args = {
			40008
		}
	},
	[60005] = {
		group_type = 1,
		resource_num = 400,
		desc = "Spend 400 Gems to buy 1 Daily Supplies Pack",
		type = 2,
		is_auto_use = 1,
		group_limit = 1,
		group_buy_count = 1,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 1,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60005,
		genre = "gift_package",
		discount_time = {},
		limit_args = {},
		effect_args = {
			40009
		}
	},
	[60101] = {
		group_type = 1,
		resource_num = 600,
		desc = "Spend 600 Gems to buy Limited Build Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 2,
		group_buy_count = 1,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "stop",
		group = 3,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60101,
		genre = "gift_package",
		discount_time = {},
		limit_args = {},
		effect_args = {
			40001
		}
	},
	[60105] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Limited Pack - Two Hearts",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60105,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2018,
					9,
					20
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
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60109] = {
		group_type = 0,
		resource_num = 120,
		desc = "Spend 200 Gems to buy Red Dyed Raiders Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60109,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40102
		},
		time = {
			{
				{
					2018,
					4,
					28
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
					6,
					4
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60110] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Red Dyed Construction Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60110,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40004
		},
		time = {
			{
				{
					2018,
					4,
					28
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
					6,
					4
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60111] = {
		group_type = 0,
		resource_num = 500,
		desc = "Spend 500 Gems to buy Decor Tokens Pack",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60111,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				3
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					8,
					30
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
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60114] = {
		group_type = 0,
		resource_num = 120,
		desc = "Spend 200 Gems to buy Strategic Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60114,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40105
		},
		time = {
			{
				{
					2018,
					9,
					20
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
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60115] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Construction Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60115,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40104
		},
		time = {
			{
				{
					2018,
					4,
					8
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
					4,
					24
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60125] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to buy Mutsu Strategic Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60125,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40107
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60126] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 980 Gems to buy Mutsu Construction Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60126,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40108
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60127] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60127,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60128] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to purchase Dichotomous Chess Supplies ",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60128,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40109
		},
		time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60135] = {
		group_type = 0,
		resource_num = 120,
		desc = "Fallen Wings Strategic Supplies will cost you 120 gems",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60135,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40113
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60136] = {
		group_type = 0,
		resource_num = 980,
		desc = "Fallen Wings Construction Supplies will cost you 980 gems",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60136,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40114
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60140] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60140,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60141] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60141,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60144] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60144,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[60145] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60145,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[60146] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60146,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40956
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[60147] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60147,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[60148] = {
		group_type = 0,
		resource_num = 120,
		desc = "Spend 120 Gems to buy 凛冬 Strategic Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60148,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60149] = {
		group_type = 0,
		resource_num = 980,
		desc = "Spend 200 Gems to buy 凛冬 Strategic Supplies",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60149,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60150] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60150,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60152] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60152,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					6,
					27
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
					7,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60153] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60153,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					6,
					27
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
					7,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60158] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60158,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60159] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60159,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60160] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60160,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40118
		},
		time = {
			{
				{
					2019,
					5,
					23
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
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60161] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买限时攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60161,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40117
		},
		time = {
			{
				{
					2019,
					5,
					23
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
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60162] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60162,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40106
		},
		time = {
			{
				{
					2019,
					5,
					23
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
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[60163] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 60163,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[61001] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to increase dock capacity by 10",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "ship_bag_size",
		group = 0,
		num = 10,
		discount = 0,
		resource_type = 14,
		id = 61001,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {}
	},
	[61002] = {
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to increase gear capacity by 20",
		type = 0,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		effect_args = "equip_bag_size",
		group = 0,
		num = 20,
		discount = 0,
		resource_type = 14,
		id = 61002,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {}
	},
	[61003] = {
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to buy 11 Wisdom Cubes",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61003,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[61004] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to buy 11 Quick Finish items",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61004,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[61005] = {
		group_type = 0,
		resource_num = 100,
		desc = "Spend 100 Gems to buy 3000 Coins",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 3000,
		discount = 0,
		resource_type = 14,
		id = 61005,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	[61006] = {
		group_type = 0,
		resource_num = 450,
		desc = "Spend 450 Gems to buy 15000 Coins",
		type = 1,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 15000,
		discount = 0,
		resource_type = 14,
		id = 61006,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			1
		}
	},
	[61007] = {
		group_type = 0,
		resource_num = 600,
		desc = "Spend 600 Gems to buy 1 Promise Ring",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 61007,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15006
		}
	},
	[61008] = {
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to buy 11 Wisdom Cubes",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61008,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			20001
		}
	},
	[61009] = {
		group_type = 0,
		resource_num = 200,
		desc = "Spend 200 Gems to buy 11 Quick Finish items",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 11,
		time = "always",
		group = 0,
		num = 11,
		discount = 0,
		resource_type = 14,
		id = 61009,
		genre = "",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15003
		}
	},
	[61010] = {
		group_type = 0,
		resource_num = 300,
		desc = "Spend 300 Gems to buy 1 Identity Change Certification ",
		type = 2,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 61010,
		genre = "gem_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			15009
		}
	},
	[70001] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Illusory Happiness",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9914,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70001,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					2,
					14
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
					2,
					20
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			213011
		},
		time = {
			{
				{
					2019,
					2,
					14
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
					2,
					20
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70002] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Beach Rhapsody",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9994,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70002,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303112
		}
	},
	[70003] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Paradise Amaryllis",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9984,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70003,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307011
		}
	},
	[70004] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Eternal Killing Stone",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9983,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70004,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307021
		}
	},
	[70005] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Shining Beauty",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9995,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70005,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			204031
		}
	},
	[70006] = {
		group_type = 0,
		resource_num = 500,
		desc = "Buy skin - Attack, I-490!",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9982,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70006,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301151
		}
	},
	[70007] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Seven Seas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9996,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70007,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			107031
		}
	},
	[70008] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Future Beach",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9997,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70008,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205041
		}
	},
	[70009] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Midsummer March",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9993,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70009,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303121
		}
	},
	[70010] = {
		group_type = 0,
		resource_num = 500,
		desc = "Buy skin - Summer",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9998,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70010,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			502031
		}
	},
	[70011] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Windsor Sun",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9992,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70011,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			205061
		}
	},
	[70012] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Little Summer War",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 10000,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70012,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101251
		}
	},
	[70013] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Moon Rabbit",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9936,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70013,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			502022
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70014] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Osmanthus Rabbit",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9935,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70014,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			502032
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70015] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Unfading Smile",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9991,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70015,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403031
		}
	},
	[70016] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Summer's Appetite",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9999,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70016,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					23
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
					11,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			502021
		}
	},
	[70017] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Shouhou: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9978,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70017,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			306051
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70018] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Cleveland: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9977,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70018,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102091
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70019] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Ayanami: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9976,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70019,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301051
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70020] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Kagerou: Halloween",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9975,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70020,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301171
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70021] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Illustrious: Tea Party",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9974,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70021,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207031
		}
	},
	[70022] = {
		group_type = 0,
		resource_num = 650,
		desc = "Buy skin - Ikazuchi: Tea Party",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9973,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70022,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301111
		}
	},
	[70023] = {
		group_type = 0,
		resource_num = 650,
		desc = "Buy skin - Inazuma: Tea Party",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9972,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70023,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301121
		}
	},
	[70024] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Eldridge: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9966,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70024,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101261
		}
	},
	[70025] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Enterprise: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9965,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70025,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			107061
		}
	},
	[70026] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Yamashiro: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9964,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70026,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			305022
		}
	},
	[70027] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Cygnet: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9963,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70027,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201102
		}
	},
	[70028] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - San Diego: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9962,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70028,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102081
		}
	},
	[70029] = {
		group_type = 0,
		resource_num = 600,
		desc = "Buy skin - Mutsuki: Christmas",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9961,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70029,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301321
		}
	},
	[70030] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Atago: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9951,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70030,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303122
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70031] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Souryuu: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9950,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70031,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307031
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70032] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Akagi: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9949,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70032,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307012
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70033] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Kaga: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9948,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70033,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307022
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70034] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Laffey: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9947,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70034,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101172
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70035] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Akashi: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9945,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70035,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			312011
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70036] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Prinz Eugen: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9944,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70036,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403032
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70037] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Yuudachi: Spring Festival",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9943,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70037,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					10
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
					1,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			301141
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70038] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Purple Heart: Goddess' Promise",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9970,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70038,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					22
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
					11,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			10100051
		},
		time = {
			{
				{
					2018,
					11,
					22
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
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70039] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Black Heart: Goddess' Smile",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9969,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70039,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					22
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
					11,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			10100061
		},
		time = {
			{
				{
					2018,
					11,
					22
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
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70040] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - White Heart: Goddess' Demureness",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9968,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70040,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					22
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
					11,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			10100071
		},
		time = {
			{
				{
					2018,
					11,
					22
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
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70041] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Green Heart: Goddess' Moment",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9967,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70041,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					22
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
					11,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			10100081
		},
		time = {
			{
				{
					2018,
					11,
					22
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
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70042] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Takao: Spring's Learning",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9934,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70042,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			303113
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70043] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Aurora: Spring's Story",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9933,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70043,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202151
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70044] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Vampire: Spring's Wind",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9932,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70044,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			201231
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70045] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Unicorn: Spring's Present",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9931,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70045,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			206032
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70046] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Changchun: Spring's Embrace",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9919,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70046,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			501031
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70047] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - St. Louis: Spring's Flower",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9954,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70047,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102131
		}
	},
	[70048] = {
		group_type = 0,
		resource_num = 680,
		desc = "Buy skin - Fusou: Spring's Celebration",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9930,
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70048,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					1,
					21
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
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			305011
		},
		time = {
			{
				{
					2019,
					1,
					21
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
					2,
					7
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70049] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Nicholas: Niko Nurse",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9915,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70049,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101311
		}
	},
	[70050] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Eldridge: Mystery of the Empty Classroom",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9905,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70050,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					3,
					21
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
					3,
					27
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			101262
		}
	},
	[70051] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Edinburgh: Fairy of the Library",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9904,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70051,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					3,
					21
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
					3,
					27
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			202111
		}
	},
	[70052] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Souryuu: Hallway Monitor",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9903,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70052,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					3,
					21
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
					3,
					27
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307032
		}
	},
	[70053] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Hiryuu: Hallway Monitor",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9902,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70053,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					3,
					21
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
					3,
					27
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			307041
		}
	},
	[70054] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Honolulu: Parasol Girl",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9900,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70054,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102121
		}
	},
	[70055] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Fubuki: Nearly Late for School",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9899,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70055,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301011
		}
	},
	[70056] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Z1: Rebellious Vierzehn",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9901,
		time = "always",
		group = 0,
		num = 1,
		discount = 20,
		resource_type = 14,
		id = 70056,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					3,
					21
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
					3,
					27
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			401011
		}
	},
	[70057] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Yukikaze: Swings-Sama",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9898,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70057,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301161
		},
		time = {
			{
				{
					2019,
					3,
					21
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
					4,
					3
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70058] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin - Tanikaze: Lost Girl and Labyrinth Butterfly",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9873,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70058,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301621
		}
	},
	[70059] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Admiral Graf Spee: Maiden's Sunday",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9929,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70059,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403051
		}
	},
	[70060] = {
		group_type = 0,
		resource_num = 880,
		desc = "Buy skin - Kirishima: After School Artillery Time",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9870,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70060,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304041
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70061] = {
		group_type = 0,
		resource_num = 800,
		desc = "Buy skin - Ayanami Rock'n KIJIN",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9895,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70061,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301053
		}
	},
	[70062] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Shiratsuyu: Is the Order a Torpedo?",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9894,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70062,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301131
		},
		time = {
			{
				{
					2019,
					3,
					28
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
					4,
					3
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70063] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin - Yuugure: Apprentice Maid",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9893,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70063,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301261
		},
		time = {
			{
				{
					2019,
					3,
					28
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
					4,
					3
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70064] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin: Uzuki",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9872,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70064,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301351
		}
	},
	[70065] = {
		group_type = 0,
		resource_num = 780,
		desc = "Buy skin: Glorious JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9853,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70065,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207061
		},
		time = {
			{
				{
					2019,
					6,
					20
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
					6,
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70066] = {
		group_type = 0,
		resource_num = 700,
		desc = "Buy skin: Acasta - Going Out in Style",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9852,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70066,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201021
		},
		time = {
			{
				{
					2019,
					6,
					20
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
					6,
					26
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70067] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:朝潮校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9886,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70067,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301631
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70068] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:榛名校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9885,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70068,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304031
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70069] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤:江风皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9884,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70069,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301491
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70070] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:文月睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9883,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70070,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301381
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70072] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:高雄JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9890,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70072,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303114
		}
	},
	[70073] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:爱宕JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9889,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70073,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303123
		}
	},
	[70074] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:伊19校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9888,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70074,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308011
		}
	},
	[70075] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:伊26校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9887,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70075,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			308021
		}
	},
	[70076] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:Z46泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9960,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70076,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401461
		},
		time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70077] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:齐柏林泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9959,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70077,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			407011
		},
		time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70078] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤:提尔比茨皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9958,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70078,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405021
		},
		time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70080] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:德意志泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9957,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70080,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			403042
		}
	},
	[70081] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:Z25泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9956,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70081,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401251
		},
		time = {
			{
				{
					2018,
					12,
					21
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
					1,
					21
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70082] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:阿斯托利亚校服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9869,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70082,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103081
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70083] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:昆西泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9868,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70083,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103091
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70084] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:文森斯睡衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9905,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70084,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103101
		},
		time = {
			{
				{
					2019,
					3,
					14
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
					3,
					20
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70085] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:埃米尔·贝尔汀-泳装 ",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9851,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70085,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			802011
		},
		time = {
			{
				{
					2019,
					6,
					27
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
					7,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70086] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:敦刻尔克泳装",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9850,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70086,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			904011
		},
		time = {
			{
				{
					2019,
					6,
					27
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
					7,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70087] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:福尔班常服 ",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9849,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70087,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			801021
		},
		time = {
			{
				{
					2019,
					6,
					27
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
					7,
					10
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70109] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤:火奴鲁鲁皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9854,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70109,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2019,
					6,
					13
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
					6,
					19
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102122
		}
	},
	[70110] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:神通皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9867,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70110,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302131
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70111] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:霍比皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9981,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70111,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101361
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70112] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:科尔克皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9980,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70112,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101371
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70113] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤:明尼阿波利斯皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9979,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70113,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103131
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70114] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:五十铃皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9974,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70114,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			302051
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70115] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:恐怖皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9973,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70115,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			213021
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70116] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤:纳尔逊皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9972,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70116,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205031
		},
		time = {
			{
				{
					2018,
					10,
					30
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
					11,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70117] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤:康克德浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9971,
		time = "always",
		group = 0,
		num = 1,
		discount = 10,
		resource_type = 14,
		id = 70117,
		genre = "skin_shop",
		discount_time = {
			{
				{
					2018,
					11,
					15
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
					11,
					22
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		effect_args = {
			102181
		}
	},
	[70125] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：斯佩常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9928,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70125,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403052
		}
	},
	[70126] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：圣诞尼古拉斯",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9955,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70126,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101312
		},
		time = {
			{
				{
					2018,
					12,
					21
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
					1,
					21
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70127] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：圣诞厌战",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9954,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70127,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205021
		},
		time = {
			{
				{
					2018,
					12,
					21
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
					1,
					21
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70128] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：圣诞浦风",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9953,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70128,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301591
		},
		time = {
			{
				{
					2018,
					12,
					21
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
					1,
					21
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70129] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：圣诞火奴鲁鲁",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9952,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70129,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102123
		},
		time = {
			{
				{
					2018,
					12,
					21
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
					1,
					21
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70130] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：埃尔德里奇浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9937,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70130,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101263
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70131] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：伊吹浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9841,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70131,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399011
		},
		time = {
			{
				{
					2019,
					7,
					4
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
					7,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70132] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：出云浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9842,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70132,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			399021
		},
		time = {
			{
				{
					2019,
					7,
					4
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
					7,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70133] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：威尔士浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9940,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70133,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205062
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70134] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：圣路易斯浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9938,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70134,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102132
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70135] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：矶风新年",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9939,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70135,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301601
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70136] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：海伦娜浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9942,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70136,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102051
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70138] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：足柄浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9941,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70138,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			303091
		},
		time = {
			{
				{
					2019,
					1,
					10
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
					1,
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
	[70141] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：胜利-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9911,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70141,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207041
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70142] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：谢菲尔德-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9910,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70142,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202081
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70143] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：约克公爵-晚礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9909,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70143,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205072
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70144] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：牙买加-常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9908,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70144,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202171
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70145] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：天狼星-晚礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9907,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70145,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202201
		},
		time = {
			{
				{
					2019,
					2,
					21
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
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70146] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：贝尔法斯特旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9917,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70146,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202121
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70147] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：拉菲春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9916,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70147,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101173
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70148] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：太原-春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9918,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70148,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			501041
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70149] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：企业-春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9927,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70149,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107062
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70151] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：君主旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9843,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70151,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			299022
		},
		time = {
			{
				{
					2019,
					7,
					4
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
					7,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70152] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：夕暮旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9926,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70152,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301262
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70153] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：绫波春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9925,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70153,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301054
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70154] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：列克星敦旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9924,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70154,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107021
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70156] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：马拉尼旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9922,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70156,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101392
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70157] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：库拉索旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9921,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70157,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202211
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70158] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：杓鹬旗袍",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9920,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70158,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			202221
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70159] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：追赶者春节",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9919,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70159,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206051
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70160] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：扶桑人妻",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9866,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70160,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305012
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70161] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：独角兽JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9865,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70161,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			206033
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70164] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：波特兰JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9897,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70164,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103061
		}
	},
	[70165] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：印第安纳波利斯JK",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 0,
		order = 9896,
		time = "always",
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70165,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			103071
		}
	},
	[70172] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：小天鹅皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9864,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70172,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201104
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70166] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：长门",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 9871,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70166,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305051
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70167] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：金刚",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9880,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70167,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			304011
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70168] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：宵月",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9881,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70168,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301581
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70170] = {
		group_type = 0,
		resource_num = 800,
		desc = "购买皮肤：光辉",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9891,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70170,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207033
		},
		time = {
			{
				{
					2019,
					3,
					28
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
					4,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70173] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：陆奥",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9882,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70173,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			305061
		},
		time = {
			{
				{
					2019,
					4,
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
					2019,
					4,
					25
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70174] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：绊爱浴衣",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9874,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70174,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			10400011
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70175] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：拉菲coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9879,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70175,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			101174
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70176] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：标枪coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9878,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70176,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			201213
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70177] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：凌波coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9877,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70177,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301055
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70178] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：Z23coco",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9876,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70178,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401233
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					8
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70179] = {
		group_type = 0,
		resource_num = 700,
		desc = "购买皮肤：萨拉托加爱酱联动",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9875,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70179,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107033
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70183] = {
		group_type = 0,
		resource_num = 1180,
		desc = "购买皮肤：俾斯麦礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9855,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70183,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			405011
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70184] = {
		group_type = 0,
		resource_num = 1080,
		desc = "购买皮肤：皇家方舟礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9856,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70184,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207022
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70186] = {
		group_type = 0,
		resource_num = 880,
		desc = "购买皮肤：乔治五世礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9857,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70186,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			205051
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70187] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：Z23礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9858,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70187,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			401234
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70188] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：海妈礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9859,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70188,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			102052
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70189] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：大黄蜂礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9860,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70189,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107071
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70190] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：约克城礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9861,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70190,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			107051
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70191] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：斯佩伯爵礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9862,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70191,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			403053
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70192] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：时雨礼服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9863,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70192,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301152
		},
		time = {
			{
				{
					2019,
					5,
					30
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
					6,
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
	[70199] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：敦刻尔克常服",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9844,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70199,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			904012
		},
		time = {
			{
				{
					2019,
					7,
					4
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
					7,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70200] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：马萨诸塞皮肤",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9845,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70200,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			901012
		},
		time = {
			{
				{
					2019,
					7,
					4
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
					7,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[70201] = {
		group_type = 0,
		resource_num = 780,
		desc = "购买皮肤：福尔班jk",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 9846,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 70201,
		genre = "skin_shop",
		discount_time = {},
		limit_args = {},
		effect_args = {
			801022
		},
		time = {
			{
				{
					2019,
					7,
					4
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
					7,
					17
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[90001] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：光辉-永不落幕的茶会",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 1,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 90001,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			207031
		},
		time = {
			{
				{
					2019,
					5,
					20
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
					5,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[90002] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：夕暮-女仆练习生",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 2,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 90002,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301261
		},
		time = {
			{
				{
					2019,
					5,
					20
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
					5,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[90003] = {
		group_type = 0,
		resource_num = 1,
		desc = "限时皮肤体验：卯月-贪睡的天使",
		type = 6,
		is_auto_use = 0,
		group_limit = 0,
		group_buy_count = 0,
		tag = 0,
		time_second = 172800,
		order = 3,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 125,
		id = 90003,
		genre = "skin_shop_timelimit",
		discount_time = {},
		limit_args = {},
		effect_args = {
			301351
		},
		time = {
			{
				{
					2019,
					5,
					20
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
					5,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99000] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞（堕落之翼活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99000,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99001] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（堕落之翼活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99001,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					10,
					26
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
					11,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99002] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（海王星活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99002,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					11,
					22
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
					5
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99003] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（异色格活动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99003,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2018,
					12,
					13
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
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99004] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买限时礼包-比翼双飞",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99004,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40100
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99005] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买春节建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 2,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99005,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40957
		},
		time = {
			{
				{
					2019,
					1,
					31
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
					2,
					14
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99006] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买红染攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99006,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40102
		},
		time = {
			{
				{
					2017,
					10,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					11,
					9
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99007] = {
		group_type = 0,
		resource_num = 980,
		desc = "980钻石购买红染建造补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99007,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				1
			}
		},
		effect_args = {
			40004
		},
		time = {
			{
				{
					2017,
					10,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2017,
					11,
					9
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99008] = {
		group_type = 0,
		resource_num = 500,
		desc = "500钻石购买家具币礼包（绊爱联动时美服独有）",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 6,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99008,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				2
			}
		},
		effect_args = {
			40103
		},
		time = {
			{
				{
					2019,
					4,
					26
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
					5,
					15
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[99009] = {
		group_type = 0,
		resource_num = 120,
		desc = "120钻石购买攻略补给",
		type = 2,
		is_auto_use = 1,
		group_limit = 0,
		group_buy_count = 0,
		tag = 1,
		time_second = 0,
		order = 0,
		group = 0,
		num = 1,
		discount = 0,
		resource_type = 14,
		id = 99009,
		genre = "gift_package",
		discount_time = {},
		limit_args = {
			{
				"time",
				5
			}
		},
		effect_args = {
			40105
		},
		time = {
			{
				{
					2019,
					6,
					13
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
					6,
					26
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
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		21001,
		21002,
		21003,
		21004,
		21005,
		21006,
		21007,
		21008,
		21009,
		21010,
		21011,
		21012,
		21013,
		21014,
		21015,
		21016,
		21017,
		21018,
		21019,
		21020,
		21021,
		21022,
		21023,
		21024,
		21025,
		21026,
		21027,
		21028,
		21029,
		21030,
		21031,
		21032,
		23001,
		24001,
		24002,
		24003,
		24004,
		24005,
		24006,
		24007,
		24008,
		24009,
		24010,
		24011,
		24012,
		24013,
		31011,
		31012,
		31013,
		31014,
		31111,
		31112,
		31113,
		31114,
		31021,
		31022,
		31023,
		31024,
		31121,
		31122,
		31123,
		31124,
		31031,
		31032,
		31033,
		31034,
		31131,
		31132,
		31133,
		31134,
		31041,
		31042,
		31043,
		31044,
		31141,
		31142,
		31143,
		31144,
		31988,
		31989,
		31990,
		31991,
		31996,
		31997,
		31998,
		31999,
		33011,
		33012,
		33013,
		33014,
		33021,
		33022,
		33023,
		33024,
		33031,
		33032,
		33033,
		33034,
		33041,
		33042,
		33043,
		33044,
		43001,
		43002,
		43003,
		43004,
		50002,
		50003,
		50004,
		50005,
		50006,
		50007,
		50008,
		50009,
		50011,
		50012,
		50013,
		60000,
		60001,
		60002,
		60003,
		60004,
		60005,
		60101,
		60105,
		60109,
		60110,
		60111,
		60114,
		60115,
		60125,
		60126,
		60127,
		60128,
		60135,
		60136,
		60140,
		60141,
		60144,
		60145,
		60146,
		60147,
		60148,
		60149,
		60150,
		60152,
		60153,
		60158,
		60159,
		60160,
		60161,
		60162,
		60163,
		61001,
		61002,
		61003,
		61004,
		61005,
		61006,
		61007,
		61008,
		61009,
		61010,
		70001,
		70002,
		70003,
		70004,
		70005,
		70006,
		70007,
		70008,
		70009,
		70010,
		70011,
		70012,
		70013,
		70014,
		70015,
		70016,
		70017,
		70018,
		70019,
		70020,
		70021,
		70022,
		70023,
		70024,
		70025,
		70026,
		70027,
		70028,
		70029,
		70030,
		70031,
		70032,
		70033,
		70034,
		70035,
		70036,
		70037,
		70038,
		70039,
		70040,
		70041,
		70042,
		70043,
		70044,
		70045,
		70046,
		70047,
		70048,
		70049,
		70050,
		70051,
		70052,
		70053,
		70054,
		70055,
		70056,
		70057,
		70058,
		70059,
		70060,
		70061,
		70062,
		70063,
		70064,
		70065,
		70066,
		70067,
		70068,
		70069,
		70070,
		70072,
		70073,
		70074,
		70075,
		70076,
		70077,
		70078,
		70080,
		70081,
		70082,
		70083,
		70084,
		70085,
		70086,
		70087,
		70109,
		70110,
		70111,
		70112,
		70113,
		70114,
		70115,
		70116,
		70117,
		70125,
		70126,
		70127,
		70128,
		70129,
		70130,
		70131,
		70132,
		70133,
		70134,
		70135,
		70136,
		70138,
		70141,
		70142,
		70143,
		70144,
		70145,
		70146,
		70147,
		70148,
		70149,
		70151,
		70152,
		70153,
		70154,
		70156,
		70157,
		70158,
		70159,
		70160,
		70161,
		70164,
		70165,
		70172,
		70166,
		70167,
		70168,
		70170,
		70173,
		70174,
		70175,
		70176,
		70177,
		70178,
		70179,
		70183,
		70184,
		70186,
		70187,
		70188,
		70189,
		70190,
		70191,
		70192,
		70199,
		70200,
		70201,
		90001,
		90002,
		90003,
		99000,
		99001,
		99002,
		99003,
		99004,
		99005,
		99006,
		99007,
		99008,
		99009
	}
}

return
