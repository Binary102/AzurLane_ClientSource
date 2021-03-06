ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleVariable
slot5 = ys.Battle.BattleDataFunction
slot6 = class("BattleAircraftUnit")
ys.Battle.BattleAircraftUnit = slot6
slot6.__name = "BattleAircraftUnit"
slot6.STATE_CREATE = "Create"
slot6.STATE_ATTACK = "Attack"
slot6.STATE_DESTORY = "Destory"
slot6.HEIGHT = ys.Battle.BattleConfig.AircraftHeight + 5

function slot6.Ctor(slot0, slot1)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._uniqueID = slot1
	slot0._speedExemptKey = "air_" .. slot1
	slot0._dir = slot0.Battle.BattleConst.UnitDir.RIGHT
	slot0._type = slot1.UnitType.AIRCRAFT_UNIT
	slot0._currentState = slot0.STATE_CREATE
	slot0._distanceBackup = {}
	slot0._battleProxy = slot0.Battle.BattleDataProxy.GetInstance()
	slot0._frame = 0
	slot0._weaponPotential = 1

	slot0:Init()
end

function slot6.SetBound(slot0, slot1, slot2)
	slot0._top = slot1
	slot0._bottom = slot2
	slot0._speedZ = (math.random() - 0.5) * 0.5

	slot0:SetTargetZ()
end

function slot6.Update(slot0, slot1)
	slot0._pos:Add(slot0._speed)
	slot0:UpdateSpeed()
	slot0:UpdateWeapon()
end

function slot6.ActiveCldBox(slot0)
	slot0._cldComponent:SetActive(true)
end

function slot6.DeactiveCldBox(slot0)
	slot0._cldComponent:SetActive(false)
end

function slot6.Init(slot0)
	slot0._aliveState = true
	slot0._speed = Vector3.zero
	slot0._undefeated = false
end

function slot6.Clear(slot0)
	if slot0._createTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._createTimer)

		slot0._createTimer = nil
	end

	slot0:ShutdownWeapon()

	slot0._distanceBackup = {}
end

function slot6.SetWeaponPreCastBound(slot0)
	return
end

function slot6.EnterGCD(slot0)
	return
end

function slot6.CreateWeapon(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0._tmpData.weapon_ID) do
		slot1[slot5] = slot0.Battle.BattleDataFunction.CreateAirFighterWeaponUnit(slot6, slot0, slot5, slot0._weaponPotential)
	end

	return slot1
end

function slot6.ShutdownWeapon(slot0)
	for slot4, slot5 in ipairs(slot0:GetWeapon()) do
		slot5:Clear()
	end
end

function slot6.UpdateWeapon(slot0)
	if slot0._currentState == slot0.STATE_ATTACK then
		for slot4, slot5 in ipairs(slot0:GetWeapon()) do
			slot5:Update()
		end
	end
end

function slot6.GetWeapon(slot0)
	return slot0._weapon
end

function slot6.GetCurrentHP(slot0)
	return slot0._currentHP
end

function slot6.GetMaxHP(slot0)
	return slot0.Battle.BattleAttr.GetCurrent(slot0, "maxHP")
end

function slot6.IsUndefeated(slot0)
	return slot0._undefeated
end

function slot6.IsAlive(slot0)
	return slot0._aliveState
end

function slot6.GetOxyState(slot0)
	return nil
end

function slot6.HandleDamageToDeath(slot0)
	slot0:UpdateHP(-slot0._currentHP, {
		isMiss = false,
		isCri = false,
		isHeal = false
	})
end

function slot6.UpdateHP(slot0, slot1, slot2)
	slot3 = slot2.isMiss
	slot4 = slot2.isCri
	slot5 = slot2.isHeal
	slot0._currentHP = slot0._currentHP + slot1

	if slot0:GetMaxHP() < slot0._currentHP then
		slot0._currentHP = slot6
	end

	if slot0._currentHP < 0 then
		slot0._currentHP = 0
	end

	slot0:DispatchEvent(slot0.Event.New(slot1.UPDATE_AIR_CRAFT_HP, {
		dHP = slot1,
		isMiss = slot3,
		isCri = slot4,
		isHeal = slot5
	}))

	if slot0._currentHP <= 0 and slot0:IsAlive() then
		slot0:onDead()
	end
