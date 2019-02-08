slot0 = class("ShipRemouldLayer", import("..base.BaseUI"))
slot1 = 5
slot2 = 6
slot3 = 0.5
slot4 = 40
slot5 = 0
slot6 = Vector2(20, 40)

function slot0.getUIName(slot0)
	return "ShipRemouldUI"
end

function slot0.init(slot0)
	slot0.container = slot0:findTF("main/container")
	slot0.gridContainer = slot0:findTF("main/container/grids")
	slot0.gridTF = slot0:findTF("grid_tpl", slot0.gridContainer)
	slot0.height = slot0.gridTF.sizeDelta.y + slot0
	slot0.width = slot0.gridTF.sizeDelta.x + 
	slot0.startPos = Vector2(-1 * (slot0.gridTF.sizeDelta.x / 2 - 0.5) * slot0.width + slot0.width.x, (slot4 / 2 - 0.5) * slot0.height + slot3.y)
	slot0.containerWidth = (-1 * (slot0.gridTF.sizeDelta.x / 2 - 0.5) * slot0.width + slot0.width.x) * slot0.gridTF.sizeDelta.x + (slot0.gridTF.sizeDelta.x - 1) * (-1 * (slot0.gridTF.sizeDelta.x / 2 - 0.5) * slot0.width + slot0.width.x) * slot0.gridTF.sizeDelta.x
	slot0.containerHeight = slot4 * slot0.gridTF.sizeDelta.y + (slot4 - 1) * slot0
	slot0.container.sizeDelta = Vector2(slot0.containerWidth, slot0.containerHeight)

	setActive(slot0.gridTF, false)

	slot0.infoPanel = slot0:findTF("main/info_panel")
	slot0.itemContainer = slot0:findTF("usages/items", slot0.infoPanel)
	slot0.itemTF = slot0:findTF("itemTF", slot0.itemContainer)
	slot0.infoName = slot0:findTF("name_container/Text", slot0.infoPanel):GetComponent(typeof(Text))
	slot0.attrContainer = slot0:findTF("align/attrs", slot0.infoPanel)
	slot0.attrTpl = slot0:getTpl("attr", slot0.attrContainer)
	slot0.attrTplD = slot0:getTpl("attrd", slot0.attrContainer)
	slot0.confirmBtn = slot0:findTF("confirm_btn/activity", slot0.infoPanel)
	slot0.inactiveBtn = slot0:findTF("confirm_btn/inactivity", slot0.infoPanel)
	slot0.shipTF = slot0:findTF("main/info_panel/usages/shipTF")
	slot0.skillDesc = slot0:findTF("align/skill_desc", slot0.infoPanel)
	slot0.shipContainer = slot0:findTF("char_container", slot0.infoPanel)
	slot0.lineTpl = slot0:findTF("resources/line")
	slot0.lineContainer = slot0:findTF("grids/lines", slot0.container)
	slot0.helpBtn = GameObject.Find("/OverlayCamera/Overlay/UIMain/common/help_btn")

	if not IsNil(slot0.helpBtn) then
		setActive(slot0.helpBtn, false)
	end

	slot0.tooltip = slot0:findTF("tooltip")

	setActive(slot0.tooltip, false)
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	if slot0.curTranformId then
		slot0:updateInfo(slot0.curTranformId)
	end
end

function slot0.setItems(slot0, slot1)
	slot0.itemsVO = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.getItemCount(slot0, slot1)
	return slot0.itemsVO[slot1] or Item.New({
		count = 0,
		id = slot1
	}).count
end

function slot0.setShipVO(slot0, slot1)
	slot0.shipVO = slot1
	slot0.shipGroupId = math.floor(slot0.shipVO:getGroupId())
	slot0.transforms = slot0.shipVO.transforms
end

function slot0.getShipTranformData(slot0)
	return pg.ship_data_trans[slot0.shipGroupId].transform_list
end

function slot0.didEnter(slot0)
	slot0:initTranformInfo()
	slot0:initShipModel()
end

