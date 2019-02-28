slot0 = class("BattleMediator", import("..base.ContextMediator"))
slot0.ON_BATTLE_RESULT = "BattleMediator:ON_BATTLE_RESULT"
slot0.ON_PAUSE = "BattleMediator:ON_PAUSE"
slot0.ENTER = "BattleMediator:ENTER"
slot0.ON_BACK_PRE_SCENE = "BattleMediator:ON_BACK_PRE_SCENE"
slot0.ON_LEAVE = "BattleMediator:ON_LEAVE"
slot0.ON_CHAT = "BattleMediator:ON_CHAT"
slot0.CLOSE_CHAT = "BattleMediator:CLOSE_CHAT"
slot0.ON_AUTO = "BattleMediator:ON_AUTO"

function slot0.register(slot0)
	slot0:GenBattleData()

	slot1 = ys.Battle.BattleState.GetInstance()
	slot2 = slot0.contextData.system

	slot0:bind(slot0.ON_BATTLE_RESULT, function (slot0, slot1)
		slot0:sendNotification(GAME.FINISH_STAGE, {
			token = slot0.contextData.token,
			mainFleetId = slot0.contextData.mainFleetId,
			stageId = slot0.contextData.stageId,
			rivalId = slot0.contextData.rivalId,
			memory = slot0.contextData.memory,
			exitCallback = slot0.contextData.exitCallback,
			system = slot1,
			statistics = slot1,
			actID = slot0.contextData.actId
		})
	end)
	slot0:bind(slot0.ON_AUTO, function (slot0, slot1)
		slot0:onAutoBtn(slot1)
	end)
	slot0:bind(slot0.ON_PAUSE, function (slot0)
		slot0:onPauseBtn()
	end)
	slot0:bind(slot0.ON_LEAVE, function (slot0)
		slot0:warnFunc()
	end)
	slot0:bind(slot0.ON_CHAT, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			data = {
				form = NotificationLayer.FORM_BATTLE,
				chatViewParent = slot1
			}
		}))
	end)
	slot0:bind(slot0.ENTER, function (slot0)
		slot0:EnterBattle(slot1._battleData, slot1.contextData.prePause)
	end)
	slot0:bind(slot0.ON_BACK_PRE_SCENE, function ()
		slot0 = getProxy(ContextProxy)
		slot2 = slot0:getContextByMediator(LevelMediator2)
		slot3 = slot0:getContextByMediator(ActivityBossBattleMediator2)

		if slot0:getContextByMediator(DailyLevelMediator) then
			if slot0 == SYSTEM_CHALLENGE then
				getProxy(ChallengeProxy).escapeChallenge(slot4)
				slot1:removeChild(slot1:getContextByMediator(ChallengePreCombatMediator))
			else
				slot1:removeChild(slot1:getContextByMediator(PreCombatMediator))
			end
		elseif slot2 then
			if slot0 == SYSTEM_DUEL then
			elseif slot0 == SYSTEM_SHAM then
				slot2:removeChild(slot2:getContextByMediator(ShamPreCombatMediator))
			elseif slot0 == SYSTEM_GUILD then
				if slot2:getContextByMediator(GuildPreCombatMediator) then
					slot2:removeChild(slot4)
				end
			elseif slot0 == SYSTEM_SCENARIO then
				slot2:removeChild(slot2:getContextByMediator(ChapterPreCombatMediator))
			elseif slot0 ~= SYSTEM_PERFORM then
				slot2:removeChild(slot2:getContextByMediator(PreCombatMediator))
			end
		elseif slot3 and slot3:getContextByMediator(PreCombatMediator) then
			slot3:removeChild(slot4)
		end

		slot1:sendNotification(GAME.GO_BACK)
	end)

	if getProxy(PlayerProxy) then
		slot0.player = slot3:getData()

		slot3:setFlag("battle", true)
	end
end

function slot0.onAutoBtn(slot0, slot1)
	slot0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = slot1.isOn,
		toggle = slot1.toggle
	})
