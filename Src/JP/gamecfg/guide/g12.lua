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
			text = "メイン画面に戻るわ",
			viewComponent = "AwardInfoLayer",
			action = {
				say = {
					text = "メイン画面に戻るわ",
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
				"AwardInfoUI(Clone)",
				"showAwards"
			}
		},
		EquipmentScene = {
			viewComponent = "EquipmentScene",
			action = {
				say = {
					text = "<color=#ff7e00>装備箱</color>を選んでね",
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
			action = {
				say = {
					text = "<color=#ff7e00>使用</color>で装備箱を開けるのよ",
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
