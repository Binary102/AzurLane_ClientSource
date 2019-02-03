return {
	id = 11,
	nextId = 12,
	condition = {
		TaskProxy,
		"isCompleteTaskById",
		"=",
		true,
		1
	},
	events = {
		BackMainScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "Tap here to return to the main screen.",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 161,
						posX = -496
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/top/top_chapter",
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/top/top_chapter/back_button",
					fingerPos = {
						posY = -47,
						posX = 20
					}
				}
			}
		},
		MainUI = {
			commonEvent = "taskButton",
			redundancys = {
				"BackMainScene2"
			}
		},
		TaskScene = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "Commander, this is your <color=#ff7e00>mission log</color>. All missions and their details will be posted here!",
					style = {
						dir = 1,
						mode = 1,
						alpha = 0,
						posY = -24,
						posX = 25
					}
				},
				newEvent = {
					viewComponent = "TaskScene",
					name = "TaskScene2"
				}
			}
		},
		TaskScene2 = {
			viewComponent = "TaskScene",
			openUI = true,
			action = {
				say = {
					text = "Claim <color=#ff7e00>Mission Reward</color>",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 30,
						posX = 306
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/Grid/1/frame/right_panel/GetBtn"
				}
			}
		},
		20006 = {
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
					viewComponent = "AwardInfoLayer",
					name = "AwardInfoLayer",
					isView = true
				}
			}
		}
	}
}
