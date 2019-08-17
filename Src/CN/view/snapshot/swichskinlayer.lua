slot0 = class("SwichSkinLayer", import("..base.BaseUI"))

function slot0.setShip(slot0, slot1)
	slot0.shipVO = slot1
end

function slot0.setShipSkin(slot0, slot1)
	slot0.shipVO.skinId = slot1
end

function slot0.setSkinList(slot0, slot1)
	slot0.skinList = slot1
	slot0.skins = slot0:getGroupSkinList(slot0.shipVO.groupId)
	slot0.owns = slot0:getGroupOwnSkins(slot0.shipVO.groupId)
end

function slot0.getUIName(slot0)
	return "SwichSkinLayer"
end

function slot0.back(slot0)
	slot0:emit(slot0.ON_CLOSE)
end

function slot0.init(slot0)
	return
end

function slot0.didEnter(slot0)
	slot0:initSelectSkinPanel()

	if slot0.shipVO and #slot0.skins > 1 then
		slot0:openSelectSkinPanel()
	end
end

function slot0.initSelectSkinPanel(slot0)
	slot0.skinPanel = slot0._tf

	onButton(slot0, slot1, function ()
		slot0:back()
	end)
	onButton(slot0, slot2, function ()
		slot0:back()
	end)

	slot0.skinScroll = slot0:findTF("select_skin/style_scroll", slot0.skinPanel)
	slot0.skinContainer = slot0:findTF("view_port", slot0.skinScroll)
	slot0.skinCard = slot0._go:GetComponent(typeof(ItemList)).prefabItem[0]

	setActive(slot0.skinCard, false)

	slot0.skinCardMap = {}
end

