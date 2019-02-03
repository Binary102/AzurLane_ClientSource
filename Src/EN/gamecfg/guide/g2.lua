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
					text = "Are you the new Commander? Welcome to the world of Azur Lane. I'll be your teacher!",
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
			text = "First, let's build a new ship.",
			commonEvent = "buildButton"
		},
		BuildShipScene = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "How about trying to build a <color=#ff7e00>light ship</color> first?",
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
					text = "Tap <color=#ff7e00>build</color> to get started.",
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
					text = "Once you've confirmed that you have enough resources, tap <color=#ff7e00>confirm</color>!",
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
