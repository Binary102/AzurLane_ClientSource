class("StartTechnologyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(TechnologyProxy):getTechnologyById(slot1:getBody().id) then
		return
	end

	if getProxy(TechnologyProxy):getActiveTechnologyCount() > 0 then
		return
	end

	slot6, slot7 = slot5:hasResToStart()

	if not slot6 then
		pg.TipsMgr:GetInstance():ShowTips(slot7)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(63001, {
		type = 1,
		tech_id = slot3
	}, 63002, function (slot0)
		if slot0.result == 0 then
			for slot5, slot6 in ipairs(slot1) do
				slot1:sendNotification(GAME.CONSUME_ITEM, Item.New({
					type = slot6[1],
					id = slot6[2],
					count = slot6[3]
				}))
			end

			slot0:start()
			slot0.start:updateTechnology(slot0)
			slot1:sendNotification(GAME.START_TECHNOLOGY_DONE, {
				technologyId = slot0.id
			})
			pg.TipsMgr:GetInstance():ShowTips(i18n("technology_start_up"))
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("technology_start_erro") .. slot0.result)
		end
	end)
end

return class("StartTechnologyCommand", pm.SimpleCommand)
