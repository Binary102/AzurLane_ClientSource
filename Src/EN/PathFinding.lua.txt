PathFinding = class("PathFinding")
PathFinding.PrioNormal = 1
PathFinding.PrioObstacle = 1000
PathFinding.PrioForbidden = 100000

PathFinding.Ctor = function (slot0, slot1, slot2, slot3)
	slot0.cells = slot1
	slot0.rows = slot2
	slot0.columns = slot3
end

PathFinding.Find = function (slot0, slot1, slot2)
	slot2 = {
		row = slot2.row,
		column = slot2.column
	}

	if slot0.cells[({
		row = slot1.row,
		column = slot1.column
	})["row"]][()["column"]] < 0 or slot0.cells[slot2.row][slot2.column] < 0 then
		return 0, {}
	else
		return slot0:_Find(slot1, slot2)
	end
end

PathFinding._Find = function (slot0, slot1, slot2)
	slot3 = 1
	slot4 = slot0.PrioForbidden
	slot5 = {}
	slot6 = {
		slot1
	}
	slot7 = {
		slot1
	}
	slot8 = {
		[slot1.row] = {
			[slot1.column] = {
				priority = 0,
				path = {}
			}
		}
	}

	while #slot6 > 0 do
		if table.remove(slot6, 1).row == slot2.row and slot9.column == slot2.column then
			slot4 = slot8[slot9.row][slot9.column].priority
			slot5 = slot8[slot9.row][slot9.column].path

			break
		end

		table.insert(slot7, slot9)
		_.each({
			{
				row = 1,
				column = 0
			},
			{
				row = -1,
				column = 0
			},
			{
				row = 0,
				column = 1
			},
			{
				row = 0,
				column = -1
			}
		}, function (slot0)
			slot0.row = slot0.row + slot0.row
			slot0.column = slot0.column + slot0.column

			if not (_.any(_.any, function (slot0)
				return slot0.row == slot0.row and slot0.column == slot0.column
			end) or _.any(slot2, function (slot0)
				return slot0.row == slot0.row and slot0.column == slot0.column
			end)) and slot0.row >= 0 and slot0.row < slot3.rows and slot0.column >= 0 and slot0.column < slot3.columns then
				if slot4[slot0.row][slot0.column].priority + slot3.cells[slot0.row][slot0.column] < slot5.PrioObstacle then
					slot4 = Clone(slot2)

					table.insert(slot4.path, slot0)

					slot4.priority = slot3
					slot4[slot0.row] = slot4[slot0.row] or {}
					slot4[slot0.row][slot0.column] = slot4
					slot5 = 0

					for slot9 = #slot1, 1, -1 do
						if slot4[slot1[slot9].row][slot1[slot9].column].priority <= slot4.priority then
							slot5 = slot9

							break
						end
					end

					table.insert(slot1, slot5 + 1, slot0)
				else
					slot6 = math.min(slot6, slot3)
				end
			end
		end)
	end

	if slot0.PrioObstacle <= slot4 then
		slot9 = 1000000
		slot10 = slot0.PrioForbidden

		for slot14, slot15 in pairs(slot8) do
			for slot19, slot20 in pairs(slot15) do
				if slot9 > math.abs(slot2.row - slot14) + math.abs(slot2.column - slot19) or (slot21 == slot9 and slot20.priority < slot10) then
					slot9 = slot21
					slot10 = slot20.priority
					slot5 = slot20.path
				end
			end
		end
	end

	return slot4, slot5
end

return PathFinding
