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
			text = "<color=#ff7e00>출격</color>을 눌러봐.",
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			retain = true,
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "적 중요 함대 발견! 목표지점을 눌러서, 전투속행!",
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
					text = "계속해서 전진하는 거야!",
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
					text = "<color=#ff7e00>출격</color>을 눌러서 전투 준비!",
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
					text = "주력함대의 <color=#ff7e00>공중 지원</color> 준비 OK야!"
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
					text = "적을 쓸어버리자고! <color=#ff7e00>공중 지원</color> 버튼을 눌러봐!"
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
					text = "공중 지원의 힘을 봤지! 긴급 상황에서 사용하면 <color=#ff7e00>적의 탄막</color>을 없애는 효과도 있어!"
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
