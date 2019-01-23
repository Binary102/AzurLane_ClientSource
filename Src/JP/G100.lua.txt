return {
	id = 100,
	nextId = 101,
	events = {
		MainUI = {
			commonEvent = "combatBtn"
		},
		LevelScene2 = {
			viewComponent = "LevelScene2",
			finishEvent = true,
			finish = true,
			action = {
				say = {
					text = "ホーネットを倒せたなんて、流石私が見込んだ逸材ね！",
					style = {
						posY = -21,
						mode = 2,
						alpha = 0.6,
						posX = -31
					}
				}
			},
			endEvent = {
				{
					viewComponent = "LevelScene2",
					closeUI = true,
					action = {
						say = {
							text = "でもこの状況じゃ私も原隊に戻らないと…あとは指揮官自身で乗り越えるのよ！",
							style = {
								posY = -21,
								mode = 2,
								alpha = 0.6,
								posX = -31
							}
						}
					}
				}
			}
		}
	}
}