function slot0.initTranformInfo(slot0)
	slot0.transformIds = {}
	slot0.grids = {}

	function slot1(slot0, slot1)
		for slot5, slot6 in ipairs(slot0) do
			if slot6[1] == slot1 then
				return true, slot5
			end
		end

		return false
	end

	slot2 = slot0:getShipTranformData()

	for slot6 = 1, slot0, 1 do
		slot7 = {}
		slot8 = {}

		for slot12 = 1, slot1, 1 do
			slot13, slot14 = slot1(slot2[slot6], slot12)

			if slot13 then
				slot16 = cloneTplTo(slot0.gridTF, slot0.gridContainer)
				go(slot16).name = slot6 .. "/" .. slot12
				slot16.localPosition = Vector2(slot0.startPos.x + slot0.width * (slot6 - 1), slot0.startPos.y - slot0.height * (slot12 - 1))
				slot7[slot12] = slot16

				onToggle(slot0, slot16:Find("info"), function (slot0)
					if slot0 and slot0.curTranformId ~=  then
						slot0:updateInfo(slot0.updateInfo)
					end
				end, SFX_PANEL)

				slot8[slot12] = slot2[slot6][slot14][2]
			end
		end

		slot0.transformIds[slot6] = slot8
		slot0.grids[slot6] = slot7
	end

	slot0.lineTFs = {}

	for slot6, slot7 in pairs(slot0.transformIds) do
		for slot11, slot12 in pairs(slot7) do
			slot0:updateGridTF(slot12)
			slot0:initLines(slot12)
		end
	end

	if slot0.contextData.transformId then
		triggerToggle(slot0:getGridById(slot0.contextData.transformId):Find("info"), true)
	end
end

slot7 = {
	HORIZON = 60,
	VERTICAL = 20
}

function slot0.initLines(slot0, slot1)
	slot0.lineTFs[slot1] = {}
	slot2, slot3 = slot0:getPositionById(slot1)
	slot5 = slot0:getGridById(slot1).localPosition

	setActive(slot0.lineTpl:Find("active"), slot0:canRemould(slot1) or slot0:isFinished(slot1))
	setActive(slot0.lineTpl:Find("in_active"), not (slot0.canRemould(slot1) or slot0.isFinished(slot1)))

	for slot12, slot13 in pairs(slot8) do
		slot14, slot15 = slot0:getPositionById(slot13)
		slot16 = Vector2(slot14 - slot2, slot15 - slot3)
		slot17 = slot0.HORIZON + (math.abs(slot16.x) - 1) * (slot0.gridTF.sizeDelta.x + 40)
		slot18 = slot0.VERTICAL + (math.abs(slot16.y) - 1) * slot0.gridTF.sizeDelta.y
		slot20 = cloneTplTo(slot6, slot0.lineContainer).sizeDelta.y / 2
		slot21 = slot0.gridTF.sizeDelta.x / 2
		slot22 = slot0.gridTF.sizeDelta.y / 2

		if (slot16.x < 0 and slot16.y > 0) or (slot16.x < 0 and slot16.y < 0) then
			table.insert(slot0.lineTFs[slot1], slot23)

			slot24 = false

			for slot28 = slot14 + 1, slot2, 1 do
				if slot0.grids[slot28][slot15] then
					slot24 = true

					break
				end
			end

			if slot16.y > 0 then
				if not slot24 then
					for slot28 = slot3 + 1, slot3, 1 do
						if slot0.grids[slot2][slot28] then
							slot24 = true

							break
						end
					end
				end

				slot19.sizeDelta = Vector2((slot17 + slot21) - 10, slot19.sizeDelta.y)
				slot23.sizeDelta = Vector2((slot18 + slot22) - (10 - slot20) - 7, slot23.sizeDelta.y)
				slot19.localPosition = (slot24 and Vector2(slot5.x - slot21 + 10 + slot20, slot5.y)) or Vector2(slot5.x - slot20, slot0.grids[slot14][slot15].localPosition.y)
				slot23.eulerAngles = (slot24 and Vector3(0, 0, -90)) or Vector3(0, 0, 90)
				slot23.localPosition = (slot24 and Vector2(slot0.grids[slot14][slot15].localPosition.x, slot5.y - slot22 - 10)) or Vector2(slot5.x, slot5.y - slot22 + 10)

				slot0:updateLineAngel(slot19, nil, nil)
				slot0:updateLineAngel(slot23, 2, 0)
			else
				if not slot24 then
					for slot28 = slot15, slot3 - 1, 1 do
						if slot0.grids[slot2][slot28] then
							slot24 = true

							break
						end
					end
				end

				slot19.sizeDelta = Vector2((slot17 + slot21) - 10, slot19.sizeDelta.y)
				slot23.sizeDelta = Vector2((slot18 + slot22) - (10 - slot20) - 7, slot23.sizeDelta.y)
				slot19.localPosition = (slot24 and Vector2(slot5.x - slot21 + 10 + slot20, slot5.y)) or Vector2(slot5.x - slot20, slot0.grids[slot14][slot15].localPosition.y)
				slot23.eulerAngles = (slot24 and Vector3(0, 0, 90)) or Vector3(0, 0, -90)
				slot23.localPosition = (slot24 and Vector2(slot0.grids[slot14][slot15].localPosition.x, slot5.y + slot22 + 10)) or Vector2(slot5.x, (slot5.y + slot22) - 10)
				slot23.localScale = Vector2(1, -1)

				slot0:updateLineAngel(slot19, nil, nil)
				slot0:updateLineAngel(slot23, 2, 0)
			end
		elseif (slot16.x == 0 and slot16.y > 0) or (slot16.x == 0 and slot16.y < 0) then
			slot19.eulerAngles = (slot16.y < 0 and Vector3(0, 0, 90)) or Vector3(0, 0, -90)
			slot19.sizeDelta = Vector2(slot18, slot19.sizeDelta.y)
			slot19.localPosition = (slot16.y < 0 and Vector2(slot5.x, slot5.y + slot22 + 10)) or Vector2(slot5.x, slot5.y - slot22 - 10)

			slot0:updateLineAngel(slot19, nil, nil)
		elseif slot16.y == 0 and slot16.x < 0 then
			slot19.sizeDelta = Vector2(slot17, slot19.sizeDelta.y)
			slot19.localPosition = Vector2(slot5.x - slot21 + 10, slot5.y)

			slot0:updateLineAngel(slot19, nil, nil)
		end

		table.insert(slot0.lineTFs[slot1], slot19)
	end
