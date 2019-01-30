return {
	id = 12,
	nextId = 13,
	condition = {
		BagProxy,
		"getBoxCount",
		">",
		0
	},
	events = {
		AwardInfoLayer = {
			text = "关闭奖励界面",
			viewComponent = "AwardInfoLayer",
			action = {
				ui = {
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
			text = "返回主界面",
			viewComponent = "AwardInfoLayer",
			action = {
				say = {
					text = "返回到主界面",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 170,
						posX = -380
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/title/back"
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
					text = "点击<color=#ff7e00>选择科技箱</color>",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = -50,
						posX = 150
					}
				},
				ui = {
					delay = 0.4,
					childIndex = "#",
					path = "/UICamera/Canvas/UIMain/EquipmentUI2(Clone)/item_scrollview/item_grid",
					pos = {
						y = 198
					}
				}
			}
		},
		ItemInfoLayer = {
			viewComponent = "ItemInfoLayer",
			openUI = true,
			action = {
				say = {
					text = "点击<color=#ff7e00>使用</color>打开科技箱",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 208,
						posX = 129
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/ItemInfoUI(Clone)/window/panel/actions/use_button"
				}
			}
		},
		15003 = {
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
					viewComponent = "AwardInfoLayer",
					name = "AwardInfoLayer",
					isView = true
				}
			}
		}
	}
}
