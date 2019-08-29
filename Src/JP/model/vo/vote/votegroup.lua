slot0 = class("VoteGroup", import("..BaseVO"))
slot0.VOTE_STAGE = 1
slot0.STTLEMENT_STAGE = 2
slot0.DISPLAY_STAGE = 3

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.list = slot1.list
	slot0.onWeb = slot1.onWeb

	slot0:updateRankMap()
end

function slot0.isWeb(slot0)
	return slot0.onWeb
end

function slot0.bindConfigTable(slot0)
	return pg.activity_vote
end

function slot0.isResurrectionRace(slot0)
	return slot0:getConfig("type") == 4
end

function slot0.getList(slot0)
	return slot0.list
end

function slot0.UpdateVoteCnt(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.list) do
		if slot7:isSamaGroup(slot1) then
			slot7:UpdateVoteCnt(slot2)
		end
	end

	slot0:updateRankMap()
end

function slot0.updateRankMap(slot0)
	table.sort(slot0.list, function (slot0, slot1)
		if slot0.onWeb then
			return slot1.netVotes < slot0.netVotes
		else
			return slot1.votes < slot0.votes
		end
	end)

	slot0.rankMaps = {}

	for slot4, slot5 in ipairs(slot0.list) do
		slot0.rankMaps[slot5.group] = slot4
	end
end

function slot0.GetRank(slot0, slot1)
	return slot0.rankMaps[slot1.group] or 0
end

function slot0.GetStage(slot0)
	slot2 = slot0:getConfig("time_vote_client")
	slot3 = slot0:getConfig("time_show")

	if pg.TimeMgr.GetInstance():inTime(slot0:getConfig("time_vote")) then
		return slot0.VOTE_STAGE
	elseif pg.TimeMgr.GetInstance():inTime(slot2) then
		return slot0.STTLEMENT_STAGE
	elseif pg.TimeMgr.GetInstance():inTime(slot3) then
		return slot0.DISPLAY_STAGE
	end
end

return slot0
