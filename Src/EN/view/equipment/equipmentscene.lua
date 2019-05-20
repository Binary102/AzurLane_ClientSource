slot0 = class("EquipmentScene", import("..base.BaseUI"))
slot1 = 1
slot0.WARP_TO_DESIGN = "WARP_TO_DESIGN"
slot0.WARP_TO_MATERIAL = "WARP_TO_MATERIAL"
slot0.WARP_TO_WEAPON = "WARP_TO_WEAPON"
slot0.OVERVIEW = "EquipmentScene_OVERVIEW"
slot0.SKIN = "EquipmentScene_SKIN"
slot0.EQUIPMENT = "EquipmentScene_EQUIPMENT"
slot0.DESTORY = "EquipmentScene_DESTORY"
slot2 = 0
slot3 = 1

function slot0.getUIName(slot0)
	return "EquipmentUI"
end

function slot0.setEquipments(slot0, slot1)
	slot0.equipmentVOs = slot1

	slot0:setEquipmentByIds(slot1)
end

function slot0.setEquipmentByIds(slot0, slot1)
	slot0.equipmentVOByIds = {}

	for slot5, slot6 in pairs(slot1) do
		if not slot6.isSkin then
			slot0.equipmentVOByIds[slot6.id] = slot6
		end
	end
end

slot4 = require("view.equipment.EquipmentSortCfg")

