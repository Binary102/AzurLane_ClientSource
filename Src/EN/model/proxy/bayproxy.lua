slot0 = class("BayProxy", import(".NetProxy"))
slot0.SHIP_ADDED = "ship added"
slot0.SHIP_REMOVED = "ship removed"
slot0.SHIP_UPDATED = "ship updated"
slot0.SHIP_SKINS_UPDATE = "ship skins update"

function slot0.register(slot0)
	slot0:on(12001, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.shiplist) do
			slot6 = Ship.New(slot5)

			slot6:display("loaded")

			if slot6:getConfigTable() then
				slot0.data[slot6.id] = slot6

				slot1.recordShipLevelVertify(slot6)
			else
				warning("不存在的角色: " .. slot6.id)
			end
		end
	end)
	slot0:on(12031, function (slot0)
		slot0.energyRecoverTime = slot0.energy_auto_increase_time + Ship.ENERGY_RECOVER_TIME

		slot0:addEnergyListener(slot0.energyRecoverTime - pg.TimeMgr.GetInstance():GetServerTime())
	end)
	slot0:on(12010, function (slot0)
		slot2 = getProxy(PlayerProxy).getInited(slot1)
		slot3 = 0
		slot0.newShipList = {}

		for slot7, slot8 in ipairs(slot0.ship_list) do
			if Ship.New(slot8):getConfigTable() then
				slot0:addShip(slot9, false)

				if slot2 then
					slot3 = slot3 + 1
				end

				slot0.newShipList[#slot0.newShipList + 1] = slot9
			else
				warning("不存在的角色: " .. slot9.id)
			end
		end

		if slot3 > 0 then
			slot0:countShip(slot3)
		end
	end)

	slot1 = getProxy(PlayerProxy)

	slot0:on(12019, function (slot0)
		slot1 = slot0:getData()
		slot2 = slot1:getShipById(slot1.character)

		slot2:setLikability(slot0.intimacy)
		slot1:updateShip(slot2)
	end)

	slot0.skins = {}
	slot0.oldSkins = {}

	slot0:on(12201, function (slot0)
		slot0.skins = _.map(slot0.skins, function (slot0)
			return slot0
		end)
	end)

	slot0.handbookTypeAssign = {}

	slot0:buildHandbookTypeAssign()
end

function slot0.buildHandbookTypeAssign(slot0)
	for slot5, slot6 in ipairs(slot1) do
		slot0.handbookTypeAssign[pg.ship_data_group[slot6].group_type] = pg.ship_data_group[slot6].handbook_type
	end
end

function slot0.recoverAllShipEnergy(slot0)
	slot1 = getProxy(DormProxy)
	slot2 = pg.energy_template[4].lower_bound - 2
	slot3 = pg.energy_template[4].upper_bound

	for slot7, slot8 in pairs(slot0.data) do
		if slot8.state == Ship.STATE_REST or slot8.state == Ship.STATE_TRAIN then
			slot10 = slot8:getRecoverEnergyPoint() + Ship.BACKYARD_1F_ENERGY_ADDITION

			if slot8.state == Ship.STATE_REST then
				slot10 = slot9 + Ship.BACKYARD_2F_ENERGY_ADDITION
			end

			if slot3 > slot8.energy + slot10 then
				slot8:addEnergy(slot10)
			else
				slot8:setEnergy(slot3)
			end
		elseif slot2 > slot8.energy + slot8:getRecoverEnergyPoint() then
			slot8:addEnergy(slot8:getRecoverEnergyPoint())
		elseif slot2 < slot8.energy then
			slot8:setEnergy(slot8.energy)
		else
			slot8:setEnergy(slot2)
		end

		slot0:updateShip(slot8)
	end
end

function slot0.addEnergyListener(slot0, slot1)
	if slot1 <= 0 then
		slot0:recoverAllShipEnergy()
		slot0:addEnergyListener(Ship.ENERGY_RECOVER_TIME)

		return
	end

	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end

	slot0.energyTimer = Timer.New(function ()
		slot0:recoverAllShipEnergy()
		slot0.recoverAllShipEnergy:addEnergyListener(Ship.ENERGY_RECOVER_TIME)
	end, slot1, 1)

	slot0.energyTimer:Start()
end

function slot0.remove(slot0)
	if slot0.energyTimer then
		slot0.energyTimer:Stop()

		slot0.energyTimer = nil
	end
end

function slot0.recordShipLevelVertify(slot0)
	if slot0 then
		ys.BattleShipLevelVertify[slot0.id] = slot0.generateLevelVertify(slot0.level)
	end
end

function slot0.checkShiplevelVertify(slot0)
	if slot0.generateLevelVertify(slot0.level) == ys.BattleShipLevelVertify[slot0.id] then
		return true
	else
		return false
	end
end

function slot0.generateLevelVertify(slot0)
	return (slot0 + 1114) * 824
end

function slot0.addShip(slot0, slot1, slot2)
	slot0.data[slot1.id] = slot1:clone()

	slot0.recordShipLevelVertify(slot1)

	if defaultValue(slot2, true) then
		slot0:countShip()
	end

	if getProxy(CollectionProxy) and not slot1:isActivityNpc() then
		slot3:flushCollection(slot1)
	end

	slot0.facade:sendNotification(slot0.SHIP_ADDED, slot1:clone())
end

function slot0.countShip(slot0, slot1)
	slot2 = getProxy(PlayerProxy)
	slot3 = slot2:getData()

	slot3:increaseShipCount(slot1)
	slot2:updatePlayer(slot3)
end

function slot0.getNewShip(slot0, slot1)
	slot1 = slot1 or true
	slot2 = slot0.newShipList or {}

	if slot1 then
		slot0.newShipList = nil
	end

	return slot2
end

function slot0.getShipsByFleet(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1:getShipIds()) do
		table.insert(slot2, slot0.data[slot7])
	end

	return Clone(slot2)
end

function slot0.getSortShipsByFleet(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.mainShips) do
		table.insert(slot2, slot0.data[slot7])
	end

	for slot6, slot7 in ipairs(slot1.vanguardShips) do
		table.insert(slot2, slot0.data[slot7])
	end

	return Clone(slot2)
end

function slot0.getShipByTeam(slot0, slot1, slot2)
	slot3 = {}

	if slot2 == TeamType.Vanguard then
		for slot7, slot8 in ipairs(slot1.vanguardShips) do
			table.insert(slot3, slot0.data[slot8])
		end
	elseif slot2 == TeamType.Main then
		for slot7, slot8 in ipairs(slot1.mainShips) do
			table.insert(slot3, slot0.data[slot8])
		end
	elseif slot2 == TeamType.Submarine then
		for slot7, slot8 in ipairs(slot1.subShips) do
			table.insert(slot3, slot0.data[slot8])
		end
	end

	return Clone(slot3)
end

function slot0.getShipsByTypes(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if table.contains(slot1, slot7:getShipType()) then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getShipsByStatus(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.status == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getConfigShipCount(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.configId == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

function slot0.getShips(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		table.insert(slot1, slot6)
	end

	return Clone(slot1)
end

function slot0.getShipCount(slot0)
	return table.getCount(slot0.data)
end

function slot0.getShipById(slot0, slot1)
	if slot0.data[slot1] ~= nil then
		return slot0.data[slot1]:clone()
	end
end

function slot0.updateShip(slot0, slot1)
	if slot1.isNpc then
		return
	end

	slot0.data[slot1.id] = slot1:clone()

	slot0.recordShipLevelVertify(slot1)

	if (slot0.data[slot1.id].getStar(slot2) < slot1:getStar() or slot2.intimacy < slot1.intimacy or (not slot2.propose and slot1.propose)) and getProxy(CollectionProxy) then
		slot3:flushCollection(slot1)
	end

	slot0.facade:sendNotification(slot0.SHIP_UPDATED, slot1:clone())
end

function slot0.removeShip(slot0, slot1)
	slot0:removeShipById(slot1.id)
end

function slot0.getEquipment2ByflagShip(slot0)
	return slot0:getShipById(getProxy(PlayerProxy).getData(slot1).character):getEquip(2)
end

function slot0.removeShipById(slot0, slot1)
	slot0.data[slot0.data[slot1].id] = nil

	slot0.data[slot1].display(slot2, "removed")
	slot0.facade:sendNotification(slot0.SHIP_REMOVED, slot0.data[slot1])
end

function slot0.findShipByGroup(slot0, slot1)
	for slot5, slot6 in pairs(slot0.data) do
		if slot6.groupId == slot1 then
			return slot6
		end
	end

	return nil
end

function slot0.findShipsByGroup(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.groupId == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getSameGroupShipCount(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.data) do
		if slot7.groupId == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

function slot0.getBayPower(slot0)
	slot1 = {}
	slot2 = 0

	for slot6, slot7 in pairs(slot0.data) do
		slot8 = slot7.configId
		slot9 = slot7:getShipCombatPower()

		if defaultValue(slot0.handbookTypeAssign[slot7:getGroupId()], 0) ~= 1 and (not slot1[slot8] or slot1[slot8] < slot9) then
			slot1[slot8] = slot9
			slot2 = slot2 - defaultValue(slot1[slot8], 0) + slot9
		end
	end

	return math.floor(slot2)
end

function slot0.getSkinList(slot0)
	return Clone(slot0.skins)
end

function slot0.getOldSkinList(slot0)
	return Clone(slot0.oldSkins)
end

function slot0.setSkinList(slot0, slot1)
	slot0.oldSkins = Clone(slot0.skins)
	slot0.skins = Clone(slot1)

	slot0.facade:sendNotification(slot0.SHIP_SKINS_UPDATE)
end

function slot0.addSkin(slot0, slot1)
	slot0.oldSkins = Clone(slot0.skins)

	table.insert(slot0.skins, slot1)
	slot0.facade:sendNotification(slot0.SHIP_SKINS_UPDATE)
end

function slot0.removeSkinById(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.skins) do
		if slot6 == slot1 then
			table.remove(slot0.skins, slot5)

			break
		end
	end
end

function slot0.hasSkin(slot0, slot1)
	return table.contains(slot0.skins, slot1)
end

function slot0.hasOldSkin(slot0, slot1)
	return table.contains(slot0.oldSkins, slot1)
end

function slot0.getSkinCountById(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.skins) do
		if slot7 == slot1 then
			slot2 = slot2 + 1
		end
	end

	return slot2
end

function slot0.getEquipsInShips(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot0.data) do
		if not slot1 or slot1.id ~= slot8.id then
			for slot12, slot13 in pairs(slot8.equipments) do
				if slot13 and (not slot1 or not slot2 or not slot1:isForbiddenAtPos(slot13, slot2)) then
					slot13.shipId = slot8.id
					slot13.shipPos = slot12

					table.insert(slot3, slot13)
				end
			end
		end
	end

	return Clone(slot3)
end

function slot0.getEquipmentSkinInShips(slot0, slot1, slot2)
	slot3 = {}

	function slot4(slot0)
		return _.any(pg.equip_skin_template[slot0].equip_type, function (slot0)
			return slot0 == slot0
		end)
	end

	for slot8, slot9 in pairs(slot0.data) do
		if not slot1 or slot1.id ~= slot9.id then
			for slot13, slot14 in pairs(slot9.equipments) do
				if slot14 and slot14:hasSkin() and slot4(slot14.skinId, slot2) then
					table.insert(slot3, {
						id = slot14.skinId,
						shipId = slot9.id,
						shipPos = slot13
					})
				end
			end
		end
	end

	return Clone(slot3)
end

function slot0.setSelectShipId(slot0, slot1)
	slot0.selectShipId = slot1
end

function slot0.getProposeGroupList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		if slot6.propose then
			slot1[slot6.groupId] = true
		end
	end

	return slot1
end

function slot0.getEliteRecommendShip(slot0, slot1, slot2)
	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		slot4[slot9] = slot9:getShipCombatPower()
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0[slot0] < slot0[slot1]
	end)

	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		slot5[#slot5 + 1] = slot0.data[slot10]:getGroupId()
	end

	slot6 = getProxy(EventProxy):getActiveShipIds()
	slot7 = #slot3
	slot8 = nil

	while slot7 > 0 do
		slot11 = slot3[slot7].getGroupId(slot9)

		if not table.contains(slot6, slot3[slot7].id) and not table.contains(slot2, slot10) and not table.contains(slot5, slot11) then
			slot8 = slot9

			break
		else
			slot7 = slot7 - 1
		end
	end

	return slot8
end

function slot0.getChallengeRecommendShip(slot0, slot1, slot2)
	table.sort(slot3, function (slot0, slot1)
		return slot0:getShipCombatPower() < slot1:getShipCombatPower()
	end)

	slot4 = {}
	slot5 = {}

	for slot9, slot10 in ipairs(slot2) do
		slot4[#slot4 + 1] = slot0.data[slot10].getGroupId(slot11)

		if slot5[Challenge.shipTypeFixer(slot0.data[slot10]:getShipType())] == nil then
			slot5[slot12] = 0
		end

		slot5[slot12] = slot5[slot12] + 1
	end

	slot6 = #slot3
	slot7 = nil

	while slot6 > 0 do
		slot9 = slot3[slot6].id
		slot10 = slot3[slot6].getGroupId(slot8)

		if slot5[Challenge.shipTypeFixer(slot3[slot6]:getShipType())] == nil then
			slot5[slot11] = 0
		end

		if slot5[slot11] < Challenge.SAME_TYPE_LIMIT and not table.contains(slot2, slot9) and not table.contains(slot4, slot10) then
			slot7 = slot8

			break
		else
			slot6 = slot6 - 1
		end
	end

	return slot7
end

function slot0.getActivityRecommendShips(slot0, slot1, slot2, slot3)
	slot5 = {}

	for slot9, slot10 in ipairs(slot4) do
		slot5[slot10] = slot10:getShipCombatPower()
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0[slot0] < slot0[slot1]
	end)

	slot6 = {}

	for slot10, slot11 in ipairs(slot2) do
		slot6[#slot6 + 1] = slot0.data[slot11]:getGroupId()
	end

	slot7 = getProxy(EventProxy):getActiveShipIds()
	slot8 = #slot4
	slot9 = {}

	while slot8 > 0 and slot3 > 0 do
		slot12 = slot4[slot8].getGroupId(slot10)

		if not table.contains(slot2, slot4[slot8].id) and not table.contains(slot7, slot11) and not table.contains(slot6, slot12) then
			table.insert(slot9, slot10)
			table.insert(slot6, slot12)

			slot3 = slot3 - 1
		end

		slot8 = slot8 - 1
	end

	return slot9
end

function slot0.getDelegationRecommendShips(slot0, slot1)
	slot3 = math.max(slot1.template.ship_lv, 2)

	table.sort(slot5, function (slot0, slot1)
		return slot1.level < slot0.level
	end)

	slot6 = {}
	slot7 = false

	for slot11, slot12 in ipairs(slot4) do
		if slot3 <= slot0.data[slot12].level then
			slot7 = true
		end

		slot6[#slot6 + 1] = slot13:getGroupId()
	end

	slot8 = getProxy(EventProxy):getActiveShipIds()
	slot9 = getProxy(FleetProxy):getAllShipIds()
	slot10 = {}

	for slot15, slot16 in ipairs(slot11) do
		for slot20, slot21 in pairs(slot16:getChapters()) do
			for slot25, slot26 in ipairs(slot21:getInEliteShipIDs()) do
				table.insert(slot10, slot26)
			end

			break
		end
	end

	slot12 = {}

	for slot17, slot18 in ipairs(slot13) do
		for slot22, slot23 in pairs(slot18:getChapters()) do
			for slot27, slot28 in ipairs(slot23:getInEliteShipIDs()) do
				table.insert(slot12, slot28)
			end
		end
	end

	slot14 = {}

	for slot20, slot21 in pairs(slot16) do
		for slot25, slot26 in pairs(slot21) do
			for slot31, slot32 in ipairs(slot27) do
				table.insert(slot14, slot32)
			end
		end
	end

	if slot7 then
		slot3 = 2
	end

	slot17 = #slot5
	slot18 = nil

	while slot17 > 0 do
		slot20 = slot5[slot17].id
		slot21 = slot5[slot17].getGroupId(slot19)

		if slot3 <= slot5[slot17].level and slot19.lockState ~= Ship.LOCK_STATE_UNLOCK and not table.contains(slot4, slot20) and not table.contains(slot8, slot20) and not table.contains(slot9, slot20) and not table.contains(slot10, slot20) and not table.contains(slot12, slot20) and not table.contains(slot14, slot20) and not table.contains(slot6, slot21) then
			slot18 = slot19

			break
		else
			slot17 = slot17 - 1
		end
	end

	return slot18
end

function slot0.fileterShips(slot0, slot1)
	slot2 = {}

	if defaultValue(slot1.inChapter, false) and getProxy(ChapterProxy):getActiveChapter() then
		_.each(slot5:getShips(), function (slot0)
			table.insert(slot0, slot0.id)
		end)
	end

	if defaultValue(slot1.inSham, false) and getProxy(ChapterProxy):getShamChapter() and slot6:isOpen() and slot6.active then
		_.each(slot6:getShips(), function (slot0)
			table.insert(slot0, slot0.id)
		end)
	end

	if defaultValue(slot1.inChallenge, false) and getProxy(ChallengeProxy):getCurrentChallengeInfo() then
		_.each(slot7:getShips(), function (slot0)
			table.insert(slot0, slot0.id)
		end)
	end

	slot7 = defaultValue(slot1.inPvp, false)

	if defaultValue(slot1.inFleet, false) then
		for slot13, slot14 in ipairs(slot9) do
			if slot0.data[slot14] and (slot15:getFleetId() ~= FleetProxy.PVP_FLEET_ID or not not slot7) then
				table.insert(slot2, slot14)
			end
		end
	end

	if defaultValue(slot1.inBackyard, false) then
		for slot14, slot15 in pairs(slot10) do
			table.insert(slot2, slot14)
		end
	end

	if defaultValue(slot1.inClass, false) then
		for slot15, slot16 in ipairs(slot11) do
			table.insert(slot2, slot16)
		end
	end

	if defaultValue(slot1.inTactics, false) then
		for slot16, slot17 in pairs(slot12) do
			table.insert(slot2, slot17.shipId)
		end
	end

	if defaultValue(slot1.inEvent, false) then
		for slot17, slot18 in ipairs(slot13) do
			table.insert(slot2, slot18)
		end
	end

	if defaultValue(slot1.inAdmiral, false) then
		table.insert(slot2, getProxy(PlayerProxy):getData().character)
	end

	if defaultValue(slot1.inExercise, false) then
		for slot19, slot20 in pairs(getProxy(MilitaryExerciseProxy).getExerciseFleet(slot14).vanguardShips) do
			table.insert(slot2, slot20)
		end

		for slot19, slot20 in pairs(slot15.mainShips) do
			table.insert(slot2, slot20)
		end
	end

	if defaultValue(slot1.isActivityNpc, false) then
		for slot18, slot19 in pairs(slot0.data) do
			if slot19:isActivityNpc() and not table.contains(slot2, slot19.id) then
				table.insert(slot2, slot19.id)
			end
		end
	end

	return slot2
end

function slot0.getBlackBlackShipIds(slot0, slot1, slot2)
	slot3 = {}

	if slot1 == FormationMediator.__cname or slot1 == PreCombatMediator.__cname then
		slot3 = slot0:fileterShips({
			inEvent = true
		})
		slot7 = slot0.data[slot2.activeShipId]
		slot9 = getProxy(FleetProxy):getFleetById(slot4).getTeamByName(slot8, slot5)

		for slot13, slot14 in pairs(slot0.data) do
			for slot18, slot19 in pairs(slot9) do
				slot20 = slot0.data[slot19]

				if slot7 and slot7:isSameKind(slot14) then
				elseif slot20:isSameKind(slot14) and slot20.id ~= slot14.id then
					table.insert(slot3, slot14.id)
				end
			end
		end
	elseif slot1 == EventMediator.__cname then
		slot3 = slot0:fileterShips({
			inSham = true,
			inChapter = true,
			inChallenge = true,
			inEvent = true
		})
	elseif slot1 == BackYardShipInfoMediator.__cname then
		slot3 = slot0:fileterShips({
			inClass = true
		})
	elseif slot1 == ClassMediator.__cname then
		slot3 = slot0:fileterShips({
			inClass = true,
			inBackyard = true
		})
	end

	return slot3
end

return slot0
