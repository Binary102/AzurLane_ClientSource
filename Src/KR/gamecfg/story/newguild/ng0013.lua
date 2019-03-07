return {
	id = "NG0013",
	events = {
		{
			action = {
				say = {
					text = "「주회 모드」가 개방됐어! 도움말을 클릭해 자세한 내용을 확인해줘!",
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
