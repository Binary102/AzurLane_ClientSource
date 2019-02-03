return {
	id = 99,
	nextId = 6,
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "Oh no, you were defeated! Let's try again. We can definitely win this!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -8,
						posX = -5
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene3"
				}
			}
		},
		LevelScene3 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				say = {
					text = "Tap to leave stage",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 212,
						posX = -219
					}
				},
				ui = {
					delay = 1,
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
