ys = ys or {}
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst.WeaponSuppressType
slot4 = ys.Battle.BattleConst.WeaponSearchType
slot5 = ys.Battle.BattleDataFunction
slot6 = class("BattleWeaponUnit")
ys.Battle.BattleWeaponUnit = slot6
slot6.__name = "BattleWeaponUnit"
slot6.INTERNAL = "internal"
slot6.EXTERNAL = "external"
slot6.EMITTER_NORMAL = "BattleBulletEmitter"
slot6.EMITTER_SHOTGUN = "BattleShotgunEmitter"
slot6.STATE_DISABLE = "DISABLE"
slot6.STATE_READY = "READY"
slot6.STATE_PRECAST = "PRECAST"
slot6.STATE_PRECAST_FINISH = "STATE_PRECAST_FINISH"
slot6.STATE_ATTACK = "ATTACK"
slot6.STATE_OVER_HEAT = "OVER_HEAT"

function slot6.Ctor(slot0)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._currentState = slot0.STATE_READY
	slot0._equipmentIndex = -1
	slot0._dataProxy = slot0.Battle.BattleDataProxy:GetInstance()
	slot0._tempEmittersList = {}
	slot0._reloadFacotrList = {}
	slot0._diveEnabled = true
	slot0._comboIDList = {}
	slot0._jammingTime = 0
end

function slot6.HostOnEnemy(slot0)
	slot0._hostOnEnemy = true
end

function slot6.SetPotentialFactor(slot0, slot1)
	slot0._potential = slot1

	if slot0._correctedDMG then
		slot0._correctedDMG = slot0:WeaponDamagePreCorrection()
	end
end

function slot6.SetEquipmentInfo(slot0, slot1)
	slot0._nationality = slot1
end

function slot6.GetNationality(slot0)
	return slot0._nationality or 0
end

function slot6.SetTemplateData(slot0, slot1)
	slot0._potential = slot0._potential or 1
	slot0._tmpData = slot1
	slot0._maxRangeSqr = slot1.range
	slot0._minRangeSqr = slot1.min_range
	slot0._fireFXFlag = slot1.fire_fx_loop_type
	slot0._oxyList = slot1.oxy_type
	slot0._majorEmitterList = {}
	slot0._bulletList = slot1.bullet_ID

	for slot5, slot6 in ipairs(slot1.barrage_ID) do
		slot0:createMajorEmitter(slot6, slot5)
	end

	slot0._GCD = slot1.recover_time
	slot0._preCastInfo = slot1.precast_param
	slot0._correctedDMG = slot0:WeaponDamagePreCorrection()
	slot0._convertedAtkAttr = slot0:WeaponAtkAttrPreRatio()

	slot0:FlushReloadMax(1)
end