function slot0.openSelectSkinPanel(slot0)
	for slot4 = slot0.skinContainer.childCount, #slot0.skins - 1, 1 do
		cloneTplTo(slot0.skinCard, slot0.skinContainer)
	end

	for slot4 = #slot0.skins, slot0.skinContainer.childCount - 1, 1 do
		setActive(slot0.skinContainer:GetChild(slot4), false)
	end

	slot1 = slot0.skinContainer.childCount

	for slot5, slot6 in ipairs(slot0.skins) do
		if not slot0.skinCardMap[slot0.skinContainer:GetChild(slot5 - 1)] then
			slot0.skinCardMap[slot7] = ShipSkinCard.New(slot7.gameObject)
		end

		slot9 = slot0.shipVO:getRemouldSkinId() == slot6.id and slot0.shipVO:isRemoulded()

		slot8:updateData(slot0.shipVO, slot6, slot0.shipVO:proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO.getRemouldSkinId() == slot6.id and slot0.shipVO.isRemoulded()) or slot6.skin_type == 3)
		slot8:updateSkin(slot6, slot0.shipVO.proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO.getRemouldSkinId() == slot6.id and slot0.shipVO.isRemoulded()) or slot6.skin_type == 3)
		slot8:updateUsing(slot0.shipVO.skinId == slot6.id)
		removeOnButton(slot7)

		slot14 = ((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil) and not pg.TimeMgr.GetInstance():inTime((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil.time)
		slot15 = slot6.id == slot0.shipVO.skinId
		slot16 = slot6.id == slot0.shipVO:getConfig("skin_id") or (((slot0.shipVO:proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO:getRemouldSkinId() == slot6.id and slot0.shipVO:isRemoulded())) and 1) or 0) >= 1 or slot6.skin_type == 3

		onToggle(slot0, slot8.hideObjToggleTF, function (slot0)
			slot1 = PlayerPrefs.SetInt
			slot2 = "paint_hide_other_obj_" .. slot0.paintingName

			if slot0 then
				slot3 = 1
			else
				slot3 = 0
			end

			slot1(slot2, slot3)
			slot0:flushSkin()
			slot0.flushSkin:emit(SwichSkinMediator.UPDATE_SKINCONFIG, slot1.shipVO.skinId)

			return
		end, SFX_PANEL)
		onButton(slot0, slot7, function ()
			if slot0 then
				slot1:back()
			else
				if slot2 then
					slot0 = slot1.emit
					slot2 = SwichSkinMediator.CHANGE_SKIN

					if slot3.id == slot1.shipVO:getConfig("skin_id") then
						slot4 = 0
					else
						slot4 = slot3.id
					end

					slot0(slot1, slot2, slot3, slot4)
					slot1:back()
				else
					if slot4 then
						if slot5 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
						else
							slot0 = Goods.New({
								shop_id = slot4.id
							}, Goods.TYPE_SKIN)
							slot1 = slot0:getConfig("resource_num")

							if slot0:isDisCount() then
								slot1 = slot1 * (100 - slot0:getConfig("discount")) / 100
							end

							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("text_buy_fashion_tip", slot1, HXSet.hxLan(slot3.name)),
								onYes = function ()
									slot0:emit(SwichSkinMediator.BUY_ITEM, slot1.id, 1)

									return
								end
							})
						end
					end
				end
			end

			return
		end)
		setActive(slot7, true)

		slot9 = slot0.shipVO.isRemoulded()

		if slot0.shipVO.isRemoulded() then
			slot9 = false

			if false then
				slot9 = true
			end
		end

		if not table.contains(slot0.skinList, slot6.id) and not slot9 then
			if slot6.skin_type ~= 3 then
				slot10 = false
			else
				slot10 = true
			end
		end

		slot13 = false

		if false then
			slot13 = true
		end

		slot11 = slot0.shipVO.isRemoulded()

		if slot0.shipVO.isRemoulded() then
			slot11 = false

			if false then
				slot11 = true
			end
		end

		if table.contains(slot0.skinList, slot6.id) or slot11 then
			slot12 = 1
		else
			slot12 = 0
		end

		if not pg.shop_template[slot6.shop_id] then
			slot13 = nil
		end

		slot14 = not pg.TimeMgr.GetInstance().inTime((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil.time)
		slot15 = false

		if false then
			slot15 = true
		end

		if slot12 < 1 and slot6.skin_type ~= 3 then
			slot16 = false
		else
			slot16 = true
		end
	end
end

function slot0.isCurrentShipExistSkin(slot0, slot1)
	if slot1 then
		if #slot0.skins > 1 then
			return true
		else
			if #slot0.skins == 1 then
				return false
			end
		end
	end

	return
end

function slot0.getGroupSkinList(slot0, slot1)
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.shipVO:isRemoulded() then
		slot3 = ShipGroup.GetGroupConfig(slot1).trans_skin

		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].id == slot3 then
				table.remove(slot2, slot7)

				break
			end
		end
	end

	for slot6 = #slot2, 1, -1 do
		if slot2[slot6].show_time and ((type(slot7.show_time) == "string" and slot7.show_time == "stop") or (type(slot7.show_time) == "table" and not pg.TimeMgr:GetInstance():inTime(slot7.show_time))) then
			table.remove(slot2, slot6)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		slot3 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].skin_type == 3 and slot3 < slot0.shipVO.createTime then
				table.remove(slot2, slot7)
			end
		end
	end

	return slot2
end

function slot0.getGroupOwnSkins(slot0, slot1)
	slot2 = {}
	slot3 = slot0.skinList

	if getProxy(CollectionProxy):getShipGroup(slot1) then
		for slot9, slot10 in ipairs(slot5) do
			if slot10.skin_type == Ship.SKIN_TYPE_DEFAULT or table.contains(slot3, slot10.id) or (slot10.skin_type == Ship.SKIN_TYPE_REMAKE and slot4.trans) or (slot10.skin_type == Ship.SKIN_TYPE_PROPOSE and slot4.married == 1) then
				slot2[slot10.id] = true
			end
		end
	end

	return slot2
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.skinCardMap) do
		slot5:clear()
	end

	return
end

return slot0
