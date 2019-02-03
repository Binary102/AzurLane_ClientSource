return {
	nextId = 100,
	id = 33,
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
			column = 7
		}
	},
	events = {
		MainUI = {
			text = "<color=#ff7e00>出撃</color>をタップしてね",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "敵中枢艦隊発見！目標地をタップして、戦闘継続！",
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
		["AwardInfoUI(Clone)"] = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "引き続き前進するわよ！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -45,
						posX = 420
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/func_button",
					fingerPos = {
						posY = -66,
						posX = 36
					}
				}
			}
		},
		ChapterPreCombatLayer = {
			retain = true,
			closeUI = true,
			viewComponent = "ChapterPreCombatLayer",
			redundancys = {
				"AwardInfoUI(Clone)",
				"LevelScene2",
				"MainUI"
			},
			action = {
				say = {
					text = "<color=#ff7e00>出撃</color>をタップして戦闘準備！",
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
		BattleScene = {
			viewComponent = "BattleScene",
			closeUI = true,
			action = {
				ui = {
					hide = true,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl"
				}
			}
		},
		ShowSkill3 = {
			viewComponent = "BattleGuideWave",
			closeUI = true,
			action = {
				ui = {
					hide = false,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ReleaseBefore"
				}
			}
		},
		ReleaseBefore = {
			viewComponent = "BattleGuideWave",
			closeUI = true,
			action = {
				say = {
					text = "主力艦隊の<color=#ff7e00>航空攻撃</color>は準備OKよ！"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ListenerSkill3"
				}
			}
		},
		ListenerSkill3 = {
			viewComponent = "BattleGuideWave",
			closeUI = true,
			action = {
				say = {
					text = "敵を一掃するわ！<color=#ff7e00>航空攻撃</color>ボタンをタップしてみて！"
				},
				ui = {
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl",
					triggerType = {
						3
					}
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ReleaseAfter"
				}
			}
		},
		ReleaseAfter = {
			viewComponent = "BattleGuideWave",
			closeUI = true,
			action = {
				say = {
					text = "航空攻撃のちからを見たか！緊急時に使用すると、<color=#ff7e00>敵の弾幕</color>を消す効果もあるわ！"
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
