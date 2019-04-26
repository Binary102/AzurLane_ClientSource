return {
	id = "NG0013",
	events = {
		{
			action = {
				say = {
					text = "The new Clearing Mode feature has arrived! See more details by tapping the \"Help\" button!",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -100
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/stage_info/panel/loop_button/help_button",
					fingerPos = {
						posY = -35,
						posX = 40
					}
				}
			}
		}
	}
}
