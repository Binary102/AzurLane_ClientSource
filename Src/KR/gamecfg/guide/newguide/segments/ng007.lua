return {
	id = "NG007",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "혹독한 '훈련' 을 성공적으로 마치면, 지휘냥이 냥박스에서 나오게 된다냥!",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 0
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/right_panel/commanders/box/boxes_btn"
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "훈련칸을 정해줘냥!",
				mode = 1,
				dir = 1,
				posY = -110,
				posX = 0
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/frame/boxes/mask/content/frame/idle/consume/start_btn"
			}
		},
		{
			ui = {
				customSize = true,
				scale = 1.5,
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/buildpool_panel/frame/bg/content/list/2",
				triggerType = {
					2
				}
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/buildpool_panel/frame/bg/confirm_btn"
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/box_msg_panel/frame/confirm_btn"
			}
		},
		{
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/box_panel/frame/close_btn"
			}
		}
	}
}
