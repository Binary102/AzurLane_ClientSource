pg = pg or {}
pg.skill_data_template = {
	[10] = {
		desc_get = "",
		name = "Repair Ⅰ",
		desc = "Recover 6 HP every 5 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 10,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[11] = {
		desc_get = "",
		name = "Repair Ⅱ",
		desc = "Recover 10 HP every 5 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 11,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[12] = {
		desc_get = "",
		name = "Repair Ⅲ",
		desc = "Recover 15 HP every 5 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 12,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[14] = {
		desc_get = "",
		name = "Universal Bulin",
		desc = "May be used as material to limit break Elite and below ships.",
		type = 3,
		max_level = 1,
		id = 14,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[15] = {
		desc_get = "",
		name = "Prototype Bulin MKII",
		desc = "May be used as material to limit break Super Rare ships.",
		type = 3,
		max_level = 1,
		id = 15,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[1001] = {
		desc_get = "",
		name = "Artillery Command: Destroyer",
		desc = "Increase Firepower of all destroyers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1001,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1002] = {
		desc_get = "",
		name = "Artillery Command: Cruiser",
		desc = "Increase Firepower of all cruisers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1002,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1003] = {
		desc_get = "",
		name = "Artillery Command: Battleship",
		desc = "Increase Firepower of all battleships in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1003,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1004] = {
		desc_get = "",
		name = "Artillery Command: Vanguard",
		desc = "Increase Firepower of vanguard by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1004,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1005] = {
		desc_get = "",
		name = "Artillery Command: Main Fleet",
		desc = "Increase Firepower of main fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1005,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1006] = {
		desc_get = "",
		name = "Artillery Command: All",
		desc = "Increase Firepower of entire fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1006,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1011] = {
		desc_get = "",
		name = "Torpedo Command: Destroyer",
		desc = "Increase Torpedo effectiveness of all destroyers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1011,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1012] = {
		desc_get = "",
		name = "Torpedo Command: Cruiser",
		desc = "Increase Torpedo effectiveness of all cruisers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1012,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1013] = {
		desc_get = "",
		name = "Torpedo Command: Vanguard",
		desc = "Increase Torpedo effectiveness of vanguard by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1013,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1021] = {
		desc_get = "",
		name = "Air Command: All",
		desc = "Increase Aviation of entire fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1021,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1031] = {
		desc_get = "",
		name = "Reload Command: Destroyer",
		desc = "Increase Reload of all destroyers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1031,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1032] = {
		desc_get = "",
		name = "Reload Command: Cruiser",
		desc = "Increase Reload of all cruisers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1032,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1033] = {
		desc_get = "",
		name = "Reload Command: Battleship",
		desc = "Increase Reload of all battleships in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1033,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1034] = {
		desc_get = "",
		name = "Reload Command: Vanguard",
		desc = "Increase Reload of vanguard by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1034,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1035] = {
		desc_get = "",
		name = "Reload Command: Main Fleet",
		desc = "Increase Reload of main fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1035,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1036] = {
		desc_get = "",
		name = "Reload Command: All",
		desc = "Increase Reload of entire fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1036,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1037] = {
		desc_get = "",
		name = "Reload Command: Light Carriers",
		desc = "Increase Reload of all light carriers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1037,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1041] = {
		desc_get = "",
		name = "Anti-Air Command: Destroyer",
		desc = "Increase Anti-Air of all destroyers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1041,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1042] = {
		desc_get = "",
		name = "Anti-Air Command: Cruiser",
		desc = "Increase Anti-Air of all cruisers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1042,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1043] = {
		desc_get = "",
		name = "Anti-Air Command: Battleship",
		desc = "Increase Anti-Air of all battleships in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1043,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1044] = {
		desc_get = "",
		name = "Anti-Air Command: Vanguard",
		desc = "Increase Anti-Air of vanguard by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1044,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1045] = {
		desc_get = "",
		name = "Anti-Air Command: Main Fleet",
		desc = "Increase Anti-Air of main fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1045,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1046] = {
		desc_get = "",
		name = "Anti-Air Command: All",
		desc = "Increase Anti-Air of entire fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1046,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1051] = {
		desc_get = "",
		name = "Tactical Command: Destroyer",
		desc = "Increase Firepower, Torpedo effectiveness, and Reload of all destroyers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1051,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[1052] = {
		desc_get = "",
		name = "Tactical Command: Cruiser",
		desc = "Increase Firepower, Torpedo effectiveness, and Reload of all cruisers in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1052,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[1053] = {
		desc_get = "",
		name = "Tactical Command: Battleship",
		desc = "Increase Firepower, Torpedo effectiveness, and Reload of all battleships in fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1053,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[1054] = {
		desc_get = "",
		name = "Tactical Command: Vanguard",
		desc = "Increase Firepower, Torpedo effectiveness, and Reload of vanguard by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1054,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[1055] = {
		desc_get = "",
		name = "Tactical Command: Main Fleet",
		desc = "Increase Firepower, Torpedo effectiveness, and Reload of main fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1055,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[1056] = {
		desc_get = "",
		name = "Tactical Command: All",
		desc = "Increase Firepower, Torpedo effectiveness, and Reload of entire fleet by $1. Does not stack with similar command skills.",
		type = 3,
		max_level = 10,
		id = 1056,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[1061] = {
		desc_get = "",
		name = "Flank Defense",
		desc = "Reduce main fleet's DMG taken by $1 (while alive). Effect does not stack.",
		type = 2,
		max_level = 10,
		id = 1061,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1071] = {
		desc_get = "",
		name = "Frontline Recon",
		desc = "Increase DMG of attacks by Battlecruisers, Battleships, and Monitors by $1 while alive. Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 1071,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1081] = {
		desc_get = "",
		name = "Air Raid Assistance",
		desc = "Increase DMG of airstrikes by Light Carriers and Aircraft Carriers by $1 while alive. Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 1081,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[1091] = {
		desc_get = "",
		name = "Mining Fleet",
		desc = "Increase Torpedo and Reload of all Destroyers and Light Cruisers by $1 while alive.",
		type = 3,
		max_level = 10,
		id = 1091,
		system_transform = {},
		desc_get_add = {
			{
				"3.0%",
				"15.0%"
			}
		},
		desc_add = {
			{
				{
					"3.0%",
					"+0.8%"
				},
				{
					"3.8%",
					"+0.8%"
				},
				{
					"4.6%",
					"+1.0%"
				},
				{
					"5.6%",
					"+1.2%"
				},
				{
					"6.8%",
					"+1.2%"
				},
				{
					"8.0%",
					"+1.5%"
				},
				{
					"9.5%",
					"+1.5%"
				},
				{
					"11.0%",
					"+2.0%"
				},
				{
					"13.0%",
					"+2.0%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[2001] = {
		desc_get = "",
		name = "Quick Reload",
		desc = "Every 20 seconds, $1 chance to increase own Reload by $2 for 10 seconds.",
		type = 1,
		max_level = 10,
		id = 2001,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[2011] = {
		desc_get = "",
		name = "Full Firepower",
		desc = "Every 20 seconds, $1 chance to increase own Firepower by $2 for 10 seconds.",
		type = 1,
		max_level = 10,
		id = 2011,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[2021] = {
		desc_get = "",
		name = "Reload Order",
		desc = "Every 20 seconds, 25% chance to increase entire fleet's Reload by $1 for 8 seconds. Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 2021,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[2031] = {
		desc_get = "",
		name = "Assault Order",
		desc = "Every 20 seconds, 25% chance to increase entire fleet's DMG by $1 for 8 seconds. Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 2031,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[2041] = {
		desc_get = "",
		name = "Focused Assault",
		desc = "$1 chance for Main Gun to deal 2x DMG.",
		type = 1,
		max_level = 10,
		id = 2041,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[2051] = {
		desc_get = "",
		name = "Double Torpedo",
		desc = "When using torpedoes, $1 chance to launch a second wave.",
		type = 1,
		max_level = 10,
		id = 2051,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[2061] = {
		desc_get = "",
		name = "Double Gun",
		desc = "When using Main Gun, $1 chance to fire twice.",
		type = 1,
		max_level = 10,
		id = 2061,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[2071] = {
		desc_get = "",
		name = "Cover Fire",
		desc = "Increase own Firepower by $1.",
		type = 1,
		max_level = 10,
		id = 2071,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"20%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[2081] = {
		desc_get = "",
		name = "Piercing Shells",
		desc = "Increase AP DMG by $1.",
		type = 1,
		max_level = 10,
		id = 2081,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[2091] = {
		desc_get = "Every 35 seconds (15 seconds when fully upgraded), launch 4 magnetic torpedoes with small-scale tracking. Power based on skill's level.",
		name = "Magnetic Torpedo",
		desc = "Every $1 seconds, launch 4 magnetic torpedoes. Power based on skill's level.",
		type = 1,
		max_level = 10,
		id = 2091,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"35",
					"-2"
				},
				{
					"33",
					"-2"
				},
				{
					"31",
					"-2"
				},
				{
					"29",
					"-2"
				},
				{
					"27",
					"-2"
				},
				{
					"25",
					"-3"
				},
				{
					"22",
					"-2"
				},
				{
					"20",
					"-2"
				},
				{
					"18",
					"-3"
				},
				{
					"15"
				}
			}
		}
	},
	[2101] = {
		desc_get = "Every 35 seconds (20 seconds when fully upgraded), launch 3 torpedoes. Power based on skill's level.",
		name = "Torpedo Barrage",
		desc = "Every $1 seconds, launch 3 torpedoes. Power based on skill's level.",
		type = 1,
		max_level = 10,
		id = 2101,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"35",
					"-1"
				},
				{
					"34",
					"-1"
				},
				{
					"33",
					"-2"
				},
				{
					"31",
					"-1"
				},
				{
					"30",
					"-1"
				},
				{
					"29",
					"-3"
				},
				{
					"26",
					"-1"
				},
				{
					"25",
					"-2"
				},
				{
					"23",
					"-3"
				},
				{
					"20"
				}
			}
		}
	},
	[2111] = {
		desc_get = "Increase DMG against Bombing Ships, Torpedo Ships, and Cargo Ships by 10% (increase by 25% when fully upgraded).",
		name = "Disturbance Strategy",
		desc = "Increase DMG against Bombing Ships, Torpedo Ships, and Cargo Ships by $1.",
		type = 1,
		max_level = 10,
		id = 2111,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.5%"
				},
				{
					"11.5%",
					"+1.5%"
				},
				{
					"13%",
					"+1.5%"
				},
				{
					"14.5%",
					"+1.6%"
				},
				{
					"16.1%",
					"+1.6%"
				},
				{
					"17.7%",
					"+1.7%"
				},
				{
					"19.4%",
					"+1.8%"
				},
				{
					"21.2%",
					"+1.8%"
				},
				{
					"23%",
					"+2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[2121] = {
		desc_get = "",
		name = "Target Designator - Torpedo",
		desc = "When a torpedo successfully strikes an enemy, $1 chance to trigger Target Designator for 8 seconds, increasing that enemy's DMG taken from torpedoes by $2. Does not stack.",
		type = 1,
		max_level = 10,
		id = 2121,
		system_transform = {},
		desc_get_add = {
			{
				"7.0%",
				"17.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"7.0%",
					"+1.1%"
				},
				{
					"8.1%",
					"+1.1%"
				},
				{
					"9.2%",
					"+1.1%"
				},
				{
					"10.3%",
					"+1.1%"
				},
				{
					"11.4%",
					"+1.1%"
				},
				{
					"12.5%",
					"+1.1%"
				},
				{
					"13.6%",
					"+1.1%"
				},
				{
					"14.7%",
					"+1.1%"
				},
				{
					"15.8%",
					"+1.2%"
				},
				{
					"17.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[2131] = {
		desc_get = "",
		name = "Aerial Support",
		desc = "When enemy aircraft are brought down with Anti-Air range, increase own Firepower and Anti-Air by $1 for 8 seconds. Does not stack.",
		type = 1,
		max_level = 10,
		id = 2131,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[2141] = {
		desc_get = "",
		name = "Anti-Destroyer Tactics",
		desc = "Increase Hit against Destroyers and reduce DMG taken from torpedoes by XX%.",
		type = 2,
		max_level = 10,
		id = 2141,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[2151] = {
		desc_get = "",
		name = "均衡鱼雷",
		desc = "自身鱼雷伤害不受装甲类型影响，鱼雷伤害随技能等级提高而提高",
		type = 3,
		max_level = 10,
		id = 2151,
		system_transform = {},
		desc_get_add = {
			{
				"100.0%",
				"115.0%"
			}
		},
		desc_add = {
			{
				{
					"100.0%",
					"+1.6%"
				},
				{
					"101.6%",
					"+1.6%"
				},
				{
					"103.2%",
					"+1.6%"
				},
				{
					"104.8%",
					"+1.6%"
				},
				{
					"106.4%",
					"+1.6%"
				},
				{
					"108.0%",
					"+1.6%"
				},
				{
					"109.6%",
					"+1.8%"
				},
				{
					"111.4%",
					"+1.8%"
				},
				{
					"113.2%",
					"+1.8%"
				},
				{
					"115.0%"
				}
			}
		}
	},
	[2171] = {
		desc_get = "",
		name = "Anti-air Vigilance ",
		desc = "Increase own Anti-Air by $1. ",
		type = 2,
		max_level = 10,
		id = 2171,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3001] = {
		desc_get = "",
		name = "Quick Takeoff",
		desc = "$1 chance to immediately reset cooldown after deploying an airstrike.",
		type = 1,
		max_level = 10,
		id = 3001,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3011] = {
		desc_get = "",
		name = "Assault Carrier",
		desc = "$1 chance for airstrikes to deal 2x DMG.",
		type = 1,
		max_level = 10,
		id = 3011,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[3021] = {
		desc_get = "",
		name = "Fleet Carrier",
		desc = "Increase vanguard's DMG by $1 for 8 seconds after deploying an airstrike . Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 3021,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3031] = {
		desc_get = "",
		name = "Support Carrier",
		desc = "Restore $1 HP to vanguard ships after deploying an airstrike.",
		type = 3,
		max_level = 10,
		id = 3031,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			}
		}
	},
	[3041] = {
		desc_get = "",
		name = "Air Support",
		desc = "Increase other carrier's Aviation by $1 for 8 seconds after deploying an airstrike.",
		type = 3,
		max_level = 10,
		id = 3041,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3051] = {
		desc_get = "",
		name = "Air Cover",
		desc = "Reduce vanguard ships' DMG taken by $1 for 8 seconds after deploying an airstrike.",
		type = 2,
		max_level = 10,
		id = 3051,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3511] = {
		desc_get = "",
		name = "Extra Oxygen",
		desc = "Increase own Oxygen by $1.",
		type = 3,
		max_level = 10,
		id = 3511,
		system_transform = {},
		desc_get_add = {
			{
				"4",
				"40"
			}
		},
		desc_add = {
			{
				{
					"4",
					"+4"
				},
				{
					"8",
					"+4"
				},
				{
					"12",
					"+4"
				},
				{
					"16",
					"+4"
				},
				{
					"20",
					"+4"
				},
				{
					"24",
					"+4"
				},
				{
					"28",
					"+4"
				},
				{
					"32",
					"+4"
				},
				{
					"36",
					"+4"
				},
				{
					"40"
				}
			}
		}
	},
	[3521] = {
		desc_get = "",
		name = "Rationed Oxygen",
		desc = "Reduce own Oxygen consumption by X.",
		type = 2,
		max_level = 10,
		id = 3521,
		system_transform = {},
		desc_get_add = {
			{
				"4.5",
				"12.0"
			}
		},
		desc_add = {
			{
				{
					"4.5",
					"+0.7"
				},
				{
					"5.2",
					"+0.8"
				},
				{
					"6.0",
					"+1.0"
				},
				{
					"7.0",
					"+0.7"
				},
				{
					"7.7",
					"+0.8"
				},
				{
					"8.5",
					"+1.0"
				},
				{
					"9.5",
					"+0.7"
				},
				{
					"10.2",
					"+0.8"
				},
				{
					"11.0",
					"+1.0"
				},
				{
					"12.0"
				}
			}
		}
	},
	[3531] = {
		desc_get = "",
		name = "缓速鱼雷",
		desc = "鱼雷移动速度降低1，伤害提高$1",
		type = 1,
		max_level = 10,
		id = 3531,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.7%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+0.7%"
				},
				{
					"7.7%",
					"+0.8%"
				},
				{
					"8.5%",
					"+1.0%"
				},
				{
					"9.5%",
					"+0.7%"
				},
				{
					"10.2%",
					"+0.8%"
				},
				{
					"11.0%",
					"+1.0%"
				},
				{
					"12.0%"
				}
			}
		}
	},
	[3571] = {
		desc_get = "",
		name = "Light Cruiser Hunter",
		desc = "Increase DMG dealt to Light Cruisers by $1.",
		type = 1,
		max_level = 10,
		id = 3571,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3581] = {
		desc_get = "",
		name = "Heavy Cruiser Hunter",
		desc = "Increase DMG dealt to Heavy Cruisers by $1.",
		type = 1,
		max_level = 10,
		id = 3581,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3591] = {
		desc_get = "",
		name = "Carrier Hunter",
		desc = "Increase DMG dealt to Carriers by $1.",
		type = 1,
		max_level = 10,
		id = 3591,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[3611] = {
		desc_get = "",
		name = "狼群战术",
		desc = "出击时，编队中每有一个铁血阵营潜艇角色，自身雷击、装填属性上升$1",
		type = 1,
		max_level = 10,
		id = 3611,
		system_transform = {},
		desc_get_add = {
			{
				"1.5%",
				"6.0%"
			}
		},
		desc_add = {
			{
				{
					"1.5%",
					"+0.5%"
				},
				{
					"2.0%",
					"+0.5%"
				},
				{
					"2.5%",
					"+0.5%"
				},
				{
					"3.0%",
					"+0.5%"
				},
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%"
				}
			}
		}
	},
	[4001] = {
		desc_get = "",
		name = "Defensive Stance",
		desc = "Every 20 seconds, $1 chance to reduce own DMG taken by $2 for 8 seconds.",
		type = 2,
		max_level = 10,
		id = 4001,
		system_transform = {},
		desc_get_add = {
			{
				"30%",
				"60%"
			},
			{
				"10%",
				"30%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[4011] = {
		desc_get = "",
		name = "Defensive Order",
		desc = "Every 20 seconds, 25% chance to reduce entire fleet's DMG taken by $1 for 8 seconds. Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 4011,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[4021] = {
		desc_get = "",
		name = "Vice Defense",
		desc = "$1 chance to reduce DMG taken by 50% when being attacked.",
		type = 2,
		max_level = 10,
		id = 4021,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			}
		}
	},
	[4031] = {
		desc_get = "",
		name = "Damage Control",
		desc = "Restore own HP by $1 every 25 seconds.",
		type = 2,
		max_level = 10,
		id = 4031,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[4041] = {
		desc_get = "",
		name = "Draw Fire",
		desc = "Every 20 seconds, $1 chance to take 50% of DMG received by vanguard ships for 8 seconds. Effect does not stack.",
		type = 2,
		max_level = 10,
		id = 4041,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"40%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+3.0%"
				},
				{
					"13.0%",
					"+3.0%"
				},
				{
					"16.0%",
					"+4.0%"
				},
				{
					"20.0%",
					"+3.0%"
				},
				{
					"23.0%",
					"+3.0%"
				},
				{
					"26.0%",
					"+4.0%"
				},
				{
					"30.0%",
					"+3.0%"
				},
				{
					"33.0%",
					"+3.0%"
				},
				{
					"36.0%",
					"+4.0%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[4051] = {
		desc_get = "15% chance to deploy a shield in front of self which can block up to 12 rounds. Shield lasts for 5 seconds (15 seconds when fully upgraded).",
		name = "Forward Armor",
		desc = "15% chance to deploy a shield in front of self which can block up to 12 rounds. Shield lasts for $1 seconds.",
		type = 2,
		max_level = 10,
		id = 4051,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[4061] = {
		desc_get = "15% chance to deploy 2 shields at the side which can block up to 6 rounds each. Shields last for 5 seconds (15 seconds when fully upgraded)",
		name = "Side Armor",
		desc = "15% chance to deploy 2 shields at the side which can block up to 6 rounds each. Shields last for $1 seconds.",
		type = 2,
		max_level = 10,
		id = 4061,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[4071] = {
		desc_get = "",
		name = "Extreme Evasion",
		desc = "Every 20 seconds, $1 chance to avoid all attacks for 6 seconds.",
		type = 2,
		max_level = 10,
		id = 4071,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[4081] = {
		desc_get = "",
		name = "Smokescreen",
		desc = "Deploy a smokescreen at the start of battle which lasts for 5 seconds. $1 chance to deploy another smokescreen every 15 seconds. Increase Evasion of ships inside smokescreen by $2. Effect does not stack.",
		type = 2,
		max_level = 10,
		id = 4081,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[4091] = {
		desc_get = "",
		name = "Anti-Air Mode",
		desc = "After firing anti-air guns, 25% chance to increase own Anti-Air by $1 and reduce own Firepower by $2 for 3 seconds.",
		type = 2,
		max_level = 10,
		id = 4091,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			},
			{
				"40.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"40.0%",
					"-2.2%"
				},
				{
					"37.8%",
					"-2.2%"
				},
				{
					"35.6%",
					"-2.2%"
				},
				{
					"33.4%",
					"-2.2%"
				},
				{
					"31.2%",
					"-2.2%"
				},
				{
					"29.0%",
					"-2.2%"
				},
				{
					"26.8%",
					"-2.2%"
				},
				{
					"24.6%",
					"-2.2%"
				},
				{
					"22.4%",
					"-2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[4101] = {
		desc_get = "",
		name = "Smokescreen: Light Cruisers",
		desc = "After 10 seconds into the battle and every 20 seconds with 20% chance, deploy a smokescreen which lasts for 10 seconds. Ships inside the smokescreen gain $1 bonus Evasion and reduce Air DMG taken by $2. Effect does not stack.",
		type = 2,
		max_level = 10,
		id = 4101,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"35%"
			},
			{
				"15%",
				"35%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			},
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[4111] = {
		desc_get = "",
		name = "AP Protection",
		desc = "Reduce DMG taken from AP ammo by $1.",
		type = 2,
		max_level = 10,
		id = 4111,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"20%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[4121] = {
		desc_get = "",
		name = "Protective Armor ",
		desc = "Reduces cannon DMG taken from enemy DDs and Cls by $1.",
		type = 2,
		max_level = 10,
		id = 4121,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[4131] = {
		desc_get = "",
		name = "冲突禁止",
		desc = "先锋部队与敌方相撞时，我方受到的伤害降低$1。",
		type = 2,
		max_level = 10,
		id = 4131,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%",
					"+1.6%"
				},
				{
					"21.6%",
					"+1.6%"
				},
				{
					"23.2%",
					"+1.8%"
				},
				{
					"25.0%",
					"+1.6%"
				},
				{
					"26.6%",
					"+1.6%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[4141] = {
		desc_get = "",
		name = "Swift Defender",
		desc = "As long as this ship is alive, reduces the DMG taken of friendly main fleet by $1, and self DMG taken from enemy light cruisers and destroyers' main gun and torpedo attacks by $2.",
		type = 2,
		max_level = 10,
		id = 4141,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			},
			{
				"1%",
				"10%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			},
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[5001] = {
		desc_get = "Every 20 seconds, 25% chance to reduce an enemy's Fire Rate and DMG for 5 seconds (10 seconds when fully upgraded). Prioritizes Elite targets (humanoid type). Effect does not stack.",
		name = "Interference",
		desc = "Every 20 seconds, 25% chance to reduce an enemy's Fire Rate and DMG for $1 seconds. Prioritizes Elite targets (humanoid type). Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 5001,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5.0",
					"+0.5"
				},
				{
					"5.5",
					"+0.5"
				},
				{
					"6.0",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7.0",
					"+0.5"
				},
				{
					"7.5",
					"+0.5"
				},
				{
					"8.0",
					"+0.5"
				},
				{
					"8.5",
					"+0.5"
				},
				{
					"9.0",
					"+1"
				},
				{
					"10.0"
				}
			}
		}
	},
	[5011] = {
		desc_get = "Every 20 seconds, 25% chance to increase an enemy's DMG taken by 20% for 5 seconds (15 seconds when fully upgraded). Prioritizes Elite targets (humanoid type). Effect does not stack.",
		name = "Vulnerability Detection",
		desc = "Every 20 seconds, 25% chance to increase an enemy's DMG taken by 20% for $1 seconds. Prioritizes Elite targets (humanoid type). Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 5011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[5021] = {
		desc_get = "",
		name = "Carrier Escort",
		desc = "Reduce Light Carriers' and Carriers' DMG taken by $1 (while alive). Effect does not stack.",
		type = 2,
		max_level = 10,
		id = 5021,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[5031] = {
		desc_get = "",
		name = "Battleship Escort",
		desc = "Reduce Battlecruisers' and Battleships' DMG taken by $1 (while alive). Effect does not stack.",
		type = 2,
		max_level = 10,
		id = 5031,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[5041] = {
		desc_get = "",
		name = "Flares",
		desc = "10 seconds after battle begins, deploy a flare for 10 seconds. Every 20 seconds following, $1 chance to deploy another flare. Flare reduces Evasion of enemy ships within flare range by 25%. Effect does not stack. Flare will prioritize closest enemy target.",
		type = 3,
		max_level = 10,
		id = 5041,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[5051] = {
		desc_get = "",
		name = "Flagship Cover",
		desc = "While alive, reduce DMG taken by Flagship by $1.",
		type = 3,
		max_level = 10,
		id = 5051,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[5061] = {
		desc_get = "",
		name = "驱逐编队",
		desc = "出击时，若先锋编队仅由自己和驱逐舰组成（至少编入一名驱逐舰），则自身航速提高4，对驱逐舰和轻巡洋舰造成的伤害提高$1",
		type = 3,
		max_level = 10,
		id = 5061,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[5071] = {
		desc_get = "",
		name = "骑士之盾",
		desc = "当先锋舰队只有自由鸢尾、维希教廷阵营的角色时生效，每隔20秒，有50%的概率发动，我方所有单位受到的伤害降低$1，持续8秒，同技能效果不叠加",
		type = 2,
		max_level = 10,
		id = 5071,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[5081] = {
		desc_get = "",
		name = "骑士之剑",
		desc = "当先锋舰队只有自由鸢尾、维希教廷阵营的角色时生效，每隔20秒，有50%的概率发动，我方所有单位造成的伤害上升$1，持续8秒，同技能效果不叠加",
		type = 1,
		max_level = 10,
		id = 5081,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[6000] = {
		desc_get = "",
		name = "Beaver Squad",
		desc = "Increase entire fleet's Speed by 20%.",
		type = 0,
		max_level = 0,
		id = 6000,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6010] = {
		desc_get = "",
		name = "Anti-Torpedo Bulge Ⅰ",
		desc = "Reduce DMG taken from torpedoes by 10%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6010,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6020] = {
		desc_get = "",
		name = "Anti-Torpedo Bulge Ⅱ",
		desc = "Reduce DMG taken from torpedoes by 20%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6020,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6030] = {
		desc_get = "",
		name = "Anti-Torpedo Bulge Ⅲ",
		desc = "Reduce DMG taken from torpedoes by 30%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6030,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6040] = {
		desc_get = "",
		name = "SG Radar Ⅰ",
		desc = "Provides enhanced reconnaissance abilities, decreasing chance of being ambushed by 5% and increases chance to avoid ambushes by 5%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6040,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6050] = {
		desc_get = "",
		name = "SG Radar Ⅱ",
		desc = "Provides enhanced reconnaissance abilities, decreasing chance of being ambushed by 8% and increases chance to avoid ambushes by 8%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6050,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6060] = {
		desc_get = "",
		name = "SG Radar Ⅲ",
		desc = "Provides enhanced reconnaissance abilities, decreasing chance of being ambushed by 12% and increases chance to avoid ambushes by 12%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6060,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6070] = {
		desc_get = "",
		name = "Aviation Oil Tank Ⅰ",
		desc = "Increase Aircraft HP by 50. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6070,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6080] = {
		desc_get = "",
		name = "Aviation Oil Tank Ⅱ",
		desc = "Increase Aircraft HP by 80. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6080,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6090] = {
		desc_get = "",
		name = "Aviation Oil Tank Ⅲ",
		desc = "Increase Aircraft HP by 120. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6090,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6100] = {
		desc_get = "",
		name = "Repair Tools Ⅰ",
		desc = "Recover 0.3% HP every 15 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6100,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6110] = {
		desc_get = "",
		name = "Repair Tools Ⅱ",
		desc = "Recover 0.6% HP every 15 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6110,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6120] = {
		desc_get = "",
		name = "Repair Tools Ⅲ",
		desc = "Recover 1.0% HP every 15 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6120,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6130] = {
		desc_get = "",
		name = "Pearl's Tears ",
		desc = "Restore 10% HP to all allied ships when being sunk.",
		type = 0,
		max_level = 0,
		id = 6130,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6140] = {
		desc_get = "",
		name = "Fire Suppressor Ⅰ",
		desc = "Reduce chance of fire breaking out by 10% and DMG taken from fires by 10%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6140,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6150] = {
		desc_get = "",
		name = "Fire Suppressor Ⅱ",
		desc = "Reduce chance of fire breaking out by 20%, DMG taken from fires by 15%, and duration of fires by 3 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6150,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6160] = {
		desc_get = "",
		name = "Fire Suppressor Ⅲ",
		desc = "Reduce chance of fire breaking out by 30%, DMG taken from fires by 25%, and duration of fires by 6 seconds. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6160,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6170] = {
		desc_get = "",
		name = "Curing",
		desc = "({namecode:98} active when equipped) Increase all healing effects by 20%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6170,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6180] = {
		desc_get = "",
		name = "Aerial Recon",
		desc = "Provides recon from the Ning Hai, decreasing chance of being ambushed by 8% and increases chance to avoid ambushes by 8%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6180,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6190] = {
		desc_get = "",
		name = "Type 91 Piercing Shell",
		desc = "Increase Main Gun's Crit DMG by 15%.",
		type = 0,
		max_level = 0,
		id = 6190,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6200] = {
		desc_get = "",
		name = "Type 1 Piercing Shell",
		desc = "Increase Main Gun's Crit DMG by 25%.",
		type = 0,
		max_level = 0,
		id = 6200,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6210] = {
		desc_get = "",
		name = "Super Heavy Shell",
		desc = "Increase Main Gun's Crit Rate by 8%.",
		type = 0,
		max_level = 0,
		id = 6210,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6220] = {
		desc_get = "",
		name = "Swordfish (818 Squad)",
		desc = "Reduce all hit enemies' Speed by 60% for 8 seconds when deploying an airstrike.",
		type = 0,
		max_level = 0,
		id = 6220,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6230] = {
		desc_get = "",
		name = "Z Flag",
		desc = "Increase own Crit Rate by 5%. Specific ships will receive additional stat bonuses when equipping.",
		type = 0,
		max_level = 0,
		id = 6230,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6240] = {
		desc_get = "",
		name = "Focused Bombing",
		desc = "Increase own aircraft DMG against enemy Light Carriers and Carriers by 5.0% when using an airstrike.",
		type = 0,
		max_level = 0,
		id = 6240,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6250] = {
		desc_get = "",
		name = "Jolly Rogers",
		desc = "Increase entire fleet's Anti-Air by 5% for 8 seconds after deploying an airstrike. ",
		type = 0,
		max_level = 0,
		id = 6250,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6260] = {
		desc_get = "",
		name = "Precision Lock-on ",
		desc = "Reduces cooldown for first wave of main gun volley by 15% ",
		type = 0,
		max_level = 0,
		id = 6260,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6270] = {
		desc_get = "",
		name = "Powered Evasion",
		desc = "Every 20 seconds, 30% chance to evade all attacks for 2 seconds. (May not avoid DMG from collisions, fire, or other status-inflicted DMG)",
		type = 0,
		max_level = 0,
		id = 6270,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6280] = {
		desc_get = "",
		name = "Aircraft Detection",
		desc = "Provides excellent air search capabilities to reduce the chance of being ambushed by 12%. Effect does not stack.",
		type = 0,
		max_level = 0,
		id = 6280,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6290] = {
		desc_get = "",
		name = "远洋巡航I",
		desc = "该角色的狩猎范围等级+1\n(该装备强化+10时，效果提升为狩猎范围等级+2)",
		type = 0,
		max_level = 0,
		id = 6290,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[6291] = {
		desc_get = "",
		name = "远洋巡航II",
		desc = "该角色的狩猎范围等级+2",
		type = 0,
		max_level = 0,
		id = 6291,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[7000] = {
		desc_get = "",
		name = "Rhine Drill",
		desc = "0",
		type = 0,
		max_level = 0,
		id = 7000,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[9010] = {
		desc_get = "",
		name = "Eastern Bonds",
		desc = "0",
		type = 0,
		max_level = 0,
		id = 9010,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[9020] = {
		desc_get = "",
		name = "Sakura Resistance",
		desc = "0",
		type = 0,
		max_level = 0,
		id = 9020,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[9030] = {
		desc_get = "",
		name = "Engineer skill, buli!",
		desc = "",
		type = 0,
		max_level = 0,
		id = 9030,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[9031] = {
		desc_get = "",
		name = "Nothing happens, buli...",
		desc = "",
		type = 0,
		max_level = 0,
		id = 9031,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[9033] = {
		desc_get = "",
		name = "Engineer skill, buli!",
		desc = "",
		type = 0,
		max_level = 0,
		id = 9033,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[9034] = {
		desc_get = "",
		name = "Nothing happens, buli...",
		desc = "",
		type = 0,
		max_level = 0,
		id = 9034,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[10010] = {
		desc_get = "",
		name = "Baptismal Flames",
		desc = "Recover $1 HP when HP falls below 20%. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 10010,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10020] = {
		desc_get = "",
		name = "Aquatic Vortex",
		desc = "Every 10 seconds, $1 chance to increase own Evasion by $2 for 8 seconds.",
		type = 2,
		max_level = 10,
		id = 10020,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			},
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			}
		}
	},
	[10030] = {
		desc_get = "",
		name = "Sister's Temperament",
		desc = "When attacking, increase entire fleet's Fletcher class destroyers' Firepower and Evasion by $1.",
		type = 3,
		max_level = 10,
		id = 10030,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"30%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10040] = {
		desc_get = "",
		name = "31-knot Burke",
		desc = "4% chance to increase Speed and vanguard's Evasion by $1 for 8 seconds when opening fire.",
		type = 3,
		max_level = 10,
		id = 10040,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10050] = {
		desc_get = "15% chance to grant 100% Evasion to vanguard ships for 5 seconds (10 seconds when fully upgraded) after being attacked.",
		name = "Operation Rainbow",
		desc = "15% chance to grant 100% Evasion to vanguard ships for $1 seconds after being attacked.",
		type = 2,
		max_level = 10,
		id = 10050,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5.0",
					"+0.5"
				},
				{
					"5.5",
					"+0.5%"
				},
				{
					"6.0",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7.0",
					"+0.5"
				},
				{
					"7.5",
					"+0.5"
				},
				{
					"8.0",
					"+0.5"
				},
				{
					"8.5",
					"+0.5"
				},
				{
					"9.0",
					"+1"
				},
				{
					"10.0"
				}
			}
		}
	},
	[10060] = {
		desc_get = "",
		name = "Red Phoenix",
		desc = "Recover $1 HP and increase own Firepower by 30% for 15 seconds when HP falls below 20%. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 10060,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10070] = {
		desc_get = "",
		name = "Radar Scan",
		desc = "Every 20 seconds, $1 chance to increase all enemies' DMG taken by $2 for 10 seconds.",
		type = 3,
		max_level = 10,
		id = 10070,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10080] = {
		desc_get = "",
		name = "Martyr",
		desc = "Restore $1 HP to all allied ships when being sunk.",
		type = 2,
		max_level = 10,
		id = 10080,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10090] = {
		desc_get = "",
		name = "I Am No. 1!",
		desc = "15% chance to increase entire fleet's Anti-Air by $1 for 8 seconds when using Anti-Air Gun.",
		type = 3,
		max_level = 10,
		id = 10090,
		system_transform = {},
		desc_get_add = {
			{
				"30%",
				"50%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+2.2%"
				},
				{
					"32.2%",
					"+2.2%"
				},
				{
					"34.4%",
					"+2.2%"
				},
				{
					"36.6%",
					"+2.2%"
				},
				{
					"38.8%",
					"+2.2%"
				},
				{
					"41.0%",
					"+2.2%"
				},
				{
					"43.2%",
					"+2.2%"
				},
				{
					"45.4%",
					"+2.2%"
				},
				{
					"47.6%",
					"+2.4%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[10100] = {
		desc_get = "",
		name = "Ghost of Java Coast",
		desc = "20% chance to increase own Evasion by $1 for 15 seconds when firing Main Gun.",
		type = 2,
		max_level = 10,
		id = 10100,
		system_transform = {},
		desc_get_add = {
			{
				"60%",
				"100%"
			}
		},
		desc_add = {
			{
				{
					"60.0%",
					"+4.4%"
				},
				{
					"64.4%",
					"+4.4%"
				},
				{
					"68.8%",
					"+4.4%"
				},
				{
					"73.2%",
					"+4.4%"
				},
				{
					"77.6%",
					"+4.4%"
				},
				{
					"81.0%",
					"+4.4%"
				},
				{
					"85.4%",
					"+4.4%"
				},
				{
					"89.8%",
					"+4.4%"
				},
				{
					"94.2%",
					"+4.8%"
				},
				{
					"100.0%"
				}
			}
		}
	},
	[10110] = {
		desc_get = "",
		name = "Best Sister",
		desc = "When in battle with Indianapolis, increase Firepower, Anti-Air and Reload by $1.",
		type = 1,
		max_level = 10,
		id = 10110,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10120] = {
		desc_get = "Every 30 seconds, deploy 2 rotating shields which can block up to 8 rounds each. Shields deal small damage to nearby enemies when destroyed. Shields last for 5 seconds (15 seconds when fully upgraded).",
		name = "Pandora's Box",
		desc = "Every 30 seconds, deploy 2 rotating shields which can block up to 8 rounds each. Shields deal small damage to nearby enemies when destroyed. Shields last for $1 seconds.",
		type = 2,
		max_level = 10,
		id = 10120,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[10130] = {
		desc_get = "",
		name = "Avalanche",
		desc = "Every 20 seconds, $1 chance to use EX Barrage. Power based on skill's level.",
		type = 1,
		max_level = 10,
		id = 10130,
		system_transform = {
			10131,
			10131,
			nil,
			10131,
			nil,
			10131,
			nil,
			10131,
			10131
		},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10140] = {
		desc_get = "",
		name = "Eagle's Tears",
		desc = "50% chance to restore $1 HP to vanguard ships when firing Main Gun. 'This time, we'll save everyone!'",
		type = 3,
		max_level = 10,
		id = 10140,
		system_transform = {},
		desc_get_add = {
			{
				"4%",
				"10%"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[10150] = {
		desc_get = "",
		name = "Coercion",
		desc = "Every 30 seconds, reduce enemy's DMG by $1 for 8 seconds.",
		type = 3,
		max_level = 10,
		id = 10150,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10160] = {
		desc_get = "",
		name = "Aegis",
		desc = "Every 30 seconds, take 50% of DMG received by main fleet ships for 8 seconds. Then restore $1 of DMG taken in HP.",
		type = 2,
		max_level = 10,
		id = 10160,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.6%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[10170] = {
		desc_get = "",
		name = "Aviation Vanguard",
		desc = "Increase fleet carriers' EXP by $1 after battle.",
		type = 3,
		max_level = 10,
		id = 10170,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10180] = {
		desc_get = "Launch a wave of covering fire every 20 seconds (10 seconds when fully upgraded). Power is that of Heavy Cruisers and based on skill's level.",
		name = "Artillery Cover",
		desc = "Launch a wave of covering fire every $1 seconds. Power is that of Heavy Cruisers and based on skill's level.",
		type = 1,
		max_level = 10,
		id = 10180,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"20",
					"-1"
				},
				{
					"19",
					"-1"
				},
				{
					"18",
					"-1"
				},
				{
					"17",
					"1"
				},
				{
					"16",
					"-1"
				},
				{
					"15",
					"-1"
				},
				{
					"14",
					"-1"
				},
				{
					"13",
					"-1"
				},
				{
					"12",
					"-2"
				},
				{
					"10"
				}
			}
		}
	},
	[10190] = {
		desc_get = "",
		name = "Vengeance",
		desc = "Recover $1 HP when HP falls below 20%, may only occur once per battle; Upon taking damage,  launch an aerial barrage (damage dealt is based on skill level), 20s cooldown.",
		type = 2,
		max_level = 10,
		id = 10190,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"25.0%"
			},
			{
				"",
				"Power++"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					""
				},
				{
					""
				},
				{
					""
				},
				{
					"(Power+)"
				},
				{
					"(Power+)"
				},
				{
					"(Power+)"
				},
				{
					"(Power++)"
				},
				{
					"(Power++)"
				},
				{
					"(Power++)"
				},
				{
					"(Power++)"
				}
			}
		}
	},
	[10200] = {
		desc_get = "",
		name = "Lucky E",
		desc = "$1 chance for airstrikes to deal 2x DMG and for ship to enter stealth mode and avoid all DMG for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 10200,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[10210] = {
		desc_get = "",
		name = "Doolittle Airstrike",
		desc = "$1 chance to deploy an additional B-25 aerial barrage when deploying an airstrike.",
		type = 1,
		max_level = 10,
		id = 10210,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10220] = {
		desc_get = "",
		name = "Damage Control",
		desc = "Restore $1 HP to an ally when their HP falls below 20%. If target is Enterprise, increase effectiveness by 50%. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 10220,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"20%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10230] = {
		desc_get = "",
		name = "Prototype Ship",
		desc = "Increase fleet destroyers' EXP by $1 after battle.",
		type = 3,
		max_level = 10,
		id = 10230,
		system_transform = {},
		desc_get_add = {
			{
				"6%",
				"18%"
			}
		},
		desc_add = {
			{
				{
					"6.0%",
					"+1.3%"
				},
				{
					"7.3%",
					"+1.3%"
				},
				{
					"8.6%",
					"+1.3%"
				},
				{
					"9.9%",
					"+1.3%"
				},
				{
					"11.2%",
					"+1.3%"
				},
				{
					"12.5%",
					"+1.3%"
				},
				{
					"13.8%",
					"+1.3%"
				},
				{
					"15.2%",
					"+1.4%"
				},
				{
					"16.6%",
					"+1.4%"
				},
				{
					"18.0%"
				}
			}
		}
	},
	[10240] = {
		desc_get = "",
		name = "Meteor Slam",
		desc = "Increase enemy's DMG taken by $1 if their ship collides with a ship in your vanguard. Reduce own DMG taken by $2.",
		type = 1,
		max_level = 10,
		id = 10240,
		system_transform = {},
		desc_get_add = {
			{
				"50%",
				"100%"
			},
			{
				"20%",
				"30%"
			}
		},
		desc_add = {
			{
				{
					"50.0%",
					"+5.5%"
				},
				{
					"55.5%",
					"+5.5%"
				},
				{
					"61%",
					"+5.5%"
				},
				{
					"66.5%",
					"+5.5%"
				},
				{
					"72.0%",
					"+5.5%"
				},
				{
					"77.5%",
					"+5.5%"
				},
				{
					"83.0%",
					"+5.5%"
				},
				{
					"88.5%",
					"+5.5%"
				},
				{
					"94.0%",
					"+6.0%"
				},
				{
					"100.0%"
				}
			},
			{
				{
					"20.0%",
					"+1.1%"
				},
				{
					"21.1%",
					"+1.1%"
				},
				{
					"22.2%",
					"+1.1%"
				},
				{
					"23.3%",
					"+1.1%"
				},
				{
					"24.4%",
					"+1.1%"
				},
				{
					"25.5%",
					"+1.1%"
				},
				{
					"26.6%",
					"+1.1%"
				},
				{
					"27.7%",
					"+1.1%"
				},
				{
					"28.8%",
					"+1.2%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10250] = {
		desc_get = "",
		name = "Javelin Raid",
		desc = "5% chance to increase own Evasion by $1 for 8 seconds when firing.",
		type = 2,
		max_level = 10,
		id = 10250,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10260] = {
		desc_get = "",
		name = "Armageddon Cannon",
		desc = "20% chance to increase own Firepower by $1 for 8 seconds when attacking.",
		type = 1,
		max_level = 10,
		id = 10260,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10270] = {
		desc_get = "",
		name = "Final Glory",
		desc = "Increase DMG of next Main Gun attack by $1 after firing Main Gun.",
		type = 1,
		max_level = 10,
		id = 10270,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"15.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+0.5%"
				},
				{
					"10.5%",
					"+0.5%"
				},
				{
					"11.0%",
					"+0.5%"
				},
				{
					"11.5%",
					"+0.5%"
				},
				{
					"12.0%",
					"+0.5%"
				},
				{
					"12.5%",
					"+0.5%"
				},
				{
					"13.0%",
					"+0.5%"
				},
				{
					"13.5%",
					"+0.5%"
				},
				{
					"14.0%",
					"+1%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10280] = {
		desc_get = "",
		name = "Z's Counterattack",
		desc = "Increase own Reload by $1 for 8 seconds after being attacked. Effect does not stack.",
		type = 3,
		max_level = 10,
		id = 10280,
		system_transform = {},
		desc_get_add = {
			{
				"30%",
				"50%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+2.2%"
				},
				{
					"32.2%",
					"+2.2%"
				},
				{
					"34.4%",
					"+2.2%"
				},
				{
					"36.6%",
					"+2.2%"
				},
				{
					"38.8%",
					"+2.2%"
				},
				{
					"41.0%",
					"+2.2%"
				},
				{
					"43.2%",
					"+2.2%"
				},
				{
					"45.4%",
					"+2.2%"
				},
				{
					"47.6%",
					"+2.4%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[10290] = {
		desc_get = "",
		name = "Royal Navy's Glory",
		desc = "$1 chance to launch an EX barrage when firing Main Gun. Power is based on skill's level. Also increase entire main fleet's Reload by $2 for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 10290,
		system_transform = {
			10291,
			10291,
			nil,
			10291,
			nil,
			10291,
			nil,
			10291,
			10291
		},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10300] = {
		desc_get = "",
		name = "Queen's Command",
		desc = "When entering battle, increase Royal fleet's Firepower, Torpedoes, Aviation, Anti-Air, Reload, and Evasion by $1. 'Long live the Queen!'",
		type = 3,
		max_level = 10,
		id = 10300,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10310] = {
		desc_get = "Every 35 seconds (15 seconds when fully upgraded), attack the farthest enemy with a guaranteed critical attack. Power and ammo based on skill's level.",
		name = "Divine Marksman",
		desc = "Every $1 seconds, attack the farthest enemy with a guaranteed critical $2 attack. Power is based on skill's level.",
		type = 1,
		max_level = 10,
		id = 10310,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"35",
					"-2"
				},
				{
					"33",
					"-2"
				},
				{
					"31",
					"-2"
				},
				{
					"29",
					"-2"
				},
				{
					"27",
					"-2"
				},
				{
					"25",
					"-2"
				},
				{
					"23",
					"-2"
				},
				{
					"21",
					"-3"
				},
				{
					"18",
					"-3"
				},
				{
					"15"
				}
			},
			{
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"AP"
				},
				{
					"AP"
				},
				{
					"AP"
				},
				{
					"AP"
				},
				{
					"AP"
				}
			}
		}
	},
	[10320] = {
		desc_get = "",
		name = "Big Seven",
		desc = "$1 chance to unleash a line of EX barrage when firing Main Gun. Power is based on skill's level.",
		type = 1,
		max_level = 10,
		id = 10320,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10330] = {
		desc_get = "",
		name = "Sword Launch",
		desc = "Airstrike employs the use of Swordfish tactics to launch a $1 attack of torpedoes while decreasing all hit enemies' Speed by $2 for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 10330,
		system_transform = {},
		desc_get_add = {
			{
				"",
				"Power++"
			},
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					""
				},
				{
					""
				},
				{
					""
				},
				{
					"(Power+)"
				},
				{
					"(Power+)"
				},
				{
					"(Power+)"
				},
				{
					"(Power++)"
				},
				{
					"(Power++)"
				},
				{
					"(Power++)"
				},
				{
					"(Power++)"
				}
			},
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10340] = {
		desc_get = "",
		name = "Armored Carrier",
		desc = "After launching an airstrike, deploys a barrier to friendly vanguard ships for 8 seconds, absorbing damage equal to $1 of Illustrious' max HP. ",
		type = 3,
		max_level = 10,
		id = 10340,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%",
					"+0.5%"
				},
				{
					"8.5%",
					"+0.5%"
				},
				{
					"9.0%",
					"+1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[10350] = {
		desc_get = "",
		name = "Infinite Darkness",
		desc = "Every 20 seconds, $1 chance to deploy an EX barrage. Power is based on skill's level.",
		type = 1,
		max_level = 10,
		id = 10350,
		system_transform = {},
		desc_get_add = {
			{
				"30%",
				"60%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			}
		}
	},
	[10360] = {
		desc_get = "",
		name = "Solomon's Nightmare",
		desc = "6% chance to increase Firepower, Torpedo, Reload, and Evasion by $1 for 8 seconds when firing.",
		type = 1,
		max_level = 10,
		id = 10360,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10370] = {
		desc_get = "",
		name = "Sasebo {namecode:17}",
		desc = "5% chance to increase Evasion by $1 for 8 seconds when firing.",
		type = 2,
		max_level = 10,
		id = 10370,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10380] = {
		desc_get = "",
		name = "Z Vanguard",
		desc = "Increase Z type destroyers' Firepower and Evasion by $1 during battle.",
		type = 3,
		max_level = 10,
		id = 10380,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10390] = {
		desc_get = "",
		name = "Unbreakable Shield",
		desc = "Every 20 seconds, $1 chance to deploy a shield which can block up to 10 rounds. Shield lasts for 10 seconds.",
		type = 2,
		max_level = 10,
		id = 10390,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[10400] = {
		desc_get = "",
		name = "Flagship Cover",
		desc = "Reduce flagship's DMG taken by $1 while alive.",
		type = 3,
		max_level = 10,
		id = 10400,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10410] = {
		desc_get = "",
		name = "Solomon's God",
		desc = "5% chance to increase own Firepower, Reload, and Evasion by $1 for 8 seconds when firing.",
		type = 1,
		max_level = 10,
		id = 10410,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10420] = {
		desc_get = "",
		name = "Preemptive Strike",
		desc = "Reduce the cooldown timer for the first wave of own aircraft by $1.",
		type = 1,
		max_level = 10,
		id = 10420,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.6%"
				},
				{
					"50%"
				}
			}
		}
	},
	[10430] = {
		desc_get = "",
		name = "First Carrier Division",
		desc = "Increase own Aviation by $1 when in the same fleet as {namecode:92}.",
		type = 3,
		max_level = 10,
		id = 10430,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10440] = {
		desc_get = "",
		name = "First Carrier Division",
		desc = "Increase own Aviation by $1 when in the same fleet as {namecode:91}.",
		type = 3,
		max_level = 10,
		id = 10440,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10450] = {
		desc_get = "When suffering a fatal strike, feign death and evade all DMG for 5 seconds (15 seconds when fully upgraded). Also deploy an airstrike. May only use once per battle.",
		name = "Final Counter",
		desc = "When suffering a fatal strike, feign death and evade all DMG for $1 seconds. Also deploy an airstrike. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 10450,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[10460] = {
		desc_get = "",
		name = "Second Carrier Division",
		desc = "Increase Aviation by $1 when in the same fleet as {namecode:94}.",
		type = 3,
		max_level = 10,
		id = 10460,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10470] = {
		desc_get = "",
		name = "Second Carrier Division",
		desc = "Increase Aviation by $1 when in the same fleet as {namecode:93}.",
		type = 3,
		max_level = 10,
		id = 10470,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10480] = {
		desc_get = "",
		name = "Sisterly Love",
		desc = "Increase Firepower by $1 when in the same fleet as Ping Hai.",
		type = 3,
		max_level = 10,
		id = 10480,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10490] = {
		desc_get = "",
		name = "Sisterly Love",
		desc = "Increase Firepower by $1 when in the same fleet as Ning Hai.",
		type = 3,
		max_level = 10,
		id = 10490,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10500] = {
		desc_get = "",
		name = "Sakura Resistance",
		desc = "Increase DMG to Sakura ships by $1.",
		type = 1,
		max_level = 10,
		id = 10500,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10510] = {
		desc_get = "",
		name = "Worldbuster Boom",
		desc = "Increase DMG of all vanguard ships by $1.",
		type = 3,
		max_level = 10,
		id = 10510,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10520] = {
		desc_get = "",
		name = "Regular Maintenance",
		desc = "Receive 1 Emergency Repair when entering battle. May not be leveled up.",
		type = 2,
		max_level = 1,
		id = 10520,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[10521] = {
		desc_get = "",
		name = "Regular Maintenance",
		desc = "Receive 2 Emergency Repairs when entering battle. May not be leveled up.",
		type = 2,
		max_level = 1,
		id = 10521,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[10522] = {
		desc_get = "",
		name = "Regular Maintenance",
		desc = "Receive 3 Emergency Repairs when entering battle. May not be leveled up.",
		type = 2,
		max_level = 1,
		id = 10522,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[10530] = {
		desc_get = "",
		name = "Ironblood Vanguard",
		desc = "5% chance to increase own Firepower by $1 for 8 seconds when firing.",
		type = 1,
		max_level = 10,
		id = 10530,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10540] = {
		desc_get = "",
		name = "Royal Alliance",
		desc = "Increase own Firepower, Anti-Air, Reload, and Evasion by $1 for every Eagles ship in fleet during battle.",
		type = 1,
		max_level = 10,
		id = 10540,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"5.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+0.4%"
				},
				{
					"1.4%",
					"+0.4%"
				},
				{
					"1.8%",
					"+0.4%"
				},
				{
					"2.2%",
					"+0.4%"
				},
				{
					"2.6%",
					"+0.4%"
				},
				{
					"3.0%",
					"+0.5%"
				},
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%"
				}
			}
		}
	},
	[10550] = {
		desc_get = "",
		name = "Logistics Repair",
		desc = "Every 35 seconds, restore HP to entire fleet equal to $1 of {namecode:98}'s HP.",
		type = 2,
		max_level = 10,
		id = 10550,
		system_transform = {},
		desc_get_add = {
			{
				"1%",
				"3%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+0.2%"
				},
				{
					"1.2%",
					"+0.2%"
				},
				{
					"1.4%",
					"+0.2%"
				},
				{
					"1.6%",
					"+0.2%"
				},
				{
					"1.8%",
					"+0.2%"
				},
				{
					"2.0%",
					"+0.2%"
				},
				{
					"2.2%",
					"+0.2%"
				},
				{
					"2.4%",
					"+0.3%"
				},
				{
					"2.7%",
					"+0.3%"
				},
				{
					"3.0%"
				}
			}
		}
	},
	[10560] = {
		desc_get = "",
		name = "Journey's End",
		desc = "Increase Crit Rate of torpedoes by $1 and Crit DMG by 50.0%.",
		type = 1,
		max_level = 10,
		id = 10560,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10570] = {
		desc_get = "",
		name = "Arsonist",
		desc = "High Explosive shells increase DMG by $3 and chance of igniting fires by $1. Also increases fire DMG by $2.",
		type = 1,
		max_level = 10,
		id = 10570,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			},
			{
				"20.0%",
				"50.0%"
			},
			{
				"5.0%",
				"15.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.8%"
				},
				{
					"5.3%",
					"+0.8%"
				},
				{
					"6.1%",
					"+0.9%"
				},
				{
					"7.0%",
					"+0.8%"
				},
				{
					"7.8%",
					"+0.8%"
				},
				{
					"8.6%",
					"+0.9%"
				},
				{
					"9.5%",
					"+0.8%"
				},
				{
					"10.3%",
					"+0.8%"
				},
				{
					"11.1%",
					"+0.9%"
				},
				{
					"12.0%"
				}
			},
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.3%"
				},
				{
					"50.0%"
				}
			},
			{
				{
					"5.0%",
					"+0.9%"
				},
				{
					"5.9%",
					"+0.9%"
				},
				{
					"6.8%",
					"+1.2%"
				},
				{
					"8.0%",
					"+0.9%"
				},
				{
					"8.9%",
					"+0.9%"
				},
				{
					"9.8%",
					"+1.2%"
				},
				{
					"11.0%",
					"+1.2%"
				},
				{
					"12.2%",
					"+1.2%"
				},
				{
					"13.4%",
					"+1.6%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10580] = {
		desc_get = "Every 35 seconds (25 seconds when fully upgraded), launch 3 torpedoes and restore own HP by 20.0% of DMG dealt.",
		name = "Vampire's Kiss",
		desc = "Every $1 seconds, launch 3 torpedoes and restore own HP by 20.0% of DMG dealt.",
		type = 2,
		max_level = 10,
		id = 10580,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"35",
					"-1"
				},
				{
					"34",
					"-1"
				},
				{
					"33",
					"-1"
				},
				{
					"32",
					"-1"
				},
				{
					"31",
					"-1"
				},
				{
					"30",
					"-1"
				},
				{
					"29",
					"-1"
				},
				{
					"28",
					"-1"
				},
				{
					"27",
					"-2"
				},
				{
					"25"
				}
			}
		}
	},
	[10590] = {
		desc_get = "",
		name = "Prototype Ship: Patrol",
		desc = "Increase Light Cruisers' and Heavy Cruisers' EXP by $1 after battle.",
		type = 3,
		max_level = 10,
		id = 10590,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10600] = {
		desc_get = "",
		name = "Myriad Nights: Heaven",
		desc = "Increase own Reload by $1. When using torpedoes, $2 chance to launch a second wave.",
		type = 1,
		max_level = 10,
		id = 10600,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			},
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			},
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10610] = {
		desc_get = "",
		name = "Burn Order",
		desc = "High Explosive shells increase DMG by $1. Also increases chance of igniting fires by $2.",
		type = 1,
		max_level = 10,
		id = 10610,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			},
			{
				"1.2%",
				"3.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"1.2%",
					"+0.2%"
				},
				{
					"1.4%",
					"+0.2%"
				},
				{
					"1.6%",
					"+0.2%"
				},
				{
					"1.8%",
					"+0.2%"
				},
				{
					"2.0%",
					"+0.2%"
				},
				{
					"2.2%",
					"+0.2%"
				},
				{
					"2.4%",
					"+0.2%"
				},
				{
					"2.6%",
					"+0.2%"
				},
				{
					"2.8%",
					"+0.2%"
				},
				{
					"3.0%"
				}
			}
		}
	},
	[10620] = {
		desc_get = "",
		name = "Destroyer Division 6: {namecode:13}",
		desc = "When in a fleet with any member of Destroyer Division 6 ({namecode:11}, {namecode:12}, or {namecode:14}), increase Firepower, Torpedo, and Reload by $1. Effect does not stack.",
		type = 1,
		max_level = 10,
		id = 10620,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10630] = {
		desc_get = "",
		name = "Destroyer Division 6: {namecode:14}",
		desc = "When in a fleet with any member of Destroyer Division 6 ({namecode:11}, {namecode:12}, or {namecode:13}), increase Firepower, Torpedo, and Reload by $1. Effect does not stack.",
		type = 1,
		max_level = 10,
		id = 10630,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10640] = {
		desc_get = "",
		name = "Iron Wing Annihilation",
		desc = "Increase Z46’s Firepower by $1 (15%) of her Anti-Air for 8 seconds when any enemy plane is destroyed within her Anti-Air radius. The effect does not stack. ",
		type = 1,
		max_level = 10,
		id = 10640,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10650] = {
		desc_get = "",
		name = "Pocket Battleship",
		desc = "Increase DMG dealt to Destroyers and Light Cruisers by $1.",
		type = 1,
		max_level = 10,
		id = 10650,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10660] = {
		desc_get = "Every 35 seconds (15 seconds when fully upgraded), attack a random enemy with a guaranteed critical attack. Power and ammo based on skill's level.",
		name = "Sniper",
		desc = "Every $1 seconds, attack a random enemy with a guaranteed critical $2 attack. Power is based on skill's level.",
		type = 1,
		max_level = 10,
		id = 10660,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"35",
					"-2"
				},
				{
					"33",
					"-2"
				},
				{
					"31",
					"-2"
				},
				{
					"29",
					"-2"
				},
				{
					"27",
					"-2"
				},
				{
					"25",
					"-2"
				},
				{
					"23",
					"-2"
				},
				{
					"21",
					"-3"
				},
				{
					"18",
					"-3"
				},
				{
					"15"
				}
			},
			{
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"Common"
				},
				{
					"AP"
				},
				{
					"AP"
				},
				{
					"AP"
				},
				{
					"AP"
				},
				{
					"AP"
				}
			}
		}
	},
	[10670] = {
		desc_get = "",
		name = "Lonely Queen of the North",
		desc = "Increase Tirpitz's DMG by $1 when there is no other Battleship or Battlecruiser in the fleet.",
		type = 1,
		max_level = 10,
		id = 10670,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"30%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10680] = {
		desc_get = "",
		name = "Wing of Iron Blood",
		desc = "Reduce DMG taken of all friendly Iron Blood ships by $1.",
		type = 2,
		max_level = 10,
		id = 10680,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10690] = {
		desc_get = "",
		name = "Iron Blood Hawk",
		desc = "Increase gear efficiency by $1 when using Iron Blood tech aircraft (iBF-109T, ME-155A, and JU-87C).",
		type = 1,
		max_level = 10,
		id = 10690,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.0%"
				},
				{
					"16.0%",
					"+1.0%"
				},
				{
					"17.0%",
					"+2.0%"
				},
				{
					"19.0%",
					"+1.0%"
				},
				{
					"20.0%",
					"+1.0%"
				},
				{
					"21.0%",
					"+2.0%"
				},
				{
					"23.0%",
					"+2.0%"
				},
				{
					"25.0%",
					"+2.0%"
				},
				{
					"27.0%",
					"+3.0%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10700] = {
		desc_get = "",
		name = "Battle Buster",
		desc = "Increase own Firepower by $1 thanks to incredible and practiced battle prowess.",
		type = 1,
		max_level = 10,
		id = 10700,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10710] = {
		desc_get = "",
		name = "Giant Hunter",
		desc = "Increase DMG dealt to Heavy Cruisers by $1.",
		type = 1,
		max_level = 10,
		id = 10710,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[10720] = {
		desc_get = "Every 30 seconds, deploy 2 rotating shields which can block up to 10 rounds each. Shields last for 5 seconds (15 seconds when fully upgraded).",
		name = "Guarding Shield",
		desc = "Every 30 seconds, deploy 2 rotating shields which can block up to 10 rounds each. Shields last for $1 seconds.",
		type = 2,
		max_level = 10,
		id = 10720,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[10730] = {
		desc_get = "",
		name = "Supernatural",
		desc = "5% chance to increase own Torpedo by $1 for 12 seconds when firing.",
		type = 1,
		max_level = 10,
		id = 10730,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[10740] = {
		desc_get = "",
		name = "Body of War",
		desc = "4% chance to increase own Evasion by $1 for 8 seconds when firing.",
		type = 2,
		max_level = 10,
		id = 10740,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.6%"
				},
				{
					"50%"
				}
			}
		}
	},
	[10750] = {
		desc_get = "",
		name = "The Nick",
		desc = "5% chance to increase own Evasion by $1 and reduce Aviation DMG taken by $2 for 8 seconds when firing.",
		type = 2,
		max_level = 10,
		id = 10750,
		system_transform = {},
		desc_get_add = {
			{
				"16.0%",
				"40.0%"
			},
			{
				"16.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"16.0%",
					"+2.4%"
				},
				{
					"18.4%",
					"+2.4%"
				},
				{
					"20.8%",
					"+3.2%"
				},
				{
					"24.0%",
					"+2.4%"
				},
				{
					"26.4%",
					"+2.4%"
				},
				{
					"28.8%",
					"+3.2%"
				},
				{
					"32.0%",
					"+2.4%"
				},
				{
					"34.4%",
					"+2.4%"
				},
				{
					"36.8%",
					"+3.2%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"16.0%",
					"+2.4%"
				},
				{
					"18.4%",
					"+2.4%"
				},
				{
					"20.8%",
					"+3.2%"
				},
				{
					"24.0%",
					"+2.4%"
				},
				{
					"26.4%",
					"+2.4%"
				},
				{
					"28.8%",
					"+3.2%"
				},
				{
					"32.0%",
					"+2.4%"
				},
				{
					"34.4%",
					"+2.4%"
				},
				{
					"36.8%",
					"+3.2%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[10760] = {
		desc_get = "",
		name = "Dragon Empery Bond ",
		desc = "When sortied together with Ning Hai, Ping Hai, or both, Yat Sen and the aforementioned ships receive the following buffs: received DMG is decreased by $1 and Evasion Rate is increased by $2. ",
		type = 3,
		max_level = 10,
		id = 10760,
		system_transform = {},
		desc_get_add = {
			{
				"8.0%",
				"20.0%"
			},
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%",
					"+1.6%"
				},
				{
					"21.6%",
					"+1.6%"
				},
				{
					"23.2%",
					"+1.8%"
				},
				{
					"25.0%",
					"+1.6%"
				},
				{
					"26.6%",
					"+1.6%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10770] = {
		desc_get = "",
		name = "Destroyer Division 6: {namecode:11}",
		desc = "When in a fleet with any member of Destroyer Division 6 ({namecode:12}, {namecode:13}, or {namecode:14}), increase Firepower, Torpedo, and Reload by $1. Effect does not stack.",
		type = 1,
		max_level = 10,
		id = 10770,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10780] = {
		desc_get = "Receive a random effect every 20 seconds for 5 seconds. (Effect lasts for 10.0 seconds when fully upgraded)",
		name = "Gambler's Ship",
		desc = "Receive a new random effect for $1 seconds every 20 seconds.",
		type = 2,
		max_level = 10,
		id = 10780,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5.0",
					"+0.5"
				},
				{
					"5.5",
					"+0.5%"
				},
				{
					"6.0",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7.0",
					"+0.5"
				},
				{
					"7.5",
					"+0.5"
				},
				{
					"8.0",
					"+0.5"
				},
				{
					"8.5",
					"+0.5"
				},
				{
					"9.0",
					"+1"
				},
				{
					"10.0"
				}
			}
		}
	},
	[10790] = {
		desc_get = "",
		name = "Fifth Carrier Division",
		desc = "Increase Shokaku's Aviation by $1 and her DMG taken by 5.0% when in the same fleet with {namecode:96}.",
		type = 3,
		max_level = 10,
		id = 10790,
		system_transform = {},
		desc_get_add = {
			{
				"12.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"12.0%",
					"+1.8%"
				},
				{
					"13.8%",
					"+1.8%"
				},
				{
					"15.6%",
					"+2.4%"
				},
				{
					"18.0%",
					"+1.8%"
				},
				{
					"19.8%",
					"+1.8%"
				},
				{
					"21.6%",
					"+2.4%"
				},
				{
					"24.0%",
					"+1.8%"
				},
				{
					"25.8%",
					"+1.8%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10800] = {
		desc_get = "",
		name = "Fifth Carrier Division",
		desc = "Increase Zuikaku's Aviation by $1 and decrease her DMG taken by $2 when in the same fleet with {namecode:95}.",
		type = 3,
		max_level = 10,
		id = 10800,
		system_transform = {},
		desc_get_add = {
			{
				"8.0%",
				"20.0%"
			},
			{
				"8.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10810] = {
		desc_get = "",
		name = "Crane's Protection",
		desc = "Increase entire fleet's DMG by $1 and reduce DMG taken by $2 for 12 seconds after deploying an airstrike.",
		type = 2,
		max_level = 10,
		id = 10810,
		system_transform = {},
		desc_get_add = {
			{
				"4.0%",
				"10.0%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[10820] = {
		desc_get = "",
		name = "Crane's Endeavor",
		desc = "Permanently increase next DMG of next airstrike by $1 when deploying an airstrike. Can stack up to 3 times.",
		type = 1,
		max_level = 10,
		id = 10820,
		system_transform = {},
		desc_get_add = {
			{
				"8.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10830] = {
		desc_get = "Launch an additional barrage attack when deploying an airstrike for the first time. Power based on skill level. May only use once per battle.",
		name = "Aviation Preparations",
		desc = "Launch an additional barrage attack for $1 when deploying an airstrike for the first time. May only use once per battle.",
		type = 1,
		max_level = 10,
		id = 10830,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"Lv.1"
				},
				{
					"Lv.2"
				},
				{
					"Lv.3"
				},
				{
					"Lv.4"
				},
				{
					"Lv.5"
				},
				{
					"Lv.6"
				},
				{
					"Lv.7"
				},
				{
					"Lv.8"
				},
				{
					"Lv.9"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[10840] = {
		desc_get = "",
		name = "Death Raid",
		desc = "Increase own DMG by $1 and DMG taken by $2 when becoming the only surviving ship in the vanguard.",
		type = 1,
		max_level = 10,
		id = 10840,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			},
			{
				"8.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.0%"
				},
				{
					"23.0%",
					"+3.0%"
				},
				{
					"26.0%",
					"+4.0%"
				},
				{
					"30.0%",
					"+3.0%"
				},
				{
					"33.0%",
					"+3.0%"
				},
				{
					"36.0%",
					"+4.0%"
				},
				{
					"40.0%",
					"+3.0%"
				},
				{
					"43.0%",
					"+3.0%"
				},
				{
					"46.0%",
					"+4.0%"
				},
				{
					"50.0%"
				}
			},
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10850] = {
		desc_get = "",
		name = "Dark Side of Fate",
		desc = "Reduce J type Destroyers' DMG taken by $1 and increase own DMG taken by $2 when in the same fleet as another J type destroyer.",
		type = 3,
		max_level = 10,
		id = 10850,
		system_transform = {},
		desc_get_add = {
			{
				"8.0%",
				"20.0%"
			},
			{
				"8.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10860] = {
		desc_get = "Every 20 seconds, 40.0% chance (70.0% fully upgraded) to activate Assault Mode EX, launching a powerful barrage and increasing torpedo stats by 30.0% for 5 seconds. Power based on skill level.",
		name = "Assault Mode EX",
		desc = "Every 20 seconds, $1 chance to activate Assault Mode EX, launching a powerful barrage and increasing torpedo stats by 30.0% for 5 seconds.",
		type = 1,
		max_level = 10,
		id = 10860,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[10870] = {
		desc_get = "",
		name = "Torpedo Command: Sea",
		desc = "Increase Torpedo and Reload of all Destroyers and Light Cruisers by $1 while alive.",
		type = 3,
		max_level = 10,
		id = 10870,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10880] = {
		desc_get = "",
		name = "Lucky Lou",
		desc = "Every 20 seconds, $1 chance to increase own Firepower, Reload, and Evasion by $2 for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 10880,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"10.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[10890] = {
		desc_get = "Reduce own DMG received by 20.0%. In addition, increase Destroyers' and Light Cruisers' Torpedo Crit Rate by 4.0%. When fully upgraded, increase Crit Rate by 10.0% and Crit DMG by 30.0%.",
		name = "The Unyielding {namecode:39}",
		desc = "Reduce own DMG received by 20.0%. In addition, increase Destroyers' and Light Cruisers' Torpedo Crit Rate by $1 $2.",
		type = 3,
		max_level = 10,
		id = 10890,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					""
				},
				{
					""
				},
				{
					""
				},
				{
					""
				},
				{
					"",
					"Increase Crit Damage5.0%"
				},
				{
					"，Increase Crit Damage5.0%",
					"+5.0%"
				},
				{
					"，Increase Crit Damage10.0%",
					"+5.0%"
				},
				{
					"，Increase Crit Damage15.0%",
					"+5.0%"
				},
				{
					"，Increase Crit Damage20.0%",
					"+10.0%"
				},
				{
					"，Increase Crit Damage30.0%"
				}
			}
		}
	},
	[10900] = {
		desc_get = "",
		name = "Rescue Operations",
		desc = "After a ship in your fleet is killed, $1 chance to recover $2 HP and restore $3 HP to ships alive.",
		type = 2,
		max_level = 10,
		id = 10900,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"3.5%",
				"8.0%"
			},
			{
				"1.2%",
				"3.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			},
			{
				{
					"1.2%",
					"+0.2%"
				},
				{
					"1.4%",
					"+0.2%"
				},
				{
					"1.6%",
					"+0.2%"
				},
				{
					"1.8%",
					"+0.2%"
				},
				{
					"2.0%",
					"+0.2%"
				},
				{
					"2.2%",
					"+0.2%"
				},
				{
					"2.4%",
					"+0.2%"
				},
				{
					"2.6%",
					"+0.2%"
				},
				{
					"2.8%",
					"+0.2%"
				},
				{
					"3.0%"
				}
			}
		}
	},
	[10910] = {
		desc_get = "",
		name = "Reborn Sakura Fleet",
		desc = "When taking damage, $1 chance to reduce DMG taken by 50.0%. If deployed as the flagship, increase Firepower and Reload of Sakura faction ships by $2.",
		type = 3,
		max_level = 10,
		id = 10910,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			},
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.7%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+0.7%"
				},
				{
					"7.7%",
					"+0.8%"
				},
				{
					"8.5%",
					"+1.0%"
				},
				{
					"9.5%",
					"+0.7%"
				},
				{
					"10.2%",
					"+0.8%"
				},
				{
					"11.0%",
					"+1.0%"
				},
				{
					"12.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10920] = {
		desc_get = "When firing the Main Gun, 30.0% chance (60.0% when fully upgraded) to increase Battlecruisers' and Battleships' DMG by 5.0% (20.0% when fully upgraded) for 8 seconds.",
		name = "T-Cross Formation",
		desc = "When firing the Main Gun, $1 chance to increase Battlecruisers' and Battleships' DMG by $2 for 8 seconds.",
		type = 3,
		max_level = 10,
		id = 10920,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10930] = {
		desc_get = "",
		name = "Prestige",
		desc = "10 seconds after battle begins, activate a spotlight for 8 seconds. Every 20 seconds following, 20.0% chance to activate spotlight again. Spotlight allows {namecode:71} to redirect $1 DMG to Main Fleet to herself. Also increase DMG dealt to a random enemy ship by $2 for 8 seconds.",
		type = 3,
		max_level = 10,
		id = 10930,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			},
			{
				"8.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.0%"
				},
				{
					"23.0%",
					"+3.0%"
				},
				{
					"26.0%",
					"+4.0%"
				},
				{
					"30.0%",
					"+3.0%"
				},
				{
					"33.0%",
					"+3.0%"
				},
				{
					"36.0%",
					"+4.0%"
				},
				{
					"40.0%",
					"+3.0%"
				},
				{
					"43.0%",
					"+3.0%"
				},
				{
					"46.0%",
					"+4.0%"
				},
				{
					"50.0%"
				}
			},
			{
				{
					"8.0%",
					"+1.2%"
				},
				{
					"9.2%",
					"+1.2%"
				},
				{
					"10.4%",
					"+1.6%"
				},
				{
					"12.0%",
					"+1.2%"
				},
				{
					"13.2%",
					"+1.2%"
				},
				{
					"14.4%",
					"+1.6%"
				},
				{
					"16.0%",
					"+1.2%"
				},
				{
					"17.2%",
					"+1.2%"
				},
				{
					"18.4%",
					"+1.6%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[10940] = {
		desc_get = "Every 20 seconds, 40.0% chance (70.0% when fully upgraded) to activate Demon Dance, launching a powerful barrage and increasing Evasion by 30.0% for 5 seconds. Power based on skill level.",
		name = "Demon Dance",
		desc = "Every 20 seconds, $1 chance to activate Demon Dance, launching a powerful barrage and increasing Evasion by 30.0% for 5 seconds. Power based on skill level.",
		type = 2,
		max_level = 10,
		id = 10940,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[10950] = {
		desc_get = "Increase Speed by 3 (increase by 8 when fully upgraded) and Firepower by 15.0%.",
		name = "Warrior Soul",
		desc = "Increase Speed by $1 and Firepower by $2.",
		type = 1,
		max_level = 10,
		id = 10950,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"3",
					"+0.5"
				},
				{
					"3.5",
					"+0.5"
				},
				{
					"4",
					"+0.5"
				},
				{
					"4.5",
					"+0.5"
				},
				{
					"5",
					"+0.5"
				},
				{
					"5.5",
					"+0.5"
				},
				{
					"6",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7",
					"+1"
				},
				{
					"8"
				}
			},
			{
				{
					"3.0%",
					"+0.8%"
				},
				{
					"3.8%",
					"+0.8%"
				},
				{
					"4.6%",
					"+1.0%"
				},
				{
					"5.6%",
					"+1.2%"
				},
				{
					"6.8%",
					"+1.2%"
				},
				{
					"8.0%",
					"+1.5%"
				},
				{
					"9.5%",
					"+1.5%"
				},
				{
					"11.0%",
					"+2.0%"
				},
				{
					"13.0%",
					"+2.0%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10960] = {
		desc_get = "When entering battle, increase special Destroyers' Firepower and Evasion by 15.0% (30.0% when fully upgraded), and Torpedo by 4% (10% when fully upgraded).",
		name = "Special Lead Ship",
		desc = "When entering battle, increase Ayanami，Akatsuki, Ikazuchi, Inazuma, and Fubuki’s Firepower and Eva by $1, and Torp. By $2.",
		type = 3,
		max_level = 10,
		id = 10960,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.0%"
				},
				{
					"16.0%",
					"+1.0%"
				},
				{
					"17.0%",
					"+2.0%"
				},
				{
					"19.0%",
					"+1.0%"
				},
				{
					"20.0%",
					"+1.0%"
				},
				{
					"21.0%",
					"+2.0%"
				},
				{
					"23.0%",
					"+2.0%"
				},
				{
					"25.0%",
					"+2.0%"
				},
				{
					"27.0%",
					"+3.0%"
				},
				{
					"30.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[10970] = {
		desc_get = "",
		name = "Fighting Mary",
		desc = "When Maryland's Health drops below $1, increase her damage dealt based on how low her HP is, up to $2.",
		type = 1,
		max_level = 10,
		id = 10970,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"70.0%"
			},
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.0%"
				},
				{
					"33.0%",
					"+3.0%"
				},
				{
					"36.0%",
					"+3.0%"
				},
				{
					"39.0%",
					"+4.0%"
				},
				{
					"43.0%",
					"+4.0%"
				},
				{
					"47.0%",
					"+5.0%"
				},
				{
					"52.0%",
					"+5.0%"
				},
				{
					"57.0%",
					"+6.0%"
				},
				{
					"63.0%",
					"+7.0%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"15.0%",
					"+1.5%"
				},
				{
					"16.5%",
					"+1.5%"
				},
				{
					"18.0%",
					"+1.5%"
				},
				{
					"19.5%",
					"+2.0%"
				},
				{
					"21.5%",
					"+2.0%"
				},
				{
					"23.5%",
					"+2.5%"
				},
				{
					"26.0%",
					"+2.5%"
				},
				{
					"28.5%",
					"+3.0%"
				},
				{
					"31.5%",
					"+3.5%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[10980] = {
		desc_get = "",
		name = "Air Cover",
		desc = "Reduce DMG taken from aircraft by your Main Fleet by $1 while alive.",
		type = 3,
		max_level = 10,
		id = 10980,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[10990] = {
		desc_get = "",
		name = "AA Firepower",
		desc = "When entering battle, increase own Firepower by $1 of own Anti-Air (base and stats from gear).",
		type = 1,
		max_level = 10,
		id = 10990,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[11000] = {
		desc_get = "Every 20 seconds, 40.0% chance (70.0% when fully upgraded) to launch a powerful barrage. Power based on skill level.",
		name = "Courageous Shelling",
		desc = "Every 20 seconds, $1 chance to launch a powerful barrage.",
		type = 1,
		max_level = 10,
		id = 11000,
		system_transform = {
			11001,
			11001,
			nil,
			11001,
			nil,
			11001,
			nil,
			11001,
			11001
		},
		desc_get_add = {},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[11010] = {
		desc_get = "",
		name = "Night of the Iron Bottom Sound",
		desc = "When South Dakota's HP falls below 30%, increase own DMG by $1. In addition, absorb 30% of DMG taken by South Dakota (does not absorb DMG received by Aegis skill). South Dakota receives a <color=#FFDE00FF>Protection effect</color> which prevents her from being killed for 5 seconds. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 11010,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11020] = {
		desc_get = "",
		name = "Double Sting ",
		desc = "When there is one Royal Navy ship in the Main Fleet, every time Wasp launches an airstrike, there is a $1 chance of launching an additional round of Spitfires airstrike. ",
		type = 1,
		max_level = 10,
		id = 11020,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+2.2%"
				},
				{
					"32.2%",
					"+2.2%"
				},
				{
					"34.4%",
					"+2.2%"
				},
				{
					"36.6%",
					"+2.2%"
				},
				{
					"38.8%",
					"+2.2%"
				},
				{
					"41.0%",
					"+2.2%"
				},
				{
					"43.2%",
					"+2.2%"
				},
				{
					"45.4%",
					"+2.2%"
				},
				{
					"47.6%",
					"+2.4%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[11030] = {
		desc_get = "",
		name = "Miracle Wind",
		desc = "Increase own Firepower by $1 and DMG taken from Aviation by $2 when becoming the only surviving ship in the vanguard.",
		type = 2,
		max_level = 10,
		id = 11030,
		system_transform = {},
		desc_get_add = {
			{
				"4.0%",
				"10.0%"
			},
			{
				"30.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"30.0%",
					"+2.2%"
				},
				{
					"32.2%",
					"+2.2%"
				},
				{
					"34.4%",
					"+2.2%"
				},
				{
					"36.6%",
					"+2.2%"
				},
				{
					"38.8%",
					"+2.2%"
				},
				{
					"41.0%",
					"+2.2%"
				},
				{
					"43.2%",
					"+2.2%"
				},
				{
					"45.4%",
					"+2.2%"
				},
				{
					"47.6%",
					"+2.4%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[11040] = {
		desc_get = "",
		name = "An Shan Name Ship",
		desc = "Increases An Shan-class ships' Firepower and Accuracy by $1 and Evasion by $2.",
		type = 3,
		max_level = 10,
		id = 11040,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"25.0%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+1.6%"
				},
				{
					"14.0%",
					"+1.5%"
				},
				{
					"15.5%",
					"+1.5%"
				},
				{
					"17.0%",
					"+2.0%"
				},
				{
					"19.0%",
					"+1.8%"
				},
				{
					"20.8%",
					"+1.8%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.4%"
				},
				{
					"4.4%",
					"+0.4%"
				},
				{
					"4.8%",
					"+0.7%"
				},
				{
					"5.5%",
					"+0.6%"
				},
				{
					"6.1%",
					"+0.6%"
				},
				{
					"6.7%",
					"+0.8%"
				},
				{
					"7.5%",
					"+0.7%"
				},
				{
					"8.2%",
					"+0.7%"
				},
				{
					"8.9%",
					"+1.1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11050] = {
		desc_get = "",
		name = "Rezkiy Assault",
		desc = "Increases the Critical Rate of this ship's main gun by $1.",
		type = 1,
		max_level = 10,
		id = 11050,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11060] = {
		desc_get = "",
		name = "Mutual Assistance",
		desc = "Increases the Firepower, Reload, and Accuracy of all Northern Union and Dragon Empery ships in the Vanguard Fleet by $1.",
		type = 3,
		max_level = 10,
		id = 11060,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.7%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+0.7%"
				},
				{
					"7.7%",
					"+0.8%"
				},
				{
					"8.5%",
					"+1.0%"
				},
				{
					"9.5%",
					"+0.7%"
				},
				{
					"10.2%",
					"+0.8%"
				},
				{
					"11.0%",
					"+1.0%"
				},
				{
					"12.0%"
				}
			}
		}
	},
	[11070] = {
		desc_get = "",
		name = "United As One",
		desc = "When sortied in a full fleet of 6 ships, increases this ship's Firepower and Reload by $1 and Evasion by $2.",
		type = 3,
		max_level = 10,
		id = 11070,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"25.0%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+1.6%"
				},
				{
					"14.0%",
					"+1.5%"
				},
				{
					"15.5%",
					"+1.5%"
				},
				{
					"17.0%",
					"+2.0%"
				},
				{
					"19.0%",
					"+1.8%"
				},
				{
					"20.8%",
					"+1.8%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.4%"
				},
				{
					"4.4%",
					"+0.4%"
				},
				{
					"4.8%",
					"+0.7%"
				},
				{
					"5.5%",
					"+0.6%"
				},
				{
					"6.1%",
					"+0.6%"
				},
				{
					"6.7%",
					"+0.8%"
				},
				{
					"7.5%",
					"+0.7%"
				},
				{
					"8.2%",
					"+0.7%"
				},
				{
					"8.9%",
					"+1.1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11080] = {
		desc_get = "",
		name = "Silver Phantom",
		desc = "Increases this ship's DMG against Destroyers, Transport Ships, Torpedo Boats, and Suicide Boats by $1.",
		type = 1,
		max_level = 10,
		id = 11080,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"20%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11090] = {
		desc_get = "",
		name = "The Light of Dawn",
		desc = "Decreases the Evasion Rate of enemy Destroyers and Light Cruisers by $1 while alive.",
		type = 3,
		max_level = 10,
		id = 11090,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"20%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11100] = {
		desc_get = "Every 40 seconds (20 seconds when fully upgraded), launch a volley of shells which reduces the Speed of hit enemies by 40% for 6 seconds.",
		name = "Concerto of Blood",
		desc = "Every $1 seconds, launch a volley of shells which reduces the Speed of hit enemies by 40% for 6 seconds.",
		type = 1,
		max_level = 10,
		id = 11100,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"40",
					"-2"
				},
				{
					"38",
					"-2"
				},
				{
					"36",
					"-2"
				},
				{
					"34",
					"-2"
				},
				{
					"32",
					"-2"
				},
				{
					"30",
					"-2"
				},
				{
					"28",
					"-2"
				},
				{
					"26",
					"-3"
				},
				{
					"23",
					"-3"
				},
				{
					"20"
				}
			}
		}
	},
	[11110] = {
		desc_get = "",
		name = "Trepidation of Destruction",
		desc = "During battle, increase first round of Main Gun DMG by $1. When Main Gun hits an enemy target, increase that target's DMG taken by $2 for 8 seconds.",
		type = 3,
		max_level = 10,
		id = 11110,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			},
			{
				"3.0%",
				"12.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.0%"
				},
				{
					"23.0%",
					"+3.0%"
				},
				{
					"26.0%",
					"+4.0%"
				},
				{
					"30.0%",
					"+3.0%"
				},
				{
					"33.0%",
					"+3.0%"
				},
				{
					"36.0%",
					"+4.0%"
				},
				{
					"40.0%",
					"+3.0%"
				},
				{
					"43.0%",
					"+3.0%"
				},
				{
					"46.0%",
					"+4.0%"
				},
				{
					"50.0%"
				}
			},
			{
				{
					"3.0%",
					"+0.8%"
				},
				{
					"3.8%",
					"+0.8%"
				},
				{
					"4.6%",
					"+0.9%"
				},
				{
					"5.5%",
					"+0.9%"
				},
				{
					"6.4%",
					"+1.0%"
				},
				{
					"7.4%",
					"+1.1%"
				},
				{
					"8.5%",
					"+1.1%"
				},
				{
					"9.6%",
					"+1.2%"
				},
				{
					"10.8%",
					"+1.2%"
				},
				{
					"12.0%"
				}
			}
		}
	},
	[11120] = {
		desc_get = "",
		name = "Victorious Song",
		desc = "Increase DMG dealt to enemy Battleships by $1 and reduce DMG taken from volleys by $1.",
		type = 1,
		max_level = 10,
		id = 11120,
		system_transform = {},
		desc_get_add = {
			{
				"10%",
				"20%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11130] = {
		desc_get = "",
		name = "First Destroyer",
		desc = "When being hit by a torpedo, $1 chance to reduce DMG taken from torpedoes by $2 and increase own Torpedo DMG by $2 for 4 seconds.",
		type = 1,
		max_level = 10,
		id = 11130,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"30.0%"
			},
			{
				"20.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			},
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.6%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[11140] = {
		desc_get = "",
		name = "Shiny Sheff",
		desc = "Friendly ships with less HP than Sheffield at the start of a battle have $1 (30.0%) chance to take $2 (50.0%) reduced DMG when being attacked in that battle. (HP change during a battle cannot trigger the skill)",
		type = 2,
		max_level = 10,
		id = 11140,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"30.0%"
			},
			{
				"20%",
				"50%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.4%"
				},
				{
					"22.4%",
					"+2.4%"
				},
				{
					"24.8%",
					"+3.2%"
				},
				{
					"28.0%",
					"+3.0%"
				},
				{
					"31.0%",
					"+3.0%"
				},
				{
					"34.0%",
					"+4.0%"
				},
				{
					"38.0%",
					"+3.6%"
				},
				{
					"41.6%",
					"+3.6%"
				},
				{
					"45.2%",
					"+4.8%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[11150] = {
		desc_get = "",
		name = "Counterattack of the Barents Sea",
		desc = "Increase Crit Rate of Main Gun by $1 and Crit DMG by 30%.",
		type = 1,
		max_level = 10,
		id = 11150,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.7%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+0.7%"
				},
				{
					"7.7%",
					"+0.8%"
				},
				{
					"8.5%",
					"+1.0%"
				},
				{
					"9.5%",
					"+0.7%"
				},
				{
					"10.2%",
					"+0.8%"
				},
				{
					"11.0%",
					"+1.0%"
				},
				{
					"12.0%"
				}
			}
		}
	},
	[11160] = {
		desc_get = "",
		name = "Crete's Black Cloud",
		desc = "Every 20 seconds, reduce enemy's DMG by $1 and increase own Anti-Air by $2 for 6 seconds.",
		type = 2,
		max_level = 10,
		id = 11160,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11170] = {
		desc_get = "",
		name = "Friends of Justice",
		desc = "Increase own Firepower and Torpedo by $1 when deployed with Sheffield.",
		type = 1,
		max_level = 10,
		id = 11170,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11180] = {
		desc_get = "",
		name = "Calibrated Firing",
		desc = "Every 20 seconds, increase own Torpedo DMG by $1. May stack up to 8 times.",
		type = 1,
		max_level = 10,
		id = 11180,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.7%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+0.7%"
				},
				{
					"7.7%",
					"+0.8%"
				},
				{
					"8.5%",
					"+1.0%"
				},
				{
					"9.5%",
					"+0.7%"
				},
				{
					"10.2%",
					"+0.8%"
				},
				{
					"11.0%",
					"+1.0%"
				},
				{
					"12.0%"
				}
			}
		}
	},
	[11190] = {
		desc_get = "",
		name = "Accompanying Wind ",
		desc = "When in the same fleet as Hamakaze, increases own Firepower, Torpedo, Reload, and Anti-Air by $1 ",
		type = 3,
		max_level = 10,
		id = 11190,
		system_transform = {},
		desc_get_add = {
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11200] = {
		desc_get = "",
		name = "Legend of the Solomons",
		desc = "Every 20 seconds, $1 chance to increase Cruisers' Firepower and Hit by $2, and reduce DMG taken from attacks by $3. Lasts for 8 seconds.",
		type = 3,
		max_level = 10,
		id = 11200,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"10.0%",
				"25.0%"
			},
			{
				"5.0%",
				"15.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+1.6%"
				},
				{
					"14.0%",
					"+1.5%"
				},
				{
					"15.5%",
					"+1.5%"
				},
				{
					"17.0%",
					"+2.0%"
				},
				{
					"19.0%",
					"+1.8%"
				},
				{
					"20.8%",
					"+1.8%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11210] = {
		desc_get = "",
		name = "Vanquish Mode",
		desc = "Every 20 seconds, $1 chance to activate Vanquish Mode, launching a powerful barrage and increasing Reload by 200% for 10 seconds.",
		type = 1,
		max_level = 10,
		id = 11210,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[11220] = {
		desc_get = "",
		name = "Suppression Fire",
		desc = "For every 5 times torpedoes hit enemies, increase own Firepower by $1. May stack up to 3 times.",
		type = 1,
		max_level = 10,
		id = 11220,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			}
		}
	},
	[11230] = {
		desc_get = "",
		name = "Yukikaze of Kure ",
		desc = "Decreases the DMG the Main Fleet receives by $1 while alive. Once per battle, when an allied ship in the Main Fleet has fallen below 20% HP, that ship will have their HP restored by $2. ",
		type = 3,
		max_level = 10,
		id = 11230,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			},
			{
				"4%",
				"10%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11240] = {
		desc_get = "",
		name = "The Unsinkable Lucky Ship ",
		desc = "When this ship takes DMG: $1 chance to reduce that instance of DMG to 1. A distinguished ship boasted of its amazing luck: \"I will never, NEVER sink!\"",
		type = 2,
		max_level = 10,
		id = 11240,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[11250] = {
		desc_get = "",
		name = "Leyte Gulf's Blitz",
		desc = "Increase own Firepower by $3. Every 20 seconds, $1 chance to increase Cruisers' Firepower and Torpedo by $2 for 10 seconds.",
		type = 3,
		max_level = 10,
		id = 11250,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"60.0%"
			},
			{
				"5.0%",
				"20.0%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11260] = {
		desc_get = "When deploying both the first and second airstrike during battle, launch an additional airstrike. Power based on level.",
		name = "Eagle's Defiance",
		desc = "When deploying both the first and second airstrike during battle, launch an additional airstrike ($1).",
		type = 1,
		max_level = 10,
		id = 11260,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"Lv.1"
				},
				{
					"Lv.2"
				},
				{
					"Lv.3"
				},
				{
					"Lv.4"
				},
				{
					"Lv.5"
				},
				{
					"Lv.6"
				},
				{
					"Lv.7"
				},
				{
					"Lv.8"
				},
				{
					"Lv.9"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11270] = {
		desc_get = "",
		name = "Blaze of Glory",
		desc = "Increase DMG to Battleships by $1. When firing Main Gun, $2 chance to launch a barrage of Type 3 Shell ammo. Power and ammo based on skill level.",
		type = 1,
		max_level = 10,
		id = 11270,
		system_transform = {
			11271,
			11271,
			nil,
			11271,
			nil,
			11271,
			nil,
			11271,
			11271
		},
		desc_get_add = {
			{
				"5%",
				"15%"
			},
			{
				"30.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60%"
				}
			}
		}
	},
	[11280] = {
		desc_get = "Petite bodies are more dexterous and less likely to be hit. Increase own Speed by 3 (increase by 8 when fully upgraded) and Evasion by 13% (25% when fully upgraded).",
		name = "The Perfect Chibi Maid",
		desc = "Petite bodies are more dexterous and less likely to be hit. Increase own Speed by $1 and Evasion by $2.",
		type = 2,
		max_level = 10,
		id = 11280,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"3",
					"+0.5"
				},
				{
					"3.5",
					"+0.5"
				},
				{
					"4",
					"+0.5"
				},
				{
					"4.5",
					"+0.5"
				},
				{
					"5",
					"+0.5"
				},
				{
					"5.5",
					"+0.5"
				},
				{
					"6",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7",
					"+1"
				},
				{
					"8"
				}
			},
			{
				{
					"13.0%",
					"+0.8%"
				},
				{
					"13.8%",
					"+0.8%"
				},
				{
					"14.6%",
					"+1.0%"
				},
				{
					"15.6%",
					"+1.2%"
				},
				{
					"16.8%",
					"+1.2%"
				},
				{
					"18.0%",
					"+1.5%"
				},
				{
					"19.5%",
					"+1.5%"
				},
				{
					"21.0%",
					"+2.0%"
				},
				{
					"23.0%",
					"+2.0%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[11290] = {
		desc_get = "",
		name = "Ladies' Tea Time",
		desc = "It's always important to enjoy a cup of tea before heading into battle. Restore $1 of Belfast's Max HP to all ships in fleet at the start of battle.",
		type = 2,
		max_level = 10,
		id = 11290,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"3.5%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+0.2%"
				},
				{
					"1.2%",
					"+0.2%"
				},
				{
					"1.4%",
					"+0.2%"
				},
				{
					"1.6%",
					"+0.2%"
				},
				{
					"1.8%",
					"+0.3%"
				},
				{
					"2.1%",
					"+0.3%"
				},
				{
					"2.4%",
					"+0.3%"
				},
				{
					"2.7%",
					"+0.4%"
				},
				{
					"3.1%",
					"+0.4%"
				},
				{
					"3.5%"
				}
			}
		}
	},
	[11300] = {
		desc_get = "",
		name = "Artillery Volley",
		desc = "15 seconds after battle begins, $1 chance to launch an EX Barrage. Every 20 seconds following, $1 chance to launch another EX Barrage. Power and ammo based on skill level.",
		type = 1,
		max_level = 10,
		id = 11300,
		system_transform = {},
		desc_get_add = {
			{
				"30%",
				"60%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.3%"
				},
				{
					"33.3%",
					"+3.3%"
				},
				{
					"36.6%",
					"+3.3%"
				},
				{
					"39.9%",
					"+3.3%"
				},
				{
					"43.2%",
					"+3.3%"
				},
				{
					"46.5%",
					"+3.3%"
				},
				{
					"49.8%",
					"+3.3%"
				},
				{
					"53.1%",
					"+3.3%"
				},
				{
					"56.4%",
					"+3.6%"
				},
				{
					"60.0%"
				}
			}
		}
	},
	[11310] = {
		desc_get = "",
		name = "Sakura Fleet Flagship - {namecode:74}",
		desc = "When entering battle as fleet flagship, increase Main Gun Firepower by $2, and Reload and Hit by $1 for Sakura faction ships. Also increase Sakura Carriers' DMG by $2.",
		type = 3,
		max_level = 10,
		id = 11310,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.4%"
				},
				{
					"4.4%",
					"+0.4%"
				},
				{
					"4.8%",
					"+0.7%"
				},
				{
					"5.5%",
					"+0.6%"
				},
				{
					"6.1%",
					"+0.6%"
				},
				{
					"6.7%",
					"+0.8%"
				},
				{
					"7.5%",
					"+0.7%"
				},
				{
					"8.2%",
					"+0.7%"
				},
				{
					"8.9%",
					"+1.1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11320] = {
		desc_get = "",
		name = "Destruction Mode",
		desc = "Every 20 seconds, $1 chance to activate Destruction Mode.Deploy 2 rotating shields which can block up to 5 rounds each.Increasing Main Gun's Crit Rate to 100% and  launching a powerful barrage. lasts for 10 seconds.",
		type = 1,
		max_level = 10,
		id = 11320,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[11330] = {
		desc_get = "",
		name = "荣光的一番舰",
		desc = "在队伍中(存活)时，队伍中{namecode:70}级的角色炮击、命中属性提高$1，机动属性提高$2",
		type = 3,
		max_level = 10,
		id = 11330,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15.0%"
			},
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11340] = {
		desc_get = "",
		name = "烈光的武勋舰",
		desc = "主炮开火时，提高自身炮击、防空属性$1，可叠加4次",
		type = 1,
		max_level = 10,
		id = 11340,
		system_transform = {},
		desc_get_add = {
			{
				"1.5%",
				"6.0%"
			}
		},
		desc_add = {
			{
				{
					"1.5%",
					"+0.5%"
				},
				{
					"2.0%",
					"+0.5%"
				},
				{
					"2.5%",
					"+0.5%"
				},
				{
					"3.0%",
					"+0.5%"
				},
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%"
				}
			}
		}
	},
	[11350] = {
		desc_get = "",
		name = "8th Destroyer Division",
		desc = "When entering battle, grant the following buffs to Asashio, Ōshio, Michishio, and Arashio: Increase Firepower and Reload by $1, and Torpedo by $2.",
		type = 3,
		max_level = 10,
		id = 11350,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.4%"
				},
				{
					"4.4%",
					"+0.4%"
				},
				{
					"4.8%",
					"+0.7%"
				},
				{
					"5.5%",
					"+0.6%"
				},
				{
					"6.1%",
					"+0.6%"
				},
				{
					"6.7%",
					"+0.8%"
				},
				{
					"7.5%",
					"+0.7%"
				},
				{
					"8.2%",
					"+0.7%"
				},
				{
					"8.9%",
					"+1.1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11360] = {
		desc_get = "",
		name = "Lunga Point's Strike",
		desc = "When entering battle, increase DMG dealt by Destroyers against Cruisers by $1.",
		type = 3,
		max_level = 10,
		id = 11360,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11370] = {
		desc_get = "8 seconds after entering battle, launch a round of penetrating torpedoes. Power and type based on skill level. Penetrating torpedoes strike and pass through a first target to strike a second target.",
		name = "Fatal Penetration",
		desc = "8 seconds after entering battle, launch a round of penetrating torpedoes $1. Power and type based on skill level. Penetrating torpedoes strike and pass through a first target to strike a second target.",
		type = 1,
		max_level = 10,
		id = 11370,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11380] = {
		desc_get = "",
		name = "Curtain Call",
		desc = "Increase DMG to Heavy Cruisers by $1. When retreating from battle, launch a wave of torpedoes. Power and type based on skill level.",
		type = 1,
		max_level = 10,
		id = 11380,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11390] = {
		desc_get = "",
		name = "Silent Hunter",
		desc = "Increase DMG to Carriers by $2. When torpedoes strike an enemy, $1 chance to flood the target with water which deals DMG every 3 seconds for 24 seconds. Water DMG based is based on torpedo type. Effect does not stack. Time will be reset if skill is triggered again.",
		type = 1,
		max_level = 10,
		id = 11390,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15.0%"
			},
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11400] = {
		desc_get = "",
		name = "Witch's Prank",
		desc = "When launching an airstrike, $1 chance to trigger another airstrike. Second airstrike will ignite and flood hit targets. DMG based on Aviation stats and skill level.",
		type = 1,
		max_level = 10,
		id = 11400,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[11410] = {
		desc_get = "",
		name = "Wolf Pack Formation - U81",
		desc = "Increase own Evasion by $2. When entering battle, if an Ironblood Submarine is in the fleet, increase own Torpedo, Reload, and Hit by $1.",
		type = 1,
		max_level = 10,
		id = 11410,
		system_transform = {},
		desc_get_add = {
			{
				"2.5%",
				"7.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"2.5%",
					"+0.5%"
				},
				{
					"3.0%",
					"+0.5%"
				},
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11420] = {
		desc_get = "",
		name = "BIG SEVEN-樱",
		desc = "主炮开火时，有$1的概率朝自己前方直线发射一轮专属弹幕(依据技能等级)",
		type = 1,
		max_level = 10,
		id = 11420,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11430] = {
		desc_get = "",
		name = "BIG SEVEN-樱",
		desc = "主炮开火时，有$1的概率朝自己前方直线发射一轮专属弹幕(依据技能等级)",
		type = 1,
		max_level = 10,
		id = 11430,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11440] = {
		desc_get = "",
		name = "斯卡帕湾之牛",
		desc = "鱼雷命中敌人后，若在5秒内自身鱼雷再次对该敌人造成伤害，造成的伤害提高$1",
		type = 1,
		max_level = 10,
		id = 11440,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11450] = {
		desc_get = "",
		name = "Overload Firepower ",
		desc = "$1 chance to activate every 20 seconds: Increases Firepower by $2 and Reload by $3 for 10 seconds; after this effect ends, decreases Firepower and Reload by 100% for 3 seconds. ",
		type = 1,
		max_level = 10,
		id = 11450,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			},
			{
				"30.0%",
				"50.0%"
			},
			{
				"100.0%",
				"200.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"30.0%",
					"+2.2%"
				},
				{
					"32.2%",
					"+2.2%"
				},
				{
					"34.4%",
					"+2.2%"
				},
				{
					"36.6%",
					"+2.2%"
				},
				{
					"38.8%",
					"+2.2%"
				},
				{
					"41.0%",
					"+2.2%"
				},
				{
					"43.2%",
					"+2.2%"
				},
				{
					"45.4%",
					"+2.2%"
				},
				{
					"47.6%",
					"+2.4%"
				},
				{
					"50.0%"
				}
			},
			{
				{
					"100.0%",
					"+11.0%"
				},
				{
					"111.0%",
					"+11.0%"
				},
				{
					"122.0%",
					"+11.0%"
				},
				{
					"133.0%",
					"+11.0%"
				},
				{
					"144.0%",
					"+11.0%"
				},
				{
					"155.0%",
					"+11.0%"
				},
				{
					"166.0%",
					"+11.0%"
				},
				{
					"177.0%",
					"+11.0%"
				},
				{
					"188.0%",
					"+12.0%"
				},
				{
					"200.0%"
				}
			}
		}
	},
	[11460] = {
		desc_get = "",
		name = "独狼",
		desc = "进入关卡时，若潜艇编队仅有自身一名角色，自身对战列舰(不包括战巡、航战)造成的伤害提高$1、狩猎范围等级+1、携带弹药量+2",
		type = 3,
		max_level = 10,
		id = 11460,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11461] = {
		desc_get = "",
		name = "独狼",
		desc = "进入关卡时，若潜艇编队仅有自身一名角色，自身对战列舰(不包括战巡、航战)造成的伤害提高$1、狩猎范围等级+1、携带弹药量+2",
		type = 3,
		max_level = 10,
		id = 11461,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11470] = {
		desc_get = "",
		name = "Nasty Asty",
		desc = "When sortied in the same fleet as other New Orleans-class ships, all New Orleans-class ships gain $1 Firepower, $2 Anti-Air, and $2 Accuracy. ",
		type = 3,
		max_level = 10,
		id = 11470,
		system_transform = {},
		desc_get_add = {
			{
				"4.0%",
				"10.0%"
			},
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11480] = {
		desc_get = "",
		name = "Battle of Kula Gulf ",
		desc = "Every 20 seconds, $1 chance to increase Nicholas' Power, Torp, and Reload by $2 for 10 seconds. Can be done once per battle whenever a friendly Vanguard's HP reaches below 20%, as well as reduce that unit's DMG taken by $3. If the target is Helena, it will also restore her HP by 8%. ",
		type = 2,
		max_level = 10,
		id = 11480,
		system_transform = {},
		desc_get_add = {
			{
				"40%",
				"70%"
			},
			{
				"20%",
				"40%"
			},
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11490] = {
		desc_get = "",
		name = "正面火力",
		desc = "主炮开火时，有$1的概率朝自己前方直线发射一轮专属弹幕(依据技能等级)",
		type = 1,
		max_level = 10,
		id = 11490,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.6%"
				},
				{
					"50%"
				}
			}
		}
	},
	[11500] = {
		desc_get = "",
		name = "鸢尾之光",
		desc = "主炮连续命中同一个目标时（同一子弹命中复数目标时，均可作为判定对象），提升自身装填属性$1，最高叠加4层，每秒最多触发一次；装填提升效果生效期间，若命中非判定目标，则生效层数清零",
		type = 1,
		max_level = 10,
		id = 11500,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11510] = {
		desc_get = "",
		name = "攻防转换",
		desc = "作为先锋领舰出击时，主炮效率提高$1，防空炮效率降低30%",
		type = 3,
		max_level = 10,
		id = 11510,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11520] = {
		desc_get = "",
		name = "爱丽丝之心",
		desc = "出击时，队伍中自由鸢尾、维希教廷阵营的驱逐舰角色炮击、雷击、命中属性提高$1",
		type = 3,
		max_level = 10,
		id = 11520,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11530] = {
		desc_get = "",
		name = "海盗之魂",
		desc = "每次进行炮击的第一轮跨射伤害提高$1；手动进行瞄准时，手动发射带来的跨射伤害增幅效果提高到$1",
		type = 1,
		max_level = 10,
		id = 11530,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"60.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+2.2%"
				},
				{
					"42.2%",
					"+2.2%"
				},
				{
					"44.4%",
					"+2.2%"
				},
				{
					"46.6%",
					"+2.2%"
				},
				{
					"48.8%",
					"+2.2%"
				},
				{
					"51.0%",
					"+2.2%"
				},
				{
					"53.2%",
					"+2.2%"
				},
				{
					"55.4%",
					"+2.2%"
				},
				{
					"57.6%",
					"+2.4%"
				},
				{
					"60.0%"
				}
			}
		}
	},
	[11540] = {
		desc_get = "",
		name = "最后的炮火",
		desc = "装备【四联装380mm主炮Mle1935】主炮时，主炮的暴击率提高$2，主炮暴击造成的伤害提高$1",
		type = 1,
		max_level = 10,
		id = 11540,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"50.0%"
			},
			{
				"10.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+3.3%"
				},
				{
					"23.3%",
					"+3.3%"
				},
				{
					"26.6%",
					"+3.3%"
				},
				{
					"29.9%",
					"+3.3%"
				},
				{
					"33.2%",
					"+3.3%"
				},
				{
					"36.5%",
					"+3.3%"
				},
				{
					"39.8%",
					"+3.3%"
				},
				{
					"43.1%",
					"+3.3%"
				},
				{
					"46.4%",
					"+3.6%"
				},
				{
					"50.0%"
				}
			},
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[11550] = {
		desc_get = "",
		name = "Big Mamie",
		desc = "出击时，队友中每有一个白鹰联邦重巡或战列舰角色，自身炮击、防空、机动属性上升$1，效果最多叠加3层",
		type = 1,
		max_level = 10,
		id = 11550,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"5.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+0.4%"
				},
				{
					"1.4%",
					"+0.4%"
				},
				{
					"1.8%",
					"+0.4%"
				},
				{
					"2.2%",
					"+0.4%"
				},
				{
					"2.6%",
					"+0.4%"
				},
				{
					"3.0%",
					"+0.5%"
				},
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%"
				}
			}
		}
	},
	[11560] = {
		desc_get = "",
		name = "2700磅的正义",
		desc = "主炮的弹药种类改为穿甲超重弹，命中目标时，根据飞行距离提高炮弹伤害，最高提高$1",
		type = 1,
		max_level = 10,
		id = 11560,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[11570] = {
		desc_get = "",
		name = "侦查支援",
		desc = "进入战斗时，提高己方所有先锋角色$1命中属性，持续20秒",
		type = 3,
		max_level = 10,
		id = 11570,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.2%"
				},
				{
					"6.2%",
					"+1.2%"
				},
				{
					"7.4%",
					"+1.6%"
				},
				{
					"9.0%",
					"+1.5%"
				},
				{
					"10.5%",
					"+1.5%"
				},
				{
					"12.0%",
					"+2.0%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11580] = {
		desc_get = "空中支援时，额外使用剑鱼编队进行一轮航空鱼雷攻击(威力随技能等级提升)，使被命中的敌方减速40%，持续6秒；自身对战列舰(不包括战巡、航战)伤害提高4%(满级10%)",
		name = "剑鱼出击·改",
		desc = "空中支援时，额外使用剑鱼编队进行一轮航空鱼雷攻击$2，使被命中的敌方减速40%，持续6秒；自身对战列舰(不包括战巡、航战)伤害提高$1",
		type = 1,
		max_level = 10,
		id = 11580,
		system_transform = {},
		desc_get_add = {
			{
				"4%",
				"10%"
			},
			{
				"Lv.1",
				"Lv.10"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"Lv.1"
				},
				{
					"Lv.2"
				},
				{
					"Lv.3"
				},
				{
					"Lv.4"
				},
				{
					"Lv.5"
				},
				{
					"Lv.6"
				},
				{
					"Lv.7"
				},
				{
					"Lv.8"
				},
				{
					"Lv.9"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11590] = {
		desc_get = "",
		name = "空域控制",
		desc = "每次执行空袭后，己方后排航空属性提高$1、炮击属性提高$2，持续8秒",
		type = 3,
		max_level = 10,
		id = 11590,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.4%"
				},
				{
					"4.4%",
					"+0.4%"
				},
				{
					"4.8%",
					"+0.7%"
				},
				{
					"5.5%",
					"+0.6%"
				},
				{
					"6.1%",
					"+0.6%"
				},
				{
					"6.7%",
					"+0.8%"
				},
				{
					"7.5%",
					"+0.7%"
				},
				{
					"8.2%",
					"+0.7%"
				},
				{
					"8.9%",
					"+1.1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11600] = {
		desc_get = "10s after each battle begins, launch an aerial barrage (damage dealt is based on skill level) when the first enemy enters her anti-air range, 10s cooldown. ",
		name = "Melee Artillery",
		desc = "10s after each battle begins,  launch an aerial barrage (damage dealt is based on skill level) when the first enemy enters her anti-air range, 10s cooldown.",
		type = 1,
		max_level = 10,
		id = 11600,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11610] = {
		desc_get = "Reduces cooldown by 5% (25% at max skill level) and will send extra Comet (damage dealt is based on skill level) for the first two waves of own air support in each battle; when paired with another Carrier in the same fleet, then the usage of this skill becomes unlimited. ",
		name = "Air Formation",
		desc = "Reduces cooldown by 5% (25% at max skill level) and will send extra Comet (damage dealt is based on skill level) for the first two waves of own air support in each battle; when paired with another Carrier in the same fleet, then the usage of this skill becomes unlimited.",
		type = 1,
		max_level = 10,
		id = 11610,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"25.0%"
			},
			{
				"Lv.1",
				"Lv.10"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+2.2%"
				},
				{
					"7.2%",
					"+2.2%"
				},
				{
					"9.4%",
					"+2.2%"
				},
				{
					"11.6%",
					"+2.2%"
				},
				{
					"13.8%",
					"+2.2%"
				},
				{
					"16.0%",
					"+2.2%"
				},
				{
					"18.2%",
					"+2.2%"
				},
				{
					"20.4%",
					"+2.2%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"Lv.1"
				},
				{
					"Lv.2"
				},
				{
					"Lv.3"
				},
				{
					"Lv.4"
				},
				{
					"Lv.5"
				},
				{
					"Lv.6"
				},
				{
					"Lv.7"
				},
				{
					"Lv.8"
				},
				{
					"Lv.9"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11620] = {
		desc_get = "",
		name = "命运之骰",
		desc = "自身空袭整备完毕时，有$1概率触发额外的流星、彗星、彩云编队进行攻击，三种编队独立概率可同时触发（彩云编队不携带弹药，触发时提高己方主力舰队成员造成的伤害10%，持续8秒）",
		type = 1,
		max_level = 10,
		id = 11620,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11630] = {
		desc_get = "",
		name = "重樱装母",
		desc = "自身受到的高爆弹伤害降低$1，自身受到的航空伤害降低$1",
		type = 2,
		max_level = 10,
		id = 11630,
		system_transform = {},
		desc_get_add = {
			{
				"5.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.6%"
				},
				{
					"6.6%",
					"+1.6%"
				},
				{
					"8.2%",
					"+1.8%"
				},
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11640] = {
		desc_get = "",
		name = "善战之舰",
		desc = "自身发动空袭时，额外使用TBF复仇者编队进行一轮攻击$2，该编队的鱼雷将对命中的敌方造成进水持续伤害(伤害依据航空属性和技能等级)；自身对战列舰(不包括战巡、航战)伤害提高$1",
		type = 1,
		max_level = 10,
		id = 11640,
		system_transform = {},
		desc_get_add = {
			{
				"4%",
				"10%"
			},
			{
				"Lv.1",
				"Lv.10"
			}
		},
		desc_add = {
			{
				{
					"4.0%",
					"+0.6%"
				},
				{
					"4.6%",
					"+0.6%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"Lv.1"
				},
				{
					"Lv.2"
				},
				{
					"Lv.3"
				},
				{
					"Lv.4"
				},
				{
					"Lv.5"
				},
				{
					"Lv.6"
				},
				{
					"Lv.7"
				},
				{
					"Lv.8"
				},
				{
					"Lv.9"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11650] = {
		desc_get = "",
		name = "航空阵列",
		desc = "出击时，队伍中每有一个白鹰联邦航母或轻航角色，自身航空，防空提升$1；自身舰载机击落敌方飞机时，自身航空提高$2（该效果最高叠加5层）",
		type = 3,
		max_level = 10,
		id = 11650,
		system_transform = {},
		desc_get_add = {
			{
				"1.5%",
				"5.0%"
			},
			{
				"1%",
				"3%"
			}
		},
		desc_add = {
			{
				{
					"1.5%",
					"+0.3%"
				},
				{
					"1.8%",
					"+0.3%"
				},
				{
					"2.1%",
					"+0.4%"
				},
				{
					"2.5%",
					"+0.3%"
				},
				{
					"2.8%",
					"+0.3%"
				},
				{
					"3.1%",
					"+0.4%"
				},
				{
					"3.5%",
					"+0.4%"
				},
				{
					"3.9%",
					"+0.4%"
				},
				{
					"4.3%",
					"+0.7%"
				},
				{
					"5.0%"
				}
			},
			{
				{
					"1.0%",
					"+0.2%"
				},
				{
					"1.2%",
					"+0.2%"
				},
				{
					"1.4%",
					"+0.2%"
				},
				{
					"1.6%",
					"+0.2%"
				},
				{
					"1.8%",
					"+0.2%"
				},
				{
					"2.0%",
					"+0.2%"
				},
				{
					"2.2%",
					"+0.2%"
				},
				{
					"2.4%",
					"+0.3%"
				},
				{
					"2.7%",
					"+0.3%"
				},
				{
					"3.0%"
				}
			}
		}
	},
	[11660] = {
		desc_get = "",
		name = "绝对回避",
		desc = "出击时，若队伍中至少有4名白鹰角色，则全队成员受到航空鱼雷或轰炸攻击时，有$1的概率将此次伤害降低至1",
		type = 2,
		max_level = 10,
		id = 11660,
		system_transform = {},
		desc_get_add = {
			{
				"4.5%",
				"12.0%"
			}
		},
		desc_add = {
			{
				{
					"4.5%",
					"+0.7%"
				},
				{
					"5.2%",
					"+0.8%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+0.7%"
				},
				{
					"7.7%",
					"+0.8%"
				},
				{
					"8.5%",
					"+1.0%"
				},
				{
					"9.5%",
					"+0.7%"
				},
				{
					"10.2%",
					"+0.8%"
				},
				{
					"11.0%",
					"+1.0%"
				},
				{
					"12.0%"
				}
			}
		}
	},
	[11670] = {
		desc_get = "潜艇氧气不足上浮及从战场撤离时，各发射一组的技能鱼雷(威力随技能等级提升)，技能鱼雷有70%概率对命中的敌人造成点燃(点燃伤害依据雷击属性)",
		name = "意外赠礼",
		desc = "潜艇氧气不足上浮及从战场撤离时，各发射一组的技能鱼雷$1(威力随技能等级提升)，技能鱼雷有70%概率对命中的敌人造成点燃(点燃伤害依据雷击属性)",
		type = 1,
		max_level = 10,
		id = 11670,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"Lv.1"
				},
				{
					"Lv.2"
				},
				{
					"Lv.3"
				},
				{
					"Lv.4"
				},
				{
					"Lv.5"
				},
				{
					"Lv.6"
				},
				{
					"Lv.7"
				},
				{
					"Lv.8"
				},
				{
					"Lv.9"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11680] = {
		desc_get = "",
		name = "熟练的猎手",
		desc = "对驱逐舰、轻巡洋舰、航空母舰的伤害提升$1",
		type = 1,
		max_level = 10,
		id = 11680,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11690] = {
		desc_get = "",
		name = "Thrill of the Hunt ",
		desc = "Each time Minneapolis sinks an enemy, increases own Power by $1 and Reload by $2 for 15 seconds. Does not stack nor cannot be triggered more than once per second. Sequential triggers renews the buff duration. ",
		type = 1,
		max_level = 10,
		id = 11690,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			},
			{
				"10.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[11700] = {
		desc_get = "",
		name = "猛进射击",
		desc = "作为先锋领舰出击时，自身防空降低40%，命中降低$1，机动提高$2，炮击提升$3，航速提升3",
		type = 3,
		max_level = 10,
		id = 11700,
		system_transform = {},
		desc_get_add = {
			{
				"20%",
				"5%"
			},
			{
				"6%",
				"12%"
			},
			{
				"13.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"-1.6%"
				},
				{
					"18.4%",
					"-1.6%"
				},
				{
					"16.8%",
					"-1.8%"
				},
				{
					"15.0%",
					"-1.6%"
				},
				{
					"13.4%",
					"-1.6%"
				},
				{
					"11.8%",
					"-1.8%"
				},
				{
					"10.0%",
					"-1.6%"
				},
				{
					"8.4%",
					"-1.6%"
				},
				{
					"6.8%",
					"-1.8%"
				},
				{
					"5.0%"
				}
			},
			{
				{
					"6.0%",
					"+0.6%"
				},
				{
					"6.6%",
					"+0.6%"
				},
				{
					"7.2%",
					"+0.8%"
				},
				{
					"8.0%",
					"+0.6%"
				},
				{
					"8.6%",
					"+0.6%"
				},
				{
					"9.2%",
					"+0.8%"
				},
				{
					"10.0%",
					"+0.6%"
				},
				{
					"10.6%",
					"+0.6%"
				},
				{
					"11.2%",
					"+0.8%"
				},
				{
					"12.0%"
				}
			},
			{
				{
					"13.0%",
					"+1.3%"
				},
				{
					"14.3%",
					"+1.3%"
				},
				{
					"15.6%",
					"+1.4%"
				},
				{
					"17.0%",
					"+1.3%"
				},
				{
					"18.3%",
					"+1.3%"
				},
				{
					"19.6%",
					"+1.4%"
				},
				{
					"21.0%",
					"+1.3%"
				},
				{
					"22.3%",
					"+1.3%"
				},
				{
					"23.6%",
					"+1.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[11710] = {
		desc_get = "",
		name = "Dullahan ",
		desc = "When Minneapolis's HP falls below 30%, reduce DMG taken by $2 and Speed by 2, and recovers $1 HP every 3 seconds. Lasts for 16 seconds. This skill only activates once per battle.",
		type = 2,
		max_level = 10,
		id = 11710,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"4.0%"
			},
			{
				"5.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+0.3%"
				},
				{
					"1.3%",
					"+0.3%"
				},
				{
					"1.6%",
					"+0.4%"
				},
				{
					"2.0%",
					"+0.3%"
				},
				{
					"2.3%",
					"+0.3%"
				},
				{
					"2.6%",
					"+0.4%"
				},
				{
					"3.0%",
					"+0.3%"
				},
				{
					"3.3%",
					"+0.3%"
				},
				{
					"3.6%",
					"+0.4%"
				},
				{
					"4.0%"
				}
			},
			{
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%",
					"+0.5%"
				},
				{
					"8.5%",
					"+0.5%"
				},
				{
					"9.0%",
					"+1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11720] = {
		desc_get = "",
		name = "星之歌",
		desc = "自身防空属性提高$2；每20秒，有$1概率发射强力弹幕",
		type = 1,
		max_level = 10,
		id = 11720,
		system_transform = {},
		desc_get_add = {
			{
				"50%",
				"100%"
			},
			{
				"10.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"50.0%",
					"+5.0%"
				},
				{
					"55.0%",
					"+5.0%"
				},
				{
					"60.0%",
					"+5.0%"
				},
				{
					"65.0%",
					"+5.0%"
				},
				{
					"70.0%",
					"+5.0%"
				},
				{
					"75.0%",
					"+5.0%"
				},
				{
					"80.0%",
					"+5.0%"
				},
				{
					"85.0%",
					"+5.0%"
				},
				{
					"90.0%",
					"+10.0%"
				},
				{
					"100%"
				}
			},
			{
				{
					"10.0%",
					"+1.6%"
				},
				{
					"11.6%",
					"+1.6%"
				},
				{
					"13.2%",
					"+1.8%"
				},
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.8%"
				},
				{
					"20.0%",
					"+1.6%"
				},
				{
					"21.6%",
					"+1.6%"
				},
				{
					"23.2%",
					"+1.8%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[11730] = {
		desc_get = "",
		name = "LittleStar",
		desc = "After 15 seconds into the battle, increases entire fleet's Power, Reload, and EVA by $1. Lasts for 20 seconds. ",
		type = 3,
		max_level = 10,
		id = 11730,
		system_transform = {},
		desc_get_add = {
			{
				"1.5%",
				"6.0%"
			}
		},
		desc_add = {
			{
				{
					"1.5%",
					"+0.5%"
				},
				{
					"2.0%",
					"+0.5%"
				},
				{
					"2.5%",
					"+0.5%"
				},
				{
					"3.0%",
					"+0.5%"
				},
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%"
				}
			}
		}
	},
	[11740] = {
		desc_get = "",
		name = "Wind Rider ",
		desc = "When using torpedoes, $1 chance to avoid all DMG taken for 5 seconds. ",
		type = 2,
		max_level = 10,
		id = 11740,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[11750] = {
		desc_get = "",
		name = "Light Carrier Unit ",
		desc = "$1 chance to activate when this ship launches an Airstrike: increases the Reload of all Light Carriers in the Main Fleet by $2 and decreases the DMG they receive by $2 for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 11750,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			},
			{
				"5.0%",
				"15.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[11760] = {
		desc_get = "",
		name = "Raid Signal ",
		desc = "5 seconds after this ship has finished loading its Airstrike: launches an additional attack with a bomber squadron ($1). This skill can only activate a maximum of two times per battle.",
		type = 1,
		max_level = 10,
		id = 11760,
		system_transform = {},
		desc_get_add = {
			{
				"Lv.1",
				"Lv.10"
			}
		},
		desc_add = {
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[11780] = {
		desc_get = "",
		name = "Ageless Phoenix ",
		desc = "As long as this ship is alive, decreases all enemies' Firepower, Torpedo, and Aviation by $1",
		type = 3,
		max_level = 10,
		id = 11780,
		system_transform = {},
		desc_get_add = {
			{
				"3.0%",
				"9.0%"
			}
		},
		desc_add = {
			{
				{
					"3.0%",
					"+0.6%"
				},
				{
					"3.6%",
					"+0.6%"
				},
				{
					"4.2%",
					"+0.8%"
				},
				{
					"5.0%",
					"+0.6%"
				},
				{
					"5.6%",
					"+0.6%"
				},
				{
					"6.2%",
					"+0.8%"
				},
				{
					"7.0%",
					"+0.6%"
				},
				{
					"7.6%",
					"+0.6%"
				},
				{
					"8.2%",
					"+0.8%"
				},
				{
					"9.0%"
				}
			}
		}
	},
	[11790] = {
		desc_get = "",
		name = "Efficacious Planning ",
		desc = "As long as this ship is alive, reduces burn damage taken by the main fleet by $1, and increases their evasion by $2",
		type = 2,
		max_level = 10,
		id = 11790,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			},
			{
				"4.0%",
				"10.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"4.0%",
					"+0.4%"
				},
				{
					"4.4%",
					"+0.4%"
				},
				{
					"4.8%",
					"+0.7%"
				},
				{
					"5.5%",
					"+0.6%"
				},
				{
					"6.1%",
					"+0.6%"
				},
				{
					"6.7%",
					"+0.8%"
				},
				{
					"7.5%",
					"+0.7%"
				},
				{
					"8.2%",
					"+0.7%"
				},
				{
					"8.9%",
					"+1.1%"
				},
				{
					"10.0%"
				}
			}
		}
	},
	[11800] = {
		desc_get = "",
		name = "Crippling Strike",
		desc = "$1 chance to launch a frontal barrage when firing the main gun (damage scales with skill level). During battle, if fleet contains 4 or more Sakura ships, decreases the loading time of the first main gun salvo by $2",
		type = 1,
		max_level = 10,
		id = 11800,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			},
			{
				"25.0%",
				"45.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"25.0%",
					"+2.2%"
				},
				{
					"27.2%",
					"+2.2%"
				},
				{
					"29.4%",
					"+2.2%"
				},
				{
					"31.6%",
					"+2.2%"
				},
				{
					"33.8%",
					"+2.2%"
				},
				{
					"36.0%",
					"+2.2%"
				},
				{
					"38.2%",
					"+2.2%"
				},
				{
					"40.4%",
					"+2.2%"
				},
				{
					"42.6%",
					"+2.4%"
				},
				{
					"45.0%"
				}
			}
		}
	},
	[11810] = {
		desc_get = "",
		name = "Fight to Win!",
		desc = "$1 chance to launch a frontal barrage when firing the main gun (damage scales with skill level)",
		type = 1,
		max_level = 10,
		id = 11810,
		system_transform = {
			11811,
			11811,
			nil,
			11811,
			nil,
			11811,
			nil,
			11811,
			11811
		},
		desc_get_add = {
			{
				"30.0%",
				"50.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+2.2%"
				},
				{
					"32.2%",
					"+2.2%"
				},
				{
					"34.4%",
					"+2.2%"
				},
				{
					"36.6%",
					"+2.2%"
				},
				{
					"38.8%",
					"+2.2%"
				},
				{
					"41.0%",
					"+2.2%"
				},
				{
					"43.2%",
					"+2.2%"
				},
				{
					"45.4%",
					"+2.2%"
				},
				{
					"47.6%",
					"+2.4%"
				},
				{
					"50.0%"
				}
			}
		}
	},
	[11820] = {
		desc_get = "10 seconds after the beginning of combat and every 40 seconds (20 seconds at Lv.10) afterwards, launches a torpedo barrage (damage scales with skill level)",
		name = "Conquer to Loot!",
		desc = "10 seconds after the beginning of combat and every $1 seconds afterwards, launches a torpedo barrage (damage scales with skill level)",
		type = 1,
		max_level = 10,
		id = 11820,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"40",
					"-2"
				},
				{
					"38",
					"-2"
				},
				{
					"36",
					"-2"
				},
				{
					"34",
					"-2"
				},
				{
					"32",
					"-2"
				},
				{
					"30",
					"-3"
				},
				{
					"27",
					"-2"
				},
				{
					"25",
					"-2"
				},
				{
					"23",
					"-3"
				},
				{
					"20"
				}
			}
		}
	},
	[11850] = {
		desc_get = "",
		name = "Flashing Blade of Surabaya",
		desc = "$1 activation every 20 seconds: launches a special barrage that increases own Firepower by $2 and increases damage dealt to light cruisers and heavy cruisers by $2 for 10 seconds",
		type = 1,
		max_level = 10,
		id = 11850,
		system_transform = {},
		desc_get_add = {
			{
				"30.0%",
				"70.0%"
			},
			{
				"10.0%",
				"20.0%"
			}
		},
		desc_add = {
			{
				{
					"30.0%",
					"+3.0%"
				},
				{
					"33.0%",
					"+3.0%"
				},
				{
					"36.0%",
					"+3.0%"
				},
				{
					"39.0%",
					"+4.0%"
				},
				{
					"43.0%",
					"+4.0%"
				},
				{
					"47.0%",
					"+5.0%"
				},
				{
					"52.0%",
					"+5.0%"
				},
				{
					"57.0%",
					"+6.0%"
				},
				{
					"63.0%",
					"+7.0%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"10.0%",
					"+1.1%"
				},
				{
					"11.1%",
					"+1.1%"
				},
				{
					"12.2%",
					"+1.1%"
				},
				{
					"13.3%",
					"+1.1%"
				},
				{
					"14.4%",
					"+1.1%"
				},
				{
					"15.5%",
					"+1.1%"
				},
				{
					"16.6%",
					"+1.1%"
				},
				{
					"17.7%",
					"+1.1%"
				},
				{
					"18.8%",
					"+1.2%"
				},
				{
					"20.0%"
				}
			}
		}
	},
	[11860] = {
		desc_get = "",
		name = "Mark of Sirius ",
		desc = "Increases the Aviation of allied Carriers and Light Carriers by $1 and also increases their Hit Rate against Destroyers, Light Cruisers, and Heavy Cruisers by $1. In addition, for each Carrier or Light Carrier present in the Main Fleet, this ship will receive one stack of the following buffs: Firepower, Torpedo, and Reload stats increase by $2. ",
		type = 3,
		max_level = 10,
		id = 11860,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"10.0%"
			},
			{
				"1.5%",
				"7.0%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+1.0%"
				},
				{
					"2.0%",
					"+1.0%"
				},
				{
					"3.0%",
					"+1.0%"
				},
				{
					"4.0%",
					"+1.0%"
				},
				{
					"5.0%",
					"+1.0%"
				},
				{
					"6.0%",
					"+1.0%"
				},
				{
					"7.0%",
					"+1.0%"
				},
				{
					"8.0%",
					"+1.0%"
				},
				{
					"9.0%",
					"+1.0%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"1.5%",
					"+0.6%"
				},
				{
					"2.1%",
					"+0.6%"
				},
				{
					"2.7%",
					"+0.6%"
				},
				{
					"3.3%",
					"+0.6%"
				},
				{
					"3.9%",
					"+0.6%"
				},
				{
					"4.5%",
					"+0.6%"
				},
				{
					"5.1%",
					"+0.6%"
				},
				{
					"5.7%",
					"+0.6%"
				},
				{
					"6.3%",
					"+0.7%"
				},
				{
					"7.0%"
				}
			}
		}
	},
	[11890] = {
		desc_get = "Decreases the Burn DMG this ship takes by 5% (15% at max level) and decreases Burn Duration by 3 seconds. Once per battle, if this ship's HP falls below 25%, its Evasion Rate will increase by 10% (30% at max level) for 10 seconds.",
		name = "Miracle Within The Flames",
		desc = "Decreases the Burn DMG this ship takes by $1 and decreases Burn Duration by 3 seconds. Once per battle, if this ship's HP falls below 25%, its Evasion Rate will increase by $2 for 10 seconds.",
		type = 2,
		max_level = 10,
		id = 11890,
		system_transform = {},
		desc_get_add = {
			{
				"5%",
				"15%"
			},
			{
				"10.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"5.0%",
					"+1.1%"
				},
				{
					"6.1%",
					"+1.1%"
				},
				{
					"7.2%",
					"+1.1%"
				},
				{
					"8.3%",
					"+1.1%"
				},
				{
					"9.4%",
					"+1.1%"
				},
				{
					"10.5%",
					"+1.1%"
				},
				{
					"11.6%",
					"+1.1%"
				},
				{
					"12.7%",
					"+1.1%"
				},
				{
					"13.8%",
					"+1.2%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[11900] = {
		desc_get = "",
		name = "Protector of The North Passage",
		desc = "Every time this ship launches an Airstrike, a Scan is commenced and exposes the location of all enemy Submarines for $1 seconds. Additionally, a Swordfish squadron will commence an attack (power based on this skill's level) with Anti-Submarine Torpedoes.",
		type = 1,
		max_level = 10,
		id = 11900,
		system_transform = {},
		desc_get_add = {
			{
				"5",
				"10"
			}
		},
		desc_add = {
			{
				{
					"5",
					"+0.5"
				},
				{
					"5.5",
					"+0.5"
				},
				{
					"6",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7",
					"+0.5"
				},
				{
					"7.5",
					"+0.5"
				},
				{
					"8",
					"+0.5"
				},
				{
					"8.5",
					"+0.5"
				},
				{
					"9",
					"+1"
				},
				{
					"10"
				}
			}
		}
	},
	[19000] = {
		desc_get = "",
		name = "Siren Killer Ⅰ",
		desc = "Increase DMG to Siren faction ships by 5%.",
		type = 1,
		max_level = 1,
		id = 19000,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[19001] = {
		desc_get = "",
		name = "Siren Killer Ⅱ",
		desc = "Increase DMG to Siren faction ships by 10%.",
		type = 1,
		max_level = 1,
		id = 19001,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[19002] = {
		desc_get = "",
		name = "Siren Killer Ⅲ",
		desc = "Increase DMG to Siren faction ships by 15%.",
		type = 1,
		max_level = 1,
		id = 19002,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[19010] = {
		desc_get = "",
		name = "MKV-Class AP Shell",
		desc = "Increase AP DMG by $1.",
		type = 1,
		max_level = 10,
		id = 19010,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[19020] = {
		desc_get = "",
		name = "Goddess of the Sea",
		desc = "Recover $1 HP when HP falls below 20%. Increase Reload by 30% until the end of battle. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 19020,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"25%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.1%"
				},
				{
					"16.1%",
					"+1.1%"
				},
				{
					"17.2%",
					"+1.1%"
				},
				{
					"18.3%",
					"+1.1%"
				},
				{
					"19.4%",
					"+1.1%"
				},
				{
					"20.5%",
					"+1.1%"
				},
				{
					"21.6%",
					"+1.1%"
				},
				{
					"22.7%",
					"+1.1%"
				},
				{
					"23.8%",
					"+1.2%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[19030] = {
		desc_get = "",
		name = "Monarch's Coercion",
		desc = "$1 chance to unleash an EX barrage in front of self when firing Main Gun. Reduce Speed of hit enemies by $2 for 6 seconds. Power and ammo based on skill's level.",
		type = 1,
		max_level = 10,
		id = 19030,
		system_transform = {
			19031,
			19031,
			nil,
			19031,
			nil,
			19031,
			nil,
			19031,
			19031
		},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			},
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70.0%"
				}
			},
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[19040] = {
		desc_get = "",
		name = "Against the Current",
		desc = "Increase Reload by $1 for every 1% HP lost. When HP falls below 20%, regenerate 12% of Max HP over 8 seconds. May only use once per battle.",
		type = 2,
		max_level = 10,
		id = 19040,
		system_transform = {},
		desc_get_add = {
			{
				"0.6",
				"1"
			}
		},
		desc_add = {
			{
				{
					"0.6",
					"+0.04"
				},
				{
					"0.64",
					"+0.04"
				},
				{
					"0.68",
					"+0.05"
				},
				{
					"0.73",
					"+0.04"
				},
				{
					"0.77",
					"+0.04"
				},
				{
					"0.81",
					"+0.05"
				},
				{
					"0.86",
					"+0.04"
				},
				{
					"0.9",
					"+0.04"
				},
				{
					"0.94",
					"+0.06"
				},
				{
					"1"
				}
			}
		}
	},
	[19050] = {
		desc_get = "",
		name = "Body and Soul",
		desc = "Increase Crit Rate of torpedoes by $1 and Crit DMG by 65.0%.",
		type = 1,
		max_level = 10,
		id = 19050,
		system_transform = {},
		desc_get_add = {
			{
				"20.0%",
				"40.0%"
			}
		},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			}
		}
	},
	[19060] = {
		desc_get = "",
		name = "Flash of Lightning",
		desc = "$1 chance when using torpedoes to launch another wave of special torpedoes. Power and ammo based on skill level.",
		type = 1,
		max_level = 10,
		id = 19060,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"30.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.6%"
				},
				{
					"16.6%",
					"+1.6%"
				},
				{
					"18.2%",
					"+1.6%"
				},
				{
					"19.8%",
					"+1.6%"
				},
				{
					"21.4%",
					"+1.6%"
				},
				{
					"23.0%",
					"+1.6%"
				},
				{
					"24.6%",
					"+1.8%"
				},
				{
					"26.4%",
					"+1.8%"
				},
				{
					"28.2%",
					"+1.8%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[19070] = {
		desc_get = "",
		name = "A Legend's Inheritance",
		desc = "$1 chance to unleash an EX barrage in front of self when firing Main Gun. Power and ammo based on skill's level.",
		type = 1,
		max_level = 10,
		id = 19070,
		system_transform = {},
		desc_get_add = {
			{
				"40.0%",
				"70.0%"
			}
		},
		desc_add = {
			{
				{
					"40.0%",
					"+3.3%"
				},
				{
					"43.3%",
					"+3.3%"
				},
				{
					"46.6%",
					"+3.3%"
				},
				{
					"49.9%",
					"+3.3%"
				},
				{
					"53.2%",
					"+3.3%"
				},
				{
					"56.5%",
					"+3.3%"
				},
				{
					"59.8%",
					"+3.3%"
				},
				{
					"63.1%",
					"+3.3%"
				},
				{
					"66.4%",
					"+3.6%"
				},
				{
					"70%"
				}
			}
		}
	},
	[19080] = {
		desc_get = "",
		name = "Specialized Armor",
		desc = "When hit, slightly increase own chance of being ignited (based on ammo caliber) by up to 6% and duration of fire by 3 seconds. In addition, reduce DMG taken from AP ammo by $1.",
		type = 2,
		max_level = 10,
		id = 19080,
		system_transform = {},
		desc_get_add = {
			{
				"15%",
				"30%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+1.5%"
				},
				{
					"16.5%",
					"+1.5%"
				},
				{
					"18.0%",
					"+2.0%"
				},
				{
					"20.0%",
					"+1.5%"
				},
				{
					"21.5%",
					"+1.5%"
				},
				{
					"23.0%",
					"+2.0%"
				},
				{
					"25.0%",
					"+1.5%"
				},
				{
					"26.5%",
					"+1.5%"
				},
				{
					"28.0%",
					"+2.0%"
				},
				{
					"30.0%"
				}
			}
		}
	},
	[19090] = {
		desc_get = "",
		name = "Professional Reloader",
		desc = "Each time the Main Gun fires, increase Reload by $1. May stack up to 12 times. Every 2 times the Main Gun fires, switch the type of ammo used by the Main Gun. First round uses High Explosive ammo. Further rounds alternate between High Explosive and AP ammo.",
		type = 1,
		max_level = 10,
		id = 19090,
		system_transform = {},
		desc_get_add = {
			{
				"1.0%",
				"3.5%"
			}
		},
		desc_add = {
			{
				{
					"1.0%",
					"+0.2%"
				},
				{
					"1.2%",
					"+0.2%"
				},
				{
					"1.4%",
					"+0.2%"
				},
				{
					"1.6%",
					"+0.2%"
				},
				{
					"1.8%",
					"+0.3%"
				},
				{
					"2.1%",
					"+0.3%"
				},
				{
					"2.4%",
					"+0.3%"
				},
				{
					"2.7%",
					"+0.4%"
				},
				{
					"3.1%",
					"+0.4%"
				},
				{
					"3.5%"
				}
			}
		}
	},
	[19100] = {
		desc_get = "Every 30 seconds, deploy 4 rotating shields which can block up to 8 rounds each. Shields last for 5 seconds (15 seconds when fully upgraded).",
		name = "Well-rounded Armor",
		desc = "Every 30 seconds, deploy 4 rotating shields which can block up to 8 rounds each. Shields last for $1 seconds.",
		type = 2,
		max_level = 10,
		id = 19100,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"5",
					"+1"
				},
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+2"
				},
				{
					"15"
				}
			}
		}
	},
	[19110] = {
		desc_get = "",
		name = "Enforced HE Ammo",
		desc = "Increase DMG of High Explosive ammo by $1. Reduce chance of igniting targets with High Explosive ammo by 3%.",
		type = 1,
		max_level = 10,
		id = 19110,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[19120] = {
		desc_get = "Increase Speed by 3 (increase by 8 when fully upgraded). When battle begins, increase Evasion by 15% (35% when fully upgraded) for 40 seconds.",
		name = "Engine Boost",
		desc = "Increase Speed by $1. When battle begins, increase Evasion by $2 for 40 seconds.",
		type = 2,
		max_level = 10,
		id = 19120,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"3",
					"+0.5"
				},
				{
					"3.5",
					"+0.5"
				},
				{
					"4",
					"+0.5"
				},
				{
					"4.5",
					"+0.5"
				},
				{
					"5",
					"+0.5"
				},
				{
					"5.5",
					"+0.5"
				},
				{
					"6",
					"+0.5"
				},
				{
					"6.5",
					"+0.5"
				},
				{
					"7",
					"+1"
				},
				{
					"8"
				}
			},
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[20011] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Farragut Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20012] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault I: Farragut Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20021] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Mahan Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20021,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20022] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Mahan Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20022,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20031] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Gridley Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20031,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20032] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Gridley Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20032,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20041] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Fletcher Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20041,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20042] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Fletcher Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20042,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20051] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Sims Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20051,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20052] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Sims Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20052,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20061] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Benson Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20061,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20062] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Benson Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20062,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20071] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Gearing Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20071,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20072] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Gearing Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20072,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20111] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Omaha Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20112] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Omaha Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20121] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Brooklyn Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20121,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20122] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Brooklyn Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20122,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20131] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Atlanta Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20131,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20132] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Atlanta Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20132,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20141] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Cleveland Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20141,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20142] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Cleveland Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20142,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20211] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Pensacola Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20211,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20212] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Pensacola Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20212,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20221] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Northampton Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20221,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20222] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Northampton Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20222,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20231] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Portland Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20231,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20232] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Portland Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20232,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20241] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: New Orleans Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20241,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20242] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: New Orleans Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20242,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20251] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Wichita once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20251,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20252] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Wichita once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20252,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20261] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Baltimore Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20261,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20262] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Baltimore Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20262,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20271] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Des Moines Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20271,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20272] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Des Moines Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 20272,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20311] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Immediately activate All Out Assault Ⅰ: Gato Class when entering battle.",
		type = 1,
		max_level = 1,
		id = 20311,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[20312] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Immediately activate All Out Assault Ⅱ: Gato Class when entering battle.",
		type = 1,
		max_level = 1,
		id = 20312,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21011] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: A Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21012] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: A Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21021] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: B Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21021,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21022] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: B Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21022,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21031] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: C Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21031,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21032] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: C Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21032,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21041] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: F Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21041,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21042] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: F Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21042,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21051] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: G Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21051,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21052] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: G Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21052,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21061] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: H Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21061,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21062] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: H Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21062,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21071] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: J Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21071,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21072] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: J Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21072,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21081] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: M Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21081,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21082] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: M Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21082,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21111] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Leander Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21112] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Leander Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21121] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Dido Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21121,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21122] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Dido Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21122,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21131] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Arethusa Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21131,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21132] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Arethusa Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21132,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21141] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Edinburgh Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21141,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21142] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Edinburgh Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21142,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21151] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Southampton Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21151,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21152] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Southampton Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21152,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21161] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Fiji Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21161,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21162] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Fiji Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21162,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21171] = {
		desc_get = "",
		name = "All Out Assault: Ceres-Class I",
		desc = "Activate All Out Assault: Ceres-Class I once every 24 times the main guns are fired.",
		type = 1,
		max_level = 1,
		id = 21171,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21172] = {
		desc_get = "",
		name = "All Out Assault: Ceres-Class II",
		desc = "Activate All Out Assault: Ceres-Class II once every 24 times the main guns are fired.",
		type = 1,
		max_level = 1,
		id = 21172,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21211] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: London Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21211,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21212] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: London Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21212,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21221] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Kent Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21221,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21222] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Kent Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21222,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21231] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Norfolk Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21231,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21232] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Norfolk Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21232,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21241] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: York Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21241,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[21242] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: York Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 21242,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22011] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:33} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22012] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:33} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22021] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:2} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22021,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22022] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:2} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22022,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22031] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:15} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22031,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22032] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:15} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22032,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22041] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:30} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22041,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22042] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:30} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22042,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22051] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:19} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22051,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22052] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:19} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22052,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22056] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:35} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22056,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22057] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:35} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22057,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22061] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:26} Class once every 24 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22061,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22062] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅰ: {namecode:26} Class once every 16 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22062,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22071] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:11} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22071,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22072] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:11} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22072,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22081] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:124} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22081,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22082] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:124} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22082,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22091] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:145} Class once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22091,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22092] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:145} Class once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22092,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22111] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:41} Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22112] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:41} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22121] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:43} Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22121,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22122] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:43} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22122,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22131] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:38} Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22131,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22132] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:38} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22132,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22141] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:46} Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22141,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22142] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:46} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22142,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22151] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:49} Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22151,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22152] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:49} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22152,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22161] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:37} once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22161,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22162] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:37} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22162,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22211] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:53} Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22211,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22212] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:53} Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22212,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22221] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:55} Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22221,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22222] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:55} Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22222,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22231] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:63} Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22231,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22232] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:63} Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22232,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22241] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:61} Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22241,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22242] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:61} Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22242,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22251] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:57} Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22251,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22252] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:57} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22252,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22253] = {
		desc_get = "",
		name = "All Out Assault - Variant",
		desc = "Activate All Out Assault Variant: {namecode:57} Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22253,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22261] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: {namecode:66} Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22261,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22262] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: {namecode:66} Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 22262,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22311] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Immediately activate All Out Assault Ⅰ: I Type when entering battle.",
		type = 1,
		max_level = 1,
		id = 22311,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[22312] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Immediately activate All Out Assault Ⅱ: I Type when entering battle.",
		type = 1,
		max_level = 1,
		id = 22312,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23011] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: 1934 Type once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23012] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: 1934 Type once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23031] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: 1936 Type once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23031,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23032] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: 1936 Type once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23032,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23041] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: 1936A Type once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23041,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23042] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: 1936a Type once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23042,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23051] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: 1936B Type once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23051,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23052] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: 1936B Type once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23052,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23111] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Königsberg Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23112] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Königsberg Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23121] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Leipzig Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23121,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23122] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Leipzig Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23122,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23211] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Admiral Hipper Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23211,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23212] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Admiral Hipper Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23212,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23221] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Deutschland Class once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23221,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23222] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Deutschland Class once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 23222,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23311] = {
		desc_get = "",
		name = "全弹发射I",
		desc = "进入战斗时，触发全弹发射-Type VIIC型I",
		type = 1,
		max_level = 1,
		id = 23311,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[23312] = {
		desc_get = "",
		name = "全弹发射II",
		desc = "进入战斗时，触发全弹发射-Type VIIC型II",
		type = 1,
		max_level = 1,
		id = 23312,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[24011] = {
		desc_get = "",
		name = "All Out Assault: An Shan-Class I",
		desc = "Activate All Out Assault: An Shan-Class I once every 15 times the main guns are fired.",
		type = 1,
		max_level = 1,
		id = 24011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[24012] = {
		desc_get = "",
		name = "All Out Assault: An Shan-Class II",
		desc = "Activate All Out Assault: An Shan-Class II once every 10 times the main guns are fired.",
		type = 1,
		max_level = 1,
		id = 24012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[24111] = {
		desc_get = "",
		name = "All Out Assault Ⅰ",
		desc = "Activate All Out Assault Ⅰ: Ning Hai Class once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 24111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[24112] = {
		desc_get = "",
		name = "All Out Assault Ⅱ",
		desc = "Activate All Out Assault Ⅱ: Ning Hai Class once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 24112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[24121] = {
		desc_get = "",
		name = "All Out Assault I",
		desc = "Activate All Out Assault I once every 18 times the main guns are fired.",
		type = 1,
		max_level = 1,
		id = 24121,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[24122] = {
		desc_get = "",
		name = "All Out Assault II",
		desc = "Activate All Out Assault II once every 12 times the main guns are fired.",
		type = 1,
		max_level = 1,
		id = 24122,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[28011] = {
		desc_get = "",
		name = "全弹发射I",
		desc = "主炮每进行15次攻击，触发全弹发射-机敏级I",
		type = 1,
		max_level = 1,
		id = 28011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[28012] = {
		desc_get = "",
		name = "全弹发射II",
		desc = "主炮每进行10次攻击，触发全弹发射-机敏级II",
		type = 1,
		max_level = 1,
		id = 28012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[28021] = {
		desc_get = "",
		name = "全弹发射I",
		desc = "主炮每进行15次攻击，触发全弹发射-大胆级I",
		type = 1,
		max_level = 1,
		id = 28021,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[28022] = {
		desc_get = "",
		name = "全弹发射II",
		desc = "主炮每进行10次攻击，触发全弹发射-大胆级II",
		type = 1,
		max_level = 1,
		id = 28022,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[28111] = {
		desc_get = "",
		name = "全弹发射I",
		desc = "主炮每进行12次攻击，触发全弹发射-埃米尔·贝尔汀I",
		type = 1,
		max_level = 1,
		id = 28111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[28112] = {
		desc_get = "",
		name = "全弹发射II",
		desc = "主炮每进行8次攻击，触发全弹发射-埃米尔·贝尔汀II",
		type = 1,
		max_level = 1,
		id = 28112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29011] = {
		desc_get = "",
		name = "EX Barrage: England Ⅰ",
		desc = "Activate EX Barrage: England Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29011,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29012] = {
		desc_get = "",
		name = "EX Barrage: England Ⅱ",
		desc = "Activate EX Barrage: England Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29012,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29021] = {
		desc_get = "",
		name = "EX Barrage: Eldridge Ⅰ",
		desc = "Activate EX Barrage: Eldridge Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29021,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29022] = {
		desc_get = "",
		name = "EX Barrage: Eldridge Ⅱ",
		desc = "Activate EX Barrage: Eldridge Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29022,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29031] = {
		desc_get = "",
		name = "EX Barrage: William D. Porter Ⅰ",
		desc = "Activate EX Barrage: William D. Porter Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29031,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29032] = {
		desc_get = "",
		name = "EX Barrage: William D. Porter Ⅱ",
		desc = "Activate EX Barrage: William D. Porter Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29032,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29041] = {
		desc_get = "",
		name = "EX Barrage: Johnston Ⅰ",
		desc = "Activate EX Barrage: Johnston Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29041,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29042] = {
		desc_get = "",
		name = "EX Barrage: Johnston Ⅱ",
		desc = "Activate EX Barrage: Johnston Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29042,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29051] = {
		desc_get = "",
		name = "EX Barrage: Laffey Ⅰ",
		desc = "Activate EX Barrage: Laffey Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29051,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29052] = {
		desc_get = "",
		name = "EX Barrage: Laffey Ⅱ",
		desc = "Activate EX Barrage: Laffey Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29052,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29061] = {
		desc_get = "",
		name = "EX Barrage: Glowworm Ⅰ",
		desc = "Activate EX Barrage: Glowworm Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29061,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29062] = {
		desc_get = "",
		name = "EX Barrage: Glowworm Ⅱ",
		desc = "Activate EX Barrage: Glowworm Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29062,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29071] = {
		desc_get = "",
		name = "EX Barrage: Brave Ⅰ",
		desc = "Activate EX Barrage: Brave Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29071,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29072] = {
		desc_get = "",
		name = "EX Barrage: Brave Ⅱ",
		desc = "Activate EX Barrage: Brave Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29072,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29081] = {
		desc_get = "",
		name = "EX Barrage: Javelin Ⅰ",
		desc = "Activate EX Barrage: Javelin Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29081,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29082] = {
		desc_get = "",
		name = "EX Barrage: Javelin Ⅱ",
		desc = "Activate EX Barrage: Javelin Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29082,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29091] = {
		desc_get = "",
		name = "EX Barrage: Vampire Ⅰ",
		desc = "Activate EX Barrage: Vampire Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29091,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29092] = {
		desc_get = "",
		name = "EX Barrage: Vampire Ⅱ",
		desc = "Activate EX Barrage: Vampire Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29092,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29101] = {
		desc_get = "",
		name = "EX Barrage: Belfast Ⅰ",
		desc = "Activate EX Barrage: Belfast Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29101,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29102] = {
		desc_get = "",
		name = "EX Barrage: Belfast Ⅱ",
		desc = "Activate EX Barrage: Belfast Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29102,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29111] = {
		desc_get = "",
		name = "EX Barrage: {namecode:6} Ⅰ",
		desc = "Activate EX Barrage: {namecode:6} Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29111,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29112] = {
		desc_get = "",
		name = "EX Barrage: {namecode:6} Ⅱ",
		desc = "Activate EX Barrage: {namecode:6} Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29112,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29121] = {
		desc_get = "",
		name = "EX Barrage: {namecode:16} Ⅰ",
		desc = "Activate EX Barrage: {namecode:16} Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29121,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29122] = {
		desc_get = "",
		name = "EX Barrage: {namecode:16} Ⅱ",
		desc = "Activate EX Barrage: {namecode:16} Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29122,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29131] = {
		desc_get = "",
		name = "EX Barrage: {namecode:22} Ⅰ",
		desc = "Activate EX Barrage: {namecode:22} Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29131,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29132] = {
		desc_get = "",
		name = "EX Barrage: {namecode:22} Ⅱ",
		desc = "Activate EX Barrage: {namecode:22} Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29132,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29141] = {
		desc_get = "",
		name = "EX Barrage: {namecode:18} Ⅰ",
		desc = "Activate EX Barrage: {namecode:18} Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29141,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29142] = {
		desc_get = "",
		name = "EX Barrage: {namecode:18} Ⅱ",
		desc = "Activate EX Barrage: {namecode:18} Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29142,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29151] = {
		desc_get = "",
		name = "EX Barrage: {namecode:44} Ⅰ",
		desc = "Activate EX Barrage: {namecode:44} Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29151,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29152] = {
		desc_get = "",
		name = "EX Barrage: {namecode:44} Ⅱ",
		desc = "Activate EX Barrage: {namecode:44} Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29152,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29161] = {
		desc_get = "",
		name = "EX Barrage: {namecode:45} Ⅰ",
		desc = "Activate EX Barrage: {namecode:45} Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29161,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29162] = {
		desc_get = "",
		name = "EX Barrage: {namecode:45} Ⅱ",
		desc = "Activate EX Barrage: {namecode:45} Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29162,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29171] = {
		desc_get = "",
		name = "EX Barrage: Z1 Ⅰ",
		desc = "Activate EX Barrage: Z1 Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29171,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29172] = {
		desc_get = "",
		name = "EX Barrage: Z1 Ⅱ",
		desc = "Activate EX Barrage: Z1 Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29172,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29181] = {
		desc_get = "",
		name = "EX Barrage: Anshan Ⅰ",
		desc = "Activate EX Barrage: Anshan Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29181,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29182] = {
		desc_get = "",
		name = "EX Barrage: Anshan Ⅱ",
		desc = "Activate EX Barrage: Anshan Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29182,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29191] = {
		desc_get = "",
		name = "EX Barrage: Avrora Ⅰ",
		desc = "Activate EX Barrage: Avrora Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29191,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29192] = {
		desc_get = "",
		name = "EX Barrage: Avrora Ⅱ",
		desc = "Activate EX Barrage: Avrora Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29192,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29201] = {
		desc_get = "",
		name = "EX Barrage: Z23 Ⅰ",
		desc = "Activate EX Barrage: Z23 Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29201,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29202] = {
		desc_get = "",
		name = "EX Barrage: Z23 Ⅱ",
		desc = "Activate EX Barrage: Z23 Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29202,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29211] = {
		desc_get = "",
		name = "EX Barrage: Z46 Ⅰ",
		desc = "Activate EX Barrage: Z46 Ⅰ once every 15 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29211,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29212] = {
		desc_get = "",
		name = "EX Barrage: Z46 Ⅱ",
		desc = "Activate EX Barrage: Z46 Ⅱ once every 10 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29212,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29221] = {
		desc_get = "",
		name = "EX Barrage: {namecode:152} Ⅰ",
		desc = "Activate EX Barrage: {namecode:152} Ⅰ once every 9 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29221,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29222] = {
		desc_get = "",
		name = "EX Barrage: {namecode:152} Ⅱ",
		desc = "Activate EX Barrage: {namecode:152} Ⅱ once every 6 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29222,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29231] = {
		desc_get = "",
		name = "EX Barrage: Neptune Ⅰ",
		desc = "Activate EX Barrage: Neptune Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29231,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29232] = {
		desc_get = "",
		name = "EX Barrage: Neptune Ⅱ",
		desc = "Activate EX Barrage: Neptune Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29232,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29241] = {
		desc_get = "",
		name = "EX Barrage: Roon Ⅰ",
		desc = "Activate EX Barrage: Roon Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29241,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29242] = {
		desc_get = "",
		name = "EX Barrage: Roon Ⅱ",
		desc = "Activate EX Barrage: Roon Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29242,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29251] = {
		desc_get = "",
		name = "EX Barrage: Saint Louis Ⅰ",
		desc = "Activate EX Barrage: Saint Louis Ⅰ once every 12 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29251,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29252] = {
		desc_get = "",
		name = "EX Barrage: Saint Louis Ⅱ",
		desc = "Activate EX Barrage: Saint Louis Ⅱ once every 8 times the main gun is fired.",
		type = 1,
		max_level = 1,
		id = 29252,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29261] = {
		desc_get = "",
		name = "EX Barrage: I19 Ⅰ",
		desc = "Immediately activate EX Barrage: I19 Ⅰ when entering battle.",
		type = 1,
		max_level = 1,
		id = 29261,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29262] = {
		desc_get = "",
		name = "EX Barrage: I19 Ⅱ",
		desc = "Immediately activate EX Barrage: I19 Ⅱ when entering battle.",
		type = 1,
		max_level = 1,
		id = 29262,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29271] = {
		desc_get = "",
		name = "EX Barrage: U81 Ⅰ",
		desc = "Immediately activate EX Barrage: U81 Ⅰ when entering battle.",
		type = 1,
		max_level = 1,
		id = 29271,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29272] = {
		desc_get = "",
		name = "EX Barrage: U81 Ⅱ",
		desc = "Immediately activate EX Barrage: U81 Ⅱ when entering battle.",
		type = 1,
		max_level = 1,
		id = 29272,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29281] = {
		desc_get = "",
		name = "专属弹幕-{namecode:158}I",
		desc = "主炮每进行15次攻击，触发专属弹幕-{namecode:158}I",
		type = 1,
		max_level = 1,
		id = 29281,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29282] = {
		desc_get = "",
		name = "专属弹幕-{namecode:158}II",
		desc = "主炮每进行10次攻击，触发专属弹幕-{namecode:158}II",
		type = 1,
		max_level = 1,
		id = 29282,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29291] = {
		desc_get = "",
		name = "专属弹幕-22I",
		desc = "主炮每进行15次攻击，触发专属弹幕-22I",
		type = 1,
		max_level = 1,
		id = 29291,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29292] = {
		desc_get = "",
		name = "专属弹幕-22II",
		desc = "主炮每进行10次攻击，触发专属弹幕-22II",
		type = 1,
		max_level = 1,
		id = 29292,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29301] = {
		desc_get = "",
		name = "专属弹幕-33I",
		desc = "主炮每进行15次攻击，触发专属弹幕-33I",
		type = 1,
		max_level = 1,
		id = 29301,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29302] = {
		desc_get = "",
		name = "专属弹幕-33II",
		desc = "主炮每进行10次攻击，触发专属弹幕-33II",
		type = 1,
		max_level = 1,
		id = 29302,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29311] = {
		desc_get = "",
		name = "专属弹幕-U47I",
		desc = "进入战斗时，触发专属弹幕-U47I",
		type = 1,
		max_level = 1,
		id = 29311,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29312] = {
		desc_get = "",
		name = "专属弹幕-U47II",
		desc = "进入战斗时，触发专属弹幕-U47II",
		type = 1,
		max_level = 1,
		id = 29312,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29321] = {
		desc_get = "",
		name = "专属弹幕-絮库夫I",
		desc = "氧气不足浮上水面时，触发专属弹幕-絮库夫I",
		type = 1,
		max_level = 1,
		id = 29321,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29322] = {
		desc_get = "",
		name = "专属弹幕-絮库夫II",
		desc = "氧气不足浮上水面时，触发专属弹幕-絮库夫II",
		type = 1,
		max_level = 1,
		id = 29322,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29331] = {
		desc_get = "",
		name = "专属弹幕-凯旋I",
		desc = "主炮每进行15次攻击，触发专属弹幕-凯旋I",
		type = 1,
		max_level = 1,
		id = 29331,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29332] = {
		desc_get = "",
		name = "专属弹幕-凯旋II",
		desc = "主炮每进行10次攻击，触发专属弹幕-凯旋II",
		type = 1,
		max_level = 1,
		id = 29332,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29341] = {
		desc_get = "",
		name = "专属弹幕-大青花鱼I",
		desc = "进入战斗时，触发专属弹幕-大青花鱼I",
		type = 1,
		max_level = 1,
		id = 29341,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29342] = {
		desc_get = "",
		name = "专属弹幕-大青花鱼II",
		desc = "进入战斗时，触发专属弹幕-大青花鱼II",
		type = 1,
		max_level = 1,
		id = 29342,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29351] = {
		desc_get = "",
		name = "专属弹幕-圣地亚哥I",
		desc = "主炮每进行16次攻击，触发专属弹幕-圣地亚哥I",
		type = 1,
		max_level = 1,
		id = 29351,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29361] = {
		desc_get = "",
		name = "All Out Assault: Sirius I ",
		desc = "Activate All Out Assault: Sirius I once every 15 times the main guns are fired. ",
		type = 1,
		max_level = 1,
		id = 29361,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[29362] = {
		desc_get = "",
		name = "All Out Assault: Sirius II ",
		desc = "Activate All Out Assault: Sirius II once every 10 times the main guns are fired. ",
		type = 1,
		max_level = 1,
		id = 29362,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[101010] = {
		desc_get = "",
		name = "Protagonist Aura",
		desc = "If deployed with any other Neptunia ship, increases own damage by $1 and decreases own damage taken by 6.0%. For every other Neptunia ship deployed, further increases own damage by $2,and decreases own damage taken by 1.0%",
		type = 3,
		max_level = 10,
		id = 101010,
		system_transform = {},
		desc_get_add = {
			{
				"3.0%",
				"10.0%"
			},
			{
				"1.0%",
				"2.0%"
			}
		},
		desc_add = {
			{
				{
					"3.0%",
					"+0.6%"
				},
				{
					"3.6%",
					"+0.6%"
				},
				{
					"4.2%",
					"+0.8%"
				},
				{
					"5.0%",
					"+0.6%"
				},
				{
					"5.6%",
					"+0.6%"
				},
				{
					"6.2%",
					"+0.8%"
				},
				{
					"7.0%",
					"+0.9%"
				},
				{
					"7.9%",
					"+0.9%"
				},
				{
					"8.8%",
					"+1.2%"
				},
				{
					"10.0%"
				}
			},
			{
				{
					"1.0%",
					"+0.09%"
				},
				{
					"1.09%",
					"+0.09%"
				},
				{
					"1.18%",
					"+0.12%"
				},
				{
					"1.3%",
					"+0.09%"
				},
				{
					"1.39%",
					"+0.09%"
				},
				{
					"1.48%",
					"+0.12%"
				},
				{
					"1.6%",
					"+0.12%"
				},
				{
					"1.72%",
					"+0.12%"
				},
				{
					"1.84%",
					"+0.16%"
				},
				{
					"2.0%"
				}
			}
		}
	},
	[101020] = {
		desc_get = "",
		name = "Medistation S",
		desc = "Upon taking damage, $1 chance to increase own damage dealt by $2 for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 101020,
		system_transform = {},
		desc_get_add = {
			{
				"3.5%",
				"8.0%"
			},
			{
				"10.0%",
				"25.0%"
			}
		},
		desc_add = {
			{
				{
					"3.5%",
					"+0.5%"
				},
				{
					"4.0%",
					"+0.5%"
				},
				{
					"4.5%",
					"+0.5%"
				},
				{
					"5.0%",
					"+0.5%"
				},
				{
					"5.5%",
					"+0.5%"
				},
				{
					"6.0%",
					"+0.5%"
				},
				{
					"6.5%",
					"+0.5%"
				},
				{
					"7.0%",
					"+0.5%"
				},
				{
					"7.5%",
					"+0.5%"
				},
				{
					"8.0%"
				}
			},
			{
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+2.1%"
				},
				{
					"14.5%",
					"+1.2%"
				},
				{
					"15.7%",
					"+1.2%"
				},
				{
					"16.9%",
					"+2.1%"
				},
				{
					"19.0%",
					"+1.8%"
				},
				{
					"20.8%",
					"+1.8%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			}
		}
	},
	[101030] = {
		desc_get = "",
		name = "Power Break",
		desc = "If in the same fleet as Vert or Green Heart, increases own damage dealt by $1 and damage taken by $2. Otherwise, decreases own damage taken by $3 and damage dealt by $4.",
		type = 3,
		max_level = 10,
		id = 101030,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"25.0%"
			},
			{
				"10.0%",
				"15.0%"
			},
			{
				"10.0%",
				"25.0%"
			},
			{
				"10.0%",
				"15.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+2.1%"
				},
				{
					"14.5%",
					"+1.2%"
				},
				{
					"15.7%",
					"+1.2%"
				},
				{
					"16.9%",
					"+2.1%"
				},
				{
					"19.0%",
					"+1.8%"
				},
				{
					"20.8%",
					"+1.8%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"10.0%",
					"+0.4%"
				},
				{
					"10.4%",
					"+0.4%"
				},
				{
					"10.8%",
					"+0.7%"
				},
				{
					"11.5%",
					"+0.4%"
				},
				{
					"11.9%",
					"+0.4%"
				},
				{
					"12.3%",
					"+0.7%"
				},
				{
					"13.0%",
					"+0.6%"
				},
				{
					"13.6%",
					"+0.6%"
				},
				{
					"14.2%",
					"+0.8%"
				},
				{
					"15.0%"
				}
			},
			{
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+2.1%"
				},
				{
					"14.5%",
					"+1.2%"
				},
				{
					"15.7%",
					"+1.2%"
				},
				{
					"16.9%",
					"+2.1%"
				},
				{
					"19.0%",
					"+1.8%"
				},
				{
					"20.8%",
					"+1.8%"
				},
				{
					"22.6%",
					"+2.4%"
				},
				{
					"25.0%"
				}
			},
			{
				{
					"10.0%",
					"+0.4%"
				},
				{
					"10.4%",
					"+0.4%"
				},
				{
					"10.8%",
					"+0.7%"
				},
				{
					"11.5%",
					"+0.4%"
				},
				{
					"11.9%",
					"+0.4%"
				},
				{
					"12.3%",
					"+0.7%"
				},
				{
					"13.0%",
					"+0.6%"
				},
				{
					"13.6%",
					"+0.6%"
				},
				{
					"14.2%",
					"+0.8%"
				},
				{
					"15.0%"
				}
			}
		}
	},
	[101040] = {
		desc_get = "",
		name = "Assam Link",
		desc = "For each Destroyer in the fleet, increases own reload by $2 and reduces damage taken from shelling by $1.",
		type = 2,
		max_level = 10,
		id = 101040,
		system_transform = {},
		desc_get_add = {
			{
				"1.5%",
				"5.0%"
			},
			{
				"1.5%",
				"5.0%"
			}
		},
		desc_add = {
			{
				{
					"1.5%",
					"+0.3%"
				},
				{
					"1.8%",
					"+0.3%"
				},
				{
					"2.1%",
					"+0.4%"
				},
				{
					"2.5%",
					"+0.3%"
				},
				{
					"2.8%",
					"+0.3%"
				},
				{
					"3.1%",
					"+0.4%"
				},
				{
					"3.5%",
					"+0.4%"
				},
				{
					"3.9%",
					"+0.4%"
				},
				{
					"4.3%",
					"+0.7%"
				},
				{
					"5.0%"
				}
			},
			{
				{
					"1.5%",
					"+0.3%"
				},
				{
					"1.8%",
					"+0.3%"
				},
				{
					"2.1%",
					"+0.4%"
				},
				{
					"2.5%",
					"+0.3%"
				},
				{
					"2.8%",
					"+0.3%"
				},
				{
					"3.1%",
					"+0.4%"
				},
				{
					"3.5%",
					"+0.4%"
				},
				{
					"3.9%",
					"+0.4%"
				},
				{
					"4.3%",
					"+0.7%"
				},
				{
					"5.0%"
				}
			}
		}
	},
	[101050] = {
		desc_get = "",
		name = "Cross Combination",
		desc = "Every $1 times the main gun is fired, the next main gun salvo will critically strike.",
		type = 1,
		max_level = 10,
		id = 101050,
		system_transform = {},
		desc_get_add = {
			{
				"15",
				"6"
			}
		},
		desc_add = {
			{
				{
					"15",
					"-1"
				},
				{
					"14",
					"-1"
				},
				{
					"13",
					"-1"
				},
				{
					"12",
					"-1"
				},
				{
					"11",
					"-1"
				},
				{
					"10",
					"-1"
				},
				{
					"9",
					"-1"
				},
				{
					"8",
					"-1"
				},
				{
					"7",
					"-1"
				},
				{
					"6"
				}
			}
		}
	},
	[101060] = {
		desc_get = "Unleash an extremely powerful barrage 115 seconds after the start of battle. Power based on skill level. May only use once per battle.",
		name = "Victory Slash",
		desc = "After 115 seconds in combat, unleashes a devastating barrage ($1). Can only activate once per combat.",
		type = 1,
		max_level = 10,
		id = 101060,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[101070] = {
		desc_get = "Every 20 seconds, 20.0% chance (40.0% when fully upgraded) to launch a powerful barrage which may ignite hit enemy ships for 12 seconds. Power based on skill level.",
		name = "Blaze Break",
		desc = "$1 chance to activate every 20 seconds, fires a strong barrage ($2) that has a chance to set enemies on fire for 12 seconds.",
		type = 1,
		max_level = 10,
		id = 101070,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[101080] = {
		desc_get = "",
		name = "Tricolor Order",
		desc = "Main gun shots will ignore enemies' armor type. Further increases main gun damage based upon skill level.",
		type = 3,
		max_level = 10,
		id = 101080,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[101090] = {
		desc_get = "Every 20 seconds, 20.0% chance (40.0% when fully upgraded) to launch a powerful barrage. Power based on skill level.",
		name = "Lacy Dance",
		desc = "$1 chance to activate every 20 seconds, fires a strong barrage ($2).",
		type = 1,
		max_level = 10,
		id = 101090,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[101100] = {
		desc_get = "",
		name = "Tänzerin Trombe",
		desc = "Each main gun hit increases own torpedo critical chance by $1, stacking up to 20 times. All stacks are consumed after firing torpedoes.",
		type = 1,
		max_level = 10,
		id = 101100,
		system_transform = {},
		desc_get_add = {
			{
				"0.6%",
				"1.5%"
			}
		},
		desc_add = {
			{
				{
					"0.6%",
					"+0.1%"
				},
				{
					"0.7%",
					"+0.1%"
				},
				{
					"0.8%",
					"+0.1%"
				},
				{
					"0.9%",
					"+0.1%"
				},
				{
					"1.0%",
					"+0.1%"
				},
				{
					"1.1%",
					"+0.1%"
				},
				{
					"1.2%",
					"+0.1%"
				},
				{
					"1.3%",
					"+0.1%"
				},
				{
					"1.4%",
					"+0.1%"
				},
				{
					"1.5%"
				}
			}
		}
	},
	[101110] = {
		desc_get = "Every 20 seconds, 20.0% chance (40.0% when fully upgraded) to launch a powerful barrage. Reduce Speed of each enemy hit for 8 seconds.",
		name = "Getter Ravine",
		desc = "$1 chance to activate every 20 seconds, fires a strong barrage ($2) that has a chance to slow enemies for 8 seconds.",
		type = 1,
		max_level = 10,
		id = 101110,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[101120] = {
		desc_get = "",
		name = "Darjeeling Rotation",
		desc = "Every 15 seconds, switches between the following effects: 1) Reduces damage taken by $1, 2) Increases damage dealt by $2, 3) Restores $3 HP every 3 seconds.",
		type = 3,
		max_level = 10,
		id = 101120,
		system_transform = {},
		desc_get_add = {
			{
				"6.0%",
				"20.0%"
			},
			{
				"6.0%",
				"20.0%"
			},
			{
				"6",
				"15"
			}
		},
		desc_add = {
			{
				{
					"6.0%",
					"+1.2%"
				},
				{
					"7.2%",
					"+1.2%"
				},
				{
					"8.4%",
					"+1.6%"
				},
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+1.6%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"6.0%",
					"+1.2%"
				},
				{
					"7.2%",
					"+1.2%"
				},
				{
					"8.4%",
					"+1.6%"
				},
				{
					"10.0%",
					"+1.2%"
				},
				{
					"11.2%",
					"+1.2%"
				},
				{
					"12.4%",
					"+1.6%"
				},
				{
					"14.0%",
					"+1.8%"
				},
				{
					"15.8%",
					"+1.8%"
				},
				{
					"17.6%",
					"+2.4%"
				},
				{
					"20.0%"
				}
			},
			{
				{
					"6",
					"+1"
				},
				{
					"7",
					"+1"
				},
				{
					"8",
					"+1"
				},
				{
					"9",
					"+1"
				},
				{
					"10",
					"+1"
				},
				{
					"11",
					"+1"
				},
				{
					"12",
					"+1"
				},
				{
					"13",
					"+1"
				},
				{
					"14",
					"+1"
				},
				{
					"15"
				}
			}
		}
	},
	[101130] = {
		desc_get = "Every 20 seconds, 20.0% chance (40.0% when fully upgraded) to unleash an airstrike with special aviation. Power based on level.",
		name = "Rainy Ratnapura",
		desc = "$1 chance to activate every 20 seconds, launch a special airstrike ($2).",
		type = 1,
		max_level = 10,
		id = 101130,
		system_transform = {},
		desc_get_add = {},
		desc_add = {
			{
				{
					"20.0%",
					"+2.2%"
				},
				{
					"22.2%",
					"+2.2%"
				},
				{
					"24.4%",
					"+2.2%"
				},
				{
					"26.6%",
					"+2.2%"
				},
				{
					"28.8%",
					"+2.2%"
				},
				{
					"31.0%",
					"+2.2%"
				},
				{
					"33.2%",
					"+2.2%"
				},
				{
					"35.4%",
					"+2.2%"
				},
				{
					"37.6%",
					"+2.4%"
				},
				{
					"40.0%"
				}
			},
			{
				{
					"Lv.1",
					"+1"
				},
				{
					"Lv.2",
					"+1"
				},
				{
					"Lv.3",
					"+1"
				},
				{
					"Lv.4",
					"+1"
				},
				{
					"Lv.5",
					"+1"
				},
				{
					"Lv.6",
					"+1"
				},
				{
					"Lv.7",
					"+1"
				},
				{
					"Lv.8",
					"+1"
				},
				{
					"Lv.9",
					"+1"
				},
				{
					"Lv.10"
				}
			}
		}
	},
	[102010] = {
		desc_get = "",
		name = "bili看板娘",
		desc = "作为先锋领队，与22在同一个队伍中出击时，队伍中22与33的雷击提高$1",
		type = 3,
		max_level = 10,
		id = 102010,
		system_transform = {},
		desc_get_add = {
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[102020] = {
		desc_get = "",
		name = "bili看板娘",
		desc = "作为先锋领队，与33在同一个队伍中出击时，队伍中22与33的炮击、装填提高$1，机动提高$2",
		type = 3,
		max_level = 10,
		id = 102020,
		system_transform = {},
		desc_get_add = {
			{
				"10.0%",
				"30.0%"
			},
			{
				"15.0%",
				"35.0%"
			}
		},
		desc_add = {
			{
				{
					"10.0%",
					"+2.2%"
				},
				{
					"12.2%",
					"+2.2%"
				},
				{
					"14.4%",
					"+2.2%"
				},
				{
					"16.6%",
					"+2.2%"
				},
				{
					"18.8%",
					"+2.2%"
				},
				{
					"21.0%",
					"+2.2%"
				},
				{
					"23.2%",
					"+2.2%"
				},
				{
					"25.4%",
					"+2.2%"
				},
				{
					"27.6%",
					"+2.4%"
				},
				{
					"30.0%"
				}
			},
			{
				{
					"15.0%",
					"+2.2%"
				},
				{
					"17.2%",
					"+2.2%"
				},
				{
					"19.4%",
					"+2.2%"
				},
				{
					"21.6%",
					"+2.2%"
				},
				{
					"23.8%",
					"+2.2%"
				},
				{
					"26.0%",
					"+2.2%"
				},
				{
					"28.2%",
					"+2.2%"
				},
				{
					"30.4%",
					"+2.2%"
				},
				{
					"32.6%",
					"+2.4%"
				},
				{
					"35.0%"
				}
			}
		}
	},
	[98000] = {
		desc_get = "测试",
		name = "指挥喵测试技能1",
		desc = "状态增益",
		type = 1,
		max_level = 10,
		id = 98000,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	[98010] = {
		desc_get = "测试",
		name = "指挥喵测试技能2",
		desc = "附加效果触发器",
		type = 1,
		max_level = 10,
		id = 98010,
		system_transform = {},
		desc_get_add = {},
		desc_add = {}
	},
	all = {
		10,
		11,
		12,
		14,
		15,
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1011,
		1012,
		1013,
		1021,
		1031,
		1032,
		1033,
		1034,
		1035,
		1036,
		1037,
		1041,
		1042,
		1043,
		1044,
		1045,
		1046,
		1051,
		1052,
		1053,
		1054,
		1055,
		1056,
		1061,
		1071,
		1081,
		1091,
		2001,
		2011,
		2021,
		2031,
		2041,
		2051,
		2061,
		2071,
		2081,
		2091,
		2101,
		2111,
		2121,
		2131,
		2141,
		2151,
		2171,
		3001,
		3011,
		3021,
		3031,
		3041,
		3051,
		3511,
		3521,
		3531,
		3571,
		3581,
		3591,
		3611,
		4001,
		4011,
		4021,
		4031,
		4041,
		4051,
		4061,
		4071,
		4081,
		4091,
		4101,
		4111,
		4121,
		4131,
		4141,
		5001,
		5011,
		5021,
		5031,
		5041,
		5051,
		5061,
		5071,
		5081,
		6000,
		6010,
		6020,
		6030,
		6040,
		6050,
		6060,
		6070,
		6080,
		6090,
		6100,
		6110,
		6120,
		6130,
		6140,
		6150,
		6160,
		6170,
		6180,
		6190,
		6200,
		6210,
		6220,
		6230,
		6240,
		6250,
		6260,
		6270,
		6280,
		6290,
		6291,
		7000,
		9010,
		9020,
		9030,
		9031,
		9033,
		9034,
		10010,
		10020,
		10030,
		10040,
		10050,
		10060,
		10070,
		10080,
		10090,
		10100,
		10110,
		10120,
		10130,
		10140,
		10150,
		10160,
		10170,
		10180,
		10190,
		10200,
		10210,
		10220,
		10230,
		10240,
		10250,
		10260,
		10270,
		10280,
		10290,
		10300,
		10310,
		10320,
		10330,
		10340,
		10350,
		10360,
		10370,
		10380,
		10390,
		10400,
		10410,
		10420,
		10430,
		10440,
		10450,
		10460,
		10470,
		10480,
		10490,
		10500,
		10510,
		10520,
		10521,
		10522,
		10530,
		10540,
		10550,
		10560,
		10570,
		10580,
		10590,
		10600,
		10610,
		10620,
		10630,
		10640,
		10650,
		10660,
		10670,
		10680,
		10690,
		10700,
		10710,
		10720,
		10730,
		10740,
		10750,
		10760,
		10770,
		10780,
		10790,
		10800,
		10810,
		10820,
		10830,
		10840,
		10850,
		10860,
		10870,
		10880,
		10890,
		10900,
		10910,
		10920,
		10930,
		10940,
		10950,
		10960,
		10970,
		10980,
		10990,
		11000,
		11010,
		11020,
		11030,
		11040,
		11050,
		11060,
		11070,
		11080,
		11090,
		11100,
		11110,
		11120,
		11130,
		11140,
		11150,
		11160,
		11170,
		11180,
		11190,
		11200,
		11210,
		11220,
		11230,
		11240,
		11250,
		11260,
		11270,
		11280,
		11290,
		11300,
		11310,
		11320,
		11330,
		11340,
		11350,
		11360,
		11370,
		11380,
		11390,
		11400,
		11410,
		11420,
		11430,
		11440,
		11450,
		11460,
		11461,
		11470,
		11480,
		11490,
		11500,
		11510,
		11520,
		11530,
		11540,
		11550,
		11560,
		11570,
		11580,
		11590,
		11600,
		11610,
		11620,
		11630,
		11640,
		11650,
		11660,
		11670,
		11680,
		11690,
		11700,
		11710,
		11720,
		11730,
		11740,
		11750,
		11760,
		11780,
		11790,
		11800,
		11810,
		11820,
		11850,
		11860,
		11890,
		11900,
		19000,
		19001,
		19002,
		19010,
		19020,
		19030,
		19040,
		19050,
		19060,
		19070,
		19080,
		19090,
		19100,
		19110,
		19120,
		20011,
		20012,
		20021,
		20022,
		20031,
		20032,
		20041,
		20042,
		20051,
		20052,
		20061,
		20062,
		20071,
		20072,
		20111,
		20112,
		20121,
		20122,
		20131,
		20132,
		20141,
		20142,
		20211,
		20212,
		20221,
		20222,
		20231,
		20232,
		20241,
		20242,
		20251,
		20252,
		20261,
		20262,
		20271,
		20272,
		20311,
		20312,
		21011,
		21012,
		21021,
		21022,
		21031,
		21032,
		21041,
		21042,
		21051,
		21052,
		21061,
		21062,
		21071,
		21072,
		21081,
		21082,
		21111,
		21112,
		21121,
		21122,
		21131,
		21132,
		21141,
		21142,
		21151,
		21152,
		21161,
		21162,
		21171,
		21172,
		21211,
		21212,
		21221,
		21222,
		21231,
		21232,
		21241,
		21242,
		22011,
		22012,
		22021,
		22022,
		22031,
		22032,
		22041,
		22042,
		22051,
		22052,
		22056,
		22057,
		22061,
		22062,
		22071,
		22072,
		22081,
		22082,
		22091,
		22092,
		22111,
		22112,
		22121,
		22122,
		22131,
		22132,
		22141,
		22142,
		22151,
		22152,
		22161,
		22162,
		22211,
		22212,
		22221,
		22222,
		22231,
		22232,
		22241,
		22242,
		22251,
		22252,
		22253,
		22261,
		22262,
		22311,
		22312,
		23011,
		23012,
		23031,
		23032,
		23041,
		23042,
		23051,
		23052,
		23111,
		23112,
		23121,
		23122,
		23211,
		23212,
		23221,
		23222,
		23311,
		23312,
		24011,
		24012,
		24111,
		24112,
		24121,
		24122,
		28011,
		28012,
		28021,
		28022,
		28111,
		28112,
		29011,
		29012,
		29021,
		29022,
		29031,
		29032,
		29041,
		29042,
		29051,
		29052,
		29061,
		29062,
		29071,
		29072,
		29081,
		29082,
		29091,
		29092,
		29101,
		29102,
		29111,
		29112,
		29121,
		29122,
		29131,
		29132,
		29141,
		29142,
		29151,
		29152,
		29161,
		29162,
		29171,
		29172,
		29181,
		29182,
		29191,
		29192,
		29201,
		29202,
		29211,
		29212,
		29221,
		29222,
		29231,
		29232,
		29241,
		29242,
		29251,
		29252,
		29261,
		29262,
		29271,
		29272,
		29281,
		29282,
		29291,
		29292,
		29301,
		29302,
		29311,
		29312,
		29321,
		29322,
		29331,
		29332,
		29341,
		29342,
		29351,
		29361,
		29362,
		101010,
		101020,
		101030,
		101040,
		101050,
		101060,
		101070,
		101080,
		101090,
		101100,
		101110,
		101120,
		101130,
		102010,
		102020,
		98000,
		98010
	}
}

return
