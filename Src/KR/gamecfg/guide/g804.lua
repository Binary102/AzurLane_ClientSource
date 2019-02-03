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
					text = "이전 화면으로 돌아가자.",
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
					text = "<color=#ff7e00>의뢰</color>를 확인하자.",
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
					text = "<color=#ff7e00>의뢰</color>를 확인하자.",
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
					text = "이전 화면으로 돌아가자.",
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
					text = "지금 받을 수 있는 의뢰가 전부 표시되어 있어. <color=#ff7e00>의뢰에 따라 소요시간과 보상이 달라져.</color>",
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
					text = "눌러서 상세정보를 확인해봐.",
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
					text = "조건을 만족하는 함선을 배치하면 의뢰를 수행할 수 있어.",
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
					text = "<color=#ff7e00>제한시간이 존재하는 긴급 의뢰</color>는 여기에 표시돼.",
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
			viewComponent = "EventListScene",
			finish = true,
			action = {
				say = {
					text = "<color=#ff7e00>긴급 의뢰는 전투 중 가끔씩 발생</color>하니까, 제한 시간에 주의하도록 해.",
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
