class("FetchVoteInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(17201, {
		type = 0
	}, 17202, function (slot0)
		slot0:callback()
	end)
end

return class("FetchVoteInfoCommand", pm.SimpleCommand)
