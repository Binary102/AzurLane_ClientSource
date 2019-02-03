slot0 = class("PlayerInfoMediator", import("..base.ContextMediator"))
slot0.CHANGE_NAME = "PlayerInfoMediator:CHANGE_NAME"
slot0.CHANGE_PAINT = "PlayerInfoMediator:CHANGE_ICON"
slot0.CHANGE_MANIFESTO = "PlayerInfoMediator:CHANGE_MANIFESTO"
slot0.GO_BACKYARD = "PlayerInfoMediator:GO_BACKYARD"
slot0.GO_COLLECTION = "PlayerInfoMediator:GO_COLLECTION"
slot0.ON_CHANGE_PLAYER_NAME = "PlayerInfoMediator:ON_CHANGE_PLAYER_NAME"

function slot0.register(slot0)
	slot0:bind(slot0.ON_CHANGE_PLAYER_NAME, function (slot0, slot1)
		slot0:sendNotification(GAME.CHANGE_PLAYER_NAME, {
			name = slot1
		})
	end)
	slot0.viewComponent:setPlayer(slot2)

	slot3 = getProxy(BayProxy)

	slot0.viewComponent:setShipCount(slot3:getShipCount())
	slot0.viewComponent:setFlagShip(slot4)
	slot0.viewComponent:setCollectionRate(getProxy(CollectionProxy).getCollectionRate(slot5))
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
	slot0:bind(slot0.GO_COLLECTION, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COLLECTSHIP)
	end)
	slot0:bind(slot0.CHANGE_MANIFESTO, function (slot0, slot1)
		slot0:sendNotification(GAME.CHANGE_PLAYER_MANIFESTO, {
			manifesto = slot1
		})
	end)

	if slot0.contextData.shipIdToAdd then
		slot0:sendNotification(GAME.CHANGE_PLAYER_ICON, {
			characterId = slot0.contextData.shipIdToAdd
		})
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		GAME.CHANGE_PLAYER_ICON_DONE,
		GAME.CHANGE_PLAYER_NAME_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.CHANGE_PLAYER_ICON_DONE then
		slot0.viewComponent:setFlagShip(slot3.ship)

		slot0.contextData.shipIdToAdd = nil
	elseif slot2 == GAME.CHANGE_PLAYER_NAME_DONE then
		slot0.viewComponent:updatePlayerName()
		slot0.viewComponent:closeChangePlayerNamePanel()
	end
end

return slot0
