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

	if slot2 == ActivityConst.ACTIVITY_TYPE_TASKS or slot2 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		slot4 = getProxy(TaskProxy)

		if _.any(_.flatten(slot1:getConfig("config_data")), function (slot0)
			return (slot0:getTaskById(slot0) or slot0:getFinishTaskById(slot0)) and slot0:getTaskById() or slot0:getFinishTaskById():isFinish() and not slot0.getTaskById() or slot0.getFinishTaskById():isReceive()
		end) then
			slot3 = true
		end

		return slot3
	end

	return slot1:readyToAchieve()
end

return slot0
