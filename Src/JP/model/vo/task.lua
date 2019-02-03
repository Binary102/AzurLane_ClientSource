slot0 = class("Task", import(".BaseVO"))
slot1 = {
	"scenario",
	"branch",
	"routine",
	"weekly"
}
slot0.TASK_PROGRESS_UPDATE = 0
slot0.TASK_PROGRESS_APPEND = 1

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.progress = slot1.progress or 0
	slot0.acceptTime = slot1.accept_time
	slot0.submitTime = slot1.submit_time or 0
end

function slot0.isClientTrigger(slot0)
	return slot0:getConfig("sub_type") > 2000 and slot0:getConfig("sub_type") < 3000
end

function slot0.bindConfigTable(slot0)
	return pg.task_data_template
end

function slot0.isFinish(slot0)
	slot1 = slot0:getProgress()

	if slot0:getConfig("sub_type") == TASK_SUB_TYPE_FROM_TASKS then
		return slot1 >= #slot0:getConfig("target_id")
	else
		return slot0:getConfig("target_num") <= slot1
	end
end

function slot0.getProgress(slot0)
	slot1 = slot0.progress

	if slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
		slot1 = getProxy(BagProxy):getItemCountById(tonumber(slot0:getConfig("target_id_for_client")))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
		slot1 = getProxy(ActivityProxy):getVirtualItemNumber(slot0:getConfig("target_id_for_client"))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PT then
		slot1 = (getProxy(ActivityProxy):getActivityById(tonumber(slot0:getConfig("target_id_2"))) and slot2.data1) or 0
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		slot1 = getProxy(PlayerProxy):getData():getResById(slot0:getConfig("target_id_for_client"))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_BOSS_PT then
		if getProxy(ActivityProxy):getActivityById(ActivityConst.BOSS_BATTLE_PT) and not slot2:isEnd() then
			slot1 = getProxy(PlayerProxy):getData():getResById(tonumber(slot0:getConfig("target_id")))
		else
			slot1 = 0
		end
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_FROM_TASKS then
		slot3 = getProxy(TaskProxy)
		slot4 = nil
		slot1 = 0

		for slot8, slot9 in ipairs(slot2) do
			if slot3:getFinishTaskById(slot9) and slot4:isReceive() then
				slot1 = slot1 + 1
			end
		end
	elseif slot0:getConfig("sub_type") == TASK_SUB_STROY then
		slot2 = getProxy(PlayerProxy):getRawData()

		_.each(_.map(slot3, function (slot0)
			return slot0:getStoryByIndexID(slot0)
		end), function (slot0)
			slot1 = slot0:IsPlayed(slot0) and slot1 + 1
		end)

		slot1 = 0
	end

	return slot1
end

function slot0.isReceive(slot0)
	return slot0.submitTime > 0
end

function slot0.getTaskStatus(slot0)
	if slot0:isReceive() then
		return 2
	end

	if slot0:isFinish() then
		return 1
	end

	return 0
end

function slot0.onAdded(slot0)
	function slot1()
		if slot0:getConfig("sub_type") == 29 then
			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = pg.m02.sendNotification
			})
		elseif slot0:getConfig("added_tip") > 0 then
			slot0 = nil

			if getProxy(ContextProxy).getCurrentContext(slot1).mediator.__cname ~= TaskMediator.__cname then
				function slot0()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = slot0[slot1:getConfig("type")]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				noText = "text_iknow",
				yesText = "text_forward",
				content = i18n("tip_add_task", HXSet.hxLan(slot0:getConfig("name"))),
				onYes = slot0
			})
		end
	end

	if slot0:getConfig("story_id") and slot2 ~= "" then
		pg.StoryMgr.GetInstance():PlayOnTaskAdded(slot2, slot1, true, true)
	else
		slot1()
	end
end

function slot0.updateProgress(slot0, slot1)
	slot0.progress = slot1
end

function slot0.isSelectable(slot0)
	return slot0:getConfig("award_choice") ~= nil and type(slot1) == "table" and #slot1 > 0
end

return slot0
