slot0 = class("MainUI", import("..base.BaseUI"))
slot1 = Mathf
slot0.EJECT_DURATION = 0.5
slot0.EJECT_DURATION_ENTER = 0.7
slot0.DIRECTION_RIGHT = 1
slot0.DIRECTION_DOWN = 2
slot0.DIRECTION_LEFT = 3
slot0.DIRECTION_UP = 4
slot0.DIRECTION_DOWN_RIGHT = 5
slot0.DIRECTION_UP_LEFT = 6
slot0.REVERT_VERTICAL = -1
slot0.REVERT_HERIZONTAL = -2
slot0.REVERT_HERIZONTAL_VERTICAL = -3
slot0.STATE_MAIN = 1
slot0.STATE_SECONDARY = 2
slot0.STATE_ALL_HIDE = 3
slot0.TOUCH_HEIGHT = 20
slot0.TOUCH_LOOP = 1
slot0.TOUCH_DURATION = 0.1
slot0.BREATH_HEIGHT = -10
slot0.BREATH_DURATION = 2.3
slot0.CHAT_HEIGHT = 15
slot0.CHAT_DURATION = 0.3
slot0.CHAT_SHOW_TIME = 3
slot0.CHAT_INTERVAL = 30
slot0.CHAT_ANIMATION_TIME = 0.3
slot0.BG_DAY = "day"
slot0.BG_NIGHT = "night"
slot0.BG_TIMELINE_DAY = 5
slot0.BG_TIMELINE_NIGHT = 18
slot0.BUFFTEXT_SHOW_TIME = 7
slot2 = nil

function slot0.getUIName(slot0)
	return "MainUI"
end

function slot0.getBGM(slot0)
	return MAIN_THEME
end

function slot0.setShips(slot0, slot1)
	slot0.ships = slot1
end

function slot0.setBG(slot0, slot1, slot2)
	PoolMgr.GetInstance():GetSprite("bg/bg_" .. slot1, "", false, function (slot0)
		setImageSprite(slot0._bg:Find("bg"), slot0)
	end)

	if slot2 then
		if slot1 == slot0.BG_DAY then
			slot0:fadeBG(slot0.BG_NIGHT)
		else
			slot0:fadeBG(slot0.BG_DAY)
		end
	else
		for slot7, slot8 in ipairs(slot3) do
			if slot8 ~= slot1 then
				PoolMgr.GetInstance():DestroySprite("bg/bg_" .. slot8)
			end
		end
	end
end

function slot0.Ctor(slot0)
	slot0.super.Ctor(slot0)

	slot1 = pg.AssistantInfo
end

function slot0.init(slot0)
	slot0._guiderLoaded = true
	slot0._leftPanel = slot0:findTF("leftPanel")
	slot0._hideBtn = slot0:findTF("leftPanel/hideButton")
	slot0._cameraBtn = slot0:findTF("leftPanel/cameraButton")
	slot0._chatBtn = slot0:findTF("leftPanel/chatButton")
	slot0._monthCardBtn = slot0:findTF("leftPanel/monthCardButton")
	slot0._commissionBtn = slot0:findTF("leftPanel/commissionButton")
	slot0._commissionBtn.localPosition = Vector3(0, slot0._commissionBtn.localPosition.y, 0)
	slot0._commissionTip = slot0:findTF("leftPanel/commissionButton/tip")
	slot0._rightPanel = slot0:findTF("rightPanel")
	slot0._friendBtn = slot0:findTF("rightPanel/btnsArea/friendButton")
	slot0._mailBtn = slot0:findTF("rightPanel/btnsArea/mailButton")
	slot0._mailMsg = slot0:findTF("unread", slot0._mailBtn)
	slot0._mailEmpty = slot0:findTF("read", slot0._mailBtn)
	slot0._attachmentHint = slot0:findTF("attachmentLabel", slot0._mailBtn)
	slot0._attachmentCountText = slot0:findTF("attachmentCountText", slot0._attachmentHint):GetComponent(typeof(Text))
	slot0._noticeBtn = slot0:findTF("rightPanel/btnsArea/noticeButton")
	slot0._settingBtn = slot0:findTF("rightPanel/btnsArea/settingButton")
	slot0._rankBtn = slot0:findTF("rightPanel/btnsArea/rankButton")
	slot0._combatBtn = slot0:findTF("rightPanel/combatBtn")
	slot0._formationBtn = slot0:findTF("rightPanel/formationButton")
	slot0._collectionBtn = slot0:findTF("rightPanel/btnsArea/collectionButton")
	slot0._activityBtn = slot0:findTF("rightPanel/linkBtns/activity_btn")
	slot0._activityMapBtn = slot0:findTF("rightPanel/linkBtns/activity_map_btn")
	slot0._anniversaryBtn = slot0:findTF("rightPanel/linkBtns/anniversary_btn")
	slot0._summaryBtn = slot0:findTF("rightPanel/linkBtns/summary_btn")
	slot0._bossBattleBtn = slot0:findTF("rightPanel/linkBtns/boss_act_btn")
	slot0._activitySummaryBtn = slot0:findTF("rightPanel/activitySummary")
	slot0._monopolyBtn = slot0:findTF("rightPanel/linkBtns/monopoly_btn")
	slot0._voteBtn = slot0:findTF("rightPanel/linkBtns/vote_btn")
	slot0._lotteryBtn = slot0:findTF("rightPanel/linkBtns/lottery_btn")
	slot0._coloringBtn = slot0:findTF("rightPanel/linkBtns/coloring_btn")
	slot0._activityPtBtn = slot0:findTF("rightPanel/linkBtns/activity_pt_btn")
	slot0._activityTaskWowsBtn = slot0:findTF("rightPanel/linkBtns/activity_wows_btn")
	slot0._bottomPanel = slot0:findTF("bottomPanel")
	slot0._dockBtn = slot0:findTF("bottomPanel/buttons_container/dockBtn")
	slot0._equipBtn = slot0:findTF("bottomPanel/buttons_container/equipButton")
	slot0._buildBtn = slot0:findTF("bottomPanel/buttons_container/buildButton")
	slot0._taskBtn = slot0:findTF("bottomPanel/buttons_container/taskButton")
	slot0._guildButton = slot0:findTF("bottomPanel/buttons_container/guildButton")
	slot0._mallBtn = slot0:findTF("bottomPanel/mallBtn")
	slot0._secondaryPanel = slot0:findTF("secondary_panel")

	setActive(slot0._secondaryPanel, false)

	slot0._liveBtn = slot0:findTF("bottomPanel/buttons_container/liveButton")
	slot0._academyBtn = slot0:findTF("secondary_panel/frame/bg/school_btn")
	slot0._haremBtn = slot0:findTF("secondary_panel/frame/bg/backyard_btn")
	slot0._commanderBtn = slot0:findTF("secondary_panel/frame/bg/commander_btn")
	slot0._technologyBtn = slot0:findTF("bottomPanel/buttons_container/technologyButton")
	slot0._playerResOb = slot0:findTF("playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0._commanderPanel = slot0:findTF("commanderPanel")
	slot0._commanderInfoBtn = slot0:findTF("button", slot0._commanderPanel)
	slot0._nameLabel = slot0:findTF("nameLabel", slot0._commanderPanel)
	slot0._levelLabel = slot0:findTF("levelLabel", slot0._commanderPanel)
	slot0._expBar = slot0:findTF("expArea/expBar", slot0._commanderPanel):GetComponent(typeof(OSlider))
	slot0._icon = slot0:findTF("icon", slot0._commanderPanel):GetComponent(typeof(Image))
	slot0._buffList = slot0:findTF("buffList", slot0._commanderPanel)
	slot0._buffTpl = slot0:findTF("buff", slot0._buffList)
	slot0._buffText = slot0:findTF("buffText", slot0._commanderPanel)
	slot0.traingCampBtn = slot0:findTF("link_btns/traningcamp", slot0._commanderPanel)
	slot0.refluxBtn = slot0:findTF("link_btns/return", slot0._commanderPanel)

	setActive(slot0._buffText, false)

	slot0._paintingTF = slot0:findTF("paint")
	slot0._paintingContainer = slot0:findTF("paint/fitter")
	slot0._chatTextBg = slot0:findTF("chat/chatbgtop", slot0._paintingTF)
	slot0._chatText = slot0:findTF("chat/Text", slot0._paintingTF)
	slot0._chat = slot0:findTF("chat", slot0._paintingTF)
	slot0.initChatBgH = slot0._chatTextBg.sizeDelta.y
	slot0.effectTF = slot0:findTF("effect", slot0._paintingTF)

	if slot0:findTF("paint/live2d").childCount > 0 then
		slot0.live2dCom = slot1:GetChild(0):GetComponent(typeof(Live2dChar))
	end

	slot0._chatBg = slot0:findTF("chatPreview", slot0._rightPanel)
	slot0._chatList = slot0:findTF("list", slot0._chatBg)
	slot0._chatItem = slot0:findTF("item", slot0._chatBg).gameObject

	slot0._chatItem:SetActive(false)

	slot0._chatActBtn = slot0:findTF("ActivityBtn", slot0._chatBg)
	slot0.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)
	slot0._bg = slot0:findTF("Sea")
	slot0._chat.localScale = Vector3(0, 0)
	slot0._paintingOffset = rtf(slot0._paintingTF.parent).rect.width / 2

	slot0:ejectGimmick(slot0._bottomPanel, slot0.REVERT_VERTICAL, slot0.EJECT_DURATION_ENTER)
	slot0:ejectGimmick(slot0._leftPanel, slot0.REVERT_HERIZONTAL, slot0.EJECT_DURATION_ENTER)
	slot0:ejectGimmick(slot0._rightPanel, slot0.REVERT_HERIZONTAL, slot0.EJECT_DURATION_ENTER)
	slot0:ejectGimmick(slot0._playerResOb, slot0.REVERT_VERTICAL, slot0.EJECT_DURATION_ENTER)
	slot0:ejectGimmick(slot0._commanderPanel, slot0.REVERT_HERIZONTAL_VERTICAL, slot0.EJECT_DURATION_ENTER, function ()
		slot0:dispatchUILoaded(true)
	end)

	if not slot0._attachmentCount then
		slot0._attachmentCount = 0
	end
