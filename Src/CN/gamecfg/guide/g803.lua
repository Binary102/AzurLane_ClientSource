return {
	nextId = 899,
	id = 803,
	permit = true,
	verify = {
		condition = {
			ChapterProxy,
			"getActiveChapter",
			"~="
		}
	},
	events = {
		MainUI = {
			commonEvent = "combatBtn2"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			verify = {
				continue = {
					condition = {
						ChapterProxy,
						"inWarTime",
						"=",
						true
					},
					action = {
						newEvent = {
							viewComponent = "LevelScene2",
							name = "closeLevel"
						}
					}
				},
				action = {
					newEvent = {
						viewComponent = "LevelScene2",
						name = "LevelScene3"
					}
				}
			},
			action = {
				say = {
					text = "关闭章节界面",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 54,
						posX = -69
					}
				},
				ui = {
					path_1 = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)",
					path = "/OverlayCamera/Overlay/UIMain/top/top_stage/back_button",
					condition = {
						ChapterProxy,
						"isInVaildFleet",
						"=",
						true
					},
					clickCondition = {
						ChapterProxy,
						"checkNextFleet",
						"=",
						true
					},
					action = {
						newEvent = {
							viewComponent = "LevelScene2",
							name = "LevelScene4"
						}
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene3"
				}
			}
		},
		closeLevel = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "前往<color=#ff7e00>每日副本</color>",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -109,
						posX = 104
					}
				},
				ui = {
					delay = 1,
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)",
					fingerPos = {
						posY = -29,
						posX = 71
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
					text = "前往<color=#ff7e00>每日副本</color>",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -106,
						posX = 104
					}
				},
				ui = {
					delay = 1,
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/right_chapter/daily_button",
					fingerPos = {
						posY = -35,
						posX = 74
					}
				}
			}
		},
		LevelScene4 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "关闭章节界面",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -106,
						posX = 104
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/top_stage/back_button"
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene3"
				}
			}
		},
		DailyLevelScene = {
			viewComponent = "DailyLevelScene",
			action = {
				say = {
					text = "<color=#ff7e00>每日副本的时间开启时间不同，副本内容与奖励也不同</color>",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 51,
						posX = 275
					}
				},
				newEvent = {
					viewComponent = "DailyLevelScene",
					name = "DailyLevelScene1"
				}
			}
		},
		DailyLevelScene1 = {
			viewComponent = "DailyLevelScene",
			action = {
				say = {
					text = "点击可查看副本奖励",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 51,
						posX = 275
					}
				},
				ui = {
					childIndex = "%",
					path = "/UICamera/Canvas/UIMain/DailyLevelUI(Clone)/list"
				},
				newEvent = {
					viewComponent = "DailyLevelScene",
					name = "DailyLevelScene2"
				}
			}
		},
		DailyLevelScene2 = {
			viewComponent = "DailyLevelScene",
			finish = true,
			action = {
				say = {
					text = "<color=#ff7e00>副本难度不同，奖励也不同，</color>指挥官要量力而行哦，在下告辞啦~",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.3,
						posY = -27,
						posX = -58
					}
				}
			}
		}
	}
}
