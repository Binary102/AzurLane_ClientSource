slot0 = class("PreCombatMediator", import("..base.ContextMediator"))
slot0.ON_START = "PreCombatMediator:ON_START"
slot0.ON_CHANGE_FLEET = "PreCombatMediator:ON_CHANGE_FLEET"
slot0.ON_COMMIT_EDIT = "PreCombatMediator:ON_COMMIT_EDIT"
slot0.ON_ABORT_EDIT = "PreCombatMediator:ON_ABORT_EDIT"
slot0.OPEN_SHIP_INFO = "PreCombatMediator:OPEN_SHIP_INFO"
slot0.REMOVE_SHIP = "PreCombatMediator:REMOVE_SHIP"
slot0.CHANGE_FLEET_SHIPS_ORDER = "PreCombatMediator:CHANGE_FLEET_SHIPS_ORDER"
slot0.CHANGE_FLEET_SHIP = "PreCombatMediator:CHANGE_FLEET_SHIP"
slot0.ON_AUTO = "PreCombatMediator:ON_AUTO"

function slot0.register(slot0)
	slot1 = getProxy(BayProxy)

	slot1:setSelectShipId(nil)

	slot0.ships = slot1:getRawData()

	slot0.viewComponent:SetShips(slot0.ships)

	slot2 = getProxy(FleetProxy)
	slot3 = nil

	if slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS then
		slot3 = slot2:getActivityFleets()[slot0.contextData.actID]
	else
		slot3 = slot2:getData()

		if slot2.EdittingFleet ~= nil then
			slot3[slot2.EdittingFleet.id] = slot2.EdittingFleet
		end
	end

	slot0.viewComponent:SetFleets(slot3)
	slot0.viewComponent:SetPlayerInfo(slot5)
	slot0:bind(slot0.ON_ABORT_EDIT, function (slot0)
		slot0:abortEditting()
	end)

	if slot0.contextData.system == SYSTEM_DUEL then
		slot0.viewComponent:SetCurrentFleet(FleetProxy.PVP_FLEET_ID)
	elseif slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS then
		slot0.viewComponent:SetCurrentFleet(1)
	else
		slot0.viewComponent:SetStageID(slot0.contextData.stageId)
		slot0.viewComponent:SetCurrentFleet(slot4.combatFleetId)
	end

	slot0:bind(slot0.ON_CHANGE_FLEET, function (slot0, slot1)
		slot0:changeFleet(slot1)
	end)
	slot0:bind(slot0.ON_AUTO, function (slot0, slot1)
		slot0:onAutoBtn(slot1)
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIPS_ORDER, function (slot0, slot1)
		slot0:refreshEdit(slot1)
		slot0.viewComponent:MarkEdited()
	end)
	slot0:bind(slot0.REMOVE_SHIP, function (slot0, slot1, slot2)
		FormationMediator.removeShipFromFleet(slot2, slot1)
		slot0:refreshEdit(slot2)
		slot0.viewComponent:MarkEdited()
	end)
	slot0:bind(slot0.OPEN_SHIP_INFO, function (slot0, slot1, slot2)
		slot0.contextData.form = PreCombatLayer.FORM_EDIT
		slot3 = {}

		for slot7, slot8 in ipairs(slot2:getShipIds()) do
			table.insert(slot3, slot0.ships[slot8])
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = slot1,
			shipVOs = slot3
		})
	end)
	slot0:bind(slot0.CHANGE_FLEET_SHIP, function (slot0, slot1, slot2, slot3)
		slot0.contextData.form = PreCombatLayer.FORM_EDIT
		slot4 = {}

		FormationMediator.saveEdit()

		slot5, slot6 = nil

		if slot1 == nil then
			slot5 = false
			slot6 = nil
		else
			slot5 = #slot2.ships > 1
			slot6 = slot1.id
		end

		slot7 = slot0.contextData.system == SYSTEM_DUEL

		if slot2.id == FleetProxy.PVP_FLEET_ID then
			for slot12, slot13 in pairs(slot8) do
				if slot13:isActivityNpc() then
					table.insert(slot4, slot13.id)
				end
			end
		end

		slot8 = (slot7 and {
			inExercise = true,
			inChapter = false,
			inPvp = false,
			inFleet = false,
			inClass = false,
			inTactics = false,
			inBackyard = false,
			inSham = false,
			inEvent = true,
			inAdmiral = true
		}) or {
			inExercise = true,
			inChapter = true,
			inPvp = false,
			inFleet = true,
			inClass = false,
			inTactics = false,
			inBackyard = false,
			inSham = true,
			inEvent = true,
			inAdmiral = true
		}
		slot9, slot10, slot11 = nil

		if slot2.id == FleetProxy.PVP_FLEET_ID then
			slot9, slot10, slot11 = FormationMediator.getDockCallbackFuncsForExercise(slot0, slot1, slot2, slot3)
		else
			slot9, slot10, slot11 = FormationMediator.getDockCallbackFuncs(slot0, slot1, slot2, slot3)
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMin = 0,
			selectedMax = 1,
			ignoredIds = slot4,
			activeShipId = slot6,
			leastLimitMsg = i18n("battle_preCombatMediator_leastLimit"),
			quitTeam = slot5,
			blackBlockShipIds = getProxy(BayProxy):getBlackBlackShipIds(slot0.__cname, {
				fleetId = slot2.id,
				team = slot3,
				activeShipId = slot6
			}),
			teamFilter = slot3,
			onShip = slot9,
			confirmSelect = slot10,
			onSelected = slot11,
			flags = slot8
		})
	end)
	slot0:bind(slot0.ON_COMMIT_EDIT, function (slot0, slot1)
		slot0:commitEdit(slot1)
	end)
	slot0:bind(slot0.ON_START, function (slot0, slot1)
		function slot2()
			if slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS then
				slot0.contextData.func()
			else
				(not slot0.contextData.rivalId or slot0.contextData.rivalId) and slot0.contextData.stageId:sendNotification(GAME.BEGIN_STAGE, {
					stageId = (not slot0.contextData.rivalId or slot0.contextData.rivalId) and slot0.contextData.stageId,
					mainFleetId = slot1,
					system = (not slot0.contextData.rivalId or slot0.contextData.rivalId) and slot0.contextData.stageId.contextData.system,
					rivalId = (not slot0.contextData.rivalId or slot0.contextData.rivalId) and slot0.contextData.stageId.contextData.rivalId
				})
			end
		end

		if slot0.contextData.system == SYSTEM_DUEL then
			slot2()
		else
			slot3, slot4 = nil

			if slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS then
				slot3 = slot1:getActivityFleets()[slot0.contextData.actID][1]
				slot4 = "ship_energy_low_warn_no_exp"
			else
				slot3 = slot1:getFleetById(slot1)
			end

			slot5 = {}

			for slot9, slot10 in ipairs(slot3.ships) do
				table.insert(slot5, slot2:getShipById(slot10))
			end

			if slot3.name == "" or slot6 == nil then
				slot6 = Fleet.DEFAULT_NAME[slot1]
			end

			if Fleet.EnergyCheck(slot5, slot6, slot2, slot4) then
				slot2()
			end
		end
	end)
