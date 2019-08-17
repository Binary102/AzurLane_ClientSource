class("ActivityBossPageUpdateCommond", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(26031, {
		act_id = getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id).id
	}, 26032, function (slot0)
		if slot0.result == 0 then
			slot0.data1 = slot0.boss_hp
			slot0.data1_list = slot0.milestones
			slot0.data2 = slot0.death

			getProxy(ActivityProxy):updateActivity(slot0)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ActivityBossPageUpdateCommond", pm.SimpleCommand)
