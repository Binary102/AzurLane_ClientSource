slot0 = class("SummerFeastNavigationAgent", require("view.main.NavalAcademyStudent"))

function slot0.Ctor(slot0, slot1)
	slot0.onTransEdge = nil

	slot0.super.Ctor(slot0, slot1)
end

function slot0.init(slot0)
	return
end

slot0.normalSpeed = 150

function slot0.SetOnTransEdge(slot0, slot1)
	slot0.onTransEdge = slot1
end

function slot0.updateStudent(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		setActive(slot0._go, false)

		return
	end

	setActive(slot0._go, true)

	if slot0.prefabName ~= slot1 then
		if not IsNil(slot0.model) then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)
		end

		slot0.prefab = slot1
		slot0.currentPoint = slot0.pathFinder:getRandomPoint()
		slot0.targetPoint = slot0.pathFinder:getPoint(slot3)
		slot0._tf.anchoredPosition = Vector2.New(slot0.currentPoint.x, slot0.currentPoint.y)

		if slot0.onTransEdge and slot3 then
			slot0:onTransEdge(table.indexof(slot0.pathFinder.points, slot0.currentPoint), slot3)
		end

		PoolMgr.GetInstance():GetSpineChar(slot0.prefab, true, function (slot0)
			if slot0 ~= slot1.prefab then
				PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

				return
			end

			slot1.model = slot0
			slot1.model.transform.localScale = Vector3(0.5, 0.5, 1)
			slot1.model.transform.model.transform.localPosition = Vector3.zero

			slot1.model.transform.model.transform.model.transform:SetParent(slot1._tf, false)
			slot1.model.transform.model.transform.model.transform.SetParent.model.transform:SetSiblingIndex(1)

			slot1.model.transform.model.transform.model.transform.SetParent.model.transform.SetSiblingIndex.anim = slot1.model:GetComponent(typeof(SpineAnimUI))

			slot1.model.transform.model.transform.model.transform.SetParent.model.transform.SetSiblingIndex:updateState(slot2.ShipState.Idle)
		end)
	end

	slot0.prefabName = slot1
end

function slot0.updateLogic(slot0)
	slot0:clearLogic()

	if slot0.state == slot0.ShipState.Walk then
		LeanTween.value(slot0._go, 0, 1, Vector3.Distance(slot1, slot2) / 15):setOnUpdate(System.Action_float(function (slot0)
			slot0._tf.anchoredPosition3D = Vector3.Lerp(slot0._tf, Vector3.Lerp, slot0)
			slot0._tf.localScale.x = (slot0.currentPoint.x < slot0.targetPoint.x and 1) or -1
			slot0._tf.localScale = slot0._tf.localScale
		end)):setOnComplete(System.Action(function ()
			slot0.currentPoint = slot0.targetPoint
			slot0.targetPoint = slot0.pathFinder:getPoint(slot0.currentPoint.nexts[math.random(1, #slot0.currentPoint.nexts)])

			if slot0.onTransEdge then
				slot0:onTransEdge(table.indexof(slot0.pathFinder.points, slot0.currentPoint), slot1)
			end

			slot0:updateState(slot1.ShipState.Idle)
		end))

		return
	end

	if slot0.state == slot0.ShipState.Idle then
		if not slot0.currentPoint.isBan then
			slot0.idleTimer = Timer.New(function ()
				slot0:updateState(slot1.ShipState.Walk)

				return
			end, math.random(10, 20), 1)

			slot0.idleTimer:Start()
		else
			slot0.idleTimer = Timer.New(function ()
				slot0:updateState(slot1.ShipState.Walk)

				return
			end, 0.001, 1)

			slot0.idleTimer:Start()
		end
	else
		if slot0.state == slot0.ShipState.Touch then
			slot0:onClickShip()
		end
	end
end

return slot0
