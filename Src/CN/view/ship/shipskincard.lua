slot0 = class("ShipSkinCard")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.painting = findTF(slot0.tr, "bg/mask/painting")
	slot0.nameBar = findTF(slot0.tr, "bg/desc/name_bar")
	slot0.name = findTF(slot0.nameBar, "name")
	slot0.effectBar = findTF(slot0.tr, "bg/desc/effect_bar")
	slot0.effect = findTF(slot0.effectBar, "effect")
	slot0.bgUsing = findTF(slot0.tr, "bg/bg_using")
	slot0.bgMark = findTF(slot0.tr, "bg/bg_mark")
	slot0.picNotBuy = findTF(slot0.bgMark, "bg/pic_not_buy")
	slot0.picActivity = findTF(slot0.bgMark, "bg/pic_activity")
	slot0.picPropose = findTF(slot0.bgMark, "bg/pic_propose")
	slot0.outline = findTF(slot0.tr, "bg/outline")
	slot0.tags = findTF(slot0.tr, "bg/tags")
	slot0.timelimitTag = findTF(slot0.tr, "bg/timelimit")
	slot0.timelimitTimeTxt = findTF(slot0.tr, "bg/timelimit_time")

	setActive(slot0.timelimitTag, false)
	setActive(slot0.timelimitTimeTxt, false)
end

function slot0.updateSkin(slot0, slot1, slot2)
	if slot0.skin ~= slot1 or slot0.own ~= slot2 then
		slot0.skin = slot1
		slot0.own = slot2

		setActive(slot0.nameBar, true)
		setActive(slot0.effectBar, false)
		setText(slot0.name, HXSet.hxLan(slot1.name))
		setActive(slot0.bgMark, not slot2)

		if not slot2 then
			setActive(slot0.picNotBuy, false)
			setActive(slot0.picActivity, false)
			setActive(slot0.picPropose, false)

			if slot1.skin_type == Ship.SKIN_TYPE_PROPOSE then
				setActive(slot0.picPropose, true)
			elseif slot0.skin.shop_id > 0 then
				setActive(slot0.picNotBuy, true)
			elseif _.any(pg.activity_shop_template.all, function (slot0)
				return pg.activity_shop_template[slot0].commodity_type == DROP_TYPE_SKIN and slot1.commodity_id == slot0.skin.id
			end) or _.any(pg.activity_shop_extra.all, function (slot0)
				return pg.activity_shop_extra[slot0].commodity_type == DROP_TYPE_SKIN and slot1.commodity_id == slot0.skin.id
			end) then
				setActive(slot0.picActivity, true)
			else
				setActive(slot0.picActivity, true)
			end
		end

		setActive(slot0.tags, true)

		for slot7 = 0, slot0.tags.childCount - 1, 1 do
			setActive(slot0.tags:GetChild(slot7), false)
		end

		_.each(slot1.tag, function (slot0)
			setActive(slot0.tags:Find("tag" .. slot0), true)
		end)
		slot0:flushSkin()
	end
end

function slot0.updateData(slot0, slot1, slot2, slot3)
	if slot0.ship == slot1 and slot0.skin == slot2 and slot0.own ~= slot3 then
		if slot0.skin.id ~= slot0.ship:getConfig("skin_id") then
			slot4 = false
		else
			slot4 = true
			slot5 = not slot3

			if not slot3 then
				slot5 = false

				if false then
					slot5 = true
				end
			end
		end

		slot0.ship = slot1
		slot0.skin = slot2
		slot0.own = slot3

		setActive(slot0.nameBar, true)
		setActive(slot0.effectBar, false)
		setText(slot0.name, HXSet.hxLan(slot2.name))

		slot4 = slot0.skin.id == slot0.ship:getConfig("skin_id")

		setActive(slot0.bgMark, not (slot0.skin.id == slot0.ship.getConfig("skin_id")) and not slot3)

		if not (slot0.skin.id == slot0.ship.getConfig("skin_id")) and not slot3 then
			setActive(slot0.picNotBuy, false)
			setActive(slot0.picActivity, false)
			setActive(slot0.picPropose, false)

			if slot2.skin_type == Ship.SKIN_TYPE_PROPOSE then
				setActive(slot0.picPropose, true)
			else
				if slot0.skin.shop_id > 0 then
					setActive(slot0.picNotBuy, true)
				else
					if _.any(pg.activity_shop_template.all, function (slot0)
						if pg.activity_shop_template[slot0].commodity_type ~= DROP_TYPE_SKIN or slot1.commodity_id ~= slot0.skin.id then
							slot2 = false
						else
							slot2 = true
						end

						return slot2
					end) or _.any(pg.activity_shop_extra.all, function (slot0)
						if pg.activity_shop_extra[slot0].commodity_type ~= DROP_TYPE_SKIN or slot1.commodity_id ~= slot0.skin.id then
							slot2 = false
						else
							slot2 = true
						end

						return slot2
					end) then
						setActive(slot0.picActivity, true)
					else
						setActive(slot0.picActivity, true)
					end
				end
			end
		end

		setActive(slot0.tags, true)

		for slot9 = 0, slot0.tags.childCount - 1, 1 do
			setActive(slot0.tags:GetChild(slot9), false)
		end

		_.each(slot2.tag, function (slot0)
			setActive(slot0.tags:Find("tag" .. slot0), true)

			return
		end)
		slot0:flushSkin()
		setActive(slot0.timelimitTag, getProxy(ShipSkinProxy):getSkinById(slot0.skin.id) and slot6:isExpireType() and not slot6:isExpired())
		setActive(slot0.timelimitTimeTxt, getProxy(ShipSkinProxy).getSkinById(slot0.skin.id) and slot6.isExpireType() and not slot6.isExpired())

		if slot6.isExpireType() then
			slot7 = not slot6.isExpired()
		end

		if slot0.skinTimer then
			slot0.skinTimer:Stop()
		end

		if slot7 then
			slot0.skinTimer = Timer.New(function ()
				setText(slot1.timelimitTimeTxt:Find("Text"), skinTimeStamp(slot0:getRemainTime()))

				return
			end, 1, -1)

			slot0.skinTimer:Start()
			slot0.skinTimer.func()
		end
	end
end

function slot0.updateSelected(slot0, slot1)
	if slot0.selected ~= slot1 then
		slot0.selected = slot1

		setActive(slot0.outline, tobool(slot0.selected))
	end

	return
end

function slot0.updateUsing(slot0, slot1)
	if slot0.using ~= slot1 then
		slot0.using = slot1

		setActive(slot0.bgUsing, slot0.using)
	end

	return
end

function slot0.flushSkin(slot0)
	slot0:clearPainting()
	slot0:loadPainting()

	return
end

function slot0.clearPainting(slot0)
	if slot0.paintingName then
		retPaintingPrefab(slot0.painting, slot0.paintingName)

		slot0.paintingName = nil
	end

	return
end

function slot0.loadPainting(slot0)
	if not slot0.skin or not slot0.skin.painting then
		slot1 = "unknown"
	end

	slot0.paintingName = slot1

	setPaintingPrefabAsync(slot0.painting, slot0.paintingName, "pifu")

	return
end

function slot0.clear(slot0)
	slot0:clearPainting()

	slot0.skin = nil
	slot0.selected = nil
	slot0.using = nil

	if slot0.skinTimer then
		slot0.skinTimer:Stop()

		slot0.skinTimer = nil
	end

	return
end

return slot0
