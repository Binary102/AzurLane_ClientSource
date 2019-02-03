return {
	id = 6,
	nextId = 7,
	condition = {
		ChapterProxy,
		"getActiveChapter",
		"="
	},
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "选择<color=#ff7e00>近海演习</color>关卡",
					style = {
						posY = 3,
						mode = 2,
						alpha = 0.2,
						dir = 2,
						posX = -280
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/float/levels/Chapter_101/main"
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "info"
				}
			}
		},
		info = {
			viewComponent = "LevelScene2",
			uiWait = 0.3,
			action = {
				say = {
					text = "这里显示了关卡内的信息",
					style = {
						posY = 195,
						mode = 2,
						alpha = 0,
						dir = -1,
						posX = 223
					}
				},
				newEvent = {
					viewComponent = "info",
					name = "info2"
				}
			}
		},
		info2 = {
			viewComponent = "info",
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
					path = "/OverlayCamera/Overlay/UIMain/stage_info/panel/start_button"
				},
				newEvent = {
					viewComponent = "info2",
					name = "info2-1"
				}
			}
		},
		["info2-1"] = {
			viewComponent = "info2",
			action = {
				say = {
					text = "现在要<color=#ff7e00>选择出击的舰队</color>，但目前人手不足...只能选择第一舰队啦~",
					style = {
						posY = 208,
						mode = 2,
						alpha = 0,
						dir = -1,
						posX = 223
					}
				},
				newEvent = {
					viewComponent = "info2-1",
					name = "info3"
				}
			}
		},
		info3 = {
			viewComponent = "info2-1",
			openUI = true,
			action = {
				say = {
					text = "   点击<color=#ff7e00>立刻前往</color>按钮开始索敌！",
					style = {
						posY = -108,
						mode = 2,
						alpha = 0.4,
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
