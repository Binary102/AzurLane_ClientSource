slot1 = BilibiliSdkMgr.inst
slot2 = "BLHXSESAUH180704"
slot3 = "FTBLHX20190524WW"

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

	if slot1 == -5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("订单签名异常" .. slot1))
	else
		if slot1 > 0 then
			if slot1 > 1000 and slot1 < 2000 then
				pg.TipsMgr.GetInstance():ShowTips(i18n1("数据格式验证错误" .. slot1))
			else
				if slot1 >= 2000 and slot1 < 3000 then
					pg.TipsMgr.GetInstance():ShowTips(i18n1("服务器返回异常" .. slot1))
				else
					if slot1 >= 3000 and slot1 < 4000 then
						pg.TipsMgr.GetInstance():ShowTips(i18n1("未登录或者会话已超时" .. slot1))
					else
						if slot1 == 4000 then
							pg.TipsMgr.GetInstance():ShowTips(i18n1("系统错误" .. slot1))
						else
							if slot1 == 6001 then
								pg.TipsMgr.GetInstance():ShowTips(i18n1("用户中途取消" .. slot1))
							else
								if slot1 == 7005 then
									pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
								else
									if slot1 == 7004 then
										pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
									end
								end
							end
						end
					end
				end
			end
		else
			if slot1 == -201 then
				pg.TipsMgr.GetInstance():ShowTips(i18n1("生成订单失败" .. slot1))
			else
				if slot1 == -202 then
					pg.TipsMgr.GetInstance():ShowTips(i18n1("支付取消" .. slot1))
				else
					if slot1 == -203 then
						pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
					end
				end
			end
		end
	end

	return
end

function OnSDKInitFailed(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = slot0,
		onYes = slot0.InitSDK
	})

	return
end

function ShowMsgBox(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = slot0
	})

	return
end

return {
	InitSDK = function ()
		if PLATFORM_CHT == PLATFORM_CODE then
			slot0.sandboxKey = slot1
		else
			slot0.sandboxKey = slot2
		end

		slot0:Init()

		return
	end,
	GoSDkLoginScene = function ()
		slot0:GoLoginScene()

		return
	end,
	LoginQQ = function ()
		slot0:Login(1)

		return
	end,
	LoginWX = function ()
		slot0:Login(2)

		return
	end,
	LoginSdk = function (slot0)
		if slot0 == 1 then
			slot0.LoginQQ()
		else
			if slot0 == 2 then
				slot0.LoginWX()
			else
				slot1:Login(0)
			end
		end

		return
	end,
	TryLoginSdk = function ()
		slot0:TryLogin()

		return
	end,
	CreateRole = function (slot0, slot1, slot2, slot3, slot4)
		slot0:CreateRole(slot0, slot1, slot2, 1000 * slot3, "vip0", slot4)

		return
	end,
	EnterServer = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot0:EnterServer(slot0, slot1, slot2, slot3, slot4 * 1000, slot5, "vip0", slot6)

		return
	end,
	ChooseServer = function (slot0, slot1)
		slot0:ChooseServer(slot0, slot1)

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
	SdkLevelUp = function ()
		slot0:LevelUp()

		return
	end,
	SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
		slot0:Pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)

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
		slot0:onBackPressed()

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
