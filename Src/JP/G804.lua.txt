return {
	nextId = 899,
	id = 804,
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
			commonEvent = "combatBtn3"
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
					text = "前の画面に戻るわ",
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
					text = "<color=#ff7e00>委託</color>を確認するわ",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -109,
						posX = 322
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
					text = "<color=#ff7e00>委託</color>を確認するわ",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -109,
						posX = 322
					}
				},
				ui = {
					delay = 1,
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/right_chapter/event_btns/event_container/btn_special",
					fingerPos = {
						posY = -29,
						posX = 71
					}
				}
			}
		},
		LevelScene4 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "前の画面に戻るわ",
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
		EventListScene = {
			viewComponent = "EventListScene",
			action = {
				say = {
					text = "今受けることができる委託は全部表示されているわ。<color=#ff7e00>委託によって必要時間と報酬も違うわよ</color>",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 246,
						posX = -309
					}
				},
				newEvent = {
					viewComponent = "EventListScene",
					name = "EventListScene1"
				}
			}
		},
		EventListScene1 = {
			viewComponent = "EventListScene",
			action = {
				say = {
					text = "タップで詳細を確認してね",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.7,
						posY = 1,
						posX = 200
					}
				},
				ui = {
					delay = 0.4,
					childIndex = 0,
					childPath = "bgNormal$",
					path = "/UICamera/Canvas/UIMain/EventUI(Clone)/scrollRect$/content"
				},
				newEvent = {
					viewComponent = "EventListScene",
					name = "EventListScene2"
				}
			}
		},
		EventListScene2 = {
			viewComponent = "EventListScene",
			action = {
				say = {
					text = "条件を満たしている艦を配置すれば委託を遂行できるのよ",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 241,
						posX = -281
					}
				},
				newEvent = {
					viewComponent = "EventListScene",
					name = "EventListScene3"
				}
			}
		},
		EventListScene3 = {
			viewComponent = "EventListScene",
			action = {
				say = {
					text = "<color=#ff7e00>時間限定で出現する緊急委託</color>はここで表示されるのよ",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.7,
						posY = 68,
						posX = -386
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/blurPanel/lay/urgency_btn",
					triggerType = {
						2
					}
				},
				newEvent = {
					viewComponent = "EventListScene",
					name = "EventListScene4"
				}
			}
		},
		EventListScene4 = {
			finish = true,
			viewComponent = "EventListScene",
			closeUI = true,
			action = {
				say = {
					text = "<color=#ff7e00>緊急委託は戦闘中に随時出現する</color>から、時間制限には気をつけてね",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0.4,
						posY = 54,
						posX = -69
					}
				}
			}
		}
	}
}