function slot6.createMajorEmitter(slot0, slot1, slot2, slot3, slot4, slot5)
	function slot6(slot0, slot1, slot2, slot3, slot4)
		slot6 = slot0:Spawn(slot5, slot4, slot2.INTERNAL)

		slot6:SetOffsetPriority(slot3)
		slot6:SetShiftInfo(slot0, slot1)

		if slot0._tmpData.aim_type == slot3.WeaponAimType.AIM and slot4 ~= nil then
			slot6:SetRotateInfo(slot4:GetCLDZCenterPosition(), slot0:GetBaseAngle(), slot2)
		else
			slot6:SetRotateInfo(nil, slot0:GetBaseAngle(), slot2)
		end

		slot0:DispatchBulletEvent(slot6)

		return slot6
	end

	function slot7()
		for slot3, slot4 in ipairs(slot0._majorEmitterList) do
			if slot4:GetState() ~= slot4.STATE_STOP then
				return
			end
		end

		slot0:EnterCoolDown()

		return
	end

	if not slot3 then
		slot3 = slot0.EMITTER_NORMAL
	end

	slot8 = slot2.Battle[slot3].New

	if not slot4 then
		slot9 = slot6
	end

	slot10 = slot5 or slot7
	slot0._majorEmitterList[#slot0._majorEmitterList + 1] = slot8(slot9, slot5 or slot7, slot1)

	return slot8(slot9, slot5 or slot7, slot1)

	slot10 = slot7
end

function slot6.cacheSectorData(slot0)
	slot0._upperEdge = math.deg2Rad * slot0:GetAttackAngle() / 2
	slot0._lowerEdge = -1 * slot0._upperEdge
	slot2 = math.deg2Rad * slot0._tmpData.axis_angle

	if slot0:GetDirection() == slot0.UnitDir.LEFT then
		slot0._normalizeOffset = math.pi - slot2
	else
		if slot0:GetDirection() == slot0.UnitDir.RIGHT then
			slot0._normalizeOffset = slot2
		end
	end

	slot0._wholeCircle = math.pi - slot0._normalizeOffset
	slot0._negativeCircle = -math.pi - slot0._normalizeOffset
	slot0._wholeCircleNormalizeOffset = slot0._normalizeOffset - math.pi * 2
	slot0._negativeCircleNormalizeOffset = slot0._normalizeOffset + math.pi * 2

	return
end

function slot6.cacheSquareData(slot0)
	slot0._frontRange = slot0._tmpData.angle
	slot0._backRange = slot0._tmpData.axis_angle
	slot0._upperRange = slot0._tmpData.min_range
	slot0._lowerRange = slot0._tmpData.range

	return
end

function slot6.SetModelID(slot0, slot1)
	slot0._modelID = slot1

	return
end

function slot6.SetSkinData(slot0, slot1)
	slot0._skinID = slot1

	slot0:SetModelID(slot0.GetEquipSkin(slot0._skinID))

	return
end

function slot6.SetDerivateSkin(slot0, slot1)
	slot0._derivateSkinID = slot1
	slot2, slot0._derivateBullet, slot0._derivateTorpedo, slot0._derivateBoom = slot0.GetEquipSkin(slot0._derivateSkinID)

	return
end

function slot6.GetSkinID(slot0)
	return slot0._skinID
end

function slot6.setBulletSkin(slot0, slot1, slot2)
	if slot0._derivateSkinID then
		if slot0.GetBulletTmpDataFromID(slot2).type == slot1.BulletType.BOMB then
			slot1:SetModleID(slot0._derivateBoom)
		else
			if slot3 == slot1.BulletType.TORPEDO then
				slot1:SetModleID(slot0._derivateTorpedo)
			else
				slot1:SetModleID(slot0._derivateBullet)
			end
		end
	else
		if slot0._modelID then
			slot1:SetModleID(slot0._modelID)
		end
	end

	return
end

function slot6.SetEquipmentIndex(slot0, slot1)
	slot0._equipmentIndex = slot1

	return
end

function slot6.GetEquipmentIndex(slot0)
	return slot0._equipmentIndex
end

function slot6.SetHostData(slot0, slot1)
	slot0._host = slot1
	slot0._hostUnitType = slot0._host:GetUnitType()
	slot0._hostIFF = slot1:GetIFF()

	if slot0._tmpData.search_type == slot0.SECTOR then
		slot0:cacheSectorData()

		slot0.outOfFireRange = slot0.IsOutOfAngle
		slot0.IsOutOfFireArea = slot0.IsOutOfSector
	else
		if slot0._tmpData.search_type == slot0.SQUARE then
			slot0:cacheSquareData()

			slot0.outOfFireRange = slot0.IsOutOfSquare
			slot0.IsOutOfFireArea = slot0.IsOutOfSquare
		end
	end

	if slot0:GetDirection() == slot1.UnitDir.RIGHT then
		slot0._baseAngle = 0
	else
		slot0._baseAngle = 180
	end

	return
end

function slot6.OverrideGCD(slot0, slot1)
	slot0._GCD = slot1

	return
end

function slot6.updateMovementInfo(slot0)
	slot0._hostPos = slot0._host:GetPosition()

	return
end

function slot6.GetWeaponId(slot0)
	return slot0._tmpData.id
end

function slot6.GetTemplateData(slot0)
	return slot0._tmpData
end

function slot6.GetType(slot0)
	return slot0._tmpData.type
end

function slot6.GetPotential(slot0)
	if not slot0._potential then
		slot1 = 1
	end

	return slot1
end

function slot6.IsAttacking(slot0)
	if slot0._currentState ~= slot0.STATE_ATTACK and slot0._currentState ~= slot0.STATE_PRECAST then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

function slot6.Update(slot0)
	slot0:UpdateReload()

	if not slot0._diveEnabled then
		return
	end

	if slot0._currentState == slot0.STATE_READY then
		slot0:updateMovementInfo()

		if slot0._tmpData.suppress == slot0.SUPPRESSION or slot0:CheckPreCast() then
			if slot0._preCastInfo.time == nil or not slot0._hostOnEnemy then
				slot0._currentState = slot0.STATE_PRECAST_FINISH
			else
				slot0:PreCast()
			end
		end
	end

	if slot0._currentState == slot0.STATE_PRECAST_FINISH then
		slot0:updateMovementInfo()
		slot0:Fire(slot0:Tracking())
	end

	return
end

function slot6.UpdateReload(slot0)
	if slot0._CDstartTime and not slot0._jammingStartTime then
		if slot0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			slot0:handleCoolDown()
		else
			return
		end
	end

	return
end

function slot6.CheckPreCast(slot0)
	for slot4, slot5 in pairs(slot0:GetFilteredList()) do
		return true
	end

	return false
end

function slot6.ChangeDiveState(slot0)
	if slot0._host:GetOxyState() then
		slot1 = slot0._host:GetOxyState():GetWeaponType()

		for slot5, slot6 in ipairs(slot0._oxyList) do
			if table.contains(slot1, slot6) then
				slot0._diveEnabled = true

				return
			end
		end

		slot0._diveEnabled = false
	end

	return
end

function slot6.getTrackingHost(slot0)
	return slot0._host
end

function slot6.Tracking(slot0)
	if slot0.Battle.BattleAttr.GetCurrent(slot0._host, "TargetChoise") == "farthest" then
		return slot0:TrackingFarthest(slot0:GetFilteredList())
	else
		if slot1 == "leastHP" then
			return slot0:TrackingLeastHP(slot0:GetFilteredList())
		else
			if type(slot1) == "number" and slot1 > 0 then
				return slot0:TrackingModelID(slot0:GetFilteredList(), slot1)
			else
				if slot1 == 0 then
					return slot0:TrackingNearest(slot0:GetFilteredList())
				else
					return slot0:TrackingTag(slot0:GetFilteredList(), slot1)
				end
			end
		end
	end

	return
end

function slot6.GetFilteredList(slot0)
	slot1 = slot0:FilterTarget()

	if slot0._tmpData.search_type == slot0.SECTOR then
		slot1 = slot0:FilterAngle(slot0:FilterRange(slot1))
	else
		if slot0._tmpData.search_type == slot0.SQUARE then
			slot1 = slot0:FilterSquare(slot1)
		end
	end

	return slot1
end

function slot6.TrackingNearest(slot0, slot1)
	slot2 = slot0._maxRangeSqr
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot0:getTrackingHost():GetDistance(slot8) <= slot2 then
			slot2 = slot9
			slot3 = slot8
		end
	end

	return slot3
end

function slot6.TrackingFarthest(slot0, slot1)
	slot2 = 0
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot2 < slot0:getTrackingHost():GetDistance(slot8) then
			slot2 = slot9
			slot3 = slot8
		end
	end

	return slot3
end

function slot6.TrackingLeastHP(slot0, slot1)
	slot2 = math.huge
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot8:GetCurrentHP() < slot2 then
			slot3 = slot8
			slot2 = slot9
		end
	end

	return slot3
end

function slot6.TrackingModelID(slot0, slot1, slot2)
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot8:GetTemplateID() == slot2 then
			slot3 = slot8
		end
	end

	return slot3
end

function slot6.TrackingRandom(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, slot7)
	end

	slot3 = #slot2

	if #slot2 == 0 then
		return nil
	else
		return slot2[math.random(#slot2)]
	end

	return
end

function slot6.TrackingTag(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1) do
		if slot8:ContainsLabelTag({
			slot2
		}) then
			table.insert(slot3, slot8)
		end
	end

	if #slot3 == 0 then
		return slot0:TrackingNearest(slot1)
	else
		return slot3[math.random(#slot3)]
	end

	return
end

function slot6.FilterTarget(slot0)
	slot1 = nil

	if slot0._hostIFF == slot0._dataProxy:GetFriendlyCode() then
		slot1 = slot0._dataProxy:GetFoeShipList()
	else
		slot1 = slot0._dataProxy:GetFriendlyShipList()
	end

	slot2 = {}
	slot3 = 1
	slot4 = slot0._tmpData.search_condition

	for slot8, slot9 in pairs(slot1) do
		if not table.contains(slot4, slot9:GetCurrentOxyState()) then
		else
			slot11 = true

			if slot10 == slot0.OXY_STATE.FLOAT then
			else
				if slot10 == slot0.OXY_STATE.DIVE and not slot9:IsRunMode() and not slot9:GetDiveDetected() and slot9:GetDiveInvisible() then
					slot11 = false
				end
			end

			if slot11 then
				slot2[slot3] = slot9
				slot3 = slot3 + 1
			end
		end
	end

	return slot2
end

function slot6.FilterAngle(slot0, slot1)
	if slot0:GetAttackAngle() >= 360 then
		return slot1
	end

	for slot5 = #slot1, 1, -1 do
		if slot0:IsOutOfAngle(slot1[slot5]) then
			table.remove(slot1, slot5)
		end
	end

	return slot1
end

function slot6.FilterRange(slot0, slot1)
	for slot5 = #slot1, 1, -1 do
		if slot0:IsOutOfRange(slot1[slot5]) then
			table.remove(slot1, slot5)
		end
	end

	return slot1
end

function slot6.FilterSquare(slot0, slot1)
	slot2 = slot0.Battle.BattleTargetChoise.TargetWeightiest(slot0._host, nil, slot1)

	for slot6 = #slot1, 1, -1 do
		if slot0:IsOutOfSquare(slot1[slot6]) then
			table.remove(slot1, slot6)
		end
	end

	for slot6 = #slot1, 1, -1 do
		if not table.contains(slot2, slot1[slot6]) then
			table.remove(slot1, slot6)
		end
	end

	return slot1
end

function slot6.GetAttackAngle(slot0)
	return slot0._tmpData.angle
end

function slot6.IsOutOfAngle(slot0, slot1)
	if slot0:GetAttackAngle() >= 360 then
		return false
	end

	if slot0._wholeCircle < math.atan2(slot1:GetPosition().z - slot0._hostPos.z, slot1.GetPosition().x - slot0._hostPos.x) then
		slot3 = slot3 + slot0._wholeCircleNormalizeOffset
	else
		if slot3 < slot0._negativeCircle then
			slot3 = slot3 + slot0._negativeCircleNormalizeOffset
		else
			slot3 = slot3 + slot0._normalizeOffset
		end
	end

	if slot0._lowerEdge < slot3 and slot3 < slot0._upperEdge then
		return false
	else
		return true
	end

	return
end

function slot6.IsOutOfRange(slot0, slot1)
	if slot0._maxRangeSqr >= slot0:getTrackingHost():GetDistance(slot1) and slot2 >= slot0:GetMinimumRange() then
		slot3 = false
	else
		slot3 = true
	end

	return slot3
end

function slot6.IsOutOfSector(slot0, slot1)
	if not slot0:IsOutOfRange(slot1) then
		slot2 = slot0:IsOutOfAngle(slot1)
	end

	return slot2
end

function slot6.IsOutOfSquare(slot0, slot1)
	slot3 = false

	if ((slot1:GetPosition().x - slot0._hostPos.x) * slot0:GetDirection() > 0 and slot4 <= slot0._frontRange) or (slot4 < 0 and math.abs(slot4) < slot0._backRange) then
		slot3 = true
	end

	if not slot3 then
		return true
	else
		return false
	end

	return
end

function slot6.LockUnit(slot0, slot1)
	slot1:Tag(slot0)

	return
end

function slot6.UnlockUnit(slot0, slot1)
	slot1:UnTag(slot0)

	return
end

function slot6.GetLockRequiredTime(slot0)
	return 0
end

function slot6.PreCast(slot0)
	slot0._currentState = slot0.STATE_PRECAST

	slot0:AddPreCastTimer()

	if slot0._preCastInfo.armor then
		slot0._precastArmor = slot0._preCastInfo.armor
	end

	slot0._host:SetWeaponPreCastBound(true)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.WEAPON_PRE_CAST, slot1))

	return
end

function slot6.Fire(slot0, slot1)
	slot0:DispatchGCD()

	slot0._currentState = slot0.STATE_ATTACK

	if slot0._tmpData.action_index == "" then
		slot0:DoAttack(slot1)
	else
		slot0:DispatchFireEvent(slot1, slot0._tmpData.action_index)
	end

	return true
end

function slot6.DoAttack(slot0, slot1)
	if slot1 == nil or not slot1:IsAlive() or slot0:outOfFireRange(slot1) then
		slot1 = nil
	end

	slot2 = slot0:GetDirection()
	slot3 = slot0:GetAttackAngle()

	slot0:TriggerBuffOnSteday()

	for slot7, slot8 in ipairs(slot0._majorEmitterList) do
		slot8:Ready()
	end

	for slot7, slot8 in ipairs(slot0._majorEmitterList) do
		slot8:Fire(slot1, slot2, slot3)
	end

	slot0.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:TriggerBuffOnFire()
	slot0:CheckAndShake()

	return
end

function slot6.TriggerBuffOnSteday(slot0)
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_WEAPON_STEDAY, {
		equipIndex = slot0._equipmentIndex
	})

	return
end

function slot6.TriggerBuffOnFire(slot0)
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_FIRE, {
		equipIndex = slot0._equipmentIndex
	})

	return
end

function slot6.TriggerBuffOnReady(slot0)
	return
end

function slot6.UpdateCombo(slot0, slot1)
	if slot0._hostUnitType ~= slot0.UnitType.PLAYER_UNIT or not slot0._host:IsAlive() then
		return
	end

	if #slot1 > 0 then
		slot2 = 0

		for slot6, slot7 in ipairs(slot1) do
			if table.contains(slot0._comboIDList, slot7) then
				slot2 = slot2 + 1
			end

			slot0._host:TriggerBuff(slot0.BuffEffectType.ON_COMBO, {
				equipIndex = slot0._equipmentIndex,
				matchUnitCount = slot2
			})

			break
		end

		slot0._comboIDList = slot1
	end

	return
end

function slot6.SingleFire(slot0, slot1, slot2)
	slot0._tempEmittersList[#slot0._tempEmittersList + 1] = {}

	if slot1 and slot1:IsAlive() then
	else
		slot1 = nil
	end

	if not slot2 then
		slot2 = slot0.EMITTER_NORMAL
	end

	for slot7, slot8 in ipairs(slot0._tmpData.barrage_ID) do
		slot3[#slot3 + 1] = slot1.Battle[slot2].New(slot9, function ()
			for slot3, slot4 in ipairs(ipairs) do
				if slot4:GetState() ~= slot4.STATE_STOP then
					return
				end
			end

			for slot3, slot4 in ipairs(ipairs) do
				slot4:Destroy()
			end

			slot0 = nil

			for slot4, slot5 in ipairs(slot1._tempEmittersList) do
				if slot5 == slot0 then
					slot0 = slot4
				end
			end

			table.remove(slot1._tempEmittersList, slot0)

			slot0 = nil
			table.remove._fireFXFlag = slot1._tmpData.fire_fx_loop_type

			return
		end, slot8)
	end

	for slot7, slot8 in ipairs(slot3) do
		slot8:Ready()
		slot8:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
	end

	slot0:CheckAndShake()

	return
end

function slot6.SetModifyInitialCD(slot0)
	slot0._modInitCD = true

	return
end

function slot6.GetModifyInitialCD(slot0)
	return slot0._modInitCD
end

function slot6.InitialCD(slot0)
	if slot0._tmpData.initial_over_heat == 1 then
		slot0:AddCDTimer(slot0:GetReloadTime())
	end

	return
end

function slot6.EnterCoolDown(slot0)
	slot0._fireFXFlag = slot0._tmpData.fire_fx_loop_type

	slot0:AddCDTimer(slot0:GetReloadTime())

	return
end

function slot6.UpdatePrecastArmor(slot0, slot1)
	if slot0._currentState ~= slot0.STATE_PRECAST or not slot0._precastArmor then
		return
	end

	slot0._precastArmor = slot0._precastArmor + slot1

	if slot0._precastArmor <= 0 then
		slot0:Interrupt()
	end

	return
end

function slot6.Interrupt(slot0)
	slot0:DispatchEvent(slot2)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.WEAPON_INTERRUPT, slot1))
	slot0:RemovePrecastTimer()
	slot0:EnterCoolDown()

	return
