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
					text = "返回主界面",
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
			text = "使用任务奖励<color=#ff7e00>建造新角色</color>吧",
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
					text = "这次来试试看<color=#ff7e00>重型舰建造</color>",
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
					text = "建造材料准备充足！ 点击<color=#ff7e00>开始建造</color>",
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
					text = "点击<color=#ff7e00>确定</color>开始建造",
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
