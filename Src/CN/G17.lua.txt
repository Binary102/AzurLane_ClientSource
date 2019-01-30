return {
	id = 17,
	nextId = 20,
	condition = {
		BagProxy,
		"canUpgradeFlagShipEquip",
		"=",
		true
	},
	events = {
		MainUI = {
			commonEvent = "dockBtn",
			redundancys = {
				"BackShipInfo"
			}
		},
		DockyardScene = {
			viewComponent = "DockyardScene",
			action = {
				say = {
					text = "选择一名角色，查看她的详细情况",
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
			condition = {
				{
					"PreEvent",
					"=",
					"DockyardScene",
					3
				}
			},
			failEvent = {
				action = {
					newEvent = {
						viewComponent = "ShipInfoScene",
						name = "upgradeEquipment",
						isView = true
					}
				}
			},
			action = {
				say = {
					text = "点击<color=#ff7e00>装备</color>，查看她当前使用的装备",
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
					name = "upgradeEquipment1"
				}
			}
		},
		upgradeEquipment = {
			viewComponent = "ShipInfoScene",
			action = {
				say = {
					text = "现在对该<color=#ff7e00>装备强化</color>一次吧！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 82,
						posX = 356
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/ShipInfoUI2(Clone)/main/equipment_r",
					path = "/UICamera/Canvas/UIMain/ShipInfoUI2(Clone)/main/equipment_r/equipment/equipment_r2",
					fingerPos = {
						posY = -77,
						posX = 15
					}
				}
			}
		},
		upgradeEquipment1 = {
			viewComponent = "ShipInfoScene",
			action = {
				say = {
					text = "现在对该<color=#ff7e00>装备强化</color>一次吧！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 82,
						posX = 356
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/ShipInfoUI2(Clone)/main/equipment_r",
					delay = 0.3,
					path = "/UICamera/Canvas/UIMain/ShipInfoUI2(Clone)/main/equipment_r/equipment/equipment_r2",
					fingerPos = {
						posY = -77,
						posX = 15
					}
				}
			}
		},
		EquipmentInfoLayer = {
			viewComponent = "EquipmentInfoLayer",
			action = {
				say = {
					text = "确定强化",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 154,
						posX = -226
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/EquipmentInfoUI(Clone)/display/actions/action_button_2"
				}
			}
		},
		EquipUpgradeLayer = {
			viewComponent = "EquipUpgradeLayer",
			action = {
				say = {
					text = "这里会显示出<color=#ff7e00>强化后装备提升的属性！</color>",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 89,
						posX = 114
					}
				},
				newEvent = {
					viewComponent = "EquipUpgradeLayer",
					name = "EquipUpgradeLayer2"
				}
			}
		},
		EquipUpgradeLayer2 = {
			viewComponent = "EquipUpgradeLayer",
			openUI = true,
			action = {
				say = {
					text = "点击<color=#ff7e00>强化</color>开始强化",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.4,
						posY = 89,
						posX = 114
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/EquipUpgradeUI(Clone)/main/material_panel/start_btn"
				}
			}
		},
		20002 = {
			finish = true,
			action = {}
		}
	}
}
