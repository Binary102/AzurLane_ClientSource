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
					text = "指挥官居然打败了大黄蜂，真不愧是我所看中的人才呀~",
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
							text = "不过居然发生了这样的突发情况，我也必须先回自己的所属舰队报到去了，后面就看你的啦~将来一定还有机会再见哒！",
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
