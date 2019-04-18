slot0 = class("FinishStageCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = getProxy(BayProxy)
	slot4 = getProxy(ChallengeProxy)
	slot5 = slot1:getBody().stageId
	slot7 = pg.battle_cost_template[slot1.getBody().system]

	if slot1:getBody().system == SYSTEM_PROLOGUE or slot6 == SYSTEM_SIMULATION or (slot6 == SYSTEM_PERFORM and slot2.memory) then
		slot0:sendNotification(GAME.FINISH_STAGE_DONE, {
			system = slot6
		})
	elseif slot6 == SYSTEM_DODGEM then
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = ActivityConst.PIG_YEAR_RED_POCKET_SHIP_ID,
			statistics = slot2.statistics,
			arg1 = slot2.statistics._battleScore,
			arg2 = slot2.statistics.dodgemResult.score
		})
	else
		ys.Battle.BattleState.GenerateVertifyData()

		slot8, slot9 = ys.Battle.BattleState.Vertify()

		if not slot8 then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot9
			})

			return
		end

		slot10 = getProxy(FleetProxy)
		slot11 = getProxy(ChapterProxy)
		slot12 = slot2.statistics._battleScore
		slot13 = 0
		slot14 = 0
		slot15 = nil

		if slot6 == SYSTEM_DUEL then
			slot5 = slot2.rivalId
		end

		if slot6 == SYSTEM_SCENARIO then
			slot15 = {}

			for slot22, slot23 in ipairs(slot18) do
				table.insert(slot15, slot23)
			end

			slot19, slot20 = slot16:getFleetCost(slot17)
			slot13 = slot20.gold
			slot14 = slot20.oil

			if slot2.statistics.submarineAid then
				if _.detect(slot16.fleets, function (slot0)
					return slot0:getFleetType() == FleetType.Submarine and slot0:isValid() and slot0:inHuntingRange(slot0.line.row, slot0.line.column)
				end) then
					submarineTeam = slot21:getShipsByTeam(TeamType.Submarine, true)

					for slot25, slot26 in ipairs(submarineTeam) do
						table.insert(slot15, slot26)
					end

					slot14 = slot14 + slot21:getSummonCost()
				else
					print("finish stage error: can not find submarine fleet.")
				end
			end
		elseif slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot15 = slot3:getShipsByFleet(slot10:getActivityFleets()[slot2.actID][slot2.mainFleetId])
			slot13 = slot10.getActivityFleets()[slot2.actID][slot2.mainFleetId].getEndCost(slot18).gold
			slot14 = slot10.getActivityFleets()[slot2.actID][slot2.mainFleetId].getEndCost(slot18).oil

			if slot2.statistics.submarineAid then
				if slot10:getActivityFleets()[slot2.actID][Fleet.SUBMARINE_FLEET_ID] then
					for slot27, slot28 in ipairs(slot23) do
						if slot2.statistics[slot28.id] then
							table.insert(slot15, slot28)

							slot14 = slot14 + slot28:getEndBattleExpend()
						end
					end
				else
					print("finish stage error: can not find submarine fleet.")
				end
			end
		elseif slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot15 = slot3:getShipsByFleet(slot10:getActivityFleets()[slot2.actID][slot2.mainFleetId])
			slot13 = slot10.getActivityFleets()[slot2.actID][slot2.mainFleetId].getEndCost(slot18).gold
			slot14 = slot10.getActivityFleets()[slot2.actID][slot2.mainFleetId].getEndCost(slot18).oil

			if slot2.statistics.submarineAid then
				if slot10:getActivityFleets()[slot2.actID][Fleet.SUBMARINE_FLEET_ID] then
					for slot27, slot28 in ipairs(slot23) do
						if slot2.statistics[slot28.id] then
							table.insert(slot15, slot28)

							slot14 = slot14 + slot28:getEndBattleExpend()
						end
					end
				else
					print("finish stage error: can not find submarine fleet.")
				end
			end
		elseif slot6 == SYSTEM_SHAM then
			slot15 = {}

			for slot22, slot23 in ipairs(slot18) do
				table.insert(slot15, slot23)
			end

			_.each(slot16:getChapterCell(slot17.line.row, slot17.line.column).rival.mainShips, function (slot0)
				table.insert(slot0, slot0)
			end)
			_.each(slot16.getChapterCell(slot17.line.row, slot17.line.column).rival.vanguardShips, function (slot0)
				table.insert(slot0, slot0)
			end)

			slot5 = slot16.getChapterCell(slot17.line.row, slot17.line.column).rival.id
			slot13 = 0
			slot14 = 0
		elseif slot6 == SYSTEM_GUILD then
			slot15 = {}

			for slot22, slot23 in ipairs(slot18) do
				table.insert(slot15, slot23)
			end

			slot13 = 0
			slot14 = 0
		elseif slot6 == SYSTEM_CHALLENGE then
			slot15 = {}

			for slot22, slot23 in ipairs(slot18) do
				table.insert(slot15, slot23)
			end

			slot13 = 0
			slot14 = 0
		elseif slot6 == SYSTEM_PERFORM or slot6 == SYSTEM_SIMULATION then
			slot15 = {}
			slot13 = 0
			slot14 = 0
		else
			slot16 = slot10:getFleetById(slot2.mainFleetId)
			slot15 = slot3:getShipsByFleet(slot16)
			slot13 = slot16:getEndCost().gold
			slot14 = slot16.getEndCost().oil
		end

		if slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot12 = ys.Battle.BattleConst.BattleScore.S
		end

		slot16 = 0
		slot17 = {}
		slot18 = slot6 + slot5 + slot12

		for slot22, slot23 in ipairs(slot15) do
			if slot2.statistics[slot23.id] then
				table.insert(slot17, {
					ship_id = slot24.id,
					hp_rest = math.floor(slot24.bp),
					damage_cause = math.floor(slot24.output),
					damage_caused = math.floor(slot24.damage),
					max_damage_once = math.floor(slot24.maxDamageOnce),
					ship_gear_score = math.floor(slot24.gearScore)
				})

				slot18 = slot18 + slot24.id + math.floor(slot24.bp) + math.floor(slot24.output) + math.floor(slot24.maxDamageOnce)
				slot16 = slot16 + slot23:getShipCombatPower()
			end
		end

		if slot6 == SYSTEM_SHAM then
			for slot22, slot23 in ipairs(slot15) do
				if slot2.statistics._rivalInfo[slot23.id] then
					table.insert(slot17, {
						ship_id = slot24.id,
						hp_rest = slot24.bp,
						damage_cause = 0,
						damage_caused = 0,
						max_damage_once = 0,
						ship_gear_score = 0
					})

					slot18 = slot18 + slot24.id + slot24.bp + 0 + 0
				end
			end
		end

		slot19 = {}

		if slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			for slot23, slot24 in ipairs(slot2.statistics._enemyInfoList) do
				table.insert(slot19, {
					enemy_id = slot24.id,
					damage_taken = slot24.damage,
					total_hp = slot24.totalHp
				})
			end
		end

		if slot6 == SYSTEM_SCENARIO then
			slot21 = slot11:getActiveChapter()

			slot21:writeBack(ys.Battle.BattleConst.BattleScore.C < slot12, slot2)
			slot11:updateChapter(slot21)
		end

		pg.ConnectionMgr.GetInstance():Send(40003, {
			system = slot6,
			data = slot5,
			score = slot12,
			key = math.floor((slot18 % 49993 * slot2.token % 49993) % 49993 + slot2.statistics._totalTime),
			statistics = slot17,
			kill_id_list = slot2.statistics.kill_id_list,
			total_time = slot2.statistics._totalTime,
			bot_percentage = slot2.statistics._botPercentage,
			extra_param = slot16,
			file_check = tostring(math.floor((GetBattleCheck() % 88824 * slot2.token % 88824) % (88824 + math.floor((slot18 % 49993 * slot2.token % 49993) % 49993 + slot2.statistics._totalTime)))),
			enemy_info = slot19
		}, 40004, function (slot0)
			if slot0.result == 0 or slot0.result == 1030 then
				if slot0 == SYSTEM_PERFORM or slot0 == SYSTEM_SIMULATION then
					slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
						system = slot0,
						exitCallback = slot2.exitCallback
					})

					return
				end

				slot1 = false

				if slot0 == SYSTEM_SCENARIO and getProxy(ChapterProxy):getActiveChapter().getPlayType(slot2) == ChapterConst.TypeExtra then
					slot1 = true
				end

				if slot3.end_sink_cost > 0 and not slot1 then
					slot2 = pg.gameset.battle_dead_energy.key_value

					for slot6, slot7 in ipairs(slot4) do
						if slot2.statistics[slot7.id] and slot8.bp == 0 then
							slot9 = slot5:getShipById(slot7.id)

							slot9:cosumeEnergy(slot2)
							slot5:updateShip(slot9)
						end
					end
				end

				slot2 = getProxy(PlayerProxy)

				if prefabFleet ~= nil then
					for slot6, slot7 in ipairs(prefabFleet) do
						prefabFleet[slot6] = Ship.New(slot7)
					end
				else
					slot1.addShipsExp(slot0.ship_exp_list, slot2.statistics, slot0 == SYSTEM_SCENARIO or slot0 == SYSTEM_ROUTINE or slot0 == SYSTEM_ACT_BOSS)

					slot1.commanderExpList = slot1:addCommanderExp(slot0.commander_exp)
				end

				slot2.statistics.mvpShipID = slot0.mvp
				slot3 = {}

				for slot7, slot8 in ipairs(slot0.drop_info) do
					table.insert(slot3, Item.New(slot8))

					if Item.New(slot8).type == DROP_TYPE_SHIP then
						slot9.virgin = getProxy(CollectionProxy) and slot11.shipGroups[pg.ship_data_template[slot9.id].group_type] == nil
					end

					slot1:sendNotification(GAME.ADD_ITEM, slot9)
				end

				slot2:getData().addExp(slot4, slot0.player_exp)

				slot5 = ys.Battle.BattleConst.BattleScore.C < slot4

				if slot0 == SYSTEM_ROUTINE and slot5 then
					slot6 = getProxy(DailyLevelProxy)
					slot6.data[slot6.dailyLevelId] = (slot6.data[slot6.dailyLevelId] or 0) + 1
				elseif slot0 == SYSTEM_ACT_BOSS and slot5 and getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot7:isEnd() then
					slot7:updateKVPList(1, slot7, slot7:getKVPList(1, slot7) + 1)
					slot7:updateDataList(slot7)
					slot6:updateActivity(slot7)
				end

				if slot0 == SYSTEM_DUEL then
					slot7 = ys.Battle.BattleConfig.ARENA_LIST[math.random(#ys.Battle.BattleConfig.ARENA_LIST)]

					getProxy(MilitaryExerciseProxy):reduceExerciseCount()
				end

				if slot3.oil_cost > 0 and slot5 then
					slot4:consume({
						oil = slot8,
						gold = slot8
					})
				end

				if slot3.attack_count > 0 and not slot1 then
					if slot3.attack_count == 1 then
						slot4:increaseAttackCount()

						if slot5 then
							slot4:increaseAttackWinCount()
						end
					elseif slot3.attack_count == 2 then
						slot4:increasePvpCount()

						if slot5 then
							slot4:increasePvpWinCount()
						end
					end
				end

				slot2:updatePlayer(slot4)
				slot6(slot1, GAME.FINISH_STAGE_DONE, {
					system = slot0,
					statistics = slot2.statistics,
					score = slot6,
					drops = slot3,
					prefabFleet = prefabFleet,
					commanderExps = slot1.commanderExpList or {},
					result = slot0.result
				})

				if slot0 == SYSTEM_SCENARIO then
					slot10:updateActiveChapterShips()
					slot10:getActiveChapter().writeDrops(slot6, slot3)

					slot8 = nil

					for slot12, slot13 in ipairs(slot7) do
						if slot13:isUnlock() then
							slot8 = slot13.id
						end
					end

					slot10:updateChapter(slot6)

					slot9 = nil

					for slot13, slot14 in ipairs(slot7) do
						if slot14:isUnlock() then
							slot9 = slot14.id
						end
					end

					if Map.lastMap and slot9 ~= slot8 and slot8 < slot9 then
						Map.autoNextPage = true
					end
				elseif slot0 == SYSTEM_SHAM then
					slot10:updateShamChapterShips()

					slot6 = slot10:getShamChapter()

					slot6:writeBack(slot5, slot2)
					slot10:updateShamChapter(slot6)
				elseif slot0 == SYSTEM_GUILD then
					slot10:updateGuildChapterShips()

					slot6 = slot10:getGuildChapter()

					slot6:writeBack(slot5, slot2)
					slot10:updateGuildChapter(slot6)
				elseif slot0 == SYSTEM_CHALLENGE then
					slot11:updateActiveChallengeShips()

					function slot8(slot0)
						if slot0.statistics[slot0.id] then
							slot1:updateShipHp(slot0.id, slot1.bp)
						end
					end

					for slot12, slot13 in pairs(slot11:getCurrentChallengeInfo().fleet.ships) do
						slot8(slot13)
					end

					slot11:updateChallenge(slot6)
				end
			else
				print("stage_finishStage error--" .. slot0.result)
				pg.TipsMgr:GetInstance():ShowTips(errorTip("stage_finishStage", slot0.result))
			end
		end)
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

function slot0.addCommanderExp(slot0, slot1)
	slot2 = {}
	slot3 = getProxy(CommanderProxy)

	for slot7, slot8 in ipairs(slot1) do
		slot11 = slot3:getCommanderById(slot9)

		slot11:addExp(slot10)
		slot3:updateCommander(slot11)

		if slot11:isMaxLevel() then
			table.insert(slot2, {
				exp = 0,
				commander_id = slot9
			})
		else
			table.insert(slot2, {
				commander_id = slot9,
				exp = slot8.exp
			})
		end
	end

	return slot2
end

return slot0
