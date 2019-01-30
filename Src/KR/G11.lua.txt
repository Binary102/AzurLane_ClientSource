return {
	id = 11,
	nextId = 12,
	condition = {
		TaskProxy,
		"isCompleteTaskById",
		"=",
		true,
		1
	},
	events = {
		BackMainScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "화살표 버튼을 눌러서 임무 정보를 닫고 메인 화면으로 돌아가자.",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 161,
						posX = -496
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/top/top_chapter",
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/top/top_chapter/back_button",
					fingerPos = {
						posY = -47,
						posX = 20
					}
				}
			}
		},
		MainUI = {
			commonEvent = "taskButton",
			redundancys = {
				"BackMainScene2"
			}
		},
		TaskScene = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "여기는 지휘관의 <color=#ff7e00>임무 정보</color>야. 임무는 전부 여기에 정리될 테니, 잘 확인해둬.",
					style = {
						dir = 1,
						mode = 1,
						alpha = 0,
						posY = -24,
						posX = 25
					}
				},
				newEvent = {
					viewComponent = "TaskScene",
					name = "TaskScene2"
				}
			}
		},
		TaskScene2 = {
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
					path = "/UICamera/Canvas/UIMain/TaskScene(Clone)/taskBGCenter/right_panel/Grid/1/frame/right_panel/GetBtn"
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
			action = {
				newEvent = {
					viewComponent = "AwardInfoLayer",
					name = "AwardInfoLayer",
					isView = true
				}
			}
		}
	}
}
