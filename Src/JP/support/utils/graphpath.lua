GraphPath = class("GraphPath")

function GraphPath.Ctor(slot0, slot1)
	slot0.points = {}
	slot0.offset = {
		x = 0,
		y = 0
	}
	slot0.scale = {
		x = 1,
		y = 1
	}

	if slot1.Transform then
		slot0.offset = {
			x = slot1.Transform[1],
			y = slot1.Transform[2]
		}
		slot0.scale = {
			x = slot1.Transform[3],
			y = slot1.Transform[4]
		}
	end

	for slot5, slot6 in pairs(slot1.Points) do
		slot0.points[slot5] = {
			x = slot6.x,
			y = slot6.y,
			nexts = {}
		}
	end

	for slot5, slot6 in pairs(slot1.Edges) do
		slot8 = slot0.points[slot6.p2]

		if slot0.points[slot6.p1] and slot8 and slot7 ~= slot8 then
			table.insert(slot7.nexts, slot6.p2)
			table.insert(slot8.nexts, slot6.p1)
		end
	end
end

function GraphPath.getRandomPoint(slot0)
	return _.values(slot0.points)[math.random(1, #_.values(slot0.points))]
end

function GraphPath.getPoint(slot0, slot1)
	return slot0.points[slot1]
end

return
