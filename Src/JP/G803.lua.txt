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
					text = "出撃海域を閉じるのよ",
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
					text = "次は<color=#ff7e00>デイリーチャレンジ</color>だわ",
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
					text = "次は<color=#ff7e00>デイリーチャレンジ</color>だわ",
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
					text = "出撃海域を閉じるのよ",
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
					text = "<color=#ff7e00>デイリーチャレンジの内容は日替わりよ。内容によって報酬も違うわ</color>",
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
					text = "タップすると報酬の詳細を確認できるわ",
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
			finish = true,
			viewComponent = "DailyLevelScene",
			closeUI = true,
			action = {
				say = {
					text = "<color=#ff7e00>難易度の高いチャレンジほど報酬も良くなる</color>けど、まずは自分の実力に合ったチャレンジに挑戦した方がいいわ",
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
