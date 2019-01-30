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
					text = "우선은 <color=#ff7e00>모항</color> 을 연 다음",
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
					text = "<color=#ff7e00>숙소</color>를 터치하여 들어갈 수 있어!",
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
					text = "여기는 지휘관의 <color=#ff7e00>숙소</color>야... 아직은 너덜너덜하지만, 크흠!",
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
					text = "<color=#ff7e00>숙소에 배치된 함선</color>은<color=#ff7e00>음식을 소비</color>하지만, <color=#ff7e00>컨디션</color>과 <color=#ff7e00>경험치</color>가 상승해!",
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
					text = "숙소의 가구는 <color=#ff7e00>쾌적도</color>에 영향을 줘.",
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
					text = "가구는 가구샵에서 <color=#ff7e00>코인으로 구입</color>할 수 있어.",
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
					text = "숙소에 두는 가구는 <color=#ff7e00>관리</color>에서 배치할 수 있어.",
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
					text = "<color=#ff7e00>음식</color>을 추가하자.",
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
					text = "식량 창고에 들어가는 음식은 여러 가지지만, <color=#ff7e00>그중 일부는 경험치 추가 효과</color>도 있는 것 같아...",
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
					text = "우선 산소 콜라를 보충하도록 해.",
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
