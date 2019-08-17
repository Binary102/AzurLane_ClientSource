slot0 = class("AiriLoginPanelView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "AiriLoginPanelView"
end

function slot0.OnLoaded(slot0)
	return
end

function slot0.SetShareData(slot0, slot1)
	slot0.shareData = slot1
end

function slot0.OnInit(slot0)
	slot0.airijpPanel = slot0._tf
	slot0.airiLoginBtn = slot0:findTF("airi_login", slot0.airijpPanel)
	slot0.clearTranscodeBtn = slot0:findTF("clear_transcode", slot0.airijpPanel)
	slot0.twitterLoginBtn = slot0:findTF("twitter_login", slot0.airijpPanel)
	slot0.transcodeLoginBtn = slot0:findTF("transcode_login", slot0.airijpPanel)
	slot0.twitterLoginBtn_en = slot0:findTF("twitter_login_en", slot0.airijpPanel)
	slot0.facebookLoginBtn_en = slot0:findTF("facebook_login_en", slot0.airijpPanel)
	slot0.yostarLoginBtn_en = slot0:findTF("yostar_login_en", slot0.airijpPanel)

	setActive(slot0.clearTranscodeBtn, not LOCK_CLEAR_ACCOUNT)
	setActive(slot0.twitterLoginBtn, PLATFORM_CODE == PLATFORM_JP)
	setActive(slot0.transcodeLoginBtn, PLATFORM_CODE == PLATFORM_JP)
	setActive(slot0.twitterLoginBtn_en, PLATFORM_CODE == PLATFORM_US)
	setActive(slot0.facebookLoginBtn_en, PLATFORM_CODE == PLATFORM_US)
	setActive(slot0.yostarLoginBtn_en, PLATFORM_CODE == PLATFORM_US)
	slot0:InitEvent()
end

function slot0.InitEvent(slot0)
	onButton(slot0, slot0.airiLoginBtn, function ()
		playSoundEffect(SFX_CONFIRM)

		if not getProxy(SettingsProxy):getUserAgreement() then
			slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
		else
			pg.SdkMgr.GetInstance():AiriLoginSDK()
			pg.UIMgr.GetInstance():LoadingOn()
		end
	end)
	onButton(slot0, slot0.clearTranscodeBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("clear_transcode_cache_confirm"),
			onYes = function ()
				ClearAccountCache()

				slot0 = getProxy(SettingsProxy)

				slot0:deleteUserAreement()
				slot0:clearAllReadHelp()
				slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
				pg.TipsMgr.GetInstance():ShowTips(i18n("clear_transcode_cache_success"))
			end,
			onNo = function ()
				return
			end
		})
	end)
	onButton(slot0, slot0.twitterLoginBtn, function ()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_TWITTER)
	end)
	onButton(slot0, slot0.transcodeLoginBtn, function ()
		slot0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
			LoginSceneConst.DEFINE.TRANSCODE_ALERT_VIEW,
			LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN
		})
	end)
	onButton(slot0, slot0.twitterLoginBtn_en, function ()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_TWITTER)
	end)
	onButton(slot0, slot0.facebookLoginBtn_en, function ()
		pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_FACEBOOK)
	end)
	onButton(slot0, slot0.yostarLoginBtn_en, function ()
		slot0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
			LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW,
			LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN
		})
	end)
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
