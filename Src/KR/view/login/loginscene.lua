slot0 = class("LoginScene", import("..base.BaseUI"))
slot1 = 1

function slot0.getUIName(slot0)
	return "LoginUI2"
end

function slot0.getBGM(slot0)
	return "login"
end

function slot0.preload(slot0, slot1)
	slot0.iconSpries = {}

	ResourceMgr.Inst:loadAssetBundleAsync("ui/LoginUI2_atlas", function (slot0)
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_green", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_gray", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_red", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_org", typeof(Sprite), true, false))

		if table.insert then
			slot1()
		end
	end)
end

function slot0.init(slot0)
	slot0.version = slot0:findTF("version")
	slot0.version:GetComponent("Text").text = "ver " .. UpdateMgr.Inst.currentVersion:ToString()
	slot0.accountBtn = slot0:findTF("bg_lay/buttons/account_button")
	slot0.pressToLogin = GetOrAddComponent(slot0:findTF("background/press_to_login"), "CanvasGroup")

	LeanTween.alphaCanvas(slot0.pressToLogin, 0.25, slot0):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

	slot0.currentServer = slot0:findTF("current_server")
	slot0.loginPanel = slot0:findTF("login_panel")
	slot0.loginUsername = slot0:findTF("username", slot0.loginPanel)
	slot0.loginPassword = slot0:findTF("password", slot0.loginPanel)
	slot0.loginButton = slot0:findTF("login_button", slot0.loginPanel)
	slot0.registerButton = slot0:findTF("register_button", slot0.loginPanel)
	slot0.forgetButton = slot0:findTF("forget_button", slot0.loginPanel)
	slot0.registerPanel = slot0:findTF("register_panel")
	slot0.registerUsername = slot0:findTF("username", slot0.registerPanel)
	slot0.registerPassword = slot0:findTF("password", slot0.registerPanel)
	slot0.registerPassword2 = slot0:findTF("password2", slot0.registerPanel)
	slot0.registerEmail = slot0:findTF("email", slot0.registerPanel)
	slot0.cancelButton = slot0:findTF("cancel_button", slot0.registerPanel)
	slot0.confirmButton = slot0:findTF("confirm_button", slot0.registerPanel)
	slot0.serversPanel = slot0:findTF("servers")
	slot0.servers = slot0:findTF("panel/servers/content/server_list", slot0.serversPanel)
	slot0.serverTpl = slot0:getTpl("server_tpl")
	slot0.recentTF = slot0:findTF("panel/servers/content/advice_panel/recent", slot0.serversPanel)
	slot0.adviceTF = slot0:findTF("panel/servers/content/advice_panel/advice", slot0.serversPanel)
	slot0.tencentPanel = slot0:findTF("tencent_login_panel")
	slot0.wxLoginBtn = slot0:findTF("wx_login", slot0.tencentPanel)
	slot0.qqLoginBtn = slot0:findTF("qq_login", slot0.tencentPanel)
	slot0.serviceBtn = slot0:findTF("bg_lay/buttons/account_button")
	slot0.userCenterBtn = slot0:findTF("bg_lay/buttons/service_button")
	slot0.filingBtn = slot0:findTF("filingBtn")

	setActive(slot0.filingBtn, PLATFORM_CODE == PLATFORM_CH)

	slot0._bg = slot0:findTF("background/bg"):GetComponent(typeof(Image))
	slot0.userAgreenTF = slot0:findTF("UserAgreement")
	slot0.userAgreenMainTF = slot0:findTF("UserAgreement/window")
	slot0.closeUserAgreenTF = slot0.userAgreenTF:Find("window/close_btn")
	slot0.userAgreenConfirmTF = slot0:findTF("UserAgreement/window/accept_btn")

	setActive(slot0.userAgreenTF, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)

	slot0.opBtn = slot0:findTF("bg_lay/buttons/opBtn")

	if slot0.opBtn then
		setActive(slot0.opBtn, PLAY_OPENING)
	end

	slot0:switchToServer()
	slot0:setBg()

	if CRI_BG_FLAG then
		slot0:setCriBg()
	end

	setText(findTF(slot0.currentServer, "server_name"), "")
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.serversPanel) then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
		setActive(slot0.serversPanel, false)

		return
	end

	if isActive(slot0.userAgreenTF) then
		setActive(slot0.userAgreenTF, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)

		return
	end

	BilibiliSdkMgr.inst:onBackPressed()
end

