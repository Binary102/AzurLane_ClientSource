return {
	fadeOut = 1.5,
	mode = 2,
	noWaitFade = true,
	once = true,
	id = "GUOQING8",
	fadeType = 1,
	fadein = 1.5,
	scripts = {
		{
			side = 0,
			actorName = "{namecode:96}",
			blackBg = true,
			actor = 900028,
			nameColor = "#a9f548",
			say = "Sister {namecode:95}, look what we found! This is the key to the \"Sanctuary\"!",
			shake = {
				speed = 1,
				number = 3
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
			side = 1,
			actorName = "{namecode:95}",
			blackBg = true,
			actor = 900027,
			nameColor = "#a9f548",
			say = "This...where did you find it?",
			shake = {
				speed = 1,
				number = 3
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
			side = 0,
			actorName = "{namecode:96}",
			blackBg = true,
			actor = 900028,
			nameColor = "#a9f548",
			say = "Hehe, if you’re talking about the intel, then of course the credit goes to {namecode:11}! You won’t refuse me this time~ will you?",
			shake = {
				speed = 1,
				number = 3
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
			side = 1,
			actorName = "{namecode:95}",
			blackBg = true,
			actor = 900027,
			nameColor = "#a9f548",
			say = "If the intel is true, then we have to act now! Have everyone mobilized immediately.",
			shake = {
				speed = 1,
				number = 3
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
			side = 0,
			actorName = "{namecode:96}",
			blackBg = true,
			actor = 900028,
			nameColor = "#a9f548",
			say = "This time, we will expose their plans!",
			shake = {
				speed = 1,
				number = 3
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
			nameColor = "#a9f548",
			side = 2,
			actor = 307061,
			actorName = "{namecode:96}",
			say = "Come to think of it, perhaps this trap was part of their plan all along…",
			flashout = {
				black = true,
				dur = 1.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 2,
				black = true,
				dur = 1.5,
				alpha = {
					1,
					0
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
		},
		{
			actor = 307061,
			actorName = "{namecode:96}",
			side = 2,
			nameColor = "#a9f548",
			say = "Damn, will we ever escape from their scheme?",
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
