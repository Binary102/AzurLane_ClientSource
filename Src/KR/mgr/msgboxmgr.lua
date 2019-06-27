pg = pg or {}
slot0 = pg
slot1 = singletonClass
slot2 = "MsgboxMgr"
slot1 = slot1(slot2)
slot0.MsgboxMgr = slot1
slot1 = slot0.MsgboxMgr
slot2 = 1
slot1.BUTTON_BLUE = slot2
slot2 = 2
slot1.BUTTON_GRAY = slot2
slot2 = 3
slot1.BUTTON_RED = slot2
slot2 = 4
slot1.BUTTON_MEDAL = slot2
slot2 = 5
slot1.BUTTON_RETREAT = slot2
slot2 = 6
slot1.BUTTON_PREPAGE = slot2
slot2 = 7
slot1.BUTTON_NEXTPAGE = slot2
slot2 = "get_items"
slot1.TITLE_GET_ITEMS = slot2
slot2 = "infomation"
slot1.TITLE_INFORMATION = slot2
slot2 = "text_cancel"
slot1.TEXT_CANCEL = slot2
slot2 = "text_confirm"
slot1.TEXT_CONFIRM = slot2
slot2 = 1
MSGBOX_TYPE_NORMAL = slot2
slot2 = 2
MSGBOX_TYPE_INPUT = slot2
slot2 = 3
MSGBOX_TYPE_SINGLE_ITEM = slot2
slot2 = 4
MSGBOX_TYPE_EXCHANGE = slot2
slot2 = 5
MSGBOX_TYPE_DROP_ITEM = slot2
slot2 = 6
MSGBOX_TYPE_ITEM_BOX = slot2
slot2 = 7
MSGBOX_TYPE_HELP = slot2
slot2 = 8
MSGBOX_TYPE_SECONDPWD = slot2
slot2 = false
slot1.enable = slot2

function slot2(slot0, slot1)
	slot2 = print
	slot3 = "initializing msgbox manager..."

	slot2(slot3)

	slot2 = PoolMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetUI
	slot4 = "MsgBox"
	slot5 = true

	function slot6(slot0)
		slot1 = slot0
		slot1._go = slot0
		slot1 = slot0
		slot1 = slot1._go
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = slot0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot1._tf = slot2
		slot1 = slot1
		slot1 = slot1.UIMgr
		slot2 = slot1
		slot1 = slot1.GetInstance
		slot1 = slot1(slot2)
		slot1 = slot1.OverlayMain
		slot2 = slot0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot3 = slot2
		slot2 = slot2.SetParent
		slot4 = slot1.transform
		slot5 = false

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window"
		slot3 = slot3(slot4, slot5)
		slot2._window = slot3
		slot2 = setActive
		slot3 = slot0
		slot3 = slot3._window
		slot4 = true

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/button_container"
		slot3 = slot3(slot4, slot5)
		slot2._btnContainer = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/content"
		slot3 = slot3(slot4, slot5)
		slot2._msgPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items"
		slot3 = slot3(slot4, slot5)
		slot2._itemPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items/Text"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2.itemsText = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/single_item_panel"
		slot3 = slot3(slot4, slot5)
		slot2._sigleItemPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/exchange_ship_panel"
		slot3 = slot3(slot4, slot5)
		slot2._exchangeShipPanel = slot3
		slot2 = slot0
		slot3 = findTF
		slot4 = slot0
		slot4 = slot4._sigleItemPanel
		slot5 = "ship_type"
		slot3 = slot3(slot4, slot5)
		slot2._SingleItemshipTypeTF = slot3
		slot2 = slot0
		slot3 = findTF
		slot4 = slot0
		slot4 = slot4._sigleItemPanel
		slot5 = "ship_type_bg"
		slot3 = slot3(slot4, slot5)
		slot2._SingleItemshipTypeBgTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items/scrollview/item"
		slot3 = slot3(slot4, slot5)
		slot2._itemListItemTpl = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items/scrollview/list"
		slot3 = slot3(slot4, slot5)
		slot2._itemListItemContainer = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/top"
		slot3 = slot3(slot4, slot5)
		slot2._top = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._top
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "bg"
		slot3 = slot3(slot4, slot5)
		slot2._titleList = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._top
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btnBack"
		slot3 = slot3(slot4, slot5)
		slot2._closeBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/content"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = "RichText"
		slot3 = slot3(slot4, slot5)
		slot2.contentText = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "res"
		slot3 = slot3(slot4, slot5)
		slot2._res = slot3
		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "diamond"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "diamond"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "gold"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "gold"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "oil"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "oil"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/single_item_panel/name_mode/intro_view/Viewport/intro"
		slot3 = slot3(slot4, slot5)
		slot2.singleItemIntro = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.singleItemIntro
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = "RichText"
		slot3 = slot3(slot4, slot5)
		slot2.singleItemIntroTF = slot3
		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "diamond"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "diamond"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "gold"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "gold"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "oil"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "oil"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/input_panel"
		slot3 = slot3(slot4, slot5)
		slot2._inputPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "label"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._inputTitle = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "InputField"
		slot3 = slot3(slot4, slot5)
		slot2._inputTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputTF
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = InputField
		slot3 = slot3(slot4, slot5(slot6))
		slot2._inputField = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputTF
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Placeholder"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._placeholderTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btns/confirm_btn"
		slot3 = slot3(slot4, slot5)
		slot2._inputConfirmBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btns/cancel_btn"
		slot3 = slot3(slot4, slot5)
		slot2._inputCancelBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "text"
		slot3 = slot3(slot4, slot5)
		slot2._textPics = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/help_panel"
		slot3 = slot3(slot4, slot5)
		slot2._helpPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "bg_help"
		slot3 = slot3(slot4, slot5)
		slot2._helpBgTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "list"
		slot3 = slot3(slot4, slot5)
		slot2._helpList = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "list/help_tpl"
		slot3 = slot3(slot4, slot5)
		slot2._helpTpl = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/sliders"
		slot3 = slot3(slot4, slot5)
		slot2._sliders = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 930
		slot5 = 620
		slot3 = slot3(slot4, slot5)
		slot2._defaultSize = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 870
		slot5 = 480
		slot3 = slot3(slot4, slot5)
		slot2._defaultHelpSize = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 0
		slot5 = -40
		slot3 = slot3(slot4, slot5)
		slot2._defaultHelpPos = slot3
		slot2 = rtf
		slot3 = slot0
		slot3 = slot3._window
		slot2 = slot2(slot3)
		slot3 = slot0
		slot3 = slot3._defaultSize
		slot2.sizeDelta = slot3
		slot2 = rtf
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot2 = slot2(slot3)
		slot3 = slot0
		slot3 = slot3._defaultHelpSize
		slot2.sizeDelta = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountInfo"
		slot3 = slot3(slot4, slot5)
		slot2._discountInfo = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountDate"
		slot3 = slot3(slot4, slot5)
		slot2._discountDate = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountInfo/discount"
		slot3 = slot3(slot4, slot5)
		slot2._discount = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/strike"
		slot3 = slot3(slot4, slot5)
		slot2._strike = slot3
		slot2 = slot0
		slot3 = {}
		slot2._scrollTxts = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sigleItemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "count_select"
		slot3 = slot3(slot4, slot5)
		slot2._countSelect = slot3
		slot2 = slot0
		slot3 = PageUtil
		slot3 = slot3.New
		slot4 = slot0
		slot4 = slot4._countSelect
		slot5 = slot4
		slot4 = slot4.Find
		slot6 = "value_bg/left"
		slot4 = slot4(slot5, slot6)
		slot5 = slot0
		slot5 = slot5._countSelect
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "value_bg/right"
		slot5 = slot5(slot6, slot7)
		slot6 = slot0
		slot6 = slot6._countSelect
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "max"
		slot6 = slot6(slot7, slot8)
		slot7 = slot0
		slot7 = slot7._countSelect
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "value_bg/value"
		slot3 = slot3(slot4, slot5, slot6, slot7(slot8, slot9))
		slot2._pageUtil = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._countSelect
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "desc_txt"
		slot3 = slot3(slot4, slot5)
		slot2._countDescTxt = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/stopRemind"
		slot3 = slot3(slot4, slot5)
		slot3 = slot3.anchoredPosition
		slot2.stopRemindInitPos = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/stopRemind"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Toggle
		slot3 = slot3(slot4, slot5(slot6))
		slot2.stopRemindToggle = slot3
		slot2 = slot0
		slot3 = tf
		slot4 = slot0
		slot4 = slot4.stopRemindToggle
		slot4 = slot4.gameObject
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Label"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2.stopRemindText = slot3
		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._inputCancelBtn

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._closeBtn

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._inputConfirmBtn

		function slot5()
			slot0 = slot0
			slot0 = slot0.settings
			slot0 = slot0.onYes

			if slot0 then
				slot0 = slot0
				slot0 = slot0.settings
				slot0 = slot0.onYes
				slot1 = slot0
				slot1 = slot1._inputField
				slot1 = slot1.text

				slot0(slot1)
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CONFIRM

		slot2(slot3, slot4, slot5, slot6)

		slot2 = slot0
		slot3 = {}
		slot2.pools = slot3
		slot2 = slot0
		slot3 = {}
		slot2.timers = slot3
		slot2 = slot2

		slot2()
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot1.Init = slot2

