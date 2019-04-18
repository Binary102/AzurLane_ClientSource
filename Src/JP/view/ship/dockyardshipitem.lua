slot0 = class("DockyardShipItem")
slot0.DetailType0 = 0
slot0.DetailType1 = 1
slot0.DetailType2 = 2
slot0.DetailType3 = 3
slot0.SKILL_COLOR = {
	"#D95656FF",
	"#4ABBE1FF",
	"#B5B748FF"
}
slot1 = 0.5

function slot0.Ctor(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.showTagNoBlock = slot2 or false
	slot0.tr = slot1.transform
	slot0.btn = slot1:GetComponent("Button")
	slot0.content = findTF(slot0.tr, "content").gameObject
	slot0.quit = findTF(slot0.tr, "quit_button").gameObject
	slot0.detail = findTF(slot0.tr, "detail").gameObject
	slot0.detailLayoutTr = findTF(slot0.detail, "layout")
	slot0.imageQuit = slot0.quit:GetComponent("Image")
	slot0.imageBg = findTF(slot0.tr, "content/bg"):GetComponent("Image")
	slot0.imageFrame = findTF(slot0.tr, "content/frame/bg"):GetComponent("Image")
	slot0.iconType = findTF(slot0.tr, "content/frame/info/type"):GetComponent("Image")
	slot0.imageLvLb = findTF(slot0.tr, "content/frame/info/lv/lv_label"):GetComponent("Image")
	slot0.labelLevel = findTF(slot0.tr, "content/frame/info/lv/Text"):GetComponent("Text")
	slot0.npc = findTF(slot0.tr, "content/npc")

	setActive(slot0.npc, false)

	slot0.labelName = ScrollTxt.New(findTF(slot0.tr, "content/frame/info/name_mask"), findTF(slot0.tr, "content/frame/info/name_mask/name"))
	slot0.iconShip = findTF(slot0.tr, "content/ship_icon"):GetComponent("Image")
	slot0.stars = findTF(slot0.tr, "content/frame/info/stars")
	slot0.star = findTF(slot0.tr, "content/frame/info/stars/star_tpl")
	slot0.lock = findTF(slot0.tr, "content/container/lock")
	slot0.maskStatusOb = findTF(slot0.tr, "content/frame/status_mask") and slot2 or false.gameObject
	slot0.iconStatus = findTF(slot0.tr, "content/frame/status"):GetComponent("Image")
	slot0.iconStatusTxt = findTF(slot0.tr, "content/frame/status/Text"):GetComponent("Text")
	slot0.selectedGo = findTF(slot0.tr, "selected").gameObject
	slot0.energyTF = findTF(slot0.tr, "content/container/energy")
	slot0.proposeTF = findTF(slot0.content, "propose")

	slot0.selectedGo:SetActive(false)

	slot0.duang = findTF(slot0.tr, "content/duang")
	slot0.duang6 = findTF(slot0.tr, "content/duang_6")
	slot0.duang6tuzhi = findTF(slot0.tr, "content/duang_6_tuzhi")

	if findTF(slot0.tr, "content/frame/info/slv") then
		slot0.slv = slot4.gameObject
		slot0.labelSlv = findTF(slot0.tr, "content/frame/info/slv/Text"):GetComponent("Text")
	end

	slot0.detailType = slot0.DetailType0
end

function slot0.update(slot0, slot1)
	if slot1 then
		slot0.go.name = slot1.configId
	end

	if slot0.shipVO ~= slot1 then
		slot0.shipVO = slot1

		slot0:flush()
		slot0:flushDetail()
	end
end

function slot0.updateDetail(slot0, slot1)
	slot0.detailType = slot1

	slot0:flushDetail()
end

function slot0.updateSelected(slot0, slot1)
	slot0.selected = slot1

	slot0.selectedGo:SetActive(slot0.selected)

	if slot0.selected then
		if not slot0.selectedTwId then
			slot0.selectedTwId = LeanTween.alpha(slot0.selectedGo.transform, 1, slot0):setFrom(0):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId
		end
	elseif slot0.selectedTwId then
		LeanTween.cancel(slot0.selectedTwId)

		slot0.selectedTwId = nil
	end
end

function slot0.flush(slot0)
	if tobool(slot0.shipVO) then
		if not slot1:getConfigTable() then
			return
		end

		if slot0.lock then
			slot0.lock.gameObject:SetActive(slot1:GetLockState() == Ship.LOCK_STATE_LOCK)
		end

		setActive(slot0.npc, slot1:isActivityNpc())

		if slot1.energy <= Ship.ENERGY_MID then
			if not GetSpriteFromAtlas("energy", slot1:getEnergyPrint()) then
				warning("找不到疲劳")
			end

			setImageSprite(slot0.energyTF, slot6)
		end

		setActive(slot0.energyTF, slot5)

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot1.configId)
		end

		slot0.iconType.sprite = slot6
		slot0.labelLevel.text = tostring(slot1.level)

		slot0.labelName:setText(slot1:getName())

		if slot0.slv then
			slot0.slv:SetActive(false)
		end

		GetSpriteFromAtlasAsync("shipframe", (slot1.propose and "prop") or slot1:rarity2bgPrint(), function (slot0)
			if slot0.shipVO ==  then
				slot0.imageFrame.sprite = slot0

				slot0.imageFrame:SetNativeSize()
			end
		end)

		slot0.imageBg.sprite = GetSpriteFromAtlas("bg/star_level_card_" .. slot1.rarity2bgPrint(), "")
		slot0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

		if slot0.bufferTimer then
			slot0.bufferTimer:Stop()
		end

		slot0.bufferTimer = Timer.New(function ()
			LoadSpriteAsync("shipYardIcon/" .. slot0:getPainting(), function (slot0)
				if slot0.shipVO ==  then
					slot0.iconShip.sprite = slot0

					slot0.iconShip:SetNativeSize()
				end
			end)
		end, 0.1, 1)

		slot0.bufferTimer:Start()

		slot9 = slot1:getStar()

		for slot14 = slot0.stars.childCount, slot1:getMaxStar() - 1, 1 do
			cloneTplTo(slot0.star, slot0.stars)
		end

		slot11 = slot10 - slot9

		for slot15 = 0, slot0.stars.childCount - 1, 1 do
			slot0.stars:GetChild(slot15).gameObject:SetActive(slot15 < slot10)
			SetActive(slot16:Find("star_tpl"), slot11 <= slot15)
			SetActive(slot16:Find("star_empty_tpl"), slot15 < slot11)
		end

		slot12 = slot1:getFleetId() == FleetProxy.PVP_FLEET_ID

		if ShipStatus.ShipStatu2Bg(slot1) then
			slot0.iconStatus.sprite = GetSpriteFromAtlas("shipstatus", slot13)

			slot0.iconStatus.gameObject:SetActive(true)

			if slot1.inFleet and not slot12 and not slot1.inChapter and not slot1.inElite and not slot1.inActivity and not slot1.shamInFleet and not slot1.inSham and not slot1.inChallenge then
				tf(slot0.iconStatus).sizeDelta = Vector2(105, 36)
				slot0.iconStatusTxt.text = Fleet.DEFAULT_NAME_FOR_DOCKYARD[slot1:getFleetId()]
				slot0.iconStatusTxt.fontSize = 22
			else
				tf(slot0.iconStatus).sizeDelta = Vector2(92, 36)
				slot0.iconStatusTxt.fontSize = 24
				slot0.iconStatusTxt.text = ShipStatus.ShipStatu2Name(slot1)
			end
		else
			slot0.iconStatus.gameObject:SetActive(false)
		end

		slot0:updateBlackBlock()

		slot14 = slot0.shipVO.propose
		slot15 = slot0.shipVO:isBluePrintShip()
		slot16 = slot0.shipVO:getRarity() == ShipRarity.SSR

		setActive(slot0.proposeTF, false)

		if not LOCK_PROPOSE then
			slot17, slot18, slot19 = slot0.shipVO:getIntimacyDetail()

			if slot18 <= slot19 and not slot14 then
				setActive(slot0.proposeTF, true)
			end

			setActive(slot0.duang, slot14)
		else
			setActive(slot0.proposeTF, false)
		end

		setActive(slot0.duang6, slot16 and not slot14 and not slot15)
		setActive(slot0.duang6tuzhi, slot16 and not slot14 and slot15)

		if slot4 then
			setActive(slot0.proposeTF, false)
		end
	end

	slot0.content:SetActive(slot2)
	slot0.quit:SetActive(not slot2)

	slot0.btn.targetGraphic = (slot2 and slot0.imageFrame) or slot0.imageQuit
