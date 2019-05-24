slot0 = class("FriendScene", import("..base.BaseUI"))

function slot1(slot0, slot1)
	function (slot0)
		slot0.parent = slot0
		slot0.context = slot0._tf:Find("window/frame/Text"):GetComponent(typeof(Text))
		slot0.remind = slot0._tf:Find("window/remind")
		slot0.confirmBtn = slot0._tf:Find("window/confirm_btn")
		slot0.cancelBtn = slot0._tf:Find("window/cancel_btn")
		slot0.closeBtn = slot0._tf:Find("window/top/btnBack")
		slot0.checkLabel = slot0.remind:Find("Text"):GetComponent(typeof(Text))

		onButton(nil, slot0.cancelBtn, function ()
			slot0:Hide()
		end, SFX_PANEL)
		onButton(nil, slot0._tf, function ()
			slot0:Hide()
		end, SFX_PANEL)
		onButton(nil, slot0.closeBtn, function ()
			slot0:Hide()
		end, SFX_PANEL)

		slot0.isOn = false

		onToggle(nil, slot0.remind, function (slot0)
			slot0.isOn = slot0
		end, SFX_PANEL)
		onButton(nil, slot0.confirmBtn, function ()
			if slot0.func then
				slot0.func(slot0.isOn)
			end

			slot0:Hide()
		end, SFX_PANEL)
	end({
		_tf = slot0,
		Show = function (slot0, slot1, slot2, slot3)
			pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

			slot0.func = slot3
			slot0.context.text = slot1

			triggerToggle(slot0.remind, false)
			setActive(slot0._tf, true)

			slot0.checkLabel.text = slot2
		end,
		Hide = function (slot0)
			pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.parent)
			setActive(slot0._tf, false)

			slot0.func = nil
			slot0.context.text = ""
			slot0.checkLabel.text = ""
		end,
		Dispose = function (slot0)
			slot0:Hide()
			removeOnButton(slot0._tf)
			removeOnButton(slot0.cancelBtn)
		end
	})

	return 
end

function slot0.getUIName(slot0)
	return "FriendUI"
end

slot2 = 1
slot3 = 2
slot4 = 3
slot5 = 4
slot6 = 10

function slot0.getBGM(slot0)
	return "main"
end

