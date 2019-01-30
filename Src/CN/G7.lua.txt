return {
	id = 7,
	nextId = 8,
	condition = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 1
		}
	},
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			uiWait = 3,
			redundancys = {
				"MainUI"
			},
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
			viewComponent = "LevelScene2",
			openUI = true,
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
					scale = 1.2,
					eventPath = "/LevelCamera/Canvas/UIMain/LevelGrid/plane/quads/chapter_cell_quad_4_6",
					path = "/LevelCamera/Canvas/UIMain/LevelGrid/plane/cells/chapter_cell_4_6",
					pos = {
						x = 223.6,
						y = 45.6
					},
					eulerAngles = {
						30,
						0,
						0
					}
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
			action = {}
		}
	}
}
