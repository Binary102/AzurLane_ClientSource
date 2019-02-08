slot0 = class("EquipmentDesignLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "EquipmentDesignUI"
end

function slot0.setItems(slot0, slot1)
	slot0.itemVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setCapacity(slot0, slot1)
	slot0.capacity = slot1
end

function slot0.init(slot0)
	slot0.parentTF = GameObject.Find("/UICamera/Canvas/UIMain/EquipmentUI2(Clone)")
	slot0.equipmentView = slot0:findTF("equipment_scrollview", slot0.parentTF)
	slot0.designScrollView = slot0:findTF("equipment_scrollview")
	slot0.equipmentTpl = slot0:findTF("equipment_tpl")
	slot0.equipmentContainer = slot0:findTF("equipment_grid", slot0.designScrollView)
	slot0.msgBoxTF = slot0:findTF("msg_panel")

	setActive(slot0.msgBoxTF, false)

	slot0.top = slot0:findTF("top")
	slot0.sortBtn = slot0:findTF("top/sort_button")
	slot0.decBtn = findTF(slot0.sortBtn, "dec_btn")
	slot0.sortImgAsc = findTF(slot0.decBtn, "asc")
	slot0.sortImgDec = findTF(slot0.decBtn, "desc")
	slot0.indexPanel = slot0:findTF("index")
	slot0.tagContainer = slot0:findTF("mask/panel", slot0.indexPanel)
	slot0.tagTpl = slot0:getTpl("mask/panel/tpl", slot0.indexPanel)
	slot0.UIMgr = pg.UIMgr.GetInstance()

	setActive(slot0.equipmentView, false)
	setParent(slot0._tf, slot0.parentTF)
	slot0._tf:SetSiblingIndex(slot0.equipmentView:GetSiblingIndex())
end

slot1 = {
	i18n("word_default"),
	i18n("word_rarity"),
	i18n("word_count"),
	i18n("word_kind")
}
slot2 = {
	"sort_default",
	"sort_rarity",
	"sort_count",
	"sort_kind"
}

function slot0.didEnter(slot0)
	slot0.topPanel = GameObject.Find("/OverlayCamera/Overlay/UIMain/top"):GetComponent("CanvasGroup")

	setParent(slot0.top, slot0.topPanel)
	slot0:initDesigns()
	onToggle(slot0, slot0.sortBtn, function (slot0)
		if slot0 then
			setActive(slot0.indexPanel, true)

			slot0.topPanel.blocksRaycasts = false
		else
			setActive(slot0.indexPanel, false)

			slot0.topPanel.blocksRaycasts = true
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel, function ()
		triggerToggle(slot0.sortBtn, false)
	end, SFX_PANEL)
	slot0:initTags()
end

function slot0.initTags(slot0)
	onButton(slot0, slot0.decBtn, function ()
		slot0.asc = not slot0.asc
		slot0.contextData.asc = slot0.asc

		slot0(slot0.contextData, slot0.contextData.index or 1)
	end)

	slot0.tagTFs = {}

	for slot4, slot5 in ipairs(slot0) do
		slot6 = cloneTplTo(slot0.tagTpl, slot0.tagContainer)

		setImageSprite(findTF(slot6, "Image"), GetSpriteFromAtlas("ui/equipmentdesignui_atlas", slot1[slot4]))
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				slot0:filter(slot0.filter)
				triggerButton(slot0.indexPanel)

				slot0.contextData.index = slot0.contextData
			end
		end, SFX_PANEL)
		table.insert(slot0.tagTFs, slot6)

		if not slot0.contextData.index then
			slot0.contextData.index = slot4
		end
	end

	triggerToggle(slot0.tagTFs[slot0.contextData.index], true)
end

function slot0.initDesigns(slot0)
	slot0.scollRect = slot0.designScrollView:GetComponent("LScrollRect")

	slot0:filter(slot0.contextData.index or 1)

	function slot0.scollRect.onInitItem(slot0)
		slot0:initDesign(slot0)
	end

	function slot0.scollRect.onUpdateItem(slot0, slot1)
		slot0:updateDesign(slot0, slot1)
	end

	slot0.desgins = {}
end

