return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "SHENGDAN08",
	fadein = 1.5,
	scripts = {
		{
			mode = 1,
			sequence = {
				{
					"사랑과 평화의 성야제\n\n<size=30>제8장 - 메리 크리스마스!</size>",
					1
				}
			}
		},
		{
			side = 2,
			dir = 1,
			say = "모항 - 집무실",
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
			actor = 900060,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "헤헤, 그러고 보니 지휘관에겐 아직 이 말을 안 해줬지? 메리 크리스마스!",
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
			actor = 0,
			side = 0,
			withoutPainting = true,
			dir = 1,
			nameColor = "#a9f548",
			say = "……",
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
			actor = 900060,
			side = 2,
			nameColor = "#a9f548",
			dir = -1,
			say = "엘드릿지도, 메리 크리스마스!",
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
			actor = 900054,
			nameColor = "#a9f548",
			side = 0,
			dir = 1,
			say = "메리이, 크리스마스 (두 번째)",
			paintingFadeOut = {
				time = 0.5,
				side = 1
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
			actor = 900060,
			side = 1,
			nameColor = "#a9f548",
			dir = -1,
			say = "이야~ 그래도 진짜 좋은 사진들이 찍혔어! 엄청 좋은 추억들로 가득해! 봐봐, 지휘관~",
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
			actor = 900058,
			side = 2,
			nameColor = "#a9f548",
			dir = -1,
			say = "헬로~! 모두의 아이돌, 샌디에이고야! 지휘관에게 노래를 전해주러 왔어!",
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
			actor = 900056,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			actorName = "{namecode:79}",
			say = "와앗! 사, 사람들이 되게 많아요!",
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
			say = "지히간의 집무실에 사람이 잔뜩~ 노라조~!",
			side = 0,
			nameColor = "#a9f548",
			dir = -1,
			actor = 900059,
			actorName = "{namecode:33}",
			paintingFadeOut = {
				time = 0.5,
				side = 1
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
			actor = 900057,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "우으… 후드 언니한테 \"귀여우니까 지휘관에게도 보여주고 오세요\" 라고 떠밀려서……",
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
			actor = 900057,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "에? 모두… 왜 여기에?",
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
			actor = 0,
			side = 2,
			withoutPainting = true,
			dir = 1,
			nameColor = "#a9f548",
			say = "……",
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
			actor = 900060,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "그렇구나! 지휘관이 아직 집무실에서 수고하는 걸 보고, 만나러 온 거야!",
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
			actor = 900055,
			nameColor = "#a9f548",
			side = 1,
			dir = -1,
			say = "언제나 노력하는 아이에게도 선물을 전해줘야 겠… 음?",
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
			actorShadow = true,
			side = 0,
			actorName = "모두",
			actor = 900057,
			hideOther = true,
			nameColor = "#a9f548",
			say = "아, 엔터프라이즈다.",
			subActors = {
				{
					actor = 900056,
					pos = {
						x = 370
					}
				},
				{
					actor = 900059,
					pos = {
						x = 750
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
		},
		{
			actor = 900055,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "엔터프라이즈가 아니다. '산타클로스' 다. 자, 선물을 못 받은 아이들의 몫도 여기 있다고.",
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
			actor = 900057,
			nameColor = "#a9f548",
			side = 1,
			dir = 1,
			say = "와아~ 고마워요……",
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
			actor = 900056,
			nameColor = "#a9f548",
			side = 1,
			dir = 1,
			actorName = "{namecode:79}",
			say = "에? 제 것도 있어요? 고, 고맙……",
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
			actor = 900059,
			nameColor = "#a9f548",
			side = 1,
			dir = 1,
			actorName = "{namecode:33}",
			say = "무츠키는 사탕 먹고 시퍼!",
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
			actor = 900055,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "물론, 지휘관에게도. 메리 크리스마스다.",
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
			actor = 0,
			side = 2,
			withoutPainting = true,
			dir = 1,
			nameColor = "#a9f548",
			say = "！！",
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
			actor = 900057,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "지휘관, 메리 크리스마스… 지가 입은 크리스마스 의상…… 어때유?",
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
			actor = 0,
			side = 2,
			withoutPainting = true,
			dir = 1,
			nameColor = "#a9f548",
			say = "！！！",
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
			actorShadow = true,
			side = 0,
			actorName = "{namecode:79}&{namecode:33}",
			actor = 900059,
			hideOther = true,
			nameColor = "#a9f548",
			say = "지휘관, 메리 크리스마스! (지히간~ 메리 크리슈마수!)",
			subActors = {
				{
					actor = 900056,
					pos = {
						x = 685
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
		},
		{
			actor = 900056,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			actorName = "{namecode:79}",
			say = "후소 언니가 모처럼 준비해준 크리스마스 의상이니까 꼭 나으리한테 보여주는 게 좋다고 해서……",
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
			actor = 0,
			side = 2,
			withoutPainting = true,
			dir = 1,
			nameColor = "#a9f548",
			say = "！！！！",
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
			actor = 900060,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "오오! 지금 지휘관 표정 좋아~ 찰칵!",
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
			side = 2,
			dir = 1,
			actor = 900060,
			nameColor = "#a9f548",
			say = "응응! 그래서, 모처럼 모두가 와줬으니까, 기념으로 단체 사진이나 찍자고!",
			flashout = {
				dur = 0.35,
				black = false,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 0.5,
				black = false,
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
			actor = 900060,
			side = 2,
			nameColor = "#a9f548",
			dir = 1,
			say = "…자! 그럼, 하나 두울~ 셋! 치~즈!",
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
			side = 2,
			dir = 1,
			actor = 900060,
			nameColor = "#a9f548",
			say = "헤헤, 그리들리! 해피~ '사랑과 평화의 성야제', 크리스마스 이브야!",
			flashout = {
				dur = 0.35,
				black = false,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 0.5,
				black = false,
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
			actor = 900058,
			nameColor = "#a9f548",
			side = 1,
			dir = 1,
			say = "그럼 마지막은 이 샌디에이고님이~ 크리스마스 노래를 불러줄게!",
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
			actor = 900060,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "앗…! 잠ㄲ……",
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
			actor = 900058,
			nameColor = "#a9f548",
			side = 2,
			dir = 1,
			say = "<size=40>라~~~~~~~</size>",
			dialogShake = {
				speed = 0.09,
				x = 15,
				number = 10
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		}
	}
}
