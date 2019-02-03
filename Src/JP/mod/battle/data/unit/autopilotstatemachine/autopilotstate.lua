ys = ys or {}
slot1 = class("AutoPilotState")
ys.Battle.AutoPilotState = slot1
slot1.__name = "AutoPilotState"
slot1.StateRoute = {
	[ys.Battle.IPilotState.STATE_ASLEEP] = "OnAsleepState",
	[ys.Battle.IPilotState.STATE_APPROACH] = "OnApproachState",
	[ys.Battle.IPilotState.STATE_AWAY] = "OnAwayState",
	[ys.Battle.IPilotState.STATE_AROUND] = "OnAroundState",
	[ys.Battle.IPilotState.STATE_CHARGE] = "OnChargeState"
}

function slot1.Ctor(slot0, slot1, slot2)
	slot0._aiCfg = slot2
	slot0._target = slot1

	slot1._move:CancelFormationCtrl()
	slot1._move:SetAutoMoveAI(slot0, slot1)

	slot0._transitionTable = slot0.ParseTransitionTable(slot2.ai)
	slot0._asleepState = slot0.Battle.AsleepState.New(slot0)
	slot0._approachState = slot0.Battle.ApproachState.New(slot0)
	slot0._awayState = slot0.Battle.AwayState.New(slot0)
	slot0._aroundState = slot0.Battle.AroundState.New(slot0)
	slot0._chargeState = slot0.Battle.ChargeState.New(slot0)

	slot0:SwitchToDefault()
end

function slot1.SwitchToDefault(slot0)
	return slot0:SwitchState(slot0._aiCfg.default, slot0._aiCfg.defaultParam)
end

function slot1.SwitchState(slot0, slot1, slot2, slot3)
	slot0[slot0.StateRoute[slot0.StateIndexers(slot1)]](slot0, slot2 or {}, slot3)
end

function slot1.GetDirection(slot0, slot1)
	return slot0._currentState:CalculateDirection(slot0._target:GetPosition(), slot1)
end

function slot1.InputUnitSenser(slot0)
	slot0._currentState:InputUnitSenser()
end

function slot1.InputWeaponStateChange(slot0, slot1)
	slot0._currentState:InputWeaponState(slot1)
end

function slot1.OnAsleepState(slot0)
	slot0:SetState(slot0._asleepState)
end

function slot1.OnApproachState(slot0, slot1, slot2)
	slot0:TryTransition(slot0._approachState, slot1, slot2)
end

function slot1.OnAwayState(slot0, slot1, slot2)
	slot0:TryTransition(slot0._awayState, slot1, slot2)
end

function slot1.OnAroundState(slot0, slot1, slot2)
	slot0:TryTransition(slot0._aroundState, slot1, slot2)
end

function slot1.OnChargeState(slot0, slot1, slot2)
	slot0:TryTransition(slot0._chargeState, slot1, slot2)
end

function slot1.TryTransition(slot0, slot1, slot2, slot3)
	if slot1:SetTransitionParam(slot2, slot3) == true then
		slot0:SetState(slot1)
	end
end

function slot1.SetState(slot0, slot1)
	slot0._currentState = slot1
end

function slot1.GetUnit(slot0)
	return slot0._target
end

function slot1.GetUnitSenserList(slot0)
	return slot0._target:GetSenserList()
end

function slot1.GetTransitionTable(slot0)
	return slot0._transitionTable
end

function slot1.ParseTransitionTable(slot0)
	slot1 = {
		[slot0.Battle.IPilotState.STATE_ASLEEP] = {},
		[slot0.Battle.IPilotState.STATE_APPROACH] = {},
		[slot0.Battle.IPilotState.STATE_AWAY] = {},
		[slot0.Battle.IPilotState.STATE_AROUND] = {},
		[slot0.Battle.IPilotState.STATE_CHARGE] = {}
	}

	for slot5, slot6 in ipairs(slot0) do
		slot1[slot1.StateIndexers(slot6.state)][#slot1[slot1.StateIndexers(slot6.state)] + 1] = slot6
	end

	return slot1
end

slot2 = {
	ys.Battle.IPilotState.STATE_APPROACH,
	ys.Battle.IPilotState.STATE_AWAY,
	ys.Battle.IPilotState.STATE_AROUND,
	ys.Battle.IPilotState.STATE_CHARGE
}

function slot1.StateIndexers(slot0)
	return slot0[slot0] or slot1.Battle.IPilotState.STATE_ASLEEP
end

return
