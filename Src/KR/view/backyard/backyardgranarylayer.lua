slot0 = class("BackyardGranaryLayer", import("..base.BaseUI"))
slot0.foodIds = {
	50001,
	50002,
	50003,
	50004,
	50005,
	50006
}
slot0.EXTEND_LESS_4 = 5
slot0.EXTEND_OVER_3 = 6

function slot0.getUIName(slot0)
	return "BackYardGranaryUI"
end

function slot0.setTrainShipVOs(slot0, slot1)
	slot0.addExpShipVOs = slot1
end

function slot0.setIsRemind(slot0, slot1)
	slot0.remindEndTime = slot1
end

function slot0.setFoodVOs(slot0, slot1)
	slot0.foodVOs = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.foodVOs[slot6.id] = slot6
	end
end

function slot0.setDormVO(slot0, slot1)
	if not slot0.isPress then
		slot0.dormVO = slot1

		slot0:updateDrom()
	end
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.init(slot0)
	slot0.eventTriggers = {}
	slot0.foodPanel = slot0:findTF("foodPanel")
	slot0.foodsContent = slot0:findTF("frame/scrollview/content", slot0.foodPanel)
	slot0.foodTpl = slot0:findTF("frame/scrollview/foodtpl", slot0.foodPanel)
	slot0.extendBtn = slot0:findTF("frame/top/extend_btn", slot0.foodPanel)
	slot0.paint = findTF(slot0.foodPanel, "paint/lenggui")
	slot0.shopPanel = slot0:findTF("shopPanel")
	slot0.foodName = slot0:findTF("frame/name", slot0.shopPanel)
	slot0.foodDesc = slot0:findTF("frame/desc", slot0.shopPanel)
	slot0.calPanel = slot0:findTF("frame/cal_panel", slot0.shopPanel)
	slot0.cancelBtn = slot0:findTF("frame/cancel_btn", slot0.shopPanel)
	slot0.extendPanel = slot0:findTF("extendPanel")
	slot0.extendCancelBtn = slot0:findTF("frame/cancel_btn", slot0.extendPanel)
	slot0.stock = slot0:findTF("frame/top/stock", slot0.foodPanel)
	slot0.stockBar = slot0:findTF("bar", slot0.stock):GetComponent(typeof(Image))
	slot0._overlayUIMain = pg.UIMgr:GetInstance().OverlayMain

	pg.UIMgr.GetInstance():BlurPanel(slot0.foodPanel)
	slot0.paint:GetComponent("SpineAnimUI"):SetAction("animation", 0)
end

function slot0.didEnter(slot0)
	slot0:initFoodPanel()
	onButton(slot0, slot0.foodPanel:Find("bg"), function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0.cancelBtn, function ()
		SetActive(slot0.shopPanel, false)
		setParent(slot0.shopPanel, slot0._tf, false)
	end, SFX_CANCEL)
	onButton(slot0, slot0.shopPanel, function ()
		triggerButton(slot0.cancelBtn)
	end, SFX_PANEL)
	onButton(slot0, slot0.extendBtn, function ()
		slot0:openExtendPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.extendPanel, function ()
		SetActive(slot0.extendPanel, false)
		setParent(slot0.extendPanel, slot0._tf, false)
	end, SFX_PANEL)
	onButton(slot0, slot0.extendCancelBtn, function ()
		triggerButton(slot0.extendPanel)
	end, SFX_CANCEL)
end

function slot0.updateDrom(slot0)
	if not slot0.dormVO then
		return
	end

	slot0.stockBar.fillAmount = slot0.dormVO.food / (pg.dorm_data_template[slot0.dormVO.id].capacity + slot0.dormVO.dorm_food_max)

	setText(slot0:findTF("Text", slot0.stock), math.ceil(slot0.dormVO.food) .. "/" .. pg.dorm_data_template[slot0.dormVO.id].capacity + slot0.dormVO.dorm_food_max)
	slot0:calFoodLeftTime()
end

function slot0.initFoodPanel(slot0)
	slot0.foodTFs = {}
	slot1 = pg.item_data_statistics

	for slot5, slot6 in ipairs(slot0.foodIds) do
		slot0.foodTFs[slot6] = cloneTplTo(slot0.foodTpl, slot0.foodsContent, "food_" .. slot6)

		slot0:updateFood(slot0.foodVOs[slot6] or Item.New({
			count = 0,
			id = slot6
		}))
		slot0:displayFood(slot0.foodVOs[slot6] or Item.New())
	end
