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
					text = "Commander, we've received a Distress Signal! Something terrible might've happened...",
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
					text = "Tap the Distress Signal button and search for the Signal's source!",
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
					text = "You found the source! Now, initiate a Rescue Mission immediately! If you dilly-dally, the Signal will disappear!",
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
					text = "You can tap the Help button for info on Anti-Sub combat!",
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
