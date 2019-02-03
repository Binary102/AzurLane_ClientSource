ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleUnitEvent
ys.Battle.ManualWeaponQueue = class("ManualWeaponQueue")
ys.Battle.ManualWeaponQueue.__name = "ManualWeaponQueue"

function ys.Battle.ManualWeaponQueue.Ctor(slot0)
	slot0:init()
end

function ys.Battle.ManualWeaponQueue.init(slot0)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._weaponList = {}
	slot0._coolDownQueue = {}
end

function ys.Battle.ManualWeaponQueue.AppendWeapon(slot0, slot1)
	slot0._weaponList[slot1] = true

	slot0:addWeaponEvent(slot1)

	if slot1:GetCurrentState() == slot1.STATE_OVER_HEAT then
		slot0._coolDownQueue[#slot0._coolDownQueue + 1] = slot1
	end
end

function ys.Battle.ManualWeaponQueue.Containers(slot0, slot1)
	return slot0._weaponList[slot1]
end

function ys.Battle.ManualWeaponQueue.GetQueueHead(slot0)
	return slot0._coolDownQueue[1]
end

function ys.Battle.ManualWeaponQueue.CheckWeaponInitalCD(slot0)
	for slot4, slot5 in pairs(slot0._weaponList) do
		if not slot4:GetModifyInitialCD() then
			slot0._coolDownQueue[#slot0._coolDownQueue + 1] = slot4
		end
	end

	if #slot0._coolDownQueue == 0 then
		return
	end

	while slot1 > 1 do
		slot0._coolDownQueue[slot1]:OverHeat()

		slot1 = slot1 - 1
	end

	slot0._coolDownQueue[slot1]:InitialCD()
end

function ys.Battle.ManualWeaponQueue.FlushWeaponReloadRequire(slot0)
	for slot4, slot5 in pairs(slot0._weaponList) do
		slot4:FlushReloadRequire()
	end
end

function ys.Battle.ManualWeaponQueue.Clear(slot0)
	for slot4, slot5 in pairs(slot0._weaponList) do
		slot0:removeWeaponEvent(slot4)
	end

	slot0._weaponList = nil
	slot0._coolDownQueue = nil

	slot0.EventListener.DetachEventListener(slot0)
end

function ys.Battle.ManualWeaponQueue.addWeaponEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.MANUAL_WEAPON_FIRE, slot0.onManualWeaponFire)
	slot1:RegisterEventListener(slot0, slot0.MANUAL_WEAPON_READY, slot0.onManualWeaponReady)
end

function ys.Battle.ManualWeaponQueue.removeWeaponEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.MANUAL_WEAPON_READY)
	slot1:UnregisterEventListener(slot0, slot0.MANUAL_WEAPON_FIRE)
end

function ys.Battle.ManualWeaponQueue.onManualWeaponFire(slot0, slot1)
	slot1.Dispatcher:OverHeat()

	if #slot0._coolDownQueue == 0 then
		slot2:EnterCoolDown()
	end

	slot0._coolDownQueue[#slot0._coolDownQueue + 1] = slot2
end

function ys.Battle.ManualWeaponQueue.onManualWeaponReady(slot0, slot1)
	slot0:removeFromCDQueue(slot1.Dispatcher)
end

function ys.Battle.ManualWeaponQueue.removeFromCDQueue(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in ipairs(slot0._coolDownQueue) do
		if slot1 == slot7 then
			slot2 = slot6

			break
		end
	end

	if slot2 ~= -1 then
		table.remove(slot0._coolDownQueue, 1)
	end

	slot3 = slot0._coolDownQueue[1]

	if slot2 == 1 and slot3 then
		slot3:EnterCoolDown()
	end
end

return
