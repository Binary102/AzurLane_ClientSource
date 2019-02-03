slot0 = class("ChatBubble")

function slot0.Ctor(slot0, slot1)
	slot0.tf = tf(slot1)
	slot0.layout = slot1:GetComponent(typeof(LayoutElement))
	slot0.layoutHeight = slot0.layout.preferredHeight
	slot0.nameTF = findTF(slot0.tf, "desc/name"):GetComponent("Text")
	slot0.pop = findTF(slot0.tf, "popo")
	slot0.face = findTF(slot0.tf, "face")
	slot0.content = findTF(slot0.tf, "popo/talk"):GetComponent("Text")
	slot0.timeTF = findTF(slot0.tf, "time"):GetComponent("Text")
	slot0.headTF = findTF(slot0.tf, "circle/head"):GetComponent("Image")
	slot0.stars = findTF(slot0.tf, "circle/head/stars")
	slot0.star = findTF(slot0.stars, "star")
	slot0.frontNormal = findTF(slot0.headTF, "popfront")
	slot0.frontProp = findTF(slot0.headTF, "propose")
	slot0.channel = findTF(slot0.tf, "desc/channel")
	slot0.levelTF = findTF(slot0.tf, "lv/Text")
	slot0.dutyTF = findTF(slot0.tf, "desc/duty")
end

function slot0.update(slot0, slot1)
	if slot0.data == slot1 then
		return
	end

	slot0.data = slot1
	slot3 = pg.ship_data_statistics[slot1.player.icon]
	slot0.nameTF.text = slot1.player.name
	slot0.timeTF.text = getOfflineTimeStamp(slot4)
	slot0.content.supportRichText = false
	slot0.content.text = slot1.content
	slot0.headTF.color = Color.New(1, 1, 1, 0)

	LoadSpriteAsync("qicon/" .. slot1.player:getPainting(), function (slot0)
		if not IsNil(slot0.headTF) then
			slot0.headTF.color = Color.white
			slot0.headTF.sprite = slot0 or LoadSprite("heroicon/unknown")
		end
	end)
	setActive(slot0.frontNormal, not slot1.player.propose)
	setActive(slot0.frontProp, slot1.player.propose)

	if slot0.dutyTF then
		setActive(slot0.dutyTF, slot2.duty)

		if slot2.duty then
			setImageSprite(slot0.dutyTF, GetSpriteFromAtlas("dutyicon/" .. slot2.duty, ""), true)
		end
	end

	for slot12 = slot0.stars.childCount, Ship.New({
		configId = slot3.id
	}).getStar(slot6) - 1, 1 do
		cloneTplTo(slot0.star, slot0.stars)
	end

	for slot12 = 0, slot0.stars.childCount - 1, 1 do
		slot0.stars:GetChild(slot12).gameObject:SetActive(slot12 < slot3.star)
	end

	if slot0.channel then
		setImageSprite(slot0.channel, GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot1.type)), true)
	end

	if slot0.levelTF then
		setText(slot0.levelTF, slot2.level)
	end

	if slot1.emojiId then
		PoolMgr.GetInstance():GetPrefab("emoji/" .. pg.emoji_template[slot1.emojiId].pic, pg.emoji_template[slot1.emojiId].pic, true, function (slot0)
			if slot0.face and slot0.data then
				slot0.name = slot1.pic

				if slot0:GetComponent("Animator") then
					slot1.enabled = true
				end

				setParent(slot0, slot0.face, false)
			else
				PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot1.pic, slot1.pic, slot0)
			end
		end)
	end

	setActive(slot0.pop, not slot1.emojiId)
	setActive(slot0.face, slot1.emojiId)

	slot0.layout.preferredHeight = (slot1.emojiId and slot0.layoutHeight + 80) or slot0.layoutHeight
end

function slot0.dispose(slot0)
	if slot0.face.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot0.face:GetChild(0).gameObject.name, slot0.face.GetChild(0).gameObject.name, slot0.face.GetChild(0).gameObject)
	end

	slot0.data = nil
end

return slot0
