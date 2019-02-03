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
					text = "호넷을 쓰러뜨리다니, 과연 내가 눈여겨본 인재답네!",
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
					action = {
						say = {
							text = "하지만 이런 상황에선 나도 원래 함대로 돌아가야만 해... 나머지는 지휘관 자신이 극복해보는 거야!",
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
