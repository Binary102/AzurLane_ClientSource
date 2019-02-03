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
					text = "Select the <color=#ff7e00>Offshore Exercises</color> stage.",
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
					text = "This is where you'll see various details about the stage.",
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
					text = "   Tap <color=#ff7e00>go</color> to start searching for the enemy!",
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
					text = "Now, <color=#ff7e00>select which fleet to attack with</color>. You don't have any choices right now, so just select Fleet 1.",
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
					text = "   Tap <color=#ff7e00>go</color> to start searching for the enemy!",
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
