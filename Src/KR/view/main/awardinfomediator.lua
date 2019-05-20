slot0 = class("AwardInfoMediator", import("..base.ContextMediator"))
slot0.ON_ITEM = "AwardInfoMediator:ON_ITEM"
slot0.ON_FURNITURE = "AwardInfoMediator:ON_FURNITURE"

function slot0.register(slot0)
	slot0:bind(slot0.ON_ITEM, function (slot0, slot1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_confirm",
			hideNo = true,
			content = "",
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = slot1,
				cfg = pg.item_data_statistics[slot1]
			},
			weight = LayerWeightConst.TOP_LAYER
		})
	end)
	slot0:bind(slot0.ON_FURNITURE, function (slot0, slot1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			yesText = "text_confirm",
			hideNo = true,
			content = "",
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_FURNITURE,
				id = slot1,
				cfg = pg.furniture_data_template[slot1]
			},
			weight = LayerWeightConst.TOP_LAYER
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()
end

return slot0
