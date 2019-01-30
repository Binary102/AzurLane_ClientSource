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
					text = "지휘관, 구조신호를 받았어! 분명 어딘가에 무슨 일이 생긴 거야!",
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
					text = "구조신호를 터치하면 신호가 어느 해역에서 발송된 건지 확인할 수 있어",
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
					text = "신호 위치가 확인되었으니 어서 구조함대를 보내자고! 만약 계속 구하러 가지 않으면 이 신호를 놓치고 말 거야!",
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
					text = "잠수함 전투에 관련된 더 자세한 내용은 '도움말' 버튼을 터치하여 알아볼 수 있어~",
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
