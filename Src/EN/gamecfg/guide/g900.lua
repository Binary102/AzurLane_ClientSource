return {
	id = 900,
	permit = true,
	nextId = 999,
	events = {
		LevelScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "HQ is extremely impressed with your performance, Commander. They've given you permission to start working on your second fleet!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 9,
						posX = -18
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
			action = {
				say = {
					text = "Head to the formation menu to put your second fleet, Fleet 2, together. Tap confirm to head directly there.",
					goScene = "BIANDUI",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 9,
						posX = -18
					}
				}
			}
		},
		FormationUI = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "Tap the button on the right to switch to Fleet 2.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 73,
						posX = 387
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/nextPage",
					fingerPos = {
						posY = -61,
						posX = 5
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI2"
				}
			}
		},
		FormationUI2 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "This is where you can begin changing Fleet 2's formation.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = 294
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI3"
				}
			}
		},
		FormationUI3 = {
			viewComponent = "FormationUI",
			enabelGuild = true,
			action = {
				say = {
					text = "The flames of war are raging. Battles will only get harder from here on out. Give 'em hell, Commander!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = 294
					}
				}
			}
		}
	}
}
