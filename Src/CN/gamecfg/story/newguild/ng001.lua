return {
	id = "NG001",
	events = {
		{
			action = {
				say = {
					text = "指挥官，我们收到了一条求救信号，一定是某个地方发生了不得了的事情",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 200
					}
				}
			}
		},
		{
			action = {
				say = {
					text = "点击求救信号，就能查找到信号是从哪片海域发送出来的",
					style = {
						posY = -110,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = 200
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/right_chapter/btn_signal"
				}
			}
		},
		{
			action = {
				say = {
					text = "当信号强度越强，可以搜索的海域范围就越大，可以获得的奖励也会变得更加丰厚噢",
					style = {
						posY = -70,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -190
					}
				}
			}
		},
		{
			action = {
				say = {
					text = "让我们试着搜索一下信号的来源吧",
					style = {
						posY = -70,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -190
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/rescue_select/panel/start_button"
				}
			}
		},
		{
			code = 1,
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/Msgbox(Clone)/window/button_container/custom_button_1(Clone)"
				}
			}
		},
		{
			code = 1,
			action = {
				say = {
					text = "我们找到了信号来源，快赶过去救助船队吧，如果一直没有救助，我们会失去这条信号",
					style = {
						posY = 0,
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
					path = "/UICamera/Canvas/UIMain/LevelUI2(Clone)/float/levels/Chapter_305/sub",
					fingerPos = {
						posY = -47,
						posX = -62.97
					}
				}
			}
		},
		{
			action = {
				say = {
					text = "我们发现这片海域有敌方潜艇出没，出击前请指挥官确认下是否携带了反潜设备",
					style = {
						posY = -65,
						mode = 1,
						alpha = 0.4,
						dir = 1,
						posX = -135
					}
				}
			}
		}
	}
}