function slot0.init(slot0)
	slot1 = slot0.contextData
	slot0.showBusyEquip = false
	slot0.topItems = slot0:findTF("topItems")
	slot0.equipmentView = slot0:findTF("equipment_scrollview")
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.topPanel = slot0:findTF("adapt/top", slot0.blurPanel)
	slot0.indexBtn = slot0:findTF("buttons/index_button", slot0.topPanel)
	slot0.indexPanel = slot0:findTF("index", slot0.topItems)
	slot0.indexContain = slot0:findTF("mask/panel", slot0.indexPanel)
	slot0.indexTpl = slot0:findTF("tpl", slot0.indexContain)

	setActive(slot0.indexTpl, false)

	slot0.sortBtn = slot0:findTF("buttons/sort_button", slot0.topPanel)
	slot0.sortPanel = slot0:findTF("sort", slot0.topItems)
	slot0.sortContain = slot0:findTF("mask/panel", slot0.sortPanel)
	slot0.sortTpl = slot0:findTF("tpl", slot0.sortContain)

	setActive(slot0.sortTpl, false)

	slot0.itemView = slot0:findTF("item_scrollview")
	slot2 = slot0.itemView.rect.width > 2000
	slot0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = (slot2 and 8) or 7
	slot0.itemView:Find("item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = (slot2 and 8) or 7
	slot0.decBtn = findTF(slot0.topPanel, "buttons/dec_btn")
	slot0.sortImgAsc = findTF(slot0.decBtn, "asc")
	slot0.sortImgDec = findTF(slot0.decBtn, "desc")
	slot0.equipmentBtn = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_root/equipment")
	slot0.equipmentSkinBtn = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_root/skin")
	slot0.filterBusyToggle = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_equip")

	setActive(slot0.filterBusyToggle, false)

	slot0.bottomBack = slot0:findTF("bottom_back", slot0.topItems)
	slot0.bottomPanel = slot0:findTF("types", slot0.bottomBack)
	slot0.materialToggle = slot0.bottomPanel:Find("material")
	slot0.weaponToggle = slot0.bottomPanel:Find("weapon")
	slot0.designToggle = slot0.bottomPanel:Find("design")
	slot0.capacityTF = slot0:findTF("bottom_left/tip/capcity/Text", slot0.bottomBack)
	slot0.tipTF = slot0:findTF("bottom_left/tip", slot0.bottomBack)
	slot0.tip = slot0.tipTF:Find("label")
	slot0.helpBtn = slot0:findTF("help_btn", slot0.topItems)

	setActive(slot0.helpBtn, true)

	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.selectedMin = defaultValue(slot0.contextData.selectedMin, 1)
	slot0.selectedMax = defaultValue(slot0.contextData.selectedMax, pg.gameset.equip_select_limit.key_value or 0)
	slot0.selectedIds = Clone(slot0.contextData.selectedIds or {})
	slot0.checkEquipment = slot0.contextData.onEquipment or function (slot0)
		return true
	end
	slot0.onSelected = slot0.contextData.onSelected or function ()
		warning("not implemented.")

		return
	end
	slot0.BatchDisposeBtn = slot0:findTF("dispos", slot0.bottomPanel)
	slot0.selectPanel = slot0:findTF("select_panel", slot0.topItems)

	setActive(slot0.selectPanel, true)
	setAnchoredPosition(slot0.selectPanel, {
		y = -124
	})

	slot0.selectEnabled = false
	slot0.destroyConfirm = slot0:findTF("destroy_confirm", slot0.topItems)
	slot0.destroyBonusList = slot0.destroyConfirm:Find("frame/bg/scrollview/list")
	slot0.destroyBonusItem = slot0.destroyBonusList:Find("equipment_tpl")
	slot0.destroyNoGotTip = slot0.destroyConfirm:Find("frame/bg/tip")

	setActive(slot0.destroyConfirm, false)
	setActive(slot0.destroyBonusItem, false)
	setActive(slot0.destroyNoGotTip, false)
	setActive(slot0.contextData.onSelected or function ()
		warning("not implemented.")

		return
	end, false)

	slot0.assignedItemPanel = AssignedItemPanel.New(slot0:findTF("item_assigned_panel", slot0.topItems), slot0)

	return

	slot2 = false

	if false then
		slot2 = true
	end

	slot4 = 8

	if 8 then
		slot4 = 7
	end

	slot5 = 8

	if 8 then
		slot5 = 7
	end

	slot7 = 0
	slot6 = 

	function slot5(slot0)
		return true
	end

	function slot5()
		warning("not implemented.")

		return
	end
end

function slot0.setEquipment(slot0, slot1)
	slot0.equipmentVOByIds[slot1.id] = slot1
	slot2 = true

	for slot6, slot7 in pairs(slot0.equipmentVOs) do
		if slot7.id == slot1.id and not slot7.shipId then
			slot0.equipmentVOs[slot6] = slot1
			slot2 = false
		end
	end

	if slot2 then
		table.insert(slot0.equipmentVOs, slot1)
	end

	if slot0.contextData.warp == slot0.WARP_TO_WEAPON then
		slot0:filterEquipment()
		slot0:updateCapacity()
	end

	return
end

function slot0.removeEquipment(slot0, slot1)
	slot0.equipmentVOByIds[slot1] = nil

	for slot5 = #slot0.equipmentVOs, 1, -1 do
		if slot0.equipmentVOs[slot5].id == slot1 then
			table.remove(slot0.equipmentVOs, slot5)
		end
	end

	if slot0.contextData.warp == slot0.WARP_TO_WEAPON then
		slot0:filterEquipment()
		slot0:updateCapacity()
	end

	return
end

function slot0.setEquipmentSkin(slot0, slot1)
	slot2 = true

	for slot6, slot7 in pairs(slot0.equipmentVOs) do
		if slot7.id == slot1.id and slot7.isSkin then
			slot0.equipmentVOs[slot6] = {
				isSkin = true,
				id = slot1.id,
				count = slot1.count
			}
			slot2 = false
		end
	end

	if slot2 then
		table.insert(slot0.equipmentVOs, {
			isSkin = true,
			id = slot1.id,
			count = slot1.count
		})
	end

	if slot0.contextData.warp == slot0.WARP_TO_WEAPON then
		slot0:filterEquipment()
		slot0:updateCapacity()
	end

	return
end

function slot0.didEnter(slot0)
	if not slot0.contextData.warp then
		slot1 = slot0.WARP_TO_MATERIAL
	end

	slot0.warp = slot1
	slot0.contextData.warp = nil

	setText(slot0:findTF("tip", slot0.selectPanel), i18n("equipment_select_device_destroy_tip"))
	setText(slot0:findTF("frame/title_text/Text", slot0.destroyConfirm), i18n("equipment_select_device_destroy_bonus_tip"))
	setText(slot0.destroyNoGotTip, i18n("equipment_select_device_destroy_nobonus_tip"))
	setActive(slot0:findTF("stamp", slot0.topItems), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(slot0, slot0:findTF("stamp", slot0.topItems), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(2)

		return
	end, SFX_CONFIRM)
	onButton(slot0, slot0.helpBtn, function ()
		if slot0.page ==  then
			slot0 = pg.gametip.help_equipment_skin.tip
		else
			slot0 = pg.gametip.help_equipment.tip
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = slot0
		})

		return
	end, SFX_PANEL)

	if slot0.contextData.mode ~= slot0.SKIN or not slot1 then
		slot1 = slot2
	end

	slot0.page = slot1

	onToggle(slot0, slot0.equipmentBtn, function (slot0)
		if slot0 then
			slot0.page = slot0

			slot0:updatePageFilterButtons(slot0.page)
			slot0:filterEquipment()

			slot2 = slot0.BatchDisposeBtn

			if slot0.page ~= setActive then
				slot3 = false
			else
				slot3 = true
			end

			slot1(slot2, slot3)

			slot2 = slot0.capacityTF.parent

			if slot0.page ~= setActive then
				slot3 = false
			else
				slot3 = true
			end

			slot1(slot2, slot3)
		end

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.equipmentSkinBtn, function (slot0)
		if slot0 then
			slot0.page = slot0

			slot0:updatePageFilterButtons(slot0.page)
			slot0:filterEquipment()

			slot1 = setActive

			if slot0.page ~= slot0.BatchDisposeBtn then
				slot3 = false
			else
				slot3 = true
			end

			slot1(slot2, slot3)

			slot1 = setActive

			if slot0.page ~= slot0.capacityTF.parent then
				slot3 = false
			else
				slot3 = true
			end

			slot1(slot2, slot3)
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.selectEnabled then
			triggerButton(slot0.BatchDisposeBtn)

			return
		end

		GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

		slot0:emit(slot1.ON_BACK)

		return
	end, SFX_CANCEL)
	onToggle(slot0, slot0.sortBtn, function (slot0)
		if slot0 then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.sortPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(slot0.sortPanel, true)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.sortPanel, slot0.topItems)
			setActive(slot0.sortPanel, false)
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.sortPanel, function ()
		triggerToggle(slot0.sortBtn, false)

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.indexBtn, function (slot0)
		if slot0 then
			pg.UIMgr.GetInstance():OverlayPanel(slot0.indexPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(slot0.indexPanel, true)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.indexPanel, slot0.topItems)
			setActive(slot0.indexPanel, false)
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel, function ()
		triggerToggle(slot0.indexBtn, false)

		return
	end, SFX_PANEL)

	slot0.equipmetItems = {}
	slot0.itemCards = {}

	slot0:initItems()
	slot0:initEquipments()

	if not slot0.contextData.indexData then
		slot0.contextData.indexData = slot3.index[1]
	end

	if not slot0.contextData.asc then
		slot1 = false
	end

	slot0.asc = slot1

	if not slot0.contextData.sortData then
		slot0.contextData.sortData = slot3.sort[1]
	end

	slot0:initSort()
	slot0:initEquipmentIndex()
	setActive(slot0.itemView, false)
	setActive(slot0.equipmentView, false)
	onToggle(slot0, slot0.materialToggle, function (slot0)
		slot0.inMaterial = slot0

		if slot0 and slot0.contextData.warp ~= slot1.WARP_TO_MATERIAL then
			slot0.contextData.warp = slot1.WARP_TO_MATERIAL

			setText(slot0.tip, i18n("equipment_select_materials_tip"))
			setActive(slot0.capacityTF.parent, false)
			setActive(slot0.tip, true)
			setActive(slot0.capacityTF.parent, false)
			slot0:sortItems()
		end

		setActive(slot0.helpBtn, not slot0)

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.weaponToggle, function (slot0)
		if slot0 and slot0.contextData.warp ~= slot1.WARP_TO_WEAPON then
			slot0.contextData.warp = slot1.WARP_TO_WEAPON

			slot0:updateCapacity()
			setActive(slot0.tip, false)
			setActive(slot0.capacityTF.parent, true)

			if slot0.page == slot0.capacityTF.parent then
				triggerToggle(slot0.equipmentSkinBtn, true)
			else
				if slot0.page == slot3 then
					triggerToggle(slot0.equipmentBtn, true)
				end
			end
		end

		slot1 = setActive
		slot2 = slot0.BatchDisposeBtn

		if slot0 then
			if slot0.page ~=  then
				slot3 = false
			else
				slot3 = true
			end
		end

		slot1(slot2, slot3)
		setActive(slot0.filterBusyToggle, slot0)

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.designToggle, function (slot0)
		if slot0 then
			if slot0.contextData.warp ~= slot1.WARP_TO_DESIGN then
				slot0.contextData.warp = slot1.WARP_TO_DESIGN

				slot0:updateCapacity()
				slot0:emit(EquipmentMediator.OPEN_DESIGN)
				setActive(slot0.tip, false)
				setActive(slot0.capacityTF.parent, false)
				setActive(slot0.filterBusyToggle, false)
			end
		else
			slot0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
		end

		return
	end, SFX_PANEL)
	onToggle(slot0, slot0.filterBusyToggle, function (slot0)
		slot0.showBusyEquip = slot0

		slot0:filterEquipment()

		return
	end, SFX_PANEL)

	if slot0.warp == slot0.WARP_TO_DESIGN then
		triggerToggle(slot0.designToggle, true)
	else
		if slot0.warp == slot0.WARP_TO_MATERIAL then
			triggerToggle(slot0.materialToggle, true)
		else
			if slot0.warp == slot0.WARP_TO_WEAPON then
				triggerToggle(slot0.weaponToggle, true)
			end
		end
	end

	onButton(slot0, slot0.BatchDisposeBtn, function ()
		slot0.selectEnabled = not slot0.selectEnabled

		if slot0.selectEnabled then
			slot0.filterImportance = slot0.asc

			shiftPanel(slot0.bottomBack, nil, -124, nil, 0, true, true)
			shiftPanel(slot0.selectPanel, nil, 0, nil, 0, true, true)

			shiftPanel.asc = true
			shiftPanel.contextData.asc = slot0.asc
			shiftPanel.contextData.contextData.sortData = slot0.asc.sort[1]

			shiftPanel.contextData.contextData:filterEquipment()

			shiftPanel.contextData.contextData.filterEquipment.mode = slot2.DESTORY
		else
			slot0.mode = slot2.OVERVIEW
			slot0.asc = slot0.filterImportance
			slot0.filterImportance = nil

			shiftPanel(slot0.bottomBack, nil, 0, nil, 0, true, true)
			shiftPanel(slot0.selectPanel, nil, -124, nil, 0, true, true)
			shiftPanel:filterEquipment()
		end

		setActive(slot0.filterBusyToggle, not slot0.selectEnabled)

		slot1 = slot0.equipmentBtn.parent

		if slot0.mode ~= slot2.OVERVIEW then
			slot2 = false
		else
			slot2 = true
		end

		slot0(slot1, slot2)

		return
	end, SFX_PANEL)

	if slot0.warp == slot0.WARP_TO_WEAPON and slot0.mode == slot0.DESTORY then
		triggerButton(slot0.BatchDisposeBtn)
	end

	onButton(slot0, findTF(slot0.selectPanel, "cancel_button"), function ()
		slot0:unselecteAllEquips()
		triggerButton(slot0.BatchDisposeBtn)

		return
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.selectPanel, "confirm_button"), function ()
		if not _.all(slot0:hasEliteEquips(slot0.selectedIds, slot0.equipmentVOByIds), function (slot0)
			if slot0 ~= "" then
				slot1 = false
			else
				slot1 = true
			end

			return slot1
		end) then
			slot2 = string.gsub
			slot3 = table.concat(slot1, "")
			slot4 = "$1"

			if slot1[1] == "" then
				slot5 = ""
			else
				slot5 = ","
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("destroy_eliteequipment_tip", slot2(slot3, slot4, slot5)),
				onYes = slot0
			})
		else
			slot0()
		end

		return
	end, SFX_CONFIRM)
	onButton(slot0, findTF(slot0.destroyConfirm, "frame/actions/cancel_btn"), function ()
		setActive(slot0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.destroyConfirm, slot0._tf)

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0.destroyConfirm, function ()
		setActive(slot0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.destroyConfirm, slot0._tf)

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0.destroyConfirm:Find("frame/top/btnBack"), function ()
		setActive(slot0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.destroyConfirm, slot0._tf)

		return
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.destroyConfirm, "frame/actions/confirm_btn"), function ()
		slot0:emit(EquipmentMediator.ON_DESTROY, slot0.selectedIds)
		setActive(slot0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.destroyConfirm, slot0._tf)
		pg.UIMgr.GetInstance().UnblurPanel:unselecteAllEquips()

		return
	end, SFX_UI_EQUIPMENT_RESOLVE)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})
	pg.UIMgr.GetInstance():OverlayPanel(slot0.topItems, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})

	slot1 = setActive
	slot2 = slot0.equipmentBtn.parent

	if slot0.mode ~= slot0.OVERVIEW or slot0.warp ~= slot0.WARP_TO_WEAPON then
		slot3 = false
	else
		slot3 = true
	end

	slot1(slot2, slot3)

	return
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.destroyConfirm) then
		triggerButton(findTF(slot0.destroyConfirm, "actions/cancel_button"))

		return
	end

	if go(slot0.assignedItemPanel._tf).activeSelf then
		slot0.assignedItemPanel:hide()

		return
	end

	triggerButton(slot0.backBtn)

	return
