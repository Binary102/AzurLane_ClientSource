slot0 = class("EquipmentInfoLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "EquipmentInfoUI"
end

function slot0.init(slot0)
	slot0.propEnabled = {}
	slot0.replacePanel = slot0:findTF("replace")

	setActive(slot0.replacePanel, false)

	slot0.replaceCancelBtn = slot0:findTF("actions/cancel_button", slot0.replacePanel)
	slot0.replaceConfirmBtn = slot0:findTF("actions/action_button_2", slot0.replacePanel)
	slot0.replaceSrcEquipment = slot0:findTF("equipment_on_ship", slot0.replacePanel)
	slot0.replaceDstEquipment = slot0:findTF("equipment", slot0.replacePanel)
	slot0.displayPanel = slot0:findTF("display")

	setActive(slot0.displayPanel, false)

	slot0.displayReplaceBtn = slot0:findTF("actions/action_button_3", slot0.displayPanel)
	slot0.displayDestroyBtn = slot0:findTF("actions/action_button_1", slot0.displayPanel)
	slot0.displayEnhanceBtn = slot0:findTF("actions/action_button_2", slot0.displayPanel)
	slot0.displayUnloadBtn = slot0:findTF("actions/action_button_4", slot0.displayPanel)
	slot0.displayRevertBtn = slot0:findTF("revert_btn", slot0.displayPanel)
	slot0.destroyPanel = slot0:findTF("destroy")

	setActive(slot0.destroyPanel, false)

	slot0.destroyEquipment = slot0:findTF("equipment", slot0.destroyPanel)
	slot0.destroyCounter = slot0:findTF("destroy", slot0.destroyPanel)
	slot0.destroyValue = slot0:findTF("value", slot0.destroyCounter)
	slot0.destroyLeftButton = slot0:findTF("left", slot0.destroyCounter)
	slot0.destroyRightButton = slot0:findTF("right", slot0.destroyCounter)
	slot0.destroyCancelBtn = slot0:findTF("actions/cancel_button", slot0.destroyPanel)
	slot0.destroyConfirmBtn = slot0:findTF("actions/destroy_button", slot0.destroyPanel)
	slot0.destroyMsgBox = slot0:findTF("destroy_msgbox")

	setActive(slot0.destroyMsgBox, false)

	slot0.destroyBonusList = slot0:findTF("got/list", slot0.destroyCounter)
	slot0.destroyBonusItem = slot0:findTF("got/item", slot0.destroyCounter)
	slot0.revertPanel = slot0:findTF("revert")

	setActive(slot0.revertPanel, false)

	slot0.revertEquipPanel = slot0:findTF("equipment", slot0.revertPanel)
	slot0.revertAwardContainer = slot0:findTF("item_panel/list", slot0.revertPanel)
	slot0.itemTpl = slot0:getTpl("itemtpl", slot0.revertAwardContainer)
	slot0.singlePanel = slot0:findTF("equipment")

	setActive(slot0.singlePanel, false)

	slot0.oldShipHead = slot0:findTF("replace/equipment/head")

	setActive(slot0.oldShipHead, false)

	slot0.attrHelpTpl = slot0:findTF("attr_help_tpl")
	slot0.scrollTxts = {}
	slot0.destroyScrollTxts = {}
end

function slot0.setEquipment(slot0, slot1)
	slot0.equipmentVO = slot1
end

function slot0.setShip(slot0, slot1, slot2)
	slot0.shipVO = slot1
	slot0.oldShipVO = slot2
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setRevertItem(slot0, slot1)
	slot0.revertItemVO = slot1 or Item.New({
		count = 0,
		id = Item.REVERT_EQUIPMENT_ID
	})
end

function slot0.checkDestroyGold(slot0, slot1)
	slot2 = 0

	if pg.equip_data_template[slot0.equipmentVO.config.id] then
		slot2 = slot2 + (slot3.destory_gold or 0) * slot1
	end

	if slot0.player:GoldMax(slot2) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
	end

	return true
end

function slot0.setDestroyCount(slot0, slot1)
	slot1 = math.clamp(slot1, 1, slot0.equipmentVO.count)

	if go(slot0.destroyPanel).activeSelf and not slot0:checkDestroyGold(slot1) then
		return
	end

	if slot0.destroyCount ~= slot1 then
		slot0.destroyCount = slot1

		slot0:updateDestroyCount()
	end
end

function slot0.didEnter(slot0)
	slot0.isShowUnique = table.contains(EquipmentInfoMediator.SHOW_UNIQUE, slot1)

	onButton(slot0, slot0._tf, function ()
		if go(slot0.destroyPanel).activeSelf then
			return
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)

	if defaultValue(slot0.contextData.type, EquipmentInfoMediator.TYPE_DEFAULT) == EquipmentInfoMediator.TYPE_DEFAULT then
		slot0:updateOperation1()
	elseif slot1 == EquipmentInfoMediator.TYPE_SHIP then
		slot0:updateOperation2()
	elseif slot1 == EquipmentInfoMediator.TYPE_REPLACE then
		slot0:updateOperation3()
	elseif slot1 == EquipmentInfoMediator.DISPLAY then
		slot0:updateOperation4()
	end

	onButton(slot0, slot0.displayEnhanceBtn, function ()
		if slot0.shipVO then
			slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

			if not slot0 then
				pg.TipsMgr:GetInstance():ShowTips(slot1)

				return
			end
		end

		slot0:emit(EquipmentInfoMediator.ON_INTENSIFY)
	end, SFX_PANEL)
	onButton(slot0, slot0.displayReplaceBtn, function ()
		slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		slot0:emit(EquipmentInfoMediator.ON_CHANGE)
	end, SFX_PANEL)
	onButton(slot0, slot0.displayUnloadBtn, function ()
		slot0, slot1 = Ship.canModifyShip(slot0.shipVO)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		slot0:emit(EquipmentInfoMediator.ON_UNEQUIP)
	end, SFX_UI_DOCKYARD_EQUIPOFF)
	onButton(slot0, slot0.replaceCancelBtn, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0.replaceConfirmBtn, function ()
		slot0, slot1 = slot0.shipVO:canEquipAtPos(slot0.equipmentVO, slot0.contextData.pos)

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_equipmentInfoLayer_error_canNotEquip", slot1))

			return
		end

		slot0:emit(EquipmentInfoMediator.ON_EQUIP)
	end, SFX_UI_DOCKYARD_EQUIPADD)
	onButton(slot0, slot0.displayDestroyBtn, function ()
		if not slot0:checkDestroyGold(slot0.destroyCount) then
			return
		end

		setActive(slot0.destroyPanel, true)
		setActive(slot0.displayPanel, false)

		setActive.equipment = slot0.destroyEquipment

		setActive:updateEquipment()
	end, SFX_PANEL)
	onButton(slot0, slot0.destroyCancelBtn, function ()
		setActive(slot0.destroyPanel, false)
		setActive(slot0.displayPanel, true)
	end, SFX_CANCEL)
	onButton(slot0, slot0.destroyConfirmBtn, function ()
		if not slot0:checkDestroyGold(slot0.destroyCount) then
			return
		end

		if Equipment.New({
			id = slot0.contextData.equipmentId
		}):isImportance() then
			slot0:showDestoryMsgbox(slot0)
		else
			slot0:emit(EquipmentInfoMediator.ON_DESTROY, slot0.destroyCount)
		end
	end, SFX_UI_EQUIPMENT_RESOLVE)
	onButton(slot0, slot0.displayRevertBtn, function ()
		slot0:updateOperation5()
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.updateOperation4(slot0)
	setActive(slot0.singlePanel, true)

	slot0.equipment = slot0.singlePanel

	slot0:updateEquipment()
end

function slot0.updateOperation1(slot0)
	setActive(slot0.replacePanel, false)
	setActive(slot0.destroyPanel, false)
	setActive(slot0.displayPanel, true)
	setActive(slot0.revertPanel, false)

	slot0.equipment = slot0.displayPanel

	slot0:updateEquipment()
	setActive(slot0.displayRevertBtn, slot0.fromEquipmentView and slot0.equipmentVO.config.level > 1 and slot0.revertItemVO.count > 0)
	setActive(slot0.displayReplaceBtn, false)
	setActive(slot0.displayUnloadBtn, false)

	if slot0.contextData.destroy and slot0.equipmentVO.count > 0 then
		setActive(slot0.displayDestroyBtn, true)
	end
end

function slot0.updateOperation2(slot0)
	setActive(slot0.replacePanel, false)
	setActive(slot0.destroyPanel, false)
	setActive(slot0.displayPanel, true)
	setActive(slot0.revertPanel, false)

	slot0.equipment = slot0.displayPanel

	slot0:updateEquipmentOnShip()
	setActive(slot0.displayDestroyBtn, false)
	setActive(slot0.displayReplaceBtn, true)
	setActive(slot0.displayUnloadBtn, true)
	setActive(slot0.displayRevertBtn, false)
end

function slot0.updateOperation3(slot0)
	setActive(slot0.replacePanel, true)
	setActive(slot0.destroyPanel, false)
	setActive(slot0.displayPanel, false)
	setActive(slot0.revertPanel, false)
	slot0:updateEquipmentPanel(slot0.replaceSrcEquipment, slot1, nil, 1)
	slot0:updateEquipmentPanel(slot0.replaceDstEquipment, slot0.equipmentVO, slot0.shipVO:getEquip(slot0.contextData.pos), 2)
	setActive(slot0.oldShipHead, slot0.oldShipVO)

	if slot0.oldShipVO then
		setImageSprite(findTF(slot0.oldShipHead, "Image"), LoadSprite("qicon/" .. slot0.oldShipVO:getPainting()))
	end
end

function slot0.updateOperation5(slot0)
	setActive(slot0.replacePanel, false)
	setActive(slot0.destroyPanel, false)
	setActive(slot0.displayPanel, false)
	setActive(slot0.revertPanel, true)
	slot0:updateRevertPanel()
end

function slot0.updateRevertPanel(slot0)
	slot0.equipment = slot0.revertEquipPanel

	slot0:updateRevertEquipment(slot1)
	slot0:updateRevertAward(slot0.equipmentVO)
end

function slot0.updateRevertEquipment(slot0, slot1)
	if not slot0.isInitRevertPanel then
		slot0.isInitRevertPanel = true
		slot0.revertEquipmentPanel = slot0:findTF("equipment", slot0.revertPanel)
		slot0.revertEquipmentName = slot0:findTF("info/name", slot0.revertEquipmentPanel)
		slot0.revertEquipLeft = slot0:findTF("info/equip_left", slot0.revertEquipmentPanel)
		slot0.revertEquipRight = slot0:findTF("info/equip_right", slot0.revertEquipmentPanel)
		slot0.revertAttrPanel = slot0:findTF("info/attrs", slot0.revertEquipmentPanel)
		slot0.revertTitleTxt = slot0:findTF("info/title/Text", slot0.revertEquipmentPanel):GetComponent(typeof(Text))
		slot0.tierTF = slot0:findTF("tier", slot0.revertEquipmentPanel)

		onButton(slot0, slot0:findTF("actions/cancel_button", slot0.revertPanel), function ()
			slot0:emit(slot1.ON_CLOSE)
		end, SFX_PANEL)
		onButton(slot0, slot0:findTF("actions/destroy_button", slot0.revertPanel), function ()
			slot0:emit(EquipmentInfoMediator.ON_REVERT, slot1.id)
		end, SFX_PANEL)
	end

	setActive(slot0:findTF("unique", slot0.revertEquipmentPanel), slot1:isUnique() and slot0.isShowUnique)
	setText(slot0.revertEquipmentName, slot1.config.name)
	eachChild(slot0.tierTF, function (slot0)
		setActive(slot0, tostring(slot0.config.tech) == slot0.name)
	end)

	slot0.revertTitleTxt.text = EquipType.Type2Name(slot1.config.type)

	updateEquipment(slot0.revertEquipLeft, slot1)
	updateEquipment(slot0.revertEquipRight, setActive)
	slot0:updateAttrs(slot0.revertAttrPanel, slot1, slot1:getRootEquipment())
end

function slot0.updateAttrs(slot0, slot1, slot2, slot3)
	slot4 = slot2:GetProperties()
	slot5 = (slot3 and slot3:GetProperties()) or nil
	slot6 = 0

	for slot10 = 1, 3, 2 do
		setActive(slot13, slot11)
		setActive(findTF(slot12, "lock"), not slot4[slot10])

		if slot4[slot10] then
			slot15 = findTF(slot13, "tag")
			slot16 = findTF(slot13, "from")
			slot17 = findTF(slot13, ">")
			slot18 = findTF(slot13, "to")

			setActive(slot19, false)

			slot20 = nil

			if slot2.config.type ~= EquipType.Equipment and slot11.type == AttributeType.Reload then
				setText(slot15, i18n("cd_normal"))

				slot21 = slot2:getWeaponCD()
				slot20 = (slot3 and slot3:getWeaponCD()) or nil
				slot22 = 0

				if slot20 then
					setActive(slot19, true)

					slot22 = slot20 - slot21
				end

				slot23 = (math.abs(slot22) < 0.01 and math.abs(slot22) ~= 0 and "%.3f") or "%.2f"

				setText(slot16, slot24 .. "s" .. i18n("word_secondseach"))

				if slot20 then
					setText(slot18, slot25 .. "s" .. i18n("word_secondseach"))
					setText(slot19, math.abs(string.format(slot23, slot24 - string.format(slot23, slot20))))
				else
					setText(slot18, "")
					setText(slot19, "")
				end
			else
				setText(slot16, slot11.value)
				setText(slot15, AttributeType.Type2Name(slot11.type))

				if (slot5 and slot5[slot10]) or nil then
					if type(slot11.value) == "number" and slot20.value ~= slot11.value then
						setActive(slot19, true)
						setText(slot19, math.abs(slot20.value - slot11.value))
					elseif string.match(slot11.value, "%d+") ~= string.match(slot20.value, "%d+") then
						setActive(slot19, true)
						setText(slot19, math.abs(slot22 - slot21))
					end

					setText(slot18, slot20.value)
				end
			end

			setActive(slot18, slot20)
			setActive(slot17, slot20)
		end
	end
end

function slot0.updateRevertAward(slot0, slot1)
	removeAllChildren(slot0.revertAwardContainer)

	for slot6, slot7 in pairs(slot2) do
		updateDrop(cloneTplTo(slot0.itemTpl, slot0.revertAwardContainer), slot7)
	end
end

function slot0.updateEquipment(slot0)
	slot0:updateEquipmentPanel(slot0.equipment, slot0.equipmentVO)

	if slot0.equipmentVO.count > 0 then
		slot0:setDestroyCount(1)

		slot0.leftEventTrigger = pressPersistTrigger(slot0.destroyLeftButton, slot2, function ()
			slot0:setDestroyCount(slot0.destroyCount - 1)
		end, nil, true, true, 0.1, SFX_PANEL)
		slot0.rightEventTrigger = pressPersistTrigger(slot0.destroyRightButton, slot2, function ()
			slot0:setDestroyCount(slot0.destroyCount + 1)
		end, nil, true, true, 0.1, SFX_PANEL)

		onButton(slot0, findTF(slot0.destroyCounter, "max"), function ()
			slot0:setDestroyCount(slot1.count)
		end, SFX_PANEL)
	end
end

function slot0.updateEquipmentOnShip(slot0)
	slot0:updateEquipmentPanel(slot0.equipment, slot0.shipVO:getEquip(slot0.contextData.pos))
end

function slot0.updateDestroyCount(slot0)
	setText(slot0.destroyValue, slot1)

	slot2 = {}
	slot3 = 0

	if pg.equip_data_template[slot0.equipmentVO.config.id] then
		slot5 = slot4.destory_item or {}
		slot3 = slot3 + (slot4.destory_gold or 0) * slot1

		for slot10, slot11 in ipairs(slot5) do
			table.insert(slot2, {
				type = DROP_TYPE_ITEM,
				id = slot11[1],
				count = slot11[2] * slot1
			})
		end

		table.insert(slot2, {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = slot3
		})
	end

	for slot8 = #slot2, slot0.destroyBonusList.childCount - 1, 1 do
		Destroy(slot0.destroyBonusList:GetChild(slot8))

		if slot0.destroyScrollTxts[slot0.destroyBonusList.GetChild(slot8)] ~= nil then
			slot0.destroyScrollTxts[slot9]:destroy()

			slot0.destroyScrollTxts[slot9] = nil
		end
	end

	for slot8 = slot0.destroyBonusList.childCount, #slot2 - 1, 1 do
		cloneTplTo(slot0.destroyBonusItem, slot0.destroyBonusList)
	end

	for slot8 = 1, #slot2, 1 do
		slot9 = slot0.destroyBonusList:GetChild(slot8 - 1)

		if slot2[slot8].type == DROP_TYPE_SHIP then
			slot0.hasShip = true
		end

		GetComponent(slot9:Find("icon_bg/icon"), typeof(Image)).enabled = true

		if not IsNil(slot9:Find("icon_bg/icon/icon")) then
			setActive(slot11, false)
		end

		setActive(findTF(slot9, "icon_bg/slv"), false)
		updateDrop(slot9, slot10)

		slot13 = ScrollTxt.New(findTF(slot9, "name_mask"), findTF(slot9, "name_mask/name"), true)

		slot13:setText(slot10.cfg.name)

		slot0.destroyScrollTxts[slot9] = slot13

		onButton(slot0, slot9, function ()
			if slot0.type == DROP_TYPE_RESOURCE or slot0.type == DROP_TYPE_ITEM then
				slot1:emit(AwardInfoMediator.ON_ITEM, slot0.cfg.id)
			elseif slot0.type == DROP_TYPE_EQUIP then
				slot1:emit(slot2.ON_EQUIPMENT, {
					equipmentId = slot0.cfg.id,
					type = EquipmentInfoMediator.DISPLAY
				})
			end
		end, SFX_PANEL)
	end
end

function slot0.updateEquipmentPanel(slot0, slot1, slot2, slot3, slot4)
	slot4 = defaultValue(slot4, 1)
	slot5 = {}

	if not slot3 or not slot3:GetProperties() then
		slot6 = nil
	end

	setActive(slot7, slot2)
	setActive(slot8, not slot2)
	setActive(slot10, slot2)
	setActive(slot9, slot2)
	setActive(slot0:findTF("part_btn", slot1), false)

	if slot2 then
		setText(findTF(slot7, "title/Text"), EquipType.Type2Name(slot2.config.type))
		setText(findTF(slot7, "name"), slot2.config.name)

		slot12 = setActive
		slot13 = findTF(slot1, "unique")

		if slot2:isUnique() then
			slot14 = slot0.isShowUnique
		end

		slot12(slot13, slot14)

		slot12 = findTF(slot7, "equip")
		slot13 = slot12:Find("attr/Text")

		updateEquipment(slot12, slot2)

		if not slot2.config.tech then
			slot14 = 1
		end

		eachChild(slot10, function (slot0)
			slot1 = setActive
			slot2 = slot0

			if tostring(slot0) ~= slot0.gameObject.name then
				slot3 = false
			else
				slot3 = true
			end

			slot1(slot2, slot3)
		end)

		slot15 = findTF(slot7, "attrs")
		slot16 = findTF(slot7, "skill")
		slot17 = findTF(slot7, "skill_aircraft")
		slot18 = slot2:GetProperties()
		slot19 = slot2:GetSkill()
		slot20 = setActive
		slot21 = slot13.parent

		if slot2.config.speciality == "N/A" then
			slot22 = false
		else
			slot22 = true
		end

		slot20(slot21, slot22)

		if slot2.config.speciality ~= "N/A" then
			setText(slot13, slot2.config.speciality)
		end

		if slot2.config.type == EquipType.Equipment then
			setActive(slot16, true)
			setActive(slot20, slot19)
			setActive(slot21, slot19)
			setActive(findTF(slot16, "locked"), not slot19)

			if slot19 then
				setText(findTF(slot16, "value"), getSkillDescGet(slot19.id))
			end

			for slot26 = 1, 8, 1 do
				slot27 = slot18[slot26]
				slot29 = findTF(slot28, "name")
				slot32 = findTF(findTF(slot28, "value"), "down")

				if findTF(slot30, "up") and slot32 then
					setActive(slot31, false)
					setActive(slot32, false)
				end

				slot5[slot26] = slot27

				if slot27 then
					print("prpo:" .. AttributeType.Type2Name(slot27.type))
				end

				if slot26 <= 5 then
					setActive(slot28, true)
					slot0:enableAttrInfo(slot28, slot27)

					if slot27 then
						setText(slot29, AttributeType.Type2Name(slot27.type))
						setText(slot30, slot27.value)

						if slot6 then
							slot33 = false

							for slot37 = 1, 3, 1 do
								if slot6[slot37] and slot27.type == slot6[slot37].type then
									if slot27.type == AttributeType.SonarInterval then
										slot38 = setActive
										slot39 = slot31

										if slot27.value >= slot6[slot37].value then
											slot40 = false
										else
											slot40 = true
										end

										slot38(slot39, slot40)

										slot38 = setActive
										slot39 = slot32

										if slot6[slot37].value >= slot27.value then
											slot40 = false
										else
											slot40 = true
										end

										slot38(slot39, slot40)

										break
									end

									slot38 = setActive
									slot39 = slot31

									if slot6[slot37].value >= slot27.value then
										slot40 = false
									else
										slot40 = true
									end

									slot38(slot39, slot40)

									slot38 = setActive
									slot39 = slot32

									if slot27.value >= slot6[slot37].value then
										slot40 = false
									else
										slot40 = true
									end

									slot38(slot39, slot40)

									break
								end
							end
						end
					end
				elseif slot26 == 6 then
					slot0:enableAttrInfo(slot28, slot19)

					slot5[slot26] = slot19

					if slot19 then
						setText(slot29, i18n("skill"))
						setText(slot30, setColorStr(slot19.name, "#FFDE00FF"))
					else
						setText(slot29, "")
						setText(slot30, "")
					end
				else
					setActive(slot28, false)
				end
			end
		else
			setActive(slot16, false)

			slot21 = {}
			slot22 = false

			if EquipType.isAircraft(slot2.configId) then
				slot23 = slot17:Find("mask/value")

				if pg.aircraft_template[slot2.configId] then
					slot21 = slot24.weapon_ID
				end

				if #slot21 > 2 or #slot2.config.skill_id <= 0 then
					slot22 = false
				else
					slot22 = true
				end

				if slot22 then
					slot26 = ScrollTxt.New(slot23.parent, slot23)

					slot26:setText(slot25)
					table.insert(slot0.scrollTxts, slot26)
				else
					setText(slot23, "")
				end
			end

			setActive(findTF(slot15, "attr_7"), not slot22)
			setActive(findTF(slot15, "attr_8"), not slot22)
			setActive(slot17, slot22)

			for slot26 = 1, 8, 1 do
				slot27 = slot18[slot26]
				slot29 = findTF(slot28, "name")
				slot32 = findTF(findTF(slot28, "value"), "down")

				if findTF(slot30, "up") and slot32 then
					setActive(slot31, false)
					setActive(slot32, false)
				end

				setActive(slot28, true)
				setActive(slot29, slot27)
				setActive(slot30, slot27)

				if slot26 == 3 and slot20 then
				elseif slot26 > 4 and slot20 then
					setText(slot29, "")
					setText(slot30, "")
					setTextFont(slot30, pg.FontMgr.GetInstance().fonts.heiti)

					slot35 = slot0
					slot34 = slot0.enableAttrInfo
					slot36 = slot28

					if slot26 - 4 > #slot21 then
						slot37 = false
					else
						slot37 = true
					end

					slot34(slot35, slot36, slot37)

					if slot33 > #slot21 then
						slot34 = false
					else
						slot34 = true
					end

					slot5[slot26] = slot34

					if slot33 <= #slot21 and pg.weapon_property[slot21[slot33]] then
						setText(slot30, setColorStr(slot34.name, COLOR_YELLOW))
					end
				else
					slot0:enableAttrInfo(slot28, slot27)

					slot5[slot26] = slot27

					if slot27 then
						setTextFont(slot30, pg.FontMgr.GetInstance().fonts.impact)

						if slot27.type == AttributeType.Reload and slot26 == 4 then
							slot33 = 0

							if slot0.shipVO then
								setText(slot29, AttributeType.Type2Name(AttributeType.CD))

								slot33 = slot0.shipVO:calcWeaponCD(slot2)
							else
								setText(slot29, i18n("cd_normal"))

								slot33 = slot2:getWeaponCD()
							end

							setText(slot30, setColorStr(slot33 .. "s", COLOR_YELLOW) .. i18n("word_secondseach"))

							if slot6 and slot26 < #slot6 and slot6[slot26] then
								slot35 = setActive
								slot36 = slot31

								if slot33 - slot0.shipVO:calcWeaponCD(slot3) >= 0 then
									slot37 = false
								else
									slot37 = true
								end

								slot35(slot36, slot37)

								slot35 = setActive
								slot36 = slot32

								if slot33 - slot34 <= 0 then
									slot37 = false
								else
									slot37 = true
								end

								slot35(slot36, slot37)
							end
						else
							setText(slot29, AttributeType.Type2Name(slot27.type))

							slot33 = slot27.value

							if slot27.type == AttributeType.Ammo then
								slot33 = setColorStr(slot27.value, COLOR_YELLOW)
							elseif slot26 > 4 then
								slot33 = setColorStr(slot27.value, "#FFFFFFFF")
							end

							setText(slot30, slot33)

							if slot6 and slot26 < #slot6 then
								if not slot6[slot26] then
									setActive(slot31, true)
								elseif slot27.type == AttributeType.Damage then
									slot34 = 0
									slot35 = 0

									if string.match(slot27.value, i18n("word_secondseach")) == i18n("word_secondseach") then
										slot34 = string.gsub(slot27.value, slot36, "")
										slot35 = string.gsub(slot6[slot26].value, slot36, "")
									else
										slot37, slot38 = string.match(string.gsub(slot27.value, " ", ""), "(%d+)x(%d+)")

										if not slot37 or not slot37 then
											slot39 = 0
										end

										if not slot38 or not slot38 then
											slot40 = 0
										end

										slot34 = slot39 * slot40
										slot39, slot40 = string.match(string.gsub(slot6[slot26].value, " ", ""), "(%d+)x(%d+)")

										if not slot39 or not slot39 then
											slot41 = 0
										end

										if not slot40 or not slot40 then
											slot42 = 0
										end

										slot35 = slot41 * slot42
									end

									slot37 = setActive
									slot38 = slot31

									if tonumber(slot35) >= tonumber(slot34) then
										slot39 = false
									else
										slot39 = true
									end

									slot37(slot38, slot39)

									slot37 = setActive
									slot38 = slot32

									if tonumber(slot34) >= tonumber(slot35) then
										slot39 = false
									else
										slot39 = true
									end

									slot37(slot38, slot39)
								elseif slot27.type == AttributeType.SonarInterval then
									slot34 = setActive
									slot35 = slot31

									if type(slot6[slot26].value) ~= "number" or slot27.value >= slot6[slot26].value then
										slot36 = false
									else
										slot36 = true
									end

									slot34(slot35, slot36)

									slot34 = setActive
									slot35 = slot32

									if type(slot6[slot26].value) ~= "number" or slot6[slot26].value >= slot27.value then
										slot36 = false
									else
										slot36 = true
									end

									slot34(slot35, slot36)
								elseif slot27.type ~= AttributeType.Scatter and slot27.type ~= AttributeType.Angle then
									slot34 = setActive
									slot35 = slot31

									if type(slot6[slot26].value) ~= "number" or slot6[slot26].value >= slot27.value then
										slot36 = false
									else
										slot36 = true
									end

									slot34(slot35, slot36)

									slot34 = setActive
									slot35 = slot32

									if type(slot6[slot26].value) ~= "number" or slot27.value >= slot6[slot26].value then
										slot36 = false
									else
										slot36 = true
									end

									slot34(slot35, slot36)
								end
							end
						end
					end
				end
			end
		end

		slot0.propEnabled[slot4] = slot5
		slot21 = slot0:findTF("partgrid2", slot7)

		if slot0:findTF("partgrid1", slot7) and slot21 then
			setActive(slot20, false)
			setActive(slot21, false)

			slot22, slot23 = nil
			slot24 = 0

			if not slot2.config.part_main or not #slot2.config.part_main then
				slot25 = 0
			end

			slot26 = (slot2.config.part_sub and #slot2.config.part_sub) or 0
			slot22 = slot0:findTF("part_main", (slot25 <= 2 and ((slot2.config.part_sub and #slot2.config.part_sub) or 0) <= 2 and slot20) or slot21)
			slot23 = slot0:findTF("part_sub", (slot25 <= 2 and ((slot2.config.part_sub and #slot2.config.part_sub) or 0) <= 2 and slot20) or slot21)

			setActive(slot20, slot25 <= 2 and ((slot2.config.part_sub and #slot2.config.part_sub) or 0) <= 2)
			setActive(slot21, not (slot25 <= 2 and ((slot2.config.part_sub and #slot2.config.part_sub) or 0) <= 2))

			if not #slot2.config.part_sub then
				slot26 = 0
			end

			if slot26 > 2 then
				slot27 = false
			else
				slot27 = true
			end

			if not slot20 then
				slot31 = slot21
			end

			if not slot20 then
				slot31 = slot21
			end

			if slot25 > 0 then
				slot0:setPartInfo(slot22, slot2.config.part_main)
			end

			if slot26 > 0 then
				slot0:setPartInfo(slot23, slot2.config.part_sub)
			end

			setText(slot0:findTF("name", slot22), i18n((slot26 > 0 and "equip_part_main_title") or "equip_part_title"))
			setText(slot0:findTF("name", slot23), i18n("equip_part_sub_title"))
			slot0:activePartInfo(slot22, slot23, slot15, false, slot25 > 0, slot26 > 0, slot4)

			slot31 = "equip_part_main_title"

			if "equip_part_main_title" then
				slot31 = "equip_part_title"
			end

			slot34 = false

			if false then
				slot34 = true
			end

			slot35 = false

			if false then
				slot35 = true
			end

			if slot0:findTF("part_btn", slot1) then
				setActive(slot28, slot25 > 0 or slot26 > 0)
				setButtonText(slot28, i18n("equip_part_tip"))

				if slot26 <= 0 then
					slot31 = false
				else
					slot31 = true
				end

				if not slot0.showPart then
					slot0.showPart = {}
				end

				slot0.showPart[slot28] = false

				onButton(slot0, slot28, function ()
					slot0.showPart[slot1] = not slot0.showPart[slot1]
					slot2 = not slot0.showPart[slot1]
					slot3 = slot1
					slot4 = slot4

					if slot0.showPart[slot1] <= 0 then
						slot6 = false
					else
						slot6 = true
					end

					if slot6 <= 0 then
						slot7 = false
					else
						slot7 = true
					end

					slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot7)

					return
				end)
			end
		end
	end
end

function slot0.enableAttrInfo(slot0, slot1, slot2)
	if findTF(slot1, "name") then
		setActive(slot3, slot2)
	end

	setActive(findTF(slot1, "value"), slot2)
	setActive(findTF(slot1, "open"), slot2)
	setActive(findTF(slot1, "locked"), not slot2)

	return
end

function slot0.setPartInfo(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot3 = findTF(slot1, "name")
	slot4 = findTF(slot1, "value")
	slot5 = findTF(slot1, "open")
	slot6 = findTF(slot1, "locked")
	slot7 = ""

	for slot11, slot12 in ipairs(slot2) do
		slot13 = pg.ship_data_by_type[slot12]

		if slot7 ~= "" then
			slot7 = slot7 .. "  "
		end

		if slot13 then
			slot7 = slot7 .. slot13.type_name
		end
	end

	slot9 = slot0
	slot8 = slot0.enableAttrInfo
	slot10 = slot1

	if slot7 == "" then
		slot11 = false
	else
		slot11 = true
	end

	slot8(slot9, slot10, slot11)
	setText(slot4, slot7)

	return
end

function slot0.activePartInfo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if not slot1 or not slot2 then
		return
	end

	slot8 = setActive
	slot9 = slot1

	if slot4 then
		slot10 = slot5
	end

	slot8(slot9, slot10)

	slot8 = setActive
	slot9 = slot2

	if slot4 then
		slot10 = slot6
	end

	slot8(slot9, slot10)

	for slot11 = 1, slot3.childCount, 1 do
		slot14 = slot0
		slot13 = slot0.enableAttrInfo
		slot15 = slot3:Find("attr_" .. slot11)

		if slot0.propEnabled[slot7][slot11] then
			slot16 = not slot4
		end

		slot13(slot14, slot15, slot16)
	end

	return
end

function slot0.showDestoryMsgbox(slot0, slot1)
	slot0.isOpenDestoryMsgbox = true

	setActive(slot0:findTF("destroy/got_text", slot0.destroyPanel), false)
	setActive(slot0.destroyMsgBox, true)

	if not slot0.isInitDestoryMsgBox then
		slot0.isInitDestoryMsgBox = true
		slot0.destroyMsgboxIntro = slot0.destroyMsgBox:Find("window/info/intro")
		slot0.destroyMsgBoxConfirmBtn = slot0.destroyMsgBox:Find("window/button_container/confirm_btn")
		slot0.destroyMsgBoxCancelBtn = slot0.destroyMsgBox:Find("window/button_container/cancel_btn")
		slot0.destroyMsgBoxInput = slot0.destroyMsgBox:Find("window/info/InputField")
	end

	setText(slot0.destroyMsgboxIntro, i18n("destory_important_equipment_tip", slot1.config.name))
	onButton(slot0, slot0.destroyMsgBoxConfirmBtn, function ()
		if not getInputText(slot0.destroyMsgBoxInput) or slot0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_should_input"))

			return
		end

		if wordVer(slot0) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))

			return
		end

		if slot0 ~= slot1.config.name then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destory_important_equipment_input_erro"))

			return
		end

		slot0:emit(EquipmentInfoMediator.ON_DESTROY, 1)
		slot0:closeDestoryMsgbox()

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.destroyMsgBoxCancelBtn, function ()
		slot0:closeDestoryMsgbox()

		return
	end, SFX_PANEL)

	return
end

function slot0.closeDestoryMsgbox(slot0)
	slot0.isOpenDestoryMsgbox = nil

	setActive(slot0.destroyMsgBox, false)
	setActive(slot0:findTF("destroy/got_text", slot0.destroyPanel), true)

	return
end

function slot0.willExit(slot0)
	if slot0.leftEventTrigger then
		ClearEventTrigger(slot0.leftEventTrigger)
	end

	if slot0.rightEventTrigger then
		ClearEventTrigger(slot0.rightEventTrigger)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	for slot4, slot5 in pairs(slot0.scrollTxts) do
		if slot5 then
			slot5:destroy()
		end
	end

	for slot4, slot5 in pairs(slot0.destroyScrollTxts) do
		if slot5 then
			slot5:destroy()
		end
	end

	slot0.scrollTxts = nil

	return
end

function slot0.onBackPressed(slot0)
	if slot0.isOpenDestoryMsgbox then
		slot0:closeDestoryMsgbox()

		return
	end

	if isActive(slot0.destroyPanel) then
		setActive(slot0.destroyPanel, false)
		setActive(slot0.displayPanel, true)

		return
	end

	if isActive(slot0.displayPanel) then
		slot0:emit(slot0.ON_CLOSE)

		return
	end

	return
end

return slot0
