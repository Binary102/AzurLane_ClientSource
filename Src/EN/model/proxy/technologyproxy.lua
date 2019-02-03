slot0 = class("TechnologyProxy", import(".NetProxy"))
slot0.TECHNOLOGY_ADDED = "TechnologyProxy:TECHNOLOGY_ADDED"
slot0.TECHNOLOGY_UPDATED = "TechnologyProxy:TECHNOLOGY_UPDATED"
slot0.BLUEPRINT_ADDED = "TechnologyProxy:BLUEPRINT_ADDED"
slot0.BLUEPRINT_UPDATED = "TechnologyProxy:BLUEPRINT_UPDATED"
slot0.REFRESH_UPDATED = "TechnologyProxy:REFRESH_UPDATED"

function slot0.register(slot0)
	slot0:on(63000, function (slot0)
		slot0:updateTechnologys(slot0)

		slot0.refreshTechnologysFlag = slot0.refresh_flag or 0
	end)

	slot0.bluePrintData = {}

	_.each(pg.ship_data_blueprint.all, function (slot0)
		slot0.bluePrintData[ShipBluePrint.New({
			id = slot0
		}).id] = ShipBluePrint.New()
	end)
	slot0:on(63100, function (slot0)
		for slot4, slot5 in ipairs(slot0.blueprint_list) do
			slot0.bluePrintData[slot5.id]:updateInfo(slot5)
		end

		slot0.coldTime = slot0.cold_time or 0
	end)
end

function slot0.updateBlueprintStates(slot0)
	slot1 = pairs
	slot2 = slot0.bluePrintData or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:updateState()
	end
end

function slot0.getColdTime(slot0)
	return slot0.coldTime
end

function slot0.updateColdTime(slot0)
	slot0.coldTime = pg.TimeMgr.GetInstance():GetServerTime() + 86400
end

function slot0.updateRefreshFlag(slot0, slot1)
	slot0.refreshTechnologysFlag = slot1

	slot0:sendNotification(slot0.REFRESH_UPDATED, slot0.refreshTechnologysFlag)
end

function slot0.updateTechnologys(slot0, slot1)
	slot0.data = {}

	for slot5, slot6 in ipairs(slot1.tech_list) do
		slot0:addTechnology(Technology.New(slot6))
	end
end

function slot0.getActiveTechnologyCount(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:isStart() then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function slot0.getActiveTechnology(slot0)
	slot1 = pairs
	slot2 = slot0.data or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5:isStart() then
			return Clone(slot5)
		end
	end
end

function slot0.getTechnologyById(slot0, slot1)
	return slot0.data[slot1]:clone()
end

function slot0.addTechnology(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.TECHNOLOGY_ADDED, slot1:clone())
end

function slot0.updateTechnology(slot0, slot1)
	slot0.data[slot1.id] = slot1

	slot0:sendNotification(slot0.TECHNOLOGY_UPDATED, slot1:clone())
end

function slot0.getTechnologys(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0.data or {}

	for slot5, slot6 in slot2(slot3) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.getBluePrints(slot0)
	return Clone(slot0.bluePrintData)
end

function slot0.getBluePrintById(slot0, slot1)
	return Clone(slot0.bluePrintData[slot1])
end

function slot0.getRawBluePrintById(slot0, slot1)
	return slot0.bluePrintData[slot1]
end

function slot0.addBluePrint(slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(slot0.BLUEPRINT_ADDED, slot1:clone())
end

function slot0.updateBluePrint(slot0, slot1)
	slot0.bluePrintData[slot1.id] = slot1

	slot0:sendNotification(slot0.BLUEPRINT_UPDATED, slot1:clone())
end

function slot0.getBuildingBluePrint(slot0)
	for slot4, slot5 in pairs(slot0.bluePrintData) do
		if slot5:isDeving() or slot5:isFinished() then
			return slot5
		end
	end
end

return slot0
