slot0 = class("StaticCellView")
slot1 = import("view.util.LoadPrefabRequestPackage")
slot2 = import("view.util.LoadReferenceRequestPackage")
slot3 = import("view.util.LoadSpineRequestPackage")

function slot0.Ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.go = nil
	slot0.tf = nil
	slot0.info = nil
	slot0._loadingRequest = {}
end

function slot0.SetTpl(slot0, slot1)
	slot0._tpl = slot1
end

function slot0.UpdateGO(slot0)
	if slot0._tpl and slot0._currentTpl ~= slot1 then
		if not IsNil(slot0.go) then
			slot0:ClearRequests()
			Destroy(slot0.go)
		end

		slot0.go = Instantiate(slot1)

		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform
		slot0._currentTpl = slot1
	end
end

function slot0.LoadPrefab(slot0, slot1, slot2, slot3)
	slot2 = slot2 or ""
	slot0._loadingRequest[slot1 .. (slot2 or "" or "")] = slot0.New(slot1, slot2 or "", function (slot0)
		if slot0 then
			slot0(slot0)
		end

		slot1 = slot1._loadingRequest
		slot2 = slot2

		if not slot3 then
			slot3 = ""
		end

		slot1[slot2 .. slot3] = nil

		return
	end)

	slot0.New(slot1, slot2 or "", function (slot0)
		if slot0 then
			slot0(slot0)
		end

		slot1 = slot1._loadingRequest
		slot2 = slot2

		if not slot3 then
			slot3 = ""
		end

		slot1[slot2 .. slot3] = nil

		return
	end)()

	return

	slot2 = ""
	slot7 = ""
end

function slot0.LoadSprite(slot0, slot1, slot2, slot3, slot4, slot5)
	slot3:GetComponent(typeof(Image)).enabled = false

	if not slot2 then
		slot2 = ""
	end

	slot7 = slot0.New(slot1, slot2, function (slot0)
		slot0.enabled = true
		slot0.sprite = slot0

		if slot0 then
			slot0:SetNativeSize()
		end

		if slot2 then
			slot2(slot0)
		end

		slot1 = slot3._loadingRequest
		slot2 = slot4

		if not slot5 then
			slot3 = ""
		end

		slot1[slot2 .. slot3] = nil

		return
	end)
	slot8 = slot0._loadingRequest
	slot9 = slot1

	if not slot2 then
		slot10 = ""
	end

	slot8[slot9 .. slot10] = slot7

	slot7()

	return
end

function slot0.LoadSpine(slot0, slot1, slot2)
	if not slot1 or #slot1 < 0 then
		return
	end

	slot3 = slot0.New(slot1, function (slot0)
		if slot0 then
			slot0(slot0)
		end

		slot1 = slot1._loadingRequest

		if not "spine/" then
			slot3 = ""
		end

		slot1[slot2 .. slot3] = nil

		return
	end)
	slot4 = slot0._loadingRequest
	slot5 = "spine/"

	if not slot1 then
		slot6 = ""
	end

	slot4[slot5 .. slot6] = slot3

	slot3()

	return
end

function slot0.SetActive(slot0, slot1)
	setActive(slot0.go, slot1)

	return
end

function slot0.ClearRequests(slot0)
	for slot4, slot5 in pairs(slot0._loadingRequest) do
		slot5:Stop()
	end

	table.clear(slot0._loadingRequest)

	return
end

function slot0.DestroyGO(slot0)
	slot0:ClearRequests()

	if not IsNil(slot0.go) then
		Destroy(slot0.go)

		slot0.go = nil
		slot0.tf = nil
	end

	return
end

function slot0.Clear(slot0)
	slot0.parent = nil
	slot0._tpl = nil
	slot0._currentTpl = nil
	slot0.info = nil

	slot0:DestroyGO()
	slot0:ClearRequests()

	return
end

return slot0
