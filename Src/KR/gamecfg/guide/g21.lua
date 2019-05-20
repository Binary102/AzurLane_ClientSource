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
					text = "메인 화면으로 돌아가자.",
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
			text = "방금 받은 임무 보상으로 한 번 더 <color=#ff7e00>건조</color>하는 거야.",
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
					text = "이번에는 <color=#ff7e00>중형함 건조</color>에 도전해볼까!",
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
					text = "자재는 충분하다고! <color=#ff7e00>확인</color>을 눌러서 건조를 시작하는 거야!",
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
					text = "<color=#ff7e00>확인</color>을 누르도록 해.",
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
