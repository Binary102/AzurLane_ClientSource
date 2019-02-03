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
					text = "次は兵装の装備ね",
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
					text = "まずはメイン画面に戻るわ",
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
					text = "艦をタップして、詳細を確認してちょうだい",
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
					text = "<color=#ff7e00>装備</color>ボタンをタップして、今装備中の兵装を確認するのよ",
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
					text = "ここでは装備中の兵装を全部確認できるわ！",
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
					text = "<color=#ff7e00>装備枠</color>をタップして、新しい装備を装備できる",
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
					text = "今製作した装備を選択してね",
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
			action = {
				say = {
					text = "装備ボタンをタップよ",
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
