slot1 = YongshiSdkMgr.inst

function StartSdkLogin()
	Timer.New(function ()
		slot0:OnLoginTimeOut()
	end, 30, 1):Start()
end

function GoLoginScene()
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN)
	gcAll()

	return
end

function SDKLogined(slot0, slot1, slot2, slot3)
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = User.New({
			type = 1,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot2,
			arg4 = slot3
		})
	})

	return
end

function SDKLogouted(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.LOGOUT, {
		code = slot0
	})

	return
end

function PaySuccess(slot0, slot1)
	if not pg.m02 then
		print("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()
	pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
		payId = slot0,
		bsId = slot1
	})

	return
end

function PayFailed(slot0, slot1)
	if not pg.m02 then
		print("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()

	if not tonumber(slot1) then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = slot0,
		code = slot1
	})

	return
end

return {
	InitSDK = function ()
		slot0:Init()

		return
	end,
	GoSDkLoginScene = function ()
		slot0:GoLoginScene()

		return
	end,
	LoginSdk = function (slot0)
		slot0:Login(0)

		return
	end,
	TryLoginSdk = function ()
		slot0:TryLogin()

		return
	end,
	SdkGateWayLogined = function ()
		slot0:OnGatewayLogined()

		return
	end,
	SdkLoginGetaWayFailed = function ()
		slot0:OnLoginGatewayFailed()

		return
	end,
	SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
		slot17 = getProxy(PlayerProxy):getRawData()

		slot0:Pay(slot0, slot2, slot5, slot1, "1", slot3, "1", getProxy(ServerProxy).getLastServer(slot13, slot12).id, getProxy(ServerProxy).getLastServer(slot13, slot12).name, , slot17.id, slot17.name, slot17.level, slot8, "1", slot4, slot6)

		return
	end,
	LogoutSDK = function ()
		slot0:LocalLogout()

		return
	end,
	BindCPU = function ()
		slot0:callSdkApi("bindCpu", nil)

		return
	end,
	OnAndoridBackPress = function ()
		PressBack()

		return
	end,
	GetBiliServerId = function ()
		print("serverId : " .. slot0.serverId)

		return slot0.serverId
	end,
	GetChannelUID = function ()
		print("channelUID : " .. slot0.channelUID)

		return slot0.channelUID
	end,
	GetLoginType = function ()
		return slot0.loginType
	end,
	GetIsPlatform = function ()
		return slot0.isPlatform
	end
}
