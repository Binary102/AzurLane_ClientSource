return {
	id = 8,
	nextId = 9,
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
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "기함인 호넷은 해역 어딘가에 숨어있어. 그녀만 해치우면 우리의 승리야!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
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
						posY = 177,
						posX = -314
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
					text = "매복해 있던 적의 함대와 조우했어! 매복해 있던 적과 조우 시 요격할지 선택할 수 있어.",
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
					text = "일단은 우회해서 전투 <color=#ff7e00>회피</color>를 시험해봐.",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
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
					viewComponent = "ChapterPreCombatLayer",
					name = "ChapterPreCombatLayer3"
				}
			}
		}
	}
}
