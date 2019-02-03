return {
	id = 14,
	nextId = 15,
	events = {
		BackTask = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "대성공! 자, <color=#ff7e00>임무 정보</color>로 돌아가도록 해!",
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
			text = "임무 정보에서 <color=#ff7e00>보수를 받아야</color> 하니까.",
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
					text = "<color=#ff7e00>임무 보상</color>을 획득",
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