end

function slot0.updateLineAngel(slot0, slot1, slot2, slot3)
	slot4("active", "angle_left", slot2)
	slot4("in_active", "angle_left", slot2)
	slot4("active", "angle_right", slot3)
	function (slot0, slot1, slot2)
		setActive(slot0:Find(slot3), slot2)
		setActive(slot0:Find(slot3 .. "/1"), slot2 and slot2 == 1)
		setActive(slot0:Find(slot3 .. "/2"), slot2 and slot2 == 2)
	end("in_active", "angle_right", slot3)
end

function slot0.getLevelById(slot0, slot1)
	return pg.transform_data_template[slot1].level_limit
end

function slot0.getPositionById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.transformIds) do
		for slot10, slot11 in pairs(slot6) do
			if slot1 == slot11 then
				return slot5, slot10
			end
		end
	end
end

function slot0.getGridById(slot0, slot1)
	slot2, slot3 = slot0:getPositionById(slot1)

	return slot0.grids[slot2][slot3]
end

function slot0.updateGridTF(slot0, slot1)
	slot3 = slot0:getLevelById(slot1)

	setText(slot0:getGridById(slot1).Find(slot2, "name"), pg.transform_data_template[slot1].name)

	slot5 = 0

	if slot0.shipVO.transforms[slot1] then
		slot5 = slot0.shipVO.transforms[slot1].level
	end

	slot6 = slot5 == slot4.max_level
	slot7, slot8 = slot0:canRemould(slot1)

	setActive(slot2:Find("info/finished"), slot5 == slot4.max_level)
	setActive(slot2:Find("info/tag_finished"), slot5 == slot4.max_level)
	setActive(slot2:Find("mask"), not slot7 and not (slot5 == slot4.max_level))
	setActive(slot2:Find("mask/level_tip"), not slot7 and not (slot5 == slot4.max_level))
	setText(slot2:Find("mask/level_tip/Text"), slot8)
	setText(slot2:Find("info/progress"), ((slot7 or slot6) and slot5 .. "/" .. slot4.max_level) or "")
	setTextColor(slot2:Find("info/progress"), (slot6 and Color.New(1, 1, 1, 1)) or Color.New(1, 0.9137254901960784, 0.19607843137254902, 1))

	slot10 = slot2:Find("info/itemTF/bg/icon"):GetComponent(typeof(Image))

	GetSpriteFromAtlasAsync("modicon", slot4.icon, function (slot0)
		if not IsNil(slot0) then
			slot0.sprite = slot0
		end

		return
	end)
	setGray(slot2:Find("info"), not slot7 and not slot6, true)

	GetOrAddComponent(slot2:Find("info"), typeof(CanvasGroup)).alpha = ((slot7 or slot6) and 1) or 0.6

	return

	slot6 = false

	if false then
		slot6 = true
	end

	slot9 = not (slot5 == slot4.max_level)

	if not (slot5 == slot4.max_level) then
		slot9 = false

		if false then
			slot9 = true
		end
	end

	if not slot6 or not (slot5 .. "/" .. slot4.max_level) then
		slot12 = ""
	end

	if not Color.New(1, 1, 1, 1) then
		slot12 = Color.New(1, 0.9137254901960784, 0.19607843137254902, 1)
	end

	slot13 = not slot6

	if not slot6 then
		slot13 = false

		if false then
			slot13 = true
		end
	end

	if slot6 then
		slot12 = 1
	else
		slot12 = 0.6
	end
