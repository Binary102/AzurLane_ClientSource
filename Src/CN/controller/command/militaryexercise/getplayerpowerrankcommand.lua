class("GetPlayerPowerRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(18203, {
		type = slot1:getBody().type or 1,
		act_id = slot2.act_id
	}, 18204, function (slot0)
		slot1 = getProxy(MilitaryExerciseProxy)

		slot1:setPlayerPowerRank(slot0, slot0.point, slot0.rank, slot1)
	end)
end

return class("GetPlayerPowerRankCommand", pm.SimpleCommand)
