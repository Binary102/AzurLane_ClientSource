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
			viewComponent = "MainUI",
			action = {
				say = {
					text = "<color=#ff7e00>「母港」</color>をタップしよう！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.3,
						posY = -87.7,
						posX = -103.4
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
					path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/liveButton"
				},
				newEvent = {
					viewComponent = "MainUI",
					name = "MainUI2"
				}
			}
		},
		MainUI2 = {
			viewComponent = "MainUI",
			action = {
				say = {
					text = "みんなが住んでいる<color=#ff7e00>寮舎</color>はこっちよ",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.3,
						posY = 183,
						posX = -7.629
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/secondary_panel/frame/bg/backyard_btn"
				}
			}
		},
		BackYardGarnitureLayer3 = {
			viewComponent = "BackYardGarnitureLayer",
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "前の画面に戻るわ",
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
					text = "寮舎で休憩する艦を選ぶね。<color=#ff7e00>寮舎で休憩すると、コンディションも回復する</color>のよ。",
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
					text = "<color=#ff7e00>追加で艦を配置</color>するわよ",
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
					text = "休憩させたい艦を選択してね",
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
					text = "確定ボタンをタップしてね",
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
					closeUI = true,
					action = {
						say = {
							text = "りょ、寮舎で変なことをしないでね！…じゃあアマゾンはこれで！",
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
