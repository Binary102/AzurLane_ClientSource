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
					text = "点击<color=#ff7e00>建造队列</color>查看建造进程",
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
					text = "重型舰船的建造时间会更久一些",
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
					text = "再次使用<color=#ff7e00>快速建造道具</color>吧！",
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
					text = "点击确定按钮",
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
					text = "已经完成建造 点击<color=#ff7e00>下水仪式</color>",
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
