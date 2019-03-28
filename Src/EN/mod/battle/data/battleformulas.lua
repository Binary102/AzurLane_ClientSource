ys.Battle.BattleFormulas = ys.Battle.BattleFormulas or {}
slot0 = ys.Battle.BattleFormulas
slot1 = ys
slot1 = slot1.Battle
slot1 = slot1.BattleConst
slot2 = pg
slot2 = slot2.gameset
slot3 = ys
slot3 = slot3.Battle
slot3 = slot3.BattleAttr
slot4 = ys
slot4 = slot4.Battle
slot4 = slot4.BattleConfig
slot5 = ys
slot5 = slot5.Battle
slot5 = slot5.BattleConfig
slot5 = slot5.AnitAirRepeaterConfig
slot6 = pg
slot6 = slot6.bfConsts
slot7 = slot6.SECONDs
slot8 = slot4.viewFPS
slot7 = slot7 / slot8
slot8 = slot4.BulletSpeedConvertConst
slot7 = slot7 * slot8
slot8 = slot6.SECONDs
slot9 = slot4.calcFPS
slot8 = slot8 / slot9
slot9 = slot4.ShipSpeedConvertConst
slot8 = slot8 * slot9
slot9 = slot6.SECONDs
slot10 = slot4.viewFPS
slot9 = slot9 / slot10
slot10 = slot4.AircraftSpeedConvertConst
slot9 = slot9 * slot10
slot10 = slot4.AIR_ASSIST_RELOAD_RATIO
slot11 = slot6.PERCENT
slot10 = slot10 * slot11
slot11 = slot4.NATIONNALITY_DAMAGE_ENHANCE
slot12 = slot4.SHIP_TYPE_DAMAGE_ENHANCE
slot13 = slot4.DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot14 = {}
slot15 = slot1.WeaponDamageAttr
slot15 = slot15.CANNON
slot16 = slot4.CANNON_DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot14[slot15] = slot16
slot15 = slot1.WeaponDamageAttr
slot15 = slot15.TORPEDO
slot16 = slot4.TORPEDO_DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot14[slot15] = slot16
slot15 = slot1.WeaponDamageAttr
slot15 = slot15.ANTI_AIR
slot16 = slot4.ANTI_AIR_DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot14[slot15] = slot16
slot15 = slot1.WeaponDamageAttr
slot15 = slot15.AIR
slot16 = slot4.AIR_DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot14[slot15] = slot16
slot15 = slot1.WeaponDamageAttr
slot15 = slot15.ANIT_SUB
slot16 = slot4.ANTI_SUB_DAMAGE_ENHANCE_FROM_SHIP_TYPE
slot14[slot15] = slot16
slot15 = slot4.AMMO_DAMAGE_ENHANCE
slot16 = slot4.AMMO_DAMAGE_REDUCE
slot17 = slot4.SHIP_TYPE_ACCURACY_ENHANCE

function slot18(slot0)
	slot2 = slot0
	slot1 = slot0.GetFlagShip
	slot1 = slot1(slot2)
	slot3 = slot0
	slot2 = slot0.GetUnitList
	slot2 = slot2(slot3)
	slot3 = slot0
	slot3 = slot3.NUM0
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		if slot8 == slot1 then
			slot9 = slot1
			slot9 = slot9.GetCurrent
			slot10 = slot8
			slot11 = "maxHP"
			slot9 = slot9(slot10, slot11)
			slot10 = slot0
			slot10 = slot10.HP_CONST
			slot9 = slot9 * slot10
			slot3 = slot3 + slot9
		else
			slot9 = slot1
			slot9 = slot9.GetCurrent
			slot10 = slot8
			slot11 = "maxHP"
			slot9 = slot9(slot10, slot11)
			slot3 = slot3 + slot9
		end
	end

	return slot3
end

slot0.GetFleetTotalHP = slot18

function slot18(slot0)
	slot1 = slot0[1]

	if slot1 then
		slot2 = slot0
		slot2 = slot2.GetCurrent
		slot3 = slot1
		slot4 = "fleetVelocity"
		slot2 = slot2(slot3, slot4)
		slot3 = slot1
		slot3 = slot3.NUM0

		if slot3 < slot2 then
			slot3 = slot1
			slot3 = slot3.PERCENT
			slot3 = slot2 * slot3

			return slot3
		end
	end

	slot2 = slot1
	slot2 = slot2.NUM0
	slot3 = #slot0
	slot4 = ipairs
	slot5 = slot0
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.GetAttrByName
		slot11 = "velocity"
		slot9 = slot9(slot10, slot11)
		slot2 = slot2 + slot9
	end

	slot4 = slot1
	slot4 = slot4.NUM1
	slot5 = slot1
	slot5 = slot5.SPEED_CONST
	slot6 = slot1
	slot6 = slot6.NUM1
	slot6 = slot3 - slot6
	slot5 = slot5 * slot6
	slot4 = slot4 - slot5
	slot5 = slot2 / slot3
	slot5 = slot5 * slot4

	return slot5
end

slot0.GetFleetVelocity = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot1.NUM0
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.GetReload
		slot7 = slot7(slot8)
		slot1 = slot1 + slot7
	end

	return slot1
end

slot0.GetFleetReload = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot1.NUM0
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.GetTorpedoPower
		slot7 = slot7(slot8)
		slot1 = slot1 + slot7
	end

	return slot1
end

slot0.GetFleetTorpedoPower = slot18

function slot18(slot0, slot1)
	slot2 = SYSTEM_DUEL

	if slot0 ~= slot2 then
		slot2 = SYSTEM_SHAM

		if slot0 == slot2 then
			slot2 = slot1.level
			slot3 = slot1.durability
			slot4 = ys
			slot4 = slot4.Battle
			slot4 = slot4.BattleDataFunction
			slot4 = slot4.GetPlayerUnitDurabilityExtraAddition
			slot5 = slot0
			slot6 = slot2
			slot4, slot5 = slot4(slot5, slot6)
			slot6 = slot3 * slot4
			slot6 = slot6 + slot5
			slot1.durability = slot6
		end
	end