function slot3(slot0, slot1, slot2)
	setImageSprite(findTF(slot0, "tag"), GetSpriteFromAtlas("equiptype", EquipType.type2Tag(pg.equip_data_statistics[slot1.id].type)))
	eachChild(slot3, function (slot0)
		setActive(slot0, false)
	end)

	slot5 = slot1:GetProperties()
	slot6 = (EquipType.Equipment == pg.equip_data_statistics[slot1.id].type and 3) or (slot2 and 8) or 4

	for slot10 = 1, slot6, 1 do
		slot11 = EquipType.Equipment == slot4.type and slot10 == slot6

		setActive((EquipType.Equipment == slot4.type and slot10 == slot6 and slot3:Find("attr_skill")) or slot3:Find("attr_" .. slot10), true)

		slot13 = (EquipType.Equipment == slot4.type and slot10 == slot6 and slot3.Find("attr_skill")) or slot3.Find("attr_" .. slot10):Find("panel/tag")
		slot14 = (EquipType.Equipment == slot4.type and slot10 == slot6 and slot3.Find("attr_skill")) or slot3.Find("attr_" .. slot10):Find("panel")
		slot15 = (EquipType.Equipment == slot4.type and slot10 == slot6 and slot3.Find("attr_skill")) or slot3.Find("attr_" .. slot10):Find("panel/value")
		slot16 = (EquipType.Equipment == slot4.type and slot10 == slot6 and slot3.Find("attr_skill")) or slot3.Find("attr_" .. slot10):Find("lock")

		function slot17(slot0)
			setActive(slot0, not slot0)
			setActive(setActive, slot0)

			return
		end

		if slot10 ~= slot6 then
			slot11 = false
		else
			slot11 = true
		end

		if not slot3.Find("attr_skill") then
			slot12 = slot3.Find("attr_" .. slot10)
		end

		if findTF(slot0, "skill/value") then
			setText(slot18, "")
		end

		if slot11 then
			if slot13 then
				setText(slot13, i18n("skill"))
			end

			slot17(not slot4.skill_id[1])

			slot20 = findTF(slot0, "skill/value")

			if slot4.skill_id[1] then
				slot21 = getSkillConfig(slot19)

				setText(slot15, getSkillName(slot19))

				if slot20 then
					setText(slot20, getSkillDescGet(slot19))
				end
			else
				setText(slot15, "")

				if slot20 then
					setText(slot20, "")
				end
			end
		else
			slot17(not slot5[slot10])

			if slot5[slot10] then
				if slot1.config.type ~= EquipType.Equipment and slot19.type == AttributeType.Reload and slot10 == 4 then
					setText(slot13, i18n("word_attr_cd"))
					setText(slot15, setColorStr(string.format("%0.2f", slot1:getWeaponCD()) .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))
				else
					setText(slot13, AttributeType.Type2Name(slot19.type))
					setText(slot15, slot19.value)
				end
			end
		end
	end
end

function slot0.createDesign(slot0, slot1)
	slot3 = findTF(slot1, "count")
	slot4 = findTF(slot1, "mask")

	return {
		go = slot1,
		nameTxt = ScrollTxt.New(slot0:findTF("name_mask", slot2), slot0:findTF("name_mask/name", findTF(slot1, "equipment_info/panel_white/info_tpl_r"))),
		getItemById = function (slot0, slot1)
			if not slot0.itemVOs[slot1] then
				slot2 = Item.New({
					count = 0,
					id = slot1
				})
			end

			return slot2
		end,
		update = function (slot0, slot1, slot2)
			slot0.designId = slot1
			slot0.itemVOs = slot2

			slot0.nameTxt:setText(pg.equip_data_statistics[pg.compose_data_template[slot1].equip_id].name)
			updateEquipment(slot0, slot6)
			slot3(slot0, Equipment.New({
				id = pg.compose_data_template[slot1].equip_id
			}))
			function ()
				if not slot0.itemVOs[slot1.material_id] then
					slot0 = Item.New({
						count = 0,
						id = slot1.material_id
					})
				end

				if slot1.material_num > slot0.count or not setColorStr(slot1, COLOR_WHITE) then
					slot1 = setColorStr(slot1, COLOR_RED)
				end

				setText(setText, slot1)

				slot2 = setActive
				slot3 = setText

				if slot0.count >= slot1.material_num then
					slot4 = false
				else
					slot4 = true
				end

				slot2(slot3, slot4)

				return
			end()

			return
		end
	}
end

