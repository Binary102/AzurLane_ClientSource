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
					text = "红方的旗舰大黄蜂一定就藏在这片海域的某处，只要击沉她的话就可以压制海域了！",
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
					text = "在这之前，我们需要先击破对方派出拦截的侦查部队，就先拿他们试试指挥官的能力",
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
					text = "索敌结果显示了大黄蜂可能出现的位置，让我们朝着目标点前进吧~",
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
					text = "哎呀~规避失败啦，只能硬着头皮上啦！",
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
					text = "<color=#ff7e00>舰队的总机动值将影响规避的结果</color>，如果机动值不足，很容易出现规避失败的情况噢",
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
					text = "点击<color=#ff7e00>出击</color>进行战斗！    出击需要<color=#ff7e00>消耗石油，消耗值取决于出战角色</color>",
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
