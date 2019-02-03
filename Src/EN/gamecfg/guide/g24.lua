return {
	id = 24,
	nextId = 27,
	condition = {
		FleetProxy,
		"getFirstFleetShipCount",
		"=",
		3
	},
	events = {
		NewShipLayer = {
			viewComponent = "NewShipLayer",
			action = {
				ui = {
					path = "OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/click",
					fingerPos = {
						posY = -123,
						posX = 395
					}
				}
			}
		},
		MsgboxUI = {
			viewComponent = "MsgboxUI",
			redundancys = {
				"NewShipLayerExit"
			},
			action = {
				say = {
					text = "First, let's lock this character in.",
					commonStyle = "newShip",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 145,
						posX = 78
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		["custom_button_1(Clone)"] = {
			viewComponent = "NewShipLayer",
			action = {
				say = {
					text = "Let's head back to the main screen again.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 167,
						posX = -439
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/blur_container/top/back"
				}
			}
		},
		NewShipLayerExit = {
			viewComponent = "NewShipLayer",
			action = {
				newEvent = {
					viewComponent = "NewShipLayer",
					name = "custom_button_1(Clone)"
				}
			}
		},
		MainUI = {
			commonEvent = "formationButton",
			redundancys = {
				"NewShipLayerExit",
				"custom_button_1(Clone)",
				"MsgboxUI",
				"NewShipLayer"
			}
		},
		FormationUI = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "Commander, do you remember what to do?",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.1,
						posY = 204,
						posX = 251
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI4"
				}
			}
		},
		FormationUI4 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "Tap the empty slot in your team to <color=#ff7e00>add</color> another ship.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 204,
						posX = 251
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/GridFrame/vanguard_3/tip"
				}
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			retain = true,
			action = {
				say = {
					text = "Select a ship to deploy.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -62,
						posX = -354
					}
				},
				ui = {
					delay = 0.4,
					childIndex = "#",
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships"
				},
				newEvent = {
					viewComponent = "DockyardScene",
					name = "SelectedShip"
				}
			}
		},
		SelectedShip = {
			viewComponent = "DockyardScene",
			action = {
				say = {
					text = "Next, tap <color=#ff7e00>confirm</color>.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -119,
						posX = 321
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button"
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "BackFormation"
				}
			}
		},
		BackFormation = {
			viewComponent = "FormationUI",
			retain = true,
			action = {
				say = {
					text = "The vanguard is full! Our power shouldn't be underestimated!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 60,
						posX = -135
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "BackMainScene2"
				}
			}
		},
		BackMainScene2 = {
			viewComponent = "FormationUI",
			openUI = true,
			action = {
				say = {
					text = "Let's head back to the main screen!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 179,
						posX = -488
					}
				},
				ui = {
					delay = 1,
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/blur_container/top/title/back"
				}
			}
		},
		12103 = {
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
					viewComponent = "MainUI",
					name = "MainUI"
				}
			}
		}
	}
}
