slot0 = class("ActivityPtData")

function slot0.Ctor(slot0, slot1)
	slot0.dropList = slot1:getDataConfig("drop_client")
	slot0.targets = slot1:getDataConfig("target")
	slot0.resId = slot1:getDataConfig("pt")
	slot0.bindActId = slot1:getDataConfig("id_2")

	slot0:Update(slot1)
end

function slot0.Update(slot0, slot1)
	slot0.activity = slot1
	slot0.count = slot1.data1
	slot0.level = 0

	for slot5, slot6 in ipairs(slot0.targets) do
		if slot6 == slot1.data2 then
			slot0.level = slot5

			break
		end
	end

	slot0.value2 = slot1.data3
end

function slot0.GetLevelProgress(slot0)
	return slot0.level, #slot0.targets, slot0.level / #slot0.targets
end

function slot0.GetResProgress(slot0)
	return slot0.count, slot0.targets[math.min(slot0.level + 1, #slot0.targets)], slot0.count / slot0.targets[math.min(slot0.level + 1, #slot0.targets)]
end

function slot0.GetId(slot0)
	return slot0.activity.id
end

function slot0.GetRes(slot0)
	return {
		type = 1,
		id = slot0.resId
	}
end

function slot0.GetAward(slot0)
	return {
		type = slot0.dropList[math.min(#slot0.targets, slot0.level + 1)][1],
		id = slot0.dropList[math.min(#slot0.targets, slot0.level + 1)][2],
		count = slot0.dropList[math.min(#slot0.targets, slot0.level + 1)][3]
	}
end

function slot0.GetResItemId(slot0)
	return slot0:GetAward().id
end

function slot0.GetValue2(slot0)
	return slot0.value2
end

function slot0.GetBg(slot0)
	return slot0.activity:getConfig("bg")[1]
end

function slot0.CanGetAward(slot0)
	slot1, slot2, slot3 = slot0:GetResProgress()

	return slot3 >= 1 and not slot0:GetAllAward()
end

function slot0.GetAllAward(slot0)
	return slot0.level == #slot0.targets
end

function slot0.CanGetMorePt(slot0)
	return getProxy(ActivityProxy):getActivityById(slot0.bindActId) and not slot1:isEnd()
end

return slot0
