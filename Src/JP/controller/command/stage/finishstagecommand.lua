slot0 = class("FinishStageCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().system

	if slot0.CheaterVertify() then
		return
	end

	ys.Battle.BattleGate.Gates[slot3].Exit(slot2, slot0)
end

function slot0.CheaterVertify()
	ys.Battle.BattleState.GenerateVertifyData()

	slot0, slot1 = ys.Battle.BattleState.Vertify()

	if not slot0 then
		pg.m02:sendNotification(GAME.CHEATER_MARK, {
			reason = slot1
		})
	end

	return not slot0
end

function slot0.GeneralPackage(slot0, slot1)
	slot2 = 0
	slot3 = {}
	slot5 = nil
	slot7 = slot0.system + ((slot0.system ~= SYSTEM_DUEL or slot0.rivalId) and slot0.stageId) + slot0.statistics._battleScore

	for slot11, slot12 in ipairs(slot1) do
		if slot0.statistics[slot12.id] then
			table.insert(slot3, {
				ship_id = slot13.id,
				hp_rest = math.floor(slot13.bp),
				damage_cause = math.floor(slot13.output),
				damage_caused = math.floor(slot13.damage),
				max_damage_once = math.floor(slot13.maxDamageOnce),
				ship_gear_score = math.floor(slot13.gearScore)
			})

			slot7 = slot7 + slot13.id + math.floor(slot13.bp) + math.floor(slot13.output) + math.floor(slot13.maxDamageOnce)
			slot2 = slot2 + slot12:getShipCombatPower()
		end
	end

	return {
		system = slot4,
		data = slot5,
		score = slot6,
		key = math.floor((slot7 % 49993 * slot0.token % 49993) % 49993 + slot0.statistics._totalTime),
		statistics = slot3,
		kill_id_list = slot0.statistics.kill_id_list,
		total_time = slot0.statistics._totalTime,
		bot_percentage = slot0.statistics._botPercentage,
		extra_param = slot2,
		file_check = tostring(math.floor((GetBattleCheck() % 88824 * slot0.token % 88824) % (88824 + math.floor((slot7 % 49993 * slot0.token % 49993) % 49993 + slot0.statistics._totalTime)))),
		enemy_info = {},
		data2 = {}
	}
end

function slot0.SendRequest(slot0, slot1, slot2)
	pg.ConnectionMgr.GetInstance():Send(40003, slot1, 40004, function (slot0)
		if slot0.result == 0 or slot0.result == 1030 then
			slot0(slot0)
		else
			slot1:RequestFailStandardProcess(slot0)
		end
	end)
end

function slot0.RequestFailStandardProcess(slot0, slot1)
	if slot1.result == 2 then
		print("stage_finishStage error--" .. slot1.result)
		pg.TipsMgr:GetInstance():ShowTips(errorTip("stage_finishStage", slot1.result))
		slot0:sendNotification(GAME.FINISH_STAGE_ERROR, {})
	else
		print("stage_finishStage error--" .. slot1.result)
		pg.TipsMgr:GetInstance():ShowTips(errorTip("stage_finishStage", slot1.result))
	end
end

function slot0.addShipsExp(slot0, slot1, slot2)
	slot3 = getProxy(BayProxy)
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in ipairs(slot0) do
		slot11 = slot10.ship_id
		slot12 = slot10.exp or 0
		slot13 = slot10.intimacy

		if slot1[slot11] then
			slot3:getShipById(slot11):addExp(slot12, slot2)

			if slot13 then
				slot14:addLikability(slot13 - 10000)
			end

			slot3:updateShip(slot14)
		end
	end
end

function slot0.DeadShipEnergyCosume(slot0, slot1)
	slot2 = pg.gameset.battle_dead_energy.key_value
	slot3 = getProxy(BayProxy)

	for slot7, slot8 in ipairs(slot1) do
		if slot0.statistics[slot8.id] and slot9.bp == 0 then
			slot10 = slot3:getShipById(slot8.id)

			slot10:cosumeEnergy(slot2)
			slot3:updateShip(slot10)
		end
	end
end

function slot0.GeneralPlayerCosume(slot0, slot1, slot2, slot3, slot4)
	getProxy(PlayerProxy).getData(slot5).addExp(slot6, slot3)

	if pg.battle_cost_template[slot0].oil_cost > 0 and slot1 then
		slot6:consume({
			gold = 0,
			oil = slot2
		})
	end

	if slot7.attack_count > 0 and not slot4 then
		if slot7.attack_count == 1 then
			slot6:increaseAttackCount()

			if slot1 then
				slot6:increaseAttackWinCount()
			end
		elseif slot7.attack_count == 2 then
			slot6:increasePvpCount()

			if slot1 then
				slot6:increasePvpWinCount()
			end
		end
	end

	slot5:updatePlayer(slot6)
end

function slot0.GeneralLoot(slot0, slot1)
	slot2 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.drop_info) do
		table.insert(slot2, Item.New(slot8))

		if Item.New(slot8).type == DROP_TYPE_SHIP then
			slot9.virgin = getProxy(CollectionProxy) and slot11.shipGroups[pg.ship_data_template[slot9.id].group_type] == nil
		end

		slot0:sendNotification(GAME.ADD_ITEM, slot9)
	end

	for slot7, slot8 in ipairs(slot1.extra_drop_info) do
		table.insert(slot3, slot9)
		slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot8))
	end

	return slot2, slot3
end

function slot0.ScenarioCommanderExp(slot0)
	slot2 = getProxy(CommanderProxy)
	slot3 = getProxy(ChapterProxy):getActiveChapter().fleet:getCommanders()
	slot4 = {}

	for slot8, slot9 in ipairs(slot1) do
		slot12 = slot2:getCommanderById(slot10)
		slot13 = slot12.exp

		slot12:addExp(slot11)
		slot2:updateCommander(slot12)

		if slot12:isMaxLevel() then
			table.insert(slot4, {
				exp = 0,
				commander_id = slot10,
				curExp = slot13
			})
		else
			table.insert(slot4, {
				commander_id = slot10,
				exp = slot9.exp,
				curExp = slot13
			})
		end
	end

	slot5 = {}
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in pairs(slot3) do
		table.insert(slot7, slot12.id)
	end

	for slot11, slot12 in ipairs(slot4) do
		if table.contains(slot7, slot12.commander_id) then
			table.insert(slot5, slot12)
		else
			table.insert(slot6, slot12)
		end
	end

	return {
		surfaceCMD = slot5,
		submarineCMD = slot6
	}
end

return slot0