end

function slot0.flushDetail(slot0)
	if tobool(slot0.shipVO) and slot0.DetailType0 < slot0.detailType then
		slot3 = slot1:getShipProperties()
		slot4 = {
			AttributeType.Durability,
			AttributeType.Cannon,
			AttributeType.Torpedo,
			AttributeType.Air,
			AttributeType.AntiAircraft,
			AttributeType.ArmorType,
			AttributeType.Reload,
			AttributeType.Dodge
		}
		slot5 = slot1:getShipCombatPower()
		slot6, slot7 = nil

		if slot0.detailType == slot0.DetailType3 then
			slot6 = slot1:getDisplaySkillIds()
			slot7 = pg.skill_data_template
		end

		function slot8(slot0)
			if not ShipModAttr.ATTR_TO_INDEX[slot0] then
				return true
			elseif slot0:getModAttrTopLimit(slot0) == 0 then
				return true
			else
				return slot0:getMaxLevel() == slot0.level and slot0:getModAttrBaseMax(slot0) <= slot0:getShipProperties()[slot0]
			end
		end

		for slot12 = 1, 5, 1 do
			slot13 = slot0.detailLayoutTr:GetChild(slot12 - 1)
			slot14 = true
			slot15 = slot13:GetChild(0):GetComponent("Text")
			slot16 = slot13:GetChild(1):GetComponent("Text")

			if slot0.detailType == slot0.DetailType1 then
				if slot12 == 1 then
					slot15.alignment = TextAnchor.MiddleLeft
				end

				slot15.text = AttributeType.Type2Name(slot17)
				slot16.text = (slot8(slot4[slot12]) and setColorStr(tostring(math.floor(slot3[slot4[slot12]])), COLOR_GREEN)) or setColorStr(tostring(math.floor(slot3[slot4[slot12]])), COLOR_WHITE)
			elseif slot0.detailType == slot0.DetailType2 then
				if slot12 == 5 then
					slot15.text = "<color=#A9F548FF>" .. i18n("word_synthesize_power") .. "</color>"
					slot16.text = tostring(math.floor(slot5))
				elseif slot12 == 1 then
					slot15.alignment = TextAnchor.MiddleCenter
					slot15.text = slot1:getShipArmorName()
					slot16.text = ""
				elseif slot12 == 4 then
					slot15.text = AttributeType.Type2Name(AttributeType.Expend)
					slot16.text = tostring(math.floor(slot1:getBattleTotalExpend()))
				else
					slot15.text = AttributeType.Type2Name(slot17)
					slot16.text = tostring(math.floor(slot3[slot4[slot12 + 5]]))
				end
			elseif slot0.detailType == slot0.DetailType3 then
				if slot6[slot12] and slot1.skills[slot17] and slot7[slot17].max_level ~= 1 then
					slot15.alignment = TextAnchor.MiddleLeft
					slot15.text = setColorStr(i18n("skill") .. slot12, slot0.SKILL_COLOR[pg.skill_data_template[slot1.skills[slot17].id].type] or COLOR_WHITE)
					slot16.text = setColorStr((slot18.level == slot7[slot17].max_level and "Lv.Max") or "Lv." .. slot18.level, slot0.SKILL_COLOR[pg.skill_data_template[slot1.skills[slot17].id].type] or COLOR_WHITE)
				else
					slot14 = false
				end
			end

			setActive(slot13, slot14)
		end
	end

	slot0.detail:SetActive(slot2 and slot0.DetailType0 < slot0.detailType)
end

function slot0.updateBlackBlock(slot0)
	slot2 = slot0.shipVO.blackBlock

	if slot0.maskStatusOb then
		slot0.maskStatusOb:SetActive(slot2)
	end
end

function slot0.clear(slot0)
	if slot0.selectedTwId then
		LeanTween.cancel(slot0.selectedTwId)

		slot0.selectedTwId = nil
	end

	if slot0.bufferTimer then
		slot0.bufferTimer:Stop()

		slot0.bufferTimer = nil
	end

	slot0.iconType.sprite = nil
	slot0.imageFrame.sprite = nil
	slot0.iconShip.sprite = nil
	slot0.iconStatus.sprite = nil
	slot0.shipVO = nil

	slot0.labelName:clear()
end

return slot0