end

function slot0.hasEliteEquips(slot0, slot1, slot2)
	function slot4(slot0, slot1)
		if not _.include(slot0, slot0) then
			slot0[slot1] = slot0
		end

		return
	end

	_.each(slot1, function (slot0)
		if slot0[slot0[1]].config.level > 1 then
			slot1(i18n("destroy_high_intensify_tip"), 2)
		end

		if slot2.config.rarity >= 4 then
			slot1(i18n("destroy_high_rarity_tip"), 1)
		end

		return
	end)

	return {
		"",
		""
	}
end

function slot0.updateCapacity(slot0)
	if slot0.contextData.warp == slot0.WARP_TO_DESIGN or slot0.contextData.warp == slot0.WARP_TO_MATERIAL then
		return
	end

	setText(slot0.tip, "")
	setText(slot0.capacityTF, slot0.capacity .. "/" .. slot0.player.equip_bag_max)

	return
end

function slot0.setCapacity(slot0, slot1)
	slot0.capacity = slot1

	return
end

function slot0.setShip(slot0, slot1)
	if not slot0.contextData.mode then
		slot2 = EquipmentScene.OVERVIEW
	end

	slot0.mode = slot2
	slot0.shipVO = slot1

	if slot1 then
		if slot0.mode == EquipmentScene.EQUIPMENT then
			slot0.contextData.qiutBtn = defaultValue(slot1:getEquip(slot0.contextData.pos), nil)
		else
			if slot0.mode == EquipmentScene.SKIN then
				slot0.contextData.qiutBtn = slot1:getEquip(slot0.contextData.pos).hasSkin(slot2)
			end
		end

		slot0.showBusyEquip = true

		setActive(findTF(slot0.filterBusyToggle, "on"), true)
		setActive(findTF(slot0.filterBusyToggle, "off"), false)

		slot0.filterBusyToggle:GetComponent(typeof(Toggle)).isOn = true

		setActive(slot0.bottomPanel, false)
	end

	return
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	if not slot0.inMaterial then
		slot0:updateCapacity()
	end

	return
