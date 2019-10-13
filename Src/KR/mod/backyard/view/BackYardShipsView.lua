slot0 = class("BackYardShipsView")

function slot0.emit(slot0, ...)
	slot0.view:emit(...)
end

function slot0.Ctor(slot0, slot1)
	slot0.view = slot1
	slot0.factory = slot1.factory
	slot0.shipModels = {}
end

function slot0.UpdateHouse(slot0, slot1)
	slot0.houseVO = slot1
	slot0.furnitureVOs = slot0.houseVO.furnitures
	slot0.boatVOs = slot0.houseVO.ships
end

function slot0.LoadAllShip(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.boatVOs) do
		table.insert(slot2, function (slot0)
			onNextTick(function ()
				if slot0.isExist then
					slot1()

					return
				end

				slot0:LoadShip(slot2, slot0)
			end)
		end)
	end

	seriesAsync(slot2, slot1)
end

function slot0.StartMoveShips(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.boatVOs) do
		if not slot7:hasInterActionFurnitrue() then
			table.insert(slot2, function (slot0)
				slot0:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot1.id)
				slot0()
			end)
		end
	end

	seriesAsync(slot2, slot1)
end

function slot0.LoadShip(slot0, slot1, slot2)
	slot0.factory:MakeBoat(slot1, function (slot0)
		slot1 = BackYardShipModel.New(slot0, slot0)
		slot1.shipModels[slot0.id] = slot1

		slot1:onLoadSlotModel(slot1.view)

		if slot1.onLoadSlotModel then
			slot2()
		end
	end)
end

function slot0.ExitShip(slot0, slot1)
	slot0.shipModels[slot1.id].dispose(slot2)

	slot0.shipModels[slot1.id] = nil
	slot0.boatVOs[slot1.id] = nil
end

