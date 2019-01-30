return {
	id = 96,
	nextId = 27,
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			openUI = true,
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "아앗! 작전 실패... 확인 버튼을 눌러 돌아가자...",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = 217,
						posX = -323
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		13104 = {
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
					name = "LevelScene2"
				}
			}
		}
	}
}