end

function slot0.initSort(slot0)
	onButton(slot0, slot0.decBtn, function ()
		slot0.asc = not slot0.asc
		slot0.contextData.asc = slot0.asc

		slot0.contextData:filterEquipment()

		return
	end)

	slot0.sortButtons = {}

	eachChild(slot0.sortContain, function (slot0)
		setActive(slot0, false)

		return
	end)

	for slot4, slot5 in ipairs(slot0.sort) do
		if slot4 > slot0.sortContain.childCount or not slot0.sortContain:GetChild(slot4 - 1) then
			slot6 = cloneTplTo(slot0.sortTpl, slot0.sortContain)
		end

		setActive(slot6, true)
		setImageSprite(findTF(slot6, "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", slot5.spr), true)
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				slot0.contextData.sortData = slot0.contextData

				slot0:filterEquipment()
				triggerToggle(slot0.sortBtn, false)
			end

			return
		end, SFX_PANEL)

		slot0.sortButtons[slot4] = slot6
	end

	slot0.contextData.sortData = slot0.sort[1]

	return
end

function slot0.initEquipmentIndex(slot0)
	slot0.indexButtons = {}

	eachChild(slot0.indexContain, function (slot0)
		setActive(slot0, false)

		return
	end)

	for slot4, slot5 in ipairs(slot0.index) do
		if slot4 > slot0.indexContain.childCount or not slot0.indexContain:GetChild(slot4 - 1) then
			slot6 = cloneTplTo(slot0.indexTpl, slot0.indexContain)
		end

		setActive(slot6, true)
		setImageSprite(findTF(slot6, "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", slot5.spr), true)
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				slot0.contextData.indexData = slot0.contextData

				slot0:filterEquipment()
				triggerToggle(slot0.indexBtn, false)
			end

			return
		end, SFX_PANEL)

		slot0.indexButtons[slot4] = slot6
	end

	slot0.contextData.indexData = slot0.index[1]

	return
