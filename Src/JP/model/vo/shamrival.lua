class("ShamRival", import(".Rival")).Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.level = slot1.level
	slot0.icon = slot1.icon
	slot0.name = slot1.name
	slot0.remoulded = false

	if slot1.remoulded and slot1.remoulded == 1 then
		slot0.remoulded = true
	end

	slot0.propose = slot1.propose and slot1.propose > 0
	slot0.proposeTime = slot1.propose
	slot0.vanguardShips = {}
	slot0.mainShips = {}

	_.each(slot1.ship_list, function (slot0)
		if Ship.New(slot0).getTeamType(slot1) == TeamType.Vanguard then
			table.insert(slot0.vanguardShips, slot1)
		elseif slot2 == TeamType.Main then
			table.insert(slot0.mainShips, slot1)
		end
	end)

	slot0.skinId = slot1.skin_id or 0

	if slot0.skinId == 0 and pg.ship_data_statistics[slot0.icon] then
		slot0.skinId = slot2.skin_id
	end
end

return class("ShamRival", import(".Rival"))
