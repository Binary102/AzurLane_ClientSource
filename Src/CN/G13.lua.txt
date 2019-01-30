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
					text = "去看看现有的<color=#ff7e00>设计图纸</color>吧",
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
					text = "去看看现有的<color=#ff7e00>设计图纸</color>吧",
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
					text = "点击制作按钮<color=#ff7e00>制作装备</color>吧！",
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
					text = "就决定是你啦！点击确定按钮",
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
