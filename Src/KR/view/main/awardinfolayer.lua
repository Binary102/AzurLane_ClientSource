slot0 = class("AwardInfoLayer", import("..base.BaseUI"))
slot0.TITLE = {
	SHIP = "ship",
	ESCORT = "escort",
	ITEM = "item"
}
slot1 = 0.2

function slot0.getUIName(slot0)
	return "AwardInfoUI"
end

function slot0.setAwards(slot0, slot1)
	slot0.awards = slot1.items
	slot0.onYes = slot1.onYes
end

function slot0.init(slot0)
	slot0._guiderLoaded = true

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot0._itemsWindow = tf(slot0._go):Find("items_window")

	setLocalScale(slot0._itemsWindow, Vector3(0.5, 0.5, 0.5))

	slot0.titleItem = tf(slot0._go):Find("titles/title_item")
	slot0.titleShip = tf(slot0._go):Find("titles/title_ship")
	slot0.titleEscort = tf(slot0._go):Find("titles/title_escort")
	slot0.list = slot0._itemsWindow:Find("scrollview/list")
	slot0.item = slot0._itemsWindow:Find("scrollview/item")

	setActive(slot0.item, false)
	setActive(slot0.titleItem, (slot0.contextData.title or slot0.TITLE.ITEM) == slot0.TITLE.ITEM)
	setActive(slot0.titleShip, (slot0.contextData.title or slot0.TITLE.ITEM) == slot0.TITLE.SHIP)
	setActive(slot0.titleEscort, (slot0.contextData.title or slot0.TITLE.ITEM) == slot0.TITLE.ESCORT)

	slot0.nameTxts = {}
	slot0.blinks = {}
	slot0.tweenItems = {}
end

function slot0.doAnim(slot0, slot1)
	LeanTween.scale(rtf(slot0._itemsWindow), Vector3(1, 1, 1), 0.15):setEase(LeanTweenType.linear):setOnComplete(System.Action(function ()
		slot0:dispatchUILoaded(true)

		if slot0 then
			slot1()
		end
	end))
end

function slot0.didEnter(slot0)
	if slot0.contextData.animtion then
		slot0.inAniming = true

		setActive(slot0.list, false)
		slot0:doAnim(function ()
			slot0:displayAwards()
			slot0.displayAwards:playAnim()
		end)
	else
		slot0:displayAwards()
		slot0:doAnim()
	end

	slot0.closeTF = slot0._tf:Find("close")

	onButton(slot0, slot0.closeTF, function ()
		if not slot0.inited then
			return
		end

		if slot0.inAniming then
			for slot3, slot4 in ipairs(slot0.tweenItems) do
				LeanTween.cancel(slot4)
			end

			for slot3 = 1, #slot0.awards, 1 do
				setActive(slot0.list:GetChild(slot3 - 1), true)
			end

			slot0.inAniming = false
		end

		if slot0.onYes then
			slot0.onYes()
		end

		slot0:emit(slot1.ON_CLOSE)

		if slot0.contextData.onClose then
			slot0()
		end
	end)
	onButton(slot0, slot0._tf, function ()
		if not slot0.inited then
			return
		end

		if slot0.inAniming then
			for slot3, slot4 in ipairs(slot0.tweenItems) do
				LeanTween.cancel(slot4)
			end

			for slot3 = 1, #slot0.awards, 1 do
				setActive(slot0.list:GetChild(slot3 - 1), true)
			end

			slot0.inAniming = false

			return
		end

		if slot0.onYes then
			slot0.onYes()
		end

		slot0:emit(slot1.ON_CLOSE)

		if slot0.contextData.onClose then
			slot0()
		end
	end, SFX_CANCEL, {
		noShip = not slot0.hasShip
	})
	playSoundEffect(SFX_UI_GETITEM)
end