end

function slot6.DispatchGCD(slot0)
	if slot0._GCD > 0 then
		slot0._host:EnterGCD(slot0._GCD, slot0._tmpData.queue)
	end

	return
end

function slot6.Clear(slot0)
	slot0:RemovePrecastTimer()

	if slot0._majorEmitterList then
		for slot4, slot5 in ipairs(slot0._majorEmitterList) do
			slot5:Destroy()
		end
	end

	for slot4, slot5 in ipairs(slot0._tempEmittersList) do
		for slot9, slot10 in ipairs(slot5) do
			slot10:Destroy()
		end
	end

	return
end

function slot6.Dispose(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
	slot0:RemovePrecastTimer()

	slot0._dataProxy = nil

	return
end

function slot6.AddCDTimer(slot0, slot1)
	slot0._currentState = slot0.STATE_OVER_HEAT
	slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	slot0._reloadRequire = slot1

	return
end

function slot6.handleCoolDown(slot0)
	slot0._currentState = slot0.STATE_READY
	slot0._CDstartTime = nil
	slot0._jammingTime = 0

	return
end

function slot6.OverHeat(slot0)
	slot0._currentState = slot0.STATE_OVER_HEAT

	return
end

function slot6.RemovePrecastTimer(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._precastTimer)
	slot0._host:SetWeaponPreCastBound(false)

	slot0._precastArmor = nil
	slot0._precastTimer = nil

	return
end

function slot6.AddPreCastTimer(slot0)
	slot0._precastTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponPrecastTimer", 0, slot0._preCastInfo.time, function ()
		slot0._currentState = slot0.STATE_PRECAST_FINISH

		slot0:RemovePrecastTimer()
		slot0:DispatchEvent(slot0.Event.New(slot1.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, slot0))
		slot0:Tracking()

		return
	end, true)

	return