end

function slot0.displayFood(slot0, slot1)
	updateItem(slot2, slot1)

	slot4 = 0
	slot5 = pg.dorm_data_template[slot0.dormVO.id]
	slot0.eventTriggers[pressPersistTrigger(slot3, 0.5, function (slot0)
		if not slot0.foodVOs then
			return
		end

		if slot0.dormVO.food ~= slot2.capacity + slot0.dormVO.dorm_food_max and slot3 < slot0.dormVO.food + slot2 and slot0.remindEndTime < pg.TimeMgr.GetInstance():GetServerTime() then
			pg.MsgboxMgr:GetInstance():showSingleItemBox({
				showStopRamind = true,
				content = i18n("backyard_food_remind", slot1:getConfig("name")),
				name = i18n("backyard_food_count", slot0.dormVO.food .. "/" .. slot3),
				drop = {
					type = DROP_TYPE_ITEM,
					id = slot1.id,
					count = i18n("common_food") .. ":" .. slot2
				},
				onYes = function ()
					slot0:emit(BackyardGranaryMediator.USE_FOOD, slot1.id, 1, slot2.stopRemindToggle.isOn)
				end
			})

			if slot0 then
				slot0()
			end

			return
		end

		if slot3 <= slot0.dormVO.food then
			pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_full"))

			if slot0 then
				slot0()
			end

			return
		end

		if slot1.count <= 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_foodCountLimit"))

			if slot0 then
				slot0()
			end

			return
		end

		slot0.isPress = true
		slot3 = slot3 + 1
		slot1.count = slot1.count - 1

		slot0:updateFood(slot1)
		slot0.dormVO:addFood(slot2)
		slot0:updateDrom()
		pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_addFood_ok", pg.item_data_template[slot1.id].usage_arg[1]))
	end, function ()
		if slot0 <= 0 then
			return
		end

		slot1:emit(BackyardGranaryMediator.USE_FOOD, slot2.id, slot1.emit)

		slot0 = 0
		slot1.isPress = nil
	end, true, true, 0.15, SFX_PANEL)] = true
end

function slot0.updateFood(slot0, slot1)
	SetActive(slot0:findTF("mask", slot2), slot1.count == 0)
	setText(slot0:findTF("count", slot2), slot1.count)

	slot0.foodVOs[slot1.id] = slot1

	setText(slot0:findTF("name_bg/Text", slot2), (slot1.count ~= 0 or setColorStr(i18n("word_food") .. pg.item_data_template[slot1.id].usage_arg[1], "#2f2d2b")) and setColorStr(i18n("word_food") .. pg.item_data_template[slot1.id].usage_arg[1], "#4E3E42FF"))
	onButton(slot0, slot3, function ()
		slot0:openFoodShop(slot0)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("add_btn", slot2), function ()
		slot0:openFoodShop(slot0)
	end, SFX_PANEL)
end

function slot0.openFoodShop(slot0, slot1)
	setParent(slot0.shopPanel, slot0._overlayUIMain, false)
	SetActive(slot0.shopPanel, true)
	updateItem(slot0:findTF("frame", slot0.shopPanel), slot1)
	setText(slot0.foodName, slot1:getConfig("name"))
	setText(slot0.foodDesc, slot1:getConfig("display"))
	setText(slot3, pg.shop_template[slot1:getConfig("shop_id")].resource_num * 1)

	slot0:findTF("total/icon", slot0.calPanel).GetComponent(slot4, typeof(Image)).sprite = LoadSprite(pg.item_data_statistics[id2ItemId(slot7)].icon)

	setText(slot2, "1")
	onButton(slot0, slot0:findTF("minus_btn", slot0.calPanel), function ()
		if slot0 <= 1 then
			return
		end

		slot0 = slot0 - 1

		setText(slot1, setText)
		setText(setText, slot3 * setText)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("add_btn", slot0.calPanel), function ()
		if slot0 == 999 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buyCountLimit", pg.TipsMgr.GetInstance().ShowTips))

			return
		end

		slot0 = (slot0 > 999 and 999) or slot0 + 1

		setText(slot1, setText)
		setText(setText, slot3 * setText)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("ten_btn", slot0.calPanel), function ()
		if slot0 == 999 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buyCountLimit", pg.TipsMgr.GetInstance().ShowTips))

			return
		end

		slot0 = (slot0 + 10 >= 999 and 999) or slot0 + 10

		setText(slot1, setText)
		setText(setText, slot3 * setText)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("frame/ok_btn", slot0.shopPanel), function ()
		if slot0.playerVO[id2res(id2res)] < id2res * slot3 then
			if slot1 == 4 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_noResource", pg.item_data_statistics[id2ItemId(id2ItemId)].name))
			end

			return
		end

		slot0:emit(BackyardGranaryMediator.BUY_FOOD, slot4, )
		triggerButton(slot0.cancelBtn)
	end, SFX_CONFIRM)