end

function slot0.updateLines(slot0)
	for slot4, slot5 in pairs(slot0.transformIds) do
		for slot9, slot10 in pairs(slot5) do
			slot0:updateGridTF(slot10)

			if slot0:canRemould(slot10) then
				slot11 = ipairs

				if not slot0.lineTFs[slot10] then
					slot12 = {}
				end

				for slot14, slot15 in slot11(slot12) do
					setActive(slot15:Find("active"), true)
					setActive(slot15:Find("in_active"), false)
				end
			end
		end
	end

	return
end

function slot0.initShipModel(slot0)
	slot1 = slot0.shipVO:getPrefab()

	if slot0.shipContainer.childCount ~= 0 then
		PoolMgr.GetInstance():ReturnSpineChar(slot1, go(slot0.shipModel))
	end

	function slot2(slot0)
		if not IsNil(slot0._tf) then
			slot1 = tf(slot0)
			slot0.shipModel = slot1
			slot0.spineAnimUI = slot1:GetComponent("SpineAnimUI")

			pg.ViewUtils.SetLayer(slot1, Layer.UI)

			slot1.localScale = Vector3(slot1, slot1, 1)

			setParent(slot1, slot0.shipContainer)

			slot1.localPosition = Vector2(0, 10)

			slot0.spineAnimUI:SetAction("stand2", 0)
		end

		return
	end

	PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)
		slot0(slot0)

		return
	end)

	return
end

function slot0.updateInfo(slot0, slot1)
	if slot0:isFinished(slot1) then
		slot0:updateFinished(slot1)
	else
		slot0:updateProgress(slot1)
	end

	return
end

