return {
	id = 900,
	permit = true,
	nextId = 999,
	events = {
		LevelScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "司令部对于指挥官在之前战斗中的表现十分赞赏，所以特批开放了第二舰队的编制权限，快跟着我来吧！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 9,
						posX = -18
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
					text = "前往编队界面编组第二舰队。点击确认直接前往编队界面",
					goScene = "BIANDUI",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 9,
						posX = -18
					}
				}
			}
		},
		FormationUI = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "点击右侧按钮，切换到第二舰队。指引点击右侧按钮",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 73,
						posX = 387
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/nextPage",
					fingerPos = {
						posY = -61,
						posX = 5
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI2"
				}
			}
		},
		FormationUI2 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "在这里就能编组第二舰队啦",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = 294
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI3"
				}
			}
		},
		FormationUI3 = {
			viewComponent = "FormationUI",
			enabelGuild = true,
			action = {
				say = {
					text = "战争已经正式打响了，想必接下来的战斗将会越来越艰辛吧，期待您更精彩的发挥哦！",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = 294
					}
				}
			}
		}
	}
}