end

function slot0.onPauseBtn(slot0)
	slot1 = ys.Battle.BattleState.GetInstance()

	if slot0.contextData.system == SYSTEM_PROLOGUE or slot0.contextData.system == SYSTEM_PERFORM then
		slot2 = {}

		if EPILOGUE_SKIPPABLE then
			table.insert(slot2, 1, {
				text = "关爱胡德",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = function ()
					slot0:Deactive()
					slot0:sendNotification(GAME.GO_SCENE, SCENE.CREATE_PLAYER)
				end
			})
		end

		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = i18n("help_battle_rule"),
			onClose = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = slot2
		})
		slot1:Pause()
	elseif slot0.contextData.system == SYSTEM_DODGEM then
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = i18n("help_battle_warspite"),
			onClose = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				{
					text = "text_cancel_fight",
					btnType = pg.MsgboxMgr.BUTTON_RED,
					onCallback = function ()
						slot0:warnFunc(function ()
							ys.Battle.BattleState.GetInstance():Resume()
						end)
					end
				}
			}
		})
		slot1:Pause()
	else
		slot0.viewComponent:updatePauseWindow()
		slot1:Pause()
	end
end

function slot0.warnFunc(slot0, slot1)
	slot2 = ys.Battle.BattleState.GetInstance()
	slot4, slot5 = nil

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		hideYes = true,
		hideNo = true,
		content = (slot0.contextData.system ~= SYSTEM_CHALLENGE or i18n("battle_battleMediator_clear_warning")) and i18n("battle_battleMediator_quest_exist"),
		onClose = slot1,
		custom = {
			{
				text = "text_cancel_g",
				onCallback = slot1,
				sound = SFX_CANCEL
			},
			{
				text = "text_exit",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = function ()
					slot0:Stop()
				end,
				sound = SFX_CONFIRM
			}
		}
	})
end

function slot0.guideDispatch(slot0)
	return
end

function slot1(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot1:getActiveEquipments()) do
		if slot8 then
			slot3[#slot3 + 1] = {
				id = slot8.configId,
				skin = slot8.skinId
			}
		else
			slot3[#slot3 + 1] = {
				skin = 0,
				id = slot8
			}
		end
	end

	slot4 = ys.Battle.BattleDataFunction.GenerateHiddenBuff(slot1.configId)

	for slot8, slot9 in pairs(slot1.skills) do
		if slot9 and slot9.id == 11720 and not slot1.transforms[3612] then
		else
			slot4[({
				level = slot9.level,
				id = ys.Battle.BattleDataFunction.SkillTranform(slot0, slot9.id)
			})["id"]] = 
		end
	end

	for slot8, slot9 in pairs(slot1:getTriggerSkills()) do
		slot4[({
			level = slot9.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(slot0, slot9.id)
		})["id"]] = 
	end

	return {
		id = slot1.id,
		tmpID = slot1.configId,
		skinId = slot1.skinId,
		level = slot1.level,
		equipment = slot3,
		properties = slot1:getProperties(slot2),
		proficiency = slot1:getEquipProficiencyList(),
		rarity = slot1:getRarity(),
		shipGS = slot1:getShipCombatPower(),
		skills = slot4,
		baseList = slot1:getBaseList(),
		preloasList = slot1:getPreLoadCount(),
		name = slot1:getName()
	}
end

