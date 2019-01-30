slot0 = class("VoteShipItem")

slot0.Ctor = function (slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot1.transform
	slot0.icon = findTF(slot0.tf, "icon")
	slot0.name = findTF(slot0.tf, "black/name")
end

slot0.update = function (slot0, slot1)
	if slot0.voteShip ~= slot1 then
		slot0.voteShip = slot1

		slot0:flush()
	end
end

slot0.flush = function (slot0)
	slot1 = slot0.voteShip.shipVO

	setImageSprite(slot0.icon, slot2)
	LoadSpriteAsync("herohrzicon/" .. slot0.voteShip.shipVO:getPainting(), function (slot0)
		if slot0.voteShip and slot0.voteShip.shipVO ==  then
			setImageSprite(slot0.icon, slot0, true)
		end
	end)
	setText(slot0.name, slot0.voteShip.shipVO:getName())
end

slot0.clear = function (slot0)
	return
end

return slot0