function slot0.setFriendVOs(slot0, slot1)
	slot0.friendVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setShipVOs(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setRequests(slot0, slot1)
	slot0.requestVOs = slot1
end

function slot0.setBlackList(slot0, slot1)
	if slot1 then
		slot0.blackVOs = {}
		slot2 = pairs
		slot3 = slot1 or {}

		for slot5, slot6 in slot2(slot3) do
			table.insert(slot0.blackVOs, slot6)
		end
	end
end

function slot0.init(slot0)
	slot0.togglesTF = slot0:findTF("blur_panel/adapt/left_length/frame/tagRoot")
	slot0.addPanel = slot0:findTF("add_panel")
	slot0.requestPanel = slot0:findTF("request_panel")
	slot0.friendPanel = slot0:findTF("friend_panel")
	slot0.blackListPanel = slot0:findTF("blacklist_panel")
	slot0.requestTopTF = slot0:findTF("request_view_top")
	slot0.blacklistTopTF = slot0:findTF("blacklist_view_top")
	slot0.friendTopTF = slot0:findTF("friend_view_top")
	slot0.friendCountTF = slot0:findTF("friend_count/Text", slot0.friendTopTF)
	slot0.friendIndexBtn = slot0:findTF("index_button", slot0.friendTopTF)
	slot0.friendSortBtn = slot0:findTF("sort_button", slot0.friendTopTF)
	slot0.sortImgAsc = slot0:findTF("asc", slot0.friendSortBtn)
	slot0.sortImgDec = slot0:findTF("desc", slot0.friendSortBtn)
	slot0.refuseAllBtn = slot0:findTF("refuse_all_btn", slot0.requestTopTF)
	slot0.searchPanel = slot0:findTF("search_panel", slot0.addPanel)
	slot0.searchBar = slot0:findTF("InputField", slot0.searchPanel)
	slot0.sortPanel = slot0:findTF("friend_sort_panel")
	slot0.nofriendPanel = slot0:findTF("no_friend", slot0.friendPanel)
	slot0.dec = false
	slot0.sortdata = {}
	slot0.toggles = {}

	for slot4 = 1, slot0.togglesTF.childCount, 1 do
		slot0.toggles[slot4] = slot0.togglesTF:GetChild(slot4 - 1)

		onToggle(slot0, slot0.toggles[slot4], function (slot0)
			if slot0 then
				slot0:switchPage(slot0.switchPage)
			end
		end, SFX_PANEL)
	end

	slot0.chatTipContainer = slot0.toggles[1]:Find("count")
	slot0.chatTip = slot0.toggles[1]:Find("count/Text"):GetComponent(typeof(Text))
	slot0._scrllPanel = slot0:findTF("friend_panel/view")
	slot0.bottomPanel = slot0:findTF("bottom")
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():OverlayPanelPB(slot0.bottomPanel, {
		pbList = {
			slot0.bottomPanel
		}
	})
	onButton(slot0, slot0:findTF("blur_panel/adapt/top/back_btn"), function ()
		slot0:emit(slot1.ON_BACK, nil, 0.2)
	end, SOUND_BACK)
	onButton(slot0, slot0.refuseAllBtn, function ()
		slot0:emit(FriendMediator.REFUSE_ALL_REQUEST)
	end, SFX_PANEL)
	onButton(slot0, slot0.friendIndexBtn, function ()
		slot0:openFriendsSortPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0.friendSortBtn, function ()
		slot0.dec = not slot0.dec
		slot0.contextData.sortData = {
			data = slot0.sortdata,
			dec = slot0.dec
		}

		slot0.contextData:sortFriends()
	end, SFX_PANEL)
	onButton(slot0, findTF(slot0.searchPanel, "copy_btn"), function ()
		UniPasteBoard.SetClipBoardString(slot0.playerVO.id)
		pg.TipsMgr:GetInstance():ShowTips(i18n("friend_id_copy_ok"))
	end)
	onButton(slot0, findTF(slot0.searchPanel, "search_btn"), function ()
		if slot0.waitTimer and slot0.waitTimer - slot0 > 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("friend_searchFriend_wait_time", math.ceil(slot0.waitTimer - slot0)))

			return
		end

		slot0.waitTimer = slot0 + slot1

		if not getInputText(slot0.searchBar) or slot1 == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("friend_inpout_key_tip"))

			return
		end

		slot0.keyWord = slot1

		slot0:emit(FriendMediator.SEARCH_FRIEND, 3, slot1)
	end)
	onButton(slot0, findTF(slot0.searchPanel, "refresh_btn"), function ()
		if slot0.waitTimer1 and slot0.waitTimer1 - slot0 > 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("friend_searchFriend_wait_time", math.ceil(slot0.waitTimer1 - slot0)))

			return
		end

		slot0.waitTimer1 = slot0 + slot1

		slot0:emit(FriendMediator.SEARCH_FRIEND, 1, slot0.keyWord)
	end)
	triggerToggle(slot0.toggles[slot0.contextData.initPage or 1], true)
	slot0:updateRequestTip()
end

