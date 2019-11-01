slot0 = class("InstagramActivity", import("..Activity"))

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.messages = {}

	for slot5, slot6 in ipairs(slot1.ins_message_list) do
		slot0.messages[Instagram.New(slot6).id] = Instagram.New(slot6)
	end

	slot0.messageIds = pg.activity_ins_template.all
end

function slot0.ExistMessage(slot0)
	return table.getCount(slot0.messages) > 0
end

function slot0.GetMessages(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.messages) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.GetData(slot0)
	return Clone(slot0.messages)
end

function slot0.UpdateActiveCnt(slot0)
	slot0.data1 = slot0.data1 - 1
end

function slot0.UpdateNextPushTime(slot0, slot1)
	slot0.data2 = slot1
end

function slot0.GetNextPustTime(slot0)
	return slot0.data2
end

function slot0.GetCanActiveCnt(slot0)
	return slot0.data1
end

function slot0.CanBeActivated(slot0)
	return slot0.data1 > 0
end

function slot0.ShouldFetchNewMessage(slot0)
	return slot0:GetNextPustTime() <= pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.GetNextId(slot0)
	return slot0.messageIds[table.getCount(slot0.messages) + 1]
end

function slot0.GetMessageById(slot0, slot1)
	return slot0.messages[slot1]
end

function slot0.AddMessage(slot0, slot1)
	slot0.messages[slot1.id] = slot1
end

function slot0.UpdateMessage(slot0, slot1)
	if not slot0.messages[slot1.id] then
		slot0:AddMessage(slot1)
	else
		slot0.messages[slot1.id] = slot1
	end
end

function slot0.ShouldShowTip(slot0)
	return _.any(slot0:GetMessages(), function (slot0)
		return slot0:ShouldShowTip()
	end)
end

return slot0
