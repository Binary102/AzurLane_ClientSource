return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "NAERWEIKE2",
	fadein = 1.5,
	scripts = {
		{
			actor = 401181,
			nameColor = "#a9f548",
			side = 1,
			dir = -1,
			say = "ハンスちゃん、ただいま戻りました☆",
			bgm = "level02",
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
			actor = 401181,
			side = 1,
			nameColor = "#a9f548",
			dir = -1,
			say = "はぁ…疲れちゃったよぉ…峡湾の向こうに要塞はなかったよ",
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
			expression = 2,
			nameColor = "#a9f548",
			side = 0,
			dir = 1,
			actor = 401021,
			say = "情報は間違いだったか……お疲れさま",
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
			actor = 401191,
			side = 1,
			nameColor = "#a9f548",
			dir = 1,
			say = "ティーレ、占領のほうは上手く行ったわ",
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
			actor = 401021,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "キュンネもお疲れさま",
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
			actor = 401181,
			side = 1,
			nameColor = "#a9f548",
			dir = -1,
			say = "もうティーレったらつれないな…任務が無事完了したし、ここは笑顔で勝利を祝わなくっちゃ！",
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
			actor = 401021,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "レーベくんではあるまいし。それに、まだ気を抜ける時ではない",
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
			actor = 401211,
			side = 1,
			nameColor = "#a9f548",
			dir = 1,
			say = "でも、もう占領自体が成功したんじゃないの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			},
			action = {
				{
					y = 30,
					type = "shake",
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 2,
			nameColor = "#a9f548",
			side = 0,
			dir = 1,
			actor = 401021,
			say = "問題はこのあとよ。こちらは回航の燃料補給もままならない。そして…",
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
			actor = 401181,
			side = 1,
			nameColor = "#a9f548",
			dir = -1,
			say = "ロイヤルはこのままわたしたちを放っておかないってことね",
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
			actor = 401021,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "ええ。ロイヤルもこの港を欲しがっている。……昨日シャルンホルストさんたちが向こうのレナウンと交戦したし、おととい、ヒッパーさんも敵駆逐艦により大ダメージを受けた",
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
			expression = 2,
			nameColor = "#a9f548",
			side = 0,
			dir = 1,
			actor = 401021,
			say = "おそらくは……向こうはすぐにでも駆けつけてくるでしょう",
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
			actor = 401211,
			side = 1,
			nameColor = "#a9f548",
			dir = 1,
			say = "ふん！来るなら来い！鉄血駆逐艦の力を見せてやるわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			},
			action = {
				{
					y = 30,
					type = "shake",
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 1,
			nameColor = "#a9f548",
			side = 0,
			dir = 1,
			actor = 401021,
			say = "ええ、今は敵に備えて休んだほうがいい",
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
			actor = 401021,
			side = 0,
			nameColor = "#a9f548",
			dir = 1,
			say = "タンカーは一度に二隻しか同時補給できないから。ええ、みんな、ローテションを組んで動くように",
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
			actor = 401181,
			dir = -1,
			hideOther = true,
			actorName = "みんな",
			say = "はい！",
			subActors = {
				{
					actor = 401191,
					dir = -1,
					pos = {
						x = -450
					}
				},
				{
					actor = 401211,
					dir = -1,
					pos = {
						x = 450
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