function slot0.GenBattleData(slot0)
	slot0._battleData = {
		battleType = slot0.contextData.system,
		StageTmpId = slot0.contextData.stageId,
		MainUnitList = {},
		VanguardUnitList = {},
		SubUnitList = {},
		SubFlag = -1,
		ActID = slot0.contextData.actId
	}
	slot3 = getProxy(BayProxy)
	slot4 = {}

	if slot0.contextData.system == SYSTEM_SCENARIO or slot2 == SYSTEM_SHAM or slot2 == SYSTEM_GUILD or slot2 == SYSTEM_CHALLENGE then
		slot5 = getProxy(ChapterProxy)
		slot6 = nil

		if slot2 == SYSTEM_SCENARIO then
			slot1.RepressInfo = slot5:getActiveChapter():getRepressInfo()
		elseif slot2 == SYSTEM_SHAM then
			slot6 = slot5:getShamChapter()
		elseif slot2 == SYSTEM_GUILD then
			slot6 = slot5:getGuildChapter()
		elseif slot2 == SYSTEM_CHALLENGE then
			slot1.ChallengeInfo = getProxy(ChallengeProxy):getCurrentChallengeInfo()
		end

		slot0.viewComponent:setChapter(slot6)

		slot1.ChapterBuffIDs, slot1.CommanderList = slot6:getFleetBattleBuffs(slot7)
		slot8 = _.values(slot6.fleet.getCommanders(slot7))
		slot9 = {}
		slot10 = slot6.fleet.getShipsByTeam(slot7, TeamType.Main, false)
		slot11 = slot6.fleet.getShipsByTeam(slot7, TeamType.Vanguard, false)
		slot12 = {}

		if _.detect(slot6.fleets, function (slot0)
			return slot0:getFleetType() == FleetType.Submarine and slot0:isValid() and slot0:inHuntingRange(slot0.line.row, slot0.line.column)
		end) then
			slot15 = getProxy(PlayerProxy).getRawData(slot14)
			slot16, slot17 = slot6:getFleetCost(slot7)
			slot18, slot19 = slot6:getFleetAmmo(slot13)

			if slot19 <= 0 then
				slot1.SubFlag = ys.Battle.BattleConst.SubAidFlag.AMMO_EMPTY
				slot1.TotalSubAmmo = 0
			elseif slot15.oil < slot13:getSummonCost() + slot17.oil then
				slot1.SubFlag = ys.Battle.BattleConst.SubAidFlag.OIL_EMPTY
				slot1.TotalSubAmmo = 0
			else
				slot1.SubFlag = 1
				slot1.TotalSubAmmo = 1
				slot12 = slot13:getShipsByTeam(TeamType.Submarine, false)
			end

			slot9 = _.values(slot13:getCommanders())
			slot20, slot1.SubCommanderList = slot6:getFleetBattleBuffs(slot13)
		else
			slot1.SubFlag = ys.Battle.BattleConst.SubAidFlag.AID_EMPTY
		end

		slot0.mainShips = {}

		for slot17, slot18 in ipairs(slot10) do
			slot20 = slot18.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot0(slot2, slot18, slot8).initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.MainUnitList, slot0(slot2, slot18, slot8))
		end

		for slot17, slot18 in ipairs(slot11) do
			slot20 = slot18.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot0(slot2, slot18, slot8).initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.VanguardUnitList, slot0(slot2, slot18, slot8))
		end

		for slot17, slot18 in ipairs(slot12) do
			slot20 = slot18.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot0(slot2, slot18, slot9).initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.SubUnitList, slot0(slot2, slot18, slot9))
		end

		slot0.viewComponent:setFleet(slot10, slot11, slot12)
	elseif slot2 == SYSTEM_HP_SHARE_ACT_BOSS then
		if slot0.contextData.mainFleetId then
			slot8 = getProxy(FleetProxy).getActivityFleets(slot5)[slot0.contextData.actId][11]
			slot9 = _.values(getProxy(FleetProxy).getActivityFleets(slot5)[slot0.contextData.actId][slot0.contextData.mainFleetId].getCommanders(slot7))
			slot1.CommanderList = getProxy(FleetProxy).getActivityFleets(slot5)[slot0.contextData.actId][slot0.contextData.mainFleetId].buildBattleBuffList(slot7)
			slot0.mainShips = slot3:getShipsByFleet(slot7)
			slot10 = {}
			slot11 = {}
			slot12 = {}

			for slot17, slot18 in ipairs(slot13) do
				if table.contains(slot4, slot18) then
					BattleVertify.cloneShipVertiry = true
				end

				slot4[#slot4 + 1] = slot18

				table.insert(slot10, slot19)
				table.insert(slot1.MainUnitList, slot0(slot2, slot19, slot9))
			end

			for slot18, slot19 in ipairs(slot14) do
				if table.contains(slot4, slot19) then
					BattleVertify.cloneShipVertiry = true
				end

				slot4[#slot4 + 1] = slot19

				table.insert(slot11, slot20)
				table.insert(slot1.VanguardUnitList, slot0(slot2, slot20, slot9))
			end

			slot15 = _.values(slot8:getCommanders())

			for slot20, slot21 in ipairs(slot16) do
				if table.contains(slot4, slot21) then
					BattleVertify.cloneShipVertiry = true
				end

				slot4[#slot4 + 1] = slot21

				table.insert(slot12, slot22)
				table.insert(slot1.SubUnitList, slot0(slot2, slot22, slot15))
			end

			slot18 = getProxy(PlayerProxy).getRawData(slot17)
			slot19 = slot8:GetCostSum().oil + slot7:GetCostSum().oil

			if slot8:isLegalToFight() == true and slot19 < slot18.oil then
				slot1.SubFlag = 1
				slot1.TotalSubAmmo = 1
			end

			slot1.SubCommanderList = slot8:buildBattleBuffList()

			slot0.viewComponent:setFleet(slot10, slot11, slot12)
		end
	elseif slot0.contextData.mainFleetId then
		slot6, slot7 = nil
		slot0.mainShips = slot3:getShipsByFleet(slot6)
		slot8 = {}
		slot9 = {}
		slot10 = {}

		for slot15, slot16 in ipairs(slot11) do
			if table.contains(slot4, slot16) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot16

			table.insert(slot8, slot17)
			table.insert(slot1.MainUnitList, slot0(slot2, slot17))
		end

		for slot16, slot17 in ipairs(slot12) do
			if table.contains(slot4, slot17) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot17

			table.insert(slot9, slot18)
			table.insert(slot1.VanguardUnitList, slot0(slot2, slot18))
		end

		slot0.viewComponent:setFleet(slot8, slot9, slot10)
	end

	slot1.RivalVanguardUnitList = {}
	slot1.RivalMainUnitList = {}
	slot5 = nil

	if slot2 == SYSTEM_SHAM then
		slot7 = getProxy(ChapterProxy).getShamChapter(slot6)
		slot5 = slot7:getChapterCell(slot7.fleet.line.row, slot7.fleet.line.column).rival
	elseif slot2 == SYSTEM_DUEL and slot0.contextData.rivalId then
		slot6 = getProxy(MilitaryExerciseProxy)
		slot5 = slot6:getRivalById(slot0.contextData.rivalId)
		slot0.oldRank = slot6:getSeasonInfo()
	end

	if slot5 then
		slot1.RivalVO = slot5
		slot6 = 0

		for slot10, slot11 in ipairs(slot5.mainShips) do
			slot6 = slot6 + slot11.level
		end

		for slot10, slot11 in ipairs(slot5.vanguardShips) do
			slot6 = slot6 + slot11.level
		end

		BattleVertify.rivalLevel = slot6

		for slot10, slot11 in ipairs(slot5.mainShips) do
			if not slot11.hpRant or slot11.hpRant > 0 then
				slot12 = slot0(slot2, slot11)

				if slot11.hpRant then
					slot12.initHPRate = slot11.hpRant * 0.0001
				end

				table.insert(slot1.RivalMainUnitList, slot12)
			end
		end

		for slot10, slot11 in ipairs(slot5.vanguardShips) do
			if not slot11.hpRant or slot11.hpRant > 0 then
				slot12 = slot0(slot2, slot11)

				if slot11.hpRant then
					slot12.initHPRate = slot11.hpRant * 0.0001
				end

				table.insert(slot1.RivalVanguardUnitList, slot12)
			end
		end
	end

	slot7 = slot0.contextData.prefabFleet.vanguard_unitList

	if slot0.contextData.prefabFleet.main_unitList then
		for slot11, slot12 in ipairs(slot6) do
			slot13 = {}

			for slot17, slot18 in ipairs(slot12.equipment) do
				slot13[#slot13 + 1] = {
					skin = 0,
					id = slot18
				}
			end

			table.insert(slot1.MainUnitList, {
				id = slot12.id,
				tmpID = slot12.configId,
				skinId = slot12.skinId,
				level = slot12.level,
				equipment = slot13,
				properties = slot12.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = slot12.skills
			})
		end
	end

	if slot7 then
		for slot11, slot12 in ipairs(slot7) do
			slot13 = {}

			for slot17, slot18 in ipairs(slot12.equipment) do
				slot13[#slot13 + 1] = {
					skin = 0,
					id = slot18
				}
			end

			table.insert(slot1.VanguardUnitList, {
				id = slot12.id,
				tmpID = slot12.configId,
				skinId = slot12.skinId,
				level = slot12.level,
				equipment = slot13,
				properties = slot12.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = slot12.skills
			})
		end
	end

	if slot2 == SYSTEM_HP_SHARE_ACT_BOSS then
		slot1.SpecificBossHPRate = slot0.contextData.specificBossHPRate
	end

	slot1.DropInfoList = slot0.contextData.drops
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.FINISH_STAGE_DONE,
		GAME.STORY_BEGIN,
		GAME.STORY_END,
		GAME.END_GUIDE,
		GAME.START_GUIDE,
		GAME.PAUSE_BATTLE,
		slot0.CLOSE_CHAT
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()
	slot4 = ys.Battle.BattleState.GetInstance()

	if slot1:getName() == GAME.FINISH_STAGE_DONE then
		pg.MsgboxMgr.GetInstance():hide()
		gcAll(true)

		if slot3.system == SYSTEM_PROLOGUE then
			ys.Battle.BattleState.GetInstance():Deactive()
			slot0:sendNotification(GAME.GO_SCENE, SCENE.CREATE_PLAYER)
		elseif slot5 == SYSTEM_PERFORM then
			ys.Battle.BattleState.GetInstance():Deactive()
			slot0.viewComponent:exitBattle()

			if slot3.exitCallback then
				slot3.exitCallback()
			end
		else
			slot6 = nil

			slot0:addSubLayers(Context.New({
				mediator = BattleResultMediator,
				viewComponent = (slot5 ~= SYSTEM_CHALLENGE or BattleChallengeResultLayer) and (slot5 ~= SYSTEM_DODGEM or BattleDodgemResultLayer) and (slot5 ~= SYSTEM_HP_SHARE_ACT_BOSS or BattleContributionResultLayer) and BattleResultLayer,
				data = {
					system = slot5,
					rivalId = slot0.contextData.rivalId,
					mainFleetId = slot0.contextData.mainFleetId,
					stageId = slot0.contextData.stageId,
					oldMainShips = slot0.mainShips,
					oldPlayer = slot0.player,
					oldRank = slot0.oldRank,
					statistics = slot3.statistics,
					score = slot3.score,
					drops = slot3.drops,
					prefabFleet = slot3.prefabFleet,
					commanderExps = slot3.commanderExps,
					actId = slot0.contextData.actId,
					result = slot3.result
				}
			}))
		end
	elseif slot2 == GAME.STORY_BEGIN then
		slot4:Pause()
	elseif slot2 == GAME.STORY_END then
		slot4:Resume()
	elseif slot2 == GAME.START_GUIDE then
		slot4:Pause()
	elseif slot2 == GAME.END_GUIDE then
		slot4:Resume()
	elseif slot2 == GAME.PAUSE_BATTLE then
		if not slot4:IsPause() then
			slot0:onPauseBtn()
		end
	elseif slot2 == slot0.CLOSE_CHAT then
		slot0.viewComponent:OnCloseChat()
	end
end

return slot0
