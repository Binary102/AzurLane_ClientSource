return {
	id = 9,
	nextId = 10,
	condition = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 3,
			attachment = 5,
			flag = 0
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
					name = "LevelScene3"
				}
			}
		},
		LevelScene3 = {
			retain = true,
			uiWait = 1,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "그전에 일단 적의 정찰부대를 해치워야겠네. 편성을 마친 함대의 실력을 시험해봐.",
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
				}
			}
		},
		ChapterPreCombatLayer3 = {
			viewComponent = "ChapterPreCombatLayer",
			retain = true,
			redundancys = {
				"SelectEnemy",
				"LevelScene3",
				"LevelScene2",
				"MainUI"
			},
			action = {
				say = {
					text = "실패해버렸어... 쓰러뜨릴 수밖에 없어!",
					style = {
						posY = -109,
						mode = 2,
						alpha = 0.4,
						posX = 406
					}
				},
				newEvent = {
					viewComponent = "ChapterPreCombatLayer",
					name = "ChapterPreCombatLayer2"
				}
			}
		},
		ChapterPreCombatLayer2 = {
			retain = true,
			uiWait = 1,
			viewComponent = "ChapterPreCombatLayer",
			action = {
				say = {
					text = "<color=#ff7e00>우회의 성공률은 함대의 합계 회피력에 의해서 결정돼.</color> 회피력이 부족하면 실패할 수도 있어.",
					style = {
						posY = -109,
						mode = 2,
						alpha = 0.4,
						posX = 406
					}
				},
				newEvent = {
					viewComponent = "ChapterPreCombatLayer",
					name = "ChapterPreCombatLayer"
				}
			}
		},
		ChapterPreCombatLayer = {
			retain = true,
			viewComponent = "ChapterPreCombatLayer",
			action = {
				say = {
					text = "<color=#ff7e00>출격</color>을 눌러서 전투 개시! 전투는 <color=#ff7e00>함선마다 연료를 소모</color>하게 돼.",
					style = {
						posY = -109,
						mode = 2,
						alpha = 0.4,
						posX = 406
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/ChapterPreCombatUI(Clone)/right/start"
				}
			}
		},
		40004 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				},
				{
					"score",
					">",
					1,
					1
				}
			},
			branch = {
				rockBack = 98,
				condition = {
					{
						"result",
						"=",
						0,
						2
					},
					{
						"score",
						"<=",
						1,
						1
					},
					{
						"_timeout",
						"=",
						false,
						6
					}
				}
			},
			action = {}
		}
	}
}
