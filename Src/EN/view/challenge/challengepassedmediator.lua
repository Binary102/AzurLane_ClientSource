slot0 = class("ChallengeMainMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(ChallengeConst.OPEN_CHALLENGE_MAIN_SCENE, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.CHALLENGE_MAIN_SCENE)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	return
end

return slot0
