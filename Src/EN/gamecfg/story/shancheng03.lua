return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "SHANCHENG03",
	fadein = 1.5,
	scripts = {
		{
			mode = 1,
			sequence = {
				{
					"Winter Offensive\n\n<size=45>3: A Lost Gift, Part 1</size>",
					1
				}
			}
		},
		{
			actor = 305020,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			actorName = "{namecode:79}",
			say = "W...Winter swimming? ...It's said that to become a witch...you must first purify your body with freezing winter waters...",
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
			actor = 305020,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			actorName = "{namecode:79}",
			say = "Lately it seems...we really have been somewhat lazy...",
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
			actor = 305020,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			actorName = "{namecode:79}",
			say = "My summer swimsuit...that the Commander gave me...",
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
			actor = 305020,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			actorName = "{namecode:79}",
			say = "I remember putting it here...",
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
			actorName = "{namecode:79}",
			side = 2,
			dir = 1,
			actor = 305020,
			nameColor = "#a9f548",
			say = "Eh? Why can't I find it?",
			flashout = {
				dur = 1,
				black = true,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
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
		}
	}
}
