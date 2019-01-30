return {
	fadeOut = 1.5,
	mode = 2,
	noWaitFade = true,
	once = true,
	id = "GUOQING12",
	fadeType = 1,
	fadein = 1.5,
	scripts = {
		{
			actor = 301201,
			actorName = "{namecode:24}",
			side = 2,
			nameColor = "#ff0000",
			say = "The target... is really powerful... huh. Obviously, I'm not as strong as those frontline assault types.",
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
			say = "I’m sorry, {namecode:95}’s safety is at risk. There's no time to play, let's finish it now.",
			actorName = "{namecode:96}",
			actor = 307061,
			nameColor = "#a9f548",
			paintingFadeOut = {
				time = 0.5,
				side = 1
			},
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
			actor = 301201,
			actorName = "{namecode:24}",
			side = 1,
			nameColor = "#ff0000",
			say = "Indeed, you are a tough one...but {namecode:24} is done yet...",
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
			actor = 301201,
			actorName = "{namecode:24}",
			side = 1,
			nameColor = "#ff0000",
			say = "Carriers or whatnot... they’ve also been sunk before... probably...",
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
		}
	}
}
