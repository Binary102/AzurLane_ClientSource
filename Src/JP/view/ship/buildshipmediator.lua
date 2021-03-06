slot0 = class("BuildShipMediator", import("..base.ContextMediator"))
slot0.OPEN_DESTROY = "BuildShipMediator OPEN_CHUANWUSTART"
slot0.OPEN_START_PROJECT = "BuildShipMediator OPEN_START_PROJECT"
slot0.GET_BATCH_SHIP = "BuildShipMediator GET_BATCH_SHIP"
slot0.ACTIVITY_OPERATION = "BuildShipMediator ACTIVITY_OPERATION"
slot0.OPEN_PROJECT_LIST = "BuildShipMediator OPEN_PROJECT_LIST"
slot0.REMOVE_PROJECT_LIST = "BuildShipMediator REMOVE_PROJECT_LIST"
slot0.ON_BUILD = "BuildShipMediator ON_BUILD"
slot0.ACT_ON_BUILD = "BuildShipMediator ACT_ON_BUILD"
slot0.OPEN_EXCHANGE = "BuildShipMediator OPEN_EXCHANGE"
slot0.CLOSE_EXCHANGE = "BuildShipMediator CLOSE_EXCHANGE"
slot0.ON_UPDATE_ACT = "BuildShipMediator ON_UPDATE_ACT"
slot0.OPEN_PRAY_PAGE = "BuildShipMediator OPEN_PRAY_PAGE"
slot0.CLOSE_PRAY_PAGE = "BuildShipMediator CLOSE_PRAY_PAGE"

function slot0.register(slot0)
	slot0.viewComponent:setPlayer(slot2)

	slot0.useItem = pg.ship_data_create_material[1].use_item

	slot0.viewComponent:setUseItem(slot4)
	slot0.viewComponent:setFlagShip(slot6)

	slot7 = getProxy(BuildShipProxy)

	slot0.viewComponent:setStartCount(table.getCount(slot8))
	slot0:checkActivityBuild()
	slot0:bind(slot0.OPEN_DESTROY, function (slot0)
		slot1 = slot0:fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_1)

		slot1:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			blockLock = true,
			prevFlag = false,
			selectedMax = 10,
			mode = DockyardScene.MODE_DESTROY,
			leftTopInfo = i18n("word_destroy"),
			onShip = Ship.canDestroyShip,
			ignoredIds = slot1,
			preView = slot1.viewComponent.__cname
		})
	end)
	slot0:bind(slot0.OPEN_PROJECT_LIST, function (slot0)
		if slot0.facade:hasMediator(BuildShipDetailMediator.__cname) then
			return
		end

		slot0:addSubLayers(Context.New({
			mediator = BuildShipDetailMediator,
			viewComponent = BuildShipDetailLayer,
			data = {
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_BUILDSHIPSCENE
			}
		}))
	end)
	slot0:bind(slot0.REMOVE_PROJECT_LIST, function (slot0)
		if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(BuildShipDetailMediator) then
			slot0:sendNotification(GAME.REMOVE_LAYERS, {
				context = slot3
			})
		end
	end)
	slot0:bind(slot0.ON_BUILD, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.BUILD_SHIP, {
			buildId = slot1,
			count = slot2
		})
	end)
	slot0:bind(slot0.ACT_ON_BUILD, function (slot0, slot1, slot2, slot3)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot1,
			arg1 = slot3,
			buildId = slot2
		})
	end)
	slot0:bind(slot0.OPEN_EXCHANGE, function (slot0)
		if slot0.facade:hasMediator(ExchangeShipMediator.__cname) then
			return
		end

		slot0:addSubLayers(Context.New({
			mediator = ExchangeShipMediator,
			viewComponent = ExchangeShipLayer,
			data = {
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_BUILDSHIPSCENE
			}
		}))
	end)
	slot0:bind(slot0.ON_UPDATE_ACT, function (slot0)
		slot0.viewComponent:setActivity(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1))
		slot0.viewComponent:updateActivityBuildPage()
	end)
	slot0:bind(slot0.CLOSE_EXCHANGE, function (slot0)
		if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(ExchangeShipMediator) then
			slot0:sendNotification(GAME.REMOVE_LAYERS, {
				context = slot3
			})
		end
	end)
	slot0:bind(slot0.OPEN_PRAY_PAGE, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = PrayPoolMediator,
			viewComponent = PrayPoolScene,
			data = {
				LayerWeightMgr_groupName = LayerWeightConst.GROUP_BUILDSHIPSCENE
			}
		}))
	end)
	slot0:bind(slot0.CLOSE_PRAY_PAGE, function (slot0)
		if getProxy(ContextProxy).getCurrentContext(slot1):getContextByMediator(PrayPoolMediator) then
			slot0:sendNotification(GAME.REMOVE_LAYERS, {
				context = slot3
			})
		end
	end)
	slot0.viewComponent:updateQueueTip(slot7:getFinishCount())

	if slot0.contextData.goToPray == true then
		slot0.viewComponent:switchPage(slot0.viewComponent.PAGE_PRAY, true)
	end
