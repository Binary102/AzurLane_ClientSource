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
					text = "Commander! You defeated Hornet! You're really good at this!",
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
							text = "Something bad has happened though... I need to return back to my fleet. We'll see each other again, I'm sure of it!",
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
