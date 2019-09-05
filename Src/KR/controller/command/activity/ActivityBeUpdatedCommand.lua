class("ActivityBeUpdatedCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().isInit

	if slot1.getBody().activity.getConfig(slot3, "type") == ActivityConst.ACTIVITY_TYPE_VOTE then
		getProxy(VoteProxy).SetOrderBook(slot6, slot5)
		slot0:sendNotification(GAME.VOTE_BOOK_BE_UPDATED_DONE)
	end
end

return class("ActivityBeUpdatedCommand", pm.SimpleCommand)
