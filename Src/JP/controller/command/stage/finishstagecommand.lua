slot0 = class("FinishStageCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = getProxy(BayProxy)
	slot4 = getProxy(ChallengeProxy)
	slot5 = slot1:getBody().stageId

	if slot1:getBody().system == SYSTEM_PROLOGUE or (slot6 == SYSTEM_PERFORM and slot2.memory) then
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

		slot7, slot8 = ys.Battle.BattleState.Vertify()

		if not slot7 then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = slot8
			})

			return
		end

		slot9 = getProxy(FleetProxy)
		slot10 = getProxy(ChapterProxy)
		slot11 = slot2.statistics._battleScore
		slot12 = 0
		slot13 = 0
		slot14 = nil

		if slot6 == SYSTEM_DUEL then
			slot5 = slot2.rivalId
		end

		if slot6 == SYSTEM_SCENARIO then
			slot14 = {}

			for slot21, slot22 in ipairs(slot17) do
				table.insert(slot14, slot22)
			end

			slot18, slot19 = slot15:getFleetCost(slot16)
			slot12 = slot19.gold
			slot13 = slot19.oil

			if slot2.statistics.submarineAid then
				if _.detect(slot15.fleets, function (slot0)
					return slot0:getFleetType() == FleetType.Submarine and slot0:isValid() and slot0:inHuntingRange(slot0.line.row, slot0.line.column)
				end) then
					submarineTeam = slot20:getShipsByTeam(TeamType.Submarine, true)

					for slot24, slot25 in ipairs(submarineTeam) do
						table.insert(slot14, slot25)
					end

					slot13 = slot13 + slot20:getSummonCost()
				else
					print("finish stage error: can not find submarine fleet.")
				end
			end
		elseif slot6 == SYSTEM_SHAM then
			slot14 = {}

			for slot21, slot22 in ipairs(slot17) do
				table.insert(slot14, slot22)
			end

			_.each(slot15:getChapterCell(slot16.line.row, slot16.line.column).rival.mainShips, function (slot0)
				table.insert(slot0, slot0)
			end)
			_.each(slot15.getChapterCell(slot16.line.row, slot16.line.column).rival.vanguardShips, function (slot0)
				table.insert(slot0, slot0)
			end)

			slot5 = slot15.getChapterCell(slot16.line.row, slot16.line.column).rival.id
			slot12 = 0
			slot13 = 0
		elseif slot6 == SYSTEM_GUILD then
			slot14 = {}

			for slot21, slot22 in ipairs(slot17) do
				table.insert(slot14, slot22)
			end

			slot12 = 0
			slot13 = 0
		elseif slot6 == SYSTEM_CHALLENGE then
			slot14 = {}

			for slot21, slot22 in ipairs(slot17) do
				table.insert(slot14, slot22)
			end

			slot12 = 0
			slot13 = 0
		elseif slot6 == SYSTEM_PERFORM then
			slot14 = {}
			slot12 = 0
			slot13 = 0
		else
			slot15 = slot9:getFleetById(slot2.mainFleetId)
			slot14 = slot3:getShipsByFleet(slot15)
			slot12 = slot15:getEndCost().gold
			slot13 = slot15.getEndCost().oil
		end

		slot15 = 0
		slot16 = {}
		slot17 = slot6 + slot5 + slot11

		for slot21, slot22 in ipairs(slot14) do
			if slot2.statistics[slot22.id] then
				table.insert(slot16, {
					ship_id = slot23.id,
					hp_rest = math.floor(slot23.bp),
					damage_cause = math.floor(slot23.output),
					damage_caused = math.floor(slot23.damage),
					max_damage_once = math.floor(slot23.maxDamageOnce),
					ship_gear_score = math.floor(slot23.gearScore)
				})

				slot17 = slot17 + slot23.id + math.floor(slot23.bp) + math.floor(slot23.output) + math.floor(slot23.maxDamageOnce)
				slot15 = slot15 + slot22:getShipCombatPower()
			end
		end

		if slot6 == SYSTEM_SHAM then
			for slot21, slot22 in ipairs(slot14) do
				if slot2.statistics._rivalInfo[slot22.id] then
					table.insert(slot16, {
						ship_id = slot23.id,
						hp_rest = slot23.bp,
						damage_cause = 0,
						damage_caused = 0,
						max_damage_once = 0,
						ship_gear_score = 0
					})

					slot17 = slot17 + slot23.id + slot23.bp + 0 + 0
				end
			end
		end

		if slot6 == SYSTEM_SCENARIO then
			slot19 = slot10:getActiveChapter()

			slot19:writeBack(ys.Battle.BattleConst.BattleScore.C < slot11, slot2)
			slot10:updateChapter(slot19)
		end

		pg.ConnectionMgr.GetInstance():Send(40003, {
			system = slot6,
			data = slot5,
			score = slot11,
			key = math.floor((slot17 % 49993 * slot2.token % 49993) % 49993 + slot2.statistics._totalTime),
			statistics = slot16,
			kill_id_list = slot2.statistics.kill_id_list,
			total_time = slot2.statistics._totalTime,
			bot_percentage = slot2.statistics._botPercentage,
			extra_param = slot15,
			file_check = tostring(math.floor((GetBattleCheck() % 88824 * slot2.token % 88824) % (88824 + math.floor((slot17 % 49993 * slot2.token % 49993) % 49993 + slot2.statistics._totalTime))))
		}, 40004, function (slot0)
			if slot0.result == 0 then
				if slot0 == SYSTEM_PERFORM then
					slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
						system = slot0,
						exitCallback = slot2.exitCallback
					})

					return
				end

				if slot0 ~= SYSTEM_DUEL and slot0 ~= SYSTEM_SHAM and slot0 ~= SYSTEM_GUILD and slot0 ~= SYSTEM_CHALLENGE then
					slot1 = pg.gameset.battle_dead_energy.key_value

					if slot0 == SYSTEM_SCENARIO and getProxy(ChapterProxy).getActiveChapter(slot2).getPlayType(slot3) == ChapterConst.TypeExtra then
						slot1 = 0
					end

					for slot5, slot6 in ipairs(slot3) do
						if slot2.statistics[slot6.id] and slot7.bp == 0 then
							slot8 = slot4:getShipById(slot6.id)

							slot8:cosumeEnergy(slot1)
							slot4:updateShip(slot8)
						end
					end
				end

				slot1 = getProxy(PlayerProxy)

				if prefabFleet ~= nil then
					for slot5, slot6 in ipairs(prefabFleet) do
						prefabFleet[slot5] = Ship.New(slot6)
					end
				else
					slot1.addShipsExp(slot0.ship_exp_list, slot0 == SYSTEM_SCENARIO or slot0 == SYSTEM_ROUTINE or slot0 == SYSTEM_ACT_BOSS.statistics, slot0 == SYSTEM_SCENARIO or slot0 == SYSTEM_ROUTINE or slot0 == SYSTEM_ACT_BOSS)

					slot1.commanderExpList = slot1:addCommanderExp(slot0.commander_exp)
				end

				slot2.statistics.mvpShipID = slot0.mvp
				slot2 = {}

				for slot6, slot7 in ipairs(slot0.drop_info) do
					table.insert(slot2, Item.New(slot7))

					if Item.New(slot7).type == DROP_TYPE_SHIP then
						slot8.virgin = getProxy(CollectionProxy) and slot10.shipGroups[pg.ship_data_template[slot8.id].group_type] == nil
					end

					slot1:sendNotification(GAME.ADD_ITEM, slot8)
				end

				slot1:getData().addExp(slot3, slot0.player_exp)

				slot4 = ys.Battle.BattleConst.BattleScore.C < slot3

				if slot0 == SYSTEM_ROUTINE and slot4 then
					slot5 = getProxy(DailyLevelProxy)
					slot5.data[slot5.dailyLevelId] = (slot5.data[slot5.dailyLevelId] or 0) + 1
				elseif slot0 == SYSTEM_ACT_BOSS and slot4 and getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE) and not slot6:isEnd() then
					slot6:updateKVPList(1, slot6, slot6:getKVPList(1, slot6) + 1)
					slot6:updateDataList(slot6)
					slot5:updateActivity(slot6)
				end

				if slot0 == SYSTEM_DUEL then
					slot3:updatePvpCount(slot4)

					slot6 = ys.Battle.BattleConfig.ARENA_LIST[math.random(#ys.Battle.BattleConfig.ARENA_LIST)]

					getProxy(MilitaryExerciseProxy):reduceExerciseCount()
				end

				if slot0 ~= SYSTEM_DUEL and slot0 ~= SYSTEM_SHAM and slot0 ~= SYSTEM_GUILD and slot0 ~= SYSTEM_CHALLENGE then
					slot5 = true

					if slot0 == SYSTEM_SCENARIO and getProxy(ChapterProxy).getActiveChapter(slot6).getPlayType(slot7) == ChapterConst.TypeExtra then
						slot5 = false
					end

					if slot5 then
						slot3:increaseAttackCount()
					end

					if slot4 then
						slot3:consume({
							oil = slot7,
							gold = 
						})

						if slot5 then
							slot3:increaseAttackWinCount()
						end
					end
				end

				slot1:updatePlayer(slot3)
				slot5(slot1, GAME.FINISH_STAGE_DONE, {
					system = slot0,
					statistics = slot2.statistics,
					score = slot5,
					drops = slot2,
					prefabFleet = prefabFleet,
					commanderExps = slot1.commanderExpList or {}
				})

				if slot0 == SYSTEM_SCENARIO then
					slot9:updateActiveChapterShips()
					slot9:getActiveChapter().writeDrops(slot5, slot2)

					slot7 = nil

					for slot11, slot12 in ipairs(slot6) do
						if slot12:isUnlock() then
							slot7 = slot12.id
						end
					end

					slot9:updateChapter(slot5)

					slot8 = nil

					for slot12, slot13 in ipairs(slot6) do
						if slot13:isUnlock() then
							slot8 = slot13.id
						end
					end

					if Map.lastMap and slot8 ~= slot7 and slot7 < slot8 then
						Map.autoNextPage = true
					end
				elseif slot0 == SYSTEM_SHAM then
					slot9:updateShamChapterShips()

					slot5 = slot9:getShamChapter()

					slot5:writeBack(slot4, slot2)
					slot9:updateShamChapter(slot5)
				elseif slot0 == SYSTEM_GUILD then
					slot9:updateGuildChapterShips()

					slot5 = slot9:getGuildChapter()

					slot5:writeBack(slot4, slot2)
					slot9:updateGuildChapter(slot5)
				elseif slot0 == SYSTEM_CHALLENGE then
					slot10:updateActiveChallengeShips()

					function slot7(slot0)
						if slot0.statistics[slot0.id] then
							slot1:updateShipHp(slot0.id, slot1.bp)
						end
					end

					for slot11, slot12 in pairs(slot10:getCurrentChallengeInfo().fleet.ships) do
						slot7(slot12)
					end

					slot10:updateChallenge(slot5)
				end
			elseif slot0.result == 1030 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("md5_error"))
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
