return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "ZHUNUO7",
	fadein = 1.5,
	scripts = {
		{
			actorShadow = true,
			side = 0,
			actorName = "아덴트 & 아카스타",
			actor = 201034,
			dir = -1,
			hideOther = true,
			nameColor = "#a9f548",
			say = "         글로리어스씨!",
			subActors = {
				{
					actor = 201024,
					dir = -1,
					pos = {
						x = -750
					}
				}
			},
			painting = {
				alpha = 0.3,
				time = 0.2
			}
		},
		{
			actor = 207064,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "과연 메탈 블러드의 정예 함대… 아니, 피해를 이 정도까지 막으며 철수할 수 있었으니, 저도 꽤 노력했네요… 그것보다 아덴트, 아카스타, 수송선 호위로 돌아가세요! 자기 임무를 잊어서는 안 되죠!!",
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
			actor = 201034,
			nameColor = "#a9f548",
			side = 1,
			dir = 1,
			say = "이대로라면 글로리어스씨가…!",
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
			actor = 207064,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "괜찮아요. 이래봬도 저, 꽤 튼튼하답니다!",
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
			actor = 207064,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "(라고 큰소리는 쳤지만, 다시 전투를 했다가는…)",
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
