slot0 = class("BackYardMediator", import("..base.ContextMediator"))
slot0.GO_SHOP = "BackYardMediator:GO_SHOP"
slot0.GO_GRANARY = "BackYardMediator:GO_GRANARY"
slot0.GO_SHIPINFO = "BackYardMediator:GO_SHIPINFO"
slot0.OPEN_ADD_EXP = "BackYardMediator:OPEN_ADD_EXP"
slot0.RENAME = "BackYardMediator:RENAME"
slot0.OPEN_NOFOOD = "BackYardMediator:OPEN_NOFOOD"
slot0.ON_SWITCH_FLOOR = "BackYardMediator:ON_SWITCH_FLOOR"
slot0.ON_SHOPPING = "BackYardMediator:ON_SHOPPING"
slot0.ITEM_UPDATED = "BackYardMediator:ITEM_UPDATED"

function slot0.register(slot0)
	slot0.backyardPoolMgr = BackyardPoolMgr.New()
	slot2 = slot0
	slot1 = slot0.startUpBackyard
	slot3 = slot0.contextData.floor or 1
	slot5, slot5 = slot1(slot2, slot3)

	slot0:bind(slot0.GO_GRANARY, function (slot0)
		BackYardMediator.isInitAddExpPanel = true

		slot0:addSubLayers(Context.New({
			mediator = BackyardGranaryMediator,
			viewComponent = BackyardGranaryLayer
		}))

		return
	end)
	slot0:bind(slot0.ON_SHOPPING, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.SHOPPING, {
			id = slot1,
			count = slot2
		})

		return
	end)
	slot0:bind(slot0.OPEN_ADD_EXP, function (slot0, slot1)
		if mode == BackYardConst.MODE_VISIT then
			return
		end

		slot0:sendNotification(GAME.OPEN_ADD_EXP, slot1)

		return
	end)
	slot0:bind(slot0.GO_SHOP, function (slot0)
		BackYardMediator.isInitAddExpPanel = true

		slot0:addSubLayers(Context.New({
			mediator = BackYardShopMediator,
			viewComponent = BackYardShopLayer
		}))

		return
	end)
	slot0:bind(slot0.GO_SHIPINFO, function (slot0, slot1)
		BackYardMediator.isInitAddExpPanel = true

		slot0.viewComponent:closeNofoodBox(true)
		slot0:addSubLayers(Context.New({
			mediator = BackYardShipInfoMediator,
			viewComponent = BackYardShipInfoLayer,
			data = {
				type = slot1
			}
		}))

		return
	end)
	slot0:bind(slot0.RENAME, function (slot0, slot1)
		slot0:sendNotification(GAME.BACKYARD_RENAME, slot1)

		return
	end)
	slot0:bind(slot0.ON_SWITCH_FLOOR, function (slot0, slot1)
		slot0:quitBackYard()
		slot0:startUpBackyard(slot1)

		return
	end)
	slot0.viewComponent:setPlayerVO(slot1)
	slot0.viewComponent:setDormVO(slot2)

	return

	slot3 = 1
end

function slot0.startUpBackyard(slot0, slot1)
	if not getProxy(DormProxy) then
		return
	end

	if not slot0.backyardPoolMgr then
		return
	end

	playBGM(slot0.viewComponent:getBGM())

	if not slot0.contextData.mode then
		slot2 = BackYardConst.MODE_DEFAULT
	end

	slot0.contextData.floor = slot1

	slot0.viewComponent:updateFloor()

	pg.backyard = pm.Facade.getInstance("m02.backyard")

	pg.backyard:registerCommand(BACKYARD.START_UP, StartUpBackYardCommand)
	pg.backyard:registerCommand(BACKYARD.COMMAND_BACKYARD_BOAT, BYBoatCommand)
	pg.backyard:registerCommand(BACKYARD.COMMAND_BACKYARD_FURNITURE, BYFurnitureCommand)
	pg.backyard:registerCommand(BACKYARD.COMMAND_BACKYARD_HOUSE, BYHouseCommand)

	slot3 = {}
	slot4 = {}
	slot5 = nil

	if slot2 == BackYardConst.MODE_VISIT then
		if slot1 ~= 1 or not Ship.STATE_TRAIN then
			slot6 = Ship.STATE_REST
		end

		for slot10, slot11 in pairs(slot0.contextData.ships) do
			if slot11.state == slot6 then
				slot3[slot11.id] = slot11
			end
		end

		slot5 = slot0.contextData.dorm
		player = slot0.contextData.player
	else
		if slot2 == BackYardConst.MODE_DEFAULT then
			slot0.dormProxy = getProxy(DormProxy)
			slot5 = slot0.dormProxy:getData()
			slot6 = slot0.dormProxy:getShipsByState(Ship.STATE_TRAIN)
			slot7 = slot0.dormProxy:getShipsByState(Ship.STATE_REST)

			if slot1 ~= 1 or not slot6 then
				slot3 = slot7
			end

			player = getProxy(PlayerProxy).getData(slot8)

			slot0.viewComponent:setShipIds(slot6, slot7)
		end
	end

	slot6 = pg.backyard.sendNotification

	function pg.backyard.sendNotification(slot0, slot1, slot2, slot3)
		if BackYardConst.MODE_VISIT == slot0 and (BACKYARD.BOAT_ADDITION_DONE == slot1 or slot1 == BACKYARD.BOAT_ADDITION_DONE) then
			return
		end

		slot1(slot0, slot1, slot2, slot3)

		return
	end

	pg.backyard:sendNotification(BACKYARD.START_UP, {
		ships = slot3,
		furnitures = slot5:getFurnitrues(slot1),
		level = slot5.level
	})

	slot0.viewComponent.isLoadedMainUI = false
	slot7 = nil

	function slot8(slot0)
		if pg.backyard and not IsNil(slot0.viewComponent._tf) then
			slot0.viewComponent.isLoadedMainUI = true
			slot0.name = BackYardConst.MAIN_UI_NAME

			slot0.viewComponent:setBlackyardView(slot1)
			setActive(slot0, true)
			setParent(slot0, slot0.viewComponent._tf)
			tf(slot0):SetSiblingIndex(1)
			pg.backyard:registerMediator(BackyardMainMediator.New(slot1))
			slot1:init()
		end

		return
	end

	if not IsNil(slot0.viewComponent._tf:Find(BackYardConst.MAIN_UI_NAME)) then
		slot8(slot9)
	else
		PoolMgr.GetInstance():GetUI(BackYardConst.MAIN_UI_NAME, true, slot8)
	end

	getProxy(DormProxy).floor = slot0.contextData.floor

	return player, slot5
