return {
	id = "S002",
	events = {
		{
			alpha = 0.422,
			code = 2,
			style = {
				text = "前往查看<color=#ffde38>建造</color>详情！",
				mode = 1,
				dir = 1,
				posY = -132.4,
				posX = 423.25
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/buildButton",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -16.5,
					posX = 33.83
				}
			}
		},
		{
			code = 2,
			waitScene = "BuildShipScene",
			alpha = 0.316,
			style = {
				text = "点击<color=#ffde38>建造队列</color>查看建造进程",
				mode = 1,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/BuildShipUI(Clone)/left_length/frame/tagRoot/queue_btn",
				triggerType = {
					2
				},
				fingerPos = {
					posY = -26.75,
					posX = 58.13
				}
			}
		},
		{
			alpha = 0.316,
			code = 2,
			style = {
				text = "已经完成建造 点击下水仪式",
				mode = 1,
				dir = -1,
				posY = 95.46,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				scale = 1.25,
				path = "/UICamera/Canvas/UIMain/BuildShipDetailUI1(Clone)/list_single_line/content/project_1/frame/finished/launched_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -26.75,
					posX = 58.13
				}
			}
		}
	}
}