end

slot0.AttrFixer = slot18

function slot18(slot0, slot1)
	slot2 = 1
	slot3 = SYSTEM_DUEL

	if slot0 ~= slot3 then
		slot3 = SYSTEM_SHAM

		if slot0 == slot3 then
			slot3 = slot1.level
			slot4 = ys
			slot4 = slot4.Battle
			slot4 = slot4.BattleDataFunction
			slot4 = slot4.GetPlayerUnitDurabilityExtraAddition
			slot5 = slot0
			slot6 = slot3
			slot4 = slot4(slot5, slot6)
			slot2 = slot4
		end
	end

	return slot2
end

slot0.HealFixer = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot0 * slot1

	return slot1
end

slot0.ConvertShipSpeed = slot18

function slot18(slot0)
	if slot0 then
		slot1 = slot0
		slot1 = slot0 * slot1

		return slot1
	else
		slot1 = nil

		return slot1
	end
end

slot0.ConvertAircraftSpeed = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot0 * slot1

	return slot1
end

slot0.ConvertBulletSpeed = slot18

function slot18(slot0, slot1, slot2)
	slot4 = slot0.NUM0
	slot5 = slot0.NUM10000
	slot6 = slot0.DRATE
	slot7 = slot0.ACCURACY
	slot11 = slot0:GetWeaponTempData().type
	slot12 = slot0.GetWeaponTempData().attack_attribute
	slot13 = slot0:GetWeapon().GetConvertedAtkAttr(slot9)
	slot15 = slot0:GetTemplate().damage_type
	slot2 = slot2 or slot0.NUM1
	slot17 = slot1._attr.armorType
	slot18 = slot0._attr.formulaLevel - slot1._attr.formulaLevel
	slot19 = slot0.NUM1
	slot20 = false
	slot21 = false
	slot22 = slot0.NUM1
	slot23 = slot0:GetCorrectedDMG()
	slot24 = slot1.WeaponDamageAttr.CANNON

	if slot12 == slot24 then
		slot24 = slot8.cannonPower
		slot24 = slot24 * slot13
		slot24 = slot3 + slot24
		slot23 = slot24 * slot23
		slot24 = slot2
		slot24 = slot24.GetCurrent
		slot25 = slot1
		slot26 = "injureRatioByCannon"
		slot24 = slot24(slot25, slot26)
		slot24 = slot3 + slot24
		slot25 = slot2
		slot25 = slot25.GetCurrent
		slot26 = slot0
		slot27 = "damageRatioByCannon"
		slot25 = slot25(slot26, slot27)
		slot2 = slot24 + slot25
	else
		slot24 = slot1
		slot24 = slot24.WeaponDamageAttr
		slot24 = slot24.TORPEDO

		if slot12 == slot24 then
			slot24 = slot8.torpedoPower
			slot24 = slot24 * slot13
			slot24 = slot3 + slot24
			slot23 = slot24 * slot23
			slot24 = slot2
			slot24 = slot24.GetCurrent
			slot25 = slot1
			slot26 = "injureRatioByBulletTorpedo"
			slot24 = slot24(slot25, slot26)
			slot24 = slot3 + slot24
			slot25 = slot2
			slot25 = slot25.GetCurrent
			slot26 = slot0
			slot27 = "damageRatioByBulletTorpedo"
			slot25 = slot25(slot26, slot27)
			slot2 = slot24 + slot25
		else
			slot24 = slot1
			slot24 = slot24.WeaponDamageAttr
			slot24 = slot24.ANTI_AIR

			if slot12 == slot24 then
				slot24 = slot8.antiAirPower
				slot24 = slot24 * slot13
				slot24 = slot3 + slot24
				slot23 = slot24 * slot23
			else
				slot24 = slot1
				slot24 = slot24.WeaponDamageAttr
				slot24 = slot24.AIR

				if slot12 == slot24 then
					slot24 = slot8.airPower
					slot24 = slot24 * slot13
					slot24 = slot3 + slot24
					slot23 = slot24 * slot23
					slot24 = slot6[7]
					slot25 = slot16.antiAirPower
					slot26 = slot6[7]
					slot25 = slot25 + slot26
					slot24 = slot24 / slot25
					slot24 = slot2 * slot24
					slot25 = slot2
					slot25 = slot25.GetCurrent
					slot26 = slot1
					slot27 = "injureRatioByAir"
					slot25 = slot25(slot26, slot27)
					slot25 = slot3 + slot25
					slot26 = slot2
					slot26 = slot26.GetCurrent
					slot27 = slot0
					slot28 = "damageRatioByAir"
					slot26 = slot26(slot27, slot28)
					slot25 = slot25 + slot26
					slot2 = slot24 * slot25
				else
					slot24 = slot1
					slot24 = slot24.WeaponDamageAttr
					slot24 = slot24.ANIT_SUB

					if slot12 == slot24 then
						slot24 = slot8.antiSubPower
						slot24 = slot24 * slot13
						slot24 = slot3 + slot24
						slot23 = slot24 * slot23
					end
				end
			end
		end
	end

	slot24 = slot8.luck
	slot25 = slot16.luck
	slot24 = slot24 - slot25
	slot25 = slot2
	slot25 = slot25.GetCurrent
	slot26 = slot1
	slot27 = "perfectDodge"
	slot25 = slot25(slot26, slot27)

	if slot25 == 1 then
		slot20 = true
	else
		slot26 = slot7[1]
		slot27 = slot8.attackRating
		slot28 = slot8.attackRating
		slot29 = slot16.dodgeRate
		slot28 = slot28 + slot29
		slot29 = slot7[2]
		slot28 = slot28 + slot29
		slot27 = slot27 / slot28
		slot26 = slot26 + slot27
		slot27 = slot24 + slot18
		slot28 = slot0
		slot28 = slot28.PERCENT1
		slot27 = slot27 * slot28
		slot26 = slot26 + slot27
		slot27 = slot2
		slot27 = slot27.GetCurrent
		slot28 = slot0
		slot29 = slot3
		slot31 = slot1
		slot30 = slot1.GetTemplate
		slot30 = slot30(slot31)
		slot30 = slot30.type
		slot29 = slot29[slot30]
		slot27 = slot27(slot28, slot29)
		slot28 = slot2
		slot28 = slot28.GetCurrent
		slot29 = slot1
		slot30 = "dodgeRateExtra"
		slot28 = slot28(slot29, slot30)
		slot29 = math
		slot29 = slot29.max
		slot30 = slot6[5]
		slot31 = math
		slot31 = slot31.min
		slot32 = slot3
		slot33 = slot26 + slot27
		slot33 = slot33 - slot28
		slot29 = slot29(slot30, slot31(slot32, slot33))
		slot26 = slot29
		slot29 = slot4
		slot29 = slot29.IsHappen
		slot30 = slot26 * slot5
		slot29 = slot29(slot30)
		slot20 = not slot29
	end

	if not slot20 then
		slot26 = slot0
		slot26 = slot26.DFT_CRIT_RATE
		slot27 = slot8.attackRating
		slot28 = slot8.attackRating
		slot29 = slot16.dodgeRate
		slot28 = slot28 + slot29
		slot29 = slot6[4]
		slot28 = slot28 + slot29
		slot27 = slot27 / slot28
		slot26 = slot26 + slot27
		slot27 = slot24 + slot18
		slot28 = slot6[3]
		slot27 = slot27 * slot28
		slot26 = slot26 + slot27
		slot27 = slot2
		slot27 = slot27.GetCurrent
		slot28 = slot0
		slot29 = "cri"
		slot27 = slot27(slot28, slot29)
		slot26 = slot26 + slot27
		slot27 = math
		slot27 = slot27.random
		slot28 = slot5
		slot28 = slot28.RANDOM_DAMAGE_MIN
		slot29 = slot5
		slot29 = slot29.RANDOM_DAMAGE_MAX
		slot27 = slot27(slot28, slot29)
		slot22 = slot27 + slot23
		slot28 = slot4
		slot28 = slot28.IsHappen
		slot29 = slot26 * slot5
		slot28 = slot28(slot29)

		if slot28 then
			slot21 = true
			slot28 = math
			slot28 = slot28.max
			slot29 = 1
			slot30 = slot0
			slot30 = slot30.DFT_CRIT_EFFECT
			slot31 = slot2
			slot31 = slot31.GetCurrent
			slot32 = slot0
			slot33 = "criDamage"
			slot31 = slot31(slot32, slot33)
			slot30 = slot30 + slot31
			slot31 = slot2
			slot31 = slot31.GetCurrent
			slot32 = slot1
			slot33 = "criDamageResist"
			slot31 = slot31(slot32, slot33)
			slot30 = slot30 - slot31
			slot28 = slot28(slot29, slot30)
			slot19 = slot28
		else
			slot21 = false
		end
	else
		slot22 = slot4
		slot26 = {
			isMiss = true,
			isDamagePrevent = false,
			isCri = slot21
		}
		slot27 = slot22
		slot28 = slot26

		return slot27, slot28
	end

	slot26 = slot0
	slot26 = slot26.NUM1
	slot27 = slot2
	slot27 = slot27.GetCurrent
	slot28 = slot0
	slot29 = "damageRatioBullet"
	slot27 = slot27(slot28, slot29)
	slot28 = slot2
	slot28 = slot28.GetCurrent
	slot29 = slot0
	slot30 = slot6
	slot32 = slot1
	slot31 = slot1.GetTemplate
	slot31 = slot31(slot32)
	slot31 = slot31.type
	slot30 = slot30[slot31]
	slot28 = slot28(slot29, slot30)
	slot29 = slot2
	slot29 = slot29.GetCurrent
	slot30 = slot0
	slot31 = slot7
	slot33 = slot1
	slot32 = slot1.GetTemplate
	slot32 = slot32(slot33)
	slot32 = slot32.nationality
	slot31 = slot31[slot32]
	slot29 = slot29(slot30, slot31)
	slot30 = slot2
	slot30 = slot30.GetCurrent
	slot31 = slot1
	slot32 = "injureRatio"
	slot30 = slot30(slot31, slot32)
	slot32 = slot9
	slot31 = slot9.GetFixAmmo
	slot31 = slot31(slot32)

	if not slot31 then
		slot22 = math.max(slot26, math.floor(slot22 * slot2 * (slot15[slot17] or slot26) * slot19 * (slot26 + slot27) * (slot26 + slot29) * (slot26 + slot30) * ((slot26 + slot2.GetCurrent(slot0, slot9[slot14.ammo_type])) - slot2.GetCurrent(slot1, slot10[slot14.ammo_type])) * (slot26 + slot28) * (slot26 + slot2.GetCurrent(slot1, slot36)) * (slot26 + slot2.GetCurrent(slot1, slot8[slot12][slot2.GetCurrent(slot0, "srcShipType")])) * (slot26 + math.min(slot6[1], math.max(-slot6[1], slot18)) * slot6[2])))
		slot38 = slot1:GetCurrentOxyState()
		slot39 = slot1.OXY_STATE.DIVE
	end

	if slot38 == slot39 then
		slot38 = math
		slot38 = slot38.floor
		slot39 = slot14.antisub_enhancement
		slot39 = slot22 * slot39
		slot38 = slot38(slot39)
		slot22 = slot38
	end

	slot38 = {
		isMiss = slot20,
		isCri = slot21,
		damageAttr = slot12
	}
	slot40 = slot0
	slot39 = slot0.GetDamageEnhance
	slot39 = slot39(slot40)

	if slot39 ~= 1 then
		slot40 = math
		slot40 = slot40.floor
		slot41 = slot22 * slot39
		slot40 = slot40(slot41)
		slot22 = slot40
	end

	slot40 = type
	slot41 = slot14.hit_type
	slot40 = slot40(slot41)

	if slot40 == "table" then
		slot40 = slot14.hit_type
		slot40 = slot40.rate

		if slot40 then
			slot40 = slot0.GetExplodePostion

			if slot40 then
				slot40 = slot14.hit_type
				slot40 = slot40.range
				slot41 = slot14.hit_type
				slot41 = slot41.rate
				slot42 = pg
				slot42 = slot42.Tool
				slot42 = slot42.FilterY
				slot44 = slot0
				slot43 = slot0.GetExplodePostion
				slot42 = slot42(slot43(slot44))
				slot43 = pg
				slot43 = slot43.Tool
				slot43 = slot43.FilterY
				slot45 = slot1
				slot44 = slot1.GetPosition
				slot43 = slot43(slot44(slot45))
				slot44 = Vector3
				slot44 = slot44.Distance
				slot45 = slot42
				slot46 = slot43
				slot44 = slot44(slot45, slot46)
				slot45 = math
				slot45 = slot45.floor
				slot46 = slot0
				slot46 = slot46.NUM1
				slot47 = Mathf
				slot47 = slot47.Clamp
				slot48 = slot44 / slot40
				slot49 = 0
				slot50 = 1
				slot47 = slot47(slot48, slot49, slot50)
				slot47 = slot47 * slot41
				slot46 = slot46 - slot47
				slot46 = slot22 * slot46
				slot45 = slot45(slot46)
				slot22 = slot45
			end
		end
	end

	slot40 = math
	slot40 = slot40.floor
	slot41 = slot16.repressReduce
	slot41 = slot22 * slot41
	slot40 = slot40(slot41)
	slot22 = slot40
	slot40 = slot22
	slot41 = slot38
	slot42 = slot14.DMG_font
	slot42 = slot42[slot17]

	return slot40, slot41, slot42
