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
					text = "<color=#ff7e00>「母港」</color>をタップしよう！",
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
					text = "みんなが住んでいる<color=#ff7e00>寮舎</color>はこっちよ",
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
					text = "ここは指揮官の<color=#ff7e00>寮舎</color>ね…まだボロボロだけど、コホン！",
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
					text = "<color=#ff7e00>寮舎に配置される艦</color>は<color=#ff7e00>食料を消費</color>するけど、<color=#ff7e00>コンディション</color>と<color=#ff7e00>経験値</color>が上がる！",
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
					text = "寮舎の家具は<color=#ff7e00>快適度</color>に影響するわ",
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
					text = "家具は家具ショップで<color=#ff7e00>コインで購入</color>できるわ",
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
					text = "寮舎に置く家具は<color=#ff7e00>管理</color>で設置できるわ",
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
					text = "<color=#ff7e00>食料</color>を追加するわ",
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
					text = "食糧庫に入れる食料は色々あるけど、<color=#ff7e00>一部は経験値増加効果</color>もあるっぽい…",
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
			retain = true,
			viewComponent = "BackyardGranaryLayer",
			action = {
				say = {
					text = "まずは酸素コーラを補充してね",
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
