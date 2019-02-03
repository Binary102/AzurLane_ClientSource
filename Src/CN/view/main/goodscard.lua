slot0 = class("GoodsCard")

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0.go = slot1
	slot0.tr = tf(slot1)
	slot0.mask = slot0.tr:Find("mask")
	slot0.maskText = slot0.tr:Find("mask/sale_out/Text")
	slot0.stars = slot0.tr:Find("item/stars")
	slot0.itemTF = findTF(slot0.tr, "item")
	slot0.nameTxt = ScrollTxt.New(findTF(slot0.tr, "item/name_mask"), findTF(slot0.tr, "item/name_mask/name"), true)
	slot0.discountTF = findTF(slot0.tr, "item/discount")
	slot0.discountTextTF = findTF(slot0.discountTF, "Text"):GetComponent(typeof(Text))
	slot0.countTF = findTF(slot0.tr, "item/consume/contain/Text"):GetComponent(typeof(Text))
	slot0.resIconTF = findTF(slot0.tr, "item/consume/contain/icon"):GetComponent(typeof(Image))
	slot0.itemIconTF = slot0.itemTF:Find("icon_bg/icon"):GetComponent(typeof(Image))
	slot0.itemCountTF = slot0.itemTF:Find("icon_bg/count"):GetComponent(typeof(Text))
	slot0.maskTip = i18n("buy_countLimit")

	onButton(slot0, slot0.mask, function ()
		pg.TipsMgr:GetInstance():ShowTips(slot0.maskTip)
	end, SFX_PANEL)
end

function slot0.setGroupMask(slot0, slot1)
	setActive(slot0.mask, slot0.goodsVO:getConfig("group_limit") > 0 and slot2 <= slot1)

	if slot2 > 0 and slot2 <= slot1 then
		setText(slot0.maskText, i18n("word_sell_out"))
	end
end

function slot0.setLevelMask(slot0, slot1)
	setActive(slot0.mask, slot0.goodsVO:getLevelLimit() > 0 and slot1 < slot2)
	setText(slot0.maskText, i18n("charge_limit_lv", slot2))

	if slot2 > 0 and slot1 < slot2 then
		setText(slot0.maskText, i18n("charge_limit_lv", slot2))

		slot0.maskTip = i18n("charge_level_limit")
	end
end

function slot0.update(slot0, slot1)
	slot0.goodsVO = slot1

	setActive(slot0.mask, not slot1:canPurchase())

	slot2 = slot1:getConfig("type")

	setActive(slot0.stars, false)

	if slot1:getConfig("effect_args") == "ship_bag_size" then
		updateDrop(slot0.itemTF, slot4)
		slot0.nameTxt:setText(pg.item_data_statistics[Goods.SHIP_BAG_SIZE_ITEM].name or "??")
	elseif slot3 == "equip_bag_size" then
		updateDrop(slot0.itemTF, slot4)
		slot0.nameTxt:setText(pg.item_data_statistics[Goods.EQUIP_BAG_SIZE_ITEM].name or "??")
	elseif slot3 == "commander_bag_size" then
		updateDrop(slot0.itemTF, slot4)
		slot0.nameTxt:setText(pg.item_data_statistics[Goods.COMMANDER_BAG_SIZE_ITEM].name or "??")
	else
		updateDrop(slot0.itemTF, slot4)
		slot0.nameTxt:setText(({
			type = slot1:getConfig("type"),
			id = slot3[1],
			count = slot1:getConfig("num")
		})["cfg"].name or "??")
	end

	slot4 = ""
	slot5 = slot1:getConfig("resource_num")

	if slot1:getConfig("genre") == ShopArgs.ShoppingStreetLimit then
		slot4 = 100 - slot1.discount .. "%OFF"
		slot5 = slot5 * slot1.discount / 100
	end

	setActive(slot0.discountTF, false)

	slot0.discountTF = (slot1.activityDiscount and findTF(slot0.tr, "item/discount_activity")) or findTF(slot0.tr, "item/discount")
	slot0.discountTextTF = findTF(slot0.discountTF, "Text"):GetComponent(typeof(Text))

	setActive(slot0.discountTF, slot1:hasDiscount())

	slot0.discountTextTF.text = slot4
	slot0.countTF.text = math.ceil(slot5)
	slot0.resIconTF.sprite = GetSpriteFromAtlas("props/" .. id2res(slot1:getConfig("resource_type")), "")
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)
	slot0.nameTxt:destroy()
end

return slot0
