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
			say = "<size=28>\"Stand your ground. Don't fire unless fired upon.</size>\n<size=22>──자리를 지키도록 해. 선제 사격은 금물이야.\"</size>",
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
			say = "<size=28>\"But if they mean to have a war.</size>\n<size=22>──다만, 저들이 전쟁을 하길 원한다면,\"</size>"
		},
		{
			actor = 107021,
			nameColor = "#a9f548",
			side = 0,
			blackBg = true,
			say = "<size=28>\"Let it begin here! </size>\n<size=22>이 자리에서 시작해보자고!\"</size>"
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
          제2장 출전! 산호해 <size=23>Coral Sea</size> 



]],
					2
				}
			}
		}
	}
}
