slot0 = class("VoteProxy", import(".NetProxy"))
slot0.VOTE_GROUP_UPDATE = "VoteProxy:VOTE_GROUP_UPDATE"

slot0.register = function (slot0)
	slot0.votes = 0
	slot0.loves = 0
	slot0.voteGroup = nil
	slot0.lastRequestTime = 0
end

slot0.initVoteGroup = function (slot0, slot1, slot2, slot3)
	slot0.votes = slot3.daily_vote
	slot0.loves = slot3.love_vote
	slot4 = {}
	slot5 = {}

	if pg.activity_vote[slot2].type == VoteConst.RacePrimary then
		slot5 = slot6.group_data
	elseif slot6.type == VoteConst.RaceFinal then
		slot5 = slot1.data1_list
	end

	_.each(slot5, function (slot0)
		slot1 = VoteShip.New({
			votes = 0,
			group = slot0
		})
		slot1.ivoted = table.contains(slot0.daily_ship_list, slot0)

		table.insert(slot1, slot1)
	end)

	slot7 = VoteGroup.New(slot1.id, slot2)

	slot7:updateList(slot4)

	slot0.voteGroup = slot7
end

slot0.updateRankInfo = function (slot0, slot1)
	slot2 = {}

	_.each(slot1.list, function (slot0)
		slot0[slot0.id] = slot0.count
	end)
	_.each(slot0.voteGroup:getList(), function (slot0)
		if slot0[slot0.group] then
			slot0.votes = slot0[slot0.group]
		end
	end)
	slot0.voteGroup:sortList()
end

slot0.getVoteGroup = function (slot0)
	return Clone(slot0.voteGroup)
end

slot0.setVoteGroup = function (slot0, slot1)
	slot0.voteGroup = slot1

	slot0:sendNotification(slot0.VOTE_GROUP_UPDATE)
end

return slot0
