slot0 = class("SnapshotShipCard")
slot0.TypeCard = 1
slot0.TypeTrans = 2

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.btn = slot1:GetComponent("Button")
	slot0.content = findTF(slot0.tr, "content").gameObject
	slot0.imageBg = findTF(slot0.tr, "content/bg"):GetComponent("Image")
	slot0.imageFrame = findTF(slot0.tr, "content/frame"):GetComponent("Image")
	slot0.iconType = findTF(slot0.tr, "content/frame/info/type"):GetComponent("Image")
	slot0.labelName = ScrollTxt.New(findTF(slot0.tr, "content/frame/info/name_mask"), findTF(slot0.tr, "content/frame/info/name_mask/name"))
	slot0.iconShip = findTF(slot0.tr, "content/ship_icon"):GetComponent("Image")
	slot0.stars = findTF(slot0.tr, "content/frame/info/stars")
	slot0.star = findTF(slot0.tr, "content/frame/info/stars/star_tpl")
	slot0.labelHeart = findTF(slot0.tr, "content/frame/heart/heart"):GetComponent("Text")
	slot0.labelHeartIcon = findTF(slot0.tr, "content/frame/heart/icon"):GetComponent("Image")
	slot0.labelHeartPlus = findTF(slot0.tr, "content/frame/heart/heart+"):GetComponent("Text")
	slot0.imageUnknown = findTF(slot0.tr, "unknown"):GetComponent("Image")
	slot0.labelNumber = findTF(slot0.tr, "number/Text"):GetComponent("Text")
	slot0.ringTF = findTF(slot0.tr, "ring")
end

function slot0.update(slot0, slot1, slot2, slot3, slot4)
	if slot0.code ~= slot1 or slot0.shipGroup ~= slot2 or slot0.showTrans ~= slot3 or slot0.propose ~= slot4 then
		slot0.code = slot1
		slot0.shipGroup = slot2
		slot0.showTrans = slot3
		slot0.propose = slot4

		slot0:flush()
	end
end

function slot0.flush(slot0)
	if slot0.shipGroup then
		slot2 = slot1.shipConfig
		slot3 = slot1:getRarity(slot0.showTrans)
		slot4 = slot1:getPainting(slot0.showTrans)
		slot0.iconType.sprite = GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType(slot0.showTrans)))

		slot0.labelName:setText(slot1:getName(slot0.showTrans))

		slot5 = slot0.labelHeart
		slot6 = (slot1.hearts > 999 and "999") or tostring(slot1.hearts)
		slot5.text = slot6

		setActive(slot0.labelHeartPlus, slot1.hearts > 999)

		slot0.labelHeart.color = (slot1.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)
		slot0.labelHeartIcon.color = (slot1.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)
		slot0.labelHeartPlus.color = (slot1.iheart and Color.New(1, 0.6, 0.6)) or Color.New(1, 1, 1)

		GetSpriteFromAtlasAsync("shipframe", ((slot0.shipGroup:isBluePrintGroup() and "1") or "") .. shipRarity2bgPrint(slot1.getRarity(slot0.showTrans)), function (slot0)
			if not IsNil(slot0.imageFrame) then
				slot0.imageFrame.sprite = slot0
			end

			return
		end)

		slot0.imageBg.sprite = GetSpriteFromAtlas("bg/star_level_card_" .. ((slot0.shipGroup:isBluePrintGroup() and "1") or "") .. shipRarity2bgPrint(slot1.getRarity(slot0.showTrans)), "")
		slot0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")
		slot6 = "999"

		if "999" then
			slot6 = tostring(slot1.hearts)
		end

		slot7 = false

		if false then
			slot7 = true
		end

		if not Color.New(1, 0.6, 0.6) then
			slot6 = Color.New(1, 1, 1)
		end

		if not Color.New(1, 0.6, 0.6) then
			slot6 = Color.New(1, 1, 1)
		end

		if not Color.New(1, 0.6, 0.6) then
			slot6 = Color.New(1, 1, 1)
		end

		slot8 = "1"

		if "1" then
			slot8 = ""
		end

		slot9 = "1"

		if "1" then
			slot9 = ""
		end

		if slot0.bufferTimer then
			slot0.bufferTimer:Stop()
		end

		slot0.bufferTimer = Timer.New(function ()
			LoadSpriteAsync("shipYardIcon/" .. slot0, function (slot0)
				if slot0.shipGroup ==  then
					slot0.iconShip.sprite = slot0

					slot0.iconShip:SetNativeSize()
				end

				return
			end)

			return
		end, 0.1, 1)

		slot0.bufferTimer:Start()
	else
		GetSpriteFromAtlasAsync("shipframe", "unknown", function (slot0)
			if not IsNil(slot0.imageUnknown) then
				slot0.imageUnknown.sprite = slot0
			end

			return
		end)
	end

	slot0.content:SetActive(not not slot1)
	slot0.imageUnknown.gameObject:SetActive(not slot1)

	slot0.btn.targetGraphic = (slot1 and slot0.imageFrame) or slot0.imageUnknown
	slot0.labelNumber.text = string.format("%03u", slot0.code)

	setActive(slot0.ringTF, slot0.propose)

	return

	if not slot0.imageFrame then
		slot3 = slot0.imageUnknown
	end
end

function slot0.clear(slot0)
	if slot0.bufferTimer then
		slot0.bufferTimer:Stop()

		slot0.bufferTimer = nil
	end

	slot0.labelName:clear()

	slot0.shipGroup = nil
	slot0.showTrans = nil
	slot0.propose = nil
	slot0.code = nil

	return
end

return slot0
