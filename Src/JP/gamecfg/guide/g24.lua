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
					text = "手に入れた艦を<color=#ff7e00>鍵付き</color>にするのを忘れないでね",
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
					text = "メイン画面に戻るわ",
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
					text = "編成のやり方は覚えてる？",
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
					text = "空いている出撃枠の<color=#ff7e00>編成</color>をタップしてね",
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
					text = "艦隊に編入する艦を選択してね",
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
					text = "<color=#ff7e00>確定</color>ボタンをタップよ",
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
					text = "前衛艦隊は最大編成ね！今回はバッチリよ！",
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
			action = {
				say = {
					text = "メイン画面に戻るわ",
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