function slot0.initDesign(slot0, slot1)
	onButton(slot0, tf(slot0:createDesign(slot1).go):Find("make_btn"), function ()
		slot0:showDesignDesc(slot1.designId)

		return
	end)

	slot0.desgins[slot1] = slot0.createDesign(slot1)

	return
end

function slot0.updateDesign(slot0, slot1, slot2)
	if not slot0.desgins[slot2] then
		slot0:initDesign(slot2)

		slot3 = slot0.cardItems[slot2]
	end

	slot3:update(slot0.desginIds[slot1 + 1], slot0.itemVOs)

	return
end

function slot0.filter(slot0, slot1)
	slot3 = {}
	slot4 = slot0.asc

	for slot8, slot9 in ipairs(pg.compose_data_template.all) do
		if slot0:getItemById(pg.compose_data_template[slot9].material_id).count > 0 then
			table.insert(slot3, slot9)
		end
	end

	function slot5(slot0)
		return {
			equipmentCfg = pg.equip_data_statistics[slot0[slot0].equip_id],
			designCfg = slot0[slot0],
			id = slot0,
			itemCount = slot1:getItemById(slot0[slot0].material_id).count,
			canMakeCount = math.floor(slot1.getItemById(slot0[slot0].material_id).count / slot0[slot0].material_num),
			canMake = math.min(()["canMakeCount"], 1)
		}
	end

	if slot1 == 1 then
		if slot4 then
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).canMake == slot0(slot1).canMake then
					if slot2.equipmentCfg.rarity == slot3.equipmentCfg.rarity then
						if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					else
						if slot3.equipmentCfg.rarity >= slot2.equipmentCfg.rarity then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					end
				else
					if slot2.canMake >= slot3.canMake then
						slot4 = false
					else
						slot4 = true
					end

					return slot4
				end

				return
			end)
		else
			table.sort(slot3, function (slot0, slot1)
				if slot0(slot0).canMake == slot0(slot1).canMake then
					if slot2.equipmentCfg.rarity == slot3.equipmentCfg.rarity then
						if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					else
						if slot3.equipmentCfg.rarity >= slot2.equipmentCfg.rarity then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					end
				else
					if slot3.canMake >= slot2.canMake then
						slot4 = false
					else
						slot4 = true
					end

					return slot4
				end

				return
			end)
		end
	else
		if slot1 == 2 then
			if slot0.asc then
				table.sort(slot3, function (slot0, slot1)
					if slot0(slot0).equipmentCfg.rarity == slot0(slot1).equipmentCfg.rarity then
						if slot2.equipmentCfg.id >= slot2.equipmentCfg.id then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					end

					if slot2.equipmentCfg.rarity >= slot3.equipmentCfg.rarity then
						slot4 = false
					else
						slot4 = true
					end

					return slot4
				end)
			else
				table.sort(slot3, function (slot0, slot1)
					if slot0(slot0).equipmentCfg.rarity == slot0(slot1).equipmentCfg.rarity then
						if slot2.equipmentCfg.id >= slot2.equipmentCfg.id then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					end

					if slot3.equipmentCfg.rarity >= slot2.equipmentCfg.rarity then
						slot4 = false
					else
						slot4 = true
					end

					return slot4
				end)
			end
		else
			if slot1 == 3 then
				if slot0.asc then
					table.sort(slot3, function (slot0, slot1)
						if slot0(slot0).itemCount == slot0(slot1).itemCount then
							if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then
								slot4 = false
							else
								slot4 = true
							end

							return slot4
						end

						if slot2.itemCount >= slot3.itemCount then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					end)
				else
					table.sort(slot3, function (slot0, slot1)
						if slot0(slot0).itemCount == slot0(slot1).itemCount then
							if slot2.equipmentCfg.id >= slot3.equipmentCfg.id then
								slot4 = false
							else
								slot4 = true
							end

							return slot4
						end

						if slot3.itemCount >= slot2.itemCount then
							slot4 = false
						else
							slot4 = true
						end

						return slot4
					end)
				end
			else
				if slot1 == 4 then
					if slot0.asc then
						table.sort(slot3, function (slot0, slot1)
							if slot0(slot1).equipmentCfg.id >= slot0(slot0).equipmentCfg.id then
								slot4 = false
							else
								slot4 = true
							end

							return slot4
						end)
					else
						table.sort(slot3, function (slot0, slot1)
							if slot0(slot0).equipmentCfg.id >= slot0(slot1).equipmentCfg.id then
								slot4 = false
							else
								slot4 = true
							end

							return slot4
						end)
					end
				end
			end
		end
	end

	slot0.desginIds = slot3

	slot0.scollRect:SetTotalCount(#slot3, 0)
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), slot6)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)

	return