function slot0.showUserAgreement(slot0, slot1)
	slot2 = nil

	if PLATFORM_CODE == PLATFORM_CH then
		slot0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(0.7843137254901961, 0.7843137254901961, 0.7843137254901961, 0.5019607843137255)
	else
		slot2 = true
	end

	setActive(slot0.userAgreenTF, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.userAgreenTF, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	setText(slot0.userAgreenTF:Find("window/container/scrollrect/content/Text"), require("ShareCfg.UserAgreement").content)
	onButton(slot0, slot0.userAgreenConfirmTF, function ()
		if slot0 then
			setActive(slot1.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot1.userAgreenTF, slot1._tf)

			if slot1.userAgreenTF then
				slot2()
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("read_the_user_agreement"))
		end
	end)
	onScroll(slot0, slot0.userAgreenTF:Find("window/container/scrollrect"), function (slot0)
		if slot0.y <= 0.01 and not slot0 then
			slot0 = true

			if PLATFORM_CODE == PLATFORM_CH then
				slot1.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
			end
		end
	end)
end

function slot0.setBg(slot0)
	slot1 = "login"
	slot2 = pg.TimeMgr.GetInstance():ServerTimeDesc("%Y%m%d")

	for slot6, slot7 in ipairs(SPECIAL_DATE) do
		if slot7[1] == slot2 then
			slot1 = slot7[2]
		end
	end

	setImageSprite(slot0._bg, LoadSprite("loadingbg/" .. slot1))
end

function slot0.setCriBg(slot0)
	LoadAndInstantiateAsync("effect", "loginbg", function (slot0)
		if slot0 then
			slot0.transform.SetParent(slot1, slot0._bg.transform, false)
			slot0.transform:SetAsFirstSibling()
		end
	end)
end

function slot0.setLastLogin(slot0, slot1)
	slot0.lastLoginUser = slot1
end

function slot0.setAutoLogin(slot0)
	slot0.autoLoginEnabled = true
end

function slot0.setLastLoginServer(slot0, slot1)
	if not slot1 then
		return
	end

	setText(findTF(slot0.currentServer, "server_name"), slot1.name)

	slot0.lastLoginServer = slot1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.closeUserAgreenTF, function ()
		setActive(slot0.userAgreenMainTF, false)
		onNextTick(function ()
			setActive(slot0.userAgreenMainTF, true)
		end)
	end, SFX_CANCEL)
	onButton(slot0, slot0.loginButton, function ()
		if slot0.autoLoginEnabled and slot0.lastLoginUser then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.lastLoginUser)

			return
		end

		if getInputText(slot0.loginUsername) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(slot0.loginUsername)

			return
		end

		if getInputText(slot0.loginPassword) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(slot0.loginPassword)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1
		}) then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot2)
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.forgetButton, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_systemClose"))
	end, SFX_MAIN)
	onButton(slot0, slot0.registerButton, function ()
		setInputText(slot0.registerPassword, "")
		setInputText(slot0.registerPassword2, "")
		setInputText:switchToRegister()
	end, SFX_MAIN)
	onButton(slot0, slot0.confirmButton, function ()
		if getInputText(slot0.registerUsername) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(slot0.registerUsername)

			return
		end

		if getInputText(slot0.registerPassword) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(slot0.registerPassword)

			return
		end

		if getInputText(slot0.registerPassword2) ~= slot1 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_diffPassword"))
			ActivateInputField(slot0.registerPassword2)

			return
		end

		if getInputText(slot0.registerEmail) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noMailBox"))
			ActivateInputField(slot0.registerEmail)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot3
		}) then
			slot0.event:emit(LoginMediator.ON_REGISTER, slot4)
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.serviceBtn, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_systemClose"))
	end, SFX_MAIN)
	onButton(slot0, slot0.userCenterBtn, function ()
		pg.SDKMgr:GetInstance():userCenter()
	end, SFX_MAIN)
	onButton(slot0, slot0.cancelButton, function ()
		slot0:switchToLogin()
	end, SFX_CANCEL)
	onButton(slot0, slot0.accountBtn, function ()
		slot0:switchToLogin()
	end, SFX_MAIN)

	function slot1()
		if isPlatform() then
			if not isTencent() then
				pg.SDKMgr:GetInstance():login(0)
			else
				slot0:switchToTencentLogin()
			end
		else
			slot0:switchToLogin()
		end
	end

	onButton(slot0, slot0.currentServer, function ()
		if slot0(slot0.serverList or {}) == 0 then
			slot1()
		else
			pg.UIMgr.GetInstance():BlurPanel(slot0.serversPanel)
			setActive(slot0.serversPanel, true)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.serversPanel, function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
		setActive(slot0.serversPanel, false)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("background"), function ()
		if not slot0.initFinished then
			return
		end

		if go(slot0.pressToLogin).activeSelf then
			if slot0(slot0.serverList or {}) == 0 then
				slot1()

				return
			end

			if not slot0.lastLoginServer then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_choiseServer"))

				return
			end

			if slot0.lastLoginServer.status == Server.STATUS.VINDICATE or slot0.lastLoginServer.status == Server.STATUS.FULL then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_disabled"))

				return
			end

			slot0.event:emit(LoginMediator.ON_SERVER, slot0.lastLoginServer)
			playSoundEffect(SFX_CONFIRM)
		end
	end)
	onInputChanged(slot0, slot0.loginUsername, function ()
		slot0.autoLoginEnabled = false
	end)
	onInputChanged(slot0, slot0.loginPassword, function ()
		slot0.autoLoginEnabled = false
	end)
	onButton(slot0, slot0.qqLoginBtn, function ()
		pg.SDKMgr:GetInstance():login(1)
	end)
	onButton(slot0, slot0.wxLoginBtn, function ()
		pg.SDKMgr:GetInstance():login(2)
	end)
	slot0:checkVersion()

	if PLAY_OPENING then
		onButton(slot0, slot0.opBtn, function ()
			if slot0.initFinished then
				slot0:playOpening(true)
			end
		end)

		if PlayerPrefs.GetString("op_ver", "") ~= OP_VERSION then
			slot0:playOpening(true, function ()
				PlayerPrefs.SetString("op_ver", OP_VERSION)
				PlayerPrefs.SetString:playExtraVoice()

				PlayerPrefs.SetString.playExtraVoice.initFinished = true
			end)

			return
		end
	end

	slot0:playExtraVoice()

	slot0.initFinished = true
