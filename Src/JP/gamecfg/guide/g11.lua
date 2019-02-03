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
					text = "矢印ボタンをタップして、任務情報を閉じてメイン画面に戻るわ",
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
					text = "ここは指揮官の<color=#ff7e00>任務情報</color>ね。任務は全部こっちに整理されるから、よく確認して",
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
			action = {
				say = {
					text = "<color=#ff7e00>任務報酬</color>を受け取りなさいっ！",
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
