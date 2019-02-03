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
			say = "<size=22>Hold your positions! Don't fire unless fired upon!</size>",
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
			say = "<size=22>But if they mean to have a war...</size>"
		},
		{
			actor = 107021,
			nameColor = "#a9f548",
			side = 0,
			blackBg = true,
			say = "<size=22>Let it begin!</size>"
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
          Chapter 2 - <size=29>Battle of Coral Sea</size>  



]],
					2
				}
			}
		}
	}
}
