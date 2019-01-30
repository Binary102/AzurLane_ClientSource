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
					text = "你就是新来的指挥官吗？欢迎您加入碧蓝航线，接下来我将指引你完成基本教学",
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
			text = "首先,我们来建造新角色吧",
			commonEvent = "buildButton"
		},
		BuildShipScene = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "先建造一艘<color=#ff7e00>轻型舰</color>试试吧！",
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
					text = "点击<color=#ff7e00>开始建造</color>",
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
					text = "材料充足，点击<color=#ff7e00>确定</color>建造！",
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
