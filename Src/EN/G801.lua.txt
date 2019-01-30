return {
	nextId = 899,
	id = 801,
	permit = true,
	condition = {
		DormProxy,
		"getTrainShipCount",
		"=",
		0
	},
	events = {
		MainUI = {
			commonEvent = "backyardButton",
			redundancys = {
				"BackYardGarnitureLayer3"
			}
		},
		BackYardGarnitureLayer3 = {
			viewComponent = "BackYardGarnitureLayer",
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "Close the supplies menu.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/foodPanel/bg"
				},
				newEvent = {
					viewComponent = "BackYardScene",
					name = "BackYardScene"
				}
			}
		},
		BackYardScene = {
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "Now we need to find someone that needs some rest. <color=#ff7e00>Moods usually improve in the dorm</color>!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.5,
						posY = -78,
						posX = -485
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/leftPanel/train_btn"
				}
			}
		},
		BackYardShipInfoLayer = {
			viewComponent = "BackYardShipInfoLayer",
			action = {
				say = {
					text = "Tap <color=#ff7e00>an empty slot to begin adding a character</color>, then select someone to put in the dorm.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.5,
						posY = 232,
						posX = -452
					}
				},
				ui = {
					childIndex = 0,
					path = "/OverlayCamera/Overlay/UIMain/main/frame/train_panel/scrollview/ships"
				}
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			retain = true,
			action = {
				say = {
					text = "Select someone that needs rest.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -62,
						posX = -354
					}
				},
				ui = {
					delay = 0.6,
					childIndex = 0,
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
					text = "Tap confirm.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -119,
						posX = 321
					}
				},
				ui = {
					delay = 1,
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button"
				}
			}
		},
		19003 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			endEvent = {
				{
					action = {
						say = {
							text = "Don't try anything funny in the dorm, Commander!",
							style = {
								dir = 1,
								mode = 2,
								alpha = 0.4,
								posY = 0,
								posX = 0
							}
						}
					}
				}
			},
			action = {}
		}
	}
}
