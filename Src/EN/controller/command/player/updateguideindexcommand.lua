class("UpdateGuideIndexCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().index

	if getProxy(PlayerProxy) then
		slot4:getData().guideIndex = slot3

		slot4:updatePlayer(slot4.getData())

		if slot3 == GUIDE_FINALE then
			SendAiriJPTracking(AIRIJP_TRACKING_TUTORIAL_COMPLETE_1, slot5.id)
		elseif slot3 == 801 then
			SendAiriJPTracking(AIRIJP_TRACKING_TUTORIAL_COMPLETE_2, slot5.id)
		elseif slot3 == 804 then
			SendAiriJPTracking(AIRIJP_TRACKING_TUTORIAL_COMPLETE_3, slot5.id)
		end
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