function slot0.updateFinished(slot0, slot1)
	slot0.curTranformId = slot1
	slot0.infoName.text = pg.transform_data_template[slot1].name
	slot4 = {}

	for slot8 = 1, slot0.transforms[slot1].level, 1 do
		_.each(slot3.use_item[slot8], function (slot0)
			if not _.detect(slot0, function (slot0)
				if slot0.type ~= DROP_TYPE_ITEM or slot0.id ~= slot0[1] then
					slot1 = false
				else
					slot1 = true
				end

				return slot1
			end) then
				table.insert(slot0, {
					type = DROP_TYPE_ITEM,
					id = slot0[1],
					count = slot0[2]
				})
			else
				slot1.count = slot1.count + slot0[2]
			end

			return
		end)
	end

	table.insert(slot4, {
		type = DROP_TYPE_ITEM,
		id = id2ItemId(1),
		count = slot3.use_gold * slot2
	})

	for slot9 = slot0.itemContainer.childCount, #slot4 - 1, 1 do
		cloneTplTo(slot0.itemTF, slot0.itemContainer)
	end

	for slot9 = 1, slot0.itemContainer.childCount, 1 do
		slot11 = setActive
		slot12 = slot0.itemContainer:GetChild(slot9 - 1)

		if slot9 > #slot4 then
			slot13 = false
		else
			slot13 = true
		end

		slot11(slot12, slot13)

		if slot9 <= #slot4 then
			updateDrop(slot10, slot4[slot9])
		end
	end

	slot6 = setActive
	slot7 = slot0.shipTF

	if slot3.use_ship <= 0 then
		slot8 = false
	else
		slot8 = true
	end

	slot6(slot7, slot8)

	if slot3.use_ship > 0 then
		setActive(slot0.shipTF:Find("addTF"), false)
		setActive(slot0.shipTF:Find("icon_bg"), true)
		updateDrop(slot0.shipTF, {
			type = DROP_TYPE_SHIP,
			id = slot0.shipVO.configId
		})
	end

	slot6 = setActive
	slot7 = slot0.skillDesc

	if slot3.skill_id == 0 then
		slot8 = false
	else
		slot8 = true
	end

	slot6(slot7, slot8)

	if slot3.skill_id ~= 0 then
		setText(slot0.skillDesc, i18n("ship_remould_material_unlock_skill", HXSet.hxLan(pg.skill_data_template[slot3.skill_id].name)))
	end

	removeAllChildren(slot0.attrContainer)
	_.each(slot3.ship_id, function (slot0)
		if slot0[1] == slot0.shipVO.configId then
			slot1 = slot0[2]
		end

		if pg.ship_data_template[slot0[1]].group_type == slot0.shipVO.groupId then
			slot2 = pg.ship_data_statistics[slot0[2]].type
		end

		return
	end)

	if nil then
		slot8 = cloneTplTo(slot0.attrTplD, slot0.attrContainer)

		setText(slot8:Find("name"), i18n("common_ship_type"))
		setText(slot8:Find("value"), ShipType.Type2Name(slot7))
		setActive(slot9, true)
		onButton(slot0, slot8, function ()
			slot0:showToolTip(slot0)

			return
		end)
	else
		slot8 = _.reduce(slot3.effect, {}, function (slot0, slot1)
			for slot5, slot6 in pairs(slot1) do
				if not slot0[slot5] then
					slot7 = 0
				end

				slot0[slot5] = slot7 + slot6
			end

			return slot0
		end)

		for slot13, slot14 in pairs(slot9) do
			if slot8[slot13] then
				slot0:updateAttrTF_D(cloneTplTo(slot0.attrTplD, slot0.attrContainer), {
					attrName = AttributeType.Type2Name(slot13),
					value = math.floor(slot14),
					addition = slot8[slot13]
				})
			end
		end

		slot10 = pg.ship_data_template[slot0.shipVO.configId]

		for slot14 = 1, 3, 1 do
			if slot8["equipment_proficiency_" .. slot14] then
				slot0:updateAttrTF_D(cloneTplTo(slot0.attrTplD, slot0.attrContainer), {
					attrName = EquipType.type2Title(slot14, slot10["equip_" .. slot14][1]) .. i18n("common_proficiency"),
					value = slot0.shipVO:getEquipProficiencyByPos(slot14) * 100,
					addition = slot8["equipment_proficiency_" .. slot14] * 100
				}, true)
			end
		end
	end

	setActive(slot0.confirmBtn, false)
	setActive(slot0.inactiveBtn, false)

	slot0.contextData.transformId = slot1

	return
end

