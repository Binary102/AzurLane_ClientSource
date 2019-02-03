slot0 = class("MainUIActBtnCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot4 = 0
	slot5 = nil

	for slot9, slot10 in pairs(slot3) do
		if not slot10:isEnd() and slot0:shouldNotify(slot10) then
			slot4 = slot4 + 1

			if not slot5 or (slot5 and slot10.id < slot5.id) then
				slot5 = slot10
			end
		end
	end

	slot0:sendNotification(GAME.MAINUI_ACT_BTN_DONE, {
		cnt = slot4,
		priority = slot5
	})
end

function slot0.shouldNotify(slot0, slot1)
	slot2 = slot1:getConfig("type")
	slot3 = false

	if not slot1:isShow() then
		return false
	end

	if slot2 == ActivityConst.ACTIVITY_TYPE_LEVELAWARD then
	elseif slot2 == ActivityConst.ACTIVITY_TYPE_BB then
	elseif slot2 ~= ActivityConst.ACTIVITY_TYPE_TASKS then
		if slot2 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		elseif slot2 == ActivityConst.ACTIVITY_TYPE_DODGEM or slot2 == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN or slot2 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
			return slot1:readyToAchieve()
		end
	end

	return slot3
end

return slot0
