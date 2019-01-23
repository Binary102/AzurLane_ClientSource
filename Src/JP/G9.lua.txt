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
					text = "旗艦ホーネットは海域に隠れてるわ。彼女さえ倒せばこっちの勝ちよ！",
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
					text = "その前にまず敵の偵察部隊を倒すのね。その部隊で艦隊の実力を試してみて",
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
					text = "ホーネットの出現位置を特定したわ！目標地点まで全速前進よ！",
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
					text = "失敗しちゃった…やるしかないわ！",
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
					text = "<color=#ff7e00>迂回の成功率は艦隊の合計回避力によって決まるのよ</color>。回避力が足りなければ失敗することもあるわ。",
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
			closeUI = true,
			action = {
				say = {
					text = "<color=#ff7e00>出撃</color>をタップして戦闘開始！    戦闘は<color=#ff7e00>艦ごとに燃料を消費する</color>のよ。",
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
			closeUI = true,
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
