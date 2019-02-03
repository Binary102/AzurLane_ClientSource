slot0 = class("SnapshotSceneMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(SnapshotScene.SELECT_CHAR_PANEL, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = SnapshotSelectCharMediator,
			viewComponent = SnapshotSelectCharLayer
		}))
	end)
	slot0:bind(SnapshotScene.SHARE_PANEL, function (slot0, slot1, slot2)
		slot0:addSubLayers(Context.New({
			mediator = SnapshotShareMediator,
			viewComponent = SnapshotShareLayer,
			data = {
				photoTex = slot1,
				photoData = slot2
			}
		}))
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		SnapshotSelectCharMediator.SELECT_CHAR
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == SnapshotSelectCharMediator.SELECT_CHAR then
		slot0.viewComponent:setSkin(slot3)
	end
end

return slot0
