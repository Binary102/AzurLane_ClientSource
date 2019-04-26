AIRI_PLATFORM_FACEBOOK = "facebook"
AIRI_PLATFORM_TWITTER = "twitter"
AIRI_PLATFORM_YOSTAR = "yostar"

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

	print("AiriSdk Version:" .. AiriSdkMgr.AiriSDKInst.Version)
	print("CSharpVersion:" .. tostring(CSharpVersion))
end

function AiriLogin()
	AiriSdkMgr.inst:Login()
end

function TranscodeRequest()
	AiriSdkMgr.inst:TranscodeRequest()
end

function LoginWithTranscode(slot0, slot1)
	AiriSdkMgr.inst:LoginWithTranscode(slot0, slot1)
end

function LoginWithSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		AiriSdkMgr.inst:LoginWithSocial(AiriJP.SocialPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		AiriSdkMgr.inst:LoginWithSocial(AiriJP.SocialPlatform.TWITTER)
	end
end

function AiriBuy(slot0, slot1, slot2)
	AiriSdkMgr.inst:NewBuy(slot0, slot1, slot2)
end

function LinkSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		AiriSdkMgr.inst:LinkSocial(AiriJP.SocialPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		AiriSdkMgr.inst:LinkSocial(AiriJP.SocialPlatform.TWITTER)
	end
end

function UnlinkSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		AiriSdkMgr.inst:UnlinkSocial(AiriJP.SocialPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		AiriSdkMgr.inst:UnlinkSocial(AiriJP.SocialPlatform.TWITTER)
	end
end

function IsSocialLink(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		return AiriSdkMgr.AiriSDKInst:IsSocialLinked(AiriJP.SocialPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		return AiriSdkMgr.AiriSDKInst:IsSocialLinked(AiriJP.SocialPlatform.TWITTER)
	end

	return false
end

function GetSocialName(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		return AiriSdkMgr.AiriSDKInst:GetSocialUsername(AiriJP.SocialPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		return AiriSdkMgr.AiriSDKInst:GetSocialUsername(AiriJP.SocialPlatform.TWITTER)
	end

	return ""
end

function ClearAccountCache()
	AiriSdkMgr.inst:ClearAccountCache()
end

function GameShare(slot0, slot1)
	AiriSdkMgr.inst:ShareCustomScreenshot(slot0, slot1)
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
	else
		print("AiriLogin failed")
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

function LinkSocialResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_LINKED)
	end
end

function AiriSocialLogin(slot0, slot1, slot2)
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

function UnlinkSocialResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if AiriJPResultCodeHandler(slot0) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_UNLINKED)
	end
end

function AiriJPResultCodeHandler(slot0)
	slot2 = ":" .. slot0:ToInt()

	if slot0.ToInt() == 0 then
		return true
	elseif slot1 == 100200 then
		pg.m02:sendNotification(GAME.SERVER_USER_LOGIN_INVALIDCERT)
	else
		print("SDK Error Code:" .. slot1)

		if string.find(i18n("airi_error_code_" .. slot1), "UndefinedLanguage") then
			pg.TipsMgr:GetInstance():ShowTips(i18n("airi_error_code_other") .. slot2)
		else
			pg.TipsMgr:GetInstance():ShowTips(slot3 .. slot2)
		end
	end

	return false
end

function getDeviceId()
	if PLATFORM_CODE == PLATFORM_JP then
		return AiriSdkMgr.AiriSDKInst.GetDeviceUDID()
	else
		return ""
	end
end

return