function slot2(slot0)
	slot1 = slot0._go

	return slot1
end

slot1.getMsgBoxOb = slot2

function slot2(slot0, slot1)
	slot2 = slot0._go
	slot2 = slot2.activeSelf

	if slot2 then
		slot3 = slot0
		slot2 = slot0.Clear

		slot2(slot3)
	end

	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot2 = rtf
	slot3 = slot0._helpPanel
	slot2 = slot2(slot3)
	slot3 = slot0._defaultHelpSize
	slot2.sizeDelta = slot3
	slot2 = setAnchoredPosition
	slot3 = slot0._window
	slot4 = {
		x = 0,
		y = 0
	}

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0.contentText
	slot3 = slot0.settings
	slot3 = slot3.alignment

	if not slot3 then
		slot3 = TextAnchor
		slot3 = slot3.MiddleCenter
	end

	slot2.alignment = slot3
	slot0.contentText.fontSize = slot0.settings.fontSize or 36
	slot0.contentText.text = slot0.settings.content or ""
	slot3 = slot0
	slot2 = slot0.Loaded
	slot4 = slot1

	slot2(slot3, slot4)
end

function slot3(slot0, slot1)
	slot0.DelegateInfo.New(slot0)

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
	slot2 = setActive
	slot3 = slot0._inputCancelBtn
	slot4 = slot1.onNo
	slot4 = not slot4

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateButton
	slot4 = slot0._inputCancelBtn
	slot5 = slot1.noText

	if not slot5 then
		slot5 = slot1
		slot5 = slot5.TEXT_CANCEL
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.updateButton
	slot4 = slot0._inputConfirmBtn
	slot5 = slot1.yesText

	if not slot5 then
		slot5 = slot1
		slot5 = slot5.TEXT_CONFIRM
	end

	slot2(slot3, slot4, slot5)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.SetAsLastSibling

	slot2(slot3)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0._closeBtn

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hide

		slot0(slot1)
	end

	slot6 = SFX_CANCEL

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot0
	slot2 = slot0.Loaded
	slot4 = slot1

	slot2(slot3, slot4)
end

