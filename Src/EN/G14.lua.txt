return {
	id = 14,
	nextId = 15,
	events = {
		BackTask = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "Well done. Let's head back to our <color=#ff7e00>missions</color>!",
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
			text = "<color=#ff7e00>Collect your rewards</color> in the missions log.",
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
