pg = pg or {}
pg.share_template = {
	{
		description = "#벽람항로",
		name = "个人信息界面",
		deck = 1,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 1,
		qrcode_location = {
			-412,
			-261
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/AdmiralUI(Clone)/top",
			"UICamera/Canvas/UIMain/AdmiralUI(Clone)/left_panel/replace_btn",
			"UICamera/Canvas/UIMain/AdmiralUI(Clone)/left_panel/L2D_btn",
			"UICamera/Canvas/UIMain/AdmiralUI(Clone)/right_panel/btn_share"
		}
	},
	{
		description = "#벽람항로",
		name = "档案界面",
		deck = 2,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 2,
		qrcode_location = {
			412,
			-261
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/ShipProfileUI(Clone)/detail_left_panel",
			"UICamera/Canvas/UIMain/ShipProfileUI(Clone)/bottom",
			"UICamera/Canvas/UIMain/ShipProfileUI(Clone)/top",
			"UICamera/Canvas/UIMain/ShipProfileUI(Clone)/detail_right_panel/eva_btn",
			"UICamera/Canvas/UIMain/ShipProfileUI(Clone)/detail_right_panel/view_btn",
			"UICamera/Canvas/UIMain/ShipProfileUI(Clone)/detail_right_panel/share_btn"
		}
	},
	{
		description = "#벽람항로",
		name = "获得新舰娘界面",
		deck = 2,
		camera = "OverlayCamera",
		id = 3,
		qrcode_location = {
			412,
			-261
		},
		hidden_comps = {
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/New",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/property_btn",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/left_panel",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/right_panel",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/ship_type/stars",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/dialogue"
		},
		show_comps = {
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/ship_type",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/nation",
			"OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/rarity"
		},
		move_comps = {
			{
				y = -95,
				x = 16,
				path = "OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/ship_type"
			},
			{
				y = -10,
				x = 0,
				path = "OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/paint"
			}
		}
	},
	{
		description = "#벽람항로",
		name = "后宅",
		deck = 2,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 4,
		qrcode_location = {
			412,
			-261
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/top",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/main/addExpBtn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/addEnergyBtn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/stock_bg",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/buffListPanel",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/stock_bg",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/main/shop_btn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/main/train_btn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/main/floor_btn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/main/stock_bg",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/main/share_btn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/decorateBtn",
			"UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/back"
		}
	},
	{
		description = "#벽람항로",
		name = "获得新皮肤界面",
		deck = 2,
		move_comps = "",
		camera = "OverlayCamera",
		show_comps = "",
		id = 5,
		qrcode_location = {
			412,
			261
		},
		hidden_comps = {
			"OverlayCamera/Overlay/UIMain/NewSkinUI(Clone)/shake_panel/New",
			"OverlayCamera/Overlay/UIMain/NewSkinUI(Clone)/shake_panel/left_panel",
			"OverlayCamera/Overlay/UIMain/NewSkinUI(Clone)/shake_panel/set_skin_btn"
		}
	},
	{
		description = "#벽람항로",
		name = "玩家历程界面",
		deck = 3,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 6,
		qrcode_location = {
			-412,
			-261
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/PlayerSummaryUI(Clone)/bg/main/pages/page5/share"
		}
	},
	{
		description = "#벽람항로",
		name = "拍照分享",
		deck = 1,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 7,
		qrcode_location = {
			-412,
			-261
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/SnapshotShareUI(Clone)/BtnPanel"
		}
	},
	{
		description = "#벽람항로",
		name = "回流纪念信",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 8,
		qrcode_location = {
			-412,
			-261
		}
	},
	{
		description = "#벽람항로",
		name = "获得新指挥喵界面",
		deck = 2,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 9,
		qrcode_location = {
			412,
			-261
		},
		hidden_comps = {
			"/UICamera/Canvas/UIMain/GetCommanderUI(Clone)/left_panel/btns/lock",
			"/UICamera/Canvas/UIMain/GetCommanderUI(Clone)/left_panel/btns/share"
		}
	},
	{
		description = "#벽람항로",
		name = "画图功能分享",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 10,
		qrcode_location = {
			-412,
			-261
		}
	},
	{
		description = "#벽람항로",
		name = "获得新舰娘界面之科研彩皮",
		deck = 2,
		hidden_comps = "",
		move_comps = "",
		camera = "OverlayCamera",
		show_comps = "",
		id = 11,
		qrcode_location = {
			412,
			-261
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11
	}
}

return