end

slot0.CalculateDamage = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0._attr
	slot5 = slot0
	slot4 = slot0.GetWeapon
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.GetCorrectedDMG
	slot5 = slot5(slot6)
	slot6 = slot3[slot1]
	slot7 = slot0
	slot7 = slot7.PERCENT
	slot6 = slot6 * slot7
	slot6 = 1 + slot6
	slot6 = slot5 * slot6
	slot6 = slot6 * slot2

	return slot6
end

slot0.CalculateIgniteDamage = slot18

function slot18(slot0, slot1)
	return (slot1 or slot0:GetTemplateData().damage) * slot0:GetPotential() * slot0.GetTemplateData().corrected * slot0.PERCENT
end

slot0.WeaponDamagePreCorrection = slot18

function slot18(slot0)
	slot2 = slot0
	slot1 = slot0.GetTemplateData
	slot1 = slot1(slot2)
	slot2 = slot1.attack_attribute_ratio
	slot3 = slot0
	slot3 = slot3.PERCENT2
	slot2 = slot2 * slot3

	return slot2
end

slot0.WeaponAtkAttrPreRatio = slot18

function slot18(slot0)
	slot1 = {}
	slot2 = slot0
	slot2 = slot2.METEO_RATE
	slot3 = slot2[1]
	slot4 = slot2[2]

	if slot4 <= slot0 then
		slot4 = 1
		slot5 = slot0 + 1
		slot6 = 1

		for slot7 = slot4, slot5, slot6 do
			slot1[slot7] = slot3
		end

		return slot1
	else
		slot4 = slot3 * slot0
		slot4 = 1 - slot4
		slot5 = 1
		slot6 = slot0
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = math
			slot9 = slot9.random
			slot9 = slot9()
			slot9 = slot9 * slot4
			slot10 = slot2[3]
			slot11 = slot2[4]
			slot12 = slot8 - 1
			slot11 = slot11 * slot12
			slot11 = slot11 / slot0
			slot10 = slot10 + slot11
			slot9 = slot9 * slot10
			slot10 = slot9 + slot3
			slot1[slot8] = slot10
			slot10 = math
			slot10 = slot10.max
			slot11 = 0
			slot12 = slot4 - slot9
			slot10 = slot10(slot11, slot12)
			slot4 = slot10
		end

		slot5 = slot0 + 1
		slot1[slot5] = slot4

		return slot1
	end
