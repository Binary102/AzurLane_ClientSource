slot0 = class("ContextProxy", pm.Proxy)

slot0.getCurrentContext = function (slot0)
	return slot0.data[#slot0.data]
end

slot0.pushContext = function (slot0, slot1)
	table.insert(slot0.data, slot1)
end

slot0.popContext = function (slot0)
	return table.remove(slot0.data)
end

slot0.cleanContext = function (slot0)
	slot0.data = {}
end

slot0.getContextCount = function (slot0)
	return #slot0.data
end

slot0.getContextByMediator = function (slot0, slot1)
	for slot5 = #slot0.data, 1, -1 do
		if slot0.data[slot5]:getContextByMediator(slot1) then
			return slot7
		end
	end

	return nil
end

return slot0
