slot0 = class("FinishStageCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = getProxy(BayProxy)
	slot4 = getProxy(ChallengeProxy)
	slot5 = slot1:getBody().stageId
	slot7 = pg.battle_cost_template[slot1.getBody().system]
	slot8 = {}

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
	elseif slot6 == SYSTEM_SUBMARINE_RUN then
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = ActivityConst.SUB_RED_POCKET,
			statistics = slot2.statistics,
			arg1 = slot2.statistics._battleScore,
			arg2 = slot2.statistics.subRunResult.score
		})
	else
		ys.Battle.BattleState.GenerateVertifyData()

		slot9, slot10 = ys.Battle.BattleState.Vertify()

		if not slot9 then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot10
			})

			return
		end

		slot11 = getProxy(FleetProxy)
		slot12 = getProxy(ChapterProxy)
		slot13 = slot2.statistics._battleScore
		slot14 = 0
		slot15 = 0
		slot16 = nil

		if slot6 == SYSTEM_DUEL then
			slot5 = slot2.rivalId
		end

		if slot6 == SYSTEM_SCENARIO then
			slot16 = {}

			for slot23, slot24 in ipairs(slot19) do
				table.insert(slot16, slot24)
			end

			slot20, slot21 = slot17:getFleetCost(slot18)
			slot14 = slot21.gold
			slot15 = slot21.oil

			if slot2.statistics.submarineAid then
				if _.detect(slot17.fleets, function (slot0)
					return slot0:getFleetType() == FleetType.Submarine and slot0:isValid() and slot0:inHuntingRange(slot0.line.row, slot0.line.column)
				end) then
					submarineTeam = slot22:getShipsByTeam(TeamType.Submarine, true)

					for slot26, slot27 in ipairs(submarineTeam) do
						if slot2.statistics[slot27.id] then
							table.insert(slot16, slot27)

							slot15 = slot15 + slot27:getEndBattleExpend()
						end
					end
				else
					print("finish stage error: can not find submarine fleet.")
				end
			end
		elseif slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot16 = slot3:getShipsByFleet(slot11:getActivityFleets()[slot2.actID][slot2.mainFleetId])
			slot14 = slot11.getActivityFleets()[slot2.actID][slot2.mainFleetId].getEndCost(slot19).gold
			slot15 = slot11.getActivityFleets()[slot2.actID][slot2.mainFleetId].getEndCost(slot19).oil

			if slot2.statistics.submarineAid then
				if slot11:getActivityFleets()[slot2.actID][Fleet.SUBMARINE_FLEET_ID] then
					for slot28, slot29 in ipairs(slot24) do
						if slot2.statistics[slot29.id] then
							table.insert(slot16, slot29)

							slot15 = slot15 + slot29:getEndBattleExpend()
						end
					end
				else
					print("finish stage error: can not find submarine fleet.")
				end
			end
		elseif slot6 == SYSTEM_SHAM then
			slot16 = {}

			for slot23, slot24 in ipairs(slot19) do
				table.insert(slot16, slot24)
			end

			_.each(slot17:getChapterCell(slot18.line.row, slot18.line.column).rival.mainShips, function (slot0)
				table.insert(slot0, slot0)
			end)
			_.each(slot17.getChapterCell(slot18.line.row, slot18.line.column).rival.vanguardShips, function (slot0)
				table.insert(slot0, slot0)
			end)

			slot5 = slot17.getChapterCell(slot18.line.row, slot18.line.column).rival.id
			slot14 = 0
			slot15 = 0
		elseif slot6 == SYSTEM_GUILD then
			slot16 = {}

			for slot23, slot24 in ipairs(slot19) do
				table.insert(slot16, slot24)
			end

			slot14 = 0
			slot15 = 0
		elseif slot6 == SYSTEM_CHALLENGE then
			slot16 = {}

			for slot23, slot24 in ipairs(slot19) do
				table.insert(slot16, slot24)
			end

			slot8 = {
				1,
				0
			}
			slot14 = 0
			slot15 = 0
		elseif slot6 == SYSTEM_PERFORM or slot6 == SYSTEM_SIMULATION then
			slot16 = {}
			slot14 = 0
			slot15 = 0
		elseif slot6 == SYSTEM_WORLD then
			slot20 = getProxy(WorldProxy).GetWorld(slot17).GetActiveMap(slot18).GetFleet(slot19)
			slot16 = slot20:GetShipVOs(true)
			slot21, slot22 = slot20:GetCost()
			slot14 = slot22.gold
			slot15 = slot22.oil

			if slot2.statistics.submarineAid then
				for slot28, slot29 in ipairs(slot24) do
					if slot2.statistics[slot29.id] then
						table.insert(slot16, slot29)
					end
				end

				slot25, slot26 = slot23:GetCost()
				slot14 = slot14 + slot26.gold
				slot15 = slot15 + slot26.oil
			end
		else
			slot17 = slot11:getFleetById(slot2.mainFleetId)
			slot16 = slot3:getShipsByFleet(slot17)
			slot14 = slot17:getEndCost().gold
			slot15 = slot17.getEndCost().oil
		end

		if slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot13 = ys.Battle.BattleConst.BattleScore.S
		end

		slot17 = 0
		slot18 = {}
		slot19 = slot6 + slot5 + slot13

		for slot23, slot24 in ipairs(slot16) do
			if slot2.statistics[slot24.id] then
				table.insert(slot18, {
					ship_id = slot25.id,
					hp_rest = math.floor(slot25.bp),
					damage_cause = math.floor(slot25.output),
					damage_caused = math.floor(slot25.damage),
					max_damage_once = math.floor(slot25.maxDamageOnce),
					ship_gear_score = math.floor(slot25.gearScore)
				})

				slot19 = slot19 + slot25.id + math.floor(slot25.bp) + math.floor(slot25.output) + math.floor(slot25.maxDamageOnce)
				slot17 = slot17 + slot24:getShipCombatPower()
			end
		end

		if slot6 == SYSTEM_SHAM then
			for slot23, slot24 in ipairs(slot16) do
				if slot2.statistics._rivalInfo[slot24.id] then
					table.insert(slot18, {
						ship_id = slot25.id,
						hp_rest = slot25.bp,
						damage_cause = 0,
						damage_caused = 0,
						max_damage_once = 0,
						ship_gear_score = 0
					})

					slot19 = slot19 + slot25.id + slot25.bp + 0 + 0
				end
			end
		end

		slot20 = {}

		if slot6 == SYSTEM_HP_SHARE_ACT_BOSS then
			for slot24, slot25 in ipairs(slot2.statistics._enemyInfoList) do
				table.insert(slot20, {
					enemy_id = slot25.id,
					damage_taken = slot25.damage,
					total_hp = slot25.totalHp
				})
			end
		end

		if slot6 == SYSTEM_SCENARIO then
			slot22 = slot12:getActiveChapter()

			slot22:writeBack(ys.Battle.BattleConst.BattleScore.C < slot13, slot2)
			slot12:updateChapter(slot22)
		end

		pg.ConnectionMgr.GetInstance():Send(40003, {
			system = slot6,
			data = slot5,
			score = slot13,
			key = math.floor((slot19 % 49993 * slot2.token % 49993) % 49993 + slot2.statistics._totalTime),
			statistics = slot18,
			kill_id_list = slot2.statistics.kill_id_list,
			total_time = slot2.statistics._totalTime,
			bot_percentage = slot2.statistics._botPercentage,
			extra_param = slot17,
			file_check = tostring(math.floor((GetBattleCheck() % 88824 * slot2.token % 88824) % (88824 + math.floor((slot19 % 49993 * slot2.token % 49993) % 49993 + slot2.statistics._totalTime)))),
			enemy_info = slot20,
			data2 = slot8
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

					if slot0 == SYSTEM_SCENARIO then
						slot4 = slot1:addCommanderExp(slot0.commander_exp)
						slot7 = {}
						slot8 = {}
						slot9 = {}

						for slot13, slot14 in pairs(slot6) do
							table.insert(slot9, slot14.id)
						end

						for slot13, slot14 in ipairs(slot4) do
							if table.contains(slot9, slot14.commander_id) then
								table.insert(slot7, slot14)
							else
								table.insert(slot8, slot14)
							end
						end

						slot1.commanderExpList = {
							surfaceCMD = slot7,
							submarineCMD = slot8
						}
					end
				end

				slot2.statistics.mvpShipID = slot0.mvp
				slot3 = {}
				slot4 = {}
				slot5 = {}

				for slot9, slot10 in ipairs(slot0.drop_info) do
					slot11 = Item.New(slot10)

					table.insert(slot3, slot11)
					table.insert(slot5, slot11)

					if slot11.type == DROP_TYPE_SHIP then
						slot11.virgin = getProxy(CollectionProxy) and slot13.shipGroups[pg.ship_data_template[slot11.id].group_type] == nil
					end

					slot1:sendNotification(GAME.ADD_ITEM, slot11)
				end

				for slot9, slot10 in ipairs(slot0.extra_drop_info) do
					slot11 = Item.New(slot10)

					table.insert(slot4, slot11)
					table.insert(slot5, slot11)
					slot1:sendNotification(GAME.ADD_ITEM, slot11)
				end

				slot6 = slot2:getData()

				slot6:addExp(slot0.player_exp)

				slot7 = ys.Battle.BattleConst.BattleScore.C < slot6

				if slot0 == SYSTEM_ROUTINE and slot7 then
					slot8 = getProxy(DailyLevelProxy)
					slot8.data[slot8.dailyLevelId] = (slot8.data[slot8.dailyLevelId] or 0) + 1
				elseif slot0 == SYSTEM_ACT_BOSS and slot7 and getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot9:isEnd() then
					slot9:updateKVPList(1, slot7, slot9:getKVPList(1, slot7) + 1)
					slot9:updateDataList(slot7)
					slot8:updateActivity(slot9)
				end

				if slot0 == SYSTEM_DUEL then
					slot7 = ys.Battle.BattleConfig.ARENA_LIST[math.random(#ys.Battle.BattleConfig.ARENA_LIST)]

					getProxy(MilitaryExerciseProxy):reduceExerciseCount()
				end

				if slot3.oil_cost > 0 and slot7 then
					slot6:consume({
						oil = slot8,
						gold = slot6
					})
				end

				if slot3.attack_count > 0 and not slot1 then
					if slot3.attack_count == 1 then
						slot6:increaseAttackCount()

						if slot7 then
							slot6:increaseAttackWinCount()
						end
					elseif slot3.attack_count == 2 then
						slot6:increasePvpCount()

						if slot7 then
							slot6:increasePvpWinCount()
						end
					end
				end

				slot2:updatePlayer(slot6)
				slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
					system = slot0,
					statistics = slot2.statistics,
					score = slot6,
					drops = slot3,
					prefabFleet = prefabFleet,
					commanderExps = slot1.commanderExpList or {},
					result = slot0.result,
					extraDrops = slot4
				})

				if slot0 == SYSTEM_SCENARIO then
					slot10:updateActiveChapterShips()
					slot10:getActiveChapter().writeDrops(slot8, slot3)

					slot10 = nil

					for slot14, slot15 in ipairs(slot9) do
						if slot15:isUnlock() then
							slot10 = slot15.id
						end
					end

					slot10:updateChapter(slot8)

					slot11 = nil

					for slot15, slot16 in ipairs(slot9) do
						if slot16:isUnlock() then
							slot11 = slot16.id
						end
					end

					if Map.lastMap and slot11 ~= slot10 and slot10 < slot11 then
						Map.autoNextPage = true
					end
				elseif slot0 == SYSTEM_SHAM then
					slot10:updateShamChapterShips()

					slot8 = slot10:getShamChapter()

					slot8:writeBack(slot7, slot2)
					slot8:updateShamChapter(slot8)
				elseif slot0 == SYSTEM_GUILD then
					slot10:updateGuildChapterShips()

					slot8 = slot10:getGuildChapter()

					slot8:writeBack(slot7, slot2)
					slot8:updateGuildChapter(slot8)
				else
					if slot0 == SYSTEM_CHALLENGE then
						slot11:updateActiveChallengeShips()

						function slot10(slot0)
							if slot0.statistics[slot0.id] then
								slot1:updateShipHp(slot0.id, slot1.bp)
							end
						end

						for slot14, slot15 in pairs(slot11:getCurrentChallengeInfo().fleet.ships) do
							slot10(slot15)
						end

						slot11:updateChallenge(slot8)

						return
					end

					if slot0 == SYSTEM_WORLD then
						getProxy(WorldProxy).GetWorld(slot8).GetActiveMap(slot9):WriteBack(slot7, slot2)

						if not slot7 then
							slot9:AddLog(WorldLog.TypeBattleFailure, {
								fleet = slot10:GetFleet().id
							})
						end
					end
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
		slot12 = slot11.exp

		slot11:addExp(slot10)
		slot3:updateCommander(slot11)

		if slot11:isMaxLevel() then
			table.insert(slot2, {
				exp = 0,
				commander_id = slot9,
				curExp = slot12
			})
		else
			table.insert(slot2, {
				commander_id = slot9,
				exp = slot8.exp,
				curExp = slot12
			})
		end
	end

	return slot2
end

return slot0
