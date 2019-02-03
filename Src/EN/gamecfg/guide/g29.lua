return {
	id = 29,
	nextId = 30,
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
			text = "Commander, please Tap <color=#ff7e00>Attack</color>.",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "Our fleet is even more perfect now~! We can definitely take down Hornet!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 217,
						posX = -323
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
						posY = 217,
						posX = -323
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
					text = "Damn, we've been stopped by enemy ships again. Our <color=#ff7e00>total Evasion has improved</color> though, so we can just skirt around unnecessary battles like this one.",
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
					text = "Tap <color=#ff7e00>evade</color> to avoid interception!",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0,
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
					viewComponent = "LevelScene2",
					name = "LevelScene2"
				}
			}
		}
	}
}
