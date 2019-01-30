return {
	id = 21,
	nextId = 22,
	condition = {
		BuildShipProxy,
		"canBuildShip",
		"=",
		true,
		3
	},
	events = {
		["AwardInfoUI(Clone)"] = {
			action = {
				say = {
					text = "Head back to the main screen.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 190,
						posX = -469
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/title/back"
				}
			}
		},
		MainUI = {
			text = "Use your mission rewards to <color=#ff7e00>build a new ship</color>.",
			commonEvent = "buildButton",
			redundancys = {
				"AwardInfoUI(Clone)",
				"AwardInfoLayer"
			}
		},
		BuildShipScene = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "This time, try building a <color=#ff7e00>heavy ship</color>!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -112,
						posX = -42
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/buildShipUI(Clone)/bg/frame/projects/heavy",
					triggerType = {
						2,
						true
					},
					fingerPos = {
						posY = -55,
						posX = 117
					}
				},
				newEvent = {
					viewComponent = "BuildProjetcsLayer",
					name = "BuildProjetcsLayer"
				}
			}
		},
		BuildProjetcsLayer = {
			viewComponent = "BuildProjetcsLayer",
			action = {
				say = {
					text = "You've got enough resources! Tap <color=#ff7e00>build</color> to get started.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -113,
						posX = 376
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
					text = "Now tap <color=#ff7e00>confirm</color> to build your new ship.",
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
