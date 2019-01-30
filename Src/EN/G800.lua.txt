return {
	nextId = 801,
	id = 800,
	permit = true,
	condition = {
		DormProxy,
		"hasFood",
		"=",
		true
	},
	events = {
		MainUI = {
			commonEvent = "backyardButton"
		},
		BackYardScene = {
			retain = true,
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "Commander, this is your <color=#ff7e00>dorm</color>~! It looks a bit... rough around the edges.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
					}
				},
				newEvent = {
					viewComponent = "BackYardScene",
					name = "BackYardScene2"
				}
			}
		},
		BackYardScene2 = {
			retain = true,
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "The dorm is where your girls can <color=#ff7e00>get some rest</color>, <color=#ff7e00>have their moods restored</color>, and earn <color=#ff7e00>EXP</color>. You'll need to have the required <color=#ff7e00>supplies</color>, however!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = -314
					}
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
					text = "Decorations will <color=#ff7e00>increase the comfort level</color> of your dorm.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.5,
						posY = 13,
						posX = -14,
						ui = {
							path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/topPanel/comfortable"
						}
					}
				},
				newEvent = {
					viewComponent = "BackYardScene",
					name = "backyardShop"
				}
			}
		},
		backyardShop = {
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "You may <color=#ff7e00>purchase decorations with Decor Tokens</color> in the furniture shop.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.5,
						posY = -105,
						posX = 394,
						ui = {
							delay = 1,
							childIndex = 0,
							path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/bottomPanel/shop_btn"
						}
					}
				},
				newEvent = {
					viewComponent = "BackYardScene",
					name = "backyardDecorate"
				}
			}
		},
		backyardDecorate = {
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "<color=#ff7e00>Use manage to rearrange decorations and furniture within the dorm.</color>",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.5,
						posY = -105,
						posX = 394,
						ui = {
							delay = 1,
							path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/decorateBtn"
						}
					}
				},
				newEvent = {
					viewComponent = "BackYardScene",
					name = "BackYardScene3"
				}
			}
		},
		BackYardScene3 = {
			retain = true,
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "Let's <color=#ff7e00>get some supplies</color>~!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0.5,
						posY = -112,
						posX = -134
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/BackYardUI(Clone)/main/bottomPanel/stock_bg",
					fingerPos = {
						posY = -23,
						posX = 97
					}
				}
			}
		},
		BackyardGranaryLayer = {
			retain = true,
			viewComponent = "BackyardGranaryLayer",
			action = {
				say = {
					text = "You can choose from a wide variety of <color=#ff7e00>high level snacks with EXP buff effects</color>.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.5,
						posY = 149,
						posX = -277
					}
				},
				ui = {
					delay = 1,
					path = "/OverlayCamera/Overlay/UIMain/foodPanel/frame",
					fingerPos = {
						posY = -52,
						posX = -336
					}
				},
				newEvent = {
					viewComponent = "BackyardGranaryLayer",
					name = "BackYardGarnitureLayer2"
				}
			}
		},
		BackYardGarnitureLayer2 = {
			viewComponent = "BackyardGranaryLayer",
			retain = true,
			openUI = true,
			action = {
				say = {
					text = "How about some Oxy-cola?",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.5,
						posY = 149,
						posX = -277
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/foodPanel/frame/scrollview/content/food_50001/icon_bg/icon",
					triggerType = {
						3
					}
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
					viewComponent = "BackYardGarnitureLayer",
					name = "BackYardGarnitureLayer3"
				}
			}
		}
	}
}
