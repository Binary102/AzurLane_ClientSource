class("BeginStageCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.actID
	slot5 = slot2.bossHP
	slot6 = getProxy(FleetProxy)
	slot7 = getProxy(PlayerProxy)
	slot8 = nil
	slot9 = getProxy(BayProxy)

	ys.Battle.BattleState.GenerateVertifyData()

	slot10 = pg.battle_cost_template[slot2.system]

	if slot2.system == SYSTEM_PROLOGUE then
		slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot12).fleet_prefab,
			stageId = PROLOGUE_DUNGEON,
			system = slot3,
			drops = {}
		})
	else
		if slot3 == SYSTEM_SCENARIO or slot3 == SYSTEM_ROUTINE or slot3 == SYSTEM_DUEL or slot3 == SYSTEM_SHAM or slot3 == SYSTEM_GUILD or slot3 == SYSTEM_CHALLENGE or slot3 == SYSTEM_ACT_BOSS or slot3 == SYSTEM_WORLD or slot3 == SYSTEM_HP_SHARE_ACT_BOSS then
			if slot3 ~= SYSTEM_DUEL and slot3 ~= SYSTEM_SHAM and slot3 ~= SYSTEM_CHALLENGE and getProxy(PlayerProxy).getData(slot11).ship_bag_max <= getProxy(BayProxy).getShipCount(slot13) then
				NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

				return
			end

			slot11 = {}
			slot12 = 0
			slot13 = 0
			slot14 = 0
			slot15 = 0
			slot16 = nil

			if slot3 == SYSTEM_SCENARIO then
				for slot23, slot24 in ipairs(slot16) do
					slot11[#slot11 + 1] = slot24.id
				end

				slot20, slot21 = slot18:getFleetCost(slot19)
				slot12 = slot20.gold
				slot13 = slot20.oil
				slot14 = slot20.gold + slot21.gold
				slot15 = slot20.oil + slot21.oil
			elseif slot3 == SYSTEM_SHAM then
				for slot23, slot24 in ipairs(slot16) do
					slot11[#slot11 + 1] = slot24.id
				end
			elseif slot3 == SYSTEM_GUILD then
				for slot23, slot24 in ipairs(slot16) do
					slot11[#slot11 + 1] = slot24.id
				end
			elseif slot3 == SYSTEM_CHALLENGE then
				for slot23, slot24 in ipairs(slot16) do
					slot11[#slot11 + 1] = slot24.id
				end
			elseif slot3 == SYSTEM_WORLD then
				for slot24, slot25 in ipairs(slot16) do
					slot11[#slot11 + 1] = slot25.id
				end

				slot21, slot22 = slot20:GetCost()
				slot12 = slot21.gold
				slot13 = slot21.oil
				slot14 = slot21.gold + slot22.gold
				slot15 = slot21.oil + slot22.oil
			elseif slot3 == SYSTEM_HP_SHARE_ACT_BOSS then
				shipIDs = slot6:getActivityFleets()[slot4][Fleet.REGULAR_FLEET_ID].ships

				for slot21, slot22 in ipairs(shipIDs) do
					slot11[#slot11 + 1] = slot22
				end

				slot13 = slot17:getStartCost().oil
				slot15 = slot17:GetCostSum().oil
				slot16 = slot9:getSortShipsByFleet(slot17)
			else
				if slot6:getFleetById(slot2.mainFleetId) == nil or slot8:isEmpty() then
					pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_fleetEmpty"))

					return
				end

				slot17, slot18 = slot8:isLegalToFight()

				if slot17 ~= true then
					pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_teamEmpty", Fleet.C_TEAM_NAME[slot17], slot18))

					return
				end

				slot19 = pg.ship_data_template

				for slot23, slot24 in ipairs(slot16) do
					slot11[#slot11 + 1] = slot24.id
				end

				if slot3 ~= SYSTEM_DUEL then
					slot13 = slot8:getStartCost().oil
					slot15 = slot8:GetCostSum().oil
				end
			end

			slot17 = slot7:getData()

			if slot10.oil_cost > 0 and slot17.oil < slot15 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

				return
			end

			if slot3 ~= SYSTEM_DUEL and slot3 ~= SYSTEM_SHAM and slot3 ~= SYSTEM_GUILD and slot3 ~= SYSTEM_CHALLENGE and slot17.oil < slot15 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

				return
			end

			slot18 = {}
			slot19 = slot2.stageId
			slot20 = {}
			slot21, slot22 = nil
			slot23 = getProxy(MilitaryExerciseProxy)
			slot24 = slot7:getData()

			if slot3 == SYSTEM_DUEL then
				if not slot23:getSeasonInfo():canExercise() then
					pg.TipsMgr:GetInstance():ShowTips(i18n("exercise_count_insufficient"))

					return
				end

				rivalVO = getProxy(MilitaryExerciseProxy):getRivalById(slot2.rivalId)
			elseif slot3 == SYSTEM_SHAM then
				slot26 = getProxy(ChapterProxy).getShamChapter(slot25)
				rivalVO = slot26:getChapterCell(slot26.fleet.line.row, slot26.fleet.line.column).rival
				slot19 = rivalVO.id
			elseif slot3 == SYSTEM_GUILD then
			elseif slot3 == SYSTEM_CHALLENGE then
				slot27 = getProxy(ChallengeProxy).getUserChallengeInfo(slot26, slot25)
				slot19 = slot27:getNextStageID()
				slot18 = {
					slot27:getLevel(),
					slot2.mode
				}
			else
				slot20 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot19].dungeon_id).fleet_prefab
			end

			if rivalVO then
				slot25 = 0

				for slot29, slot30 in ipairs(rivalVO.mainShips) do
					slot25 = slot25 + slot30.level
				end

				for slot29, slot30 in ipairs(rivalVO.vanguardShips) do
					slot25 = slot25 + slot30.level
				end

				RivalLevelVertiry = slot25
			end

			for slot29, slot30 in pairs(slot25) do
				if not slot30:attrVertify() then
					BattleVertify.playerShipVertifyFail = true

					break
				end
			end

			pg.ConnectionMgr.GetInstance():Send(40001, {
				data = slot19,
				system = slot3,
				ship_id_list = slot11,
				data2 = slot18
			}, 40002, function (slot0)
				if slot0.result == 0 then
					slot1 = {}

					for slot5, slot6 in ipairs(slot0.drop_performance) do
						if slot1[slot6.enemy_id] == nil then
							slot1[slot6.enemy_id] = {}
						end

						table.insert(slot1[slot6.enemy_id], {
							resourceCount = slot6.resource_num,
							itemCount = slot6.other_num
						})
					end

					if slot0.oil_cost > 0 then
						slot1:consume({
							gold = 0,
							oil = slot1.consume
						})
					end

					slot2 = nil

					if slot3 == SYSTEM_SCENARIO and getProxy(ChapterProxy):getActiveChapter().getPlayType(slot3) == ChapterConst.TypeExtra then
						slot2 = true
					end

					if slot0.enter_energy_cost > 0 and not slot2 then
						slot3 = pg.gameset.battle_consume_energy.key_value

						for slot7, slot8 in ipairs(ipairs) do
							slot8:cosumeEnergy(slot3)
							slot5:updateShip(slot8)
						end
					end

					if slot3 == SYSTEM_DUEL then
						slot6 = ys.Battle.BattleConfig.ARENA_LIST[math.random(#ys.Battle.BattleConfig.ARENA_LIST)]
					elseif slot3 == SYSTEM_SHAM then
						slot4 = getProxy(ChapterProxy).getShamChapter(slot3)
						slot6 = (slot4:getConfig("rival_index")[slot4.progress + 1] and slot5[3]) or 90001
					elseif slot3 == SYSTEM_GUILD then
						slot6 = pg.guild_boss_template[slot6].dungeon_id
					end

					slot7:updatePlayer(slot1)
					slot9:sendNotification(GAME.BEGIN_STAGE_DONE, {
						mainFleetId = ((nil ~= SYSTEM_SCENARIO and slot3 ~= SYSTEM_SHAM and slot3 ~= SYSTEM_GUILD and slot3 ~= SYSTEM_CHALLENGE and slot3 ~= SYSTEM_WORLD) or nil) and (slot3 ~= SYSTEM_HP_SHARE_ACT_BOSS or Fleet.REGULAR_FLEET_ID) and slot8.id,
						prefabFleet = slot10,
						rivalId = slot11,
						stageId = slot6,
						system = ((nil ~= SYSTEM_SCENARIO and slot3 ~= SYSTEM_SHAM and slot3 ~= SYSTEM_GUILD and slot3 ~= SYSTEM_CHALLENGE and slot3 ~= SYSTEM_WORLD) or nil) and (slot3 ~= SYSTEM_HP_SHARE_ACT_BOSS or Fleet.REGULAR_FLEET_ID) and slot8.id,
						actId = slot12,
						token = slot0.key,
						specificBossHPRate = slot13,
						drops = slot1,
						mode = slot14:getBody().mode
					})
				elseif slot0.result == 19 then
					pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[19])
				elseif slot0.result == 10 then
					pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[10])
				else
					pg.TipsMgr:GetInstance():ShowTips(errorTip("stage_beginStage", slot0.result))
					slot9:sendNotification(GAME.BEGIN_STAGE_ERRO, slot0.result)
				end
			end)

			return
		end

		if slot3 == SYSTEM_DEBUG then
			slot11 = PROLOGUE_DUNGEON

			if slot6:getFleetById(1) == nil or slot12:isEmpty() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_fleetEmpty"))

				return
			end

			slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
				mainFleetId = 1,
				prefabFleet = {},
				stageId = slot11,
				system = slot3,
				drops = {}
			})
		elseif slot3 == SYSTEM_PERFORM then
			slot11 = slot2.stageId

			function slot12(slot0)
				slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
					prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot1).fleet_prefab,
					stageId = slot0,
					system = slot2,
					token = slot0,
					drops = {},
					memory = slot3.memory,
					exitCallback = slot3.exitCallback
				})
			end

			if slot2.memory then
				slot12()
			else
				pg.ConnectionMgr.GetInstance():Send(40001, {
					data = slot11,
					system = slot3,
					ship_id_list = {}
				}, 40002, function (slot0)
					if slot0.result == 0 then
						slot0:sendNotification(GAME.STORY_UPDATE, {
							storyId = pg.StoryMgr:GetInstance():GetStoryByName("index")[slot1]
						})
						slot0.sendNotification(slot0.key)
					elseif slot0.result == 10 then
						pg.TipsMgr:GetInstance():ShowTips(ERROR_MESSAGE[10])
					else
						pg.TipsMgr:GetInstance():ShowTips(errorTip("stage_beginStage", slot0.result))
						slot0:sendNotification(GAME.BEGIN_STAGE_ERRO, slot0.result)
					end
				end)
			end
		elseif slot3 == SYSTEM_DODGEM then
			slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
				prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot12).fleet_prefab,
				stageId = slot2.stageId,
				system = slot3,
				drops = {}
			})
		elseif slot3 == SYSTEM_SUBMARINE_RUN then
			slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
				prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot12).fleet_prefab,
				stageId = slot2.stageId,
				system = slot3,
				drops = {}
			})
		elseif slot3 == SYSTEM_SIMULATION then
			slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
				prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot12).fleet_prefab,
				stageId = slot2.stageId,
				system = slot3,
				token = token,
				drops = {},
				memory = slot2.memory,
				exitCallback = slot2.exitCallback
			})
		end
	end
end

return class("BeginStageCommand", pm.SimpleCommand)
