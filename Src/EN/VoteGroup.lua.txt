slot0 = class("VoteGroup", import("..BaseVO"))

slot0.Ctor = function (slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.id = slot2
	slot0.configId = slot0.id
end

slot0.bindConfigTable = function (slot0)
	return pg.activity_vote
end

slot0.getList = function (slot0)
	return slot0.list
end

slot0.updateList = function (slot0, slot1)
	slot0.list = slot1
end

slot0.sortList = function (slot0)
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

slot0.getVoteShip = function (slot0, slot1)
	return _.detect(slot0.list, function (slot0)
		return slot0.group == slot0
	end)
end

slot0.voteShip = function (slot0, slot1)
	if _.detect(slot0.list, function (slot0)
		return slot0.group == slot0
	end) and (slot0:getConfig("type") == VoteConst.RaceFinal or not slot2.ivoted) then
		slot2.ivoted = true
		slot2.votes = slot2.votes + 1
	end
end

slot0.loveShip = function (slot0, slot1)
	if _.detect(slot0.list, function (slot0)
		return slot0.group == slot0
	end) and slot2.ivoted then
		slot2.votes = slot2.votes + 1
	end
end

slot0.getVoteTimeStr = function (slot0)
	return i18n("vote_vote_time", table.concat(slot0:getConfig("time_vote")[1][1], "."), table.concat(slot0.getConfig("time_vote")[2][1], "."))
end

slot0.getVoteGroupChar = function (slot0)
	return ({
		"A",
		"B",
		"C",
		"D"
	})[slot0.configId - pg.activity_vote.all[1] + 1]
end

return slot0
