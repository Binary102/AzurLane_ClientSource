slot0 = class("ReturnSpineRequestPackage", import("view.util.RequestPackage"))

function slot0.__call(slot0)
	if slot0.stopped then
		return
	end

	pg.PoolMgr.GetInstance():ReturnSpineChar(slot0.name, slot0.model)

	if slot0.callback then
		slot0.callback()
	end

	return slot0
end

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.name = slot1
	slot0.model = slot2
	slot0.callback = slot3
end

return slot0