function slot0.updateProgress(slot0, slot1)
	if not slot0.transforms[slot1] or not slot0.transforms[slot1].level then
		slot2 = 0
	end

	slot0.curTranformId = slot1
	slot0.infoName.text = pg.transform_data_template[slot1].name
	slot4, slot5 = slot0:canRemould(slot1)

	if not pg.transform_data_template[slot1].effect[slot2 + 1] then
		slot6 = {}
	end

	setActive(slot0.shipTF, false)
	setText(slot0.skillDesc, "")

	slot7 = {}

	if table.getCount(slot6) > 0 then
		if not Clone(slot3.use_item[slot2]) then
			slot7 = {}
		end

		table.insert(slot7, {
			id2ItemId(1),
			slot3.use_gold
		})

		if slot3.use_ship ~= 0 then
			setActive(slot0.shipTF, true)

			if slot0.contextData.materialShipIds then
				if table.getCount(slot8) == 0 then
					slot9 = false
				else
					slot9 = true
				end
			end

			setActive(slot0.shipTF:Find("icon_bg"), slot9)
			setActive(slot0.shipTF:Find("addTF"), not slot9)

			if slot9 then
				updateDrop(slot0.shipTF, {
					id = slot0.shipVOs[slot8[1]].configId,
					type = DROP_TYPE_SHIP
				})
			end

			onButton(slot0, slot0.shipTF, function ()
				if slot0 then
					slot1:emit(ShipRemouldMediator.ON_SELECTE_SHIP, slot1.shipVO)
				else
					pg.TipsMgr:GetInstance():ShowTips(slot2)
				end

				return
			end, SFX_PANEL)
		else
			slot0.contextData.materialShipIds = nil
		end

		slot8 = setActive
		slot9 = slot0.skillDesc

		if slot3.skill_id == 0 then
			slot10 = false
		else
			slot10 = true
		end

		slot8(slot9, slot10)

		if slot3.skill_id ~= 0 then
			setText(slot0.skillDesc, i18n("ship_remould_material_unlock_skill", HXSet.hxLan(pg.skill_data_template[slot3.skill_id].name)))
		end
	else
		slot0.contextData.materialShipIds = nil
	end

	for slot12 = slot0.itemContainer.childCount, #slot7 - 1, 1 do
		cloneTplTo(slot0.itemTF, slot0.itemContainer)
	end

	for slot12 = 1, slot0.itemContainer.childCount, 1 do
		slot14 = setActive
		slot15 = slot0.itemContainer:GetChild(slot12 - 1)

		if slot12 > #slot7 then
			slot16 = false
		else
			slot16 = true
		end

		slot14(slot15, slot16)

		if slot12 <= #slot7 then
			slot15 = ""

			if slot7[slot12][1] == id2ItemId(1) then
				slot16 = setColorStr
				slot17 = slot14[2]

				if slot0.playerVO.gold >= slot14[2] or not COLOR_RED then
					slot18 = COLOR_WHITE
				end

				slot15 = slot16(slot17, slot18)
			else
				slot16 = setColorStr
				slot17 = slot0:getItemCount(slot14[1])

				if slot0:getItemCount(slot14[1]) >= slot14[2] or not COLOR_RED then
					slot18 = COLOR_WHITE
				end

				slot15 = slot16(slot17, slot18) .. "/" .. slot14[2]
			end

			updateDrop(slot13, {
				id = slot14[1],
				type = DROP_TYPE_ITEM,
				count = slot15
			})
		end
	end

	removeAllChildren(slot0.attrContainer)
	_.each(slot3.ship_id, function (slot0)
		if slot0[1] == slot0.shipVO.configId then
			slot1 = slot0[2]
		end

		if pg.ship_data_template[slot0[1]].group_type == slot0.shipVO.groupId then
			slot2 = pg.ship_data_statistics[slot0[2]].type
		end

		return
	end)

	if nil then
		slot11 = cloneTplTo(slot0.attrTpl, slot0.attrContainer)

		setText(slot11:Find("name"), i18n("common_ship_type"))
		setText(slot11:Find("pre_value"), ShipType.Type2Name(slot0.shipVO:getShipType()))
		setText(slot11:Find("value"), ShipType.Type2Name(slot10))
		setActive(slot11:Find("addtion"), false)

		slot12 = slot11:Find("quest")

		if slot9 then
			setActive(slot12, true)
			onButton(slot0, slot11, function ()
				slot0:showToolTip(slot0)

				return
			end)
		else
			setActive(slot12, false)
		end
	else
		slot6.antisub = nil

		for slot15, slot16 in pairs(slot11) do
			if slot6[slot15] then
				slot0:updateAttrTF(cloneTplTo(slot0.attrTpl, slot0.attrContainer), {
					attrName = AttributeType.Type2Name(slot15),
					value = math.floor(slot16),
					addition = slot6[slot15]
				})
			end
		end

		slot12 = pg.ship_data_template[slot0.shipVO.configId]

		for slot16 = 1, 3, 1 do
			if slot6["equipment_proficiency_" .. slot16] then
				slot0:updateAttrTF(cloneTplTo(slot0.attrTpl, slot0.attrContainer), {
					attrName = EquipType.type2Title(slot16, slot12["equip_" .. slot16][1]) .. i18n("common_proficiency"),
					value = slot0.shipVO:getEquipProficiencyByPos(slot16) * 100,
					addition = slot6["equipment_proficiency_" .. slot16] * 100
				}, true)
			end
		end
	end

	slot11 = slot0:isEnoughResource(slot1)
	slot12 = setActive
	slot13 = slot0.confirmBtn

	if slot4 then
		slot14 = slot11
	end

	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot0.inactiveBtn

	if slot4 then
		slot14 = not slot11

		if not slot11 then
			slot14 = false
		end
	else
		slot14 = true
	end

	slot12(slot13, slot14)
	onButton(slot0, slot0.confirmBtn, function ()
		slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		slot2, slot3 = slot0:canRemould(slot1)

		if not slot2 then
			pg.TipsMgr:GetInstance():ShowTips(slot3)

			return
		end

		slot4, slot5 = slot0:isEnoughResource(slot1)

		if not slot4 then
			pg.TipsMgr:GetInstance():ShowTips(slot5)

			return
		end

		if slot2 then
			slot6 = pg.MsgboxMgr.GetInstance()

			slot6:ShowMsgBox({
				modal = true,
				content = i18n("ship_remould_warning_" .. slot2, slot0.shipVO:getName()),
				onYes = function ()
					slot0:emit(ShipRemouldMediator.REMOULD_SHIP, slot0.shipVO.id, slot0)

					return
				end
			})
			slot6.contentText:AddListener(function (slot0, slot1)
				if slot0 == "clickDetail" then
					slot0:showToolTip(slot1)
				end

				return
			end)
		else
			slot0:emit(ShipRemouldMediator.REMOULD_SHIP, slot0.shipVO.id, slot1)
		end

		return
	end, SFX_CONFIRM)

	slot0.contextData.transformId = slot1

	return
