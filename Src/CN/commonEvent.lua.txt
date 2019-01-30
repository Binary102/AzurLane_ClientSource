return {
	combatBtn = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "接下来我们的任务是支援白鹰航空舰队的作战演习    请点击<color=#ff7e00>出击</color>",
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
				text = "<color=#ff7e00>每日副本</color>从这里进入",
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
				text = "<color=#ff7e00>军事委托</color>从这里进入",
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
				text = "让我们打开<color=#ff7e00>任务日志</color>",
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
				text = "去学院",
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
				text = "前往查看<color=#ff7e00>建造</color>详情！",
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
				text = "<color=#ff7e00>后宅</color>从这里进入哟",
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
				text = "奖励的材料正好能建造一艘轻型舰船呢~赶紧去造船厂里增加战力吧！",
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
				text = "前往<color=#ff7e00>仓库</color>界面",
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
				text = "领取<color=#ff7e00>任务奖励</color>",
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
				text = "前往<color=#ff7e00>编队</color>，将角色编入队伍",
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
				text = "让我们前往<color=#ff7e00>船坞</color>",
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