end

function slot0.checkActivityBuild(slot0)
	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1) and not slot2:isEnd() then
		slot0.viewComponent:setActivity(slot2)
	elseif slot0.contextData.projectName == BuildShipScene.PROJECTS.ACTIVITY then
		slot0.contextData.projectName = nil
	end
end

function slot0.buildFinishComeback(slot0)
	if table.getCount(getProxy(BuildShipProxy):getData()) == 0 and slot0.viewComponent then
		if (BuildShip.getPageFromPoolType(slot1:getLastBuildShipPoolType()) or BuildShipScene.PAGE_BUILD) == BuildShipScene.PAGE_PRAY and (not getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_PRAY_POOL) or slot3:isEnd()) then
			slot2 = BuildShipScene.PAGE_BUILD
		end

		triggerToggle(slot0.viewComponent.toggles[slot2], true)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.BUILD_SHIP_DONE,
		BagProxy.ITEM_UPDATED,
		BagProxy.ITEM_ADDED,
		PlayerProxy.UPDATED,
		GAME.EXCHANGE_SHIP_DONE,
		GAME.GET_SHIP_DONE,
		GAME.SKIP_SHIP_DONE,
		GAME.SKIP_BATCH_DONE,
		BuildShipProxy.ADDED,
		BuildShipProxy.REMOVED,
		ActivityProxy.ACTIVITY_ADDED
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.GET_SHIP_DONE then
		slot0:addSubLayers(Context.New({
			mediator = NewShipMediator,
			viewComponent = NewShipLayer,
			data = {
				ship = slot3.ship,
				quitCallBack = slot3.quitCallBack,
				canSkipBatch = slot3.canSkipBatch
			},
			onRemoved = function ()
				if not slot0.isBatch then
					slot1:buildFinishComeback()
				end
			end
		}))
		slot0.viewComponent:updateQueueTip(getProxy(BuildShipProxy).getFinishCount(slot4))
	elseif slot2 == GAME.SKIP_SHIP_DONE then
		slot0.viewComponent:updateQueueTip(getProxy(BuildShipProxy).getFinishCount(slot4))
	elseif slot2 == GAME.SKIP_BATCH_DONE then
		if #slot3 > 0 then
			slot0.viewComponent:emit(BaseUI.ON_AWARD, {
				items = slot3
			}, AwardInfoLayer.TITLE.SHIP, function ()
				slot0:buildFinishComeback()
			end)
		else
			slot0:buildFinishComeback()
		end
	elseif slot2 == GAME.BUILD_SHIP_DONE then
		triggerToggle(slot0.viewComponent.toggles[BuildShipScene.PAGE_QUEUE], true)
	elseif slot2 == GAME.EXCHANGE_SHIP_DONE then
		slot0:addSubLayers(Context.New({
			mediator = NewShipMediator,
			viewComponent = NewShipLayer,
			data = {
				ship = slot3
			}
		}))
	elseif slot2 == BagProxy.ITEM_UPDATED or slot2 == BagProxy.ITEM_ADDED then
		slot0.viewComponent:setUseItem(getProxy(BagProxy).getItemById(slot4, slot0.useItem))
	elseif slot2 == BuildShipProxy.ADDED or slot2 == BuildShipProxy.REMOVED then
		slot0.viewComponent:setStartCount(table.getCount(getProxy(BuildShipProxy):getRawData()))
	elseif slot2 == ActivityProxy.ACTIVITY_ADDED then
		slot0:checkActivityBuild()
	end
end

return slot0
