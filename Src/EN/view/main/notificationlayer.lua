slot0 = class("NotificationLayer", import("..base.BaseUI"))
slot0.InitCount = 10
slot0.MaxCount = 100
slot0.FORM_COMMON = 0
slot0.FORM_BATTLE = 1
slot0.ChannelBits = {
	send = ChatConst.ChannelWorld,
	recv = IndexConst.Flags2Bits({
		ChatConst.ChannelAll
	})
}

function slot0.getUIName(slot0)
	return "NotificationUI"
end

function slot0.getGroupName(slot0)
	return "group_NotificationUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setInGuild(slot0, slot1)
	slot0.inGuild = slot1
end

function slot0.setMessages(slot0, slot1)
	slot0.messages = slot1
end

function slot0.init(slot0)
	slot0.close = slot0:findTF("close")
	slot0.frame = slot0:findTF("frame")
	slot0.contain = slot0.frame:Find("contain")
	slot1 = slot0.contain:Find("list")
	slot0.content = slot1:Find("content")
	slot0.prefabSelf = slot1:Find("popo_self").gameObject
	slot0.prefabOthers = slot1:Find("popo_other").gameObject
	slot0.prefabPublic = slot1:Find("popo_public").gameObject
	slot0.input = slot0.frame:Find("inputbg/input"):GetComponent("InputField")
	slot0.send = slot0.frame:Find("send")
	slot0.channelSend = slot0.frame:Find("channel_send")
	slot0.channelSendPop = slot0.frame:Find("channel_pop")
	slot0.scroll = slot1:GetComponent("ScrollRect")
	slot0.topMsg = slot0.contain:Find("topmsg")

	SetActive(slot0.topMsg, false)

	slot0.topPublic = slot0:findTF("popo_public", slot0.topMsg)
	slot0.emoji = slot0.frame:Find("inputbg/emoji")
	slot0.changeRoomPanel = slot0:findTF("change_room_Panel")
	slot0.roomSendBtns = slot0:findTF("frame/bg/type_send", slot0.changeRoomPanel)
	slot0.roomRecvBtns = slot0:findTF("frame/bg/type_recv", slot0.changeRoomPanel)
	slot0.enterRoomTip = slot0.frame:Find("enter_room_tip")
	slot0.enterRoomCG = slot0.enterRoomTip:GetComponent(typeof(CanvasGroup))
	slot0.roomBtn = slot0.contain:Find("top/room")
	slot0.typeBtns = slot0.contain:Find("top/type")
	slot0.inputTF = slot0:findTF("frame/bg/InputField", slot0.changeRoomPanel):GetComponent(typeof(InputField))
	slot0.resource = slot0:findTF("resource")
	slot0.typeTpl = slot0:findTF("type_tpl", slot0.resource)
	slot0.normalSprite = slot0:findTF("normal", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.selectedSprite = slot0:findTF("selected", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.bottomChannelTpl = slot0:findTF("channel_tpl", slot0.resource)
	slot0.bottomChannelNormalSprite = slot0:findTF("channel_normal", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.bottomChannelSelectedSprite = slot0:findTF("channel_selected", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.switchTpl = slot0:findTF("switch_tpl", slot0.resource)
	slot0.switchNormalSprite = slot0:findTF("switch_normal", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.switchSelectedSprite = slot0:findTF("switch_selected", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.textSprites = {}
	slot0.textSelectedSprites = {}
	slot0.bottomChannelTextSprites = {}
	slot0.switchTextSprites = {}

	for slot6, slot7 in pairs(slot2) do
		slot8 = ChatConst.GetChannelSprite(slot6)
		slot0.textSprites[slot6] = slot0:findTF("text_" .. slot8, slot0.resource):GetComponent(typeof(Image)).sprite
		slot0.textSelectedSprites[slot6] = slot0:findTF("text_" .. slot8 .. "_selected", slot0.resource):GetComponent(typeof(Image)).sprite
		slot0.switchTextSprites[slot6] = slot0:findTF("text_" .. slot8 .. "_switch", slot0.resource):GetComponent(typeof(Image)).sprite

		if table.contains(ChatConst.SendChannels, slot6) then
			slot0.bottomChannelTextSprites[slot6] = slot0:findTF("channel_" .. slot8, slot0.resource):GetComponent(typeof(Image)).sprite
		end
	end

	slot0.prefabSelf:SetActive(false)
	slot0.prefabOthers:SetActive(false)
	slot0.prefabPublic:SetActive(false)

	slot0.bubbleCards = {}
	slot0.poolBubble = {
		self = {},
		public = {},
		others = {}
	}
end

function slot0.didEnter(slot0)
	slot0.currentForm = slot0.contextData.form
	slot0.escFlag = false

	onButton(slot0, slot0.close, function ()
		if slot0.escFlag then
			return
		end

		slot0.escFlag = true

		LeanTween.moveX(slot0._tf, 700, 0.3):setFrom(slot0._tf.localPosition.x):setEase(LeanTweenType.easeInOutQuad):setUseEstimatedTime(true)
		LeanTween.value(go(slot0._tf), 1, 0, 0.3):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			slot0.alpha = slot0
		end)):setOnComplete(System.Action(function ()
			if slot0.currentForm == slot1.FORM_BATTLE then
				slot0:emit(NotificationMediator.BATTLE_CHAT_CLOSE)
			end

			slot0:emit(BaseUI.ON_CLOSE)
		end))
	end, SFX_CANCEL)
	onButton(slot0, slot0.emoji, function ()
		slot0:displayEmojiPanel()

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.send, function ()
		if slot0.input.text == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("main_notificationLayer_sendButton"))

			return
		end

		slot0.input.text = ""

		slot0:emit(NotificationMediator.ON_SEND_PUBLIC, slot1.ChannelBits.send, slot0)

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.roomBtn, function ()
		slot0:showChangeRoomPanel()

		return
	end, SFX_PANEL)
	onButton(slot0, findTF(slot0.changeRoomPanel, "frame/cancel"), function ()
		slot0:closeChangeRoomPanel()

		return
	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.changeRoomPanel, "frame/confirm"), function ()
		slot0:emit(NotificationMediator.CHANGE_ROOM, tonumber(slot0.inputTF.text))

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0.channelSend, function ()
		setActive(slot0.channelSendPop, not isActive(slot0.channelSendPop))

		if isActive(slot0.channelSendPop) then
			slot0:updateChannelSendPop()
		end

		return
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		if isActive(slot0.channelSendPop) then
			setActive(slot0.channelSendPop, false)
		end

		return
	end)
	pg.DelegateInfo.Add(slot0, slot0.scroll.onValueChanged)
	slot0.scroll.onValueChanged:AddListener(function (slot0)
		if slot0.index > 1 and slot0.y >= 1 then
			slot2 = slot0.scroll.velocity

			for slot8 = slot0.index - 1, math.max(1, slot0.index - slot1.InitCount), -1 do
				slot0:append(slot0.filteredMessages[slot8], 0)
			end

			Canvas.ForceUpdateCanvases()

			slot0.scroll.normalizedPosition = Vector2(0, slot1 / slot0.content.sizeDelta.y)

			slot0.scroll.onValueChanged:Invoke(slot0.scroll.normalizedPosition)

			slot0.scroll.velocity = slot2
			slot0.index = slot3
		end

		return
	end)
	slot0:updateRoom()
	slot0:updateChatChannel()
	slot0:initFilter()
	slot0:updateFilter()
	slot0:updateAll()

	if slot0.currentForm == slot0.FORM_BATTLE then
		slot0._tf:SetParent(slot0.contextData.chatViewParent, true)

		rtf(slot0.frame.transform).offsetMax = Vector2(0, -120)
	else
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
			groupName = slot0:getGroupName()
		})
	end

	LeanTween.moveX(slot0._tf, slot0._tf.localPosition.x, 0.3):setFrom(700):setEase(LeanTweenType.easeInOutQuad):setUseEstimatedTime(true)

	slot1 = slot0._tf:GetComponent(typeof(CanvasGroup))

	LeanTween.value(go(slot0._tf), 0, 1, 0.3):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
		slot0.alpha = slot0

		return
	end))

	rtf(slot0._tf).offsetMax = Vector2(0, 0)
	rtf(slot0._tf).offsetMin = Vector2(0, 0)
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.changeRoomPanel) then
		slot0:closeChangeRoomPanel()
	else
		triggerButton(slot0.close)
	end

	return
