slot0 = class("SpineCellView")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot0.go.transform
	slot0.tfShip = slot0.tf:Find("ship")
	slot0._attachmentList = {}
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

function slot0.loadSpine(slot0, slot1)
	slot0:unloadSpine()
	PoolMgr.GetInstance():GetSpineChar(slot0:getPrefab(), true, function (slot0)
		if slot0 ~= slot1:getPrefab() then
			PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

			return
		end

		slot1:setModel(slot0)

		if slot1 then
			slot2()
		end

		if slot1._attachmentInfo then
			for slot4, slot5 in pairs(slot1._attachmentInfo) do
				if slot5.attachment_combat_ui[1] ~= "" then
					ResourceMgr.Inst:getAssetAsync("Effect/" .. slot6, slot6, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
						if slot0 == slot1:getPrefab() then
							slot1 = Object.Instantiate(slot0)
							slot1._attachmentList[#slot1._attachmentList + 1] = slot1

							tf(slot1):SetParent(tf(tf(slot1).SetParent))

							tf(slot1).localPosition = BuildVector3(slot3.attachment_combat_ui[2])
						end
					end), true, true)
				end
			end
		end
	end)
end

function slot0.unloadSpine(slot0)
	if slot0.prefab and slot0.model then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)

		slot0.model = nil
	end
end

function slot0.clear(slot0)
	slot0:unloadSpine()

	slot0.prefab = nil
	slot0.anim = nil

	for slot4, slot5 in ipairs(slot0._attachmentList) do
		Object.Destroy(slot5)
	end

	slot0._attachmentList = nil
end

return slot0
