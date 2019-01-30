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
			text = "Commander, please Tap <color=#ff7e00>Attack</color>.",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "Enemy flagship ahead! Tap the target to keep fighting!",
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
					text = "Tap go to continue moving!",
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
			viewComponent = "ChapterPreCombatLayer",
			retain = true,
			redundancys = {
				"AwardInfoUI(Clone)",
				"LevelScene2",
				"MainUI"
			},
			action = {
				say = {
					text = "Tap <color=#ff7e00>Battle</color> to start the battle!",
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
			action = {
				ui = {
					hide = true,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl"
				}
			}
		},
		ShowSkill3 = {
			viewComponent = "BattleGuideWave",
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
			action = {
				say = {
					text = "Our flagship's <color=#ff7e00>air support</color> is ready. "
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ListenerSkill3"
				}
			}
		},
		ListenerSkill3 = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "Clear the battlefield! Get ready for <color=#ff7e00>air support</color>!"
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
			action = {
				say = {
					text = "Witness the power of our fighters! Use them when you need a leg up. They can also <color=#ff7e00>destroy enemy barrages</color>!"
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