end

function slot6.Spawn(slot0, slot1, slot2)
	slot3 = nil

	if slot2 == nil then
		slot3 = Vector3.zero
	else
		slot3 = slot2:GetPosition()
	end

	slot4 = slot0._dataProxy:CreateBulletUnit(slot1, slot0._host, slot0, slot3)

	slot0:setBulletSkin(slot4, slot1)
	slot0:TriggerBuffWhenSpawn(slot4)

	return slot4
end

function slot6.FixAmmo(slot0, slot1)
	slot0._fixedAmmo = slot1

	return
end

function slot6.GetFixAmmo(slot0)
	return slot0._fixedAmmo
end

function slot6.ShiftBullet(slot0, slot1)
	slot2 = {}

	for slot6 = 1, #slot0._bulletList, 1 do
		slot2[slot6] = slot1
	end

	slot0._bulletList = slot2

	return
end

function slot6.RevertBullet(slot0)
	slot0._bulletList = slot0._tmpData.bullet_ID

	return
end

function slot6.GetPrimalAmmoType(slot0)
	return slot0.GetBulletTmpDataFromID(slot0._bulletList[1]).ammo_type
end

function slot6.TriggerBuffWhenSpawn(slot0, slot1)
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_BULLET_CREATE, {
		_bullet = slot1,
		equipIndex = slot0._equipmentIndex
	})

	return
