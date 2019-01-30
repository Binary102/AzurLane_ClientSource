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
					text = "让我们打开<color=#ff7e00>生活区</color>",
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
					text = "<color=#ff7e00>后宅</color>从这里进入哟",
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
					text = "关闭存粮界面",
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
					text = "我们来选择需要休息的舰娘吧，<color=#ff7e00>舰娘在后宅休息，会回复心情</color>哦",
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
					text = "点击<color=#ff7e00>空位添加角色</color>，随后指引点击空位，添加第一个角色进入后宅",
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
					text = "选择需要休息的角色",
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
					text = "点击确定按钮",
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
							text = "指挥官可不要在后宅干坏事哦，那女将就先告辞啦！",
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
