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
			text = "指挥官请点击<color=#ff7e00>出击</color>",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "敌方旗舰出现！点击目标继续战斗！",
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
					text = "点击前进按钮继续前进吧！",
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
					text = "我方旗舰的<color=#ff7e00>航空支援</color>已准备完毕 "
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
					text = "清除战场准备！点击<color=#ff7e00>航空支援</color>按钮试试吧！"
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
					text = "看到空中支援的威力了吧！ 紧急情况下释放，还能<color=#ff7e00>消除敌方弹幕</color>呢！"
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
