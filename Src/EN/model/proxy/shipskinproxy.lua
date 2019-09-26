slot0 = class("ShipSkinProxy", import(".NetProxy"))
slot0.SHIP_SKINS_UPDATE = "ship skins update"
slot0.SHIP_SKIN_EXPIRED = "ship skin expired"

function slot0.register(slot0)
	slot0.skins = {}
	slot0.oldSkins = {}
	slot0.cacheSkins = {}
	slot0.timers = {}

	slot0:on(12201, function (slot0)
		_.each(slot0.skin_list, function (slot0)
			slot1 = ShipSkin.New(slot0)

			slot0:addSkin(ShipSkin.New(slot0))
		end)
	end)
end

function slot0.getOverDueSkins(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.cacheSkins) do
		table.insert(slot1, slot6)
	end

	slot0.cacheSkins = {}

	return slot1
end

function slot0.getRawData(slot0)
	return slot0.skins
end

function slot0.getSkinList(slot0)
	return _.map(_.values(slot0.skins), function (slot0)
		return slot0.id
	end)
end

function slot0.getOldSkinList(slot0)
	return _.map(_.values(slot0.oldSkins), function (slot0)
		return slot0.id
	end)
end

function slot0.addSkin(slot0, slot1)
	slot0.oldSkins = Clone(slot0.skins)
	slot0.skins[slot1.id] = slot1

	slot0:addExpireTimer(slot1)
	slot0.facade:sendNotification(slot0.SHIP_SKINS_UPDATE)
end

function slot0.getSkinById(slot0, slot1)
	return slot0.skins[slot1]
end

function slot0.addExpireTimer(slot0, slot1)
	if not slot1:isExpireType() then
		return
	end

	slot0:removeExpireTimer(slot1.id)

	function slot2()
		table.insert(slot0.cacheSkins, )
		table.insert:removeSkinById(slot1.id)

		slot0 = getProxy(BayProxy)

		_.each(slot1, function (slot0)
			if slot0.skinId == slot0.id then
				slot0.skinId = slot0:getConfig("skin_id")

				slot0.getConfig("skin_id"):updateShip(slot0)
			end
		end)
		slot0:sendNotification(GAME.SHIP_SKIN_EXPIRED)
	end

	if slot1:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		slot2()
	else
		slot0.timers[slot1.id] = Timer.New(slot2, slot3, 1)

		slot0.timers[slot1.id]:Start()
	end
end

function slot0.removeExpireTimer(slot0, slot1)
	if slot0.timers[slot1] then
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1] = nil
	end
end

function slot0.removeSkinById(slot0, slot1)
	slot0.skins[slot1] = nil

	slot0:removeExpireTimer(slot1)
	slot0.facade:sendNotification(slot0.SHIP_SKINS_UPDATE)
end

function slot0.hasSkin(slot0, slot1)
	return slot0.skins[slot1] ~= nil
end

function slot0.hasNonLimitSkin(slot0, slot1)
	return slot0.skins[slot1] ~= nil and not slot2:isExpireType()
end

function slot0.hasOldSkin(slot0, slot1)
	return slot0.oldSkins[slot1] ~= nil
end

function slot0.hasOldNonLimitSkin(slot0, slot1)
	return slot0.oldSkins[slot1] and not slot2:isExpireType()
end

function slot0.getSkinCountById(slot0, slot1)
	return (slot0:hasSkin(slot1) and 1) or 0
end

function slot0.remove(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil
end

function slot0.GetAllSkins(slot0)
	slot1 = {}

	function slot2(slot0)
		slot0:updateBuyCount((getProxy(ShipSkinProxy):getSkinById(slot0:getSkinId()) and not slot2:isExpireType() and 1) or 0)
	end

	for slot6, slot7 in ipairs(pg.shop_template.all) do
		if pg.shop_template[slot7].genre == ShopArgs.SkinShop or slot8 == ShopArgs.SkinShopTimeLimit then
			slot2(slot9)

			slot10, slot11 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[slot7].time)

			if slot10 then
				table.insert(slot1, slot9)
			end
		end
	end

	slot3 = getProxy(ActivityProxy)

	for slot7, slot8 in ipairs(pg.activity_shop_template.all) do
		if pg.activity_shop_template[slot8].commodity_type == DROP_TYPE_SKIN and slot3:getActivityById(slot9.activity) and not slot10:isEnd() then
			slot2(slot11)
			table.insert(slot1, Goods.New({
				shop_id = slot8
			}, Goods.TYPE_ACTIVITY))
		end
	end

	for slot7, slot8 in ipairs(pg.activity_shop_extra.all) do
		if pg.activity_shop_extra[slot8].commodity_type == DROP_TYPE_SKIN then
			slot10 = slot3:getActivityById(slot9.activity)

			if (slot9.activity == 0 and pg.TimeMgr.GetInstance():inTime(slot9.time)) or (slot10 and not slot10:isEnd()) then
				slot2(slot11)
				table.insert(slot1, Goods.New({
					shop_id = slot8
				}, Goods.TYPE_ACTIVITY_EXTRA))
			end
		end
	end

	return slot1
end

return slot0