end

function slot0.checkVersion(slot0)
	if PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "version.txt") and PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "hashes.csv") and System.Version.New(PathMgr.ReadAllText(PathMgr.getStreamingAsset("version.txt"))).CompareTo(slot1, UpdateMgr.Inst.serverVersion) < 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = "当前游戏不是最新版本，请重启游戏进行更新",
			onYes = function ()
				Application.Quit()
			end
		})
	end
end

function slot0.playExtraVoice(slot0)
	if pg.gameset.login_extra_voice.description and #slot1 > 0 then
		pg.CriMgr.GetInstance():LoadCueSheet("cv-" .. slot3, function ()
			if slot0.exited then
				slot1:UnloadCueSheet(slot2)

				return
			end

			slot0.loginCueSheet = slot2

			slot2:PlayCV(slot2, "extra")
		end)
	end
end

function slot0.unloadExtraVoice(slot0)
	if slot0.loginCueSheet then
		pg.CriMgr.GetInstance():UnloadCueSheet(slot0.loginCueSheet)

		slot0.loginCueSheet = nil
	end
end

function slot0.autoLogin(slot0)
	if slot0.lastLoginUser then
		if slot0.autoLoginEnabled then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.lastLoginUser)
		end

		if slot0.lastLoginUser.type == 1 then
			setInputText(slot0.loginUsername, slot0.lastLoginUser.arg2)
			setInputText(slot0.loginPassword, slot0.lastLoginUser.arg3)
		elseif slot0.lastLoginUser.type == 2 then
			setInputText(slot0.loginUsername, slot0.lastLoginUser.arg1)
			setInputText(slot0.loginPassword, slot0.lastLoginUser.arg2)
		end
	end
end

slot2 = {
	{
		0.403921568627451,
		1,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		0.6078431372549019,
		0.6078431372549019,
		0.6078431372549019,
		0.6274509803921569
	},
	{
		1,
		0.3607843137254902,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		1,
		0.6588235294117647,
		0.2196078431372549,
		0.6274509803921569
	}
}

function slot0.updateServerTF(slot0, slot1, slot2)
	setText(findTF(slot1, "name"), "-  " .. slot2.name .. "  -")
	setImageSprite(findTF(slot1, "statu"), slot0.iconSpries[slot2.status + 1], true)

	findTF(slot1, "statu_1"):GetComponent("Image").color = Color.New(slot0[slot2.status + 1][1], slot0[slot2.status + 1][2], slot0[slot2.status + 1][3], slot0[slot2.status + 1][4])

	setActive(findTF(slot1, "mark"), slot2.isLogined)
	setActive(slot0:findTF("tag_new", slot1), slot2.isNew)
	setActive(slot0:findTF("tag_hot", slot1), slot2.isHot)
	onButton(slot0, slot1, function ()
		if slot0.status == Server.STATUS.VINDICATE then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_vindicate"))

			return
		end

		if slot0.status == Server.STATUS.FULL then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_full"))

			return
		end

		slot1:setLastLoginServer(slot1.setLastLoginServer)
		pg.UIMgr.GetInstance():UnblurPanel(slot1.serversPanel, slot1._tf)
		setActive(pg.UIMgr.GetInstance().serversPanel, false)
	end, SFX_CONFIRM)
