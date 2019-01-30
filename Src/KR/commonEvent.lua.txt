return {
	combatBtn = {
		viewComponent = "MainUI",
		action = {
			say = {
				text = "이번 임무는 유니온 항모 함대의 작전 연습을 지원하는 거야.",
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
				text = "<color=#ff7e00>데일리 챌린지</color>는 이쪽이야.",
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
				text = "<color=#ff7e00>군사 의뢰</color>는 이쪽이야.",
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
				text = "<color=#ff7e00>임무 정보</color>를 확인하자.",
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
				text = "다음은 <color=#ff7e00>해군 학원</color>으로 가자.",
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
				text = "<color=#ff7e00>건조 정보</color> 를 확인하자!",
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
				text = "모두가 지내는 <color=#ff7e00>숙소</color>는 이쪽이야.",
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
				text = "보상으로 받은 재료로 소형함을 한 척 건조할 수 있을 거라구! 얼른 건조해보는 거야!",
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
				text = "<color=#ff7e00>장비 창고</color>는 이쪽이야.",
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
				text = "<color=#ff7e00>임무 보상</color>은 이쪽에서 받을 수 있어.",
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
				text = "<color=#ff7e00>편성</color>은 이쪽이야.",
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
				text = "<color=#ff7e00>도크</color>는 이쪽이야.",
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
