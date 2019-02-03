return {
	id = 5,
	nextId = 6,
	condition = {
		FleetProxy,
		"getFirstFleetShipCount",
		"=",
		2
	},
	events = {
		NewShipLayer = {
			viewComponent = "NewShipLayer",
			action = {
				ui = {
					path = "OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/click",
					fingerPos = {
						posY = -123,
						posX = 395
					}
				}
			}
		},
		MsgboxUI = {
			viewComponent = "MsgboxUI",
			redundancys = {
				"NewShipLayerExit"
			},
			action = {
				say = {
					text = "얻은 함선을 <color=#ff7e00>잠금</color>해두는 걸 잊지 않도록 해.",
					commonStyle = "newShip",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 145,
						posX = 78
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		["custom_button_1(Clone)"] = {
			viewComponent = "NewShipLayer",
			action = {
				say = {
					text = "메인 화면으로 돌아가자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 167,
						posX = -439
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/blur_container/top/back"
				}
			}
		},
		NewShipLayerExit = {
			viewComponent = "NewShipLayer",
			action = {
				newEvent = {
					viewComponent = "NewShipLayer",
					name = "custom_button_1(Clone)"
				}
			}
		},
		MainUI = {
			commonEvent = "formationButton",
			redundancys = {
				"NewShipLayerExit",
				"custom_button_1(Clone)",
				"MsgboxUI",
				"NewShipLayer"
			}
		},
		FormationUI = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "여기는 함대를 편성하는 곳이야. 기본적으로는 지휘관이 원하는 대로 편성할 수 있지만...",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.1,
						posY = 204,
						posX = 251
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI2"
				}
			}
		},
		FormationUI2 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "<color=#ff7e00>구축함, 경순양함, 중순양함</color>은 선봉함대에만 편성할 수 있어.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.1,
						posY = 204,
						posX = 251
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI3"
				}
			}
		},
		FormationUI3 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "<color=#ff7e00>항공모함, 전함</color>은 주력함대에만 편성할 수 있지.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.1,
						posY = 205,
						posX = -216
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI4"
				}
			}
		},
		FormationUI4 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "<color=#ff7e00>편성</color>으로 다른 함선을 추가해보자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 123,
						posX = 203
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/GridFrame/vanguard_2/tip"
				}
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			retain = true,
			action = {
				say = {
					text = "우선 함대에 편입시킬 함선을 선택해.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -62,
						posX = -354
					}
				},
				ui = {
					delay = 0.4,
					childIndex = "#",
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
			retain = true,
			action = {
				say = {
					text = "다음은 <color=#ff7e00>확인</color> 버튼을 눌러.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = -119,
						posX = 321
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/select_panel/confirm_button"
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "BackFormation"
				}
			}
		},
		BackFormation = {
			viewComponent = "FormationUI",
			uiWait = 1,
			retain = true,
			action = {
				say = {
					text = "함대에 새로운 멤버가 편성됐어. 이걸로 함대의 전력이 한층 상승했어.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 169,
						posX = 105
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "BackMainScene2"
				}
			}
		},
		BackMainScene2 = {
			viewComponent = "FormationUI",
			openUI = true,
			action = {
				say = {
					text = "메인 화면으로 한번 돌아가자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 179,
						posX = -488
					}
				},
				ui = {
					delay = 1,
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/blur_container/top/title/back"
				}
			}
		},
		12103 = {
			finish = true,
			condition = {
				{
					"result",
					"=",
					0,
					2
				}
			},
			action = {
				newEvent = {
					viewComponent = "MainUI",
					name = "MainUI"
				}
			}
		}
	}
}
