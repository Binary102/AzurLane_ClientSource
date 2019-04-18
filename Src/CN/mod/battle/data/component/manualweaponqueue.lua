ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleUnitEvent
ys.Battle.ManualWeaponQueue = class("ManualWeaponQueue")
ys.Battle.ManualWeaponQueue.__name = "ManualWeaponQueue"

function ys.Battle.ManualWeaponQueue.Ctor(slot0, slot1)
	slot0:init()

	slot0._maxCount = slot1 or 1
end

function ys.Battle.ManualWeaponQueue.init(slot0)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._weaponList = {}
	slot0._overheatQueue = {}
	slot0._cooldownList = {}
end

function ys.Battle.ManualWeaponQueue.AppendWeapon(slot0, slot1)
	slot0._weaponList[slot1] = true

	slot0:addWeaponEvent(slot1)

	if slot1:GetCurrentState() == slot1.STATE_OVER_HEAT then
		slot0._overheatQueue[#slot0._overheatQueue + 1] = slot1
	end
end

function ys.Battle.ManualWeaponQueue.Containers(slot0, slot1)
	return slot0._weaponList[slot1]
end

function ys.Battle.ManualWeaponQueue.GetQueueHead(slot0)
	return slot0._overheatQueue[1]
end

function ys.Battle.ManualWeaponQueue.CheckWeaponInitalCD(slot0)
	for slot4, slot5 in pairs(slot0._weaponList) do
		if not slot4:GetModifyInitialCD() then
			slot0._overheatQueue[#slot0._overheatQueue + 1] = slot4
		end
	end

	slot1 = #slot0._cooldownList

	while slot1 < slot0._maxCount and #slot0._overheatQueue > 0 do
		slot2 = table.remove(slot0._overheatQueue, 1)

		slot2:InitialCD()

		slot0._cooldownList[#slot0._cooldownList + 1] = slot2
		slot1 = #slot0._cooldownList
	end

	for slot5, slot6 in ipairs(slot0._overheatQueue) do
		slot6:OverHeat()
	end
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
	slot0._overheatQueue = nil

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
	slot1.Dispatcher.OverHeat(slot2)

	slot0._overheatQueue[#slot0._overheatQueue + 1] = slot1.Dispatcher

	slot0:fillCooldownList()
end

function ys.Battle.ManualWeaponQueue.onManualWeaponReady(slot0, slot1)
	slot0:removeFromCDList(slot1.Dispatcher)
	slot0:fillCooldownList()
end

function ys.Battle.ManualWeaponQueue.removeFromCDList(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._cooldownList) do
		if slot1 == slot6 then
			table.remove(slot0._cooldownList, slot5)

			break
		end
	end
end

function ys.Battle.ManualWeaponQueue.fillCooldownList(slot0)
	slot1 = #slot0._cooldownList

	while slot1 < slot0._maxCount and #slot0._overheatQueue > 0 do
		slot2 = table.remove(slot0._overheatQueue, 1)

		slot2:EnterCoolDown()

		slot0._cooldownList[#slot0._cooldownList + 1] = slot2
		slot1 = #slot0._cooldownList
	end
end

return
