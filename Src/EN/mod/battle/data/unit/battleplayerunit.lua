ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleAttr
slot4 = ys.Battle.BattleConst
slot5 = ys.Battle.BattleConfig
ys.Battle.BattlePlayerUnit = class("BattlePlayerUnit", ys.Battle.BattleUnit)
ys.Battle.BattlePlayerUnit.__name = "BattlePlayerUnit"

function ys.Battle.BattlePlayerUnit.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)

	slot0._type = slot1.UnitType.PLAYER_UNIT
end

function ys.Battle.BattlePlayerUnit.Retreat(slot0)
	slot0.super.Retreat(slot0)
	slot0:SetDeathReason(slot1.UnitDeathReason.LEAVE)
	slot0:DeadAction()
	slot0._battleProxy:ShutdownPlayerUnit(slot0:GetUniqueID())
	slot0._battleProxy:KillUnit(slot0:GetUniqueID())
end

function ys.Battle.BattlePlayerUnit.DeadActionEvent(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.WILL_DIE, {}))
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.SHUT_DOWN_PLAYER, {}))
	slot0._unitState:ChangeState(slot0.Battle.UnitState.STATE_DEAD)
end

function ys.Battle.BattlePlayerUnit.InitCurrentHP(slot0, slot1)
	slot0:SetCurrentHP(math.ceil(slot0:GetMaxHP() * slot1))
	slot0:TriggerBuff(slot0.BuffEffectType.ON_HP_RATIO_UPDATE, {})
end

function ys.Battle.BattlePlayerUnit.SetSkinId(slot0, slot1)
	slot0._skinId = slot1
end

function ys.Battle.BattlePlayerUnit.GetSkinID(slot0)
	return slot0._skinId
end

function ys.Battle.BattlePlayerUnit.GetDefaultSkinID(slot0)
	return slot0._tmpData.skin_id
end

function ys.Battle.BattlePlayerUnit.GetShipName(slot0)
	return slot0._shipName or slot0._tmpData.name
end

function ys.Battle.BattlePlayerUnit.SetShipName(slot0, slot1)
	slot0._shipName = slot1
end

function ys.Battle.BattlePlayerUnit.SetTemplate(slot0, slot1, slot2)
	slot0.super.SetTemplate(slot0, slot1)

	slot0._tmpData = slot1.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(slot0._tmpID)

	slot0:overrideWeaponInfo()
	slot0:overrideSkin(slot0._skinId, true)
	slot0:InitCldComponent()

	slot2.armorType = slot0._tmpData.armor_type

	slot0:setAttrFromOutBattle(slot2)
	slot2.InitDOTAttr(slot0._attr, slot0._tmpData)
	slot2.SetCurrent(slot0, "srcShipType", slot0._tmpData.type)

	slot0._personality = slot1.Battle.BattleDataFunction.GetShipPersonality(slot0._tmpData.personality)
	slot0._labelTagList = Clone(slot0._tmpData.tag_list)
end

