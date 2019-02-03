return {
	id = 8,
	nextId = 9,
	condition = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 3,
			attachment = 5,
			flag = 2
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
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "CharMoveEnd"
				}
			}
		},
		CharMoveEnd = {
			viewComponent = "LevelScene2",
			uiWait = 2,
			redundancys = {
				"SelectEnemy",
				"LevelScene2",
				"MainUI"
			},
			action = {
				say = {
					text = "We were ambushed! You can choose whether you want to attack or evade.",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0,
						posY = 49,
						posX = 230
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "CharMoveEnd2"
				}
			}
		},
		CharMoveEnd2 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				say = {
					text = "Let's <color=#ff7e00>evade</color> the enemies this time.",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 49,
						posX = 230
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/ambush_info/window/dodge_button"
				}
			}
		},
		13104 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			action = {
				newEvent = {
					viewComponent = "ChapterPreCombatLayer",
					name = "ChapterPreCombatLayer3"
				}
			}
		}
	}
}
