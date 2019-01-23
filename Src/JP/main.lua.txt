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
PLATFORM_CH = 1
PLATFORM_JP = 2
PLATFORM_KR = 3
PLATFORM_US = 4
PLATFORM_CODE = PLATFORM_JP

if PLATFORM_CODE == PLATFORM_JP then
	PLATFORM_LOCAL = BilibiliSdkMgr.inst.channelUID
end

BilibiliSdkMgr.sandboxKey = "BLHXSESAUH180704"

if PLATFORM == 8 then
	BilibiliSdkMgr.inst:init()
end

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
	else
		BilibiliSdkMgr.inst:callSdkApi("bindCpu", nil)
	end
end

function OnApplicationExit()
	if pg.GuideMgr2.GetInstance().managerState == pg.GuideMgr2.MANAGER_STATE.BUSY then
		return
	end

	if pg.GuideMgr.GetInstance().managerState == pg.GuideMgr.MANAGER_STATE.BUSY then
		return
	end

	if ys.Battle.BattleState:GetInstance() and slot0:GetState() == slot0.BATTLE_STATE_FIGHT and not slot0:IsPause() then
		pg.m02:sendNotification(GAME.PAUSE_BATTLE)

		return
	end

	if not pg.UIMgr.GetInstance()._loadPanel or slot1:LoadingRetainCount() ~= 0 then
		return
	end

	if pg.StoryMgr.GetInstance() and slot2.storyId then
		return
	end

	if not pg.m02 then
		return
	end

	if not slot3:retrieveProxy(ContextProxy.__cname) then
		return
	end

	if not slot4:getCurrentContext() then
		return
	end

	if pg.ShareMgr.GetInstance() and slot6.panel and slot7.gameObject.activeSelf then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot7:Find("main/btnBack"))

		return
	end

	if not slot3:retrieveMediator(slot5:retriveLastChild().mediator.__cname) or not slot8.viewComponent then
		return
	end

	slot10 = slot8.viewComponent._tf.parent
	slot11 = slot8.viewComponent._tf:GetSiblingIndex()
	slot13 = pg.MsgboxMgr.GetInstance() and slot12:getMsgBoxOb()
	slot14 = -1
	slot15 = nil

	if slot13 and slot13.activeSelf then
		slot15 = slot13.transform.parent
		slot14 = slot13.transform:GetSiblingIndex()
	end

	if slot10 == slot15 and slot14 < slot11 then
		slot9:onBackPressed()

		return
	end

	if slot13 and slot13.activeSelf then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot12._closeBtn)

		return
	end

	slot9:onBackPressed()
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
	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = User.New({
			type = 1,
			arg1 = PLATFORM_BILIBILI,
			arg2 = slot0,
			arg3 = slot1,
			arg4 = slot2
		})
	})
end

function SDKLogout()
	pg.m02:sendNotification(GAME.LOGOUT, {
		code = code
	})
end

function PaySuccess(slot0, slot1)
	getProxy(ShopsProxy):removeWaitTimer()
	pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
		payId = slot0,
		bsId = slot1
	})
end

function ShowMsgBox(slot0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = slot0
	})
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
			pg.TipsMgr:GetInstance():ShowTips(i18n1("数据格式验证错误" .. slot1))
		elseif slot1 >= 2000 and slot1 < 3000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n1("服务器返回异常" .. slot1))
		elseif slot1 >= 3000 and slot1 < 4000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n1("未登录或者会话已超时" .. slot1))
		elseif slot1 == 4000 then
			pg.TipsMgr:GetInstance():ShowTips(i18n1("系统错误" .. slot1))
		elseif slot1 == 6001 then
			pg.TipsMgr:GetInstance():ShowTips(i18n1("用户中途取消" .. slot1))
		elseif slot1 == 7005 then
			pg.TipsMgr:GetInstance():ShowTips(i18n1("支付失败" .. slot1))
		elseif slot1 == 7004 then
			pg.TipsMgr:GetInstance():ShowTips(i18n1("支付失败" .. slot1))
		end
	elseif slot1 == -201 then
		pg.TipsMgr:GetInstance():ShowTips(i18n1("生成订单失败" .. slot1))
	elseif slot1 == -202 then
		pg.TipsMgr:GetInstance():ShowTips(i18n1("支付取消" .. slot1))
	elseif slot1 == -203 then
		pg.TipsMgr:GetInstance():ShowTips(i18n1("支付失败" .. slot1))
	end
end

function AiriCheckAudit()
	return NetConst.GATEWAY_PORT == 20001 and NetConst.GATEWAY_HOST == "blhxjpauditapi.azurlane.jp"
end

