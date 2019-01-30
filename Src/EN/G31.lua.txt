return {
	nextId = 33,
	id = 31,
	condition = {
		ChapterProxy,
		"getChapterCell",
		"=",
		true,
		{
			row = 4,
			column = 7,
			attachment = 8,
			flag = 0
		}
	},
	condition_1 = {
		ChapterProxy,
		"inChapterLine",
		"=",
		true,
		{
			row = 4,
			column = 6
		}
	},
	events = {
		MainUI = {
			text = "Commander, please Tap <color=#ff7e00>Attack</color>.",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			openUI = true,
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "Enemy flagship ahead! Tap the target to continue moving!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -127,
						posX = 249
					}
				},
				ui = {
					scale = 1.2,
					eventPath = "/LevelCamera/Canvas/UIMain/LevelGrid/plane/quads/chapter_cell_quad_4_7",
					path = "/LevelCamera/Canvas/UIMain/LevelGrid/plane/cells/chapter_cell_4_7",
					pos = {
						x = 348.5,
						y = 45.52
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
