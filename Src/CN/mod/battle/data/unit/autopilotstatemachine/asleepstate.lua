ys = ys or {}
ys.Battle.AsleepState = class("AsleepState", ys.Battle.IPilotState)
ys.Battle.AsleepState.__name = "AsleepState"

function ys.Battle.AsleepState.Ctor(slot0, slot1)
	slot0._stateName = slot0.Battle.IPilotState.STATE_ASLEEP

	slot0.Battle.AsleepState.super.Ctor(slot0, slot1)
end

function ys.Battle.AsleepState.CalculateDirection(slot0, slot1, slot2)
	return Vector3.zero
end

return
