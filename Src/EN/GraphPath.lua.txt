GraphPath = class("GraphPath")

GraphPath.Ctor = function (slot0, slot1)
	slot0.points = {}

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

GraphPath.getRandomPoint = function (slot0)
	return _.values(slot0.points)[math.random(1, #_.values(slot0.points))]
end

GraphPath.getPoint = function (slot0, slot1)
	return slot0.points[slot1]
end

return
