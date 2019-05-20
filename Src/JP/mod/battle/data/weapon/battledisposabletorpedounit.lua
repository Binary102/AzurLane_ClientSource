ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = class("BattleDisposableTorpedoUnit", ys.Battle.BattleManualTorpedoUnit)
ys.Battle.BattleDisposableTorpedoUnit = slot2
slot2.__name = "BattleDisposableTorpedoUnit"

function slot2.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot2.EnterCoolDown(slot0)
	return
end

function slot2.OverHeat(slot0)
	slot0.super.OverHeat(slot0)
	slot0._playerTorpedoVO:RemoveWeapon(slot0)
	slot0._playerTorpedoVO:DispatchOverLoadChange()
end

return
