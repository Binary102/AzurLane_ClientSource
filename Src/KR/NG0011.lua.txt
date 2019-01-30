return {
	id = "NG0011",
	events = {
		{
			action = {
				say = {
					text = "이번 작전에는 신규 시스템이 추가되었습니다. 관련 설명은 '도움말' 버튼을 눌러 확인하여 주시기 바랍니다.",
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
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"
				}
			}
		}
	}
}