end

function slot6.DispatchBulletEvent(slot0, slot1)
	slot2 = slot0._tmpData
	slot3 = nil

	if slot0._fireFXFlag ~= 0 then
		slot3 = slot2.fire_fx

		if slot0._fireFXFlag ~= -1 then
			slot0._fireFXFlag = slot0._fireFXFlag - 1
		end
	end

	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.CREATE_BULLET, slot4))

	return
end

function slot6.DispatchFireEvent(slot0, slot1, slot2)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.FIRE, slot3))

	return
end

function slot6.CheckAndShake(slot0)
	if slot0._tmpData.shakescreen == 1 then
		slot0.Battle.BattleCameraUtil:GetInstance():StartShake(pg.shake_template[slot1.ShakeType.FIRE])
	end

	return
end

function slot6.GetBaseAngle(slot0)
	return slot0._baseAngle
end

function slot6.GetHost(slot0)
	return slot0._host
end

function slot6.GetPosition(slot0)
	return slot0._hostPos
end

function slot6.GetDirection(slot0)
	return slot0._host:GetDirection()
end

function slot6.GetCurrentState(slot0)
	return slot0._currentState
end

function slot6.GetReloadTime(slot0)
	if slot0._reloadMax ~= slot0._cacheReloadMax or slot0._host:GetAttr().loadSpeed ~= slot0._cacheHostReload then
		slot0._cacheReloadMax = slot0._reloadMax
		slot0._cacheHostReload = slot0._host:GetAttr().loadSpeed
		slot0._cacheReloadTime = slot0.ReloadTime(slot0._reloadMax, slot0._host:GetAttr())
	end

	return slot0._cacheReloadTime
