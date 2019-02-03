slot0 = class("ContextProxy", pm.Proxy)

function slot0.getCurrentContext(slot0)
	return slot0.data[#slot0.data]
end

function slot0.pushContext(slot0, slot1)
	table.insert(slot0.data, slot1)
end

function slot0.popContext(slot0)
	return table.remove(slot0.data)
end

function slot0.cleanContext(slot0)
	slot0.data = {}
end

function slot0.getContextCount(slot0)
	return #slot0.data
end

function slot0.getContextByMediator(slot0, slot1)
	for slot5 = #slot0.data, 1, -1 do
		if slot0.data[slot5]:getContextByMediator(slot1) then
			return slot7
		end
	end

	return nil
end

return slot0
