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
					text = "武器強化完了！戦闘力アップ！！",
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
					text = "ドックに戻ってね",
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
					text = "メイン画面に戻るわ",
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
			text = "もう一回<color=#ff7e00>任務情報</color>を見るわ",
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
			action = {
				say = {
					text = "<color=#ff7e00>任務報酬</color>を受け取りなさいっ！",
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
			closeUI = true,
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
