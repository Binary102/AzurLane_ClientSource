slot0 = class("ServerNoticeMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	getProxy(ServerNoticeProxy).setStopMainTip(slot1)
	slot0:updateNotices()
	slot0:updateBanner()
	slot0:bind(ServerNoticeLayer.OPEN_ACTIVITY_PANEL, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(ServerNoticeLayer.GO_SCENE, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, slot1[1], slot1[2])
	end)
	slot0:bind(ServerNoticeLayer.SET_STOP_REMIND, function (slot0, slot1)
		getProxy(ServerNoticeProxy):setStopRemind(slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		ServerNoticeProxy.SERVER_NOTICES_UPDATE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ServerNoticeProxy.SERVER_NOTICES_UPDATE then
		slot0:updateNotices()
	end
end

function slot0.updateNotices(slot0)
	slot0.viewComponent:updateNotices(getProxy(ServerNoticeProxy):getServerNotices())
end

function slot0.updateBanner(slot0)
	slot0.viewComponent:updateBanner(getProxy(ActivityProxy):getNoticeBannerDisplays())
end

return slot0
