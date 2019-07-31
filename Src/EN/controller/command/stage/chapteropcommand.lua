class("ChapterOpCommand", import(".ChapterOpRoutine")).execute = function (slot0, slot1)
	if slot1:getBody().type == ChapterConst.OpSwitch then
		for slot8, slot9 in ipairs(getProxy(ChapterProxy).getActiveChapter(slot3).fleets) do
			if slot9.id == slot2.id then
				slot4.findex = slot8

				break
			end
		end

		slot3:updateChapter(slot4, bit.bor(ChapterConst.DirtyStrategy, ChapterConst.DirtyFleet))
		slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
			type = slot2.type
		})
		pg.TipsMgr:GetInstance():ShowTips(i18n("formation_switch_success", slot4.fleet.name))

		return
	elseif slot2.type == ChapterConst.OpRetreat then
		if getProxy(ChapterProxy):getActiveChapter() and slot4:getFleetById(slot2.id) and slot5:getFleetType() == FleetType.Submarine then
			_.each(slot4.fleets, function (slot0)
				if slot0.id ~= slot0.id then
					table.insert(table.insert, slot0)
				end
			end)

			slot4.fleets = {}

			slot3:updateChapter(slot4, bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampion, ChapterConst.DirtyStrategy))
			slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
				type = slot2.type,
				id = slot5.id
			})

			return
		end
	elseif slot2.type == ChapterConst.OpSkipBattle then
		slot4 = getProxy(ChapterProxy).getActiveChapter(slot3)
		slot7 = nil

		if slot4:existChampion(slot4.fleet.line.row, slot4.fleet.line.column) then
			slot8 = slot4:getChampion(slot6.row, slot6.column)

			slot8:Iter()

			slot7 = slot8.attachment

			if slot8.flag == 1 and slot5 then
				slot5.defeatEnemies = slot5.defeatEnemies + 1
				slot4.defeatEnemies = slot4.defeatEnemies + 1

				slot4:RemoveChampion(slot8)
			end
		else
			slot8 = slot4:getChapterCell(slot6.row, slot6.column)
			slot8.flag = 1

			slot4:updateChapterCell(slot8)

			slot7 = slot8.attachment

			if slot5 then
				slot5.defeatEnemies = slot5.defeatEnemies + 1
				slot4.defeatEnemies = slot4.defeatEnemies + 1
			end
		end

		if slot7 ~= ChapterConst.AttachAmbush and _.detect(slot4.achieves, function (slot0)
			return slot0.type == ChapterConst.AchieveType2
		end) then
			slot8.count = slot8.count + 1
		end

		slot3:updateChapter(slot4)
	end

	pg.ConnectionMgr.GetInstance():Send(13103, {
		act = slot2.type,
		group_id = defaultValue(slot2.id, 0),
		act_arg_1 = slot2.arg1,
		act_arg_2 = slot2.arg2
	}, 13104, function (slot0)
		if slot0.result == 0 then
			slot0:initData(false, slot0, getProxy(ChapterProxy).getActiveChapter(slot2))
			slot0:doDropUpdate()

			if slot0.chapter then
				slot0:doMapUpdate()
				slot0:doAIUpdate()
				slot0:doShipUpdate()
				slot0:doBuffUpdate()
				slot0:doCellFlagUpdate()
				slot0:doKizunaJammingUpdate()

				if slot1.type == ChapterConst.OpRetreat then
					if slot3:getPlayType() == ChapterConst.TypeMainSub and (slot1.win or not slot3:isValid()) then
						slot3:retreat(slot1.win)
						slot3:clearSubChapter()
						slot2:updateChapter(slot3)
						slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
							type = slot1.type,
							win = slot1.win
						})

						return
					end

					slot0:doRetreat()
				elseif slot1.type == ChapterConst.OpMove then
					slot0:doCollectAI()
					slot0:doMove()
				elseif slot1.type == ChapterConst.OpBox then
					slot0:doCollectAI()
					slot0:doOpenBox()
				elseif slot1.type == ChapterConst.OpStory then
					slot0:doCollectAI()
					slot0:doPlayStory()
				elseif slot1.type == ChapterConst.OpAmbush then
					slot0:doAmbush()
				elseif slot1.type == ChapterConst.OpStrategy then
					slot0:doCollectAI()
					slot0:doStrategy()
				elseif slot1.type == ChapterConst.OpRepair then
					slot0:doRepair()
				elseif slot1.type == ChapterConst.OpSupply then
					slot0:doSupply()
				elseif slot1.type == ChapterConst.OpEnemyRound then
					slot0:doCollectAI()
					slot0:doEnemyRound()
				elseif slot1.type == ChapterConst.OpSubState then
					slot0:doSubState()
				elseif slot1.type == ChapterConst.OpBarrier then
					slot0:doBarrier()
				elseif slot1.type == ChapterConst.OpRequest then
					slot0:doRequest()
				elseif slot1.type == ChapterConst.OpSkipBattle then
					slot0:doSkipBattle()
				elseif slot1.type == ChapterConst.OpSubTeleport then
					slot0:doTeleportSub()
				end

				slot2:updateChapter(slot0.chapter, slot0.flag)
				slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
					type = slot1.type,
					id = slot1.id,
					arg1 = slot1.arg1,
					arg2 = slot1.arg2,
					path = slot0.move_path,
					fullpath = slot0.fullpath,
					items = slot0.items,
					exittype = slot1.exittype or 0,
					aiActs = slot0.aiActs,
					extraFlag = slot0.extraFlag or 0,
					oldLine = slot1.ordLine,
					extraFlagRemoveList = slot0.del_flag_list,
					extraFlagAddList = slot0.add_flag_list,
					win = slot1.win
				})
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("levelScene_operation", slot0.result))

			if pg.TipsMgr.GetInstance().ShowTips.type ~= ChapterConst.OpRequest and slot1.type ~= ChapterConst.OpRetreat and slot1.type ~= ChapterConst.OpSubTeleport then
				slot0:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest,
					id = slot1.id
				})
			end
		end
	end)
end

return class("ChapterOpCommand", import(".ChapterOpRoutine"))
