slot0 = class("ChapterAIAction", import(".BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.line = {
		row = slot1.ai_pos.row,
		column = slot1.ai_pos.column
	}
	slot0.stgId = slot1.strategy_id

	if slot1.target_pos then
		slot0.stgTarget = {
			row = slot1.target_pos.row,
			column = slot1.target_pos.column
		}
	end

	slot0.movePath = _.map(slot1.move_path, function (slot0)
		return {
			row = slot0.row,
			column = slot0.column
		}
	end)
	slot0.shipUpdate = _.map(slot1.ship_update, function (slot0)
		return {
			id = slot0.id,
			hpRant = slot0.hp_rant
		}
	end)
	slot0.cellUpdates = {}

	_.each(slot1.map_update, function (slot0)
		if slot0.item_type ~= ChapterConst.AttachNone and slot0.item_type ~= ChapterConst.AttachBorn and slot0.item_type ~= ChapterConst.AttachBorn_Sub and (slot0.item_type ~= ChapterConst.AttachStory or slot0.item_data ~= ChapterConst.StoryTrigger) then
			table.insert(slot0.cellUpdates, (slot0.item_type == ChapterConst.AttachChampion and ChapterChampion.New(slot0)) or ChapterCell.New(slot0))
		end
	end)
end

function slot0.applyTo(slot0, slot1, slot2)
	if slot1:getChampion(slot0.line.row, slot0.line.column) then
		return slot0:applyToChampion(slot1, slot3, slot2)
	end

	if slot1:getChapterCell(slot0.line.row, slot0.line.column) and slot4.attachment == ChapterConst.AttachLandbase and pg.land_based_template[slot4.attachmentId].type == ChapterConst.LBCoastalGun then
		return slot0:applyToCoastalGun(slot1, slot4, slot2)
	end

	return false, "can not find any object at: [" .. slot0.line.row .. ", " .. slot0.line.column .. "]"
end

function slot0.applyToChampion(slot0, slot1, slot2, slot3)
	if slot2.flag == 1 then
		return false, "can not apply ai to dead champion at: [" .. slot0.line.row .. ", " .. slot0.line.column .. "]"
	end

	slot4 = 0

	if slot0.stgId > 0 then
		if not pg.strategy_data_template[slot0.stgId] then
			return false, "can not find strategy: " .. slot0.stgId
		end
	elseif #slot0.movePath > 0 then
		if _.any(slot0.movePath, function (slot0)
			return not slot0:getChapterCell(slot0.row, slot0.column) or not slot1.walkable
		end) then
			return false, "invalide move path"
		end

		if not slot3 then
			slot2.row = slot0.movePath[#slot0.movePath].row
			slot2.column = slot0.movePath[#slot0.movePath].column
			slot4 = bit.bor(slot4, ChapterConst.DirtyChampion)

			if slot1:existFleet(FleetType.Submarine, slot2.row, slot2.column) then
				slot4 = bit.bor(slot4, ChapterConst.DirtyFleet)
			end
		end
	end

	return true, slot4
end

function slot0.applyToCoastalGun(slot0, slot1, slot2, slot3)
	if slot2.flag == 1 then
		return false, "can not apply ai to dead coastalgun at: [" .. slot0.line.row .. ", " .. slot0.line.column .. "]"
	end

	slot4 = 0

	if not slot1:getFleet(FleetType.Normal, slot0.stgTarget.row, slot0.stgTarget.column) then
		return false, "can not find fleet at: [" .. slot0.stgTarget.row .. ", " .. slot0.stgTarget.column .. "]"
	end

	if not slot3 then
		slot5:increaseSlowSpeedFactor()

		slot4 = bit.bor(slot4, ChapterConst.DirtyFleet)

		_.each(slot0.cellUpdates, function (slot0)
			if isa(slot0, ChapterChampion) then
				slot0:mergeChampion(slot0)

				slot1 = bit.bor(bit.bor, ChapterConst.DirtyChampion)
			else
				slot0:mergeChapterCell(slot0)

				slot1 = bit.bor(bit.bor, ChapterConst.DirtyAttachment)
			end
		end)

		if #slot0.cellUpdates > 0 then
			slot4 = bit.bor(slot4, ChapterConst.DirtyAutoAction)
		end
	end

	return true, slot4
end

return slot0
