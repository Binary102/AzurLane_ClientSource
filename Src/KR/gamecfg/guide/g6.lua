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
					text = "<color=#ff7e00>근해 연습</color>을 선택해줘.",
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
					text = "스테이지의 상세정보가 표시되어있어.",
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
					text = "<color=#ff7e00>출격</color>을 눌러 작전해역으로 출격이야!",
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
					text = "<color=#ff7e00>출격함대</color>를 선택해야할 것 같네... 지, 지금은 제1함대 밖에 없으니깐!",
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
					text = "   <color=#ff7e00>출격</color>을 눌러 작전해역으로 출격하자!",
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
