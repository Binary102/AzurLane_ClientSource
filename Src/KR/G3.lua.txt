return {
	nextId = 5,
	id = 3,
	condition = {
		BuildShipProxy,
		"getActiveOrFinishedCount",
		"=",
		1
	},
	verify = {
		action = {
			newEvent = {
				viewComponent = "BuildShipDetailLayer",
				name = "12009",
				data = {
					result = 0
				}
			}
		},
		condition = {
			BuildShipProxy,
			"getActiveCount",
			"=",
			1
		}
	},
	events = {
		MainUI = {
			commonEvent = "buildButton"
		},
		BuildShipScene = {
			viewComponent = "BuildShipScene",
			action = {
				say = {
					text = "<color=#ff7e00>건조중</color>을 눌러서 건조 상태를 확인할 수 있어!",
					style = {
						dir = -1,
						mode = 2,
						posY = -91,
						posX = -385
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/blur_container/left_length/toggles/queue_btn",
					triggerType = {
						2,
						true
					}
				}
			}
		},
		BuildShipDetailLayer = {
			viewComponent = "BuildShipDetailLayer",
			redundancys = {
				"BuildShipScene",
				"MainUI"
			},
			action = {
				say = {
					text = "함선의 건조에는 시간이 걸리는데...",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 188,
						posX = -50
					}
				},
				newEvent = {
					viewComponent = "BuildShipDetailLayer",
					name = "SpeedUpBuild"
				}
			}
		},
		SpeedUpBuild = {
			viewComponent = "BuildShipDetailLayer",
			action = {
				say = {
					text = "더는 못 기다려! <color=#ff7e00>고속건조</color>를 눌러서 빨리 완성시키자!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 17,
						posX = -31
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/BuildShipDetailUI1(Clone)/list_single_line/content/project_1/frame/buiding/quick_btn",
					verify = {
						action = {
							newEvent = {
								viewComponent = "BuildShipDetailLayer",
								name = "finishBtn"
							}
						}
					}
				}
			}
		},
		MsgboxUI = {
			viewComponent = "MsgboxUI",
			action = {
				say = {
					text = "확인을 눌러서 <color=#ff7e00>고속건조재</color>를 쓰자!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 111,
						posX = 81
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)",
					verify = {
						closePath = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_2(Clone)",
						action = {
							newEvent = {
								viewComponent = "BuildShipDetailLayer",
								name = "finishBtn"
							}
						}
					}
				}
			}
		},
		finishBtn = {
			viewComponent = "BuildShipDetailLayer",
			finish = true,
			action = {
				say = {
					text = "건조가 완료됐어! 진수식으로 함선을 맞이하자!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -37,
						posX = -76
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/BuildShipDetailUI1(Clone)/list_single_line/content/project_1/frame/finished/launched_btn"
				}
			}
		},
		12009 = {
			viewComponent = "BuildShipDetailLayer",
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			action = {}
		}
	}
}
