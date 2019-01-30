return {
	id = 29,
	nextId = 30,
	condition = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 3,
			attachment = 5,
			flag = 2
		}
	},
	events = {
		MainUI = {
			text = "<color=#ff7e00>출격</color>을 눌러봐.",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "이정도의 함대라면 분명 호넷을 쓰러뜨릴 수 있어!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 217,
						posX = -323
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "SelectEnemy"
				}
			}
		},
		SelectEnemy = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "호넷이 나타난 위치를 알아냈어! 목표 지점까지 전속 전진이야!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 217,
						posX = -323
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/func_button",
					fingerPos = {
						posY = -13,
						posX = 83
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "CharMoveEnd"
				}
			}
		},
		CharMoveEnd = {
			viewComponent = "LevelScene2",
			uiWait = 2,
			redundancys = {
				"SelectEnemy",
				"LevelScene2",
				"MainUI"
			},
			action = {
				say = {
					text = "또 숨어있던 적과 마주쳤어! 하지만 우리 함대의 <color=#ff7e00>회피 수치가 상승해 있다구</color> 쓸데없는 전투는 회피하는 거야!",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0,
						posY = 49,
						posX = 230
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "CharMoveEnd2"
				}
			}
		},
		CharMoveEnd2 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				say = {
					text = "<color=#ff7e00>회피</color>로 매복해 있던 적을 피하자!",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0,
						posY = 49,
						posX = 230
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/ambush_info/window/dodge_button"
				}
			}
		},
		13104 = {
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
					viewComponent = "LevelScene2",
					name = "LevelScene2"
				}
			}
		}
	}
}
