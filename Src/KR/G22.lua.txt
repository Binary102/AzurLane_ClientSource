return {
	nextId = 24,
	id = 22,
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
				"MainUI",
				"BuildShipScene"
			},
			action = {
				say = {
					text = "중형함 건조는 소형함보단 시간이 걸리네...",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 132,
						posX = 233
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
					text = "<color=#ff7e00>고속건조재</color>를 한 번 더 쓰는 거야!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 6,
						posX = -25
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
					text = "확인 버튼을 눌러.",
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
					text = "건조가 완료됐어! <color=#ff7e00>진수식</color>을 눌러!",
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