function ys.Battle.BattlePlayerUnit.overrideSkin(slot0, slot1, slot2)
	slot0._skinData = slot0.GetPlayerShipSkinDataFromID(slot1)
	slot3 = {
		"prefab",
		"fx_container",
		"bound_bone",
		"smoke",
		"painting_hx"
	}

	if slot2 then
		slot3[#slot3 + 1] = "painting"
	end

	_.each(slot3, function (slot0)
		slot0._tmpData[slot0] = slot0._skinData[slot0]
	end)
end

function ys.Battle.BattlePlayerUnit.overrideWeaponInfo(slot0, slot1, slot2)
	if slot0._overrideBaseInfo then
		slot0._tmpData.base_list = slot0._overrideBaseInfo
	end

	if slot0._overridePreloadInfo then
		slot0._tmpData.preload_count = slot0._overridePreloadInfo
	end
end

function ys.Battle.BattlePlayerUnit.SetWeaponInfo(slot0, slot1, slot2)
	slot0._overrideBaseInfo = slot1
	slot0._overridePreloadInfo = slot2
end

function ys.Battle.BattlePlayerUnit.SetRarity(slot0, slot1)
	slot0._rarity = slot1
end

function ys.Battle.BattlePlayerUnit.setWeapon(slot0, slot1)
	slot2 = slot0._tmpData.default_equip_list
	slot3 = slot0._tmpData.base_list
	slot4 = slot0._proficiencyList
	slot5 = slot0._tmpData.preload_count

	for slot9, slot10 in ipairs(slot1) do
		if slot9 == Ship.PREFAB_EQUIP and slot10 and slot10.skin and slot10.skin ~= 0 then
			if slot0.GetEquipSkinDataFromID(slot10.skin).ship_skin_id ~= 0 then
				slot0:overrideSkin(slot11.ship_skin_id)
			end

			slot12 = slot11.attachment_key
			slot0._skinAttachment = slot0._skinAttachment or {}

			if slot12 ~= 0 and not slot0._skinAttachment[slot12] then
				slot0._skinAttachment[slot12] = slot11.attachment_combat_scene
			end
		elseif slot9 <= Ship.WEAPON_COUNT then
			slot11 = slot4[slot9]
			slot12 = slot5[slot9]

			function slot13(slot0, slot1, slot2)
				for slot7 = 1, slot0[slot1], 1 do
					slot3._totalWeapon[#slot3._totalWeapon + 1] = slot2.Battle.BattleDataFunction.CreateWeaponUnit(slot0, slot3, slot4, slot1)

					if slot1 then
						slot8:SetEquipmentInfo(slot1)
					end

					if slot8:GetTemplateData().type == slot5.EquipmentType.POINT_HIT_AND_LOCK then
						if slot7 <= slot6 then
							slot8:SetModifyInitialCD()
						end

						slot3._chargeList[#slot3._chargeList + 1] = slot8

						slot3._weaponQueue:AppendChargeWeapon(slot8)
					elseif slot9 == slot5.EquipmentType.MANUAL_TORPEDO then
						if slot7 <= slot6 then
							slot8:SetModifyInitialCD()
						end

						slot3._manualTorpedoList[#slot3._manualTorpedoList + 1] = slot8

						slot3._weaponQueue:AppendManualTorpedo(slot8)
					elseif slot9 == slot5.EquipmentType.PASSIVE_SCOUT then
					elseif slot9 == slot5.EquipmentType.FLEET_ANTI_AIR then
						slot3._fleetAAList[#slot3._fleetAAList + 1] = slot8
					else
						slot3:AddAutoWeapon(slot8)
					end

					if slot9 == slot5.EquipmentType.PASSIVE_SCOUT then
						slot3._hiveList[#slot3._hiveList + 1] = slot8
					end

					if slot9 == slot5.EquipmentType.ANTI_AIR then
						slot3._AAList[#slot3._AAList + 1] = slot8
					end

					if slot2 and slot2 ~= 0 then
						slot8:SetSkinData(slot2)
						slot3:SetPriorityWeaponSkin(slot2)
					end
				end
			end

			if slot10.equipment then
				for slot18, slot19 in ipairs(slot14) do
					if slot19 and slot19 ~= -1 then
						slot13(slot19, slot10.equipment.nationality, slot10.skin)
					end
				end
			else
				slot13(slot2[slot9])
			end
		end
	end

	slot6 = #slot2

	for slot11, slot12 in ipairs(slot7) do
		if slot12 and slot12 ~= -1 then
			slot0._totalWeapon[#slot0._totalWeapon + 1] = slot1.Battle.BattleDataFunction.CreateWeaponUnit(slot12, slot0, slot4[slot11 + slot6] or 1, slot11 + slot6)

			if slot14:GetTemplateData().type == slot2.EquipmentType.POINT_HIT_AND_LOCK then
				slot0._chargeList[#slot0._chargeList + 1] = slot14

				slot0._weaponQueue:AppendChargeWeapon(slot14)
			elseif slot15 == slot2.EquipmentType.MANUAL_TORPEDO then
				slot0._manualTorpedoList[#slot0._manualTorpedoList + 1] = slot14

				slot0._weaponQueue:AppendManualTorpedo(slot14)
			elseif slot15 == slot2.EquipmentType.PASSIVE_SCOUT then
			elseif slot15 == slot2.EquipmentType.FLEET_ANTI_AIR then
				slot0._fleetAAList[#slot0._fleetAAList + 1] = slot14
			else
				slot0:AddAutoWeapon(slot14)
			end

			if slot15 == slot2.EquipmentType.PASSIVE_SCOUT then
				slot0._hiveList[#slot0._hiveList + 1] = slot14
			end

			if slot15 == slot2.EquipmentType.ANTI_AIR then
				slot0._AAList[#slot0._AAList + 1] = slot14
			end
		end
	end

	if slot0:CanDoAntiSub() then
		slot8 = {}

		for slot12 = Ship.WEAPON_COUNT + 1, #slot1, 1 do
			if slot1[slot12] and slot13.equipment and #slot13.equipment.weapon_id > 0 then
				slot8[#slot8 + 1] = slot13.equipment.weapon_id[1]
			end
		end

		if #slot8 == 0 then
			slot8 = slot0._tmpData.depth_charge_list
		end

		slot9 = 20
		slot10 = 1

		for slot14, slot15 in ipairs(slot8) do
			slot0:AddAutoWeapon(slot1.Battle.BattleDataFunction.CreateWeaponUnit(slot15, slot0, slot10, slot9))
		end
	end
end

function ys.Battle.BattlePlayerUnit.SetPriorityWeaponSkin(slot0, slot1)
	if not slot0._priorityWeaponSkinID then
		slot0._priorityWeaponSkinID = slot1
	end
end

function ys.Battle.BattlePlayerUnit.GetPriorityWeaponSkin(slot0)
	return slot0._priorityWeaponSkinID
end

function ys.Battle.BattlePlayerUnit.LeaderSetting(slot0)
	if slot0.GetWords(slot0:GetSkinID(), "hp_warning", slot0:GetDefaultSkinID()) ~= "" then
		slot0._warningValue = slot1.WARNING_HP_RATE * slot0:GetMaxHP()
	end
end

function ys.Battle.BattlePlayerUnit.UpdateHP(slot0, slot1, slot2, slot3, slot4)
	slot0.super.UpdateHP(slot0, slot1, slot2, slot3, slot4)

	if slot0._warningValue and slot0._currentHP < slot0._warningValue and not isHeal then
		slot0._warningValue = nil

		slot0:DispatchVoice(slot5)
		slot0:DispatchChat(slot1.GetWords(slot0:GetSkinID(), slot5, slot0:GetDefaultSkinID()), 2.5, "hp_warning")
	end

	if slot0._mainUnitWarningValue and slot0._currentHP < slot0._mainUnitWarningValue and slot0._currentHP > 0 and not isHeal then
		slot0._mainUnitWarningValue = nil

		pg.TipsMgr:GetInstance():ShowTips(i18n("battle_main_emergent", slot0:GetShipName()))
	end
end

function ys.Battle.BattlePlayerUnit.SetMainFleetUnit(slot0)
	slot0.super.SetMainFleetUnit(slot0)

	if slot0._IFF == slot1.FRIENDLY_CODE then
		slot0._mainUnitWarningValue = slot1.WARNING_HP_RATE_MAIN * slot0:GetMaxHP()
	end
end

function ys.Battle.BattlePlayerUnit.UpdatePrecastMoveLimit(slot0)
	return
end

function ys.Battle.BattlePlayerUnit.ConfigBubbleFX(slot0)
	slot0._bubbleFX = slot0.PLAYER_SUB_BUBBLE_FX

	slot0._oxyState:SetBubbleTemplate(slot0.PLAYER_SUB_BUBBLE_INIT, slot0.PLAYER_SUB_BUBBLE_INTERVAL)
end

function ys.Battle.BattlePlayerUnit.SetFormationIndex(slot0, slot1)
	slot0._formationIndex = slot1
end

function ys.Battle.BattlePlayerUnit.setAttrFromOutBattle(slot0, slot1)
	slot0:SetPlayerAttrFromOutBattle(slot1)
end

function ys.Battle.BattlePlayerUnit.SetFleetVO(slot0, slot1)
	slot0._fleet = slot1
	slot0._subRaidLine, slot0._subRetreatLine = slot0._fleet:GetSubmarineBaseLine()
end

function ys.Battle.BattlePlayerUnit.GetTemplate(slot0)
	return slot0._tmpData
end

function ys.Battle.BattlePlayerUnit.GetRarity(slot0)
	return slot0._rarity or slot0._tmpData.rarity
end

function ys.Battle.BattlePlayerUnit.GetAutoPilotPreference(slot0)
	return slot0._personality
end

function ys.Battle.BattlePlayerUnit.GetFleetVO(slot0)
	return slot0._fleet
end

function ys.Battle.BattlePlayerUnit.InitCldComponent(slot0)
	slot0.super.InitCldComponent(slot0)
	slot0._cldComponent:SetCldData({
		type = slot1.CldType.SHIP,
		IFF = slot0:GetIFF(),
		UID = slot0:GetUniqueID(),
		Mass = slot1.CldMass.L2
	})
end

return