end

slot0.GetMeteoDamageRatio = slot18

function slot18(slot0)
	slot2 = slot0
	slot1 = slot0.GetCrewUnitList
	slot1 = slot1(slot2)
	slot2 = 0
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0
		slot8 = slot8.GetCurrent
		slot9 = slot6
		slot10 = "antiAirPower"
		slot8 = slot8(slot9, slot10)
		slot9 = ipairs
		slot10 = slot7
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot15 = slot13
			slot14 = slot13.GetConvertedAtkAttr
			slot14 = slot14(slot15)
			slot16 = slot13
			slot15 = slot13.GetCorrectedDMG
			slot15 = slot15(slot16)
			slot16 = math
			slot16 = slot16.max
			slot17 = 1
			slot18 = slot8 * slot14
			slot18 = slot18 + 1
			slot18 = slot18 * slot15
			slot16 = slot16(slot17, slot18)
			slot2 = slot2 + slot16
		end
	end

	return slot2
end

slot0.CalculateFleetAntiAirTotalDamage = slot18

function slot18(slot0)
	slot2 = slot0
	slot1 = slot0.GetHost
	slot1 = slot1(slot2)
	slot3 = slot0
	slot2 = slot0.GetConvertedAtkAttr
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.GetCorrectedDMG
	slot3 = slot3(slot4)
	slot4 = slot0
	slot4 = slot4.GetCurrent
	slot5 = slot1
	slot6 = "antiAirPower"
	slot4 = slot4(slot5, slot6)
	slot5 = math
	slot5 = slot5.max
	slot6 = 1
	slot7 = slot4 * slot2
	slot7 = slot7 + 1
	slot7 = slot7 * slot3
	slot5 = slot5(slot6, slot7)

	return slot5
end

slot0.CalculateRepaterAnitiAirTotalDamage = slot18

