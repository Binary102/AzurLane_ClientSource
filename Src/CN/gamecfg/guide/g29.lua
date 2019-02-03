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
			text = "指挥官请点击<color=#ff7e00>出击</color>",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "这次我们的舰队已经比较完善啦~一定可以击破大黄蜂的！",
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
					text = "索敌结果显示了大黄蜂可能出现的位置，让我们朝着目标点前进吧~",
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
					text = "可恶，又遭到了敌方舰队的拦截！但是我们的<color=#ff7e00>总机动值已经提高</color>，轻而易举的就能避开这种无谓的战斗",
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
					text = "点击<color=#ff7e00>规避</color>轻松甩掉他们的拦截吧！",
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
