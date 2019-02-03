class("UpdateGuideIndexCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().index

	if getProxy(PlayerProxy) then
		slot4:getData().guideIndex = slot3

		slot4:updatePlayer(slot4.getData())
	end

	if not slot2.cmd then
		if slot3 <= GUIDE_FINALE then
			pg.GuideMgr2:GetInstance():updateCurrentGuideStep(slot3)
		else
			pg.SystemOpenMgr:GetInstance():doNextSystemGuide(slot3)
		end
	end

	pg.ConnectionMgr.GetInstance():Send(11016, {
		guide_index = slot3
	})
end

return class("UpdateGuideIndexCommand", pm.SimpleCommand)
