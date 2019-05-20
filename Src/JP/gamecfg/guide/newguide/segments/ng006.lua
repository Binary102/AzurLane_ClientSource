return {
	id = "NG006",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "まずは「購入」で明石のお店からネコハコを入手するわ！",
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