end

function slot0.openSecondaryPanel(slot0, slot1)
	slot0.isOpenSecondary = true

	pg.UIMgr.GetInstance():BlurPanel(slot0._secondaryPanel)
	setActive(slot0._secondaryPanel, true)
end

function slot0.closeSecondaryPanel(slot0)
	slot0.isOpenSecondary = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._secondaryPanel, slot0._tf)
	setActive(slot0._secondaryPanel, false)
end

function slot0.updateTraningCampBtn(slot0)
	slot3 = false
	slot4 = false

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_GUIDE_TASKS) and not slot1:isEnd() then
		slot3 = getProxy(ChapterProxy):getChapterById(slot1:getConfig("config_data")[1]) and slot6:isClear()
		slot8 = getProxy(TaskProxy)
		slot4 = _.any(_.flatten(slot1:getConfig("config_data")[3]), function (slot0)
			return slot0:getTaskById(slot0) and slot1:isFinish() and not slot1:isReceive()
		end)
	end

	setActive(slot0.traingCampBtn:Find("xinshou01"), slot4)

	slot0.openTraningCamp = slot2 and slot3

	setActive(slot0.traingCampBtn, slot0.openTraningCamp)
end

function slot0.updateRefluxBtn(slot0)
	setActive(slot0.refluxBtn, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot2:isEnd())

	if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot2.isEnd() then
		setActive(slot0.refluxBtn:Find("effect"), slot1:existRefluxAwards())
	end
end

