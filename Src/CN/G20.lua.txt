return {
	id = 20,
	nextId = 21,
	events = {
		finish_panel = {
			action = {
				newEvent = {
					viewComponent = "EquipUpgradeLayer",
					name = "FinishUpgrade"
				}
			}
		},
		FinishUpgrade = {
			viewComponent = "EquipUpgradeLayer",
			action = {
				say = {
					text = "武器强化完毕！战斗力飞升！！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -17,
						posX = 24
					}
				},
				ui = {
					clearColor = true,
					path = "/OverlayCamera/Overlay/UIMain/EquipUpgradeUI(Clone)/mask",
					fingerPos = {
						posY = -378,
						posX = 935
					}
				},
				newEvent = {
					viewComponent = "EquipUpgradeLayer",
					name = "backDock"
				}
			}
		},
		backDock = {
			viewComponent = "EquipUpgradeLayer",
			action = {
				say = {
					text = "点击返回按钮退出角色详情",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 179,
						posX = -467
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/common/top/back"
				}
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			action = {
				say = {
					text = "点击返回按钮退出船坞",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 179,
						posX = -467
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/back"
				}
			}
		},
		MainUI = {
			text = "一起来查看<color=#ff7e00>任务日志</color>吧",
			commonEvent = "taskButton",
			redundancys = {
				"DockyardScene",
				"backDock",
				"FinishUpgrade",
				"finish_panel"
			}
		},
		TaskScene = {
			viewComponent = "TaskScene",
			openUI = true,
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
					path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/Grid/3/frame/right_panel/GetBtn"
				}
			}
		},
		20006 = {
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
