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
			text = "메인 화면으로 돌아가자.",
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
			text = "메인 화면으로 돌아가자.",
			viewComponent = "AwardInfoLayer",
			action = {
				say = {
					text = "메인 화면으로 돌아가자.",
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
					text = "<color=#ff7e00>장비 상자</color>를 선택해봐.",
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
					text = "<color=#ff7e00>사용</color> 버튼으로 장비 상자를 열 수 있어.",
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
