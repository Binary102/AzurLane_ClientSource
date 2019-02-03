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
					text = "メイン画面に戻るわ",
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
			text = "今もらった任務報酬でもう一回<color=#ff7e00>建造</color>するわ",
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
					text = "今度は<color=#ff7e00>大型艦建造</color>にチャレンジするのよ",
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
					text = "資材は十分！<color=#ff7e00>建造開始</color>をタップして建造開始よ！",
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
			action = {
				say = {
					text = "<color=#ff7e00>確定</color>をタップしてね",
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
