return {
	id = "NG001",
	events = {
		{
			action = {
				say = {
					text = "Commander, we've received a Distress Signal! Something terrible might've happened...",
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
					text = "Tap the Distress Signal button and search for the Signal's source!",
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
					text = "Also, I've heard that increasing your Signal Sensitivity lets you locate Signals in later Chapters...",
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
					text = "But that comes later! For now, just search for the source of that Distress Signal!",
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
					text = "You found the source! Now, initiate a Rescue Mission immediately! If you dilly-dally, the Signal will disappear!",
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
					text = "You will run into enemy Submarines during Rescue Missions! Make sure you bring ships with the gear and stats needed to fight them!",
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