end

function slot0.isUnlock(slot0, slot1)
	if not slot0:isUnLockPrev(slot1) then
		return false
	end

	if slot0.shipVO.level < slot0:getLevelById(slot1) then
		return false
	end

	if not slot0:isReachStar(slot1) then
		return false
	end

	return true
end

function slot0.isFinished(slot0, slot1)
	slot2 = pg.transform_data_template[slot1]

	if not slot0.transforms[slot1] or not slot0.transforms[slot1].level then
		slot3 = 0
	end

	if slot2.max_level == slot3 then
		return true
	end

	return false
end

function slot0.isReachStar(slot0, slot1)
	if pg.transform_data_template[slot1].star_limit > slot0.shipVO:getStar() then
		slot3 = false
	else
		slot3 = true
	end

	return slot3
end

function slot0.canRemould(slot0, slot1)
	if not slot0:isUnLockPrev(slot1) then
		return false, i18n("ship_remould_prev_lock")
	end

	slot2 = pg.transform_data_template[slot1]

	if slot0.shipVO.level < slot0:getLevelById(slot1) then
		return false, i18n("ship_remould_need_level", slot2.level_limit)
	end

	if not slot0:isReachStar(slot1) then
		return false, i18n("ship_remould_need_star", slot2.star_limit)
	end

	if slot0:isFinished(slot1) then
		return false, i18n("ship_remould_finished")
	end

	return true
end

function slot0.isUnLockPrev(slot0, slot1)
	for slot6, slot7 in pairs(pg.transform_data_template[slot1].condition_id) do
		slot8 = pg.transform_data_template[slot7]

		if not slot0.transforms[slot7] or slot0.transforms[slot7].level ~= slot8.max_level then
			return false
		end
	end

	return true
end

function slot0.isEnoughResource(slot0, slot1)
	slot2 = pg.transform_data_template[slot1]
	slot3 = 0

	if slot0.transforms[slot1] then
		slot3 = slot0.transforms[slot1].level
	end

	slot4 = ipairs

	if not slot2.use_item[slot3 + 1] then
		slot5 = {}
	end

	for slot7, slot8 in slot4(slot5) do
		if not slot0.itemsVO[slot8[1]] or slot0.itemsVO[slot8[1]].count < slot8[2] then
			return false, i18n("ship_remould_no_item")
		end
	end

	if slot0.playerVO.gold < slot2.use_gold then
		return false, i18n("ship_remould_no_gold")
	end

	if slot2.use_ship ~= 0 then
		slot4 = table.getCount

		if not slot0.contextData.materialShipIds then
			slot5 = {}
		end

		if slot4(slot5) ~= slot2.use_ship then
			return false, i18n("ship_remould_no_material")
		end
	end

	return true
end

function slot0.updateAttrTF(slot0, slot1, slot2, slot3)
	if slot3 then
		slot4 = "%"
	else
		slot4 = ""
	end

	setText(slot1:Find("name"), slot2.attrName)
	setText(slot1:Find("pre_value"), slot2.value .. slot4)
	setText(slot1:Find("value"), slot2.addition + slot2.value .. slot4)

	slot5 = setText
	slot6 = slot1:Find("addtion")

	if slot2.addition <= 0 or not ("+" .. slot2.addition) then
		slot7 = slot2.addition
	end

	slot5(slot6, slot7 .. slot4)

	return
