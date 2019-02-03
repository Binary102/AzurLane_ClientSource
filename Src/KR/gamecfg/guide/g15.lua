return {
	id = 15,
	nextId = 17,
	condition = {
		BayProxy,
		"getEquipment2ByflagShip",
		"=",
		false
	},
	events = {
		AwardInfoLayer = {
			text = "关闭奖励界面",
			viewComponent = "AwardInfoLayer",
			action = {
				ui = {
					delay = 0.3,
					path = "/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)",
					fingerPos = {
						posY = -230,
						posX = 151
					}
				},
				newEvent = {
					viewComponent = "AwardInfoLayer",
					name = "AwardInfoUI1"
				}
			}
		},
		AwardInfoUI1 = {
			viewComponent = "AwardInfoLayer",
			action = {
				say = {
					text = "다음은 장비의 장착이네.",
					style = {
						dir = 1,
						mode = 1,
						alpha = 0,
						posY = -24,
						posX = 25
					}
				},
				newEvent = {
					viewComponent = "TaskScene",
					name = "AwardInfoUI(Clone)2"
				}
			}
		},
		["AwardInfoUI(Clone)2"] = {
			viewComponent = "TaskScene",
			action = {
				say = {
					text = "우선 메인 화면으로 돌아가자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 173,
						posX = -375
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/title/back"
				}
			}
		},
		MainUI = {
			commonEvent = "dockBtn",
			redundancys = {
				"AwardInfoUI(Clone)2",
				"AwardInfoUI(Clone)",
				"AwardInfoLayer"
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			action = {
				say = {
					text = "함선을 눌러서 상세 정보를 확인해줘.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -62,
						posX = -490
					}
				},
				ui = {
					delay = 0.4,
					childIndex = "*",
					path = "/UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships"
				}
			}
		},
		ShipInfoScene = {
			viewComponent = "ShipInfoScene",
			action = {
				say = {
					text = "<color=#ff7e00>장비</color> 버튼을 눌러서, 지금 장착 중인 장비를 확인할 수 있어.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -110,
						posX = -402
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/common/toggles/equpiment_toggle",
					triggerType = {
						2
					},
					fingerPos = {
						posY = -68,
						posX = 65
					}
				},
				newEvent = {
					viewComponent = "ShipInfoScene",
					name = "addEquipment"
				}
			}
		},
		addEquipment = {
			viewComponent = "ShipInfoScene",
			action = {
				say = {
					text = "여기서는 장착 중인 장비를 전부 확인할 수 있지!",
					style = {
						dir = 1,
						mode = 1,
						alpha = 0,
						posY = -116,
						posX = 34
					}
				},
				newEvent = {
					viewComponent = "ShipInfoScene",
					name = "addEquipment2"
				}
			}
		},
		addEquipment2 = {
			viewComponent = "ShipInfoScene",
			action = {
				say = {
					text = "<color=#ff7e00>장비 슬롯</color>을 눌러서 새로운 장비를 장착할 수 있어.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 84,
						posX = 373
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/ShipInfoUI2(Clone)/main/equipment_r",
					path = "/UICamera/Canvas/UIMain/ShipInfoUI2(Clone)/main/equipment_r/equipment/equipment_r2",
					fingerPos = {
						posY = -73,
						posX = 86
					}
				}
			}
		},
		EquipmentScene = {
			viewComponent = "EquipmentScene",
			action = {
				say = {
					text = "방금 제작한 장비를 선택해봐.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 150,
						posX = -297
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/EquipmentUI2(Clone)/equipment_scrollview/equipment_grid/0"
				}
			}
		},
		EquipmentInfoLayer = {
			viewComponent = "EquipmentInfoLayer",
			openUI = true,
			action = {
				say = {
					text = "장착 버튼을 누르도록 해.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 41,
						posX = 133
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/EquipmentInfoUI(Clone)/replace/actions/action_button_2",
					fingerPos = {
						posY = -15,
						posX = 106
					}
				}
			}
		},
		12007 = {
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