end

function slot0.getItemById(slot0, slot1)
	if not slot0.itemVOs[slot1] then
		slot2 = Item.New({
			count = 0,
			id = slot1
		})
	end

	return slot2
end

function slot0.showDesignDesc(slot0, slot1)
	slot0.isShowDesc = true

	if IsNil(slot0.msgBoxTF) then
		return
	end

	slot0.UIMgr:BlurPanel(slot0.msgBoxTF)
	setActive(slot0.msgBoxTF, true)

	slot2 = slot0:findTF("msgbox", slot0.msgBoxTF)
	slot5 = slot0:findTF("info_tpl_r", slot2)
	slot6 = Equipment.New({
		id = pg.compose_data_template[slot1].equip_id
	})

	updateEquipment(slot5:Find("equip"), slot6)
	slot0(slot5, slot6, true)
	setText(slot5:Find("name"), slot6.config.name)

	slot8 = math.floor(slot0:getItemById(pg.compose_data_template[slot1].material_id).count / pg.compose_data_template[slot1].material_num)
	slot10 = slot0:findTF("count_panel/value/Text", slot2)
	slot11 = pg.compose_data_template[slot1].gold_num
	slot12 = slot0:findTF("confirm_panel/consume/value", slot2)

	slot13(slot9)

	slot0.leftEventTrigger = pressPersistTrigger(slot15, slot14, function ()
		if slot0 <= 1 then
			return
		end

		slot0 = slot0 - 1

		slot1(slot1)

		return
	end, nil, nil, nil, nil, SFX_PANEL)
	slot0.rightEventTrigger = pressPersistTrigger(slot16, slot14, function ()
		if slot0 == slot1 then
			return
		end

		slot0 = slot0 + 1

		slot2(slot2)

		return
	end, nil, nil, nil, nil, SFX_PANEL)

	onButton(slot0, findTF(slot2, "count_panel/max"), function ()
		if slot0 == slot1 then
			return
		end

		1(math.max(math.min(slot1, slot2.player.equip_bag_max - slot2.capacity), 1))

		return
	end, SFX_PANEL)
	onButton(slot0, findTF(slot2, "confirm_panel/cancel_button"), function ()
		slot0:hideMsgBox()

		return
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot2, "confirm_panel/ok_button"), function ()
		slot0:emit(EquipmentDesignMediator.MAKE_EQUIPMENT, slot0, )
		slot0.emit:hideMsgBox()

		return
	end, SFX_CONFIRM)

	slot17 = findTF(slot0.msgBoxTF, "type")

	if not slot6.config.tech then
		slot18 = 1
	end

	for slot22 = 0, slot17.childCount - 1, 1 do
		slot24 = setActive
		slot25 = slot17:GetChild(slot22)

		if slot22 ~= slot18 then
			slot26 = false
		else
			slot26 = true
		end

		slot24(slot25, slot26)
	end

	return
end

function slot0.hideMsgBox(slot0)
	if not IsNil(slot0.msgBoxTF) then
		slot0.isShowDesc = nil

		slot0.UIMgr:UnblurPanel(slot0.msgBoxTF, slot0._tf)
		setActive(slot0.msgBoxTF, false)
	end

	return
end

function slot0.onBackPressed(slot0)
	if slot0.isShowDesc then
		slot0:hideMsgBox()
	else
		playSoundEffect(SFX_CANCEL)
		slot0:emit(slot0.ON_BACK)
	end

	return
end

function slot0.willExit(slot0)
	if slot0.leftEventTrigger then
		ClearEventTrigger(slot0.leftEventTrigger)
	end

	if slot0.rightEventTrigger then
		ClearEventTrigger(slot0.rightEventTrigger)
	end

	setParent(slot0.sortBtn.parent, slot0._tf)

	slot0.topPanel.blocksRaycasts = true

	for slot4, slot5 in pairs(slot0.desgins) do
		if slot5.nameTxt then
			slot5.nameTxt:destroy()

			slot5.nameTxt = nil
		end
	end

	return
end

return slot0
