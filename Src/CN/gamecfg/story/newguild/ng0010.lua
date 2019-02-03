return {
	id = "NG0010",
	events = {
		{
			action = {
				say = {
					text = "围捕作战相关的内容可以点击帮助按钮查看详细说明",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 0
					}
				}
			}
		},
		{
			finish = true,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"
				}
			}
		}
	}
}
