return {
	id = 2,
	nextId = 3,
	condition = {
		BuildShipProxy,
		"canBuildShip",
		"=",
		true,
		2
	},
	events = {
		MainUI = {
			viewComponent = "MainUI",
			action = {
				say = {
					text = "네가 새로운 지휘관이구나! 벽람항로에 잘 왔어. \n이 아마존이 기본적인 지식을 전수해주도록 하지!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 34,
						posX = -5
					}
				},
				newEvent = {
					viewComponent = "MainUI",
					name = "MainUI2"
				}
			}
		},
		MainUI2 = {
			text = "우선은 함선을 건조하는 것부터!",
			commonEvent = "buildButton"
		},
		BuildShipScene = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "<color=#ff7e00>소형함</color>을 한 척 건조해보자!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 218,
						posX = -312
					}
				},
				newEvent = {
					viewComponent = "BuildShipScene",
					name = "BuildShipScene3"
				}
			}
		},
		BuildShipScene3 = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "<color=#ff7e00>건조개시</color>를 눌러!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -109,
						posX = 405
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/buildShipUI(Clone)/bg/frame/start_btn"
				}
			}
		},
		start_btn = {
			openUI = true,
			action = {
				say = {
					text = "자재는 충분하다고! <color=#ff7e00>확인</color>을 눌러서 건조를 시작하는 거야!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 111,
						posX = 81
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/build_msg/window/bg/button_container/ok_btn"
				}
			}
		},
		12003 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			action = {}
		}
	}
}