function slot18(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetHost
	slot2 = slot2(slot3)
	slot3 = slot0
	slot3 = slot3.GetCurrent
	slot4 = slot2
	slot5 = "antiAirPower"
	slot3 = slot3(slot4, slot5)
	slot4 = slot0
	slot4 = slot4.GetCurrent
	slot5 = slot2
	slot6 = "attackRating"
	slot4 = slot4(slot5, slot6)
	slot5 = slot0
	slot5 = slot5.GetCurrent
	slot6 = slot1
	slot7 = "airPower"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0
	slot6 = slot6.GetCurrent
	slot7 = slot1
	slot8 = "dodgeLimit"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "dodge"
	slot7 = slot7(slot8, slot9)
	slot8 = slot1
	slot8 = slot8.const_A
	slot8 = slot5 / slot8
	slot9 = slot1
	slot9 = slot9.const_B
	slot8 = slot8 + slot9
	slot9 = slot3 * slot7
	slot9 = slot9 + slot8
	slot10 = slot1
	slot10 = slot10.const_C
	slot9 = slot9 + slot10
	slot9 = slot8 / slot9
	slot10 = math
	slot10 = slot10.min
	slot11 = slot6
	slot12 = slot9
	slot10 = slot10(slot11, slot12)
	slot9 = slot10
	slot10 = slot2
	slot10 = slot10.IsHappen
	slot11 = slot3
	slot11 = slot11.NUM10000
	slot11 = slot9 * slot11

	return slot10(slot11)
end

slot0.RollRepeaterHitDice = slot18

function slot18(slot0)
	slot1 = slot0 * slot0

	return slot1
end

slot0.AntiAirPowerWeight = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "airPower"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot3 = slot3.GetCurrent
	slot4 = slot1
	slot5 = "antiAirPower"
	slot3 = slot3(slot4, slot5)
	slot4 = slot0
	slot4 = slot4.GetCurrent
	slot5 = slot0
	slot6 = "crashDMG"
	slot4 = slot4(slot5, slot6)
	slot6 = slot0
	slot5 = slot0.GetHPRate
	slot5 = slot5(slot6)
	slot6 = slot0
	slot6 = slot6.GetCurrent
	slot7 = slot0
	slot8 = "formulaLevel"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "formulaLevel"
	slot7 = slot7(slot8, slot9)
	slot8 = slot0
	slot8 = slot8.GetCurrent
	slot9 = slot1
	slot10 = "injureRatio"
	slot8 = slot8(slot9, slot10)
	slot9 = slot0
	slot9 = slot9.GetCurrent
	slot10 = slot1
	slot11 = "injureRatioByAir"
	slot9 = slot9(slot10, slot11)
	slot10 = slot1
	slot10 = slot10.PLANE_LEAK_RATE
	slot11 = math
	slot11 = slot11.max
	slot12 = slot10[1]
	slot13 = math
	slot13 = slot13.floor
	slot14 = slot10[2]
	slot15 = slot10[3]
	slot15 = slot2 * slot15
	slot14 = slot14 + slot15
	slot14 = slot4 * slot14
	slot15 = slot10[4]
	slot15 = slot6 * slot15
	slot14 = slot14 + slot15
	slot15 = slot10[5]
	slot15 = slot5 * slot15
	slot16 = slot10[6]
	slot15 = slot15 + slot16
	slot14 = slot14 * slot15
	slot15 = slot10[7]
	slot16 = slot6 - slot7
	slot17 = slot10[8]
	slot16 = slot16 * slot17
	slot15 = slot15 + slot16
	slot14 = slot14 * slot15
	slot15 = slot10[9]
	slot16 = slot10[10]
	slot16 = slot3 + slot16
	slot15 = slot15 / slot16
	slot14 = slot14 * slot15
	slot15 = slot10[11]
	slot15 = slot15 + slot8
	slot14 = slot14 * slot15
	slot15 = slot10[12]
	slot15 = slot15 + slot9
	slot14 = slot14 * slot15
	slot11 = slot11(slot12, slot13(slot14))
	slot12 = math
	slot12 = slot12.floor
	slot13 = slot0
	slot13 = slot13.GetCurrent
	slot14 = slot1
	slot15 = "repressReduce"
	slot13 = slot13(slot14, slot15)
	slot13 = slot11 * slot13
	slot12 = slot12(slot13)
	slot11 = slot12

	return slot11
end

slot0.CalculateDamageFromAircraftToMainShip = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "cannonPower"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot3 = slot3.GetCurrent
	slot4 = slot0
	slot5 = "torpedoPower"
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.GetHPRate
	slot4 = slot4(slot5)
	slot5 = slot0
	slot5 = slot5.GetCurrent
	slot6 = slot0
	slot7 = "formulaLevel"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0
	slot6 = slot6.GetCurrent
	slot7 = slot1
	slot8 = "formulaLevel"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "injureRatio"
	slot7 = slot7(slot8, slot9)
	slot8 = slot1
	slot8 = slot8.LEAK_RATE
	slot9 = math
	slot9 = slot9.max
	slot10 = slot8[1]
	slot11 = math
	slot11 = slot11.floor
	slot12 = slot2 + slot3
	slot13 = slot8[2]
	slot12 = slot12 * slot13
	slot13 = slot8[7]
	slot13 = slot5 * slot13
	slot12 = slot12 + slot13
	slot13 = slot8[5]
	slot13 = slot13 + slot7
	slot12 = slot12 * slot13
	slot13 = slot8[3]
	slot13 = slot4 * slot13
	slot14 = slot8[4]
	slot13 = slot13 + slot14
	slot12 = slot12 * slot13
	slot13 = slot8[5]
	slot14 = slot5 - slot6
	slot15 = slot8[6]
	slot14 = slot14 * slot15
	slot13 = slot13 + slot14
	slot12 = slot12 * slot13
	slot9 = slot9(slot10, slot11(slot12))
	slot10 = math
	slot10 = slot10.floor
	slot11 = slot0
	slot11 = slot11.GetCurrent
	slot12 = slot1
	slot13 = "repressReduce"
	slot11 = slot11(slot12, slot13)
	slot11 = slot9 * slot11
	slot10 = slot10(slot11)
	slot9 = slot10

	return slot9
end

slot0.CalculateDamageFromShipToMainShip = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "torpedoPower"
	slot2 = slot2(slot3, slot4)
	slot4 = slot0
	slot3 = slot0.GetHPRate
	slot3 = slot3(slot4)
	slot4 = slot0
	slot4 = slot4.GetCurrent
	slot5 = slot0
	slot6 = "formulaLevel"
	slot4 = slot4(slot5, slot6)
	slot5 = slot0
	slot5 = slot5.GetCurrent
	slot6 = slot1
	slot7 = "formulaLevel"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0
	slot6 = slot6.GetCurrent
	slot7 = slot1
	slot8 = "injureRatio"
	slot6 = slot6(slot7, slot8)
	slot7 = slot1
	slot7 = slot7.SUBMARINE_KAMIKAZE
	slot8 = math
	slot8 = slot8.max
	slot9 = slot7[1]
	slot10 = math
	slot10 = slot10.floor
	slot11 = slot7[2]
	slot11 = slot2 * slot11
	slot12 = slot7[3]
	slot12 = slot4 * slot12
	slot11 = slot11 + slot12
	slot12 = slot7[4]
	slot12 = slot12 + slot6
	slot11 = slot11 * slot12
	slot12 = slot7[5]
	slot12 = slot3 * slot12
	slot13 = slot7[6]
	slot12 = slot12 + slot13
	slot11 = slot11 * slot12
	slot12 = slot7[7]
	slot13 = slot4 - slot5
	slot14 = slot7[8]
	slot13 = slot13 * slot14
	slot12 = slot12 + slot13
	slot11 = slot11 * slot12
	slot8 = slot8(slot9, slot10(slot11))

	return slot8
end

slot0.CalculateDamageFromSubmarinToMainShip = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot1.GetCurrent
	slot2 = slot0
	slot3 = "dodgeRate"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot2 = slot2.MONSTER_SUB_KAMIKAZE_DUAL_K
	slot2 = slot1 + slot2
	slot2 = slot1 / slot2
	slot3 = slot1
	slot3 = slot3.MONSTER_SUB_KAMIKAZE_DUAL_P
	slot2 = slot2 * slot3
	slot3 = slot2
	slot3 = slot3.IsHappen
	slot4 = slot3
	slot4 = slot4.NUM10000
	slot4 = slot2 * slot4

	return slot3(slot4)
end

slot0.RollSubmarineDualDice = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.GetCurrent
	slot3 = slot0
	slot4 = "maxHP"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot3 = slot3.GetCurrent
	slot4 = slot1
	slot5 = "maxHP"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1
	slot4 = slot4.CRASH_RATE
	slot4 = slot4[1]
	slot4 = slot2 * slot4
	slot5 = slot1
	slot5 = slot5.CRASH_RATE
	slot5 = slot5[1]
	slot5 = slot3 * slot5
	slot6 = slot0
	slot6 = slot6.GetCurrent
	slot7 = slot0
	slot8 = "hammerDamageRatio"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0
	slot7 = slot7.GetCurrent
	slot8 = slot1
	slot9 = "hammerDamageRatio"
	slot7 = slot7(slot8, slot9)
	slot8 = slot0
	slot8 = slot8.GetCurrent
	slot9 = slot0
	slot10 = "hammerDamagePrevent"
	slot8 = slot8(slot9, slot10)
	slot9 = slot0
	slot9 = slot9.GetCurrent
	slot10 = slot1
	slot11 = "hammerDamagePrevent"
	slot9 = slot9(slot10, slot11)
	slot10 = math
	slot10 = slot10.sqrt
	slot11 = slot2 * slot3
	slot10 = slot10(slot11)
	slot11 = slot1
	slot11 = slot11.CRASH_RATE
	slot11 = slot11[2]
	slot10 = slot10 * slot11
	slot11 = math
	slot11 = slot11.min
	slot12 = slot4
	slot13 = slot10
	slot11 = slot11(slot12, slot13)
	slot12 = math
	slot12 = slot12.min
	slot13 = slot5
	slot14 = slot10
	slot12 = slot12(slot13, slot14)
	slot13 = math
	slot13 = slot13.floor
	slot14 = 1 + slot7
	slot14 = slot11 * slot14
	slot15 = 1 - slot8
	slot14 = slot14 * slot15
	slot13 = slot13(slot14)
	slot14 = math
	slot14 = slot14.floor
	slot15 = slot0
	slot15 = slot15.GetCurrent
	slot16 = slot0
	slot17 = "repressReduce"
	slot15 = slot15(slot16, slot17)
	slot15 = slot13 * slot15
	slot14 = slot14(slot15)
	slot13 = slot14
	slot14 = math
	slot14 = slot14.floor
	slot15 = 1 + slot6
	slot15 = slot12 * slot15
	slot16 = 1 - slot9
	slot15 = slot15 * slot16
	slot14 = slot14(slot15)
	slot15 = math
	slot15 = slot15.floor
	slot16 = slot0
	slot16 = slot16.GetCurrent
	slot17 = slot1
	slot18 = "repressReduce"
	slot16 = slot16(slot17, slot18)
	slot16 = slot14 * slot16
	slot15 = slot15(slot16)
	slot14 = slot15
	slot15 = slot13
	slot16 = slot14

	return slot15, slot16
end

slot0.CalculateCrashDamage = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot1.SCORE_RATE
	slot1 = slot1[1]
	slot1 = slot0 * slot1

	return slot1
end

slot0.CalculateFleetDamage = slot18

function slot18(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetFlagShip
	slot2 = slot2(slot3)

	if slot1 == slot2 then
		slot2 = slot0
		slot2 = slot2.GetCurrent
		slot3 = slot1
		slot4 = "maxHP"
		slot2 = slot2(slot3, slot4)
		slot3 = slot1
		slot3 = slot3.SCORE_RATE
		slot3 = slot3[2]
		slot2 = slot2 * slot3

		return slot2
	else
		slot2 = slot0
		slot2 = slot2.GetCurrent
		slot3 = slot1
		slot4 = "maxHP"
		slot2 = slot2(slot3, slot4)
		slot3 = slot1
		slot3 = slot3.SCORE_RATE
		slot3 = slot3[3]
		slot2 = slot2 * slot3

		return slot2
	end
end

slot0.CalculateFleetOverDamage = slot18

function slot18(slot0, slot1)
	slot2 = slot1.loadSpeed
	slot3 = slot0
	slot3 = slot3.CalculateReloadTime
	slot4 = slot0
	slot5 = slot2

	return slot3(slot4, slot5)
end

slot0.ReloadTime = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.K1
	slot2 = slot0 / slot2
	slot3 = math
	slot3 = slot3.sqrt
	slot4 = slot0
	slot4 = slot4.K2
	slot4 = slot1 + slot4
	slot5 = slot0
	slot5 = slot5.K3
	slot4 = slot4 * slot5
	slot3 = slot3(slot4)
	slot2 = slot2 / slot3

	return slot2
end

slot0.CalculateReloadTime = slot18

function slot18(slot0, slot1)
	slot2 = math
	slot2 = slot2.sqrt
	slot3 = slot0
	slot3 = slot3.K2
	slot3 = slot1 + slot3
	slot4 = slot0
	slot4 = slot4.K3
	slot3 = slot3 * slot4
	slot2 = slot2(slot3)
	slot2 = slot2 * slot0
	slot3 = slot0
	slot3 = slot3.K1
	slot2 = slot2 * slot3

	return slot2
end

slot0.CaclulateReloaded = slot18

function slot18(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.K1
	slot2 = slot0 / slot2
	slot2 = slot2 / slot1
	slot3 = slot2 * slot2
	slot4 = slot0
	slot4 = slot4.K3
	slot3 = slot3 / slot4
	slot4 = slot0
	slot4 = slot4.K2
	slot3 = slot3 - slot4

	return slot3
end

slot0.CaclulateReloadAttr = slot18

function slot18(slot0)
	slot1 = 0
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.GetTemplateData
		slot7 = slot7(slot8)
		slot7 = slot7.reload_max
		slot1 = slot1 + slot7
	end

	slot2 = #slot0
	slot2 = slot1 / slot2
	slot3 = slot0
	slot1 = slot2 * slot3

	return slot1
end

slot0.CaclulateAirAssistReloadMax = slot18

function slot18(slot0, slot1, slot2, slot3)
	slot4 = slot1.arg_list
	slot5 = slot0
	slot5 = slot5.DOT_CONFIG
	slot6 = slot4.dotType
	slot5 = slot5[slot6]
	slot7 = slot2
	slot6 = slot2.GetAttrByName
	slot8 = slot5.hit
	slot6 = slot6(slot7, slot8)
	slot8 = slot3
	slot7 = slot3.GetAttrByName
	slot9 = slot5.resist
	slot7 = slot7(slot8, slot9)
	slot8 = slot1
	slot8 = slot8.IsHappen
	slot9 = slot2
	slot9 = slot9.NUM1
	slot9 = slot9 + slot6
	slot9 = slot0 * slot9
	slot10 = slot2
	slot10 = slot10.NUM1
	slot10 = slot10 - slot7
	slot9 = slot9 * slot10

	return slot8(slot9)
end

slot0.CaclulateDOTPlace = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0.arg_list
	slot4 = slot0
	slot4 = slot4.DOT_CONFIG
	slot5 = slot3.dotType
	slot4 = slot4[slot5]
	slot6 = slot1
	slot5 = slot1.GetAttrByName
	slot7 = slot4.prolong
	slot5 = slot5(slot6, slot7)
	slot7 = slot2
	slot6 = slot2.GetAttrByName
	slot8 = slot4.shorten
	slot6 = slot6(slot7, slot8)
	slot7 = slot5 - slot6

	return slot7
end

slot0.CaclulateDOTDuration = slot18

function slot18(slot0, slot1, slot2)
	slot3 = slot0.arg_list
	slot4 = slot0
	slot4 = slot4.DOT_CONFIG
	slot5 = slot3.dotType
	slot4 = slot4[slot5]
	slot6 = slot1
	slot5 = slot1.GetAttrByName
	slot7 = slot4.enhance
	slot5 = slot5(slot6, slot7)
	slot7 = slot2
	slot6 = slot2.GetAttrByName
	slot8 = slot4.reduce
	slot6 = slot6(slot7, slot8)
	slot7 = slot5 - slot6
	slot8 = slot1
	slot8 = slot8.PERCENT2
	slot7 = slot7 * slot8

	return slot7
end

slot0.CaclulateDOTDamageEnhanceRate = slot18

function slot18()
	slot0 = 0
	slot1 = {
		false,
		true,
		false
	}

	return slot0, slot1
end

slot0.CalcDamageLock = slot18

function slot18()
	slot0 = 0

	return slot0
end

slot0.CalcDamageLockA2M = slot18

function slot18()
	slot0 = 0

	return slot0
end

slot0.CalcDamageLockS2M = slot18

function slot18()
	slot0 = 0
	slot1 = 0

	return slot0, slot1
end

slot0.CalcDamageLockCrush = slot18

function slot18()
	slot0 = 0
	slot1 = 100000

	return slot0, slot1
end

slot0.UnilateralCrush = slot18

function slot18(slot0)
	slot1 = slot0 * 0.01
	slot1 = 1 - slot1

	return slot1
end

slot0.ChapterRepressReduce = slot18

function slot18(slot0)
	slot1 = 0

	if slot0 <= slot1 then
		slot1 = false

		return slot1
	else
		slot1 = 10000

		if slot0 >= slot1 then
			slot1 = true

			return slot1
		else
			return math.random(10000) <= slot0
		end
	end
end

slot0.IsHappen = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot1.GenerateWeightList
	slot2 = slot0
	slot1, slot2 = slot1(slot2)
	slot3 = slot0
	slot3 = slot3.WeightListRandom
	slot4 = slot1
	slot5 = slot2
	slot3 = slot3(slot4, slot5)

	return slot3
end

slot0.WeightRandom = slot18

function slot18(slot0, slot1)
	slot2 = math
	slot2 = slot2.random
	slot3 = 0
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = pairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot6.min
		slot9 = slot6.max

		if slot8 <= slot2 and slot2 <= slot9 then
			return slot7
		end
	end
end

slot0.WeightListRandom = slot18

function slot18(slot0)
	slot1 = {}
	slot2 = -1
	slot3 = ipairs
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.weight
		slot9 = slot7.rst
		slot10 = slot2 + 1
		slot11 = nil
		slot2 = slot2 + slot8
		slot11 = slot2
		slot12 = {
			min = slot10,
			max = slot11
		}
		slot1[slot12] = slot9
	end

	slot3 = slot1
	slot4 = slot2

	return slot3, slot4
end

slot0.GenerateWeightList = slot18

function slot18(slot0)
	slot1 = ipairs
	slot2 = slot0
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = slot0
		slot6 = slot6.IsHappen
		slot7 = slot5[1]
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = true
			slot7 = slot5[2]

			return slot6, slot7
		end
	end

	slot1 = false
	slot2 = nil

	return slot1, slot2
end

slot0.IsListHappen = slot18

function slot18(slot0, slot1)
	slot2 = math
	slot2 = slot2.rad2Deg
	slot3 = math
	slot3 = slot3.atan2
	slot4 = slot1.z
	slot5 = slot0.z
	slot4 = slot4 - slot5
	slot5 = slot1.x
	slot6 = slot0.x
	slot5 = slot5 - slot6
	slot3 = slot3(slot4, slot5)
	slot2 = slot2 * slot3

	return slot2
end

slot0.BulletYAngle = slot18

function slot18(slot0, slot1)
	slot1 = slot1 or 10
	slot2 = slot0.distance or 10
	slot2 = slot2 * slot2
	slot3 = ys
	slot3 = slot3.Battle
	slot3 = slot3.BattleTargetChoise
	slot3 = slot3.TargetAll
	slot3 = slot3()
	slot4, slot5 = nil
	slot6 = 1
	slot7 = slot1
	slot8 = 1

	for slot9 = slot6, slot7, slot8 do
		slot5 = true
		slot10 = slot0
		slot10 = slot10.RandomPos
		slot11 = slot0
		slot10 = slot10(slot11)
		slot4 = slot10
		slot10 = pairs
		slot11 = slot3
		slot10, slot11, slot12 = slot10(slot11)

		for slot13, slot14 in slot10, slot11, slot12 do
			slot16 = slot14
			slot15 = slot14.GetPosition
			slot15 = slot15(slot16)
			slot16 = Vector3
			slot16 = slot16.SqrDistance
			slot17 = slot4
			slot18 = slot15
			slot16 = slot16(slot17, slot18)

			if slot16 < slot2 then
				slot5 = false

				break
			end
		end

		if slot5 then
			return slot4
		end
	end

	slot6 = nil

	return slot6
end

slot0.RandomPosNull = slot18

function slot18(slot0)
	slot1 = slot0[1] or 0
	slot2 = slot0[2] or 0
	slot3 = slot0[3] or 0
	slot4 = slot0.rangeX

	if not slot4 then
		slot4 = slot0.rangeY

		if not slot4 then
			slot4 = slot0.rangeZ

			if slot4 then
				slot4 = slot0
				slot4 = slot4.RandomPosCenterRange
				slot5 = slot0
				slot4 = slot4(slot5)
				slot5 = Vector3
				slot6 = slot1
				slot7 = slot2
				slot8 = slot3
				slot5 = slot5(slot6, slot7, slot8)
				slot6 = slot5
				slot5 = slot5.Add
				slot7 = slot4

				return slot5(slot6, slot7)
			else
				slot4 = slot0
				slot4 = slot4.RandomPosXYZ
				slot5 = slot0
				slot6 = "X1"
				slot7 = "X2"
				slot4 = slot4(slot5, slot6, slot7)
				slot5 = slot0
				slot5 = slot5.RandomPosXYZ
				slot6 = slot0
				slot7 = "Y1"
				slot8 = "Y2"
				slot5 = slot5(slot6, slot7, slot8)
				slot6 = slot0
				slot6 = slot6.RandomPosXYZ
				slot7 = slot0
				slot8 = "Z1"
				slot9 = "Z2"
				slot6 = slot6(slot7, slot8, slot9)
				slot7 = Vector3
				slot8 = slot1 + slot4
				slot9 = slot2 + slot5
				slot10 = slot3 + slot6

				return slot7(slot8, slot9, slot10)
			end
		end
	end
end

slot0.RandomPos = slot18

function slot18(slot0, slot1, slot2)
	slot1 = slot0[slot1]
	slot2 = slot0[slot2]

	if slot1 and slot2 then
		slot3 = math
		slot3 = slot3.random
		slot4 = slot1
		slot5 = slot2

		return slot3(slot4, slot5)
	else
		slot3 = 0

		return slot3
	end
end

slot0.RandomPosXYZ = slot18

function slot18(slot0)
	slot1 = slot0
	slot1 = slot1.RandomDelta
	slot2 = slot0.rangeX
	slot1 = slot1(slot2)
	slot2 = slot0
	slot2 = slot2.RandomDelta
	slot3 = slot0.rangeY
	slot2 = slot2(slot3)
	slot3 = slot0
	slot3 = slot3.RandomDelta
	slot4 = slot0.rangeZ
	slot3 = slot3(slot4)
	slot4 = Vector3
	slot5 = slot1
	slot6 = slot2
	slot7 = slot3

	return slot4(slot5, slot6, slot7)
end

slot0.RandomPosCenterRange = slot18

function slot18(slot0)
	if slot0 then
		slot1 = 0

		if slot0 > slot1 then
			slot1 = math
			slot1 = slot1.random
			slot2 = slot0 + slot0
			slot1 = slot1(slot2)
			slot1 = slot1 - slot0

			return slot1
		end
	else
		slot1 = 0

		return slot1
	end
end

slot0.RandomDelta = slot18

return