end

function slot0.updateAdviceServer(slot0)
	if not slot0.recentTF or not slot0.adviceTF then
		return
	end

	setActive(slot0.recentTF, slot0.lastLoginServer)

	if slot0.lastLoginServer then
		slot0:updateServerTF(findTF(slot0.recentTF, "server"), slot0.lastLoginServer)
	end

	setActive(slot0.adviceTF, getProxy(ServerProxy).firstServer)

	if getProxy(ServerProxy).firstServer then
		slot0:updateServerTF(findTF(slot0.adviceTF, "server"), slot1)
	end
end

function slot0.updateServerList(slot0, slot1)
	slot0.serverList = slot1

	removeAllChildren(slot0.servers)

	for slot6, slot7 in pairs(slot2) do
		slot0:updateServerTF(cloneTplTo(slot0.serverTpl, slot0.servers), slot7)
	end
end

function slot0.switchToTencentLogin(slot0)
	setActive(slot0.tencentPanel, true)
	setActive(slot0.accountBtn, false)
	setActive(slot0.userCenterBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
end

function slot0.switchToLogin(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		pg.SDKMgr:GetInstance():callSdkApi("switchAccount", nil)

		return
	end

	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.userCenterBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, true)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
end

function slot0.switchToRegister(slot0)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.userCenterBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, true)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
end

function slot0.switchToServer(slot0)
	slot0:updateAdviceServer()
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, not isPlatform() or CHANNEL_NAME == "txwy_kr")
	setActive(slot0.userCenterBtn, not isPlatform() or CHANNEL_NAME == "txwy_kr")
	setActive(slot0.pressToLogin, true)
	setActive(slot0.currentServer, true)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
end

function slot0.SwitchToWaitPanel(slot0, slot1)
	slot3 = slot0:findTF("window/content", slot2)
	slot0.waitTimer = nil
	slot4 = 0
	slot5 = slot1
	slot0.waitTimer = Timer.New(function ()
		setText(setText, i18n("login_wait_tip", setText))

		slot2 = slot2 - 1

		if math.random(0, 1) == 1 then
			slot1 = slot2
		end

		if slot2 <= 0 then
			triggerButton(slot3:findTF("background"))
			slot3.waitTimer:Stop()

			"background".waitTimer = nil
		end
	end, 1, -1)

	slot0.waitTimer:Start()
	slot0.waitTimer.func()
	setActive(slot0:findTF("Msgbox"), true)
end

function slot0.willExit(slot0)
	if slot0.waitTimer then
		slot0.waitTimer:Stop()

		slot0.waitTimer = nil
	end

	if slot0.openingTF then
		SetParent(slot0.openingTF, slot0._tf)
	end
end

function slot0.playOpening(slot0, slot1, slot2, slot3)
	pg.CriMgr.GetInstance():stopBGM()

	function slot4()
		setActive(slot0.openingTF, false)

		setActive.openingAni.enabled = false

		if setActive.openingAni.criAni then
			slot0.criAni:Stop()
		end

		if slot0.openingTF then
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.openingTF.transform, slot0._tf)
			Destroy(slot0.openingTF)

			Destroy.openingTF = nil
		end

		if slot1 then
			slot1()
		end

		slot0.cg.alpha = 1

		pg.CriMgr.GetInstance():resumeNormalBGM()
	end

	function slot5()
		if not slot0.cg then
			slot0.cg = GetOrAddComponent(slot0._tf, "CanvasGroup")
		end

		slot0.cg.alpha = 0

		setActive(slot0.openingTF, true)

		setActive.openingAni.enabled = true

		onButton(onButton, slot0.openingTF, function ()
			if slot0 then
				slot1()
			end
		end)

		slot0 = onButton.openingTF:GetComponent("DftAniEvent")

		slot0:SetStartEvent(function (slot0)
			if slot0.criAni then
				slot0.criAni:Play()
			end
		end)
		slot0:SetEndEvent(function (slot0)
			slot0()
		end)
		setActive(slot0.openingTF, true)
	end

	if IsNil(slot0.openingTF) then
		LoadAndInstantiateAsync("ui", "opening", function (slot0)
			slot0:SetActive(false)

			slot0.openingTF = slot0

			pg.UIMgr.GetInstance():OverlayPanel(slot0.openingTF.transform)

			slot0.criAni = slot0.openingTF:GetComponent("CriManaEffectUI")

			setActive(slot0.openingTF, false)

			slot0.openingAni = slot0.openingTF:GetComponent("Animator")

			slot0()
		end)
	else
		slot5()
	end
end

return slot0
