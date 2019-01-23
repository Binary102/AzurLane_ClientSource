return {
	id = 14,
	nextId = 15,
	events = {
		BackTask = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "大成功！はい、<color=#ff7e00>任務情報</color>に戻って",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 155,
						posX = -370
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/title/bg/back"
				}
			}
		},
		MainUI = {
			text = "任務情報で<color=#ff7e00>報酬を受け取る</color>わよ",
			commonEvent = "taskButton",
			redundancys = {
				"BackTask"
			}
		},
		TaskScene = {
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
					path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/Grid/2/frame/right_panel/GetBtn"
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
