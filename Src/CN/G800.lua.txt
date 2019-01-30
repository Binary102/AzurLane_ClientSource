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
			viewComponent = "MainUI",
			action = {
				say = {
					text = "让我们打开<color=#ff7e00>生活区</color>",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.3,
						posY = -87.7,
						posX = -103.4
					}
				},
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
					path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/liveButton"
				},
				newEvent = {
					viewComponent = "MainUI",
					name = "MainUI2"
				}
			}
		},
		MainUI2 = {
			viewComponent = "MainUI",
			action = {
				say = {
					text = "<color=#ff7e00>后宅</color>从这里进入哟",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.3,
						posY = 183,
						posX = -7.629
					}
				},
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/secondary_panel/frame/bg/backyard_btn"
				}
			}
		},
		BackYardScene = {
			retain = true,
			viewComponent = "BackYardScene",
			action = {
				say = {
					text = "这就是指挥官的<color=#ff7e00>后宅</color>啦~ 虽然现在看起来还很破旧..咳咳",
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
					text = "指挥官可以安排舰娘在<color=#ff7e00>后宅休息</color>，将能够<color=#ff7e00>回复心情</color>并且还能<color=#ff7e00>获得角色经验</color>，但需要<color=#ff7e00>消耗存粮</color>哟",
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
					text = "后宅布置的<color=#ff7e00>家具会影响舒适度</color>",
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
					text = "在商店内，可通过<color=#ff7e00>家居币购买新家具</color>",
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
					text = "<color=#ff7e00>管理可对后宅家具进行排布与改变</color>",
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
					text = "我们来<color=#ff7e00>添加存粮</color>吧~",
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
					text = "这里展示了多种食物可选择，<color=#ff7e00>高级食材还有附带经验值加成奖励</color>",
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
					text = "点击第一个可乐添加一次食粮",
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
