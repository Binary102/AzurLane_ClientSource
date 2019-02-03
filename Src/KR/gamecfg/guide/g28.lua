return {
	id = 28,
	nextId = 29,
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
			text = "<color=#ff7e00>출격</color>을 눌러.",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			uiWait = 3,
			action = {
				say = {
					text = "이 정도의 함대라면 분명 호넷을 쓰러뜨릴 수 있어!",
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
					name = "LevelScene2-1"
				}
			}
		},
		["LevelScene2-1"] = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				ui = {
					eventPath = "/LevelCamera/Canvas/UIMain/LevelGrid/plane/quads/chapter_cell_quad_4_6",
					scale = 1.2,
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
			openUI = true,
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
