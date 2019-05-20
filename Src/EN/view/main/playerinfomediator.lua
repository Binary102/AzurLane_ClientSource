slot0 = class("PlayerInfoMediator", import("..base.ContextMediator"))
slot0.CHANGE_NAME = "PlayerInfoMediator:CHANGE_NAME"
slot0.CHANGE_PAINT = "PlayerInfoMediator:CHANGE_ICON"
slot0.CHANGE_MANIFESTO = "PlayerInfoMediator:CHANGE_MANIFESTO"
slot0.GO_BACKYARD = "PlayerInfoMediator:GO_BACKYARD"
slot0.GO_COLLECTION = "PlayerInfoMediator:GO_COLLECTION"
slot0.CHANGE_SKIN = "PlayerInfoMediator:CHANGE_SKIN"
slot0.ON_CHANGE_PLAYER_NAME = "PlayerInfoMediator:ON_CHANGE_PLAYER_NAME"
slot0.ON_CHANGE_MEDAL_DISPLAY = "PlayerInfoMediator:ON_CHANGE_MEDAL_DISPLAY"
slot0.ON_ATTIRE = "PlayerInfoMediator:ON_ATTIRE"

function slot0.register(slot0)
	slot0:bind(slot0.ON_CHANGE_PLAYER_NAME, function (slot0, slot1)
		slot0:sendNotification(GAME.CHANGE_PLAYER_NAME, {
			name = slot1
		})
	end)
	slot0.viewComponent:setPlayer(slot2)

	slot3 = getProxy(BayProxy)

	slot0.viewComponent:setShipCount(slot3:getShipCount())

	slot0.shipVO = slot3:getShipById(getProxy(PlayerProxy).getData(slot1).character)

	slot0.viewComponent:setFlagShip(slot4)

	slot5 = getProxy(CollectionProxy)

	slot0.viewComponent:setCollectionRate(slot5:getCollectionRate())
	slot0.viewComponent:setTrophyList(slot5:getTrophys())
	slot0.viewComponent:setMilitaryExercise(getProxy(MilitaryExerciseProxy).getSeasonInfo(slot6))

	slot7 = {
		inExercise = true,
		inChapter = false,
		inPvp = false,
		inFleet = false,
		inClass = false,
		inTactics = false,
		inBackyard = false,
		inSham = false,
		inEvent = false,
		inAdmiral = true
	}

	table.insert(slot8, curFlagShipId)

	for slot13, slot14 in pairs(slot9) do
		if slot14:isActivityNpc() then
			table.insert(slot8, slot14.id)
		end
	end

	slot0:bind(slot0.CHANGE_PAINT, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			flags = slot1,
			ignoredIds = slot2,
			onShip = function (slot0)
				if slot0 == slot0.id then
					return false, i18n("playerinfo_ship_is_already_flagship")
				end

				return true
			end,
			onSelected = function (slot0)
				slot0.contextData.shipIdToAdd = slot0[1]
			end
		})
	end)
	slot0:bind(slot0.GO_BACKYARD, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.BACKYARD)
	end)
	slot0:bind(slot0.CHANGE_SKIN, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = SwichSkinMediator,
			viewComponent = SwichSkinLayer,
			data = {
				shipVO = slot1
			}
		}), nil)
	end)
	slot0:bind(slot0.GO_COLLECTION, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COLLECTSHIP)
	end)
	slot0:bind(slot0.CHANGE_MANIFESTO, function (slot0, slot1)
		slot0:sendNotification(GAME.CHANGE_PLAYER_MANIFESTO, {
			manifesto = slot1
		})
	end)
	slot0:bind(slot0.ON_ATTIRE, function ()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ATTIRE)
	end)

	if slot0.contextData.shipIdToAdd then
		slot0:sendNotification(GAME.CHANGE_PLAYER_ICON, {
			characterId = slot0.contextData.shipIdToAdd
		})
	end

	slot0.viewComponent:setFleetGearScore(slot10)
	slot0.viewComponent:updateFleetGSView()
	slot0:bind(slot0.ON_CHANGE_MEDAL_DISPLAY, function (slot0, slot1)
		slot0:sendNotification(GAME.CHANGE_PLAYER_MEDAL_DISPLAY, {
			medalList = slot1
		})
	end)
	slot0.viewComponent:updateAttireBtn(_.any(getProxy(AttireProxy):needTip(), function (slot0)
		return slot0 == true
	end))
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		GAME.CHANGE_PLAYER_ICON_DONE,
		GAME.CHANGE_PLAYER_NAME_DONE,
		GAME.CHANGE_PLAYER_MEDAL_DISPLAY_DONE,
		GAME.CHANGE_PAINT,
		BayProxy.SHIP_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.CHANGE_PLAYER_ICON_DONE then
		slot0.shipVO = slot3.ship

		slot0.viewComponent:setFlagShip(slot0.shipVO)

		slot0.contextData.shipIdToAdd = nil
	elseif slot2 == GAME.CHANGE_PLAYER_NAME_DONE then
		slot0.viewComponent:updatePlayerName()
		slot0.viewComponent:closeChangePlayerNamePanel()
	elseif slot2 == GAME.CHANGE_PLAYER_MEDAL_DISPLAY_DONE then
		slot0.viewComponent:updateMedalDisplay(getProxy(PlayerProxy).getData(slot4).displayTrophyList)
		slot0.viewComponent:closeAddMedalPanel()
	elseif slot2 == BayProxy.SHIP_UPDATED and slot3.id == slot0.shipVO.id then
		slot0.viewComponent:setFlagShip(slot3)
	end
end

return slot0