end

function slot0.quitBackYard(slot0)
	pg.backyard:removeMediator(BackyardMainMediator.__cname)
	pg.backyard:removeProxy(BackYardHouseProxy.__cname)
	pg.backyard:removeCommand(StartUpBackYardCommand.__cname)
	pg.backyard:removeCommand(BYBoatCommand.__cname)
	pg.backyard:removeCommand(BYFurnitureCommand.__cname)
	pg.backyard:removeCommand(BYHouseCommand.__cname)
	pm.Facade.removeCore("m02.backyard")

	pg.backyard = nil

	return
end

function slot0.remove(slot0)
	if not IsNil(slot0.viewComponent._tf:Find(BackYardConst.MAIN_UI_NAME)) then
		PoolMgr.GetInstance():ReturnUI(BackYardConst.MAIN_UI_NAME, slot1)
	end

	slot0.viewComponent:emit(BackYardMediator.OPEN_ADD_EXP, 0)
	slot0:quitBackYard()
	slot0.backyardPoolMgr:clear()

	slot0.backyardPoolMgr = nil

	return
end

function slot0.listNotificationInterests(slot0)
	return {
		DormProxy.DORM_UPDATEED,
		DormProxy.SHIPS_EXP_ADDED,
		PlayerProxy.UPDATED,
		GAME.PUT_FURNITURE_DONE,
		GAME.OPEN_BACKYARD_GARNARY,
		GAME.BACKYARD_RENAME_DONE,
		BackYardMediator.OPEN_NOFOOD,
		GAME.OPEN_BACKYARD_SHOP,
		BagProxy.ITEM_UPDATED,
		BagProxy.ITEM_ADDED,
		GAME.ADD_SHIP_DONE,
		GAME.EXIT_SHIP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()

	if slot0.contextData.mode == BackYardConst.MODE_VISIT then
		return
	end

	if slot2 == DormProxy.DORM_UPDATEED then
		slot0.viewComponent:setShipIds(slot4, slot5)
		slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
	else
		if slot2 == GAME.PUT_FURNITURE_DONE then
			slot0.viewComponent:setDormVO(slot0.dormProxy:getData())
		else
			if slot2 == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
				if pg.backyard then
					pg.backyard:sendNotification(slot0.ITEM_UPDATED)
				end
			else
				if slot2 == PlayerProxy.UPDATED then
					if getProxy(PlayerProxy) then
						slot0.viewComponent:setPlayerVO(slot4:getData())
					end
				else
					if slot2 == BackYardMediator.OPEN_NOFOOD then
						slot0.viewComponent:openNofoodBox()
					else
						if slot2 == DormProxy.SHIPS_EXP_ADDED then
							if not BackYardMediator.isInitAddExpPanel then
								BackYardMediator.isInitAddExpPanel = true
								slot7 = slot0.dormProxy:getData().load_exp * table.getCount(slot4)

								if table.getCount(slot4) ~= 0 and (slot7 ~= 0 or slot6.food ~= 0) then
									slot0.viewComponent:closeNofoodBox(true)
									slot0:addSubLayers(Context.New({
										mediator = BackYardSettlementMediator,
										viewComponent = BackYardSettlementLayer,
										data = {
											oldShips = slot3.oldShips,
											newShips = slot3.newShips
										}
									}))
								else
									if slot6.food == 0 and slot5 > 0 then
										slot0.viewComponent:openNofoodBox()
									end
								end
							end
						else
							if slot2 == GAME.BACKYARD_RENAME_DONE then
								slot0.viewComponent:closeRenameBox()
							else
								if slot2 == GAME.OPEN_BACKYARD_GARNARY then
									slot0:addSubLayers(Context.New({
										mediator = BackYardGarnitureMediator,
										viewComponent = BackYardGarnitureLayer
									}), nil, function ()
										if slot0 and slot0.callback then
											slot0.callback()
										end

										return
									end)
								else
									if slot2 == GAME.OPEN_BACKYARD_SHOP then
										slot0:addSubLayers(Context.New({
											mediator = BackYardShopMediator,
											viewComponent = BackYardShopLayer
										}))
									else
										if slot2 == GAME.ADD_SHIP_DONE then
											if not pg.backyard then
												return
											end

											if slot0.contextData.floor ~= slot3.type then
												return
											end

											pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
												name = BACKYARD.SHIP_ADDED,
												id = slot3.id
											})
										else
											if slot2 == GAME.EXIT_SHIP_DONE then
												if not pg.backyard then
													return
												end

												if not getBackYardProxy(BackYardHouseProxy):existShip(slot3.id) then
													return
												end

												pg.backyard:sendNotification(BACKYARD.COMMAND_BACKYARD_BOAT, {
													name = BACKYARD.SHIP_EXITED,
													id = slot3.id
												})
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return
end

return slot0
