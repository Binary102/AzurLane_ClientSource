class("PrayPoolBuildCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	print(ActivityConst.ACTIVITY_PRAY_POOL)
	print(1)
	print(slot3)
	print(slot1:getBody().shipIDList[1])
	print(slot1.getBody().shipIDList[2])
	pg.ConnectionMgr.GetInstance():Send(11202, {
		cmd = 1,
		activity_id = ActivityConst.ACTIVITY_PRAY_POOL,
		arg1 = slot1.getBody().pooltype,
		arg2 = slot1.getBody().shipIDList[1],
		arg3 = slot1.getBody().shipIDList[2]
	}, 11203, function (slot0)
		if slot0.result == 0 then
			getProxy(PrayProxy):updatePageState(PrayProxy.STAGE_BUILD_SUCCESS)
			slot0:sendNotification(PrayPoolConst.BUILD_PRAY_POOL_SUCCESS, PrayProxy.STAGE_BUILD_SUCCESS)
			pg.TipsMgr:GetInstance():ShowTips("构建成功")
		else
			pg.TipsMgr:GetInstance():ShowTips("构建失败")
		end
	end)
end

return class("PrayPoolBuildCommand", pm.SimpleCommand)