function slot0.updateRequestTip(slot0)
	setActive(slot0.toggles[3]:Find("tip"), #slot0.requestVOs > 0)
end

function slot0.switchPage(slot0, slot1)
	if slot1 == slot0 and not slot0.isInitFriend then
		slot0:initFriendsPage()
	elseif slot1 == slot1 and not slot0.isInitAdd then
		slot0:emit(FriendMediator.SEARCH_FRIEND, 1)
		slot0:initAddPage()
	elseif slot1 == slot2 and not slot0.isInitRequest then
		slot0:isInitRequestPage()
	elseif slot1 == slot3 and not slot0.isInitBlackList then
		slot0:initBlackList()
	end
end

function slot0.initFriendsPage(slot0)
	slot0.isInitFriend = true
	slot0.friendItems = {}
	slot0.friendRect = slot0.friendPanel:Find("mask/view"):GetComponent("LScrollRect")

	function slot0.friendRect.onInitItem(slot0)
		slot0:onInitFriend(slot0)
	end

	function slot0.friendRect.onUpdateItem(slot0, slot1)
		slot0:onUpdateFriend(slot0, slot1)
	end

	slot0:updateFriendCount()
	slot0:initFriendsSortPanel()
end

function slot0.addFriendVO(slot0, slot1)
	table.insert(slot0.friendVOs, slot1)
	slot0:sortFriends()
	slot0:updateFriendCount()
end

function slot0.updateFriendVO(slot0, slot1)
	for slot5, slot6 in pairs(slot0.friendVOs) do
		if slot6.id == slot1.id then
			slot0.friendVOs[slot5] = slot1

			break
		end
	end

	slot0:sortFriends()
end

function slot0.deleteFriendVO(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.friendVOs) do
		if slot6.id == slot1.id then
			table.remove(slot0.friendVOs, slot5)

			break
		end
	end

	slot0:sortFriends()
	slot0:updateFriendCount()
end

function slot0.updateFriendCount(slot0)
	setText(slot0.friendCountTF, #slot0.friendVOs .. "/" .. MAX_FRIEND_COUNT)
end

slot7 = 1
slot8 = 2
slot9 = 3

function slot0.createFriendItem(slot0, slot1, slot2)
	function slot4(slot0)
		slot0.nameTF.text = slot0.name
		slot0.levelTF.text = "Lv." .. slot0.level
		slot2 = Ship.New({
			configId = slot0.icon
		})

		LoadSpriteAsync("qicon/" .. slot2:getPrefab(), function (slot0)
			slot0.iconTF.sprite = slot0
		end)
		setActive(slot0.iconCommonTF, not slot0.propose)
		setActive(slot0.iconPropTF, slot0.propose)
		slot0.starList:align(slot3)
		onButton(pg.ship_data_statistics[slot0.icon], slot0.resumeBtn, function ()
			slot0:emit(FriendMediator.OPEN_RESUME, slot1.id)
		end, SFX_PANEL)
	end

	if slot0 == slot2 then
		slot3.acceptBtn = slot3.tf:Find("frame/accpet_btn")
		slot3.refuseBtn = slot3.tf:Find("frame/refuse_btn")
		slot3.date = slot3.tf:Find("frame/request_info/date/Text"):GetComponent(typeof(Text))

		function slot3.update(slot0, slot1, slot2, slot3)
			slot0.friendVO = slot1

			slot0(slot1)

			slot1.manifestoTF.text = slot3
			slot1.date.text = pg.TimeMgr.GetInstance():DescTime(slot2)
		end
	elseif slot1 == slot2 then
		slot3.addBtn = slot3.tf:Find("frame/add_btn")

		function slot3.update(slot0, slot1)
			slot0.friendVO = slot1

			slot0(slot1)

			slot1.manifestoTF.text = slot1.manifesto or ""
		end
	elseif slot2 == slot2 then
		slot3.occuptBtn = slot3.tf:Find("frame/btns/occupy_btn")
		slot3.deleteBtn = slot3.tf:Find("frame/btns/delete_btn")
		slot3.backYardBtn = slot3.tf:Find("frame/btns/backyard_btn")
		slot3.chatTip = slot3.tf:Find("frame/btns/occupy_btn/tip")
		slot3.date = slot3.tf:Find("frame/request_info/date"):GetComponent(typeof(Text))
		slot3.online = slot3.tf:Find("frame/request_info/online")

		function slot3.update(slot0, slot1)
			slot0.friendVO = slot1

			slot0(slot1)
			setActive(slot1.chatTip, slot1.unreadCount > 0)

			slot1.manifestoTF.text = slot1.manifesto or ""

			setActive(slot1.online, slot1.online == Friend.ONLINE)
			setActive(slot1.date.gameObject, slot1.online ~= Friend.ONLINE)

			if slot1.online ~= Friend.ONLINE then
				slot1.date.text = getOfflineTimeStamp(slot1.preOnLineTime)
			end
		end
	end

	return slot3
end

function slot0.onInitFriend(slot0, slot1)
	slot2 = slot0:createFriendItem(slot1, slot0)

	onButton(slot0, slot2.occuptBtn, function ()
		slot0:emit(FriendMediator.OPEN_CHATROOM, slot1.friendVO)
	end, SFX_PANEL)
	onButton(slot0, slot2.deleteBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("remove_friend_tip"),
			onYes = function ()
				slot0:emit(FriendMediator.DELETE_FRIEND, slot1.friendVO.id)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot2.backYardBtn, function ()
		slot0:emit(FriendMediator.VISIT_BACKYARD, slot1.friendVO.id)
	end, SFX_PANEL)

	slot0.friendItems[slot1] = slot2
end

function slot0.onUpdateFriend(slot0, slot1, slot2)
	if not slot0.friendItems[slot2] then
		slot0:onInitFriend(slot2)

		slot3 = slot0.friendItems[slot2]
	end

	slot3:update(slot0.friendVOs[slot1 + 1])
end

function slot0.sortFriends(slot0)
	if slot0.contextData.sortData then
		slot0.contextData.sortData.data.func(slot0.friendVOs, slot0.dec)
		setImageSprite(slot0:findTF("icon", slot0.friendIndexBtn), GetSpriteFromAtlas("ui/friendsui_atlas", slot0.contextData.sortData.data.spr), true)
		setActive(slot0.sortImgAsc, slot0.dec)
		setActive(slot0.sortImgDec, not slot0.dec)
	end

	slot0.friendRect:SetTotalCount(#slot0.friendVOs, -1)
	setActive(slot0.nofriendPanel, not slot0.friendVOs or #slot0.friendVOs == 0)
end

function slot0.initFriendsSortPanel(slot0)
	slot2 = slot0:getTpl("tpl", slot1)
	slot0.friendSortCfg = require("view.main.FriendSortCfg")

	for slot6, slot7 in ipairs(slot0.friendSortCfg.SORT_TAG) do
		slot8 = cloneTplTo(slot2, slot1)
		slot9 = slot8:Find("arr")

		setImageSprite(slot8:Find("Image"), GetSpriteFromAtlas("ui/friendsui_atlas", slot7.spr), true)
		onToggle(slot0, slot8, function (slot0)
			if slot0 then
				slot0.sortdata = slot0
				slot0.contextData.sortData = {
					data = slot0.sortdata,
					dec = slot0.dec
				}

				slot0:sortFriends()
				triggerButton(slot0.sortPanel)
			end
		end, SFX_PANEL)

		if slot6 == 1 then
			triggerToggle(slot8, true)
		end
	end

	onButton(slot0, slot0.sortPanel, function ()
		slot0:closeFriendsSortPanel()
	end, SFX_PANEL)
end

function slot0.openFriendsSortPanel(slot0)
	if slot0.contextData.sortData then
		setImageSprite(slot0:findTF("index_button/icon", slot0.sortPanel), GetSpriteFromAtlas("ui/friendsui_atlas", slot0.contextData.sortData.data.spr), true)
	end

	setActive(slot0.sortPanel, true)
end

function slot0.closeFriendsSortPanel(slot0)
	setActive(slot0.sortPanel, false)
end

function slot0.initAddPage(slot0)
	slot0.isInitAdd = true
	slot0.searchFriendVOs = {}
	slot0.searchItems = {}

	setText(slot0:findTF("self_id_bg/Text", slot0.searchPanel), slot0.playerVO.id)

	slot0.addRect = slot0.addPanel:Find("mask/view"):GetComponent("LScrollRect")

	function slot0.addRect.onInitItem(slot0)
		slot0:onInitSearch(slot0)
	end

	function slot0.addRect.onUpdateItem(slot0, slot1)
		slot0:onUpdateSearch(slot0, slot1)
	end
end

function slot0.onInitSearch(slot0, slot1)
	onButton(slot0, slot0:createFriendItem(slot1, slot0).addBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			onNo = true,
			yesText = "text_apply",
			type = MSGBOX_TYPE_INPUT,
			placeholder = i18n("friend_request_msg_placeholder"),
			title = i18n("friend_request_msg_title"),
			onYes = function (slot0)
				slot0:emit(FriendMediator.ADD_FRIEND, slot1.friendVO.id, slot0)
			end
		})
	end, SFX_PANEL)

	slot0.searchItems[slot1] = slot0.createFriendItem(slot1, slot0)
end

function slot0.onUpdateSearch(slot0, slot1, slot2)
	if not slot0.searchItems[slot2] then
		slot0:onInitSearch(slot2)

		slot3 = slot0.searchItems[slot2]
	end

	slot3:update(slot0.searchFriendVOs[slot1 + 1])
end

function slot0.updateSearchResult(slot0, slot1)
	slot0.searchFriendVOs = slot1

	slot0.addRect:SetTotalCount(#slot0.searchFriendVOs, -1)
end

function slot0.isInitRequestPage(slot0)
	slot0.isInitRequest = true
	slot0.requestItems = {}
	slot0.requestRect = slot0.requestPanel:Find("mask/view"):GetComponent("LScrollRect")

	function slot0.requestRect.onInitItem(slot0)
		slot0:onInitRequest(slot0)
	end

	function slot0.requestRect.onUpdateItem(slot0, slot1)
		slot0:onUpdateRequest(slot0, slot1)
	end

	slot0:updateRequestCount()
end

function slot0.deleteRequestVO(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.requestVOs) do
		if slot6.player.id == slot1.player.id then
			table.remove(slot0.requestVOs, slot5)

			break
		end
	end

	slot0:updateRequestCount()
end

function slot0.addRequestVO(slot0, slot1)
	table.insert(slot0.requestVOs, slot1)
	slot0:updateRequestCount()
end

function slot0.updateRequestCount(slot0)
	slot0:updateRequestTip()

	if slot0.isInitRequest then
		slot0.requestRect:SetTotalCount(#slot0.requestVOs, -1)
	end
end

function slot0.onInitRequest(slot0, slot1)
	slot2 = slot0:createFriendItem(slot1, slot0)

	onButton(slot0, slot2.acceptBtn, function ()
		if slot0.friendVO then
			slot1:emit(FriendMediator.ACCEPT_REQUEST, slot0.friendVO.id)
		end
	end, SFX_PANEL)
	onButton(slot0, slot2.refuseBtn, function ()
		if slot0.friendVO then
			if not slot1.refuseMsgBox then
				slot1.refuseMsgBox = slot2(slot1:findTF("request_refuse_panel"), slot1._tf)
			end

			slot1.refuseMsgBox:Show(i18n("refuse_friend"), i18n("refuse_and_add_into_bl"), function (slot0)
				slot0:emit(FriendMediator.REFUSE_REQUEST, slot1.friendVO, slot0)
			end)
		end
	end)

	slot0.requestItems[slot1] = slot2
end

function slot0.onUpdateRequest(slot0, slot1, slot2)
	if not slot0.requestItems[slot2] then
		slot0:onInitRequest(slot2)

		slot3 = slot0.requestItems[slot2]
	end

	slot3:update(slot0.requestVOs[slot1 + 1].player, slot0.requestVOs[slot1 + 1].timestamp, slot0.requestVOs[slot1 + 1].content)
end

function slot0.initBlackList(slot0)
	if slot0.blackVOs == nil then
		slot0:emit(FriendMediator.GET_BLACK_LIST)
	end

	slot0.isInitBlackList = true
	slot0.blackItems = {}
	slot0.blackRect = slot0.blackListPanel:Find("mask/view"):GetComponent("LScrollRect")

	function slot0.blackRect.onInitItem(slot0)
		slot0:initBlackListItem(slot0)
	end

	function slot0.blackRect.onUpdateItem(slot0, slot1)
		slot0:updateBlackListItem(slot0, slot1)
	end

	if slot0.blackVOs then
		slot0:sortBlackList()
	end
end

function slot0.createBlackItem(slot0, slot1)
	return {
		go = slot1,
		tr = tf(slot1),
		name = ()["tr"]:Find("frame/request_info/name_bg/Text"):GetComponent(typeof(Text)),
		manifesto = ()["tr"]:Find("frame/request_content/Text"):GetComponent(typeof(Text)),
		iconTF = ()["tr"]:Find("icon"),
		btn = ()["tr"]:Find("frame/occupy_btn"),
		update = function (slot0, slot1)
			slot0.player = slot1
			slot0.name.text = slot1.name
			slot0.manifesto.text = slot1.manifesto

			updateDrop(slot0.iconTF, {
				type = DROP_TYPE_SHIP,
				id = slot1.icon,
				id = slot1.icon,
				skinId = slot1.skinId
			}, {
				initStar = true
			})
		end
	}
end

function slot0.initBlackListItem(slot0, slot1)
	onButton(slot0, slot0:createBlackItem(slot1).btn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("firend_relieve_blacklist_tip", slot0.player.name),
			onYes = function ()
				slot0:emit(FriendMediator.RELIEVE_BLACKLIST, slot1.player.id)
			end
		})
	end)

	slot0.blackItems[slot1] = slot0.createBlackItem(slot1)
end

function slot0.updateBlackListItem(slot0, slot1, slot2)
	if not slot0.blackItems[slot2] then
		slot0:initBlackListItem(slot2)

		slot3 = slot0.blackItems[slot2]
	end

	slot3:update(slot0.blackVOs[slot1 + 1])
end

function slot0.deleteBlackVO(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.blackVOs) do
		if slot6.id == slot1 then
			table.remove(slot0.blackVOs, slot5)

			break
		end
	end

	slot0:sortBlackList()
end

function slot0.addIntoBlackList(slot0, slot1)
	if not slot0.blackVOs then
		slot0.blackVOs = {}
	end

	if _.any(slot0.blackVOs, function (slot0)
		return slot0.id == slot0.id
	end) then
		return
	end

	table.insert(slot0.blackVOs, slot1)
end

function slot0.sortBlackList(slot0)
	if not slot0.isInitBlackList then
		return
	end

	table.sort(slot0.blackVOs, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.blackRect:SetTotalCount(#slot0.blackVOs, -1)
end

function slot0.updateChatNotification(slot0, slot1)
	setActive(slot0.chatTipContainer, slot1 > 0)

	slot0.chatTip.text = slot1
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.bottomPanel, slot0._tf)

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.refuseMsgBox then
		slot0.refuseMsgBox:Dispose()
	end
end

return slot0