end

function slot0.initFilter(slot0)
	slot0.recvTypes = UIItemList.New(slot0.typeBtns, slot0.typeTpl)

	slot0.recvTypes:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setImageSprite(slot2:Find("text"), slot1.textSprites[slot0[slot1 + 1]], true)
			setImageSprite(slot2:Find("text_selected"), slot1.textSelectedSprites[slot0[slot1 + 1]], true)
			onButton(slot1, slot2, function ()
				slot2.ChannelBits.recv = IndexConst.ToggleBits(slot2.ChannelBits.recv, _.filter(_.filter, function (slot0)
					return slot0 ~= ChatConst.ChannelGuild or slot0.inGuild
				end), ChatConst.ChannelAll, )

				slot2.ChannelBits:updateFilter()
				slot2.ChannelBits.updateFilter:updateAll()

				return
			end, SFX_UI_TAG)
		end

		return
	end)
	slot0.recvTypes:align(#ChatConst.RecvChannels)

	return
end

function slot0.updateFilter(slot0)
	slot1 = ChatConst.RecvChannels

	slot0.recvTypes:each(function (slot0, slot1)
		if slot0[slot0 + 1] == ChatConst.ChannelGuild and not slot1.inGuild then
			setButtonEnabled(slot1, false)
		end

		if bit.band(slot2.ChannelBits.recv, bit.lshift(1, slot2)) > 0 then
			setImageSprite(slot1, slot1.selectedSprite)
			setActive(slot1:Find("text_selected"), true)
		else
			setImageSprite(slot1, slot1.normalSprite)
			setActive(slot1:Find("text_selected"), false)
		end

		return
	end)

	slot2 = slot0.ChannelBits.recv
	slot3 = bit.lshift(1, ChatConst.ChannelAll)
	slot0.filteredMessages = _.filter(slot0.messages, function (slot0)
		return slot0 ==  or bit.band(slot0, bit.lshift(1, slot0.type)) > 0
	end)
	slot0.filteredMessages = _.slice(slot0.filteredMessages, #slot0.filteredMessages - slot0.MaxCount + 1, slot0.MaxCount)

	return
end

function slot0.updateChatChannel(slot0)
	setImageSprite(slot0.channelSend:Find("Text"), slot0.bottomChannelTextSprites[slot0.ChannelBits.send], true)

	return
end

function slot0.updateChannelSendPop(slot0)
	slot2 = UIItemList.New(slot0.channelSendPop:Find("type_send"), slot0.bottomChannelTpl)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setImageSprite(slot2:Find("text"), slot1.bottomChannelTextSprites[slot0[slot1 + 1]], true)
			onButton(slot1, slot2, function ()
				setActive(slot0.channelSendPop, false)

				slot1.ChannelBits.send = slot2

				slot3()
				slot3:updateChatChannel()

				return
			end, SFX_UI_TAG)
		end

		return
	end)
	slot2:align(#ChatConst.SendChannels)
	function ()
		slot0:each(function (slot0, slot1)
			if slot0[slot0 + 1] == ChatConst.ChannelGuild and not slot1.inGuild then
				setButtonEnabled(slot1, false)
			end

			if slot2.ChannelBits.send == slot2 then
				setImageSprite(slot1:Find("bottom"), slot1.bottomChannelSelectedSprite, true)
			else
				setImageSprite(slot1:Find("bottom"), slot1.bottomChannelNormalSprite, true)
			end

			return
		end)

		return
	end()

	return
end

function slot0.updateRoom(slot0)
	setText(slot0.enterRoomTip:Find("text"), i18n("main_notificationLayer_enter_room", (slot0.player.chatRoomId == 0 and "") or slot0.player.chatRoomId))
	setText(slot0:findTF("Text", slot0.roomBtn), (slot0.player.chatRoomId == 0 and i18n("common_not_enter_room")) or slot0.player.chatRoomId)
	slot0:showEnterRommTip()

	return
end

function slot0.showChangeRoomPanel(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	pg.UIMgr.GetInstance():BlurPanel(slot0.changeRoomPanel)

	slot0.inputTF.text = tostring(slot0.player.chatRoomId)
	slot0.tempRoomSendBits = slot0.ChannelBits.send
	slot2 = UIItemList.New(slot0.roomSendBtns, slot0.switchTpl)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setImageSprite(slot2:Find("text"), slot1.switchTextSprites[slot0[slot1 + 1]], true)
			onButton(slot1, slot2, function ()
				slot0.tempRoomSendBits = slot1

				slot2()

				return
			end, SFX_UI_TAG)
		end

		return
	end)
	slot2:align(#ChatConst.SendChannels)
	slot3()

	slot0.tempRoomRecvBits = slot0.ChannelBits.recv
	slot5 = UIItemList.New(slot0.roomRecvBtns, slot0.switchTpl)

	slot5:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setImageSprite(slot2:Find("text"), slot1.switchTextSprites[slot0[slot1 + 1]], true)
			onButton(slot1, slot2, function ()
				_.filter.tempRoomRecvBits = IndexConst.ToggleBits(slot1.tempRoomRecvBits, _.filter(_.filter, function (slot0)
					return slot0 ~= ChatConst.ChannelGuild or slot0.inGuild
				end), ChatConst.ChannelAll, IndexConst.ToggleBits)

				slot1.tempRoomRecvBits()

				return
			end, SFX_UI_TAG)
		end

		return
	end)
	slot5:align(#ChatConst.RecvChannels)
	slot6()
	setActive(slot0.changeRoomPanel, true)

	return
end

function slot0.closeChangeRoomPanel(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.changeRoomPanel, slot0._tf)

	if slot0.currentForm == slot0.FORM_BATTLE then
		slot0._tf:SetParent(slot0.contextData.chatViewParent, true)

		rtf(slot0.frame.transform).offsetMax = Vector2(0, -120)
	else
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	end

	setActive(slot0.changeRoomPanel, false)

	return
end

function slot0.removeAllBubble(slot0)
	slot1 = ipairs
	slot2 = slot0.bubbleCards or {}

	for slot4, slot5 in slot1(slot2) do
		setActive(slot5.tf, false)

		slot6 = slot0.poolBubble.others

		if slot5.__cname == "ChatBubblePublic" then
			slot6 = slot0.poolBubble.public
		else
			if slot5.__cname == "ChatBubble" and slot5.data.player and slot5.data.player.id == slot0.player.id then
				slot6 = slot0.poolBubble.self
			end
		end

		slot5:dispose()
		table.insert(slot6, slot5)
	end

	slot0.bubbleCards = {}

	return
end

function slot0.updateAll(slot0)
	slot0:removeAllBubble()

	slot0.index = math.max(1, #slot0.filteredMessages - slot0.InitCount)

	for slot4 = slot0.index, #slot0.filteredMessages, 1 do
		slot0:append(slot0.filteredMessages[slot4], -1)
	end

	scrollToBottom(slot0.content.parent)

	return
end

function slot0.append(slot0, slot1, slot2, slot3)
	if #slot0.filteredMessages >= slot0.MaxCount * 2 then
		slot0:updateFilter()
		slot0:updateAll()
	else
		slot3 = slot3 and slot0.scroll.normalizedPosition.y < 0.1

		if slot1.type == ChatConst.ChannelPublic then
			if slot1.id == 0 then
				slot0:appendTopPublic(slot1)
			else
				slot0:appendPublic(slot1, slot2)
			end
		else
			slot0:appendOthers(slot1, slot2)
		end

		if slot3 then
			scrollToBottom(slot0.content.parent)
		end
	end

	return
end

function slot0.appendOthers(slot0, slot1, slot2)
	slot4 = slot0.poolBubble.others
	slot5 = slot0.prefabOthers

	if slot1.player.id == slot0.player.id then
		slot4 = slot0.poolBubble.self
		slot5 = slot0.prefabSelf
		slot1.isSelf = true
		slot1.player = setmetatable(Clone(slot0.player), {
			__index = slot1.player
		})
	end

	slot6 = nil

	if #slot4 > 0 then
		setActive(slot4[1].tf, true)
		table.remove(slot4, 1)
	else
		slot6 = ChatBubble.New(cloneTplTo(slot5, slot0.content))
	end

	slot6.tf:SetSiblingIndex(slot2)
	table.insert(slot0.bubbleCards, slot6)
	slot6:update(slot1)
	removeOnButton(slot6.headTF)
	onButton(slot0, slot6.headTF, function ()
		slot0:emit(NotificationMediator.OPEN_INFO, slot0.emit, slot0:findTF("circle/head", slot1.tf).position, slot3.content)

		return
	end, SFX_PANEL)

	return
end

function slot0.appendPublic(slot0, slot1, slot2)
	slot4 = nil

	if #slot0.poolBubble.public > 0 then
		setActive(slot3[1].tf, true)
		table.remove(slot3, 1)
	else
		slot4 = ChatBubblePublic.New(cloneTplTo(slot0.prefabPublic, slot0.content))
	end

	slot4.tf:SetSiblingIndex(slot2)
	table.insert(slot0.bubbleCards, slot4)
	slot4:update(slot1)

	return
end

function slot0.appendTopPublic(slot0, slot1)
	if 120 - (pg.TimeMgr.GetInstance():GetServerTime() - slot1.timestamp) <= 0 then
		return
	end

	SetActive(slot0.topMsg, true)
	ChatProxy.InjectPublic(findTF(slot0.topPublic, "text"):GetComponent("RichText"), slot1)

	findTF(slot0.topPublic, "channel"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot1.type))

	if slot0._topTimer then
		slot0._topTimer:Stop()

		slot0._topTimer = nil
	end

	slot0._topTimer = Timer.New(function ()
		SetActive(slot0.topMsg, false)

		SetActive._topTimer = nil

		return
	end, slot2, 1)

	slot0._topTimer:Start()

	return
end

function slot0.showEnterRommTip(slot0)
	if slot0.player.chatRoomId == 0 then
		return
	end

	if not LeanTween.isTweening(go(slot0.enterRoomTip)) then
		LeanTween.value(go(slot0.enterRoomTip), 1, 0, 2):setOnUpdate(System.Action_float(function (slot0)
			slot0.enterRoomCG.alpha = slot0

			return
		end)):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(function ()
			slot0.enterRoomCG.alpha = 0

			LeanTween.cancel(go(slot0.enterRoomTip))

			return
		end)):setDelay(0.5)
	end

	return
end

function slot0.getPos(slot0, slot1)
	return
end

function slot0.displayEmojiPanel(slot0)
	slot0:emit(NotificationMediator.OPEN_EMOJI, function (slot0)
		slot0:emit(NotificationMediator.ON_SEND_PUBLIC, slot1.ChannelBits.send, string.gsub(ChatConst.EmojiCode, "code", slot0))

		return
	end, Vector3(slot0.emoji.position.x, slot0.emoji.position.y, 0))

	return
end

function slot0.willExit(slot0)
	if slot0.currentForm == slot0.FORM_BATTLE then
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	end

	LeanTween.cancel(slot0._go)
	LeanTween.cancel(go(slot0.enterRoomTip))

	if slot0._topTimer then
		slot0._topTimer:Stop()

		slot0._topTimer = nil
	end

	slot1 = ipairs
	slot2 = slot0.bubbleCards or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:dispose()
	end

	for slot4, slot5 in pairs(slot0.poolBubble) do
		for slot9, slot10 in ipairs(slot5) do
			slot10:dispose()
		end
	end

	return
end

return slot0
