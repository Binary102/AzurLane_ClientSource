pg = pg or {}
pg.MsgboxMgr = singletonClass("MsgboxMgr")
pg.MsgboxMgr.BUTTON_YELLOW = 1
pg.MsgboxMgr.BUTTON_WHITE = 2
pg.MsgboxMgr.BUTTON_RED = 3
pg.MsgboxMgr.BUTTON_MEDAL = 4
pg.MsgboxMgr.BUTTON_RETREAT = 5
pg.MsgboxMgr.TITLE_GET_ITEMS = "get_items"
pg.MsgboxMgr.TITLE_INFORMATION = "infomation"
pg.MsgboxMgr.TEXT_CANCEL = "text_cancel"
pg.MsgboxMgr.TEXT_CONFIRM = "text_confirm"

function pg.MsgboxMgr.Init(slot0, slot1)
	print("initializing msgbox manager...")
	PoolMgr.GetInstance():GetUI("MsgBox", true, function (slot0)
		slot0._go = slot0

		slot0._go:SetActive(false)

		slot0._tf = slot0._go.transform

		slot0._go.transform:SetParent(slot0.UIMgr:GetInstance().OverlayMain.transform, false)

		slot0._window = slot0._go.transform:Find("window")

		setActive(slot0._window, true)

		slot0._btnContainer = slot0._go.transform:Find("window/button_container")
		slot0._msgPanel = slot0._go.transform:Find("window/content")
		slot0._itemPanel = slot0._go.transform:Find("window/items")
		slot0.itemsText = slot0._go.transform:Find("window/items/Text"):GetComponent(typeof(Text))
		slot0._sigleItemPanel = slot0._go.transform:Find("window/single_item_panel")
		slot0._itemListItemTpl = slot0._go.transform:Find("window/items/scrollview/item")
		slot0._itemListItemContainer = slot0._go.transform:Find("window/items/scrollview/list")
		slot0._top = slot0._tf:Find("window/top")
		slot0._titleList = slot0._top:Find("title_list")
		slot0._closeBtn = slot0._top:Find("btnBack")
		slot0.contentText = slot0._go.transform:Find("window/content"):GetComponent("RichText")
		slot0._res = slot0._go.transform:Find("res")

		slot0.contentText:AddSprite("diamond", slot0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		slot0.contentText:AddSprite("gold", slot0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		slot0.contentText:AddSprite("oil", slot0._res:Find("oil"):GetComponent(typeof(Image)).sprite)

		slot0.singleItemIntro = slot0._tf:Find("window/single_item_panel/name_mode/intro_view/Viewport/intro")
		slot0.singleItemIntroTF = slot0.singleItemIntro:GetComponent("RichText")

		slot0.singleItemIntroTF:AddSprite("diamond", slot0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		slot0.singleItemIntroTF:AddSprite("gold", slot0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		slot0.singleItemIntroTF:AddSprite("oil", slot0._res:Find("oil"):GetComponent(typeof(Image)).sprite)

		slot0._inputPanel = slot0._go.transform:Find("window/input_panel")
		slot0._inputTitle = slot0._inputPanel:Find("label"):GetComponent(typeof(Text))
		slot0._inputTF = slot0._inputPanel:Find("InputField")
		slot0._inputField = slot0._inputTF:GetComponent(typeof(InputField))
		slot0._placeholderTF = slot0._inputTF:Find("Placeholder"):GetComponent(typeof(Text))
		slot0._inputConfirmBtn = slot0._inputPanel:Find("btns/confirm_btn")
		slot0._inputCancelBtn = slot0._inputPanel:Find("btns/cancel_btn")
		slot0._textPics = slot0._go.transform:Find("text")
		slot0._helpPanel = slot0._go.transform:Find("window/help_panel")
		slot0._helpList = slot0._helpPanel.transform:Find("list")
		slot0._helpTpl = slot0._helpPanel.transform:Find("list/help_tpl")
		slot0._sliders = slot0._go.transform:Find("window/sliders")
		slot0._defaultSize = Vector2(670, 390)
		slot0._defaultHelpSize = Vector2(626, 306)
		slot0._discountInfo = slot0._sliders.transform:Find("discountInfo")
		slot0._discountDate = slot0._sliders.transform:Find("discountDate")
		slot0._discount = slot0._sliders.transform:Find("discountInfo/discount")
		slot0._strike = slot0._go.transform:Find("window/strike")
		slot0._scrollTxts = {}
		slot0._countSelect = slot0._sigleItemPanel:Find("count_select")
		slot0._pageUtil = PageUtil.New(slot0._countSelect:Find("left"), slot0._countSelect:Find("right"), slot0._countSelect:Find("max"), slot0._countSelect:Find("value"))
		slot0._countDescTxt = slot0._countSelect:Find("desc_txt")
		slot0.stopRemindInitPos = slot0._tf:Find("window/top/stopRemind").anchoredPosition
		slot0.stopRemindToggle = slot0._tf:Find("window/top/stopRemind"):GetComponent(typeof(Toggle))
		slot0.stopRemindText = tf(slot0.stopRemindToggle.gameObject):Find("Label"):GetComponent(typeof(Text))

		onButton(nil, slot0._inputCancelBtn, function ()
			slot0:hide()
		end, SFX_CANCEL)
		onButton(nil, slot0._closeBtn, function ()
			slot0:hide()
		end, SFX_CANCEL)
		onButton(nil, slot0._inputConfirmBtn, function ()
			if slot0.settings.onYes then
				slot0.settings.onYes(slot0._inputField.text)
			end

			slot0:hide()
		end, SFX_CONFIRM)
		onButton()
	end)
end

function pg.MsgboxMgr.getMsgBoxOb(slot0)
	return slot0._go
end

function pg.MsgboxMgr.ShowMsgBox(slot0, slot1)
	if slot0._go.activeSelf then
		slot0:Clear()
	end

	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, true)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)

	slot0.contentText.alignment = slot0.settings.alignment or TextAnchor.MiddleCenter
	slot0.contentText.fontSize = slot0.settings.fontSize or 25
	slot0.contentText.text = slot0.settings.content or ""

	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.ShowInputBox(slot0, slot1)
	slot0.settings = slot1

	setActive(slot0._btnContainer, false)
	setActive(slot0.stopRemindToggle, false)
	SetActive(slot0._go, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._helpPanel, false)
	setActive(slot0._inputPanel, true)
	SetActive(slot0._discountDate, false)
	SetActive(slot0._strike, false)
	SetActive(slot0._discountInfo, false)
	slot0._inputPanel:SetAsLastSibling()

	slot0._inputTitle.text = slot1.title or ""
	slot0._placeholderTF.text = slot1.placeholder or ""
	slot0._inputField.characterLimit = slot1.limit or 0

	setActive(slot0._inputCancelBtn, not slot1.onNo)
	slot0:updateButton(slot0._inputCancelBtn, slot1.noText or slot0.TEXT_CANCEL)
	slot0:updateButton(slot0._inputConfirmBtn, slot1.yesText or slot0.TEXT_CONFIRM)
	slot0._tf:SetAsLastSibling()
	onButton(nil, slot0._closeBtn, function ()
		slot0:hide()
	end, SFX_CANCEL)
	slot0:Loaded(slot1)
end

function slot2(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._tf:Find("window/single_item_panel/line_mode"), false)
	setActive(slot0._tf:Find("window/single_item_panel/name_mode"), false)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	if slot1.drop then
		slot2, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

	updateDrop(slot0._tf:Find("window/single_item_panel"), slot1.drop)
end

function pg.MsgboxMgr.showSingleItemBox(slot0, slot1)
	rtf(slot0._window).sizeDelta = slot0._defaultSize

	slot0(slot0, slot1)
	setActive(slot0._tf:Find("window/single_item_panel/name_mode"), true)
	SetActive(slot0._tf:Find("window/single_item_panel/name_mode/intro_view/Viewport/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
	setActive(slot0._countDescTxt, SetActive ~= nil)
	SetActive(slot0._tf:Find("window/single_item_panel/name_mode/attrs"), slot1.drop.type == DROP_TYPE_EQUIP)
	setText(slot0._tf:Find("window/single_item_panel/name_mode/name"), HXSet.hxLan(slot1.name or slot1.drop.cfg.name or ""))
	setActive(slot0._tf:Find("window/single_item_panel/detail"), slot1.drop.type == DROP_TYPE_ITEM and slot1.drop.cfg.type == 11)

	if slot6 then
		slot5:GetComponent("RichText"):AddListener(function (slot0, slot1)
			slot1:ShowItemBox({
				items = _.map(slot0.drop.cfg.display_icon, function (slot0)
					return {
						type = slot0[1],
						id = slot0[2]
					}
				end),
				content = i18n("equip_skin_detail_tip"),
				item2Row = true,
				hideNo = true,
				itemFunc = function (slot0)
					slot0:showSingleItemBox({
						drop = slot0,
						onYes = function ()
							slot0:ShowItemBox(slot0)
						end,
						onNo = function ()
							slot0:ShowItemBox(slot0)
						end
					})
				end,
				onYes = function ()
					slot0:showSingleItemBox(slot0)
				end,
				onNo = ()["onYes"]
			})
		end)
	end

	if slot1.content and slot1.content ~= "" then
		slot0.singleItemIntroTF.text = slot1.content
	elseif slot1.drop.type == DROP_TYPE_RESOURCE then
		setTextEN(slot3, slot1.drop.cfg.display)
	elseif slot1.drop.type == DROP_TYPE_ITEM then
		setTextEN(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_FURNITURE then
		setTextEN(slot3, slot1.drop.cfg.describe)
	elseif slot1.drop.type == DROP_TYPE_SHIP then
		setTextEN(slot3, Ship.getWords(slot7, "drop_descrip") or i18n("ship_drop_desc_default"))
	elseif slot1.drop.type == DROP_TYPE_EQUIP then
		for slot10 = 1, 4, 1 do
			slot11 = slot2:GetChild(slot10 - 1)

			setActive(slot11:Find("opend"), slot12)
			setActive(slot11:Find("attrLockTpl"), not slot1.drop.cfg["attribute_" .. slot10])

			if slot1.drop.cfg["attribute_" .. slot10] then
				setText(slot11:Find("opend/type_name"), AttributeType.Type2Name(slot12))
				setText(slot11:Find("opend/value"), slot1.drop.cfg["value_" .. slot10])
			end
		end
	elseif slot1.drop.type == DROP_TYPE_STRATEGY then
		setTextEN(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_SKIN then
		setTextEN(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_EQUIPMENT_SKIN then
		setTextEN(slot3, slot7 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(_.map(slot1.drop.cfg.equip_type, function (slot0)
			return EquipType.Type2Name2(slot0)
		end), ","))
	elseif slot1.drop.type == DROP_TYPE_VITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	end

	if slot1.intro then
		setText(slot3, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		setButtonEnabled(slot7, slot1.enabelYesBtn)
		eachChild(slot0._btnContainer:GetChild(1), function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end)
	end

	if slot1.show_medal then
		slot0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = slot1.show_medal.desc,
			btnType = slot2.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.showNonDropItem(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	SetActive(findTF(slot0._sigleItemPanel, "ship_type"), false)
	SetActive(findTF(slot0._sigleItemPanel, "line_mode"), false)
	SetActive(findTF(slot0._sigleItemPanel, "count_select"), false)
	SetActive(findTF(slot0._sigleItemPanel, "detail"), false)
	setText(slot6, "")
	SetActive(slot7, false)
	SetActive(findTF(slot0._sigleItemPanel, "name_mode/name").parent, true)
	SetActive(slot2, true)
	SetActive(slot5, true)
	setImageSprite(findTF(slot0._sigleItemPanel, "icon_bg/frame"), GetSpriteFromAtlas("weaponframes", "frame" .. (slot1.frame or 1)))
	setText(slot2, slot1.name or "")
	setText(slot5, slot1.content or "")
	SetActive(findTF(slot0._sigleItemPanel, "icon_bg/icon").parent, slot1.sprite)

	if slot1.sprite then
		setImageSprite(slot3, slot1.sprite, false)
	end

	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.showSingleItemBoxWithLine(slot0, slot1)
	slot0(slot0, slot1)
	setActive(slot0._tf:Find("window/single_item_panel/line_mode"), true)
	setText(slot0._tf:Find("window/single_item_panel/line_mode/msg"), slot1.content or "")
	SetActive(slot0._tf:Find("window/single_item_panel/line_mode/line"), not slot1.hideLine)
	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.ShowItemBox(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0.itemsText, slot1.content)

	slot0.itemsText.text = slot1.content or ""

	if slot0.settings.item2Row and table.getCount(slot0.settings.items) > 5 then
		rtf(slot0._itemPanel).sizeDelta = Vector2(670, 400)
		rtf(slot0._window).sizeDelta = Vector2(670, 530)

		setAnchoredPosition(slot0._window, {
			x = 0,
			y = 0
		})
	else
		rtf(slot0._itemPanel).sizeDelta = Vector2(670, 283)
	end

	slot3 = slot0.settings.itemFunc

	for slot7, slot8 in ipairs(slot2) do
		updateDrop(slot9, slot8, {
			anonymous = slot8.anonymous,
			hideName = slot8.hideName
		})

		slot10 = findTF(slot9, "name")

		if not slot8.hideName or (isActive(slot10) and slot8.hideName) then
			slot12 = ScrollTxt.New(slot11, findTF(slot9, "name_mask/name"))

			setActive(slot10, false)
			setActive(slot11, true)
			slot12:setText(getText(slot10))
			table.insert(slot0._scrollTxts, slot12)
		end

		if not slot8.anonymous then
			onButton(nil, slot9, function ()
				if slot0 then
					slot0(slot1)
				end
			end, SFX_UI_CLICK)
		end
	end

	slot0:Loaded(slot1)
end

function pg.MsgboxMgr.ShowHelpWindow(slot0, slot1)
	slot1.hideNo = true
	slot1.hideYes = true

	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._sliders, false)
	setActive(findTF(slot0._helpPanel, "bg"), slot1.helps.helpbg)

	if slot1.helps.helpSize then
		rtf(slot0._helpPanel).sizeDelta = Vector2(slot1.helps.helpSize.x or slot0._defaultHelpSize.x, slot1.helps.helpSize.y or slot0._defaultHelpSize.y)
	end

	if slot1.helps.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)
	end

	if slot1.helps.windowPos then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)

		setAnchoredPosition(slot0._window, {
			x = slot1.helps.windowPos.x or 0,
			y = slot1.helps.windowPos.y or 0
		})
	else
		setAnchoredPosition(slot0._window, {
			x = 0,
			y = 0
		})
	end

	if slot1.helps.disableScroll then
		GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = not slot1.helps.disableScroll

		setAnchoredPosition(findTF(slot0._helpPanel, "list"), {
			x = 0,
			y = 0
		})
		setActive(findTF(slot0._helpPanel, "Scrollbar"), false)
	end

	if slot1.helps.ImageMode then
		setActive(slot0._top, false)
		setActive(findTF(slot0._window, "bg"), false)
	end

	for slot6 = #slot0.settings.helps, slot0._helpList.childCount - 1, 1 do
		Destroy(slot0._helpList:GetChild(slot6))
	end

	for slot6 = slot0._helpList.childCount, #slot2 - 1, 1 do
		cloneTplTo(slot0._helpTpl, slot0._helpList)
	end

	for slot6, slot7 in ipairs(slot2) do
		setActive(slot8, true)
		setText(slot0._helpList:GetChild(slot6 - 1), slot7.info or "")
		setActive(setText, slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		if slot7.icon then
			slot9.transform.localScale = Vector2(slot7.icon.scale or 1, slot7.icon.scale or 1)
			slot10 = slot7.icon.path

			setImageSprite(slot9:GetComponent(typeof(Image)), slot7.icon.scale or 1, true)
			setAnchoredPosition(slot9, {
				x = (slot7.icon.posX and slot7.icon.posX) or 0,
				y = (slot7.icon.posY and slot7.icon.posY) or 0
			})
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1

	if slot1.helps.pageMode then
		slot0:switchHelpPage(slot0.helpPage)

		if #slot2 > 1 then
			slot0:createBtn({
				text = "text_prepage",
				noQuit = true,
				btnType = slot0.BUTTON_WHITE,
				onCallback = function ()
					slot0:prePage()
				end,
				sound = SFX_CANCEL,
				scale = {
					x = 1.2,
					y = 1.2
				}
			})
			slot0:createBtn({
				text = "text_nextpage",
				noQuit = true,
				btnType = slot0.BUTTON_YELLOW,
				onCallback = function ()
					slot0:nextPage()
				end,
				sound = SFX_CONFIRM,
				scale = {
					x = 1.2,
					y = 1.2
				}
			})
		else
			slot0:createBtn({
				text = "text_iknow",
				btnType = slot0.BUTTON_YELLOW,
				sound = SFX_CANCEL
			})
		end
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function pg.MsgboxMgr.nextPage(slot0)
	slot0.helpPage = slot0.helpPage + 1

	if slot0.helpPage < 1 then
		slot0.helpPage = 1
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = 1
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function pg.MsgboxMgr.prePage(slot0)
	slot0.helpPage = slot0.helpPage - 1

	if slot0.helpPage < 1 then
		slot0.helpPage = slot0._helpList.childCount
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = slot0._helpList.childCount
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function pg.MsgboxMgr.switchHelpPage(slot0, slot1)
	for slot5 = 1, slot0._helpList.childCount, 1 do
		setActive(slot0._helpList:GetChild(slot5 - 1), slot1 == slot5)
	end
end

function pg.MsgboxMgr.commonSetting(slot0, slot1)
	setActive(slot0._btnContainer, true)

	slot0.stopRemindToggle.isOn = false

	setActive(go(slot0.stopRemindToggle), slot1.showStopRamind)

	tf(go(slot0.stopRemindToggle)).anchoredPosition = slot1.showStopRamindPos or slot0.stopRemindInitPos
	slot0.stopRemindText.text = slot1.stopRamindContent or i18n("dont_remind_today")

	slot0:Enter(slot1)
	removeAllChildren(slot0._btnContainer)

	slot0.settings = slot1

	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot3 = slot0.settings.numUpdate

	setActive(slot0._countSelect, slot0.settings.needCounter or false)
	slot0._pageUtil:setNumUpdate(function (slot0)
		if slot0 ~= nil then
			slot0(slot1._countDescTxt, slot0)
		end
	end)
	slot0._pageUtil:setAddNum(slot0.settings.addNum or 1)
	slot0._pageUtil:setMaxNum(slot0.settings.maxNum or -1)
	slot0._pageUtil:setDefaultNum(slot0.settings.defaultNum or 1)

	if slot0.settings.discount ~= nil then
		slot0._discount:GetComponent(typeof(Text)).text = slot0.settings.discount.discount .. "%OFF"
		slot0._discountDate:GetComponent(typeof(Text)).text = slot0.settings.discount.date

		SetActive(slot0._discountDate, true)
		SetActive(slot0._strike, true)
		SetActive(slot0._discountInfo, true)
	else
		SetActive(slot0._discountDate, false)
		SetActive(slot0._strike, false)
		SetActive(slot0._discountInfo, false)
	end

	slot7 = slot0.settings.hideNo or false
	slot8 = slot0.settings.hideYes or false
	slot9 = slot0.settings.modal or false
	slot10 = slot0.settings.onNo or function ()
		return
	end

	if not slot9 then
		onButton(nil, slot0._go, function ()
			if slot0.settings.onClose then
				slot0.settings.onClose()
			else
				slot1()
			end

			slot0:hide()
		end, SFX_CANCEL)
	else
		removeOnButton(slot0._go)
	end

	if not slot7 then
		slot0:createBtn({
			text = slot0.settings.noText or slot0.TEXT_CANCEL,
			btnType = slot0.settings.noBtnType or slot0.BUTTON_WHITE,
			onCallback = slot10,
			sound = slot1.noSound or SFX_CANCEL
		})
	end

	if not slot8 then
		slot11 = {}

		slot0:createBtn({
			text = slot0.settings.yesText or slot0.TEXT_CONFIRM,
			btnType = slot0.settings.yesBtnType or slot0.BUTTON_YELLOW,
			onCallback = slot0.settings.onYes or function ()
				return
			end,
			sound = slot1.yesSound or SFX_CONFIRM
		})
	end

	if slot0.settings.custom ~= nil then
		for slot14, slot15 in ipairs(slot0.settings.custom) do
			slot0:createBtn(slot15)
		end
	end

	setActive(slot0._closeBtn, not slot1.hideClose)
	onButton(nil, slot0._closeBtn, function ()
		slot0:hide()

		if slot0.settings.onClose then
			slot0()
		else
			slot1()
		end
	end, SFX_CANCEL)

	slot11 = slot0.settings.title or slot0.TITLE_INFORMATION
	slot12 = 0
	slot13 = slot0._titleList.transform.childCount

	while slot12 < slot13 do
		SetActive(slot0._titleList.transform:GetChild(slot12), slot0._titleList.transform:GetChild(slot12).name == slot11)

		slot12 = slot12 + 1
	end

	slot0._go.transform.localPosition = Vector3(slot0._go.transform.localPosition.x, slot0._go.transform.localPosition.y, slot0.settings.zIndex or -2)

	if slot0._helpPanel then
		setActive(slot0._helpPanel, slot0.settings.helps)
	end

	if slot0._sliders then
		setActive(slot0._sliders, true)
	end
end

function pg.MsgboxMgr.createBtn(slot0, slot1)
	slot2 = slot1.btnType or slot0.BUTTON_YELLOW
	slot3 = slot1.onCallback or function ()
		return
	end
	slot4 = slot1.noQuit
	slot6 = cloneTplTo(slot5, slot0._btnContainer)

	if slot1.label then
		go(slot6).name = slot1.label
	end

	SetActive(slot6, true)

	if slot1.scale then
		slot6.localScale = Vector2(slot1.scale.x or 1, slot1.scale.y or 1)
	end

	if slot2 ~= slot0.BUTTON_RETREAT then
		slot0:updateButton(slot6, slot1.text)
	end

	if not slot1.hideEvent then
		onButton(nil, slot6, function ()
			if not slot0 then
				SetActive(slot1._go, false)
				slot1._go:Clear()
			end

			slot2()
		end, slot1.sound or SFX_CONFIRM)
	end

	if slot1.sibling then
		slot6:SetSiblingIndex(slot1.sibling)
	end
end

function pg.MsgboxMgr.updateButton(slot0, slot1, slot2)
	slot3 = slot1:Find("text")
	slot4 = slot1:Find("pic")
	slot5 = nil

	if not IsNil(slot0._textPics:Find(slot2)) then
		slot5 = getImageSprite(slot6)
	end

	if slot5 then
		setActive(slot4, true)
		setActive(slot3, false)
		setImageSprite(slot4, slot5, true)
	else
		setActive(slot4, false)
		setActive(slot3, true)

		if i18n(slot2) == i18n_not_find(slot2) then
			slot7 = slot2
		end

		setText(slot3, slot7)
	end
end

function pg.MsgboxMgr.Enter(slot0, slot1)
	if defaultValue(slot1.sendGuideMsg, true) then
		slot0.GuideMgr2:GetInstance():dispatch({
			event = "MsgboxUI",
			viewComponent = "MsgboxUI",
			isView = true
		})
	end
end

function pg.MsgboxMgr.Loaded(slot0, slot1)
	if defaultValue(slot1.sendGuideMsg, true) then
		slot0.GuideMgr2:GetInstance():dispatchLoaded({
			viewComponent = "MsgboxUI"
		})

		if slot1.parent then
			setParent(slot0._tf, slot1.parent)
		else
			slot0.UIMgr.GetInstance():BlurPanel(slot0._tf)
		end
	end
end

function pg.MsgboxMgr.Clear(slot0)
	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})

	GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = true

	setActive(slot0._top, true)
	setActive(findTF(slot0._window, "bg"), true)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	for slot5 = 0, slot0._helpList.childCount - 1, 1 do
		slot0._helpList:GetChild(slot5):Find("icon"):GetComponent(typeof(Image)).sprite = nil
	end

	for slot5 = #slot0._scrollTxts, 1, -1 do
		if slot0._scrollTxts[slot5] then
			slot0._scrollTxts[slot5]:destroy()
			table.remove(slot0._scrollTxts, slot5)
		end
	end

	removeOnButton(slot0._go)

	for slot6 = 1, slot0._btnContainer.childCount, 1 do
		removeOnButton(slot7)
		Destroy(slot0._btnContainer:GetChild(0))
	end

	if slot0.settings and slot0.settings.parent then
		setParent(slot0._tf, slot0.UIMgr.GetInstance().OverlayMain, false)
	else
		slot0.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.UIMgr.GetInstance().OverlayMain)
	end

	if slot0.contentText then
		slot0.contentText:RemoveAllListeners()
	end

	slot0.settings = nil
end

function pg.MsgboxMgr.hide(slot0)
	slot0._go:SetActive(false)
	slot0:Clear()
end

return
