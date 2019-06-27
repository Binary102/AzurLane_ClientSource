ys = {}
pg = {
	_weak = setmetatable({}, {
		__mode = "k"
	})
}

require("Include")
require("tolua.reflection")
tolua.loadassembly("Assembly-CSharp")
math.randomseed(os.time())

CSharpVersion = NetConst.GatewayState

print("C# Ver. " .. CSharpVersion)

PLATFORM = LuaHelper.GetPlatformInt()
CHANNEL_NAME = LuaHelper.GetSDKChannelName()
PLATFORM_CH = 1
PLATFORM_JP = 2
PLATFORM_KR = 3
PLATFORM_US = 4
PLATFORM_CODE = PLATFORM_KR
SDK_EXIT_CODE = 99

function luaIdeDebugFunc()
	breakInfoFun = require("LuaDebugjit")("localhost", 7003)
	time = Timer.New(breakInfoFun, 0.5, -1, 1)

	time:Start()
	print("luaIdeDebugFunc")
end

BilibiliSdkMgr.sandboxKey = "BLHXSESAUH180704"

if PLATFORM == 8 then
	BilibiliSdkMgr.inst:init()
end

print("AgeRating:<color=#ff0000>" .. AgeRatingConst.AgeRating .. "</color>")

function isPlatform()
	return BilibiliSdkMgr.inst.isPlatform
end

function isTencent()
	return BilibiliSdkMgr.inst.isTenc
end

function isAiriJP()
	return BilibiliSdkMgr.inst.isAiriJP
end

function GetBiliServerId()
	return BilibiliSdkMgr.serverId
end

function getDeviceId()
	if PLATFORM_CODE == PLATFORM_JP then
		return AiriSdkMgr.AiriSDKInst.GetDeviceUDID()
	else
		return ""
	end
end

pg.TimeMgr.GetInstance():Init()
pg.PushNotificationMgr.GetInstance():Init()

function OnApplicationPause(slot0)
	print("OnApplicationPause: " .. tostring(slot0))

	if not pg.m02 then
		return
	end

	if slot0 then
		pg.m02:sendNotification(GAME.PAUSE_BATTLE)
		pg.PushNotificationMgr.GetInstance():PushAll()
	elseif CSharpVersion > 4 then
		pg.SDKMgr:GetInstance():callSdkApi("bindCpu", nil)
	end
end

function OnApplicationExit()
	if pg.GuideMgr.GetInstance():isRuning() then
		return
	end

	if ys.Battle.BattleState:GetInstance() and slot0:GetState() == slot0.BATTLE_STATE_FIGHT and not slot0:IsPause() then
		pg.m02:sendNotification(GAME.PAUSE_BATTLE)

		return
	end

	if not pg.UIMgr.GetInstance()._loadPanel or slot1:LoadingRetainCount() ~= 0 then
		return
	end

	slot3 = pg.MsgboxMgr.GetInstance() and slot2:getMsgBoxOb()

	if pg.StoryMgr.GetInstance() and slot4.storyId then
		if slot3 and slot3.activeSelf then
			playSoundEffect(SFX_CANCEL)
			triggerButton(slot2._closeBtn)
		end

		return
	end

	if not pg.m02 then
		return
	end

	if not slot5:retrieveProxy(ContextProxy.__cname) then
		return
	end

	if not slot6:getCurrentContext() then
		return
	end

	if pg.ShareMgr.GetInstance() and slot8.panel and slot9.gameObject.activeSelf then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot9:Find("main/top/btnBack"))

		return
	end

	if not slot5:retrieveMediator(slot7:retriveLastChild().mediator.__cname) or not slot10.viewComponent then
		return
	end

	slot12 = slot10.viewComponent._tf.parent
	slot13 = slot10.viewComponent._tf:GetSiblingIndex()
	slot14 = -1
	slot15 = nil

	if slot3 and slot3.activeSelf then
		slot15 = slot3.transform.parent
		slot14 = slot3.transform:GetSiblingIndex()
	end

	if slot12 == slot15 and slot14 < slot13 then
		slot11:onBackPressed()

		return
	end

	if slot3 and slot3.activeSelf then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot2._closeBtn)

		return
	end

	slot11:onBackPressed()
end

function OnReceiveMemoryWarning()
	return
end

function PressBack()
	if not IsNil(pg.MsgboxMgr.GetInstance()._go) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("confirm_app_exit"),
			onYes = function ()
				Application.Quit()
			end
		})
	end
end

function GoLogin(slot0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN, {
		loginPlatform = slot0
	})
	gcAll()
end

function SDKLogin(slot0, slot1, slot2)
	slot3 = PLATFORM_BILIBILI

	if CHANNEL_NAME == "txwy_kr" then
		slot3 = PLATFORM_TXWY
	end

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = User.New({
			type = 1,
			arg1 = slot3,
			arg2 = slot0,
			arg3 = slot1,
			arg4 = slot2
		})
	})