end

function slot0.updatePageFilterButtons(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.index) do
		triggerToggle(slot0.indexButtons[slot5], false)
		setActive(slot0.indexButtons[slot5], table.contains(slot6.pages, slot1))
	end

	for slot5, slot6 in ipairs(slot0.sort) do
		triggerToggle(slot0.sortButtons[slot5], false)
		setActive(slot0.sortButtons[slot5], table.contains(slot6.pages, slot1))
	end

	return
end

function slot0.initEquipments(slot0)
	slot0.isInitWeapons = true
	slot0.equipmentRect = slot0.equipmentView:GetComponent("LScrollRect")

	function slot0.equipmentRect.onInitItem(slot0)
		slot0:initEquipment(slot0)

		return
	end

	slot0.equipmentRect.decelerationRate = 0.07

	function slot0.equipmentRect.onUpdateItem(slot0, slot1)
		slot0:updateEquipment(slot0, slot1)

		return
	end

	function slot0.equipmentRect.onStart()
		slot0:updateSelected()

		return
	end

	slot0.equipmentRect:ScrollTo(0)

	return
end

function slot0.initEquipment(slot0, slot1)
	slot2 = EquipmentItem.New(slot1)

	onButton(slot0, slot2.go, function ()
		if slot0.equipmentVO.isSkin then
			if not slot0.equipmentVO.shipId then
				slot1:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, slot0.equipmentVO.id, slot1.contextData.pos)
			else
				slot1:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, slot0.equipmentVO.id, slot1.contextData.pos, {
					id = slot0.equipmentVO.shipId,
					pos = slot0.equipmentVO.shipPos
				})
			end
		else
			if slot0.equipmentVO.mask then
				return
			end

			if slot1.selectEnabled then
				slot1:selectEquip(slot0.equipmentVO, slot0.equipmentVO.count)

				return
			end

			if (not slot1.shipVO or not {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				equipmentId = slot0.equipmentVO.id,
				shipId = slot0.equipmentVO.id.contextData.shipId,
				pos = slot0.equipmentVO.id.contextData.shipId.contextData.pos,
				oldShipId = slot0.equipmentVO.shipId,
				oldPos = slot0.equipmentVO.shipPos
			}) and (not slot0.equipmentVO.shipId or not {
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				equipmentId = slot0.equipmentVO.id,
				shipId = slot0.equipmentVO.shipId,
				pos = slot0.equipmentVO.shipPos
			}) then
			end

			slot1:emit(slot2.ON_EQUIPMENT, slot0)
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot2.unloadBtn, function ()
		if slot0.mode and slot0.mode == EquipmentScene.SKIN then
			slot0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT_SKIN)
		else
			if slot0.mode and slot0.mode == EquipmentScene.EQUIPMENT then
				slot0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT)
			end
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot2.reduceBtn, function ()
		slot0:selectEquip(slot1.equipmentVO, 1)

		return
	end, SFX_PANEL)

	slot0.equipmetItems[slot1] = slot2

	return
