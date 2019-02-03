return {
	id = 99,
	nextId = 6,
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			redundancys = {
				"MainUI"
			},
			action = {
				say = {
					text = "ああ！作戦失敗…もう一回やるわ！今度こそ絶対に勝つわよ！",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.6,
						posY = -8,
						posX = -5
					}
				},
				newEvent = {
					viewComponent = "LevelScene2",
					name = "LevelScene3"
				}
			}
		},
		LevelScene3 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "確定ボタンで前の画面に戻るわ",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.4,
						posY = 212,
						posX = -219
					}
				},
				ui = {
					delay = 1,
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		13104 = {
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
					viewComponent = "LevelScene2",
					name = "LevelScene2"
				}
			}
		}
	}
}
