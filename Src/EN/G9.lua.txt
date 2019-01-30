return {
	id = 9,
	nextId = 10,
	condition = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 3,
			attachment = 5,
			flag = 0
		}
	},
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "Hornet must be hiding somewhere here. If you can crush her then the sea is yours!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene3"
				}
			}
		},
		LevelScene3 = {
			retain = true,
			uiWait = 1,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "Commander, we must first test your skills in defeating the enemy vanguard.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "SelectEnemy"
				}
			}
		},
		SelectEnemy = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "We've located Hornet! Let's move towards the target.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 177,
						posX = -314
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/func_button",
					fingerPos = {
						posY = -13,
						posX = 83
					}
				}
			}
		},
		ChapterPreCombatLayer3 = {
			viewComponent = "ChapterPreCombatLayer",
			retain = true,
			redundancys = {
				"SelectEnemy",
				"LevelScene3",
				"LevelScene2",
				"MainUI"
			},
			action = {
				say = {
					text = "Oh no! Evasion failed. We have to meet them head on!",
					style = {
						posY = -109,
						mode = 2,
						alpha = 0.4,
						posX = 406
					}
				},
				newEvent = {
					viewComponent = "ChapterPreCombatLayer",
					name = "ChapterPreCombatLayer2"
				}
			}
		},
		ChapterPreCombatLayer2 = {
			retain = true,
			uiWait = 1,
			viewComponent = "ChapterPreCombatLayer",
			action = {
				say = {
					text = "<color=#ff7e00>Your fleet's total evasion</color> will determine whether or not you can evade enemies successfully or not.",
					style = {
						posY = -109,
						mode = 2,
						alpha = 0.4,
						posX = 406
					}
				},
				newEvent = {
					viewComponent = "ChapterPreCombatLayer",
					name = "ChapterPreCombatLayer"
				}
			}
		},
		ChapterPreCombatLayer = {
			retain = true,
			viewComponent = "ChapterPreCombatLayer",
			action = {
				say = {
					text = "Tap <color=#ff7e00>Battle</color> to start battle! You have to <color=#ff7e00>spend oil</color> in order to launch attacks. Each ship uses different amounts of oil.",
					style = {
						posY = -109,
						mode = 2,
						alpha = 0.4,
						posX = 406
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/ChapterPreCombatUI(Clone)/right/start"
				}
			}
		},
		40004 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				},
				{
					"score",
					">",
					1,
					1
				}
			},
			branch = {
				rockBack = 98,
				condition = {
					{
						"result",
						"=",
						0,
						2
					},
					{
						"score",
						"<=",
						1,
						1
					},
					{
						"_timeout",
						"=",
						false,
						6
					}
				}
			},
			action = {}
		}
	}
}
