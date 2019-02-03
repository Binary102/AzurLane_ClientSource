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
					text = "先把角色锁定起来吧",
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
					text = "让我们返回主界面",
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
					text = "指挥官还记得怎么操作吗？",
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
					text = "点击队伍空位上的<color=#ff7e00>添加</color>",
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
					text = "选择需要上场的角色",
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
					text = "点击<color=#ff7e00>确定</color>按钮",
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
					text = "前锋舰队满员啦！现在的实力可不容小觑",
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
			openUI = true,
			action = {
				say = {
					text = "让我们返回到主界面吧！",
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
