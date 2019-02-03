slot0 = class("FormationCard")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.btn = slot1:GetComponent("Button")
	slot0.lock = findTF(slot0.tr, "lock")
	slot0.add = findTF(slot0.tr, "add").gameObject
	slot0.addImage = slot0.add:GetComponent("Image")
	slot0.detail = findTF(slot0.tr, "detail").gameObject
	slot0.bgImage = findTF(slot0.detail, "bg"):GetComponent("Image")
	slot0.paintingTr = findTF(slot0.detail, "mask/painting")
	slot0.frameImage = findTF(slot0.detail, "frame/bg"):GetComponent("Image")
	slot0.starsTr = findTF(slot0.detail, "frame/stars")
	slot0.starTr = findTF(slot0.detail, "frame/stars/star_tpl")
	slot0.nameTxt = ScrollTxt.New(findTF(slot0.detail, "frame/name_mask"), findTF(slot0.detail, "frame/name_mask/name"))
	slot0.lvTxt = findTF(slot0.detail, "frame/lvbg/lv/Text"):GetComponent("Text")
	slot0.shipTypeImage = findTF(slot0.detail, "frame/type"):GetComponent("Image")
	slot0.shipState = findTF(slot0.detail, "frame/state").gameObject
	slot0.propsTr = findTF(slot0.detail, "frame/list")
	slot0.propsTr1 = findTF(slot0.detail, "frame/list1")
	slot0.energyTF = findTF(slot0.tr, "energy")
	slot0.duang = findTF(slot0.detail, "duang")
	slot0.duang6 = findTF(slot0.detail, "duang_6")
	slot0.npc = findTF(slot0.detail, "frame/npc")

	if not IsNil(slot0.npc) then
		setActive(slot0.npc, false)
	end

	slot0.shipState:SetActive(false)
	slot0:updateProps({})
end

function slot0.update(slot0, slot1, slot2)
	slot0.shipVO = slot1
	slot0.isLocked = slot2

	slot0:flush()
end

function slot0.updateProps(slot0, slot1)
	for slot5 = 0, 2, 1 do
		slot6 = slot0.propsTr:GetChild(slot5)

		if slot5 < #slot1 then
			slot6.gameObject:SetActive(true)

			slot6:GetChild(0):GetComponent("Text").text = slot1[slot5 + 1][1]
			slot6:GetChild(1):GetComponent("Text").text = slot1[slot5 + 1][2]
		else
			slot6.gameObject:SetActive(false)
		end
	end
end

function slot0.updateProps1(slot0, slot1)
	for slot5 = 0, 2, 1 do
		slot6 = slot0.propsTr1:GetChild(slot5)

		if slot5 < #slot1 then
			slot6.gameObject:SetActive(true)

			slot6:GetChild(0):GetComponent("Text").text = slot1[slot5 + 1][1]
			slot6:GetChild(1):GetComponent("Text").text = slot1[slot5 + 1][2]
		else
			slot6.gameObject:SetActive(false)
		end
	end
end

function slot0.flush(slot0)
	if slot0.lock then
		setActive(slot0.lock, false)
	end

	setActive(slot0.add, false)
	setActive(slot0.detail, false)

	if slot0.energyTF then
		setActive(slot0.energyTF, false)
	end

	if slot0.isLocked then
		if slot0.lock then
			setActive(slot0.lock, true)
			setImageSprite(slot0.lock, GetSpriteFromAtlas("shipframe", "bl"))
		end
	elseif slot0.shipVO then
		if not IsNil(slot0.npc) then
			setActive(slot0.npc, slot0.shipVO:isActivityNpc())
		end

		setActive(slot0.detail, true)

		slot2 = slot0.shipVO.getConfigTable(slot1)
		slot0.btn.targetGraphic = slot0.frameImage
		slot0.lvTxt.text = tostring(slot0.shipVO.level)

		slot0.nameTxt:setText(slot0.shipVO.getName(slot1))
		setPaintingPrefabAsync(slot0.paintingTr, slot0.shipVO.getPainting(slot1), "biandui")
		GetSpriteFromAtlasAsync("bg/star_level_card_" .. slot3, "", function (slot0)
			slot0.bgImage.sprite = slot0
		end)

		if slot0.energyTF then
			if slot1.energy <= Ship.ENERGY_MID then
				setImageSprite(slot0.energyTF, slot4)
				setActive(slot0.energyTF, true)
			else
				setActive(slot0.energyTF, false)
			end
		end

		slot0.frameImage.sprite = GetSpriteFromAtlas("shipframe", "b" .. ((slot1.propose and "prop") or slot3))

		slot0.frameImage:SetNativeSize()
		setActive(slot0.duang, slot1.propose)

		if slot0.duang6 then
			setActive(slot0.duang6, not slot1.propose and slot1:getRarity() == 6)
		end

		slot0.shipTypeImage.sprite = GetSpriteFromAtlas("shiptype", shipType2print(slot2.type))
		slot7 = slot1:getMaxStar() - slot1:getStar()

		for slot11 = slot0.starsTr.childCount, slot1.getMaxStar() - 1, 1 do
			cloneTplTo(slot0.starTr, slot0.starsTr)
		end

		for slot11 = 0, slot0.starsTr.childCount - 1, 1 do
			slot0.starsTr:GetChild(slot11).gameObject:SetActive(slot11 < slot6)
			SetActive(slot12:Find("empty"), slot11 < slot7)
			SetActive(slot12:Find("star"), slot7 <= slot11)
		end
	else
		setActive(slot0.add, true)

		slot0.addImage.sprite = GetSpriteFromAtlas("shipframe", "ba")
		slot0.btn.targetGraphic = slot0.addImage
	end
end

function slot0.clear(slot0)
	if slot0.shipVO then
		retPaintingPrefab(slot0.paintingTr, slot1:getPainting())
	end

	if slot0.nameTxt then
		slot0.nameTxt:destroy()

		slot0.nameTxt = nil
	end
end

return slot0
