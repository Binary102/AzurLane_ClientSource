slot0 = class("Equipment", import(".BaseVO"))
slot0.EQUIPMENT_STATE_LOCK = 1
slot0.EQUIPMENT_STATE_EMPTY = 0
slot0.EQUIPMENT_NORMAL = 1
slot0.EQUIPMENT_IMPORTANCE = 2
slot0.PROPERTY = {
	AttributeType.Reload,
	AttributeType.Range,
	AttributeType.Angle,
	AttributeType.Scatter,
	AttributeType.Ammo
}

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.count = defaultValue(slot1.count, 0)
	slot0.new = defaultValue(slot1.new, 0)
	slot0.isSkin = defaultValue(slot1.isSkin, false)
	slot0.skinId = slot1.skinId or 0
	slot2 = pg.equip_data_statistics[slot0.configId]
	slot3 = pg.equip_data_template[slot0.configId]
	slot0.config = setmetatable({}, {
		__index = function (slot0, slot1)
			return slot0[slot1] or slot1[slot1]
		end
	})

	if slot0.config.weapon_id and #slot4 > 0 and pg.weapon_property[slot4[1]] then
		slot0.config.reload = slot5.reload_max
	end
end

function slot0.GetAttributes(slot0)
	slot1 = {}
	slot2 = slot0.config

	for slot6 = 1, 3, 1 do
		slot7 = slot2["attribute_" .. slot6]

		if string.match(slot2["value_" .. slot6], "^[%d|\\.]+$") then
			slot8 = tonumber(slot8)
		end

		slot1[slot6] = (slot7 ~= nil and {
			type = slot7,
			value = slot8
		}) or false
	end

	return slot1
end

function slot0.GetPropertyRate(slot0)
	return slot0.config.property_rate
end

function slot0.vertify(slot0)
	slot2 = pg.equip_data_template[slot0.configId]

	if slot0.config.value_1 ~= pg.equip_data_statistics[slot0.configId].value_1 or slot0.config.value_2 ~= slot1.value_2 then
		return false
	end

	return true
end

function slot0.GetProperties(slot0)
	slot1 = slot0:GetAttributes()
	slot2 = 3

	if slot0.config.type ~= EquipType.Equipment then
		for slot7, slot8 in ipairs(slot0.PROPERTY) do
			slot1[slot2 + slot7] = (slot3[slot8] ~= nil and {
				type = slot8,
				value = slot9
			}) or false
		end
	end

	if slot0:GetSonarProperty() then
		slot1[3] = {
			type = AttributeType.SonarInterval,
			value = slot4[AttributeType.SonarInterval]
		}
		slot1[4] = {
			type = AttributeType.SonarRange,
			value = slot4[AttributeType.SonarRange]
		}
	end

	return slot1
end

function slot0.GetGearScore(slot0)
	return pg.equip_data_by_quality[slot0.config.rarity].gear_score + slot0.config.level * pg.equip_data_by_quality[slot0.config.rarity].gear_score_addition
end

function slot0.GetSkill(slot0)
	slot1 = nil

	if slot0.config.skill_id[1] then
		slot1 = getSkillConfig(slot2)
	end

	return slot1
end

function slot0.GetWeaponID(slot0)
	return config.weapon_id
end

function slot0.GetSonarProperty(slot0)
	slot3 = slot0.config.equip_parameters.interval
	slot4 = slot0.config.equip_parameters.duration

	if slot0.config.equip_parameters.range and slot3 and slot4 then
		return {
			[AttributeType.SonarRange] = slot2,
			[AttributeType.SonarInterval] = slot3,
			[AttributeType.SonarDuration] = slot4
		}
	else
		return nil
	end
end

function slot0.getWeaponCD(slot0)
	return string.format("%0.2f", ys.Battle.BattleFormulas.CalculateReloadTime(slot0.config[AttributeType.Reload], 100))
end

function slot0.canUpgrade(slot0)
	return pg.equip_data_template[slot0].next ~= 0
end

function slot0.hasPrevLevel(slot0)
	return pg.equip_data_template[slot0.configId].prev ~= 0
end

function slot0.getRevertAwards(slot0)
	slot1 = {}
	slot2 = 0
	slot3 = slot0

	while slot3:hasPrevLevel() do
		for slot8, slot9 in ipairs(slot4) do
			slot11 = slot9[2]

			if slot1[slot9[1]] then
				slot1[slot10].count = slot1[slot10].count + slot11
			else
				slot1[slot10] = {
					type = DROP_TYPE_ITEM,
					id = slot10,
					count = slot11
				}
			end
		end

		slot2 = slot2 + slot3.config.trans_use_gold
	end

	if slot2 > 0 then
		slot1[id2ItemId(1)] = {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = slot2
		}
	end

	return slot1
end

function slot0.canEquipSkin(slot0)
	return pg.equip_data_by_type[slot0.config.type].equip_skin == 1
end

function slot0.getRootEquipment(slot0)
	slot1 = nil

	repeat
		slot1 = (not slot1 and slot0) or Equipment.New({
			id = slot1.config.prev
		})
	until not slot1:hasPrevLevel()

	return slot1
end

function slot0.hasSkin(slot0)
	return slot0.skinId and slot0.skinId ~= 0
end

function slot0.setSkinId(slot0, slot1)
	slot0.skinId = slot1
end

function slot0.getSkinId(slot0)
	return slot0.skinId
end

function slot0.isImportance(slot0)
	return slot0.config.important == slot0.EQUIPMENT_IMPORTANCE
end

function slot0.isUnique(slot0)
	return slot0.config.equip_limit ~= 0
end

return slot0
