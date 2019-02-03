return {
	id = 808,
	permit = true,
	nextId = 899,
	events = {
		LevelScene2 = {
			viewComponent = "LevelScene2",
			updateIndex = true,
			openUI = true,
			action = {
				say = {
					text = "指挥官，我们收到了一条求救信号，一定是某个地方发生了不得了的事情",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 200
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_1"
				}
			}
		},
		LevelScene2_1 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				say = {
					text = "点击求救信号，就能查找到信号是从哪片海域发送出来的",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 200
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_2"
				}
			}
		},
		LevelScene2_2 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/right_chapter/btn_signal"
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_2_1"
				}
			}
		},
		LevelScene2_2_1 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/rescue_select/panel/start_button"
				}
			}
		},
		MsgboxUI = {
			viewComponent = "MsgboxUI",
			openUI = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_3"
				}
			}
		},
		LevelScene2_3 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				say = {
					text = "我们找到了信号来源，快赶过去救助船队吧，如果一直没有救助，我们会失去这条信号",
					style = {
						posY = 0,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 0
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_4"
				}
			}
		},
		LevelScene2_4 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/float/levels/Chapter_305/sub",
					fingerPos = {
						posY = -47,
						posX = -62.97
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_5"
				}
			}
		},
		LevelScene2_5 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				ui = {
					delay = 0.2,
					path = "/OverlayCamera/Overlay/UIMain/stage_info/panel/start_button"
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_6"
				}
			}
		},
		LevelScene2_6 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/fleet_select/panel/start_button"
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_7"
				}
			}
		},
		LevelScene2_7 = {
			viewComponent = "LevelScene2",
			openUI = true,
			action = {
				say = {
					text = "潜艇战斗相关的内容可以点击帮助按钮查看更详细的内容",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 0
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene2_8"
				}
			}
		},
		LevelScene2_8 = {
			viewComponent = "LevelScene2",
			finish = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"
				}
			}
		}
	}
}
