slot0 = class("ShipDetailCard")
slot1 = 0.5

function slot0.Ctor(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.showTagNoBlock = slot2 or false
	slot0.tr = slot1.transform
	slot0.content = findTF(slot0.tr, "content").gameObject
	slot0.imageBg = findTF(slot0.tr, "content/bg"):GetComponent("Image")
	slot0.imageFrame = findTF(slot0.tr, "content/frame/bg"):GetComponent("Image")
	slot0.iconType = findTF(slot0.tr, "content/frame/info/type"):GetComponent("Image")
	slot0.imageLvLb = findTF(slot0.tr, "content/frame/info/lv/lv_label"):GetComponent("Image")
	slot0.labelLevel = findTF(slot0.tr, "content/frame/info/lv/Text"):GetComponent("Text")
	slot0.labelName = ScrollTxt.New(findTF(slot0.tr, "content/frame/info/name_mask"), findTF(slot0.tr, "content/frame/info/name_mask/name"))
	slot0.iconShip = findTF(slot0.tr, "content/ship_icon"):GetComponent("Image")
	slot0.stars = findTF(slot0.tr, "content/frame/info/stars")
	slot0.star = findTF(slot0.tr, "content/frame/info/stars/star_tpl")
	slot0.lock = findTF(slot0.tr, "content/container/lock")
	slot0.maskStatus = findTF(slot0.tr, "content/frame/status_mask")
	slot0.iconStatus = findTF(slot0.tr, "content/frame/status"):GetComponent("Image")
	slot0.iconStatusTxt = findTF(slot0.tr, "content/frame/status/Text"):GetComponent(typeof(Text))
	slot0.selectedGo = findTF(slot0.tr, "selected").gameObject
	slot0.energyTF = findTF(slot0.tr, "content/container/energy")
	slot0.proposeTF = findTF(slot0.content, "propose")

	slot0.selectedGo:SetActive(false)

	slot0.duang = findTF(slot0.tr, "content/duang")
	slot0.duang6 = findTF(slot0.tr, "content/duang6")

	if findTF(slot0.tr, "content/frame/info/slv") then
		slot0.slv = slot3.gameObject
		slot0.labelSlv = findTF(slot0.tr, "content/frame/info/slv/Text"):GetComponent("Text")
	end
end

function slot0.update(slot0, slot1)
	if slot0.shipVO ~= slot1 then
		slot0.shipVO = slot1

		slot0:flush()
	end
end

function slot0.updateSelected(slot0, slot1)
	slot0.selected = slot1

	slot0.selectedGo:SetActive(slot0.selected)

	if slot0.selected then
		if not slot0.selectedTw then
			slot0.selectedTw = LeanTween.alpha(slot0.selectedGo.transform, 1, slot0):setFrom(0):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
		end
	elseif slot0.selectedTw then
		LeanTween.cancel(slot0.selectedTw.uniqueId)

		slot0.selectedTw = nil
	end
end

function slot0.flush(slot0)
	if tobool(slot0.shipVO) then
		if not slot1:getConfigTable() then
			return
		end

		if slot0.maskStatus then
			slot0.maskStatus.gameObject:SetActive(false)
		end

		if slot0.lock then
			slot0.lock.gameObject:SetActive(slot1:GetLockState() == Ship.LOCK_STATE_LOCK)
		end

		if slot1.energy <= Ship.ENERGY_MID then
			if not GetSpriteFromAtlas("energy", slot1:getEnergyPrint()) then
				warning("找不到疲劳")
			end

			setImageSprite(slot0.energyTF, slot5)
		end

		setActive(slot0.energyTF, slot4)

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot1.configId)
		end

		slot0.iconType.sprite = slot5
		slot0.labelLevel.text = tostring(slot1.level)

		slot0.labelName:setText(slot1:getName())

		if slot0.slv then
			slot0.slv:SetActive(false)
		end

		GetSpriteFromAtlasAsync("shipframe", (slot1.propose and "prop") or slot1:rarity2bgPrint(), function (slot0)
			slot0.imageFrame.sprite = slot0

			slot0.imageFrame:SetNativeSize()
		end)
		GetSpriteFromAtlasAsync("bg/star_level_card_" .. slot1.rarity2bgPrint(), "", function (slot0)
			slot0.imageBg.sprite = slot0
		end)

		slot0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

		if slot0.bufferTimer then
			slot0.bufferTimer:Stop()
		end

		slot0.bufferTimer = Timer.New(function ()
			LoadSpriteAsync("shipYardIcon/" .. slot0:getPainting(), function (slot0)
				slot0.iconShip.sprite = slot0

				slot0.iconShip:SetNativeSize()
			end)
		end, 0.01, 1)

		slot0.bufferTimer:Start()

		slot8 = slot1:getStar()

		for slot13 = slot0.stars.childCount, slot1:getMaxStar() - 1, 1 do
			cloneTplTo(slot0.star, slot0.stars)
		end

		slot10 = slot9 - slot8

		for slot14 = 0, slot0.stars.childCount - 1, 1 do
			slot0.stars:GetChild(slot14).gameObject:SetActive(slot14 < slot9)
			SetActive(slot15:Find("star_tpl"), slot10 <= slot14)
			SetActive(slot15:Find("star_empty_tpl"), slot14 < slot10)
		end

		if ShipStatus.ShipStatu2Bg(slot1) then
			if slot0.maskStatus and not slot0.showTagNoBlock then
				slot0.maskStatus.gameObject:SetActive(true)
			end

			slot0.iconStatus.sprite = GetSpriteFromAtlas("shipstatus", slot11)

			slot0.iconStatus.gameObject:SetActive(true)

			tf(slot0.iconStatus).sizeDelta = Vector2(92, 36)
			slot0.iconStatusTxt.text = ShipStatus.ShipStatu2Name(slot1)
			slot0.iconStatusTxt.fontSize = 24
		else
			slot0.iconStatus.gameObject:SetActive(false)
		end

		setActive(slot0.proposeTF, false)

		if not LOCK_PROPOSE then
			slot12, slot13, slot14 = slot0.shipVO:getIntimacyDetail()

			if slot13 <= slot14 and not slot0.shipVO.propose then
				setActive(slot0.proposeTF, true)
			end

			setActive(slot0.duang, slot0.shipVO.propose)
		end

		if slot0.duang6 then
			setActive(slot0.duang6, not slot1.propose and slot1:getRarity() == 6)
		end
	end

	slot0.content:SetActive(slot2)
end

function slot0.clear(slot0)
	if slot0.selectedTw then
		LeanTween.cancel(slot0.selectedTw.uniqueId)

		slot0.selectedTw = nil
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
