slot0 = class("WebVoteMediator", import("...base.ContextMediator"))

function slot0.register(slot0)
	slot0.viewComponent:setGroup(getProxy(VoteProxy):GetWebGroup())
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()
end

return slot0
