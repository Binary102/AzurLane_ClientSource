return {
	id = "NG006",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "首先通过“预订”从{namecode:98}的商店获取喵箱！",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 0
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/right_panel/commanders/box/reserve_btn"
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/buy_panel/frame/bg1/Button"
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/box_msg_panel/frame/confirm_btn"
			}
		},
		{
			waitScene = "AwardInfoLayer",
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)",
				fingerPos = {
					posY = -225.3,
					posX = 256.86
				}
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/buy_panel/bg"
			}
		}
	}
}