end

function slot0.updateEquipment(slot0, slot1, slot2)
	if not slot0.equipmetItems[slot2] then
		slot0:initEquipment(slot2)

		slot3 = slot0.equipmetItems[slot2]
	end

	slot3:update(slot0.loadEquipmentVOs[slot1 + 1])

	slot5 = false
	slot6 = 0

	if slot0.loadEquipmentVOs[slot1 + 1] then
		for slot10, slot11 in ipairs(slot0.selectedIds) do
			if slot4.id == slot11[1] then
				slot5 = true
				slot6 = slot11[2]

				break
			end
		end
	end

	slot3:updateSelected(slot5, slot6)

	return
end

function slot0.updateEquipmentCount(slot0, slot1)
	slot3 = slot0.equipmentRect
	slot2 = slot0.equipmentRect.SetTotalCount

	if not slot1 then
		slot4 = #slot0.loadEquipmentVOs
	end

	slot2(slot3, slot4, -1)

	return
end

function slot0.filterEquipment(slot0)
	slot2 = slot0.contextData.indexData.types
	slot4 = slot0.contextData.sortData
	slot0.pageEquipments = {}
	slot0.loadEquipmentVOs = {}

	if slot0.page == slot0 then
		for slot8, slot9 in pairs(slot0.equipmentVOs) do
			if slot9.isSkin then
				table.insert(slot0.pageEquipments, slot9)
			end
		end
	else
		if slot3 == slot1 then
			for slot8, slot9 in pairs(slot0.equipmentVOs) do
				if not slot9.isSkin then
					table.insert(slot0.pageEquipments, slot9)
				end
			end
		end
	end

	if slot2 then
		if slot3 == slot0 then
			slot5 = pg.equip_skin_template

			function slot6(slot0, slot1)
				for slot5, slot6 in pairs(slot0) do
					if _.any(slot1, function (slot0)
						if slot0 ~= slot0 then
							slot1 = false
						else
							slot1 = true
						end

						return slot1
					end) then
						return true
					end
				end

				return false
			end

			for slot10, slot11 in pairs(slot0.pageEquipments) do
				if slot11.count > 0 and slot11.isSkin and slot6(slot5[slot11.id].equip_type, slot2) and slot0:checkFitBusyCondition(slot11) then
					table.insert(slot0.loadEquipmentVOs, slot11)
				end
			end
		else
			if slot3 == slot1 then
				for slot8, slot9 in pairs(slot0.pageEquipments) do
					if (slot9.count > 0 or slot9.shipId) and not slot9.isSkin and table.contains(slot2, slot9.config.type) and slot0:checkFitBusyCondition(slot9) then
						table.insert(slot0.loadEquipmentVOs, slot9)
					end
				end
			end
		end
	else
		for slot8, slot9 in pairs(slot0.pageEquipments) do
			if (slot9.count > 0 or slot9.shipId) and slot0:checkFitBusyCondition(slot9) then
				table.insert(slot0.loadEquipmentVOs, slot9)
			end
		end
	end

	if slot0.filterImportance ~= nil then
		for slot8 = #slot0.loadEquipmentVOs, 1, -1 do
			if slot0.loadEquipmentVOs[slot8].isSkin or (not slot9.isSkin and slot9:isImportance()) then
				table.remove(slot0.loadEquipmentVOs, slot8)
			end
		end
	end

	if slot4 then
		slot5 = slot0.asc

		table.sort(slot0.loadEquipmentVOs, function (slot0, slot1)
			return slot0:sortFunc(slot1, slot1, slot0.sortFunc)
		end)
	end

	if slot0.contextData.qiutBtn then
		table.insert(slot0.loadEquipmentVOs, 1, nil)

		if #slot0.loadEquipmentVOs == 0 then
			slot0:updateEquipmentCount(1)

			return
		end
	end

	slot0:updateSelected()
	slot0:updateEquipmentCount()
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", slot4.spr), true)
	setImageSprite(slot0:findTF("Image", slot0.indexBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", slot1.spr), true)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)

	return
end

function slot0.checkFitBusyCondition(slot0, slot1)
	if slot0.selectEnabled or not slot0.showBusyEquip then
		slot2 = not slot1.shipId
	end

	return slot2
end

function slot0.setItems(slot0, slot1)
	slot0.itemVOs = slot1

	if slot0.isInitItems and slot0.contextData.warp == slot0.WARP_TO_MATERIAL then
		slot0:sortItems()
	end

	return
end

function slot0.initItems(slot0)
	slot0.isInitItems = true
	slot0.itemRect = slot0.itemView:GetComponent("LScrollRect")

	function slot0.itemRect.onInitItem(slot0)
		slot0:initItem(slot0)

		return
	end

	function slot0.itemRect.onUpdateItem(slot0, slot1)
		slot0:updateItem(slot0, slot1)

		return
	end

	slot0.itemRect.decelerationRate = 0.07

	slot0.itemRect:ScrollTo(0)

	return
end

function slot0.sortItems(slot0)
	table.sort(slot0.itemVOs, function (slot0, slot1)
		if slot0:getConfig("rarity") == slot1:getConfig("rarity") then
			if slot0.id >= slot1.id then
				slot4 = false
			else
				slot4 = true
			end

			return slot4
		else
			if slot3 >= slot2 then
				slot4 = false
			else
				slot4 = true
			end

			return slot4
		end

		return
	end)
	slot0.itemRect:SetTotalCount(#slot0.itemVOs, -1)

	return
end

function slot0.initItem(slot0, slot1)
	onButton(slot0, ItemCard.New(slot1).go, function ()
		if slot0.itemVO:getTempCfgTable().open_ui[1] > 0 then
			slot1:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.ITEM_ORIGIN_PAGE, {
				itemVO = slot0.itemVO,
				open_ui = slot0.itemVO:getTempCfgTable().open_ui[1]
			})
		else
			if slot0.itemVO:getConfig("type") == Item.ASSIGNED_TYPE then
				slot1.assignedItemPanel:show()
				slot1.assignedItemPanel:update(slot0.itemVO)
			else
				slot1:emit(slot2.ON_ITEM, slot0.itemVO.id)
			end
		end

		return
	end, SFX_PANEL)

	slot0.itemCards[slot1] = ItemCard.New(slot1)

	return
end

function slot0.updateItem(slot0, slot1, slot2)
	if not slot0.itemCards[slot2] then
		slot0:initItem(slot2)

		slot3 = slot0.itemCards[slot2]
	end

	slot3:update(slot0.itemVOs[slot1 + 1])

	return
end

function slot0.selectCount(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.selectedIds) do
		slot1 = slot1 + slot6[2]
	end

	return slot1
end

function slot0.selectEquip(slot0, slot1, slot2)
	if not slot0:checkDestroyGold(slot1, slot2) then
		return
	end

	if not slot0.selectEnabled then
	else
		slot3 = false
		slot4 = nil
		slot5 = 0

		for slot9, slot10 in pairs(slot0.selectedIds) do
			if slot10[1] == slot1.id then
				slot3 = true
				slot4 = slot9
				slot5 = slot10[2]

				break
			end
		end

		if not slot3 then
			slot6, slot7 = slot0.checkEquipment(slot1, function ()
				slot0:selectEquip(slot0, )

				return
			end, slot0.selectedIds)

			if not slot6 then
				if slot7 then
					pg.TipsMgr:GetInstance():ShowTips(slot7)
				end

				return
			end

			if slot0.selectedMax < slot0:selectCount() + slot2 then
				slot2 = slot0.selectedMax - slot8
			end

			if slot0.selectedMax == 0 or slot8 < slot0.selectedMax then
				table.insert(slot0.selectedIds, {
					slot1.id,
					slot2
				})
			else
				if slot0.selectedMax == 1 then
					slot0.selectedIds[1] = {
						slot1.id,
						slot2
					}
				else
					pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_equipmentScene_selectError_more", slot0.selectedMax))

					return
				end
			end
		else
			if slot5 - slot2 > 0 then
				slot0.selectedIds[slot4][2] = slot5 - slot2
			else
				table.remove(slot0.selectedIds, slot4)
			end
		end
	end

	slot0:updateSelected()

	return
end

function slot0.unselecteAllEquips(slot0)
	slot0.selectedIds = {}

	slot0:updateSelected()

	return
end

function slot0.checkDestroyGold(slot0, slot1, slot2)
	slot3 = 0
	slot4 = false

	for slot8, slot9 in pairs(slot0.selectedIds) do
		slot10 = slot9[2]

		if pg.equip_data_template[slot9[1]] then
			if not slot11.destory_gold then
				slot12 = 0
			end

			slot3 = slot3 + slot12 * slot10
		end

		if slot1 and slot9[1] == slot1.configId then
			slot4 = true
		end
	end

	if not slot4 and slot1 and slot2 > 0 then
		if not pg.equip_data_template[slot1.configId].destory_gold then
			slot6 = 0
		end

		slot3 = slot3 + slot6 * slot2
	end

	if slot0.player:GoldMax(slot3) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function slot0.updateSelected(slot0)
	for slot4, slot5 in pairs(slot0.equipmetItems) do
		if slot5.equipmentVO then
			slot6 = false
			slot7 = 0

			for slot11, slot12 in pairs(slot0.selectedIds) do
				if slot5.equipmentVO.id == slot12[1] then
					slot6 = true
					slot7 = slot12[2]

					break
				end
			end

			slot5:updateSelected(slot6, slot7)
		end
	end

	slot1 = slot0:selectCount()

	if slot0.selectedMax == 0 then
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), slot1)
	else
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), slot1 .. "/" .. slot0.selectedMax)
	end

	if #slot0.selectedIds < slot0.selectedMin then
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), true)
	else
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), false)
	end

	return
