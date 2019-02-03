return {
	id = 900,
	permit = true,
	nextId = 999,
	events = {
		LevelScene2 = {
			viewComponent = "LevelScene2",
			action = {
				say = {
					text = "저번 작전에서 지휘관이 대활약했잖아! 상부로부터 제2함대의 편성 허가가 나왔어!",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 9,
						posX = -18
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
					text = "편성에선 제2함대의 편성도 가능해. 확인을 눌러서 편성 화면으로 가자.",
					goScene = "BIANDUI",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 9,
						posX = -18
					}
				}
			}
		},
		FormationUI = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "오른쪽의 버튼을 눌러서 제2함대로 바꿀 수 있어.",
					style = {
						dir = 1,
						mode = 2,
						alpha = 0.2,
						posY = 73,
						posX = 387
					}
				},
				ui = {
					path = "/UICamera/Canvas/UIMain/FormationUI(Clone)/nextPage",
					fingerPos = {
						posY = -61,
						posX = 5
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI2"
				}
			}
		},
		FormationUI2 = {
			viewComponent = "FormationUI",
			action = {
				say = {
					text = "제2함대는 여기서 편성하는 거야.",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = 294
					}
				},
				newEvent = {
					viewComponent = "FormationUI",
					name = "FormationUI3"
				}
			}
		},
		FormationUI3 = {
			viewComponent = "FormationUI",
			enabelGuild = true,
			action = {
				say = {
					text = "앞으로도 기대해주겠어!",
					style = {
						dir = -1,
						mode = 2,
						alpha = 0,
						posY = 177,
						posX = 294
					}
				}
			}
		}
	}
}