function slot0.onBackPressed(slot0)
	if LeanTween.isTweening(go(slot0._itemsWindow)) then
		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot0.displayAwards(slot0)
	slot0.inited = false

	slot0:clearAllNameTxt()

	for slot4 = #slot0.awards, slot0.list.childCount - 1, 1 do
		Destroy(slot0.list:GetChild(slot4))
	end

	for slot4 = slot0.list.childCount, #slot0.awards - 1, 1 do
		cloneTplTo(slot0.item, slot0.list)
	end

	for slot4 = 1, #slot0.awards, 1 do
		slot5 = slot0.list:GetChild(slot4 - 1):Find("frame")

		if slot0.awards[slot4].type == DROP_TYPE_SHIP then
			slot0.hasShip = true
		end

		updateDrop(slot5, slot6, {
			fromAwardLayer = true
		})
		setActive(slot5.parent:Find("frame/Item_Ring05"), getDropRarity(slot6) >= 5)
		setActive(slot5.parent:Find("frame/bouns"), slot6.riraty)

		if slot6.riraty then
			PoolMgr.GetInstance():GetUI("IconColorful_white", true, function (slot0)
				if IsNil(slot0) or IsNil(slot0._tf) then
					return
				end

				setParent(slot0, setParent)
				setActive(slot0, true)
				table.insert(slot0.blinks, slot0)
			end)
		end

		ScrollTxt.New(findTF(slot5, "name_mask"), findTF(slot5, "name_mask/name")):setText(HXSet.hxLan(slot6.name or slot6.cfg.name))
		table.insert(slot0.nameTxts, slot7)
		onButton(slot0, slot5, function ()
			if slot0.inAniming then
				return
			end

			if slot1.type == DROP_TYPE_RESOURCE or slot1.type == DROP_TYPE_ITEM or slot1.type == DROP_TYPE_VITEM then
				slot0:emit(AwardInfoMediator.ON_ITEM, slot1.cfg.id)
			elseif slot1.type == DROP_TYPE_FURNITURE then
				slot0:emit(AwardInfoMediator.ON_FURNITURE, slot1.cfg.id)
			elseif slot1.type == DROP_TYPE_EQUIP then
				slot0:emit(slot2.ON_EQUIPMENT, {
					equipmentId = slot1.cfg.id,
					type = EquipmentInfoMediator.DISPLAY
				})
			end
		end, SFX_PANEL)
	end

	slot0.inited = true
end

function slot0.playAnim(slot0)
	slot1 = {}

	for slot5 = 1, #slot0.awards, 1 do
		slot6 = slot0.list:GetChild(slot5 - 1)
		slot7 = slot6:Find("frame")

		setActive(slot6, false)
		table.insert(slot1, function (slot0)
			if not slot0.tweenItems then
				slot0()

				return
			end

			setActive(setActive, true)
			table.insert(slot0.tweenItems, LeanTween.delayedCall(slot0.tweenItems, System.Action(slot0)).id)
		end)
	end

	setActive(slot0.list, true)
	seriesAsync(slot1, function ()
		slot0.inAniming = false
	end)
end

function slot0.clearAllNameTxt(slot0)
	if not slot0.nameTxts then
		return
	end

	for slot4 = #slot0.nameTxts, 1, -1 do
		if slot0.nameTxts[slot4] then
			slot0.nameTxts[slot4]:destroy()
			table.remove(slot0.nameTxts, slot4)
		end
	end
end

function slot0.willExit(slot0)
	slot0:clearAllNameTxt()

	for slot4 = 0, slot0.list.childCount - 1, 1 do
		clearDrop(slot0.list:GetChild(slot4):Find("frame"))
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	if slot0.contextData.removeFunc then
		slot0.contextData.removeFunc()
	end

	if slot0.blinks and #slot0.blinks > 0 then
		for slot4, slot5 in pairs(slot0.blinks) do
			if not IsNil(slot5) then
				Destroy(slot5)
			end
		end
	end
end

return slot0
