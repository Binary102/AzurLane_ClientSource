return {
	mode = 3,
	noWaitFade = true,
	once = true,
	id = "UI20101",
	scripts = {
		{
			nameColor = "#a9f548",
			bgName = "bg_story_6",
			actor = 107021,
			bgspeed = 2,
			blackBg = true,
			side = 0,
			say = "<size=28>Stand your ground. Don't fire unless fired upon</size>\n<size=22>坚守阵地。在敌人没有开枪射击以前，不要先开枪</size>",
			effects = {
				{
					active = true,
					name = "UIhuohua"
				}
			}
		},
		{
			actor = 107021,
			nameColor = "#a9f548",
			side = 0,
			blackBg = true,
			say = "<size=28>But if they mean to have a war</size>\n<size=22>但是，如果敌人硬要把战争强加在我们头上</size>"
		},
		{
			actor = 107021,
			nameColor = "#a9f548",
			side = 0,
			blackBg = true,
			say = "<size=28>Let it begin here! </size>\n<size=22>那么，就让战争从这儿开始吧！</size>"
		},
		{
			mode = 1,
			sequenceSpd = 2,
			bgFade = true,
			effects = {
				{
					active = false,
					name = "UIhuohua"
				}
			},
			sequence = {
				{
					[[
          第二章   珊瑚之海 <size=23>Coral Sea</size> 



]],
					2
				}
			}
		}
	}
}
