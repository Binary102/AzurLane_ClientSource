ys = ys or {}
ys.Battle.ChargeState = class("ChargeState", ys.Battle.IPilotState)
ys.Battle.ChargeState.__name = "ChargeState"

function ys.Battle.ChargeState.Ctor(slot0, slot1)
	slot0._stateName = slot0.Battle.IPilotState.STATE_APPROACH

	slot0.Battle.ChargeState.super.Ctor(slot0, slot1)
end

function ys.Battle.ChargeState.CalculateDirection(slot0, slot1)
	if slot0._lastDir then
		return slot0._lastDir
	end

	slot2 = nil
	slot2 = (slot0._referenceTarget == nil or slot0._referenceTarget:GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1
	((slot0._referenceTarget == nil or slot0._referenceTarget.GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1) - slot1.y = 0
	slot0._lastDir = ((slot0._referenceTarget == nil or slot0._referenceTarget.GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1) - slot1.normalized

	return ((slot0._referenceTarget == nil or slot0._referenceTarget.GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1) - slot1.normalized

	slot2 = slot0._referenceTarget.GetPosition()

	if slot0._referenceTarget.GetPosition() then
		if slot0._referencePoint ~= nil then
			slot2 = slot0._referencePoint
		else
			slot2 = slot1
		end
	end
end

return
