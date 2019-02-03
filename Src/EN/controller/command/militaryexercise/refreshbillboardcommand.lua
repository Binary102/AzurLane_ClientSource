class("RefreshBillboardCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18006, {
		type = 0
	}, 18007, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.arena_rank_lsit) do
			slot7 = Arenarank.New(slot6)

			slot7:setRank(slot5)
			table.insert(slot1, slot7)
		end

		getProxy(MilitaryExerciseProxy):updateArenaRankLsit(slot1)
	end)
end

return class("RefreshBillboardCommand", pm.SimpleCommand)
