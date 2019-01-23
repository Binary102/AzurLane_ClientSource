return {
	combatBtn = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "今度の任務はユニオン空母艦隊の作戦演習を支援することね",
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
				text = "<color=#ff7e00>デイリーチャレンジ</color>はこっちよ",
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
				text = "<color=#ff7e00>軍事委託</color>はこっちよ",
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
				text = "<color=#ff7e00>任務情報</color>を確認するわ",
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
				text = "次は<color=#ff7e00>海軍学園</color>ね",
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
				text = "<color=#ff7e00>建造詳細</color>を確認するわ！",
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
				text = "みんなが住んでいる<color=#ff7e00>寮舎</color>はこっちよ",
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
				text = "報酬の材料は小型艦一隻を建造できるわね！早く建造してみるのよ！",
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
				text = "<color=#ff7e00>装備倉庫</color>はこっちよ",
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
				text = "<color=#ff7e00>任務報酬</color>はこっちで受け取るのよ",
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
				text = "<color=#ff7e00>編成</color>はこっちよ",
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
				text = "<color=#ff7e00>ドック</color>はこっちね",
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
