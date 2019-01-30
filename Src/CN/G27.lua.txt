return {
	id = 27,
	nextId = 28,
	condition = {
		ChapterProxy,
		"getActiveChapter",
		"="
	},
	events = {
		MainUI = {
			text = "指挥官请点击<color=#ff7e00>出击</color>",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "再次选择<color=#ff7e00>近海演习</color>关卡",
					style = {
						posY = 3,
						mode = 2,
						alpha = 0.4,
						dir = 2,
						posX = -280
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/float/levels/Chapter_101/main",
					fingerPos = {
						posY = -34,
						posX = 99
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "info"
				}
			}
		},
		info = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "   点击<color=#ff7e00>立刻前往</color>开始索敌！",
					style = {
						posY = -33,
						mode = 2,
						alpha = 0.4,
						dir = 1,
						posX = 263
					}
				},
				ui = {
					delay = 0.3,
					path = "/OverlayCamera/Overlay/UIMain/stage_info/panel/start_button"
				},
				newEvent = {
					viewComponent = "info",
					name = "info2"
				}
			}
		},
		info2 = {
			viewComponent = "info",
			openUI = true,
			action = {
				say = {
					text = "   点击<color=#ff7e00>立刻前往</color>开始索敌！",
					style = {
						posY = -108,
						mode = 2,
						alpha = 0.6,
						dir = 1,
						posX = 263
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/fleet_select/panel/start_button"
				}
			}
		},
		13102 = {
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
					name = "LevelScene2",
					isView = true
				}
			}
		}
	}
}