end

function slot6.GetReloadFinishTimeStamp(slot0)
	return slot0._reloadRequire + slot0._CDstartTime + slot0._jammingTime
end

function slot6.StartJamming(slot0)
	slot0._jammingStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	return
end

function slot6.JammingEliminate(slot0)
	if not slot0._jammingStartTime then
		return
	end

	slot0._jammingTime = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._jammingStartTime
	slot0._jammingStartTime = nil

	return
end

function slot6.FlushReloadMax(slot0, slot1)
	slot2 = slot0._tmpData.reload_max

	if not slot1 then
		slot1 = 1
	end

	slot0._reloadMax = slot2 * slot1

	return
end

function slot6.AppendReloadFactor(slot0, slot1, slot2)
	slot0._reloadFacotrList[slot1] = slot2

	return
end

function slot6.RemoveReloadFactor(slot0, slot1)
	if slot0._reloadFacotrList[slot1] then
		slot0._reloadFacotrList[slot1] = nil
	end

	return
end

function slot6.GetReloadFactorList(slot0)
	return slot0._reloadFacotrList
end

function slot6.FlushReloadRequire(slot0)
	if not slot0._CDstartTime then
		return true
	end

	slot0._reloadRequire = pg.TimeMgr.GetInstance():GetCombatTime() - slot0._CDstartTime + slot0.ReloadTime(slot4, slot0._host:GetAttr())

	return
end

function slot6.GetMinimumRange(slot0)
	return slot0._minRangeSqr
end

function slot6.GetCorrectedDMG(slot0)
	return slot0._correctedDMG
end

function slot6.GetConvertedAtkAttr(slot0)
	return slot0._convertedAtkAttr
end

function slot6.IsReady(slot0)
	if slot0._currentState ~= slot0.STATE_READY then
		slot1 = false
	else
		slot1 = true
	end

	return slot1
end

return
