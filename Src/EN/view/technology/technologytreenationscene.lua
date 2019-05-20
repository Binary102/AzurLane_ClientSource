slot0 = class("TechnologyTreeNationScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TechnologyTreeCampUI"
end

function slot0.init(slot0)
	slot0:initData()
	slot0:findUI()
end

function slot0.didEnter(slot0)
	slot0:addListener()
	slot0:updateTecItemList()
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.timerList) do
		slot5:Stop()
	end
end

function slot0.initData(slot0)
	slot0.nationProxy = getProxy(TechnologyNationProxy)
	slot0.nationToPoint = slot0.nationProxy:getNationPointList()
	slot0.tecList = slot0.nationProxy:GetTecList()
	slot0.panelList = {}
	slot0.timerList = {}
end

function slot0.calculateCurBuff(slot0, slot1, slot2)
	slot3 = nil

	if slot1 == 0 then
		return {}, {}, {}
	else
		slot3 = pg.fleet_tech_group[slot2].techs[slot1]
	end

	slot5 = {}
	slot6 = {}

	for slot10, slot11 in ipairs(slot4) do
		slot12 = slot11[3]
		slot13 = slot11[4]

		for slot18, slot19 in ipairs(slot14) do
			if slot5[slot19] then
				table.insert(slot5[slot19], {
					attr = slot12,
					value = slot13
				})
			else
				slot5[slot19] = {
					{
						attr = slot12,
						value = slot13
					}
				}
				slot6[#slot6 + 1] = slot19
			end
		end
	end

	slot7 = {}
	slot8 = {}

	for slot12, slot13 in pairs(slot5) do
		if not slot7[slot12] then
			slot7[slot12] = {}
			slot8[slot12] = {}
		end

		for slot17, slot18 in ipairs(slot13) do
			slot20 = slot18.value

			if not slot7[slot12][slot18.attr] then
				slot7[slot12][slot19] = slot20
				slot8[slot12][#slot8[slot12] + 1] = slot19
			else
				slot7[slot12][slot19] = slot7[slot12][slot19] + slot20
			end
		end
	end

	table.sort(slot6, function (slot0, slot1)
		return slot0 < slot1
	end)

	for slot12, slot13 in pairs(slot8) do
		table.sort(slot13, function (slot0, slot1)
			return slot0 < slot1
		end)
	end

	return slot6, slot8, slot7
end

function slot0.findUI(slot0)
	slot0.scrollRect = slot0:findTF("Scroll View")
	slot0.tecItemContainer = slot0:findTF("Scroll View/Viewport/Content")
	slot0.scrollRectCom = GetComponent(slot0.scrollRect, "ScrollRect")
	slot0.tecItemTpl = slot0:findTF("CampTecItem")
	slot0.typeItemTpl = slot0:findTF("TypeItem")
	slot0.buffItemTpl = slot0:findTF("BuffItem")
	slot0.tecItemTplOriginWidth = slot0.tecItemTpl.rect.width
end

function slot0.onBackPressed(slot0)
	slot0:emit(slot0.ON_BACK)
end

function slot0.closeMyself(slot0)
	slot0:emit(slot0.ON_CLOSE)
end

function slot0.addListener(slot0)
	return
end

function slot0.updateTecItemList(slot0)
	slot1 = UIItemList.New(slot0.tecItemContainer, slot0.tecItemTpl)

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0.panelList[slot1 + 1] = slot2

			slot0:updateTecItem(slot1 + 1)
		end
	end)
	slot1:align(#pg.fleet_tech_group.all)
end

function slot0.updateTecItem(slot0, slot1)
	slot3 = slot0:findTF("BaseInfo", slot2)
	slot5 = slot0:findTF("BG/UpLevelColor", slot3)
	slot10 = slot0:findTF("UpLevelBtn", slot9)
	slot11 = slot0:findTF("FinishBtn", slot9)
	slot13 = slot0:findTF("Text", slot12)
	slot15 = slot0:findTF("ProgressBarBG/Progress", slot3)
	slot17 = slot0:findTF("LevelText/Text", slot3)
	slot18 = slot0:findTF("PointTextBar", slot3)

	setImageSprite(slot6, GetSpriteFromAtlas("TecNation", "camptec_nation_bar_" .. slot20))
	setImageSprite(slot8, GetSpriteFromAtlas("TecNation", "camptec_nation_text_" .. slot20), true)
	setImageSprite(slot14, GetSpriteFromAtlas("TecNation", "camp_tec_english_" .. slot20), true)
	setImageSprite(slot16, GetSpriteFromAtlas("TecNation", "camptec_logo_" .. pg.fleet_tech_group[slot1].nation[1]))
	setText(slot4, slot19)

	slot21, slot22 = nil
	slot21 = (not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0
	slot24 = nil

	BaseUI:setImageAmount(slot0.findTF("ProgressBarBG/Progress", slot3), 0.1 + (0.8 * slot0.nationToPoint[slot20]) / ((((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= 0 or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt) and (((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= #pg.fleet_tech_group[slot1].techs or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[(not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0]].pt) and pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) + 1]].pt))
	setText(slot0.findTF("LevelText/Text", slot3), (not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0)
	setText(slot0.findTF("PointTextBar", slot3), slot0.nationToPoint[slot20] .. "/" .. ((((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= 0 or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt) and (((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) ~= #pg.fleet_tech_group[slot1].techs or pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[(not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0]].pt) and pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) + 1]].pt))

	function slot25(slot0, slot1, slot2)
		setActive(slot0, slot0)
		setActive(slot1, slot1)
		setActive(slot2, slot1)
		setActive(setActive, slot1)
		setActive(setActive, slot2)

		return
	end

	if 0 or not table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) then
		slot21 = 0
	end

	slot24 = pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt

	if pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[1]].pt then
		if slot21 == #pg.fleet_tech_group[slot1].techs then
			slot24 = pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[(not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0]].pt
		else
			slot24 = pg.fleet_tech_template[pg.fleet_tech_group[slot1].techs[((not slot0.tecList[slot1] and 0) or table.indexof(pg.fleet_tech_group[slot1].techs, slot0.tecList[slot1].completeID, 1) or 0) + 1]].pt
		end
	end

	if not slot0.tecList[slot1] then
		if slot24 <= slot23 then
			slot25(false, true, false)
		else
			slot25(true, false, false)
		end
	else
		if slot21 == #pg.fleet_tech_group[slot1].techs then
			slot25(true, false, false)
		else
			if slot0.tecList[slot1].studyID ~= 0 then
				slot25(false, false, true)

				if slot0.timerList[slot1] then
					slot0.timerList[slot1]:Stop()
				end

				setText(slot13, pg.TimeMgr.GetInstance():DescCDTime(slot26))

				slot0.timerList[slot1] = Timer.New(function ()
					slot0 = slot0 - 1

					setText(slot1, pg.TimeMgr.GetInstance():DescCDTime(setText))

					if setText == 0 then
						slot2.timerList[slot3]:Stop()
					end

					return
				end, 1, -1)

				slot0.timerList[slot1]:Start()
			else
				if slot24 <= slot23 then
					slot25(false, true, false)
				else
					slot25(true, false, false)
				end
			end
		end
	end

	onButton(slot0, slot10, function ()
		slot0:emit(TechnologyConst.CLICK_UP_TEC_BTN, slot0, )

		return
	end, SFX_PANEL)

	slot27 = GetComponent(slot2, "LayoutElement")
	slot28 = slot0:findTF("Toggle", slot26)

	slot0:updateDetailPanel(slot26, slot21, slot1, slot20, false)
	onToggle(slot0, slot0:findTF("BG", slot3), function (slot0)
		if slot0 then
			triggerToggle(slot0, false)

			slot2 = go(slot1)

			LeanTween.value(slot2, slot2.tecItemTplOriginWidth, slot2.tecItemTplOriginWidth + slot3.rect.width, 0.25):setOnUpdate(System.Action_float(function (slot0)
				slot0.preferredWidth = slot0

				if slot0 == #pg.fleet_tech_group.all then
					slot2.scrollRectCom.horizontalNormalizedPosition = 1
				end

				return
			end)):setOnComplete(System.Action(function ()
				if slot0 == #pg.fleet_tech_group.all then
					slot1.scrollRectCom.horizontalNormalizedPosition = 1
				end

				return
			end))
		else
			LeanTween.cancel(go(LeanTween.cancel))
			LeanTween.value(go(slot1), slot1, slot2.tecItemTplOriginWidth, 0.25):setOnUpdate(System.Action_float(function (slot0)
				slot0.preferredWidth = slot0

				return
			end))
		end

		return
	end)

	return
end

function slot0.updateDetailPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0:findTF("TypeItemContainer", slot1)

	setImageSprite(slot7, GetSpriteFromAtlas("TecNation", "camptec_logo_" .. slot4))

	slot8 = slot0:findTF("Toggle", slot1)

	if slot2 == #pg.fleet_tech_group[slot3].techs and slot5 == false then
		setActive(slot8, false)
	end

	function slot9(slot0, slot1, slot2)
		slot3 = UIItemList.New(slot0, slot1.typeItemTpl)
		slot4 = nil

		if slot0 == 0 then
			slot3:align(0)

			return
		else
			slot4 = pg.fleet_tech_group[slot1].techs[slot0]
		end

		slot5, slot6, slot7 = nil
		slot8 = Color.New(1, 0.9333333333333333, 0.19215686274509805)

		if slot2 then
			slot5, slot6, slot7 = slot1:calculateCurBuff(slot0 - 1, slot1)
		end

		slot10 = {}
		slot11 = {}

		for slot15, slot16 in ipairs(slot9) do
			slot17 = slot16[3]
			slot18 = slot16[4]

			for slot23, slot24 in ipairs(slot19) do
				slot25 = nil

				if slot2 then
					if not table.indexof(slot5, slot24, 1) then
						slot25 = {
							attr = slot17,
							value = slot18,
							attrColor = slot8,
							valueColor = slot8
						}
					else
						if not table.indexof(slot6[slot24], slot17, 1) then
							slot25 = {
								attr = slot17,
								value = slot18,
								attrColor = slot8,
								valueColor = slot8
							}
						else
							if slot18 ~= slot7[slot24][slot17] then
								slot25 = {
									attr = slot17,
									value = slot18,
									valueColor = slot8
								}
							else
								slot25 = {
									attr = slot17,
									value = slot18
								}
							end
						end
					end
				else
					slot25 = {
						attr = slot17,
						value = slot18
					}
				end

				if slot10[slot24] then
					table.insert(slot10[slot24], slot25)
				else
					slot10[slot24] = {
						slot25
					}
					slot11[#slot11 + 1] = slot24
				end
			end
		end

		slot3:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot4 = slot0:findTF("BuffItemContainer", slot2)

				setImageSprite(slot3, GetSpriteFromAtlas("ShipType", "buffitem_tec_" .. slot1[slot1 + 1]))
				slot0:upBuffList(slot2, slot2[slot1[slot1 + 1]])
			end

			return
		end)
		slot3:align(#slot11)

		return
	end

	onToggle(slot0, slot8, function (slot0)
		if slot0 == true then
			slot0(slot1 + 1, , true)
		else
			slot0(slot0, )
		end

		return
	end, SFX_PANEL)

	if slot5 == false then
		triggerToggle(slot8, false)
	end

	return
end

function slot0.upBuffList(slot0, slot1, slot2)
	slot4 = UIItemList.New(slot3, slot0.buffItemTpl)

	slot4:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot8 = slot1[slot1 + 1].valueColor

			setText(slot3, AttributeType.Type2Name(pg.attribute_info_by_type[slot1[slot1 + 1].attr].name))
			setText(slot0:findTF("ValueText", slot2), "+" .. slot1[slot1 + 1].value)

			if slot1[slot1 + 1].attrColor then
				setTextColor(slot3, slot7)
			else
				setTextColor(slot3, Color.white)
			end

			if slot8 then
				setTextColor(slot4, slot8)
			else
				setTextColor(slot4, Color.green)
			end
		end

		return
	end)
	slot4:align(#slot2)

	return
end

function slot0.updateTecListData(slot0)
	slot0.tecList = getProxy(TechnologyNationProxy):GetTecList()

	return
end

return slot0
