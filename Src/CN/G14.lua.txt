return {
	id = 14,
	nextId = 15,
	events = {
		BackTask = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "大功告成，让我们回到<color=#ff7e00>任务系统</color>吧！",
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
			text = "回到任务日志<color=#ff7e00>领取奖励</color>",
			commonEvent = "taskButton",
			redundancys = {
				"BackTask"
			}
		},
		TaskScene = {
			viewComponent = "TaskScene",
			openUI = true,
			action = {
				say = {
					text = "领取<color=#ff7e00>任务奖励</color>",
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
