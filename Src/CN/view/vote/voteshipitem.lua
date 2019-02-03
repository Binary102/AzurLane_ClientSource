slot0 = class("VoteShipItem")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot1.transform
	slot0.icon = findTF(slot0.tf, "icon")
	slot0.name = findTF(slot0.tf, "black/name")
end

function slot0.update(slot0, slot1)
	if slot0.voteShip ~= slot1 then
		slot0.voteShip = slot1

		slot0:flush()
	end
end

function slot0.flush(slot0)
	slot1 = slot0.voteShip.shipVO

	setImageSprite(slot0.icon, slot2)
	LoadSpriteAsync("herohrzicon/" .. slot0.voteShip.shipVO:getPainting(), function (slot0)
		if slot0.voteShip and slot0.voteShip.shipVO ==  then
			setImageSprite(slot0.icon, slot0, true)
		end
	end)
	setText(slot0.name, slot0.voteShip.shipVO:getName())
end

function slot0.clear(slot0)
	return
end

return slot0
