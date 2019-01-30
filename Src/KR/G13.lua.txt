return {
	id = 13,
	nextId = 14,
	condition = {
		BagProxy,
		"getCanComposeCount",
		">",
		0
	},
	events = {
		AwardInfoLayer = {
			text = "关闭奖励界面",
			viewComponent = "AwardInfoLayer",
			action = {
				ui = {
					delay = 1,
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
			redundancys = {
				"MainUI",
				"EquipmentScene"
			},
			action = {
				say = {
					text = "다음은 <color=#ff7e00>설계도</color>를 확인해보자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -93,
						posX = 39
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/topItems/bottom_back/types/design",
					triggerType = {
						2,
						true
					}
				}
			}
		},
		MainUI = {
			commonEvent = "equipmentButton",
			redundancys = {
				"AwardInfoUI(Clone)"
			}
		},
		EquipmentScene = {
			viewComponent = "EquipmentScene",
			action = {
				say = {
					text = "다음은 <color=#ff7e00>설계도</color>를 확인해보자.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -93,
						posX = 39
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/topItems/bottom_back/types/design",
					triggerType = {
						2,
						true
					}
				}
			}
		},
		EquipmentDesignLayer = {
			viewComponent = "EquipmentDesignLayer",
			action = {
				say = {
					text = "<color=#ff7e00>제작</color> 버튼으로 장비를 제작하는 거야!",
					style = {
						dir = 2,
						mode = 2,
						alpha = 0,
						posY = -15,
						posX = -316
					}
				},
				ui = {
					scale = 0.8,
					path = "/UICamera/Canvas/UIMain/EquipmentUI2(Clone)/EquipmentDesignUI(Clone)/equipment_scrollview/equipment_grid/0/make_btn"
				}
			}
		},
		make_btn = {
			viewComponent = "EquipmentDesignLayer",
			openUI = true,
			action = {
				say = {
					text = "이걸로 정했다! 확인 버튼을 눌러봐.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 197,
						posX = -240
					}
				},
				ui = {
					scale = 1,
					path = "/OverlayCamera/Overlay/UIMain/msg_panel/msgbox/confirm_panel/ok_button"
				}
			}
		},
		20002 = {
			finish = true,
			action = {
				newEvent = {
					viewComponent = "TaskScene",
					name = "BackTask"
				}
			}
		}
	}
}