end

function slot0.updateAttrTF_D(slot0, slot1, slot2, slot3)
	if slot3 then
		slot4 = "%"
	else
		slot4 = ""
	end

	setText(slot1:Find("name"), slot2.attrName)

	slot5 = setText
	slot6 = slot1:Find("value")

	if slot2.addition <= 0 or not ("+" .. slot2.addition) then
		slot7 = slot2.addition
	end

	slot5(slot6, slot7 .. slot4)

	return
end

function slot0.showToolTip(slot0, slot1)
	if not slot0.shipVO then
		return
	end

	slot2 = pg.transform_data_template[slot1]

	setActive(findTF(slot0.tooltip, "window/scrollview/list/attrs"), not slot0:isFinished(slot1))

	if not slot0.isFinished(slot1) then
		slot4 = Clone(slot0.shipVO)

		_.each(slot2.ship_id, function (slot0)
			if slot0[1] == slot0.shipVO.configId then
				slot1.configId = slot0[2]
			end

			return
		end)

		slot4.transforms[slot1] = {
			level = 1,
			id = slot1
		}

		table.insert(slot5, {
			name = i18n("common_ship_type"),
			from = ShipType.Type2Name(slot0.shipVO:getShipType()),
			to = ShipType.Type2Name(slot4:getShipType())
		})
		table.insert(slot5, {
			name = i18n("attribute_armor_type"),
			from = slot0.shipVO:getShipArmorName(),
			to = slot4:getShipArmorName()
		})

		slot7 = slot0.shipVO:getShipProperties()
		slot8 = slot4:getShipProperties()

		for slot12, slot13 in ipairs(slot6) do
			slot14 = {}

			if slot13 == AttributeType.Expend then
				slot14.name = AttributeType.Type2Name(slot13)
				slot14.from = slot0.shipVO:getBattleTotalExpend()
				slot14.to = slot4:getBattleTotalExpend()
			else
				slot14.name = AttributeType.Type2Name(slot13)
				slot14.from = math.floor(slot7[slot13])
				slot14.to = math.floor(slot8[slot13])
			end

			slot14.add = slot14.to - slot14.from

			table.insert(slot5, slot14)
		end

		slot9 = UIItemList.New(findTF(slot0.tooltip, "window/scrollview/list/attrs"), findTF(slot0.tooltip, "window/scrollview/list/attrs/attr"))

		slot9:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				setText(slot2:Find("name"), slot0[slot1 + 1].name)
				setText(slot2:Find("pre_value"), slot0[slot1 + 1].from)

				slot4 = slot2:Find("addtion")
				slot5 = "#A9F548"

				if slot0[slot1 + 1].add and slot3.from ~= slot3.to then
					setActive(slot4, true)

					if slot3.to < slot3.from then
						slot5 = "#FF3333"
					end

					if slot3.from < slot3.to then
						slot6 = "+"
					else
						slot6 = ""
					end

					setText(slot4, string.format("<color=%s>[%s%s]</color>", slot5, slot6, slot3.add))
					setText(slot2:Find("value"), string.format("<color=%s>%s</color>", slot5, slot3.to))
				else
					setActive(slot4, false)
					setText(slot2:Find("value"), string.format("<color=%s>%s</color>", slot5, slot3.to))
				end
			end

			return
		end)
		slot9:align(#slot5)
	end

	setText(findTF(slot0.tooltip, "window/scrollview/list/content/"), HXSet.hxLan(slot2.descrip))
	onButton(slot0, findTF(slot0.tooltip, "window/top/btnBack"), function ()
		slot0:closeTip()

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0.tooltip, function ()
		slot0:closeTip()

		return
	end, SFX_CANCEL)
	setActive(slot0.tooltip, true)
	setParent(slot0.tooltip, pg.UIMgr.GetInstance().OverlayMain)

	return
end

function slot0.closeTip(slot0)
	setActive(slot0.tooltip, false)
	setParent(slot0.tooltip, slot0._tf)

	return
end

function slot0.willExit(slot0)
	if slot0.helpBtn then
		setActive(slot0.helpBtn, true)
	end

	return
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.tooltip) then
		slot0:closeTip()

		return
	end

	slot0:emit(BaseUI.ON_BACK_PRESSED, true)

	return
end

return slot0
