return {
	id = 10,
	nextId = 11,
	condition = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 3
		}
	},
	events = {
		MainUI = {
			commonEvent = "combatBtn",
			remove = true
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "Feeling like you need more firepower? Let's <color=#ff7e00>retreat for now</color> and head back to port!",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 54,
						posX = -69
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene3"
				}
			}
		},
		LevelScene3 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "Tap <color=#ff7e00>retreat</color>.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -111,
						posX = 82
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/retreat_button",
					fingerPos = {
						posY = -16,
						posX = 75
					}
				}
			}
		},
		MsgboxUI = {
			viewComponent = "MsgboxUI",
			openUI = true,
			action = {
				say = {
					text = "Yes, yes... This is just a tactical retreat!",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.2,
						posY = 206,
						posX = 129
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
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
					name = "BackMainScene2"
				}
			}
		}
	}
}