end

function slot6.onDead(slot0)
	slot0._currentState = slot0.STATE_DESTORY
	slot0._aliveState = false
end

function slot6.UpdateSpeed(slot0)
	slot0._speed:Copy(slot1)
	slot0._speed:Mul(slot2)

	if slot0:GetPosition().y < slot0.HEIGHT then
		slot0._speed.y = math.max(0.4, 1 - slot3.y / slot1.AircraftHeight)
	end

	slot0._speed.z = slot2 * slot0._speedZ

	if slot2 < slot0._targetZ - slot3.z then
		slot0._speed.z = slot2 * 0.5
	elseif slot4 < -slot2 then
		slot0._speed.z = -slot2 * 0.5
	else
		slot0:SetTargetZ()
	end
end

function slot6.OutBound(slot0)
	slot0._undefeated = true

	slot0:onDead()
end

function slot6.GetSize(slot0)
	if slot0._currentState == slot0.STATE_CREATE then
		return Mathf.Clamp(slot0:GetPosition().y / slot0.HEIGHT, 0.1, slot0._scale)
	else
		return slot0._scale
	end
end

function slot6.SetTemplate(slot0, slot1)
	slot0._tmpData = slot1

	slot0:InitCldComponent()
	slot0.Battle.BattleAttr.SetAircraftAttFromTemp(slot0)

	slot0._currentHP = slot0:GetMaxHP()
	slot0._weapon = slot0:CreateWeapon()
	slot0._modelID = slot1.model_ID
	slot0._velocity = slot0.Battle.BattleFormulas.ConvertAircraftSpeed(slot1.speed + slot0:GetAttrByName("aircraftBooster"))
	slot0._scale = slot1.scale or 1
end

function slot6.SetWeanponPotential(slot0, slot1)
	slot0._weaponPotential = slot1
end

function slot6.SetTargetZ(slot0)
	slot0._targetZ = (slot0._bottom + slot0._top) * 0.5 + (slot0._top - slot0._bottom) * (math.random() - 0.5) * 0.6
end

function slot6.SetMotherUnit(slot0, slot1)
	slot0._motherUnit = slot1

	slot0:SetIFF(slot0._motherUnit:GetIFF())
	slot0:SetAttr(slot1)
	slot0:SetPosition(slot0._motherUnit:GetPosition())

	if slot1:GetIFF() == slot0.FRIENDLY_CODE then
		slot0._dir = slot1.UnitDir.RIGHT
		slot0._isPlayerAircraft = true
	else
		slot0._dir = slot1.UnitDir.LEFT
	end
end

function slot6.SetIFF(slot0, slot1)
	slot0._IFF = slot1
end

function slot6.SetPosition(slot0, slot1)
	slot0._pos = Clone(slot1)
end

function slot6.GetDistance(slot0, slot1)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot2
	end

	if slot0._distanceBackup[slot1] == nil then
		slot0._distanceBackup[slot1] = Vector3.Distance(pg.Tool.FilterY(slot0:GetPosition()), pg.Tool.FilterY(slot1:GetPosition()))

		slot1:backupDistance(slot0, Vector3.Distance(pg.Tool.FilterY(slot0.GetPosition()), pg.Tool.FilterY(slot1.GetPosition())))
	end

	return slot3
end

function slot6.backupDistance(slot0, slot1, slot2)
	if slot0._frame ~= slot0._battleProxy.FrameIndex then
		slot0._distanceBackup = {}
		slot0._frame = slot3
	end

	slot0._distanceBackup[slot1] = slot2
end

function slot6.GetSkinID(slot0)
	return slot0._modelID
end

function slot6.SetSkinID(slot0, slot1)
	slot0._skinID = slot1
	slot0._modelID = slot0.GetEquipSkin(slot0._skinID)

	for slot5, slot6 in ipairs(slot0._weapon) do
		slot6:SetDerivateSkin(slot1)
	end
end

function slot6.SetSkinData(slot0, slot1)
	return
end

function slot6.SetAttr(slot0, slot1)
	slot0.Battle.BattleAttr.SetAircraftAttFromMother(slot0, slot1)
