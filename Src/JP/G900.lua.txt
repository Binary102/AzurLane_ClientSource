return {
	id = 900,
	permit = true,
	nextId = 999,
	events = {
		LevelScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "この前の作戦で指揮官が大活躍したじゃない！上から第二艦隊の編成許可が下りたわ！",
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
					text = "編成では第二艦隊の編成もできるね。確定をタップして、編成画面に行くわよ",
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
					text = "右のボタンをタップして第二艦隊に切り替えるわ",
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
					text = "第二艦隊はここで編成するのよ",
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
			enabelGuild = true,
			viewComponent = "FormationUI",
			closeUI = true,
			action = {
				say = {
					text = "これからも期待してあげるわ！",
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
