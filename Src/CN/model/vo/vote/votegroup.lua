slot0 = class("VoteGroup", import("..BaseVO"))

function slot0.Ctor(slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.id = slot2
	slot0.configId = slot0.id
end

function slot0.bindConfigTable(slot0)
	return pg.activity_vote
end

function slot0.getList(slot0)
	return slot0.list
end

function slot0.updateList(slot0, slot1)
	slot0.list = slot1
end

function slot0.sortList(slot0)
	_.sort(slot0.list, function (slot0, slot1)
		if slot0.votes == slot1.votes then
			return slot0.group < slot1.group
		else
			return slot1.votes < slot0.votes
		end
	end)

	slot1 = -1
	slot2 = 0
	slot3 = 1

	_.each(slot0.list, function (slot0)
		if slot0 == -1 or slot0.votes < slot0 then
			slot1 = slot1 + slot2
			slot0 = slot0.votes
			slot2 = 1
		else
			slot2 = slot2 + 1
		end

		slot0.rank = slot1
	end)
end

function slot0.getVoteShip(slot0, slot1)
	return _.detect(slot0.list, function (slot0)
		return slot0.group == slot0
	end)
end

function slot0.voteShip(slot0, slot1)
	if _.detect(slot0.list, function (slot0)
		return slot0.group == slot0
	end) and (slot0:getConfig("type") == VoteConst.RaceFinal or not slot2.ivoted) then
		slot2.ivoted = true
		slot2.votes = slot2.votes + 1
	end
end

function slot0.loveShip(slot0, slot1)
	if _.detect(slot0.list, function (slot0)
		return slot0.group == slot0
	end) and slot2.ivoted then
		slot2.votes = slot2.votes + 1
	end
end

function slot0.getVoteTimeStr(slot0)
	return i18n("vote_vote_time", table.concat(slot0:getConfig("time_vote")[1][1], "."), table.concat(slot0.getConfig("time_vote")[2][1], "."))
end

function slot0.getVoteGroupChar(slot0)
	return ({
		"A",
		"B",
		"C",
		"D"
	})[slot0.configId - pg.activity_vote.all[1] + 1]
end

return slot0