end

function slot6.GetAttr(slot0)
	return slot0.Battle.BattleAttr.GetAttr(slot0)
end

function slot6.GetAttrByName(slot0, slot1)
	return slot0.Battle.BattleAttr.GetCurrent(slot0, slot1)
end

function slot6.GetMotherUnit(slot0)
	return slot0._motherUnit
end

function slot6.GetUniqueID(slot0)
	return slot0._uniqueID
end

function slot6.GetIFF(slot0)
	return slot0._IFF
end

function slot6.GetCurrentState(slot0)
	return slot0._currentState
end

function slot6.GetSpeed(slot0)
	return slot0._speed
end

function slot6.GetPosition(slot0)
	return slot0._pos
end

function slot6.GetCLDCenterPosition(slot0)
	return Vector3(slot0._pos.x + slot0:GetBoxSize().x, slot0._pos.y, slot0._pos.z + slot0.GetBoxSize().z)
end

function slot6.GetCLDZCenterPosition(slot0)
	return Vector3(slot0._pos.x, slot0._pos.y, slot0._pos.z + slot0:GetBoxSize().z)
end

function slot6.GetDirection(slot0)
	return slot0._dir
end

function slot6.GetTemplate(slot0)
	return slot0._tmpData
end

function slot6.GetTemplateID(slot0)
	return slot0._tmpData.id
end

function slot6.GetUnitType(slot0)
	return slot0._type
end

function slot6.GetHPRate(slot0)
	return slot0._currentHP / slot0:GetMaxHP()
end

function slot6.GetBoxSize(slot0)
	return slot0._cldComponent:GetCldBoxSize()
end

function slot6.GetSpeedRatio(slot0)
	return slot0.GetSpeedRatio(slot0:GetSpeedExemptKey(), slot0._IFF)
end

function slot6.GetSpeedExemptKey(slot0)
	return slot0._speedExemptKey
end

function slot6.IsPlayerAircraft(slot0)
	return slot0._isPlayerAircraft
end

function slot6.IsShowHPBar(slot0)
	return false
end

function slot6.SetUnVisitable(slot0)
	slot0.Battle.BattleAttr.UnVisitable(slot0)
end

function slot6.SetVisitable(slot0)
	slot0.Battle.BattleAttr.Visitable(slot0)
end

function slot6.IsVisitable(slot0)
	return slot0.Battle.BattleAttr.IsVisitable(slot0)
end

function slot6.TriggerBuff(slot0, slot1, slot2)
	return
end

function slot6.AddCreateTimer(slot0, slot1, slot2)
	slot0._currentState = slot0.STATE_CREATE
	slot0._speedDir = slot1
	slot0._createTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AddCreateTimer", 0, slot2 or 1.5, function ()
		slot0._currentState = slot0.STATE_ATTACK
		slot0._speedDir = Vector3(slot0._dir, 0, 0)

		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._createTimer)

		pg.TimeMgr.GetInstance().RemoveBattleTimer._createTimer = nil
	end)
end

function slot6.Dispose(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

function slot6.InitCldComponent(slot0)
	slot1 = slot0:GetTemplate().cld_box
	slot3 = slot0:GetTemplate().cld_offset[1]

	if slot0:GetDirection() == slot0.Battle.BattleConst.UnitDir.LEFT then
		slot3 = slot3 * -1
	end

	slot0._cldComponent = slot0.Battle.BattleCubeCldComponent.New(slot1[1], slot1[2], slot1[3], slot3, slot2[3])

	slot0._cldComponent:SetCldData({
		type = slot1.CldType.AIRCRAFT,
		IFF = slot0:GetIFF(),
		UID = slot0:GetUniqueID()
	})
end

function slot6.GetCldBox(slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition())
end

function slot6.GetCldData(slot0)
	return slot0._cldComponent:GetCldData()
end

function slot6.AddBuff(slot0)
	return
end

function slot6.SetBuffStack(slot0)
	return
end

function slot6.RemoveBuff(slot0)
	return
end

function slot6.TriggerBuff(slot0)
	return
end

function slot6.GetLabelTag(slot0)
	return {}
end

function slot6.GetCurrentOxyState(slot0)
	return nil
end

return