function AiriCheckPreAudit()
	return NetConst.GATEWAY_PORT == 50001 and NetConst.GATEWAY_HOST == "staging.azurlane.jp"
end

AIRI_APP_URL = "https://azurapi.yostar.co.jp/"
AIRI_PREAUDIT_URL = "http://test.sdk.azurlane.jp:8080/"

function AiriInit(slot0)
	pg.UIMgr:GetInstance():LoadingOn()

	if slot0 == nil then
		if AiriCheckPreAudit() then
			AiriSdkMgr.inst:InitSdk(AIRI_PREAUDIT_URL, false)
			print("预发布服初始化sdk")
		else
			AiriSdkMgr.inst:InitSdk(AIRI_APP_URL, false)
		end
	else
		AiriSdkMgr.inst:InitSdk(slot0, false)
	end

	print("AiriJPSdk Version:" .. AiriSdkMgr.AiriSDKInst.Version)
	print("CSharpVersion:" .. tostring(CSharpVersion))
end

function AiriInitResult(slot0)
	if AiriJPResultCodeHandler(slot0) then
		pg.UIMgr:GetInstance():LoadingOff()
		AiriGoLogin()
	end
end

function AiriGoLogin(slot0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN, {
		loginPlatform = slot0
	})
	gcAll()
end

function AiriJPLogin(slot0, slot1, slot2)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
			user = User.New({
				type = 1,
				arg1 = PLATFORM_AIRIJP,
				arg2 = slot1,
				arg3 = slot2
			})
		})
	end
end

function AiriTranscodeResult(slot0, slot1)
	if AiriJPResultCodeHandler(slot0) then
		pg.m02:sendNotification(GAME.ON_GET_TRANSCODE, {
			transcode = slot1
		})
	end
end

function AiriBuyResult(slot0, slot1, slot2, slot3)
	if AiriJPResultCodeHandler(slot0) then
		getProxy(ShopsProxy):removeWaitTimer()
		pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
			payId = slot1,
			bsId = slot2
		})
	else
		getProxy(ShopsProxy):removeWaitTimer()
		pg.m02:sendNotification(GAME.CHARGE_FAILED, {
			payId = slot1
		})
	end
end

function SetBirthResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("set_birth_success"))
	end
end

function LinkTwitterResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.m02:sendNotification(GAME.ON_TWITTER_LINKED)
	end
end

function AiriJPTwitterLogin(slot0, slot1, slot2)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("twitter_login_tips"),
			onYes = function ()
				pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
					user = User.New({
						type = 1,
						arg1 = PLATFORM_AIRIJP,
						arg2 = slot0,
						arg3 = 
					})
				})
			end
		})
	end
end

function UnlinkTwitterResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.m02:sendNotification(GAME.ON_TWITTER_UNLINKED)
	end
end

function AiriJPResultCodeHandler(slot0)
	slot2 = ":" .. slot0:ToInt()

	if slot0.ToInt() == 0 then
		return true
	elseif slot1 == 100200 then
		pg.m02:sendNotification(GAME.SERVER_USER_LOGIN_INVALIDCERT)
	elseif string.find(i18n("airi_error_code_" .. slot1), "UndefinedLanguage") then
		pg.TipsMgr:GetInstance():ShowTips(i18n("airi_error_code_other") .. slot2)
	else
		pg.TipsMgr:GetInstance():ShowTips(slot3 .. slot2)
	end

	return false
end

slot2 = os.clock()

seriesAsync({
	function (slot0)
		pg.UIMgr.GetInstance():Init(slot0)
	end,
	function (slot0)
		parallelAsync({
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
				pg.GuideMgr2.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.StoryMgr.GetInstance():Init(slot0)
			end,
			function (slot0)
				pg.SystemOpenMgr.GetInstance():Init(slot0)
			end
		}, slot0)
	end
}, function (slot0)
	print("loading cost: " .. os.clock() - slot0)
	setActive(slot1, false)
	VersionMgr.Inst:DestroyUI()
	pg.UIMgr.GetInstance():displayLoadingBG(true)
	pg.UIMgr.GetInstance():LoadingOn()

	if slot0 then
		pg.UIMgr.GetInstance():Loading(slot0)
		error(slot0)

		return
	end

	BilibiliSdkMgr.inst:callSdkApi("bindCpu", nil)

	pg.m02 = pm.Facade.getInstance("m02")

	pg.m02:registerCommand(GAME.STARTUP, StartupCommand)
	pg.m02:sendNotification(GAME.STARTUP)
	BilibiliSdkMgr.inst:localLogin()

	if Application.isEditor then
		pg.UIMgr.GetInstance():AddDebugButton("QATool", function ()
			DebugMgr.Inst:Switch2QATool()
		end)
	end
end)

return