function slot4(slot0, slot1)
	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._exchangeShipPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel/line_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._exchangeShipPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = updateDrop
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.drop

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "window/exchange_ship_panel/name_mode/intro_view/Viewport/intro"
	slot2 = slot2(slot3, slot4)
	slot3 = SetActive
	slot4 = slot2
	slot5 = slot1.drop
	slot5 = slot5.type
	slot6 = DROP_TYPE_SHIP

	if slot5 ~= slot6 then
		slot5 = slot1.drop
		slot5 = slot5.type
		slot6 = DROP_TYPE_RESOURCE

		if slot5 ~= slot6 then
			slot5 = slot1.drop
			slot5 = slot5.type
			slot6 = DROP_TYPE_ITEM

			if slot5 ~= slot6 then
				slot5 = slot1.drop
				slot5 = slot5.type
				slot6 = DROP_TYPE_FURNITURE

				if slot5 ~= slot6 then
					slot5 = slot1.drop
					slot5 = slot5.type
					slot6 = DROP_TYPE_STRATEGY

					if slot5 ~= slot6 then
						slot3(slot4, slot1.drop.type == DROP_TYPE_SKIN)
						setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
						setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

						slot4 = setText
						slot5 = slot0._tf
						slot6 = slot5
						slot5 = slot5.Find
						slot7 = "window/exchange_ship_panel/name_mode/name"
						slot5 = slot5(slot6, slot7)
						slot6 = HXSet
						slot6 = slot6.hxLan
						slot7 = slot1.name

						if not slot7 then
							slot4(slot5, slot6(slot1.drop.cfg.name or ""))

							slot4 = setText
							slot6 = slot0._tf
							slot5 = slot0._tf.Find
						end
					end
				end
			end
		end
	end

	slot7 = "window/exchange_ship_panel/name_mode/name/name"
	slot5 = slot5(slot6, slot7)
	slot6 = getText
	slot7 = slot0._tf
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = "window/exchange_ship_panel/name_mode/name"

	slot4(slot5, slot6(slot7(slot8, slot9)))

	slot4 = slot0
	slot4 = slot4.ship_data_statistics
	slot5 = slot1.drop
	slot5 = slot5.id
	slot4 = slot4[slot5]
	slot4 = slot4.skin_id
	slot5 = Ship
	slot5 = slot5.getWords
	slot6 = slot4
	slot7 = "drop_descrip"
	slot5 = slot5(slot6, slot7)
	slot6 = setText
	slot7 = slot2

	if not slot5 then
		slot8 = i18n
		slot9 = "ship_drop_desc_default"
		slot8 = slot8(slot9)
	end

	slot6(slot7, slot8)

	slot6 = slot1.intro

	if slot6 then
		slot6 = setText
		slot7 = slot2
		slot8 = slot1.intro

		slot6(slot7, slot8)
	end

	slot6 = slot1.enabelYesBtn

	if slot6 ~= nil then
		slot6 = slot0._btnContainer
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = 1
		slot6 = slot6(slot7, slot8)
		slot7 = setButtonEnabled
		slot8 = slot6
		slot9 = slot1.enabelYesBtn

		slot7(slot8, slot9)

		slot7 = eachChild
		slot8 = slot6

		function slot9(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot7(slot8, slot9)
	end

	slot6 = slot1.show_medal

	if slot6 then
		slot7 = slot0
		slot6 = slot0.createBtn
		slot8 = {
			sibling = 0,
			hideEvent = true
		}
		slot9 = slot1.show_medal
		slot9 = slot9.desc
		slot8.text = slot9
		slot9 = slot1
		slot9 = slot9.BUTTON_MEDAL
		slot8.btnType = slot9
		slot9 = SFX_UI_BUILDING_EXCHANGE
		slot8.sound = slot9

		slot6(slot7, slot8)
	end

	slot7 = slot0
	slot6 = slot0.Loaded
	slot8 = slot1

	slot6(slot7, slot8)
end

function slot5(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0.itemsText, slot1.content)

	slot0.itemsText.text = slot1.content or ""
	slot2 = slot0.settings.items
	slot3 = slot0.settings.itemFunc
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = cloneTplTo
		slot10 = slot0._itemListItemTpl
		slot11 = slot0._itemListItemContainer
		slot9 = slot9(slot10, slot11)
		slot10 = updateDrop
		slot11 = slot9
		slot12 = slot8
		slot13 = {}
		slot14 = slot8.anonymous
		slot13.anonymous = slot14
		slot14 = slot8.hideName
		slot13.hideName = slot14

		slot10(slot11, slot12, slot13)

		slot10 = findTF
		slot11 = slot9
		slot12 = "name"
		slot10 = slot10(slot11, slot12)
		slot11 = slot8.hideName

		if not slot11 then
			slot11 = findTF
			slot12 = slot9
			slot13 = "name_mask"
			slot11 = slot11(slot12, slot13)
			slot12 = setActive
			slot13 = slot10
			slot14 = false

			slot12(slot13, slot14)

			slot12 = setActive
			slot13 = slot11
			slot14 = true

			slot12(slot13, slot14)

			slot12 = ScrollTxt
			slot12 = slot12.New
			slot13 = slot11
			slot14 = findTF
			slot15 = slot9
			slot16 = "name_mask/name"
			slot12 = slot12(slot13, slot14(slot15, slot16))
			slot14 = slot12
			slot13 = slot12.setText
			slot15 = getText
			slot16 = slot10

			slot13(slot14, slot15(slot16))

			slot13 = table
			slot13 = slot13.insert
			slot14 = slot0._scrollTxts
			slot15 = slot12

			slot13(slot14, slot15)
		end

		slot11 = slot8.anonymous

		if not slot11 then
			slot11 = onButton
			slot12 = slot0
			slot13 = slot9

			function slot14()
				slot0 = slot0

				if slot0 then
					slot0 = slot0
					slot1 = slot1

					slot0(slot1)
				end
			end

			slot15 = SFX_UI_CLICK

			slot11(slot12, slot13, slot14, slot15)
		end
	end

	slot5 = slot0
	slot4 = slot0.Loaded
	slot6 = slot1

	slot4(slot5, slot6)
end

function slot6(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	SetActive(slot0._SingleItemshipTypeTF, false)
	SetActive(slot0._SingleItemshipTypeBgTF, false)
	SetActive(findTF(slot0._sigleItemPanel, "line_mode"), false)
	SetActive(findTF(slot0._sigleItemPanel, "count_select"), false)
	SetActive(findTF(slot0._sigleItemPanel, "detail"), false)

	slot2 = findTF(slot0._sigleItemPanel, "name_mode/name")

	setText(slot6, "")
	SetActive(slot7, false)
	SetActive(slot2.parent, true)
	SetActive(slot2, true)
	SetActive(slot5, true)
	setFrame(slot4, slot1.frame or 1)
	setText(slot2, slot1.name or "")
	setText(findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/intro"), slot1.content or "")

	slot8 = SetActive
	slot9 = findTF(slot0._sigleItemPanel, "icon_bg/icon").parent
	slot10 = slot1.sprite

	slot8(slot9, slot10)

	slot8 = slot1.sprite

	if slot8 then
		slot8 = setImageSprite
		slot9 = slot3
		slot10 = slot1.sprite
		slot11 = false

		slot8(slot9, slot10, slot11)
	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

function slot7(slot0, slot1)
	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/line_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot1.drop

	if slot2 then
		slot6, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

	slot2 = updateDrop
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.drop

	slot2(slot3, slot4)

	slot2 = slot1.windowSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "window/single_item_panel/name_mode/attrs"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/name_mode/intro_view/Viewport/intro"
	slot3 = slot3(slot4, slot5)
	slot4 = SetActive
	slot5 = slot3
	slot6 = slot1.drop
	slot6 = slot6.type
	slot7 = DROP_TYPE_SHIP

	if slot6 ~= slot7 then
		slot6 = slot1.drop
		slot6 = slot6.type
		slot7 = DROP_TYPE_RESOURCE

		if slot6 ~= slot7 then
			slot6 = slot1.drop
			slot6 = slot6.type
			slot7 = DROP_TYPE_ITEM

			if slot6 ~= slot7 then
				slot6 = slot1.drop
				slot6 = slot6.type
				slot7 = DROP_TYPE_FURNITURE

				if slot6 ~= slot7 then
					slot6 = slot1.drop
					slot6 = slot6.type
					slot7 = DROP_TYPE_STRATEGY

					if slot6 ~= slot7 then
						slot4(slot5, slot1.drop.type == DROP_TYPE_SKIN)
						setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
						setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

						slot6 = slot0._tf
						slot5 = slot0._tf.Find
						slot7 = "window/single_item_panel/name_mode/name"
						slot5 = slot5(slot6, slot7)
						slot6 = setText
						slot7 = slot5
						slot8 = HXSet
						slot8 = slot8.hxLan
						slot9 = slot1.name

						if not slot9 then
							slot6(slot7, slot8(slot1.drop.cfg.name or ""))

							slot8 = ScrollTxt:changeToScroll(slot5)
							slot7 = ScrollTxt.changeToScroll(slot5).setText
						end
					end
				end
			end
		end
	end

	slot9 = getText
	slot10 = slot5

	slot7(slot8, slot9(slot10))

	slot7 = table
	slot7 = slot7.insert
	slot8 = slot0._scrollTxts
	slot9 = slot6

	slot7(slot8, slot9)

	slot7 = -170
	slot8 = go
	slot9 = slot0._SingleItemshipTypeTF
	slot8 = slot8(slot9)
	slot8 = slot8.activeSelf

	if not slot8 then
		slot7 = -230
	end

	slot9 = setActive
	slot10 = slot0._SingleItemshipTypeBgTF
	slot11 = slot8

	slot9(slot10, slot11)

	slot9 = Vector2
	slot10 = slot7
	slot11 = slot5.localPosition
	slot11 = slot11.y
	slot9 = slot9(slot10, slot11)
	slot5.localPosition = slot9
	slot9 = slot0._tf
	slot10 = slot9
	slot9 = slot9.Find
	slot11 = "window/single_item_panel/detail"
	slot9 = slot9(slot10, slot11)
	slot10 = slot1.drop
	slot10 = slot10.type
	slot11 = DROP_TYPE_ITEM

	if slot10 == slot11 then
		setActive(slot9, slot1.drop.cfg.type == 11)

		if slot1.drop.cfg.type == 11 then
			slot12 = slot9
			slot11 = slot9.GetComponent
			slot13 = "RichText"
			slot11 = slot11(slot12, slot13)
			slot12 = slot11
			slot11 = slot11.AddListener

			function slot13(slot0, slot1)
				slot2 = {}
				slot3 = _
				slot3 = slot3.map
				slot4 = slot0
				slot4 = slot4.drop
				slot4 = slot4.cfg
				slot4 = slot4.display_icon

				function slot5(slot0)
					slot1 = {}
					slot2 = slot0[1]
					slot1.type = slot2
					slot2 = slot0[2]
					slot1.id = slot2

					return slot1
				end

				slot3 = slot3(slot4, slot5)
				slot2.items = slot3
				slot3 = i18n
				slot4 = "equip_skin_detail_tip"
				slot3 = slot3(slot4)
				slot2.content = slot3
				slot3 = true
				slot2.item2Row = slot3
				slot3 = true
				slot2.hideNo = slot3

				function slot3(slot0)
					slot1 = slot0
					slot2 = slot1
					slot3 = {
						drop = slot0
					}

					function slot4()
						slot0 = slot0
						slot1 = slot1
						slot2 = slot2

						slot0(slot1, slot2)
					end

					slot3.onYes = slot4

					function slot4()
						slot0 = slot0
						slot1 = slot1
						slot2 = slot2

						slot0(slot1, slot2)
					end

					slot3.onNo = slot4

					slot1(slot2, slot3)
				end

				slot2.itemFunc = slot3

				function slot3()
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)
				end

				slot2.onYes = slot3
				slot3 = slot2.onYes
				slot2.onNo = slot3
				slot3 = slot3
				slot4 = slot2
				slot5 = slot2

				slot3(slot4, slot5)
			end

			slot11(slot12, slot13)
		end
	end

	slot11 = slot1.content

	if slot11 then
		slot11 = slot1.content

		if slot11 ~= "" then
			slot11 = slot0.singleItemIntroTF
			slot12 = slot1.content
			slot11.text = slot12
		end
	else
		slot11 = slot1.drop
		slot11 = slot11.type
		slot12 = DROP_TYPE_RESOURCE

		if slot11 == slot12 then
			slot11 = setText
			slot12 = slot3
			slot13 = slot1.drop
			slot13 = slot13.cfg
			slot13 = slot13.display

			slot11(slot12, slot13)
		else
			slot11 = slot1.drop
			slot11 = slot11.type
			slot12 = DROP_TYPE_ITEM

			if slot11 == slot12 then
				slot11 = setText
				slot12 = slot3
				slot13 = HXSet
				slot13 = slot13.hxLan
				slot14 = slot1.drop
				slot14 = slot14.cfg
				slot14 = slot14.display

				slot11(slot12, slot13(slot14))
			else
				slot11 = slot1.drop
				slot11 = slot11.type
				slot12 = DROP_TYPE_FURNITURE

				if slot11 == slot12 then
					slot11 = setText
					slot12 = slot3
					slot13 = slot1.drop
					slot13 = slot13.cfg
					slot13 = slot13.describe

					slot11(slot12, slot13)
				else
					slot11 = slot1.drop
					slot11 = slot11.type
					slot12 = DROP_TYPE_SHIP

					if slot11 == slot12 then
						slot11 = slot2
						slot11 = slot11.ship_data_statistics
						slot12 = slot1.drop
						slot12 = slot12.id
						slot11 = slot11[slot12]
						slot11 = slot11.skin_id
						slot12 = Ship
						slot12 = slot12.getWords
						slot13 = slot11
						slot14 = "drop_descrip"
						slot12 = slot12(slot13, slot14)
						slot13 = setText
						slot14 = slot3

						if not slot12 then
							slot15 = i18n
							slot16 = "ship_drop_desc_default"
							slot15 = slot15(slot16)
						end

						slot13(slot14, slot15)
					else
						slot11 = slot1.drop
						slot11 = slot11.type
						slot12 = DROP_TYPE_EQUIP

						if slot11 == slot12 then
							slot11 = 1
							slot12 = 4
							slot13 = 1

							for slot14 = slot11, slot12, slot13 do
								slot16 = slot2
								slot15 = slot2.GetChild
								slot17 = slot14 - 1
								slot15 = slot15(slot16, slot17)
								slot16 = slot1.drop
								slot16 = slot16.cfg
								slot17 = "attribute_"
								slot18 = slot14
								slot17 = slot17 .. slot18
								slot16 = slot16[slot17]
								slot17 = setActive
								slot19 = slot15
								slot18 = slot15.Find
								slot20 = "opend"
								slot18 = slot18(slot19, slot20)
								slot19 = slot16

								slot17(slot18, slot19)

								slot17 = setActive
								slot19 = slot15
								slot18 = slot15.Find
								slot20 = "attrLockTpl"
								slot18 = slot18(slot19, slot20)
								slot19 = not slot16

								slot17(slot18, slot19)

								if slot16 then
									slot17 = setText
									slot19 = slot15
									slot18 = slot15.Find
									slot20 = "opend/type_name"
									slot18 = slot18(slot19, slot20)
									slot19 = AttributeType
									slot19 = slot19.Type2Name
									slot20 = slot16

									slot17(slot18, slot19(slot20))

									slot17 = setText
									slot19 = slot15
									slot18 = slot15.Find
									slot20 = "opend/value"
									slot18 = slot18(slot19, slot20)
									slot19 = slot1.drop
									slot19 = slot19.cfg
									slot20 = "value_"
									slot21 = slot14
									slot20 = slot20 .. slot21
									slot19 = slot19[slot20]

									slot17(slot18, slot19)
								end
							end
						else
							slot11 = slot1.drop
							slot11 = slot11.type
							slot12 = DROP_TYPE_STRATEGY

							if slot11 == slot12 then
								slot11 = setText
								slot12 = slot3
								slot13 = slot1.drop
								slot13 = slot13.cfg
								slot13 = slot13.desc

								slot11(slot12, slot13)
							else
								slot11 = slot1.drop
								slot11 = slot11.type
								slot12 = DROP_TYPE_SKIN

								if slot11 == slot12 then
									slot11 = setText
									slot12 = slot3
									slot13 = slot1.drop
									slot13 = slot13.cfg
									slot13 = slot13.desc

									slot11(slot12, slot13)
								else
									slot11 = slot1.drop
									slot11 = slot11.type
									slot12 = DROP_TYPE_EQUIPMENT_SKIN

									if slot11 == slot12 then
										slot11 = slot1.drop
										slot11 = slot11.cfg
										slot11 = slot11.desc
										slot12 = _
										slot12 = slot12.map
										slot13 = slot1.drop
										slot13 = slot13.cfg
										slot13 = slot13.equip_type

										function slot14(slot0)
											slot1 = EquipType
											slot1 = slot1.Type2Name2
											slot2 = slot0

											return slot1(slot2)
										end

										slot12 = slot12(slot13, slot14)
										slot13 = setText
										slot14 = slot3
										slot15 = slot11
										slot16 = "\n\n"
										slot17 = i18n
										slot18 = "word_fit"
										slot17 = slot17(slot18)
										slot18 = ": "
										slot19 = table
										slot19 = slot19.concat
										slot20 = slot12
										slot21 = ","
										slot19 = slot19(slot20, slot21)
										slot15 = slot15 .. slot16 .. slot17 .. slot18 .. slot19

										slot13(slot14, slot15)
									else
										slot11 = slot1.drop
										slot11 = slot11.type
										slot12 = DROP_TYPE_VITEM

										if slot11 == slot12 then
											slot11 = setText
											slot12 = slot3
											slot13 = HXSet
											slot13 = slot13.hxLan
											slot14 = slot1.drop
											slot14 = slot14.cfg
											slot14 = slot14.display

											slot11(slot12, slot13(slot14))
										else
											slot11 = slot1.drop
											slot11 = slot11.type
											slot12 = DROP_TYPE_WORLD_ITEM

											if slot11 == slot12 then
												slot11 = setText
												slot12 = slot3
												slot13 = HXSet
												slot13 = slot13.hxLan
												slot14 = slot1.drop
												slot14 = slot14.cfg
												slot14 = slot14.display

												slot11(slot12, slot13(slot14))
											else
												slot11 = slot1.drop
												slot11 = slot11.type
												slot12 = DROP_TYPE_ICON_FRAME

												if slot11 == slot12 then
													slot11 = setText
													slot12 = slot3
													slot13 = slot1.drop
													slot13 = slot13.cfg
													slot13 = slot13.desc

													slot11(slot12, slot13)
												else
													slot11 = slot1.drop
													slot11 = slot11.type
													slot12 = DROP_TYPE_CHAT_FRAME

													if slot11 == slot12 then
														slot11 = setText
														slot12 = slot3
														slot13 = slot1.drop
														slot13 = slot13.cfg
														slot13 = slot13.desc

														slot11(slot12, slot13)
													else
														slot11 = slot1.drop
														slot11 = slot11.type
														slot12 = DROP_TYPE_EMOJI

														if slot11 == slot12 then
															slot11 = setText
															slot12 = slot3
															slot13 = slot1.drop
															slot13 = slot13.cfg
															slot13 = slot13.item_desc

															slot11(slot12, slot13)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot11 = slot1.intro

	if slot11 then
		slot11 = setText
		slot12 = slot3
		slot13 = slot1.intro

		slot11(slot12, slot13)
	end

	slot11 = slot1.enabelYesBtn

	if slot11 ~= nil then
		slot11 = slot0._btnContainer
		slot12 = slot11
		slot11 = slot11.GetChild
		slot13 = 1
		slot11 = slot11(slot12, slot13)
		slot12 = setButtonEnabled
		slot13 = slot11
		slot14 = slot1.enabelYesBtn

		slot12(slot13, slot14)

		slot12 = eachChild
		slot13 = slot11

		function slot14(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot12(slot13, slot14)
	end

	slot11 = slot1.show_medal

	if slot11 then
		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {
			sibling = 0,
			hideEvent = true
		}
		slot14 = slot1.show_medal
		slot14 = slot14.desc
		slot13.text = slot14
		slot14 = slot3
		slot14 = slot14.BUTTON_MEDAL
		slot13.btnType = slot14
		slot14 = SFX_UI_BUILDING_EXCHANGE
		slot13.sound = slot14

		slot11(slot12, slot13)
	end

	slot12 = slot0
	slot11 = slot0.Loaded
	slot13 = slot1

	slot11(slot12, slot13)
end

function slot8(slot0, slot1)
	slot2 = true
	slot1.hideNo = slot2
	slot2 = true
	slot1.hideYes = slot2
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._sliders
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._helpPanel
	slot5 = "bg"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.helps
	slot4 = slot4.pageMode
	slot4 = not slot4

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpBgTF
	slot4 = slot1.helps
	slot4 = slot4.pageMode

	slot2(slot3, slot4)

	slot2 = print
	slot3 = slot1.helps
	slot3 = slot3.helpSize

	slot2(slot3)

	slot2 = slot1.helps
	slot2 = slot2.helpSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._helpPanel
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.helpSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultHelpSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.helpSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultHelpSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot1.helps
	slot2 = slot2.helpPos

	if slot2 then
		slot2 = setAnchoredPosition
		slot3 = slot0._helpPanel
		slot4 = {}
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.x

		if not slot5 then
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.x
		end

		slot4.x = slot5
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.y
		end

		slot4.y = slot5

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.windowSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot1.helps
	slot2 = slot2.windowPos

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot2.sizeDelta = slot3(slot4, slot5)

		setAnchoredPosition(slot0._window, {
			x = slot1.helps.windowPos.x or 0,
			y = slot1.helps.windowPos.y or 0
		})
	else
		slot2 = setAnchoredPosition
		slot3 = slot0._window
		slot4 = {
			x = 0,
			y = 0
		}

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.disableScroll

	if slot2 then
		slot2 = GetComponent
		slot3 = slot0._helpPanel
		slot4 = typeof
		slot5 = ScrollRect
		slot2 = slot2(slot3, slot4(slot5))
		slot3 = slot1.helps
		slot3 = slot3.disableScroll
		slot3 = not slot3
		slot2.enabled = slot3
		slot3 = setAnchoredPosition
		slot4 = findTF
		slot5 = slot0._helpPanel
		slot6 = "list"
		slot4 = slot4(slot5, slot6)
		slot5 = {
			x = 0,
			y = 0
		}

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF
		slot5 = slot0._helpPanel
		slot6 = "Scrollbar"
		slot4 = slot4(slot5, slot6)
		slot5 = false

		slot3(slot4, slot5)
	end

	slot2 = slot1.helps
	slot2 = slot2.ImageMode

	if slot2 then
		slot2 = setActive
		slot3 = slot0._top
		slot4 = false

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = findTF
		slot4 = slot0._window
		slot5 = "bg"
		slot3 = slot3(slot4, slot5)
		slot4 = false

		slot2(slot3, slot4)
	end

	slot2 = slot0.settings
	slot2 = slot2.helps
	slot3 = #slot2
	slot4 = slot0._helpList
	slot4 = slot4.childCount
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = Destroy
		slot8 = slot0._helpList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot6

		slot7(slot8(slot9, slot10))
	end

	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = #slot2
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = cloneTplTo
		slot8 = slot0._helpTpl
		slot9 = slot0._helpList

		slot7(slot8, slot9)
	end

	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._helpList:GetChild(slot6 - 1)

		setActive(slot8, true)
		setText(slot8, slot7.info or "")
		setActive(slot9, slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		slot10 = slot7.icon

		if slot10 then
			slot10 = 1
			slot11 = slot1.helps
			slot11 = slot11.ImageMode

			if slot11 then
				slot10 = 1.5
			end

			slot9.transform.localScale = Vector2(slot7.icon.scale or slot10, slot7.icon.scale or slot10)
			slot11 = slot7.icon.path
			slot12 = slot7.icon.posX

			if slot12 then
				slot12 = slot7.icon.posX or -20
				slot13 = slot7.icon.posY

				if slot13 then
					setImageSprite(slot9:GetComponent(typeof(Image)), slot14, true)
					setAnchoredPosition(slot9, {
						x = slot12,
						y = slot7.icon.posY or 0
					})
					setActive(slot9:Find("corner"), slot1.helps.pageMode)
				end
			end
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1
	slot3 = slot1.helps
	slot3 = slot3.pageMode

	if slot3 then
		slot4 = slot0
		slot3 = slot0.switchHelpPage
		slot5 = slot0.helpPage

		slot3(slot4, slot5)
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function slot9(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = tf
	slot3 = slot1.secondaryUI
	slot2 = slot2(slot3)
	slot3 = rtf
	slot4 = slot0._window
	slot3 = slot3(slot4)
	slot4 = Vector2
	slot5 = 960
	slot6 = slot0._defaultSize
	slot6 = slot6.y
	slot4 = slot4(slot5, slot6)
	slot3.sizeDelta = slot4
	slot3 = setActive
	slot4 = slot2
	slot5 = true

	slot3(slot4, slot5)

	slot3 = slot1.mode
	slot4 = getProxy
	slot5 = SecondaryPWDProxy
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.getRawData
	slot5 = slot5(slot6)
	slot7 = slot2
	slot6 = slot2.Find
	slot8 = "showresttime"
	slot6 = slot6(slot7, slot8)
	slot8 = slot2
	slot7 = slot2.Find
	slot9 = "settips"
	slot7 = slot7(slot8, slot9)

	if slot3 == "showresttime" then
		slot8 = setActive
		slot9 = slot6
		slot10 = true

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot7
		slot10 = false

		slot8(slot9, slot10)

		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "desc"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot0.timers
		slot9 = slot9.secondaryUItimer

		if slot9 then
			slot9 = slot0.timers
			slot9 = slot9.secondaryUItimer
			slot10 = slot9
			slot9 = slot9.Stop

			slot9(slot10)
		end

		function slot9()
			slot0 = slot0
			slot0 = slot0.TimeMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot1
			slot1 = slot1.fail_cd

			if slot1 then
				slot1 = slot1
				slot1 = slot1.fail_cd
				slot1 = slot1 - slot0

				if not slot1 then
					slot1 = 0
				end
			end

			slot2 = 0

			if slot1 < slot2 then
				slot1 = 0
			end

			slot2 = math
			slot2 = slot2.floor
			slot3 = slot1 / 86400
			slot2 = slot2(slot3)
			slot3 = 0

			if slot2 > slot3 then
				slot3 = slot2
				slot4 = string
				slot4 = slot4.format
				slot5 = i18n
				slot6 = "tips_fail_secondarypwd_much_times"
				slot5 = slot5(slot6)
				slot6 = slot2
				slot7 = i18n
				slot8 = "word_date"
				slot7 = slot7(slot8)
				slot6 = slot6 .. slot7
				slot4 = slot4(slot5, slot6)
				slot3.text = slot4
			else
				slot3 = math
				slot3 = slot3.floor
				slot4 = slot1 / 3600
				slot3 = slot3(slot4)
				slot4 = 0

				if slot3 > slot4 then
					slot4 = slot2
					slot5 = string
					slot5 = slot5.format
					slot6 = i18n
					slot7 = "tips_fail_secondarypwd_much_times"
					slot6 = slot6(slot7)
					slot7 = slot3
					slot8 = i18n
					slot9 = "word_hour"
					slot8 = slot8(slot9)
					slot7 = slot7 .. slot8
					slot5 = slot5(slot6, slot7)
					slot4.text = slot5
				else
					slot4 = ""
					slot5 = math
					slot5 = slot5.floor
					slot6 = slot1 / 60
					slot5 = slot5(slot6)
					slot6 = 0

					if slot5 > slot6 then
						slot6 = slot4
						slot7 = slot5
						slot8 = i18n
						slot9 = "word_minute"
						slot8 = slot8(slot9)
						slot4 = slot6 .. slot7 .. slot8
					end

					slot6 = math
					slot6 = slot6.max
					slot7 = slot5 * 60
					slot7 = slot1 - slot7
					slot8 = 0
					slot6 = slot6(slot7, slot8)
					slot7 = slot2
					slot8 = string
					slot8 = slot8.format
					slot9 = i18n
					slot10 = "tips_fail_secondarypwd_much_times"
					slot9 = slot9(slot10)
					slot10 = slot4
					slot11 = slot6
					slot12 = i18n
					slot13 = "word_second"
					slot12 = slot12(slot13)
					slot10 = slot10 .. slot11 .. slot12
					slot8 = slot8(slot9, slot10)
					slot7.text = slot8
				end
			end
		end

		slot10 = slot9

		slot10()

		slot10 = Timer
		slot10 = slot10.New
		slot11 = slot9
		slot12 = 1
		slot13 = -1
		slot10 = slot10(slot11, slot12, slot13)
		slot12 = slot10
		slot11 = slot10.Start

		slot11(slot12)

		slot11 = slot0.timers
		slot11.secondaryUItimer = slot10
	elseif slot3 == "settips" then
		slot8 = setActive
		slot9 = slot6
		slot10 = false

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot7
		slot10 = true

		slot8(slot9, slot10)

		slot9 = slot7
		slot8 = slot7.Find
		slot10 = "InputField"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = InputField
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot1.references
		slot9.inputfield = slot8
		slot9 = slot1.references
		slot9 = slot9.lasttext
		slot9 = slot9 or ""
		slot8.text = slot9
		slot9 = 20
		slot10 = slot8.onValueChanged
		slot11 = slot10
		slot10 = slot10.AddListener

		function slot12()
			slot0 = utf8_to_unicode
			slot1 = slot0
			slot1 = slot1.text
			slot0, slot1 = slot0(slot1)
			slot2 = slot1

			if slot2 < slot1 then
				slot2 = slot0
				slot3 = SecondaryPasswordMediator
				slot3 = slot3.ClipUnicodeStr
				slot4 = slot0
				slot4 = slot4.text
				slot5 = slot1
				slot3 = slot3(slot4, slot5)
				slot2.text = slot3
			end

			return
		end

		slot10(slot11, slot12)

		function slot10()
			slot0 = PLATFORM_CODE
			slot1 = PLATFORM_JP

			if slot0 ~= slot1 then
				slot0 = PLATFORM_CODE
				slot1 = PLATFORM_US

				if slot0 == slot1 then
					slot0 = false

					return slot0
				end
			end

			slot0 = slot0
			slot0 = slot0.text
			slot1 = wordVer
			slot2 = slot0
			slot3 = {
				isReplace = true
			}
			slot1, slot2 = slot1(slot2, slot3)
			slot3 = 0

			if slot1 > slot3 or slot2 ~= slot0 then
				slot3 = slot1
				slot3 = slot3.TipsMgr
				slot4 = slot3
				slot3 = slot3.GetInstance
				slot3 = slot3(slot4)
				slot4 = slot3
				slot3 = slot3.ShowTips
				slot5 = i18n
				slot6 = "secondarypassword_illegal_tip"

				slot3(slot4, slot5(slot6))

				slot3 = slot0
				slot3.text = slot2
				slot3 = true

				return slot3
			else
				slot3 = false

				return slot3
			end

			return
		end

		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {}
		slot14 = slot1
		slot14 = slot14.TEXT_CONFIRM
		slot13.text = slot14
		slot14 = slot1
		slot14 = slot14.BUTTON_BLUE
		slot13.btnType = slot14
		slot14 = slot0.settings
		slot14 = slot14.onYes
		slot13.onCallback = slot14
		slot14 = SFX_CONFIRM
		slot13.sound = slot14
		slot13.noQuit = slot10

		slot11(slot12, slot13)

		slot9 = ""
	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

showSecondaryPassword = slot9

function slot9(slot0)
	slot1 = slot0.helpPage
	slot1 = slot1 + 1
	slot0.helpPage = slot1
	slot1 = slot0.helpPage
	slot2 = 1

	if slot1 < slot2 then
		slot1 = 1
		slot0.helpPage = slot1
	end

	slot1 = slot0.helpPage
	slot2 = slot0._helpList
	slot2 = slot2.childCount

	if slot2 < slot1 then
		slot1 = 1
		slot0.helpPage = slot1
	end

	slot2 = slot0
	slot1 = slot0.switchHelpPage
	slot3 = slot0.helpPage

	slot1(slot2, slot3)

	return
end

slot1.nextPage = slot9

function slot9(slot0)
	slot1 = slot0.helpPage
	slot1 = slot1 - 1
	slot0.helpPage = slot1
	slot1 = slot0.helpPage
	slot2 = 1

	if slot1 < slot2 then
		slot1 = slot0._helpList
		slot1 = slot1.childCount
		slot0.helpPage = slot1
	end

	slot1 = slot0.helpPage
	slot2 = slot0._helpList
	slot2 = slot2.childCount

	if slot2 < slot1 then
		slot1 = slot0._helpList
		slot1 = slot1.childCount
		slot0.helpPage = slot1
	end

	slot2 = slot0
	slot1 = slot0.switchHelpPage
	slot3 = slot0.helpPage

	slot1(slot2, slot3)

	return
end

slot1.prePage = slot9

function slot9(slot0, slot1)
	slot2 = 1
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot0._helpList
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5 - 1
		slot6 = slot6(slot7, slot8)
		slot7 = setActive
		slot8 = slot6

		if slot1 ~= slot5 then
			slot9 = false
		else
			slot9 = true
		end

		slot7(slot8, slot9)

		slot7 = setText
		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "icon/corner/Text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot5

		slot7(slot8, slot9)
	end

	return
end

slot1.switchHelpPage = slot9

function slot9(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.DelegateInfo
	slot2 = slot2.New
	slot3 = slot0

	slot2(slot3)

	slot2 = setActive
	slot3 = slot0._exchangeShipPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpBgTF
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._btnContainer
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.stopRemindToggle
	slot3 = false
	slot2.isOn = slot3
	slot2 = setActive
	slot3 = go
	slot4 = slot0.stopRemindToggle
	slot3 = slot3(slot4)
	slot4 = slot1.showStopRemind

	slot2(slot3, slot4)

	slot2 = tf
	slot3 = go
	slot4 = slot0.stopRemindToggle
	slot2 = slot2(slot3(slot4))
	slot3 = slot1.showStopRamindPos

	if not slot3 then
		slot3 = slot0.stopRemindInitPos
	end

	slot2.anchoredPosition = slot3
	slot2 = slot0.stopRemindText
	slot3 = slot1.stopRamindContent

	if not slot3 then
		slot3 = i18n
		slot4 = "dont_remind_today"
		slot3 = slot3(slot4)
	end

	slot2.text = slot3
	slot2 = removeAllChildren
	slot3 = slot0._btnContainer

	slot2(slot3)

	slot0.settings = slot1
	slot2 = SetActive
	slot3 = slot0._go
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.settings
	slot2 = slot2.needCounter

	if not slot2 then
		slot2 = false
	end

	slot3 = slot0.settings
	slot3 = slot3.numUpdate
	slot4 = setActive
	slot5 = slot0._countSelect
	slot6 = slot2

	slot4(slot5, slot6)

	slot4 = slot0.settings
	slot4 = slot4.addNum

	if not slot4 then
		slot4 = 1
	end

	slot5 = slot0.settings
	slot5 = slot5.maxNum

	if not slot5 then
		slot5 = -1
	end

	slot6 = slot0.settings
	slot6 = slot6.defaultNum

	if not slot6 then
		slot6 = 1
	end

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setNumUpdate

	function slot9(slot0)
		slot1 = slot0

		if slot1 ~= nil then
			slot1 = slot0
			slot2 = slot1
			slot2 = slot2._countDescTxt
			slot3 = slot0

			slot1(slot2, slot3)
		end

		return
	end

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setAddNum
	slot9 = slot4

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setMaxNum
	slot9 = slot5

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setDefaultNum
	slot9 = slot6

	slot7(slot8, slot9)

	slot7 = slot0.settings
	slot7 = slot7.discount

	if slot7 ~= nil then
		slot7 = slot0._discount
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Text
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0.settings
		slot8 = slot8.discount
		slot8 = slot8.discount
		slot9 = "%OFF"
		slot8 = slot8 .. slot9
		slot7.text = slot8
		slot7 = slot0._discountDate
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Text
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0.settings
		slot8 = slot8.discount
		slot8 = slot8.date
		slot7.text = slot8
		slot7 = SetActive
		slot8 = slot0._discountDate
		slot9 = true

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._strike
		slot9 = true

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._discountInfo
		slot9 = true

		slot7(slot8, slot9)
	else
		slot7 = SetActive
		slot8 = slot0._discountDate
		slot9 = false

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._strike
		slot9 = false

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._discountInfo
		slot9 = false

		slot7(slot8, slot9)
	end

	slot7 = slot0.settings
	slot7 = slot7.hideNo

	if not slot7 then
		slot7 = false
	end

	slot8 = slot0.settings
	slot8 = slot8.hideYes

	if not slot8 then
		slot8 = false
	end

	slot9 = slot0.settings
	slot9 = slot9.modal

	if not slot9 then
		slot9 = false
	end

	slot10 = slot0.settings
	slot10 = slot10.onNo

	if not slot10 then
		function slot10()
			return
		end
	end

	if not slot9 then
		slot11 = onButton
		slot12 = slot0
		slot13 = slot0._go

		function slot14()
			slot0 = slot0
			slot0 = slot0.settings
			slot0 = slot0.onClose

			if slot0 then
				slot0 = slot0
				slot0 = slot0.settings
				slot0 = slot0.onClose

				slot0()
			else
				slot0 = slot1

				slot0()
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)

			return
		end

		slot15 = SFX_CANCEL

		slot11(slot12, slot13, slot14, slot15)
	else
		slot11 = removeOnButton
		slot12 = slot0._go

		slot11(slot12)
	end

	if not slot7 then
		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {}
		slot14 = slot0.settings
		slot14 = slot14.noText

		if not slot14 then
			slot14 = slot1
			slot14 = slot14.TEXT_CANCEL
		end

		slot13.text = slot14
		slot14 = slot0.settings
		slot14 = slot14.noBtnType

		if not slot14 then
			slot14 = slot1
			slot14 = slot14.BUTTON_GRAY
		end

		slot13.btnType = slot14
		slot13.onCallback = slot10
		slot14 = slot1.noSound

		if not slot14 then
			slot14 = SFX_CANCEL
		end

		slot13.sound = slot14

		slot11(slot12, slot13)
	end

	if not slot8 then
		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {}
		slot14 = slot0.settings
		slot14 = slot14.yesText

		if not slot14 then
			slot14 = slot1
			slot14 = slot14.TEXT_CONFIRM
		end

		slot13.text = slot14
		slot14 = slot0.settings
		slot14 = slot14.yesBtnType

		if not slot14 then
			slot14 = slot1
			slot14 = slot14.BUTTON_BLUE
		end

		slot13.btnType = slot14
		slot14 = slot0.settings
		slot14 = slot14.onYes

		if not slot14 then
			function slot14()
				return
			end
		end

		slot13.onCallback = slot14
		slot14 = slot1.yesSound

		if not slot14 then
			slot14 = SFX_CONFIRM
		end

		slot13.sound = slot14

		slot11(slot12, slot13)
	end

	slot11 = nil
	slot12 = slot0.settings
	slot12 = slot12.type
	slot13 = MSGBOX_TYPE_HELP

	if slot12 == slot13 then
		slot12 = slot0.settings
		slot12 = slot12.helps
		slot12 = slot12.pageMode

		if slot12 then
			slot12 = slot0.settings
			slot12 = slot12.helps
			slot12 = #slot12
			slot13 = 1

			if slot12 > slot13 then
				slot13 = slot0
				slot12 = slot0.createBtn
				slot14 = {
					noQuit = true
				}
				slot15 = slot1
				slot15 = slot15.BUTTON_PREPAGE
				slot14.btnType = slot15

				function slot15()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.prePage

					slot0(slot1)

					return
				end

				slot14.onCallback = slot15
				slot15 = SFX_CANCEL
				slot14.sound = slot15

				slot12(slot13, slot14)

				slot12 = slot0.settings
				slot12 = slot12.helps
				slot11 = #slot12
			end
		end
	end

	slot12 = slot0.settings
	slot12 = slot12.custom

	if slot12 ~= nil then
		slot12 = ipairs
		slot13 = slot0.settings
		slot13 = slot13.custom
		slot12, slot13, slot14 = slot12(slot13)

		for slot15, slot16 in slot12, slot13, slot14 do
			slot18 = slot0
			slot17 = slot0.createBtn
			slot19 = slot16

			slot17(slot18, slot19)
		end
	end

	if not slot11 then
	else
		slot12 = 1

		if slot11 > slot12 then
			slot13 = slot0
			slot12 = slot0.createBtn
			slot14 = {
				noQuit = true
			}
			slot15 = slot1
			slot15 = slot15.BUTTON_NEXTPAGE
			slot14.btnType = slot15

			function slot15()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.nextPage

				slot0(slot1)

				return
			end

			slot14.onCallback = slot15
			slot15 = SFX_CONFIRM
			slot14.sound = slot15

			slot12(slot13, slot14)
		end
	end

	slot12 = setActive
	slot13 = slot0._closeBtn
	slot14 = slot1.hideClose
	slot14 = not slot14

	slot12(slot13, slot14)

	slot12 = onButton
	slot13 = slot0
	slot14 = slot0._closeBtn

	function slot15()
		slot0 = slot0
		slot0 = slot0.settings
		slot0 = slot0.onClose
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		if slot0 then
			slot1 = slot0

			slot1()
		else
			slot1 = slot1

			slot1()
		end

		return
	end

	slot16 = SFX_CANCEL

	slot12(slot13, slot14, slot15, slot16)

	slot12 = slot0.settings
	slot12 = slot12.title

	if not slot12 then
		slot12 = slot1
		slot12 = slot12.TITLE_INFORMATION
	end

	slot13 = 0
	slot14 = slot0._titleList
	slot14 = slot14.transform
	slot14 = slot14.childCount

	while slot13 < slot14 do
		slot15 = slot0._titleList
		slot15 = slot15.transform
		slot16 = slot15
		slot15 = slot15.GetChild
		slot17 = slot13
		slot15 = slot15(slot16, slot17)
		slot16 = SetActive
		slot17 = slot15
		slot18 = slot15.name

		if slot18 ~= slot12 then
			slot18 = false
		else
			slot18 = true
		end

		slot16(slot17, slot18)

		slot13 = slot13 + 1
	end

	slot15 = slot0._go
	slot15 = slot15.transform
	slot15 = slot15.localPosition
	slot16 = slot0._go
	slot16 = slot16.transform
	slot17 = Vector3
	slot18 = slot15.x
	slot19 = slot15.y
	slot20 = slot0.settings
	slot20 = slot20.zIndex

	if not slot20 then
		slot20 = 0
	end

	slot17 = slot17(slot18, slot19, slot20)
	slot16.localPosition = slot17
	slot16 = slot0._helpPanel

	if slot16 then
		slot16 = setActive
		slot17 = slot0._helpPanel
		slot18 = slot0.settings
		slot18 = slot18.helps

		slot16(slot17, slot18)
	end

	slot16 = slot0._sliders

	if slot16 then
		slot16 = setActive
		slot17 = slot0._sliders
		slot18 = true

		slot16(slot17, slot18)
	end

	return
end

slot1.commonSetting = slot9

function slot9(slot0, slot1)
	slot2 = slot1.btnType

	if not slot2 then
		slot2 = slot0
		slot2 = slot2.BUTTON_BLUE
	end

	slot3 = slot1.onCallback

	if not slot3 then
		function slot3()
			return
		end
	end

	slot4 = slot1.noQuit
	slot5 = slot0._go
	slot5 = slot5.transform
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "window/custom_button_"
	slot8 = slot2
	slot7 = slot7 .. slot8
	slot5 = slot5(slot6, slot7)
	slot6 = cloneTplTo
	slot7 = slot5
	slot8 = slot0._btnContainer
	slot6 = slot6(slot7, slot8)
	slot7 = slot1.label

	if slot7 then
		slot7 = go
		slot8 = slot6
		slot7 = slot7(slot8)
		slot8 = slot1.label
		slot7.name = slot8
	end

	slot7 = SetActive
	slot8 = slot6
	slot9 = true

	slot7(slot8, slot9)

	slot7 = slot1.scale

	if slot7 then
		slot7 = slot1.scale
		slot7 = slot7.x

		if not slot7 then
			slot7 = 1
		end

		slot8 = slot1.scale
		slot8 = slot8.y

		if not slot8 then
			slot8 = 1
		end

		slot9 = Vector2
		slot10 = slot7
		slot11 = slot8
		slot9 = slot9(slot10, slot11)
		slot6.localScale = slot9
	end

	slot7 = slot0
	slot7 = slot7.BUTTON_RETREAT

	if slot2 ~= slot7 then
		slot7 = slot0
		slot7 = slot7.BUTTON_PREPAGE

		if slot2 ~= slot7 then
			slot7 = slot0
			slot7 = slot7.BUTTON_NEXTPAGE

			if slot2 ~= slot7 then
				slot8 = slot0
				slot7 = slot0.updateButton
				slot9 = slot6
				slot10 = slot1.text

				slot7(slot8, slot9, slot10)
			end
		end
	end

	slot7 = slot1.hideEvent

	if not slot7 then
		slot7 = onButton
		slot8 = slot0
		slot9 = slot6

		function slot10()
			slot0 = type
			slot1 = slot0
			slot0 = slot0(slot1)

			if slot0 == "function" then
				slot0 = slot0
				slot0 = slot0()

				if not slot0 then
					slot0 = SetActive
					slot1 = slot1
					slot1 = slot1._go
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)
				else
					return
				end
			else
				slot0 = slot0

				if not slot0 then
					slot0 = SetActive
					slot1 = slot1
					slot1 = slot1._go
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)
				end
			end

			slot0 = slot2

			slot0()

			return
		end

		slot11 = slot1.sound

		if not slot11 then
			slot11 = SFX_CONFIRM
		end

		slot7(slot8, slot9, slot10, slot11)
	end

	slot7 = slot1.sibling

	if slot7 then
		slot8 = slot6
		slot7 = slot6.SetSiblingIndex
		slot9 = slot1.sibling

		slot7(slot8, slot9)
	end

	return
end

slot1.createBtn = slot9

function slot9(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.Find
	slot5 = "text"
	slot3 = slot3(slot4, slot5)
	slot5 = slot1
	slot4 = slot1.Find
	slot6 = "pic"
	slot4 = slot4(slot5, slot6)
	slot5 = nil
	slot6 = slot0._textPics
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = slot2
	slot6 = slot6(slot7, slot8)
	slot7 = IsNil
	slot8 = slot6
	slot7 = slot7(slot8)

	if not slot7 then
		slot7 = getImageSprite
		slot8 = slot6
		slot7 = slot7(slot8)
		slot5 = slot7

		if not slot5 then
			slot7 = GetComponent
			slot8 = slot4
			slot9 = typeof
			slot10 = Text
			slot7 = slot7(slot8, slot9(slot10))

			if slot7 then
				slot8 = slot7.text

				if slot8 ~= "" then
					slot5 = slot7
				end
			end
		end
	end

	if slot5 then
		slot7 = setActive
		slot8 = slot4
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot3
		slot9 = false

		slot7(slot8, slot9)

		slot7 = getImageSprite
		slot8 = slot4
		slot7 = slot7(slot8)
		slot5 = slot7

		if not slot5 then
			slot7 = GetComponent
			slot8 = slot4
			slot9 = typeof
			slot10 = Text
			slot7 = slot7(slot8, slot9(slot10))

			if slot7 then
				slot8 = slot7.text

				if slot8 ~= "" then
					slot8 = i18n
					slot9 = slot2
					slot8 = slot8(slot9)
					slot9 = i18n_not_find
					slot10 = slot2
					slot9 = slot9(slot10)

					if slot8 == slot9 then
						slot8 = slot2
					end

					slot9 = setText
					slot10 = slot7
					slot11 = slot8

					slot9(slot10, slot11)
				end
			end
		end
	else
		slot7 = setActive
		slot8 = slot4
		slot9 = false

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot3
		slot9 = true

		slot7(slot8, slot9)

		slot7 = i18n
		slot8 = slot2
		slot7 = slot7(slot8)
		slot8 = i18n_not_find
		slot9 = slot2
		slot8 = slot8(slot9)

		if slot7 == slot8 then
			slot7 = slot2
		end

		slot8 = setText
		slot9 = slot3
		slot10 = slot7

		slot8(slot9, slot10)
	end

	return
end

slot1.updateButton = slot9

function slot9(slot0, slot1)
	slot2 = slot1.parent

	if slot2 then
		slot2 = setParent
		slot3 = slot0._tf
		slot4 = slot1.parent

		slot2(slot3, slot4)

		slot2 = slot1.canvasOrder

		if slot2 then
			slot2 = GetComponent
			slot3 = slot0._tf
			slot4 = typeof
			slot5 = Canvas
			slot2 = slot2(slot3, slot4(slot5))
			slot3 = slot2.sortingOrder
			slot0.originCanvasOrder = slot3
			slot3 = slot1.canvasOrder
			slot2.sortingOrder = slot3
		end
	else
		slot2 = slot0
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0._tf
		slot5 = false
		slot6 = {}
		slot7 = slot1.groupName
		slot6.groupName = slot7
		slot7 = slot1.weight
		slot6.weight = slot7
		slot7 = slot1.blurLevelCamera
		slot6.blurLevelCamera = slot7

		slot2(slot3, slot4, slot5, slot6)
	end

	slot2 = slot0
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.sendNotification
	slot4 = GAME
	slot4 = slot4.OPEN_MSGBOX_DONE

	slot2(slot3, slot4)

	return
end

slot1.Loaded = slot9

function slot9(slot0)
	slot1 = rtf
	slot2 = slot0._window
	slot1 = slot1(slot2)
	slot2 = slot0._defaultSize
	slot1.sizeDelta = slot2
	slot1 = rtf
	slot2 = slot0._helpPanel
	slot1 = slot1(slot2)
	slot2 = slot0._defaultHelpSize
	slot1.sizeDelta = slot2
	slot1 = setAnchoredPosition
	slot2 = slot0._window
	slot3 = {
		x = 0,
		y = 0
	}

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0._helpPanel
	slot3 = {}
	slot4 = slot0._defaultHelpPos
	slot4 = slot4.x
	slot3.x = slot4
	slot4 = slot0._defaultHelpPos
	slot4 = slot4.y
	slot3.y = slot4

	slot1(slot2, slot3)

	slot1 = GetComponent
	slot2 = slot0._helpPanel
	slot3 = typeof
	slot4 = ScrollRect
	slot1 = slot1(slot2, slot3(slot4))
	slot2 = true
	slot1.enabled = slot2
	slot2 = setActive
	slot3 = slot0._top
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._window
	slot5 = "bg"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = 0
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot3 = slot3 - 1
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot0._helpList
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "icon"
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = typeof
		slot9 = Image
		slot6 = slot6(slot7, slot8(slot9))
		slot7 = nil
		slot6.sprite = slot7
	end

	slot2 = slot0._scrollTxts
	slot2 = #slot2
	slot3 = 1
	slot4 = -1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot0._scrollTxts
		slot6 = slot6[slot5]

		if slot6 then
			slot6 = slot0._scrollTxts
			slot6 = slot6[slot5]
			slot7 = slot6
			slot6 = slot6.destroy

			slot6(slot7)

			slot6 = table
			slot6 = slot6.remove
			slot7 = slot0._scrollTxts
			slot8 = slot5

			slot6(slot7, slot8)
		end
	end

	slot2 = pairs
	slot3 = slot0.pools
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		if slot6 then
			slot7 = PoolMgr
			slot7 = slot7.GetInstance
			slot7 = slot7()
			slot8 = slot7
			slot7 = slot7.ReturnUI
			slot9 = slot6.name
			slot10 = slot6

			slot7(slot8, slot9, slot10)
		end
	end

	slot2 = {}
	slot0.pools = slot2
	slot2 = pairs
	slot3 = slot0.timers
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.Stop

		slot7(slot8)
	end

	slot2 = {}
	slot0.timers = slot2
	slot2 = slot0
	slot2 = slot2.DelegateInfo
	slot2 = slot2.Dispose
	slot3 = slot0

	slot2(slot3)

	slot2 = slot0._btnContainer
	slot2 = slot2.childCount
	slot3 = 1
	slot4 = slot2
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = slot0._btnContainer
		slot8 = slot7
		slot7 = slot7.GetChild
		slot9 = 0
		slot7 = slot7(slot8, slot9)
		slot8 = Destroy
		slot9 = slot7

		slot8(slot9)
	end

	slot3 = slot0.settings

	if slot3 then
		slot3 = slot0.settings
		slot3 = slot3.parent

		if slot3 then
			slot3 = setParent
			slot4 = slot0._tf
			slot5 = slot0
			slot5 = slot5.UIMgr
			slot5 = slot5.GetInstance
			slot5 = slot5()
			slot5 = slot5.OverlayMain
			slot6 = false

			slot3(slot4, slot5, slot6)

			slot3 = slot0.settings
			slot3 = slot3.canvasOrder

			if slot3 then
				slot3 = GetComponent
				slot4 = slot0._tf
				slot5 = typeof
				slot6 = Canvas
				slot3 = slot3(slot4, slot5(slot6))
				slot4 = slot0.originCanvasOrder
				slot3.sortingOrder = slot4
			end
		end
	else
		slot3 = slot0
		slot3 = slot3.UIMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.UnblurPanel
		slot5 = slot0._tf
		slot6 = slot0
		slot6 = slot6.UIMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot6 = slot6.OverlayMain

		slot3(slot4, slot5, slot6)
	end

	slot3 = slot0.contentText

	if slot3 then
		slot3 = slot0.contentText
		slot4 = slot3
		slot3 = slot3.RemoveAllListeners

		slot3(slot4)
	end

	slot3 = nil
	slot0.settings = slot3
	slot3 = false
	slot0.enable = slot3

	return
end

slot1.Clear = slot9

function slot9(slot0, slot1)
	slot2 = true
	slot0.enable = slot2
	slot2 = slot1.type

	if not slot2 then
		slot2 = MSGBOX_TYPE_NORMAL
	end

	slot3 = MSGBOX_TYPE_NORMAL

	if slot2 == slot3 then
		slot3 = slot0
		slot4 = slot0
		slot5 = slot1

		slot3(slot4, slot5)
	else
		slot3 = MSGBOX_TYPE_INPUT

		if slot2 == slot3 then
			slot3 = slot1
			slot4 = slot0
			slot5 = slot1

			slot3(slot4, slot5)
		else
			slot3 = MSGBOX_TYPE_SINGLE_ITEM

			if slot2 == slot3 then
				slot3 = slot2
				slot4 = slot0
				slot5 = slot1

				slot3(slot4, slot5)
			else
				slot3 = MSGBOX_TYPE_EXCHANGE

				if slot2 == slot3 then
					slot3 = slot3
					slot4 = slot0
					slot5 = slot1

					slot3(slot4, slot5)
				else
					slot3 = MSGBOX_TYPE_DROP_ITEM

					if slot2 == slot3 then
						slot3 = slot4
						slot4 = slot0
						slot5 = slot1

						slot3(slot4, slot5)
					else
						slot3 = MSGBOX_TYPE_ITEM_BOX

						if slot2 == slot3 then
							slot3 = slot5
							slot4 = slot0
							slot5 = slot1

							slot3(slot4, slot5)
						else
							slot3 = MSGBOX_TYPE_HELP

							if slot2 == slot3 then
								slot3 = slot6
								slot4 = slot0
								slot5 = slot1

								slot3(slot4, slot5)
							else
								slot3 = MSGBOX_TYPE_SECONDPWD

								if slot2 == slot3 then
									slot3 = PoolMgr
									slot3 = slot3.GetInstance
									slot3 = slot3()
									slot4 = slot3
									slot3 = slot3.GetUI
									slot5 = "Msgbox4SECPWD"
									slot6 = true

									function slot7(slot0)
										slot1 = slot0
										slot1 = slot1.pools
										slot1.SedondaryUI = slot0
										slot1 = slot1
										slot1 = slot1.onPreShow

										if slot1 then
											slot1 = slot1
											slot1 = slot1.onPreShow

											slot1()
										end

										slot1 = slot1
										slot1.secondaryUI = slot0
										slot1 = SetParent
										slot2 = slot0
										slot3 = slot0
										slot3 = slot3._sliders
										slot4 = false

										slot1(slot2, slot3, slot4)

										slot1 = showSecondaryPassword
										slot2 = slot0
										slot3 = slot1

										slot1(slot2, slot3)

										return
									end

									slot3(slot4, slot5, slot6, slot7)
								end
							end
						end
					end
				end
			end
		end
	end

	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.SetAsLastSibling

	slot3(slot4)

	return
end

slot1.ShowMsgBox = slot9

function slot9(slot0)
	slot1 = slot0.enable

	if not slot1 then
		return
	end

	slot1 = slot0._go
	slot2 = slot1
	slot1 = slot1.SetActive
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.Clear

	slot1(slot2)

	slot1 = slot0
	slot1 = slot1.m02
	slot2 = slot1
	slot1 = slot1.sendNotification
	slot3 = GAME
	slot3 = slot3.CLOSE_MSGBOX_DONE

	slot1(slot2, slot3)

	return
end

slot1.hide = slot9

return