end

function slot0.displayDestroyBonus(slot0)
	slot1 = {}
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.selectedIds) do
		if pg.equip_data_template[slot7[1]] then
			if not slot8.destory_item then
				slot9 = {}
			end

			if not slot8.destory_gold then
				slot10 = 0
			end

			slot2 = slot2 + slot10 * slot7[2]

			for slot14, slot15 in ipairs(slot9) do
				slot16 = false

				for slot20, slot21 in ipairs(slot1) do
					if slot15[1] == slot1[slot20].id then
						slot1[slot20].count = slot1[slot20].count + slot15[2] * slot7[2]
						slot16 = true

						break
					end
				end

				if not slot16 then
					table.insert(slot1, {
						type = DROP_TYPE_ITEM,
						id = slot15[1],
						count = slot15[2] * slot7[2]
					})
				end
			end
		end
	end

	if slot2 > 0 then
		table.insert(slot1, {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = slot2
		})
	end

	slot3 = setActive
	slot4 = slot0.destroyNoGotTip

	if #slot1 > 0 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	if not slot0.destroyList then
		slot0.destroyList = UIItemList.New(slot0.destroyBonusList, slot0.destroyBonusItem)
	end

	slot0.destroyList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			if slot0[slot1 + 1].type == DROP_TYPE_SHIP then
				slot1.hasShip = true
			end

			updateDrop(slot2:Find("bg"), slot3)

			slot4, slot5 = contentWrap(slot3.cfg.name, 10, 2)

			if slot4 then
				slot5 = slot5 .. "..."
			end

			setText(slot2:Find("bg/name"), slot5)
			onButton(slot1, slot2, function ()
				if slot0.type == DROP_TYPE_RESOURCE or slot0.type == DROP_TYPE_ITEM then
					slot1:emit(slot2.ON_ITEM, slot0.cfg.id)
				else
					if slot0.type == DROP_TYPE_EQUIP then
						slot1:emit(slot2.ON_EQUIPMENT, {
							equipmentId = slot0.cfg.id,
							type = EquipmentInfoMediator.TYPE_DISPLAY
						})
					end
				end

				return
			end, SFX_PANEL)
		end

		return
	end)
	slot0.destroyList:align(#slot1)

	return
end

function slot0.SwitchToDestroy(slot0)
	triggerToggle(slot0.weaponToggle, true)

	slot0.selectEnabled = false

	triggerButton(slot0.BatchDisposeBtn)

	return
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.topItems, slot0._tf)

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	slot0.assignedItemPanel:dispose()

	return
end

return slot0
