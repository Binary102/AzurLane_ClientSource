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
					text = "무기 강화 완료! 전투력 업!",
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
					text = "도크로 돌아가자.",
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
					text = "메인 화면으로 돌아가자.",
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
			text = "다시 한번 <color=#ff7e00>임무 정보</color>를 확인하자.",
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
					text = "<color=#ff7e00>임무 보상</color>을 획득",
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