end

function slot0.changeFleet(slot0, slot1)
	getProxy(PlayerProxy).combatFleetId = slot1

	slot0.viewComponent:SetCurrentFleet(slot1)
	slot0.viewComponent:UpdateFleetView(true)
	slot0.viewComponent:SetFleetStepper()
end

function slot0.refreshEdit(slot0, slot1)
	getProxy(FleetProxy).EdittingFleet = slot1
	slot3 = nil
	(slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS or slot2:getActivityFleets()[slot0.contextData.actID]) and slot2:getData()[slot1.id] = slot1

	slot0.viewComponent:SetFleets((slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS or slot2.getActivityFleets()[slot0.contextData.actID]) and slot2.getData())
	slot0.viewComponent:UpdateFleetView(false)
end

function slot0.commitEdit(slot0, slot1)
	if getProxy(FleetProxy).EdittingFleet == nil or slot3:isFirstFleet() or slot3:isLegalToFight() == true then
		if slot0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS then
			slot2:commitActivityFleet(slot0.contextData.actID)
			slot1()
		else
			slot2:commitEdittingFleet(slot1)
		end
	elseif #slot3.ships == 0 then
		slot2:commitEdittingFleet(slot1)
		slot0:changeFleet(1)
	else
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_formationMediaror_trash_warning", slot3.defaultName),
			onYes = function ()
				slot0 = getProxy(BayProxy)
				slot1 = slot0:getRawData()

				for slot6 = #slot0.ships, 1, -1 do
					slot0:removeShip(slot1[slot2[slot6]])
				end

				if slot0.id == FleetProxy.PVP_FLEET_ID then
					slot1:commitEdittingFleet()
					slot2:changeFleet(FleetProxy.PVP_FLEET_ID)
					slot2.viewComponent:swtichToPreviewMode()
				else
					slot1:commitEdittingFleet(slot1.commitEdittingFleet)
					slot2:changeFleet(1)
				end
			end,
			onNo = function ()
				return
			end
		})
	end
end

function slot0.onAutoBtn(slot0, slot1)
	slot0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = slot1.isOn,
		toggle = slot1.toggle
	})
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.BEGIN_STAGE_DONE,
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_ERRO
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:SetPlayerInfo(getProxy(PlayerProxy):getData())
	elseif slot2 == GAME.BEGIN_STAGE_ERRO and slot3 == 3 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("battle_preCombatMediator_timeout"),
			onYes = function ()
				slot0.viewComponent:emit(BaseUI.ON_CLOSE)
			end
		})
	end
end

return slot0
