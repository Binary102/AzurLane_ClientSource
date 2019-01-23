return {
	id = 807,
	permit = true,
	nextId = 899,
	events = {
		MainUI = {
			viewComponent = "MainUI",
			action = {
				say = {
					text = "【研究】機能が開放されました！",
					style = {
						posY = -63,
						mode = 2,
						alpha = 0.4,
						dir = 1,
						posX = 65
					}
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
				ui = {
					tweenPath = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel",
					path = "/UICamera/Canvas/UIMain/MainUI(Clone)/bottomPanel/buttons_container/technologyButton"
				}
			}
		},
		SelectTechnologyLayer = {
			viewComponent = "SelectTechnologyLayer",
			action = {
				say = {
					text = "【科学研究】では、研究項目を進めることで強化ユニットを含むレアアイテムを入手可能！",
					style = {
						posY = 122,
						mode = 2,
						alpha = 0.4,
						dir = -1,
						posX = -26
					}
				},
				newEvent = {
					viewComponent = "SelectTechnologyLayer",
					name = "SelectTechnologyLayer2"
				}
			}
		},
		SelectTechnologyLayer2 = {
			viewComponent = "SelectTechnologyLayer",
			action = {
				say = {
					text = "【開発ドック】では、任務をクリアすることで新規艦を開発することが出来ます！",
					style = {
						posY = 64,
						mode = 2,
						alpha = 0.4,
						dir = 1,
						posX = -90
					}
				},
				newEvent = {
					viewComponent = "SelectTechnologyLayer",
					name = "SelectTechnologyLayer3"
				}
			}
		},
		SelectTechnologyLayer3 = {
			viewComponent = "SelectTechnologyLayer",
			finish = true,
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/SelectTechnologyUI(Clone)/frame/bg/blueprint_btn"
				}
			}
		}
	}
}
