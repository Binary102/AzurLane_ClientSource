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
					text = "<color=#ff7e00>近海演習</color>を選んでちょうだい",
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
					text = "ステージの詳細は表示されているわ",
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
					text = "   <color=#ff7e00>出撃</color>をタップして作戦海域に出撃よ！",
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
					text = "<color=#ff7e00>出撃艦隊</color>を選ぶ必要があるようね…い、今は第一艦隊しかないからね！",
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
			action = {
				say = {
					text = "   <color=#ff7e00>出撃</color>をタップして作戦海域に出撃よ！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4
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
