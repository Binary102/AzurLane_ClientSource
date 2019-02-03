return {
	id = 30,
	nextId = 31,
	condition = {
		ChapterProxy,
		"getChapterCell",
		"=",
		true,
		{
			row = 4,
			column = 6,
			attachment = 6,
			flag = 0
		}
	},
	events = {
		MainUI = {
			text = "指挥官请点击<color=#ff7e00>出击</color>",
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
					text = "<color=#ff7e00>规避成功！</color>点击目标继续前进吧！",
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
		ChapterPreCombatLayer = {
			retain = true,
			viewComponent = "ChapterPreCombatLayer",
			action = {
				say = {
					text = "点击<color=#ff7e00>出击</color>进行战斗！",
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
				rockBack = 97,
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