function slot0.didEnter(slot0)
	if not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0._player.level, "CommandRoomMediator") then
		slot0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		slot0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(slot0, slot0._commanderBtn, function ()
		slot0:emit(MainUIMediator.OPEN_COMMANDER)
	end, SFX_MAIN)
	onButton(slot0, slot0.traingCampBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	onButton(slot0, slot0.traingCampBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	onButton(slot0, slot0.refluxBtn, function ()
		slot0:emit(MainUIMediator.GO_SCENE, {
			SCENE.REFLUX
		})
	end, SFX_PANEL)
	onButton(slot0, slot0._combatBtn, function ()
		slot0:emit(MainUIMediator.OPEN_LEVEL)
	end, SFX_UI_WEIGHANCHOR_BATTLE)
	onButton(slot0, slot0._dockBtn, function ()
		slot0:emit(MainUIMediator.OPEN_CHUANWUSTART, DockyardScene.MODE_OVERVIEW)
	end, SFX_MAIN)
	onButton(slot0, slot0._hideBtn, function ()
		slot0:switchForm(slot1.STATE_ALL_HIDE)
	end, SFX_MAIN)
	onButton(slot0, slot0._cameraBtn, function ()
		if CheckPermissionGranted(ANDROID_CAMERA_PERMISSION) then
			slot0:openSnapShot()
		else
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("apply_permission_camera_tip1"),
				onYes = function ()
					ApplyPermission({
						ANDROID_CAMERA_PERMISSION
					})
				end
			})
		end
	end, SFX_MAIN)
	onButton(slot0, slot0._mallBtn, function ()
		slot0:emit(MainUIMediator.GO_MALL)
	end, SFX_MAIN)
	onButton(slot0, slot0._commissionBtn, function ()
		if not LeanTween.isTweening(go(slot0._commissionBtn)) then
			LeanTween.moveX(slot0._commissionBtn, -1 * slot0._commissionBtn.rect.width, 0.2):setOnComplete(System.Action(function ()
				slot0:emit(MainUIMediator.OPEN_COMMISSION_INFO)
			end))
		end
	end, SFX_UI_INFO)
	onButton(slot0, slot0._friendBtn, function ()
		slot0:emit(MainUIMediator.OPEN_FRIEND)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._buildBtn, function ()
		slot0:emit(MainUIMediator.GETBOAT)
	end, SFX_UI_BUILDING)
	onButton(slot0, slot0._taskBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TASK)
	end, SFX_MAIN)
	onButton(slot0, slot0._equipBtn, function ()
		slot0:emit(MainUIMediator.OPEN_ARMORYSCENE)
	end, SFX_MAIN)

	if not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0._player.level, "BackYardMediator") then
		slot0._haremBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		slot0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(slot0, slot0._haremBtn, function ()
		slot0:emit(MainUIMediator.OPEN_BACKYARD)
	end, SFX_MAIN)
	onButton(slot0, slot0._academyBtn, function ()
		slot0:emit(MainUIMediator.OPEN_SCHOOLSCENE)
	end, SFX_MAIN)
	onButton(slot0, slot0._formationBtn, function ()
		slot0:emit(MainUIMediator.OPEN_BIANDUI, defaultValue(slot0.contextData.fleetId, 1))
	end, SFX_UI_FORMATION)
	onButton(slot0, slot0._collectionBtn, function ()
		slot0:emit(MainUIMediator.OPEN_COLLECT_SHIP)
	end, SFX_UI_MENU)

	if not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0._player.level, "NewGuildMediator") then
		setActive(slot0:findTF("lock", slot0._guildButton), true)

		slot0._guildButton:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		setActive(slot0:findTF("lock", slot0._guildButton), false)

		slot0._guildButton:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(slot0, slot0._guildButton, function ()
		slot0:emit(MainUIMediator.OPEN_GUILD)
	end, SFX_MAIN)
	onButton(slot0, slot0._mailBtn, function ()
		if BATTLE_DEBUG then
			slot0:emit(MainUIMediator.TMP_DEBUG)
		else
			slot0:emit(MainUIMediator.OPEN_MAIL)
		end
	end, SFX_UI_MENU)
	onButton(slot0, slot0._chatBtn, function ()
		if not slot0.hideChatFlag or slot0.hideChatFlag ~= 1 then
			slot0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(slot0, slot0._chatBg, function ()
		if not slot0.hideChatFlag or slot0.hideChatFlag ~= 1 then
			slot0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(slot0, slot0._settingBtn, function ()
		slot0:emit(MainUIMediator.OPEN_SETTINGS)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._chatActBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n((slot0.hideChatFlag and slot0.hideChatFlag == 1 and "show_chat_warning") or "hide_chat_warning"),
			onYes = function ()
				if slot0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				slot1.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				PlayerPrefs.GetInt(HIDE_CHAT_FLAG):sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	slot0:sethideChatBtn()
	onButton(slot0, slot0._noticeBtn, function ()
		slot0:emit(MainUIMediator.OPEN_NOTICE)
	end, SFX_UI_MENU)
	SetActive(slot0._rankBtn, slot4)
	onButton(slot0, slot0._rankBtn, function ()
		slot0:emit(MainUIMediator.OPEN_RANK)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._commanderInfoBtn, function ()
		slot0:emit(MainUIMediator.OPEN_PLAYER_INFO_LAYER)
	end, SFX_MAIN)
	onButton(slot0, slot0._bg, function ()
		if slot0._currentState == slot1.STATE_ALL_HIDE then
			slot0:switchForm(slot1.STATE_MAIN)
		end
	end, SFX_MAIN)
	onButton(slot0, slot0._paintingTF, function ()
		if slot0._currentState == slot1.STATE_ALL_HIDE then
			slot0:switchForm(slot1.STATE_MAIN)
		elseif slot0.Live2dChar then
			if slot0.live2dCom.ResponseClick then
				slot0:Live2dClickEvent()
			end
		else
			slot0 = slot0:filterAssistantEvents(slot2.PaintingTouchEvents)

			slot0:AssistantEventEffect(slot0[math.ceil(math.random(#slot0))])
			slot0:paintClimax(slot1.TOUCH_HEIGHT, slot1.TOUCH_DURATION, slot1.TOUCH_LOOP)
		end

		if slot0.flagShip then
			slot0:emit(MainUIMediator.ON_TOUCHSHIP, slot0.flagShip.groupId)
		end
	end)
	onButton(slot0, slot0._liveBtn, function ()
		slot0:openSecondaryPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0._secondaryPanel, function ()
		slot0:closeSecondaryPanel()
	end)

	if not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0._player.level, "TechnologyMediator") then
		setActive(slot0:findTF("lock", slot0._technologyBtn), true)

		slot0._technologyBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		setActive(slot0:findTF("lock", slot0._technologyBtn), false)

		slot0._technologyBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(slot0, slot0._technologyBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TECHNOLOGY)
	end, SFX_PANEL)
	pg.DelegateInfo.Add(slot0, slot6)
	GetOrAddComponent(slot0._paintingTF, "UILongPressTrigger").onLongPressed.RemoveAllListeners(slot6)
	GetOrAddComponent(slot0._paintingTF, "UILongPressTrigger").onLongPressed.AddListener(slot6, function ()
		if slot0.Live2dChar then
			return
		end

		slot0:emit(MainUIMediator.ON_SHIP_DETAIL, slot0.flagShip)
	end)
	slot0:paintMove(355, "mainNormal", false, -30)
end

function slot0.updateMonopolyBtn(slot0, slot1)
	setActive(slot0._monopolyBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._monopolyBtn, function ()
			slot0:emit(MainUIMediator.ON_MONOPOLY)
		end, SFX_PANEL)
	end
end

function slot0.openSnapShot(slot0)
	slot0:emit(MainUIMediator.OPEN_SNAPSHOT, {
		skinId = slot0.flagShip.skinId,
		live2d = slot0.Live2dChar ~= nil
	})
end

function slot0.updateBossBattleBtn(slot0, slot1)
	setActive(slot0._bossBattleBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._bossBattleBtn, function ()
			slot0:emit(MainUIMediator.ON_BOSS_BATTLE)
		end, SFX_PANEL)
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.isOpenSecondary then
		slot0:closeSecondaryPanel()

		return
	end

	if slot0._currentState == slot0.STATE_ALL_HIDE then
		slot0:switchForm(slot0.STATE_MAIN)
	else
		BilibiliSdkMgr.inst:onBackPressed()
		pg.PushNotificationMgr.GetInstance():PushAll()
	end
end

function slot0.updateActivityBtn(slot0, slot1)
	setActive(slot0._activityBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY, slot1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateActivityMapBtn(slot0, slot1)
	setActive(slot0._activityMapBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityMapBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_MAP, slot1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateActivityPtBtn(slot0, slot1)
	setActive(slot0._activityPtBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityPtBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_PT, slot1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateAnniversaryBtn(slot0, slot1)
	setActive(slot0._anniversaryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._anniversaryBtn, function ()
			slot0:emit(MainUIMediator.ON_ANNIVERSARY)
		end, SFX_PANEL)
	end
end

function slot0.updateSummaryBtn(slot0, slot1)
	setActive(slot0._summaryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._summaryBtn, function ()
			slot0:emit(MainUIMediator.ON_SUMMARY)
		end, SFX_PANEL)
	end
end

function slot0.updateVoteBtn(slot0, slot1)
	slot2 = nil

	if slot1 and not slot1:isEnd() then
		slot2 = _.detect(pg.activity_vote.all, function (slot0)
			return pg.TimeMgr.GetInstance():inTime(pg.activity_vote[slot0].time)
		end)
	end

	setActive(slot0._voteBtn, slot2 ~= nil)

	if slot2 then
		onButton(slot0, slot0._voteBtn, function ()
			slot0:emit(MainUIMediator.ON_VOTE)
		end, SFX_PANEL)
	end
end

function slot0.updateLotteryBtn(slot0, slot1)
	setActive(slot0._lotteryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._lotteryBtn, function ()
			slot0:emit(MainUIMediator.ON_LOTTERY, slot1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateColoringBtn(slot0, slot1)
	setActive(slot0._coloringBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._coloringBtn, function ()
			slot0:emit(MainUIMediator.OPEN_COLORING)
		end, SFX_PANEL)
	end
end

function slot0.updateActivityWowsBtn(slot0, slot1)
	setActive(slot0._activityTaskWowsBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityTaskWowsBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_WOWS, slot1.id)
		end, SFX_PANEL)
	end
end

function slot0.fadeBG(slot0, slot1)
	slot0._newBG = Instantiate(slot0._bg:Find("bg"))

	PoolMgr.GetInstance():GetSprite("bg/bg_" .. slot1, "", false, function (slot0)
		if slot0._newBG then
			GetOrAddComponent(slot0._newBG, "Image").sprite = slot0

			slot0._newBG.transform:SetParent(slot0._bg.transform)

			slot0._newBG.transform.localScale = Vector3(1, 1, 1)
			slot0._newBG.transform.localPosition = Vector3(0, 0, 0)
			slot0._newBG.transform.anchoredPosition = Vector3(-5, 0, 0)

			LeanTween.alpha(rtf(slot0._newBG), 0, 5):setFrom(1):setOnComplete(System.Action(function ()
				Destroy(go(slot0._newBG))

				Destroy._newBG = nil
			end))
		end
	end)
end

function slot0.switchForm(slot0, slot1)
	if slot0._currentState ~= slot1 then
		slot0._currentState = slot1

		if slot1 == slot0.STATE_MAIN then
			slot0:ejectGimmick(slot0._bottomPanel, slot0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._leftPanel, slot0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._rightPanel, slot0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._playerResOb, slot0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._commanderPanel, slot0.REVERT_HERIZONTAL_VERTICAL)
			slot0:paintMove(355, "mainNormal", true, -30)
		elseif slot1 == slot0.STATE_ALL_HIDE then
			slot0:concealGimmick(slot0._bottomPanel, slot0.DIRECTION_DOWN)
			slot0:concealGimmick(slot0._rightPanel, slot0.DIRECTION_RIGHT)
			slot0:concealGimmick(slot0._leftPanel, slot0.DIRECTION_LEFT)
			slot0:concealGimmick(slot0._playerResOb, slot0.DIRECTION_UP)
			slot0:concealGimmick(slot0._commanderPanel, slot0.DIRECTION_UP_LEFT)
			slot0:paintMove(slot0._paintingOffset, "mainFullScreen", true, -50)
		end
	end
end

function slot0.paintBreath(slot0)
	if slot0.Live2dChar or slot0.paintMoving then
		return
	end

	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.moveY(rtf(slot0._paintingTF), slot0.BREATH_HEIGHT, slot0.BREATH_DURATION):setLoopPingPong():setEase(LeanTweenType.easeInOutCubic):setFrom(0)
end

function slot0.paintClimax(slot0, slot1, slot2, slot3)
	if slot0.Live2dChar or slot0.paintMoving then
		return
	end

	if (slot3 or math.random(3) - 1) ~= 0 then
		LeanTween.cancel(go(slot0._paintingTF))
		LeanTween.moveY(rtf(slot0._paintingTF), slot1, slot2):setLoopPingPong(slot3):setOnComplete(System.Action(function ()
			slot0:paintBreath()
		end))
	end
end

function slot0.paintMove(slot0, slot1, slot2, slot3, slot4)
	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.moveY(rtf(slot0._paintingTF), 0, slot0.EJECT_DURATION)
	LeanTween.moveY(findTF(slot0._paintingTF, "live2d"), slot4, slot0.EJECT_DURATION)

	slot5 = GetOrAddComponent(findTF(slot0._paintingTF, "fitter"), "PaintingScaler")

	slot5:Snapshoot()

	slot5.FrameName = slot2

	if slot3 then
		slot6 = LeanTween.value(go(slot0._paintingTF), 0, 1, slot0.EJECT_DURATION):setOnUpdate(System.Action_float(function (slot0)
			slot0.Tween = slot0
		end)):setEase(LeanTweenType.easeInOutSine)
	end

	slot0._bg:GetComponent("Button").enabled = false
	slot0._paintingTF:GetComponent("Button").enabled = false
	slot0.paintMoving = true
	slot6 = LeanTween.moveX(rtf(slot0._paintingTF), slot1, slot0.EJECT_DURATION)

	slot6:setEase(LeanTweenType.easeInOutExpo)
	slot6:setOnComplete(System.Action(function ()
		slot0.paintMoving = false

		slot0:paintBreath()

		slot0.paintBreath._bg:GetComponent("Button").enabled = true
		slot0.paintBreath._bg.GetComponent("Button")._paintingTF:GetComponent("Button").enabled = true

		return
	end))
end

function slot0.displayShipWord(slot0, slot1)
	if slot0.chatFlag then
		return
	end

	slot0.chatFlag = true

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	slot3, slot4, slot5, slot6 = nil

	if string.split(slot1, "_")[1] == "main" then
		slot3, slot4 = Ship.getWords(slot0.flagShip.skinId, slot2[1], tonumber(slot2[2]))
		slot5 = Ship.getCVCalibrate(slot0.flagShip.skinId, slot2[1], tonumber(slot2[2]))
		slot6 = Ship.getL2dSoundEffect(slot0.flagShip.skinId, slot2[1], tonumber(slot2[2]))
	else
		slot3, slot4 = Ship.getWords(slot0.flagShip.skinId, slot1)
		slot5 = Ship.getCVCalibrate(slot0.flagShip.skinId, slot1)
		slot6 = Ship.getL2dSoundEffect(slot0.flagShip.skinId, slot1)
	end

	setText(slot0._chatText, slot3)

	if CHAT_POP_STR_LEN < #slot0._chatText:GetComponent(typeof(Text)).text then
		slot7.alignment = TextAnchor.MiddleLeft
	else
		slot7.alignment = TextAnchor.MiddleCenter
	end

	if slot0.initChatBgH < slot7.preferredHeight + 26 then
		slot0._chatTextBg.sizeDelta = Vector2.New(slot0._chatTextBg.sizeDelta.x, slot8)
	else
		slot0._chatTextBg.sizeDelta = Vector2.New(slot0._chatTextBg.sizeDelta.x, slot0.initChatBgH)
	end

	slot9 = slot0.CHAT_SHOW_TIME

	if findTF(slot0._paintingTF, "fitter").childCount > 0 then
		Ship.SetExpression(findTF(slot0._paintingTF, "fitter"):GetChild(0), slot0.flagShip:getPainting(), slot1)
	end

	function slot10()
		LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
			LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(slot0.CHAT_ANIMATION_TIME + LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()
				slot0.chatFlag = nil

				slot0:startChatTimer()

				return
			end))

			return
		end))

		return
	end

	if slot0._delayL2dSeID then
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
	end

	if slot0.live2dCom and slot6 then
		slot0._delayL2dSeID = LeanTween.delayedCall(slot6[2], System.Action(function ()
			playSoundEffect("event:/ui/" .. slot0[1])

			"event:/ui/" .. slot0[1]._delayL2dSeID = nil

			return
		end)).id
	end

	slot11 = pg.StoryMgr:GetInstance():isActive()

	if slot4 and not slot11 then
		function slot12()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			function slot1()
				slot1, slot1 = playSoundEffect(slot2)
				slot0._currentVoice = slot2

				if slot2 then
					slot3 = long2int(slot1.length) * 0.001
				end

				slot4()

				return
			end

			if slot0._delayVoiceTweenID then
				LeanTween.cancel(slot0._delayVoiceTweenID)

				slot0._delayVoiceTweenID = nil
			end

			if slot0.live2dCom and slot4 and slot4 ~= 0 then
				slot0._delayVoiceTweenID = LeanTween.delayedCall(slot4, System.Action(function ()
					slot0()

					slot1._delayVoiceTweenID = nil

					return
				end)).id
			else
				slot1()
			end

			return
		end

		if slot0.loadedCVBankName then
			slot12()
		else
			pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0.flagShip.skinId), function ()
				if pg.CriMgr.GetInstance().onStopCV then
					print("CV track --> onStopCV true")

					return
				else
					print("CV track --> onStopCV false")
				end

				slot0.loadingKey = nil

				if slot0.exited then
					pg.CriMgr.UnloadCVBank(slot0)
				else
					slot2()

					if slot0._currentVoice then
						slot0.loadedCVBankName = slot0
					end
				end

				return
			end)

			slot0.loadingKey = Ship.getCVKeyID(slot0.flagShip.skinId)
		end
	else
		if slot3 then
			slot10()
		else
			slot0.chatFlag = false
		end
	end

	removeOnButton(slot0._chat)
	onButton(slot0, slot0._chat, function ()
		if slot0 == "mission_complete" or slot0 == "mission" then
			slot1:emit(MainUIMediator.OPEN_TASK)
		else
			if slot0 == "collection" then
				slot1:emit(MainUIMediator.OPEN_EVENT)
			else
				if slot0 == "event_complete" then
					slot1:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
				end
			end
		end

		return
	end, SFX_MAIN)

	return
end

function slot0.stopCurVoice(slot0)
	if slot0.loadingKey then
		pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(slot0.loadingKey))
	end

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	return
end

function slot0.startChatTimer(slot0)
	if slot0.chatFlag or slot0.exited then
		return
	end

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	slot0.chatTimer = Timer.New(function ()
		slot0:paintClimax(slot1.CHAT_HEIGHT, slot1.CHAT_DURATION)

		if slot0.hasFinishedEvent and slot0.lastChatEvent ~= "event_complete" then
			table.insert(slot0, "event_complete")
		else
			if go(slot0._taskBtn:Find("tip")).activeSelf and slot0.lastChatEvent ~= "mission_complete" then
				table.insert(slot0, "mission_complete")
			end

			if slot0._attachmentCount > 0 and slot0.lastChatEvent ~= "mail" then
				table.insert(slot0, "mail")
			end

			if #slot0 == 0 and slot0._taskNotFinishCount and slot0._taskNotFinishCount > 0 and slot0.lastChatEvent ~= "mission" then
				table.insert(slot0, "mission")
			end
		end

		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		slot0.lastChatEvent = slot0[math.ceil(math.random(#slot0))]

		slot0:AssistantEventEffect(slot0.lastChatEvent)

		return
	end, slot0.CHAT_INTERVAL, 1)

	slot0.chatTimer:Start()

	return
end

function slot0.initShipChat(slot0)
	if slot0.contextData.isFromLogin then
		slot0.contextData.isFromLogin = nil

		slot0:AssistantEventEffect("event_login")
	else
		if getProxy(PlayerProxy):getFlag("battle") then
			getProxy(PlayerProxy):setFlag("battle", nil)
			slot0:AssistantEventEffect("home")
		else
			slot0:startChatTimer()
		end
	end

	return
end

function slot0.ShowAssistInfo(slot0, slot1, slot2)
	slot3 = findTF(slot0._paintingTF, "live2d")
	slot4 = getProxy(SettingsProxy)

	if not PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. slot1)) or not slot4:IsLive2dEnable() then
		if slot0.live2dCom then
			slot0.live2dCom.FinishAction = nil

			Destroy(slot0.live2dCom.gameObject)
			pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.live2dCom.name)

			slot0.live2dCom = nil
		end

		slot0.Live2dChar = false

		SetActive(slot3, false)
		setPaintingPrefabAsync(slot0._paintingTF, slot1, "mainNormal", function ()
			if slot0.exited then
				return
			end

			if not findTF(findTF(slot0._paintingTF, "fitter"):GetChild(0), "Touch") then
				return
			end

			setActive(slot0, true)
			eachChild(slot0, function (slot0)
				onButton(slot0, slot0, function ()
					if slot0._currentState == slot1.STATE_ALL_HIDE then
						slot0:switchForm(slot1.STATE_MAIN)
					else
						slot0:AssistantEventEffect(slot2.getPaintingTouchEvents(slot3.name))
						slot0.AssistantEventEffect:paintClimax(slot1.TOUCH_HEIGHT, slot1.TOUCH_DURATION, slot1.TOUCH_LOOP)
					end

					return
				end)

				return
			end)
			slot0:initShipChat()

			return
		end)
		slot0:paintBreath()

		return
	end

	LeanTween.cancel(go(slot0._paintingTF))

	slot0.Live2dChar = slot1
	slot6 = BuildVector3(slot2:GetSkinConfig().live2d_offset)

	SetActive(slot3, false)

	if not slot0.live2dCom or slot0.live2dCom.name ~= slot1 then
		pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot1, function (slot0)
			if slot0.exited then
				Destroy(slot0)
				pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(pg.Live2DMgr.GetInstance().TryReleaseLive2dRes)

				return
			end

			if slot0.live2dCom then
				slot0.live2dCom.FinishAction = nil

				Destroy(slot0.live2dCom.gameObject)
				pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(com.name)
			end

			UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))
			slot0.transform.SetParent(slot1, slot0.transform.SetParent, true)

			slot0.transform.localScale = Vector3(52, 52, 52)
			slot0.transform.localPosition = 52 + Vector3(0, 0, 100)
			slot2 = slot0:GetComponent(typeof(Live2dChar))

			slot2:SetReactMotions(slot4.idleActions)
			slot2:SetAction(slot3)

			function slot2.FinishAction(slot0)
				slot0.live2dAction = false

				slot0:SetAction(slot2.idleActions[math.ceil(math.random(#slot2.idleActions))])

				return
			end

			slot2:SetTouchParts(slot4.assistantTouchParts)

			slot0.live2dCom = slot2
			slot0.live2dCom.name = slot1

			SetActive(slot2, true)
			slot0:InitClickInfo(slot2)
			slot0:initShipChat()

			if CSharpVersion > 18 then
				slot5 = slot5.lip_smoothing

				if slot5.lip_sync_gain and slot4 ~= 0 then
					slot0:findTF("paint/live2d"):GetChild(0):GetComponent("CubismCriSrcMouthInput").Gain = slot4
				end

				if slot5 and slot5 ~= 0 then
					slot0:findTF("paint/live2d"):GetChild(0):GetComponent("CubismCriSrcMouthInput").Smoothing = slot5
				end
			end

			if CSharpVersion >= 21 and slot5.l2d_para_range ~= nil and type(slot4) == "table" then
				for slot8, slot9 in pairs(slot4) do
					slot2:SetParaRange(slot8, slot9)
				end
			end

			return
		end)
	end

	return
end

function slot0.InitClickInfo(slot0, slot1)
	slot0.live2dCom:SetCenterPart("Drawables/TouchHead", Vector3.zero)

	slot0.live2dCom.DampingTime = 0.3
	slot0.MinLive2DScreenPoint = true

	return
end

function slot0.Live2dClickEvent(slot0)
	if slot0.live2dAction or not slot0.MinLive2DScreenPoint then
		return
	end

	slot1 = Input.mousePosition
	slot3 = nil

	slot0:AssistantEventEffect((slot0.live2dCom:GetTouchPart() <= 0 or slot0:filterAssistantEvents(slot0.getAssistantTouchEvents(slot2))[math.ceil(math.random(#slot0.filterAssistantEvents(slot0.getAssistantTouchEvents(slot2))))]) and slot0:filterAssistantEvents(slot0.IdleEvents)[math.floor(math.Random(0, #slot0.filterAssistantEvents(slot0.IdleEvents))) + 1])

	return
end

function slot0.filterAssistantEvents(slot0, slot1)
	slot2 = {}
	slot3 = Ship.getMainwordsCount(slot0.flagShip.skinId)

	for slot7, slot8 in ipairs(slot1) do
		if string.split(slot10, "_")[1] == "main" then
			if tonumber(slot11[2]) <= slot3 then
				table.insert(slot2, slot8)
			end
		else
			table.insert(slot2, slot8)
		end
	end

	return slot2
end

function slot0.AssistantEventEffect(slot0, slot1)
	slot2 = slot0.assistantEvents[slot1]

	if slot0.live2dCom and not slot0.live2dAction then
		slot0.live2dCom:SetAction(slot0.action2Id[slot2.action])

		if slot0.action2Id[slot2.action] then
			slot0.live2dAction = true
		end
	end

	if slot2.dialog ~= "" then
		slot0:displayShipWord(slot2.dialog)
	else
		slot0:startChatTimer()
	end

	return
end

function slot0.tweenBG(slot0, slot1)
	LeanTween.moveX(rtf(slot0._bg), slot1, slot0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)

	return
end

function slot0.ejectGimmick(slot0, slot1, slot2, slot3, slot4)
	LeanTween.cancel(slot1.gameObject)
	SetActive(slot1, true)
	slot0:generateGimmickLean(slot1, slot2, slot3).setOnComplete(slot5, System.Action(function ()
		GetOrAddComponent(GetOrAddComponent, "CanvasGroup").blocksRaycasts = true

		if true then
			slot1()
		end

		return
	end)):setEase(LeanTweenType.easeInOutExpo)

	return
end

function slot0.concealGimmick(slot0, slot1, slot2)
	GetOrAddComponent(slot1, "CanvasGroup").blocksRaycasts = false

	slot0:generateGimmickLean(slot1, slot2, duration).setOnComplete(slot3, System.Action(function ()
		SetActive(SetActive, false)

		return
	end)):setEase(LeanTweenType.easeInOutExpo)

	return
end

function slot0.generateGimmickLean(slot0, slot1, slot2, slot3)
	slot3 = slot3 or slot0.EJECT_DURATION
	slot4 = slot1:GetComponent("RectTransform").rect
	slot5 = nil

	if slot2 == slot0.DIRECTION_RIGHT then
		slot5 = LeanTween.moveX(rtf(slot1), slot4.width, slot3)
	else
		if slot2 == slot0.DIRECTION_LEFT then
			slot5 = LeanTween.moveX(rtf(slot1), slot4.width * -1, slot3)
		else
			if slot2 == slot0.DIRECTION_UP then
				slot5 = LeanTween.moveY(rtf(slot1), slot4.height, slot3)
			else
				if slot2 == slot0.DIRECTION_DOWN then
					slot5 = LeanTween.moveY(rtf(slot1), slot4.height * -1, slot3)
				else
					if slot2 == slot0.DIRECTION_DOWN_RIGHT then
						slot5 = LeanTween.moveY(rtf(slot1), Vector3(slot4.width, slot4.height * -1, 0), slot3)
					else
						if slot2 == slot0.DIRECTION_UP_LEFT then
							slot5 = LeanTween.move(rtf(slot1), Vector3(slot4.width * -1, slot4.height, 0), slot3)
						else
							if slot2 == slot0.REVERT_VERTICAL then
								slot5 = LeanTween.moveY(rtf(slot1), 0, slot3)
							else
								if slot2 == slot0.REVERT_HERIZONTAL then
									slot5 = LeanTween.moveX(rtf(slot1), 0, slot3)
								else
									if slot2 == slot0.REVERT_HERIZONTAL_VERTICAL then
										slot5 = LeanTween.move(rtf(slot1), Vector3(0, 0, 0), slot3)
									end
								end
							end
						end
					end
				end
			end
		end
	end

	return slot5
end

function slot0.updatePlayerInfo(slot0, slot1)
	slot0._player = slot1

	slot0._resPanel:setResources(slot1)
	slot0:setProfileInfo(slot1, slot0.ships)

	return
end

function slot0.setProfileInfo(slot0, slot1, slot2)
	setText(slot0._nameLabel, slot1.name)
	setText(slot0._levelLabel, "LV." .. slot1.level)

	slot3 = getConfigFromLevel1(pg.user_level, slot1.level)

	if slot1.level == slot0._player:getMaxLevel() then
		slot0._expBar.value = 1
	else
		slot0._expBar.value = slot1.exp / slot3.exp_interval
	end

	LoadSpriteAsync("qicon/" .. slot2[slot1.character]:getPainting(), function (slot0)
		if slot0.exited then
			return
		end

		if not slot0 then
			slot0._icon.sprite = GetSpriteFromAtlas("heroicon/unknown", "")
		else
			slot0._icon.sprite = slot0
		end

		return
	end)

	return
end

function slot0.updateBuffList(slot0, slot1)
	slot2 = UIItemList.New(slot0._buffList, slot0._buffTpl)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			LoadImageSpriteAsync(slot0[slot1 + 1].getConfig(slot3, "icon"), slot2)
			onButton(slot1, slot2, function ()
				if slot0._buffTextTimer then
					slot0._buffTextTimer:Stop()
				end

				setActive(slot0._buffText, true)
				setText(slot0._buffText:Find("Text"), slot1:getConfig("desc"))

				setText._buffTextTimer = Timer.New(function ()
					setActive(slot0._buffText, false)

					return
				end, slot2.BUFFTEXT_SHOW_TIME, 1)

				setText._buffTextTimer:Start()

				return
			end, SFX_PANEL)
		end

		return
	end)
	slot2:align(#slot1)

	return
end

function slot0.setFlagShip(slot0, slot1)
	if slot0.flagShip and not slot0.Live2dChar then
		retPaintingPrefab(slot0._paintingTF, slot1:getPainting())
	end

	slot0.flagShip = slot1

	if slot0.Live2dChar ~= slot1:getPainting() then
		slot0:ShowAssistInfo(slot2, slot1)
	end

	slot3 = nil

	if pg.ship_skin_template[slot0.flagShip.skinId].main_UI_FX ~= "" then
		slot3 = slot4
	else
		if slot1.propose then
			slot3 = "jiehuntexiao"
		end
	end

	setActive(slot0.effectTF, slot3 ~= nil)

	if slot3 then
		PoolMgr.GetInstance():GetPrefab("Effect/" .. slot3, slot3, true, function (slot0)
			if not slot0.exited then
				slot0._paintingFX = {
					name = slot0,
					obj = slot0
				}

				slot0.transform:SetParent(slot0.effectTF, true)

				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3.one
			end

			return
		end)
	end

	if slot0.flagShip and slot0.flagShip:getShipBgPrint() ~= slot0.flagShip:rarity2bgPrintForGet() then
		GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot5, "", function (slot0)
			if not slot0.exited then
				slot0.defaultBgSprite = getImageSprite(slot0._bg:Find("bg"))

				setImageSprite(slot0._bg:Find("bg"), slot0)
			end

			return
		end)
	end

	return
end

function slot0.updateTaskNotices(slot0, slot1, slot2)
	SetActive(slot0._taskBtn:Find("tip"), slot1 > 0)

	slot0._taskNotFinishCount = slot2

	return
end

function slot0.updateLessonNotices(slot0, slot1)
	SetActive(slot0._academyBtn:Find("tip"), defaultValue(slot1, true))

	slot0.schoolTip = defaultValue(slot1, true)

	slot0:updateLiveBtn()

	return
end

function slot0.updateBackYardNotices(slot0, slot1)
	SetActive(slot0:findTF("tip", slot0._haremBtn), slot1)

	slot0.backyardTip = slot1

	slot0:updateLiveBtn()

	return
end

function slot0.updateCommanderNotices(slot0, slot1)
	SetActive(slot0:findTF("tip", slot0._commanderBtn), slot1)

	slot0.commanderTip = slot1

	slot0:updateLiveBtn()

	return
end

function slot0.updateNotification(slot0, slot1)
	SetActive(slot0:findTF("tip", slot0._chatBtn), slot1 > 0)

	return
end

function slot0.friendNotification(slot0, slot1)
	SetActive(slot0:findTF("tip", slot0._friendBtn), slot1)

	return
end

function slot0.updateBuildNotices(slot0, slot1)
	SetActive(slot0:findTF("tip", slot0._buildBtn), slot1 > 0)

	return
end

function slot0.notifyActivitySummary(slot0, slot1, slot2)
	if not pg.gameset.event_tips then
		slot3 = {}
		slot3 = false

		if false then
			slot3 = true
		end
	end

	slot3 = pg.gameset.event_tips or 

	setActive(slot0._activitySummaryBtn, pg.gameset.event_tips or .key_value == 1)

	if pg.gameset.event_tips or .key_value == 1 then
		function slot4(slot0)
			PoolMgr.GetInstance():GetSpineChar("notice_manjuu", true, function (slot0)
				tf(slot0).localScale = Vector3(0.5, 0.5, 1)
				tf(slot0).localPosition = Vector3(0, -55, 0)

				pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
				setParent(tf(slot0), slot0._activitySummaryBtn)

				slot0.activitySummarySpine = slot0:GetComponent("SpineAnimUI")

				slot0()

				return
			end)

			return
		end

		function slot5()
			if {
				"normal",
				"notice"
			} <= 0 or not slot0[2] then
				slot1 = slot0[1]
			end

			slot1.activitySummarySpine:SetAction(slot1, 0)

			return
		end

		if not slot0.activitySummarySpine then
			slot4(slot5)
		else
			slot5()
		end

		onButton(slot0, slot0._activitySummaryBtn, function ()
			slot0 = slot0.emit
			slot2 = MainUIMediator.GO_SCENE
			slot3 = {
				SCENE.ACTIVITY
			}
			slot4 = {}

			if not slot0 or not slot1.id then
				slot5 = nil
			end

			slot4.id = slot5
			slot3[2] = slot4

			slot0(slot1, slot2, slot3)

			return
		end, SFX_PANEL)
	end

	return
end

function slot0.updateLiveBtn(slot0)
	slot1 = SetActive
	slot2 = slot0:findTF("tip", slot0._liveBtn)

	if not slot0.backyardTip and not slot0.schoolTip then
		slot3 = slot0.commanderTip
	end

	slot1(slot2, slot3)

	return
end

function slot0.updateCollectNotices(slot0, slot1)
	slot0.hasCollectCanGetRes = slot1

	SetActive(findTF(slot0._collectionBtn, "tip"), slot1)

	return
end

function slot0.updateGuildNotices(slot0, slot1)
	setActive(findTF(slot0._guildButton, "tip"), slot1)

	return
end

function slot0.updateMailAttachmentCount(slot0, slot1)
	slot0._attachmentCount = slot1

	if slot1 > 0 then
		SetActive(slot0._attachmentHint, true)
		SetActive(slot0._mailEmpty, false)
		SetActive(slot0._mailMsg, true)

		slot0._attachmentCountText.text = slot1
	else
		SetActive(slot0._mailEmpty, true)
		SetActive(slot0._mailMsg, false)
		SetActive(slot0._attachmentHint, false)
	end

	return
end

function slot0.updateEvent(slot0, slot1)
	slot0.hasFinishedEvent = slot1:hasFinishState()

	setActive(slot0._combatBtn:Find("tip"), slot0.hasFinishedEvent)

	return
end

function slot0.updateCommissionNotices(slot0, slot1)
	setActive(slot0._commissionTip, slot1)

	return
end

function slot0.updateSeverNotices(slot0, slot1)
	setActive(slot0._noticeBtn:Find("tip"), slot1)

	return
end

function slot0.updateSettingsNotice(slot0, slot1)
	setActive(slot0._settingBtn:Find("tip"), slot1)

	return
end

function slot0.notifyTechnology(slot0, slot1)
	setActive(slot0._technologyBtn:Find("tip"), slot1)

	return
end

function slot0.updateChat(slot0, slot1)
	if slot0.exited then
		return
	end

	if slot0.hideChatFlag and slot0.hideChatFlag == 1 then
		return
	end

	for slot6 = slot0._chatList.childCount, #slot1 - 1, 1 do
		cloneTplTo(slot0._chatItem, slot0._chatList)
	end

	for slot6 = 0, slot0._chatList.childCount - 1, 1 do
		slot9 = slot0._chatList:GetChild(slot6).gameObject
		slot8 = slot0._chatList.GetChild(slot6).gameObject.SetActive

		if slot6 >= #slot1 then
			slot10 = false
		else
			slot10 = true
		end

		slot8(slot9, slot10)
	end

	for slot6, slot7 in ipairs(slot1) do
		slot0:findTF("channel", slot8):GetComponent("Image").sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot7.type))
		slot10 = slot0:findTF("text", slot0._chatList:GetChild(slot6 - 1)):GetComponent("RichText")

		if slot7.type == ChatConst.ChannelPublic then
			slot10.supportRichText = true

			ChatProxy.InjectPublic(slot10, slot7)
		else
			if slot7.emojiId == nil then
				slot11 = false
			else
				slot11 = true
			end

			slot10.supportRichText = slot11
			slot11 = false
			slot12 = slot7.player.name .. ": " .. slot7.content

			if not slot7.emojiId then
				slot11, slot12 = contentWrap(slot12, 33, 1.65)
			end

			slot13 = slot12

			if slot11 then
				slot14 = "..."
			else
				slot14 = ""
			end

			slot10.text = slot13 .. slot14
		end
	end

	return
end

function slot0.clearChat(slot0, slot1)
	childCount = slot0._chatList.childCount

	for slot5 = 0, childCount - 1, 1 do
		slot0._chatList:GetChild(slot5).gameObject:SetActive(false)
	end

	return
end

function slot0.updateBanner(slot0, slot1)
	slot2 = slot0:findTF("eventPanel/mask/event", slot0._rightPanel):GetComponent("HScrollSnap")
	slot3 = slot0:findTF("content", slot2)
	slot5 = slot0:findTF("dots", slot2)

	setActive(slot4, false)
	setActive(slot6, false)

	for slot10 = 0, #slot1 - 1, 1 do
		cloneTplTo(slot6, slot5)

		slot12 = Instantiate(slot4)

		LoadImageSpriteAsync("activitybanner/" .. slot1[slot10 + 1].pic, slot12)
		slot2:AddChild(slot12)
		onButton(slot0, slot12, function ()
			if slot0.type == 1 then
				Application.OpenURL(slot0.param)
			else
				if slot0.type == 2 then
					slot1:emit(MainUIMediator.GO_SCENE, slot0.param)
				else
					if slot0.type == 3 then
						slot1:emit(MainUIMediator.OPEN_ACTIVITY_PANEL, tonumber(slot0.param))
					else
						if slot0.type == 4 then
							slot1:emit(MainUIMediator.OPEN_SHOP_LAYER)
						else
							if slot0.type == 5 then
								slot1:emit(MainUIMediator.OPEN_SCROLL, tonumber(slot0.param))
							else
								if slot0.type == 6 then
									slot1:emit(MainUIMediator.OPEN_TECHNOLOGY)
								end
							end
						end
					end
				end
			end

			return
		end, SFX_MAIN)
		setActive(findTF(slot12, "red"), false)

		if slot1[slot10 + 1].type == 3 and tonumber(slot11.param) == nil then
			setActive(slot13, getProxy(ActivityProxy):readyToAchieveByType(ActivityConst.ACTIVITY_TYPE_LEVELAWARD))
		end

		slot12:SetActive(true)
	end

	slot2.autoSnap = 5
	slot0.bannerSnap = slot2
	slot0.bannerContent = slot3
	slot0.bannerDots = slot5

	return
end

function slot0.activeEffect(slot0, slot1)
	setActive(slot0._paintingTF, slot1)

	slot2 = setActive
	slot3 = slot0.traingCampBtn

	if slot1 then
		slot4 = slot0.openTraningCamp
	end

	slot2(slot3, slot4)

	return
end

function slot0.willExit(slot0)
	if slot0.activitySummarySpine then
		PoolMgr.GetInstance():ReturnSpineChar("notice_manjuu", go(slot0.activitySummarySpine))
	end

	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.cancel(slot0._chat.gameObject)

	if slot0._delayVoiceTweenID then
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
	end

	if slot0._delayL2dSeID then
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
	end

	if slot0._newBG then
		LeanTween.cancel(go(slot0._newBG))
		Destroy(go(slot0._newBG))

		slot0._newBG = nil
	end

	if slot0._paintingFX then
		PoolMgr.GetInstance():ReturnPrefab("Effect/" .. slot1, slot0._paintingFX.name, slot0._paintingFX.obj)

		slot0._paintingFX = nil
	end

	if slot0.chatTimer then
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
	end

	pg.TimeMgr.GetInstance():RemoveTimer(slot0._timeSchedule)

	slot0._timeSchedule = nil

	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end

	if slot0.flagShip then
		retPaintingPrefab(slot0._paintingTF, slot0.flagShip:getPainting())
	end

	if slot0.live2dCom then
		slot0.live2dCom.FinishAction = nil

		Destroy(slot0.live2dCom.gameObject)
		pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.live2dCom.name)

		slot0.live2dCom = nil
	end

	slot0.Live2dChar = nil

	for slot4 = slot0.bannerContent.childCount - 1, 0, -1 do
		clearImageSprite(slot0.bannerContent:GetChild(slot4))
		Destroy(slot0.bannerSnap:RemoveChild(slot4))
	end

	removeAllChildren(slot0.bannerDots)

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	if slot0.defaultBgSprite then
		setImageSprite(slot0._bg:Find("bg"), slot0.defaultBgSprite)

		slot0.defaultBgSprite = nil
	end

	if slot0._buffTextTimer then
		slot0._buffTextTimer:Stop()

		slot0._buffTextTimer = nil
	end

	if slot0.isOpenSecondary then
		slot0:closeSecondaryPanel()
	end

	return
end

function slot0.sethideChatBtn(slot0)
	if slot0.hideChatFlag then
		if slot0.hideChatFlag ~= 1 then
			slot1 = false
		else
			slot1 = true
		end
	end

	setActive(slot0:findTF("disable", slot0._chatActBtn), not slot1)

	if slot1 then
		slot0:clearChat()
	end

	slot0._chatBg:GetComponent(typeof(Button)).enabled = not slot1
	slot0._chatBtn:GetComponent(typeof(Button)).enabled = not slot1

	return
end

function slot0.capture(slot0)
	slot0.bannerSnap:AlignScreen()
	setActive(slot0._bg, false)
	setActive(slot0._paintingTF, false)

	return
end

return slot0
