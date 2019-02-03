return {
	combatBtn = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Our next mission is to support the Eagles' aviation fleet combat drills. Tap <color=#ff7e00>Attack</color> to get started.",
				commonStyle = "combatBtn",
				style = {
					posY = 142,
					mode = 1,
					alpha = 0.4,
					dir = 1,
					posX = 432
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel",
				path = "UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel/combatBtn"
			}
		}
	},
	combatBtn2 = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Access your <color=#ff7e00>Daily Stages</color> here.",
				commonStyle = "combatBtn",
				style = {
					posY = 142,
					mode = 1,
					alpha = 0.4,
					dir = 1,
					posX = 432
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel",
				path = "UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel/combatBtn"
			}
		}
	},
	combatBtn3 = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Check <color=#ff7e00>Commissions</color> here.",
				commonStyle = "combatBtn",
				style = {
					posY = 142,
					mode = 1,
					alpha = 0.4,
					dir = 1,
					posX = 432
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel",
				path = "UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel/combatBtn"
			}
		}
	},
	taskButton = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Why not open up your <color=#ff7e00>Mission Log</color>?",
				commonStyle = "taskButton",
				style = {
					posY = -133,
					alpha = 0.4,
					posX = 234
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/taskButton",
				fingerPos = {
					posY = -9,
					posX = 95
				}
			}
		}
	},
	classButton = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Go to the Academy",
				commonStyle = "taskButton"
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/friendButton"
			}
		}
	},
	buildButton = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Let's check out <color=#ff7e00>build</color> details!",
				style = {
					dir = 1,
					mode = 1,
					alpha = 0.4,
					posY = -111,
					posX = 359
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/buildButton"
			}
		}
	},
	backyardButton = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Enter the <color=#ff7e00>Dorm</color> through here.",
				style = {
					dir = 1,
					mode = 1,
					alpha = 0.4,
					posY = -102,
					posX = 87
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/haremButton"
			}
		}
	},
	taskGo = {
		viewComponent = "TaskScene",
		action = {
			say = {
				text = "These rewards give us enough resources to build a light ship. Let's head to the shipyard and increase our fighting power!",
				commonStyle = "taskGo"
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/Grid/0/frame/right_panel/GotoBtn"
			}
		}
	},
	equipmentButton = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Let's check out your <color=#ff7e00>storage</color>.",
				style = {
					dir = 1,
					mode = 1,
					alpha = 0.4,
					posY = -114,
					posX = -234
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/equipButton"
			}
		}
	},
	taskGet = {
		viewComponent = "TaskScene",
		action = {
			say = {
				text = "Collect your <color=#ff7e00>mission rewards.</color>.",
				style = {
					dir = 1,
					mode = 2,
					alpha = 0.4,
					posY = 30,
					posX = 306
				}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/Grid/0/frame/right_panel/GetBtn"
			}
		}
	},
	formationButton = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Let's add your new ship to your <color=#ff7e00>formation</color>.",
				style = {
					dir = 1,
					mode = 1,
					alpha = 0.4,
					posY = 154,
					posX = 217
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/rightPanel/formationButton"
			}
		}
	},
	dockBtn = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "Let's head to the <color=#ff7e00>Dock</color>.",
				style = {
					dir = -1,
					mode = 2,
					alpha = 0.6,
					posY = -115,
					posX = -484
				}
			},
			ui = {
				tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
				path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/dockBtn"
			}
		}
	}
}
