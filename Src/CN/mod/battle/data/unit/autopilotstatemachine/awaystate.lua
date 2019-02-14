ys = ys or {}
ys.Battle.AwayState = class("AwayState", ys.Battle.IPilotState)
ys.Battle.AwayState.__name = "AwayState"

function ys.Battle.AwayState.Ctor(slot0, slot1)
	slot0._stateName = slot0.Battle.IPilotState.STATE_AWAY

	slot0.Battle.AwayState.super.Ctor(slot0, slot1)
end

function ys.Battle.AwayState.CalculateDirection(slot0, slot1)
	slot2 = nil
	slot2 = (slot0._referenceTarget == nil or slot0._referenceTarget:GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1

	slot0:FixAxis(slot1 - ((slot0._referenceTarget == nil or slot0._referenceTarget.GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1))

	return slot1 - ((slot0._referenceTarget == nil or slot0._referenceTarget.GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1).normalized

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
