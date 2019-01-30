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
					text = "经过这次战斗，指挥官是否感觉到战力不足呢？让我们先<color=#ff7e00>暂时撤退</color>，回港修整一下吧！",
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
					text = "点击<color=#ff7e00>撤退</color>",
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
					text = "咳咳..没错，这只是一次战术性撤退！",
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
