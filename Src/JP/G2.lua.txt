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
					text = "お前が新しい指揮官ね！アズールレーンへようこそ。この私・アマゾンが基本を指導してやるわ！",
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
			text = "まずは艦を建造することよ！",
			commonEvent = "buildButton"
		},
		BuildShipScene = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "<color=#ff7e00>小型艦</color>を一隻建造してみて！",
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
					text = "<color=#ff7e00>建造開始</color>をタップするわよ！",
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
			action = {
				say = {
					text = "資材は十分！<color=#ff7e00>確定</color>をタップして建造開始よ！",
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
