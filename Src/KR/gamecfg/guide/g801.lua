return {
	nextId = 899,
	id = 801,
	permit = true,
	condition = {
		DormProxy,
		"getTrainShipCount",
		"=",
		0
	},
	events = {
		MainUI = {
			viewComponent = "MainUI",
			action = {
				say = {
					text = "우선은 <color=#ff7e00>모항</color> 을 연 다음",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.3,
						posY = -87.7,
						posX = -103.4
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
					path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/liveButton"
				},
				newEvent = {
					viewComponent = "MainUI",
					name = "MainUI2"
				}
			}
		},
		MainUI2 = {
			viewComponent = "MainUI",
			action = {
				say = {
					text = "<color=#ff7e00>숙소</color>를 터치하여 들어갈 수 있어!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.3,
						posY = 183,
						posX = -7.629
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/secondary_panel/frame/bg/backyard_btn"
				}
			}
		},
		BackYardGarnitureLayer3 = {
			viewComponent = "BackYardGarnitureLayer",
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "이전 화면으로 돌아가자.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/foodPanel/bg"
				},
				newEvent = {
					viewComponent = "BackYardScene",
					name = "BackYardScene"
				}
			}
		},
		BackYardScene = {
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "숙소에서 휴식하는 함선을 선택해. <color=#ff7e00>숙소에서 휴식하면 컨디션도 회복</color>돼.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.5,
						posY = -78,
						posX = -485
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/leftPanel/train_btn"
				}
			}
		},
		BackYardShipInfoLayer = {
			viewComponent = "BackYardShipInfoLayer",
			action = {
				say = {
					text = "<color=#ff7e00>함선을 추가로 배치</color>하자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.5,
						posY = 232,
						posX = -452
					}
				},
				ui = {
					childIndex = 0,
					path = "/OverlayCamera/Overlay/UIMain/main/frame/train_panel/scrollview/ships"
				}
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			retain = true,
			action = {
				say = {
					text = "휴식시키고 싶은 함선을 선택하도록 해.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -62,
						posX = -354
					}
				},
				ui = {
					delay = 0.6,
					childIndex = 0,
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships"
				},
				newEvent = {
					viewComponent = "DockyardScene",
					name = "SelectedShip"
				}
			}
		},
		SelectedShip = {
			viewComponent = "DockyardScene",
			action = {
				say = {
					text = "확인 버튼을 눌러줘.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -119,
						posX = 321
					}
				},
				ui = {
					delay = 1,
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button"
				}
			}
		},
		19003 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			endEvent = {
				{
					action = {
						say = {
							text = "수, 숙소에서 이상한 짓은 하지 말라고! ...그럼 아마존은 이만!",
							style = {
								dir = 1,
								mode = 2,
								alpha = 0.4,
								posY = 0,
								posX = 0
							}
						}
					}
				}
			},
			action = {}
		}
	}
}
