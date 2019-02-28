class("BeginStageCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.actID
	slot5 = slot2.bossHP
	slot6 = getProxy(FleetProxy)
	slot7 = getProxy(PlayerProxy)
	slot8 = nil
	slot9 = getProxy(BayProxy)

	ys.Battle.BattleState.GenerateVertifyData()

	if slot2.system == SYSTEM_PROLOGUE then
		slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
			prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot11).fleet_prefab,
			stageId = PROLOGUE_DUNGEON,
			system = slot3,
			drops = {}
		})
	else
		if slot3 == SYSTEM_SCENARIO or slot3 == SYSTEM_ROUTINE or slot3 == SYSTEM_DUEL or slot3 == SYSTEM_SHAM or slot3 == SYSTEM_GUILD or slot3 == SYSTEM_CHALLENGE or slot3 == SYSTEM_ACT_BOSS or slot3 == SYSTEM_HP_SHARE_ACT_BOSS then
			if slot3 ~= SYSTEM_DUEL and slot3 ~= SYSTEM_SHAM and slot3 ~= SYSTEM_CHALLENGE and getProxy(PlayerProxy).getData(slot10).ship_bag_max <= getProxy(BayProxy).getShipCount(slot12) then
				NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene)

				return
			end

			slot10 = {}
			slot11 = 0
			slot12 = 0
			slot13 = 0
			slot14 = 0
			slot15 = nil

			if slot3 == SYSTEM_SCENARIO then
				for slot22, slot23 in ipairs(slot15) do
					slot10[#slot10 + 1] = slot23.id
				end

				slot19, slot20 = slot17:getFleetCost(slot18)
				slot11 = slot19.gold
				slot12 = slot19.oil
				slot13 = slot19.gold + slot20.gold
				slot14 = slot19.oil + slot20.oil
			elseif slot3 == SYSTEM_SHAM then
				for slot22, slot23 in ipairs(slot15) do
					slot10[#slot10 + 1] = slot23.id
				end
			elseif slot3 == SYSTEM_GUILD then
				for slot22, slot23 in ipairs(slot15) do
					slot10[#slot10 + 1] = slot23.id
				end
			elseif slot3 == SYSTEM_CHALLENGE then
				for slot22, slot23 in ipairs(slot15) do
					slot10[#slot10 + 1] = slot23.id
				end
			elseif slot3 == SYSTEM_HP_SHARE_ACT_BOSS then
				shipIDs = slot6:getActivityFleets()[slot4][Fleet.REGULAR_FLEET_ID].ships

				for slot20, slot21 in ipairs(shipIDs) do
					slot10[#slot10 + 1] = slot21
				end

				slot12 = slot16:getStartCost().oil
				slot14 = slot16:GetCostSum().oil
				slot15 = slot9:getSortShipsByFleet(slot16)
			else
				if slot6:getFleetById(slot2.mainFleetId) == nil or slot8:isEmpty() then
					pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_fleetEmpty"))

					return
				end

				slot16, slot17 = slot8:isLegalToFight()

				if slot16 ~= true then
					pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_teamEmpty", Fleet.C_TEAM_NAME[slot16], slot17))

					return
				end

				slot18 = pg.ship_data_template

				for slot22, slot23 in ipairs(slot15) do
					slot10[#slot10 + 1] = slot23.id
				end

				if slot3 ~= SYSTEM_DUEL then
					slot12 = slot8:getStartCost().oil
					slot14 = slot8:GetCostSum().oil
				end
			end

			slot16 = slot7:getData()

			if slot3 ~= SYSTEM_DUEL and slot3 ~= SYSTEM_SHAM and slot3 ~= SYSTEM_GUILD and slot3 ~= SYSTEM_CHALLENGE and slot16.oil < slot14 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

				return
			end

			slot17 = slot6:getFleetById(slot2.supportFleetId)
			slot18 = slot2.stageId
			slot19 = {}
			slot20, slot21 = nil
			slot22 = getProxy(MilitaryExerciseProxy)
			slot23 = slot7:getData()

			if slot3 == SYSTEM_DUEL then
				if not slot22:getSeasonInfo():canExercise() then
					pg.TipsMgr:GetInstance():ShowTips(i18n("exercise_count_insufficient"))

					return
				end

				rivalVO = getProxy(MilitaryExerciseProxy):getRivalById(slot2.rivalId)
			elseif slot3 == SYSTEM_SHAM then
				slot25 = getProxy(ChapterProxy).getShamChapter(slot24)
				rivalVO = slot25:getChapterCell(slot25.fleet.line.row, slot25.fleet.line.column).rival
				slot18 = rivalVO.id
			elseif slot3 == SYSTEM_GUILD then
			elseif slot3 == SYSTEM_CHALLENGE then
			else
				slot19 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(pg.expedition_data_template[slot18].dungeon_id).fleet_prefab
			end

			if rivalVO then
				slot24 = 0

				for slot28, slot29 in ipairs(rivalVO.mainShips) do
					slot24 = slot24 + slot29.level
				end

				for slot28, slot29 in ipairs(rivalVO.vanguardShips) do
					slot24 = slot24 + slot29.level
				end

				RivalLevelVertiry = slot24
			end

			for slot28, slot29 in pairs(slot24) do
				if not slot29:attrVertify() then
					BattleVertify.playerShipVertifyFail = true

					break
				end
			end

			pg.ConnectionMgr.GetInstance():Send(40001, {
				data = slot18,
				system = slot3,
				ship_id_list = slot10
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

					if slot0 == SYSTEM_DUEL then
						slot1 = ys.Battle.BattleConfig.ARENA_LIST[math.random(#ys.Battle.BattleConfig.ARENA_LIST)]
					elseif slot0 == SYSTEM_SHAM then
						slot3 = getProxy(ChapterProxy).getShamChapter(slot2)
						slot1 = (slot3:getConfig("rival_index")[slot3.progress + 1] and slot4[3]) or 90001
					elseif slot0 == SYSTEM_GUILD then
						slot1 = pg.guild_boss_template[slot1].dungeon_id
					elseif slot0 == SYSTEM_CHALLENGE then
					else
						slot2:consume({
							gold = slot3,
							oil = 
						})

						slot2 = pg.gameset.battle_consume_energy.key_value

						if slot0 == SYSTEM_SCENARIO and getProxy(ChapterProxy).getActiveChapter(slot3).getPlayType(slot4) == ChapterConst.TypeExtra then
							slot2 = 0
						end

						for slot6, slot7 in ipairs(slot5) do
							slot7:cosumeEnergy(slot2)
							slot6:updateShip(slot7)
						end
					end

					slot7:updatePlayer(slot7.updatePlayer)

					slot2 = nil

					slot9:sendNotification(GAME.BEGIN_STAGE_DONE, {
						mainFleetId = ((slot0 ~= SYSTEM_SCENARIO and slot0 ~= SYSTEM_SHAM and slot0 ~= SYSTEM_GUILD and slot0 ~= SYSTEM_CHALLENGE) or nil) and (slot0 ~= SYSTEM_HP_SHARE_ACT_BOSS or Fleet.REGULAR_FLEET_ID) and slot8.id,
						prefabFleet = slot10,
						rivalId = slot11,
						stageId = slot1,
						system = slot0,
						actId = slot12,
						token = slot0.key,
						specificBossHPRate = slot13,
						drops = slot1
					})
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
			slot10 = PROLOGUE_DUNGEON

			if slot6:getFleetById(1) == nil or slot11:isEmpty() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("stage_beginStage_error_fleetEmpty"))

				return
			end

			slot0:sendNotification(GAME.BEGIN_STAGE_DONE, {
				mainFleetId = 1,
				prefabFleet = {},
				stageId = slot10,
				system = slot3,
				drops = {}
			})
		elseif slot3 == SYSTEM_PERFORM then
			slot10 = slot2.stageId

			function slot11(slot0)
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
				slot11()
			else
				pg.ConnectionMgr.GetInstance():Send(40001, {
					data = slot10,
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
				prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot11).fleet_prefab,
				stageId = slot2.stageId,
				system = slot3,
				drops = {}
			})
		end
	end
end

return class("BeginStageCommand", pm.SimpleCommand)