end

function SDKLogout(slot0, slot1, slot2)
	pg.m02:sendNotification(GAME.LOGOUT, {
		code = 0,
		uid = slot0,
		token = slot1,
		sessionId = slot2
	})
end

function PaySuccess(slot0, slot1)
	getProxy(ShopsProxy):removeWaitTimer()

	if CHANNEL_NAME ~= "txwy_kr" then
		pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
			payId = slot0,
			bsId = slot1
		})
	end
end

function ShowMsgBox(slot0)
	if pg.m02 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = slot0
		})
	end
end

function PayFailed(slot0, slot1)
	getProxy(ShopsProxy):removeWaitTimer()

	if not tonumber(slot1) then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = slot0,
		code = slot1
	})

	if slot1 == -5 then
		pg.TipsMgr:GetInstance():ShowTips(i18n1("订单签名异常" .. slot1))
	elseif slot1 > 0 then
		if slot1 > 1000 and slot1 < 2000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("data_error") .. slot1)
		elseif slot1 >= 2000 and slot1 < 3000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("server_error") .. slot1)
		elseif slot1 >= 3000 and slot1 < 4000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("time_out") .. slot1)
		elseif slot1 == 4000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("system_error") .. slot1)
		elseif slot1 == 6001 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("user_cancel") .. slot1)
		elseif slot1 == 7005 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("pay_fail") .. slot1)
		elseif slot1 == 7004 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("pay_fail") .. slot1)
		end
	elseif slot1 == -201 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("order_error") .. slot1)
	elseif slot1 == -202 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("pay_cancel") .. slot1)
	elseif slot1 == -203 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("pay_fail") .. slot1)
	end
end

function isPlatform()
	return pg.SDKMgr:GetInstance():isPlatform()
end

function isTencent()
	return pg.SDKMgr:GetInstance():isTenc()
end

function isAiriJP()
	if CSharpVersion > 4 then
		return pg.SDKMgr:GetInstance():isAiriJP()
	else
		return false
	end
end

function getDeviceId()
	print("Device Model:", pg.SDKMgr.GetInstance():getDeviceModel())

	return pg.SDKMgr.GetInstance():getDeviceModel() or ""
end

slot2 = os.clock()

seriesAsync({
	function (slot0)
		pg.LayerWeightMgr.GetInstance():Init()
		pg.UIMgr.GetInstance():Init(slot0)
	end,
	function (slot0)
		parallelAsync({
			function (slot0)
				pg.SDKMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.FontMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.ShaderMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.CriMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.PoolMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.TipsMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.MsgboxMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.StoryMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.SystemOpenMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.GuideMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.SeriesGuideMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.ToastMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.SecondaryPWDMgr.GetInstance():Init(slot0)
			end
		}, slot0)
	end
}, function (slot0)
	print("loading cost: " .. os.clock() - slot0)
	CameraUtil.SetOnlyAdaptMainCam(true)
	VersionMgr.Inst:DestroyUI()

	if not IsNil(GameObject.Find("OverlayCamera/Overlay/UIMain/ServerChoosePanel")) then
		Object.Destroy(slot1)
	end

	Screen.sleepTimeout = SleepTimeout.SystemSetting

	pg.UIMgr.GetInstance():displayLoadingBG(true)
	pg.UIMgr.GetInstance():LoadingOn()

	if slot0 then
		pg.UIMgr.GetInstance():Loading(slot0)
		error(slot0)

		return
	end

	if CSharpVersion > 4 then
		pg.SDKMgr:GetInstance():callSdkApi("bindCpu", nil)
	end

	pg.m02 = pm.Facade.getInstance("m02")

	pg.m02:registerCommand(GAME.STARTUP, StartupCommand)
	pg.m02:sendNotification(GAME.STARTUP)
	pg.SDKMgr:GetInstance():localLogin()
	SetHXConfig()

	if Application.isEditor then
		pg.UIMgr.GetInstance():AddDebugButton("QATool", function ()
			DebugMgr.Inst:Switch2QATool()
		end)
	end
end)

function SetHXConfig()
	if HXSet.isHx() then
		for slot3, slot4 in ipairs(pg.ship_skin_template.all) do
			if pg.ship_skin_template[slot4].painting_hx ~= "" then
				pg.ship_skin_template[slot4].prefab = pg.ship_skin_template[slot4].painting_hx
			end
		end

		if PLATFORM == PLATFORM_IPHONEPLAYER and AgeRatingConst.AgeRating == 12 and CSharpVersion >= 17 then
			for slot3, slot4 in ipairs(pg.pay_data_display.all) do
				pg.pay_data_display[slot4].id_str = pg.pay_data_display[slot4].id_str_r12
			end
		end
	end
end

return
