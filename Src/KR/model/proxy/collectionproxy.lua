slot0 = class("CollectionProxy", import(".NetProxy"))
slot0.AWARDS_UPDATE = "awards update"
slot0.GROUP_INFO_UPDATE = "group info update"
slot0.GROUP_EVALUATION_UPDATE = "group evaluation update"
slot0.MAX_DAILY_EVA_COUNT = 1
slot0.KEY_17001_TIME_STAMP = "KEY_17001_TIME_STAMP"

function slot0.register(slot0)
	slot0.shipGroups = {}
	slot0.awards = {}
	slot0.dailyEvaCount = 0

	slot0:on(17001, function (slot0)
		slot0.shipGroups = {}

		for slot4, slot5 in ipairs(slot0.ship_info_list) do
			if slot5.id < 99999 or slot5.id > 999999 then
				slot0.shipGroups[slot5.id] = ShipGroup.New(slot5)
			end
		end

		for slot4, slot5 in ipairs(slot0.transform_list) do
			if slot0.shipGroups[slot5] then
				slot0.shipGroups[slot5].trans = true
			end
		end

		slot0.awards = {}

		for slot4, slot5 in ipairs(slot0.ship_award_list) do
			table.sort(slot5.award_index)

			slot0.awards[slot5.id] = slot5.award_index[#slot5.award_index]
		end
	end)
	slot0:on(17004, function (slot0)
		slot0.shipGroups[slot0.ship_info.id] = ShipGroup.New(slot0.ship_info)
	end)
end

function slot0.resetEvaCount(slot0)
	for slot4, slot5 in pairs(slot0.shipGroups) do
		if slot5.evaluation then
			slot6.ievaCount = 0
		end
	end
end

function slot0.updateDailyEvaCount(slot0, slot1)
	slot0.dailyEvaCount = slot1
end

function slot0.updateAward(slot0, slot1, slot2)
	slot0.awards[slot1] = slot2

	slot0:sendNotification(slot0.AWARDS_UPDATE, Clone(slot0.awards))
end

function slot0.getShipGroup(slot0, slot1)
	return Clone(slot0.shipGroups[slot1])
end

function slot0.updateShipGroup(slot0, slot1)
	slot0.shipGroups[slot1.id] = Clone(slot1)
end

function slot0.getGroups(slot0)
	return Clone(slot0.shipGroups)
end

function slot0.getAwards(slot0)
	return Clone(slot0.awards)
end

function slot0.hasFinish(slot0)
	for slot5, slot6 in ipairs(pg.storeup_data_template.all) do
		if Favorite.New({
			id = slot6
		}):canGetRes(slot0.shipGroups, slot0.awards) then
			return true
		end
	end

	return false
end

function slot0.getCollectionRate(slot0)
	return string.format("%0.3f", slot0:getCollectionCount() / slot0:getCollectionTotal()), slot0.getCollectionCount(), slot0.getCollectionTotal()
end

function slot0.getCollectionCount(slot0)
	return _.reduce(_.values(slot0.shipGroups), 0, function (slot0, slot1)
		return slot0 + ((Nation.IsLinkType(slot1:getNation()) and 0) or (slot1.trans and 2) or 1)
	end)
end

function slot0.getCollectionTotal(slot0)
	return _.reduce(pg.ship_data_group.all, 0, function (slot0, slot1)
		return slot0 + ((Nation.IsLinkType(ShipGroup.getDefaultShipConfig(slot2).nationality) and 0) or 1)
	end) + #pg.ship_data_trans.all
end

function slot0.getLinkCollectionCount(slot0)
	return _.reduce(_.values(slot0.shipGroups), 0, function (slot0, slot1)
		return slot0 + ((Nation.IsLinkType(slot1:getNation()) and 1) or 0)
	end)
end

function slot0.flushCollection(slot0, slot1)
	slot3 = nil

	if not slot0:getShipGroup(slot1.groupId) then
		slot2 = ShipGroup.New({
			heart_flag = 0,
			heart_count = 0,
			lv_max = 1,
			id = slot1.groupId,
			star = slot1:getStar(),
			marry_flag = (slot1.propose and 1) or 0,
			intimacy_max = slot1.intimacy
		})

		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, slot1.groupId, 1) then
			slot3 = true

			pg.TecToastMgr:GetInstance():tryShow(pg.fleet_tech_ship_template[slot1.groupId].pt_get, pg.fleet_tech_ship_template[slot1.groupId].add_get_shiptype, pg.fleet_tech_ship_template[slot1.groupId].add_get_attr, pg.fleet_tech_ship_template[slot1.groupId].add_get_value)
		end
	else
		if OPEN_TEC_TREE_SYSTEM and table.indexof(pg.fleet_tech_ship_template.all, slot1.groupId, 1) then
			if slot2.star < slot1:getStar() and slot1:getStar() == pg.fleet_tech_ship_template[slot1.groupId].max_star then
				slot3 = true

				pg.TecToastMgr:GetInstance():tryShow(pg.fleet_tech_ship_template[slot1.groupId].pt_upgrage)
			end

			if slot2.maxLV < slot1.level and slot1.level == TechnologyConst.MAX_LV then
				slot3 = true

				pg.TecToastMgr:GetInstance():tryShow(pg.fleet_tech_ship_template[slot1.groupId].pt_level, pg.fleet_tech_ship_template[slot1.groupId].add_level_shiptype, pg.fleet_tech_ship_template[slot1.groupId].add_level_attr, pg.fleet_tech_ship_template[slot1.groupId].add_level_value)
			end
		end

		slot2.star = math.max(slot2.star, slot1:getStar())
		slot2.maxIntimacy = math.max(slot2.maxIntimacy, slot1.intimacy)
		slot2.married = math.max(slot2.married, (slot1.propose and 1) or 0)
		slot2.maxLV = math.max(slot2.maxLV, slot1.level)
	end

	slot0:updateShipGroup(slot2)

	if slot3 then
		getProxy(TechnologyNationProxy):flushData()
	end
end

return slot0
