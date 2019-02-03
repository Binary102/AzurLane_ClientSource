slot0 = class("VoteShip", import("..BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.group = slot1.group
	slot0.votes = slot1.votes
	slot0.ivoted = false
	slot0.rank = 0

	for slot5 = 4, 1, -1 do
		if pg.ship_data_statistics[tonumber(slot0.group .. slot5)] then
			slot0.configId = slot6

			break
		end
	end

	slot0.shipVO = Ship.New({
		id = slot0.configId,
		configId = slot0.configId
	})
end

function slot0.bindConfigTable(slot0)
	return pg.ship_data_statistics
end

function slot0.getDockSortValue(slot0)
	return 0
end

function slot0.getRarity(slot0)
	return slot0.shipVO:getRarity()
end

return slot0
