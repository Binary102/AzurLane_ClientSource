return {
	id = "NG0010",
	events = {
		{
			action = {
				say = {
					text = "특수 유닛의 나포에 관해선 도움말 버튼을 눌러 설명을 확인할 수 있어!",
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