end

function slot0.calFoodLeftTime(slot0)
	if slot0.calFoodTimer then
		pg.TimeMgr:GetInstance():RemoveTimer(slot0.calFoodTimer)

		slot0.calFoodTimer = nil
	end

	slot1 = slot0:findTF("paint/chat_bg/chat_text", slot0.foodPanel)
	slot2 = slot0:findTF("paint/chat_bg/chat_contain", slot0.foodPanel)
	slot3 = slot0:findTF("paint/chat_bg/bottom_text", slot0.foodPanel)
	slot4 = pg.dorm_data_template[slot0.dormVO.id]
	slot5 = table.getCount(slot0.addExpShipVOs)

	function slot6(slot0)
		SetActive(slot0, true)
		SetActive(SetActive, false)
		SetActive(SetActive, false)
		setText(slot0, slot0)
	end

	if slot0.dormVO.food <= 0 then
		slot6(i18n("backyard_backyardGranaryLayer_word"))

		return
	end

	if slot5 <= 0 then
		slot6(i18n("backyard_backyardGranaryLayer_noShip"))

		return
	end

	slot7 = slot0.dormVO:getFoodLeftTime()

	function slot8()
		pg.TimeMgr:GetInstance():RemoveTimer(slot0.calFoodTimer)

		pg.TimeMgr.GetInstance().RemoveTimer.calFoodTimer = nil

		nil(i18n("backyard_backyardGranaryLayer_word"))
	end

	SetActive(slot1, false)
	SetActive(slot2, true)
	SetActive(slot3, true)
	setText(findTF(slot2, "Text"), i18n("backyard_backyardGranaryLayer_foodTimeNotice_top"))
	setText(slot3, i18n("backyard_backyardGranaryLayer_foodTimeNotice_bottom"))

	slot9 = findTF(slot2, "time")
	slot0.calFoodTimer = pg.TimeMgr:GetInstance():AddTimer("calFoodTimer", 0, 1, function ()
		setText(setText, pg.TimeMgr:GetInstance():DescCDTime(math.ceil(math.ceil) - pg.TimeMgr:GetInstance():GetServerTime()))

		if math.ceil(math.ceil) - pg.TimeMgr.GetInstance().GetServerTime() <= 0 then
			slot2()
		end
	end)
end

function slot0.openExtendPanel(slot0)
	if not ShoppingStreet.getRiseShopId(ShopArgs.BackyardFoodExtend, slot0.dormVO.food_extend_count) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buy_max_count"))

		return
	end

	setParent(slot0.extendPanel, slot0._overlayUIMain, false)
	SetActive(slot0.extendPanel, true)

	slot0:findTF("frame/tip/icon", slot0.extendPanel).GetComponent(slot2, typeof(Image)).sprite = LoadSprite(pg.item_data_statistics[id2ItemId(slot4)].icon)

	setText(slot0:findTF("frame/tip/Text", slot0.extendPanel), slot5)
	setText(slot0:findTF("frame/desc", slot0.extendPanel), i18n("backyard_backyardGranaryLayer_foodMaxIncreaseNotice", slot7, slot0.dormVO.dorm_food_max + pg.dorm_data_template[slot0.dormVO.id].capacity + pg.shop_template[slot1].num))
	onButton(slot0, slot0:findTF("frame/ok_btn", slot0.extendPanel), function ()
		if slot0.playerVO[id2res(id2res)] < id2res then
			if slot1 == 4 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_entendFail"))
			end
		else
			slot0:emit(BackyardGranaryMediator.EXTEND_GRANARY, slot3, 1)
		end

		triggerButton(slot0.extendPanel)
	end, SFX_CONFIRM)
end

function slot0.willExit(slot0)
	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	pg.TimeMgr:GetInstance():RemoveTimer(slot0.calFoodTimer)

	slot0.calFoodTimer = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.foodPanel, slot0._tf)
	setParent(slot0.shopPanel, slot0._tf, false)
	setParent(slot0.extendPanel, slot0._tf, false)
end

return slot0
