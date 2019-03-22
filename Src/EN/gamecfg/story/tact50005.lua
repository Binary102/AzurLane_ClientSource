return {
	id = "TACT50005",
	mode = 2,
	once = true,
	scripts = {
		{
			actor = 303021,
			side = 2,
			nameColor = "#a9f548",
			actorName = "{namecode:54}",
			say = "Choukai! We're here!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 303041,
			nameColor = "#a9f548",
			side = 1,
			say = "Sis, I've come to help!",
			actorName = "{namecode:56}",
			paintingFadeOut = {
				time = 0.5,
				side = 0
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			dir = 1,
			side = 2,
			say = "Having defeated Chicago's South Group, Kako and Kinugasa rejoined with Choukai's fleet to face Astoria and her sisters.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 303141,
			side = 2,
			nameColor = "#a9f548",
			actorName = "{namecode:69}",
			say = "Great. Furutaka, Aoba, keep firing. We're going to rebuild our lines and seize victory here and now!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actorName = "{namecode:55}&{namecode:53}",
			side = 0,
			actor = 303031,
			dir = 1,
			hideOther = true,
			nameColor = "#a9f548",
			say = "Understood!",
			subActors = {
				{
					actor = 303011,
					dir = 1,
					pos = {
						x = 650
					}
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		}
	}
}
