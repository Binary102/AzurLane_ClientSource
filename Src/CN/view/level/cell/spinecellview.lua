slot0 = class("SpineCellView")
slot1 = import("view.util.LoadPrefabRequestPackage")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot0.go.transform
	slot0.tfShip = slot0.tf:Find("ship")
	slot0.validate = true
	slot0._attachmentList = {}
	slot0._extraEffect = nil
	slot0._loadingRequest = {}
end

function slot0.getOrder(slot0)
	return 0
end

function slot0.getLine(slot0)
	return slot0.line
end

function slot0.setLine(slot0, slot1)
	slot0.line = {
		row = slot1.row,
		column = slot1.column
	}
end

function slot0.getPrefab(slot0)
	return slot0.prefab
end

function slot0.setPrefab(slot0, slot1)
	slot0.prefab = slot1
end

function slot0.getAction(slot0)
	return slot0.action
end

function slot0.setAction(slot0, slot1)
	slot0.action = slot1

	if slot0.anim then
		slot0.anim:SetAction(slot1, 0)
	end
end

function slot0.getModel(slot0)
	return slot0.model
end

function slot0.setModel(slot0, slot1)
	slot1.transform.name = "model"
	slot1.transform.GetComponent(slot2, "SkeletonGraphic").raycastTarget = false

	slot1.transform.SetParent(slot2, slot0.tfShip, false)

	slot1.transform.localPosition = Vector3.zero
	slot1.transform.localScale = Vector3(0.4, 0.4, 1)

	pg.ViewUtils.SetLayer(slot2, Layer.UI)

	slot0.model = slot1
	slot0.anim = slot1.transform.GetComponent(slot2, "SpineAnimUI")

	slot0:setAction(slot0:getAction())
end

function slot0.setAttachment(slot0, slot1)
	slot0._attachmentInfo = slot1
end

function slot0.SetExtraEffect(slot0, slot1)
	slot0._extraEffect = slot1
end

function slot0.loadSpine(slot0, slot1)
	if slot0.lastPrefab == slot0:getPrefab() then
		if not IsNil(slot0.model) and slot1 then
			slot1()
		end

		return
	end

	slot0:unloadSpine()

	function slot3()
		if slot0._attachmentInfo then
			for slot3, slot4 in pairs(slot0._attachmentInfo) do
				if slot4.attachment_combat_ui[1] ~= "" then
					slot0._loadingRequest["Effect/" .. slot5] = slot1.New(slot6, slot5, function (slot0)
						slot0._attachmentList[] = slot0

						tf(slot0):SetParent(tf(slot0.model))

						tf(slot0).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
						slot0._loadingRequest[] = nil
					end)

					slot1.New(slot6, slot5, function (slot0)
						slot0._attachmentList[] = slot0

						tf(slot0).SetParent(tf(slot0.model))

						tf(slot0).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
						slot0._loadingRequest[] = nil
					end)()
				end
			end
		end

		if slot0._extraEffect and #slot0._extraEffect > 0 then
			slot0._loadingRequest["effect/" .. slot0] = slot1:New(slot0._extraEffect, function (slot0)
				slot0._attachmentList[] = slot0

				tf(slot0):SetParent(tf(slot0.model))

				slot0._loadingRequest[] = nil

				return
			end)

			slot1.New(slot0._extraEffect, function (slot0)
				slot0._attachmentList[] = slot0

				tf(slot0).SetParent(tf(slot0.model))

				slot0._loadingRequest[] = nil

				return
			end)()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(slot0:getPrefab(), true, function (slot0)
		if slot0 ~= slot1:getPrefab() or not slot1.validate then
			PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

			return
		end

		slot1:setModel(slot0)

		if slot1 then
			slot2()
		end

		slot3()
		slot3:OnLoadSpine()

		return
	end)

	slot0.lastPrefab = slot0.getPrefab()
end

function slot0.OnLoadSpine(slot0)
	return
end

function slot0.unloadSpine(slot0)
	if slot0.prefab and slot0.model then
		slot0:SetSpineVisible(true)
		slot0:setAction(ChapterConst.ShipIdleAction)
		slot0:ClearAttachments()
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)

		slot0.model = nil
		slot0._attachmentInfo = nil
		slot0._extraEffect = nil
	end

	for slot4, slot5 in pairs(slot0._loadingRequest) do
		slot5:Stop()
	end

	table.clear(slot0._loadingRequest)

	return
end

function slot0.ClearAttachments(slot0)
	for slot4, slot5 in pairs(slot0._attachmentList) do
		Destroy(slot5)
	end

	table.clear(slot0._attachmentList)

	return
end

function slot0.SetSpineVisible(slot0, slot1)
	if not slot0.model then
		return
	end

	slot2:GetComponent("SkeletonGraphic").color = Color.New(1, 1, 1, (slot1 and 1) or 0)

	return
end

function slot0.clear(slot0)
	slot0:unloadSpine()

	slot0.prefab = nil
	slot0.anim = nil
	slot0.validate = nil

	return
end

return slot0