function slot0.StopAllBoatMove(slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()

	slot2 = {}

	table.sort(slot3, function (slot0, slot1)
		return ((slot0.boatVO:hasSpineInterAction() and 1) or 0) > ((slot1.boatVO:hasSpineInterAction() and 1) or 0)
	end)

	function slot4(slot0, slot1)
		if not slot0.boatVO:hasSpineInterAction() then
			slot0:emit(BackyardMainMediator.CANCEL_SHIP_MOVE, slot0.boatVO.id)
			slot0:removeItem()
			slot0:updateShadowTF(false)

			if not slot0.boatVO:hasInterActionFurnitrue() then
				slot0.tf:SetAsLastSibling()
			end

			slot1()
		elseif slot0.furnitureVOs[slot0.boatVO:getSpineId()]:isTransPort() or slot4:isLoopSpineInterAction() then
			slot1()
		else
			slot0:breakSpineAnim(slot1)
		end
	end

	for slot8, slot9 in pairs(slot3) do
		table.insert(slot2, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	seriesAsync(slot2, function ()
		pg.UIMgr.GetInstance():LoadingOff()

		if pg.UIMgr.GetInstance().LoadingOff then
			slot0()
		end
	end)
end

function slot0.EnableTouch(slot0, slot1)
	slot2 = pairs
	slot3 = slot0.shipModels or {}

	for slot5, slot6 in slot2(slot3) do
		if not IsNil(slot6.go) then
			slot6:enableTouch(slot1)
		end
	end
end

function slot0.AnyShipInTransPort(slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot5:inTransport() then
			return true
		end
	end

	return false
end

function slot0.ReSort(slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot0.boatVOs[slot4]:getPosition() and not slot0.boatVOs[slot4]:hasInterActionFurnitrue() and not slot0.boatVOs[slot4]:hasSpineInterAction() then
			slot5:removeItem()
			slot5:createItem(slot6)
		end
	end
end

function slot0.CancelInterAction(slot0, slot1)
	slot0.shipModels[slot1]:CancelInterAction()
end

function slot0.CloseBodyMask(slot0, slot1)
	slot0.shipModels[slot1]:closeBodyMask()
end

function slot0.ClearSpine(slot0, slot1)
	slot0.shipModels[slot1]:clearSpine()
end

function slot0.ClearStageInterAction(slot0, slot1)
	slot0.shipModels[slot1]:clearStageInterAction()
end

function slot0.InterActionTransport(slot0, slot1, slot2)
	slot0.shipModels[slot1]:InterActionTransport(slot2)
end

function slot0.InterActionTransportAgain(slot0, slot1, slot2)
	slot0.shipModels[slot1]:InterActionTransportAgain(slot2)
end

function slot0.InterActionTransportEnd(slot0, slot1)
	slot0.shipModels[slot1]:InterActionTransportEnd(furnId)
end

function slot0.SetInterAction(slot0, slot1, slot2, slot3, slot4)
	if slot0.shipModels[slot2] then
		slot5:updateBoatVO(slot0.boatVOs[slot2])

		slot6 = slot0.furnitureVOs[slot3]

		if slot1 then
			slot5:updateSpineInterAction(slot6)
		else
			slot5:updateInterActionPos(slot6, slot4)
			slot5:InterActionSortSibling(slot3)
		end
	end
end

function slot0.SetStageInterAction(slot0, slot1, slot2)
	if slot0.shipModels[slot1] then
		slot3:updateStageInterAction(slot2)
	end
end

function slot0.ClearStageInterAction(slot0, slot1)
	if slot0.shipModels[slot1] then
		slot2:clearStageInterAction()
	end
end

function slot0.UpdateArchInteraction(slot0, slot1, slot2)
	if slot0.shipModels[slot1] then
		slot3:updateArchInterAction(slot2)
	end
end

function slot0.ClearArchInteration(slot0, slot1)
	if slot0.shipModels[slot1] then
		slot2:clearArchInterAction()
	end
end

function slot0.ClearSpineInteraction(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] then
		slot4:clearSpineInteraction(slot3)
		slot4:removeAllActionCB()
	end
end

function slot0.AddSpineExtra(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] then
		if slot0.furnitureVOs[slot1]:hasTailAction() then
			slot4:endSpineAnimator(slot5, slot3)
			slot4:startSpineAnimator(slot5, slot3)
			slot4:setAction(slot6, 0)
			slot4:addSpineExtra(slot1, slot3)
		else
			slot0.shipModels[slot5:getSpineId()].pauseAnim(slot7)

			for slot11, slot12 in ipairs(slot5:getShipExtra()) do
				slot13 = slot0.shipModels[slot12]

				if slot12 ~= slot2 then
					slot13:pauseAnim(slot11)
				else
					slot13:addSpineExtra(slot1, slot11)
					slot7:registerActionCB(slot12, function (slot0)
						slot0:setAction(slot0, 0)
					end, function ()
						slot0:endSpineAnimator(slot0, )
						slot0.endSpineAnimator:startSpineAnimator(slot0.endSpineAnimator, )
					end)
				end
			end

			slot7:resumeAnim()
		end
	end
end

function slot0.ClearSpineExtra(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] and slot0.furnitureVOs[slot1]:getSpineId() then
		slot4:clearSpineExtra(slot1, slot3)
		slot0.shipModels[slot6]:removeActionCB(slot2)
	end
end

function slot0.BoatMove(slot0, slot1, slot2, slot3)
	slot0.shipModels[slot1]:move(slot2, slot3)
end

function slot0.BoatMoveOnFurniture(slot0, slot1, slot2, slot3)
	slot0.shipModels[slot1]:moveOnFurniture(slot2, slot3)
end

function slot0.CancelShipMove(slot0, slot1)
	slot0.shipModels[slot1]:cancelMove()
end

function slot0.UpdateShipPos(slot0, slot1)
	slot0.boatVOs[slot1.id]:setPosition(slot1:getPosition())

	if slot0.shipModels[slot1.id] then
		slot3:updateBoatVO(slot0.boatVOs[slot1.id])
		slot3:updatePosition(slot2)
	end
end

function slot0.AcquireEffect(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot1] then
		slot4:acquireEffect(slot2, slot3)
	end
end

function slot0.AddBoatInimacyAndMoney(slot0, slot1)
	if slot0.shipModels[slot1.id] then
		slot2:updateInimacy(slot1:hasInimacy())
		slot2:updateMoney(slot1:hasMoney())
	else
		slot0.boatVOs[slot1.id].setInimacy(slot3, slot1.inimacy)
		slot0.boatVOs[slot1.id]:setMoney(slot1.money)
	end
end

function slot0.Destroy(slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		slot5:dispose()
	end

	slot0.shipModels = nil
	slot0.isExist = true
end

return slot0
