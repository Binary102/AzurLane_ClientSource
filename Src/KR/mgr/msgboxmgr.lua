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
		slot1 = slot1.GetInstance
		slot1 = slot1()
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
		slot3 = {}
		slot2.singleItemIntros = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/single_item_panel/name_mode/intro_view/Viewport/Content/intro"
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

		slot2 = table
		slot2 = slot2.insert
		slot3 = slot0
		slot3 = slot3.singleItemIntros
		slot4 = slot0
		slot4 = slot4.singleItemIntro

		slot2(slot3, slot4)

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
			slot0 = print
			slot1 = "点击1"

			slot0(slot1)

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
	slot0.enable = true

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
		slot0 = print
		slot1 = "点击2"

		slot0(slot1)

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
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot0:commonSetting(slot1)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = true

	SetActive(slot0._sigleItemPanel, true)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	SetActive(slot0._itemPanel, false)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	SetActive(slot0._msgPanel, false)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	setActive(slot0._inputPanel, false)

	slot2 = SetActive
	slot3 = slot0._SingleItemshipTypeTF
	slot4 = false

	SetActive(slot0._SingleItemshipTypeTF, false)

	slot2 = SetActive
	slot3 = slot0._SingleItemshipTypeBgTF
	slot4 = false

	SetActive(slot0._SingleItemshipTypeBgTF, false)

	slot2 = SetActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "line_mode"
	slot3 = findTF(slot0._sigleItemPanel, "line_mode")
	slot4 = false

	SetActive(findTF(slot0._sigleItemPanel, "line_mode"), false)

	slot2 = SetActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "count_select"
	slot3 = findTF(slot0._sigleItemPanel, "count_select")
	slot4 = false

	SetActive(findTF(slot0._sigleItemPanel, "count_select"), false)

	slot2 = SetActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "detail"
	slot3 = findTF(slot0._sigleItemPanel, "detail")
	slot4 = false

	SetActive(findTF(slot0._sigleItemPanel, "detail"), false)

	slot2 = findTF
	slot3 = slot0._sigleItemPanel
	slot4 = "icon_bg/icon"
	slot2 = findTF(slot0._sigleItemPanel, "icon_bg/icon")
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/frame"
	slot3 = findTF(slot0._sigleItemPanel, "icon_bg/frame")
	slot4 = findTF
	slot5 = slot0._sigleItemPanel
	slot6 = "name_mode/intro_view/Viewport/Content/intro"
	slot4 = findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro")
	slot5 = findTF
	slot6 = slot0._sigleItemPanel
	slot7 = "icon_bg/count"
	slot5 = findTF(slot0._sigleItemPanel, "icon_bg/count")
	slot6 = findTF
	slot7 = slot0._sigleItemPanel
	slot8 = "icon_bg/startpl"
	slot6 = findTF(slot0._sigleItemPanel, "icon_bg/startpl")
	slot7 = setText
	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/count")
	slot9 = ""

	setText(slot5, "")

	slot7 = SetActive
	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/startpl")
	slot9 = false

	SetActive(slot6, false)

	slot7 = SetActive
	slot8 = findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro")
	slot9 = true

	SetActive(slot4, true)

	slot7 = setFrame
	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/frame")
	slot9 = slot1.frame
	slot9 = slot1.frame or 1

	setFrame(findTF(slot0._sigleItemPanel, "icon_bg/frame"), slot9)

	slot7 = findTF(slot0._sigleItemPanel, "name_mode/name_mask")

	SetActive(slot7.parent, true)
	SetActive(slot7, true)
	ScrollTxt.New(slot7, findTF(slot0._sigleItemPanel, "icon_bg/frame")).setText(slot9, slot1.name or "")

	slot7.localPosition = Vector2(ScrollTxt.New(slot7, findTF(slot0._sigleItemPanel, "icon_bg/frame")).setText, slot7.localPosition.y)

	setText(findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro"), slot1.content or "")
	SetActive(findTF(slot0._sigleItemPanel, "icon_bg/icon").parent, slot1.sprite)

	slot11 = slot1.sprite
	slot9 = 1
	slot12 = ""
	slot13 = ""

	if slot11 then
		slot11 = setImageSprite
		slot12 = slot2
		slot13 = slot1.sprite
		slot14 = false

		slot11(slot12, slot13, slot14)
	end

	slot12 = slot0
	slot11 = slot0.Loaded
	slot13 = slot1

	slot11(slot12, slot13)

	return
end

function slot7(slot0, slot1)
	slot2 = slot0.singleItemIntros
	slot2 = slot2[slot1]

	if not slot2 then
		slot2 = slot0.singleItemIntros
		slot3 = cloneTplTo
		slot4 = slot0.singleItemIntro
		slot5 = slot0.singleItemIntro
		slot5 = slot5.parent
		slot3 = slot3(slot4, slot5)
		slot2[slot1] = slot3
	end

	slot2 = slot0.singleItemIntros
	slot2 = slot2[slot1]

	return slot2
end

slot1.GetSingleItemIntro = slot7

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
		slot2 = GetOwnedpropCount
		slot3 = slot1.drop
		slot2, slot3 = slot2(slot3)
		slot4 = setActive
		slot5 = findTF
		slot6 = slot0._sigleItemPanel
		slot7 = "icon_bg/own"
		slot5 = slot5(slot6, slot7)

		if slot3 then
			slot6 = slot1.showOwned
		end

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = findTF
		slot6 = slot0._sigleItemPanel
		slot7 = "icon_bg/own/Text"
		slot5 = slot5(slot6, slot7)
		slot6 = slot2

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = findTF
		slot6 = slot0._sigleItemPanel
		slot7 = "icon_bg/own/label"
		slot5 = slot5(slot6, slot7)
		slot6 = i18n
		slot7 = "word_own1"

		slot4(slot5, slot6(slot7))
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
	slot5 = "window/single_item_panel/name_mode/intro_view/Viewport/Content/intro"
	slot3 = slot3(slot4, slot5)
	slot4 = 1
	slot5 = SetActive
	slot6 = slot3
	slot7 = slot1.drop
	slot7 = slot7.type
	slot8 = DROP_TYPE_SHIP

	if slot7 ~= slot8 then
		slot7 = slot1.drop
		slot7 = slot7.type
		slot8 = DROP_TYPE_RESOURCE

		if slot7 ~= slot8 then
			slot7 = slot1.drop
			slot7 = slot7.type
			slot8 = DROP_TYPE_ITEM

			if slot7 ~= slot8 then
				slot7 = slot1.drop
				slot7 = slot7.type
				slot8 = DROP_TYPE_FURNITURE

				if slot7 ~= slot8 then
					slot7 = slot1.drop
					slot7 = slot7.type
					slot8 = DROP_TYPE_STRATEGY

					if slot7 ~= slot8 then
						slot7 = slot1.drop
						slot7 = slot7.type
						slot8 = DROP_TYPE_SKIN

						if slot7 ~= slot8 then
							slot7 = false
						end
					end
				end
			end
		end
	else
		slot7 = true
	end

	slot5(slot6, slot7)

	slot5 = slot0.settings
	slot5 = slot5.numUpdate
	slot6 = setActive
	slot7 = slot0._countDescTxt

	if slot5 == nil then
		slot8 = false
	else
		slot8 = true
	end

	slot6(slot7, slot8)

	slot6 = slot0._tf
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "window/single_item_panel/name_mode/name_mask"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0._tf
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = "window/single_item_panel/name_mode/name_mask/name"
	slot7 = slot7(slot8, slot9)
	slot8 = HXSet
	slot8 = slot8.hxLan
	slot9 = slot1.name

	if not slot9 then
		slot9 = slot1.drop
		slot9 = slot9.cfg
		slot9 = slot9.name

		if not slot9 then
			slot9 = ""
		end
	end

	slot8 = slot8(slot9)
	slot9 = ScrollTxt
	slot9 = slot9.New
	slot10 = slot6
	slot11 = slot7
	slot9 = slot9(slot10, slot11)
	slot11 = slot9
	slot10 = slot9.setText
	slot12 = slot8

	slot10(slot11, slot12)

	slot10 = table
	slot10 = slot10.insert
	slot11 = slot0._scrollTxts
	slot12 = slot9

	slot10(slot11, slot12)

	slot10 = -170
	slot11 = go
	slot12 = slot0._SingleItemshipTypeTF
	slot11 = slot11(slot12)
	slot11 = slot11.activeSelf

	if not slot11 then
		slot10 = -230
	end

	slot12 = setActive
	slot13 = slot0._SingleItemshipTypeBgTF
	slot14 = slot11

	slot12(slot13, slot14)

	slot12 = Vector2
	slot13 = slot10
	slot14 = slot6.localPosition
	slot14 = slot14.y
	slot12 = slot12(slot13, slot14)
	slot6.localPosition = slot12
	slot12 = slot0._tf
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "window/single_item_panel/detail"
	slot12 = slot12(slot13, slot14)
	slot13 = slot1.drop
	slot13 = slot13.type
	slot14 = DROP_TYPE_ITEM

	if slot13 == slot14 then
		slot13 = slot1.drop
		slot13 = slot13.cfg
		slot13 = slot13.type

		if slot13 ~= 11 then
			slot13 = false
		else
			slot13 = true
		end
	end

	slot14 = setActive
	slot15 = slot12
	slot16 = slot13

	slot14(slot15, slot16)

	if slot13 then
		slot15 = slot12
		slot14 = slot12.GetComponent
		slot16 = "RichText"
		slot14 = slot14(slot15, slot16)
		slot15 = slot14
		slot14 = slot14.AddListener

		function slot16(slot0, slot1)
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
				slot3 = {}
				slot3.drop = slot0

				function slot4()
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)

					return
				end

				slot3.onYes = slot4

				function slot4()
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)

					return
				end

				slot3.onNo = slot4

				slot1(slot2, slot3)

				return
			end

			slot2.itemFunc = slot3

			function slot3()
				slot0 = slot0
				slot1 = slot1
				slot2 = slot2

				slot0(slot1, slot2)

				return
			end

			slot2.onYes = slot3
			slot3 = slot2.onYes
			slot2.onNo = slot3
			slot3 = slot3
			slot4 = slot2
			slot5 = slot2

			slot3(slot4, slot5)

			return
		end

		slot14(slot15, slot16)
	end

	slot14 = slot1.content

	if slot14 then
		slot14 = slot1.content

		if slot14 ~= "" then
			slot14 = slot0.singleItemIntroTF
			slot15 = slot1.content
			slot14.text = slot15
		end
	else
		slot14 = slot1.drop
		slot14 = slot14.type
		slot15 = DROP_TYPE_RESOURCE

		if slot14 == slot15 then
			slot14 = setText
			slot15 = slot3
			slot16 = slot1.drop
			slot16 = slot16.cfg
			slot16 = slot16.display

			slot14(slot15, slot16)
		else
			slot14 = slot1.drop
			slot14 = slot14.type
			slot15 = DROP_TYPE_ITEM

			if slot14 == slot15 then
				slot14 = setText
				slot15 = slot3
				slot16 = HXSet
				slot16 = slot16.hxLan
				slot17 = slot1.drop
				slot17 = slot17.cfg
				slot17 = slot17.display

				slot14(slot15, slot16(slot17))
			else
				slot14 = slot1.drop
				slot14 = slot14.type
				slot15 = DROP_TYPE_FURNITURE

				if slot14 == slot15 then
					slot14 = setText
					slot15 = slot3
					slot16 = slot1.drop
					slot16 = slot16.cfg
					slot16 = slot16.describe

					slot14(slot15, slot16)
				else
					slot14 = slot1.drop
					slot14 = slot14.type
					slot15 = DROP_TYPE_SHIP

					if slot14 == slot15 then
						slot14 = slot2
						slot14 = slot14.ship_data_statistics
						slot15 = slot1.drop
						slot15 = slot15.id
						slot14 = slot14[slot15]
						slot14 = slot14.skin_id
						slot15 = Ship
						slot15 = slot15.getWords
						slot16 = slot14
						slot17 = "drop_descrip"
						slot15 = slot15(slot16, slot17)
						slot16 = setText
						slot17 = slot3

						if not slot15 then
							slot18 = i18n
							slot19 = "ship_drop_desc_default"
							slot18 = slot18(slot19)
						end

						slot16(slot17, slot18)
					else
						slot14 = slot1.drop
						slot14 = slot14.type
						slot15 = DROP_TYPE_EQUIP

						if slot14 == slot15 then
							slot14 = 1
							slot15 = 4
							slot16 = 1

							for slot17 = slot14, slot15, slot16 do
								slot19 = slot2
								slot18 = slot2.GetChild
								slot20 = slot17 - 1
								slot18 = slot18(slot19, slot20)
								slot19 = slot1.drop
								slot19 = slot19.cfg
								slot20 = "attribute_"
								slot21 = slot17
								slot20 = slot20 .. slot21
								slot19 = slot19[slot20]
								slot20 = setActive
								slot22 = slot18
								slot21 = slot18.Find
								slot23 = "opend"
								slot21 = slot21(slot22, slot23)
								slot22 = slot19

								slot20(slot21, slot22)

								slot20 = setActive
								slot22 = slot18
								slot21 = slot18.Find
								slot23 = "attrLockTpl"
								slot21 = slot21(slot22, slot23)
								slot22 = not slot19

								slot20(slot21, slot22)

								if slot19 then
									slot20 = setText
									slot22 = slot18
									slot21 = slot18.Find
									slot23 = "opend/type_name"
									slot21 = slot21(slot22, slot23)
									slot22 = AttributeType
									slot22 = slot22.Type2Name
									slot23 = slot19

									slot20(slot21, slot22(slot23))

									slot20 = setText
									slot22 = slot18
									slot21 = slot18.Find
									slot23 = "opend/value"
									slot21 = slot21(slot22, slot23)
									slot22 = slot1.drop
									slot22 = slot22.cfg
									slot23 = "value_"
									slot24 = slot17
									slot23 = slot23 .. slot24
									slot22 = slot22[slot23]

									slot20(slot21, slot22)
								end
							end
						else
							slot14 = slot1.drop
							slot14 = slot14.type
							slot15 = DROP_TYPE_STRATEGY

							if slot14 == slot15 then
								slot14 = setText
								slot15 = slot3
								slot16 = slot1.drop
								slot16 = slot16.cfg
								slot16 = slot16.desc

								slot14(slot15, slot16)

								slot14 = slot1.extendDesc

								if slot14 then
									slot4 = slot4 + 1
									slot14 = setText
									slot16 = slot0
									slot15 = slot0.GetSingleItemIntro
									slot17 = slot4
									slot15 = slot15(slot16, slot17)
									slot16 = slot1.extendDesc

									slot14(slot15, slot16)
								end
							else
								slot14 = slot1.drop
								slot14 = slot14.type
								slot15 = DROP_TYPE_SKIN

								if slot14 == slot15 then
									slot14 = setText
									slot15 = slot3
									slot16 = HXSet
									slot16 = slot16.hxLan
									slot17 = slot1.drop
									slot17 = slot17.cfg
									slot17 = slot17.desc

									slot14(slot15, slot16(slot17))
								else
									slot14 = slot1.drop
									slot14 = slot14.type
									slot15 = DROP_TYPE_EQUIPMENT_SKIN

									if slot14 == slot15 then
										slot14 = slot1.drop
										slot14 = slot14.cfg
										slot14 = slot14.desc
										slot15 = _
										slot15 = slot15.map
										slot16 = slot1.drop
										slot16 = slot16.cfg
										slot16 = slot16.equip_type

										function slot17(slot0)
											slot1 = EquipType
											slot1 = slot1.Type2Name2
											slot2 = slot0

											return slot1(slot2)
										end

										slot15 = slot15(slot16, slot17)
										slot16 = setText
										slot17 = slot3
										slot18 = slot14
										slot19 = "\n\n"
										slot20 = i18n
										slot21 = "word_fit"
										slot20 = slot20(slot21)
										slot21 = ": "
										slot22 = table
										slot22 = slot22.concat
										slot23 = slot15
										slot24 = ","
										slot22 = slot22(slot23, slot24)
										slot18 = slot18 .. slot19 .. slot20 .. slot21 .. slot22

										slot16(slot17, slot18)
									else
										slot14 = slot1.drop
										slot14 = slot14.type
										slot15 = DROP_TYPE_VITEM

										if slot14 == slot15 then
											slot14 = setText
											slot15 = slot3
											slot16 = HXSet
											slot16 = slot16.hxLan
											slot17 = slot1.drop
											slot17 = slot17.cfg
											slot17 = slot17.display

											slot14(slot15, slot16(slot17))
										else
											slot14 = slot1.drop
											slot14 = slot14.type
											slot15 = DROP_TYPE_WORLD_ITEM

											if slot14 == slot15 then
												slot14 = setText
												slot15 = slot3
												slot16 = HXSet
												slot16 = slot16.hxLan
												slot17 = slot1.drop
												slot17 = slot17.cfg
												slot17 = slot17.display

												slot14(slot15, slot16(slot17))
											else
												slot14 = slot1.drop
												slot14 = slot14.type
												slot15 = DROP_TYPE_ICON_FRAME

												if slot14 == slot15 then
													slot14 = setText
													slot15 = slot3
													slot16 = slot1.drop
													slot16 = slot16.cfg
													slot16 = slot16.desc

													slot14(slot15, slot16)
												else
													slot14 = slot1.drop
													slot14 = slot14.type
													slot15 = DROP_TYPE_CHAT_FRAME

													if slot14 == slot15 then
														slot14 = setText
														slot15 = slot3
														slot16 = slot1.drop
														slot16 = slot16.cfg
														slot16 = slot16.desc

														slot14(slot15, slot16)
													else
														slot14 = slot1.drop
														slot14 = slot14.type
														slot15 = DROP_TYPE_EMOJI

														if slot14 == slot15 then
															slot14 = setText
															slot15 = slot3
															slot16 = slot1.drop
															slot16 = slot16.cfg
															slot16 = slot16.item_desc

															slot14(slot15, slot16)
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

	slot14 = slot1.intro

	if slot14 then
		slot14 = setText
		slot15 = slot3
		slot16 = slot1.intro

		slot14(slot15, slot16)
	end

	slot14 = slot1.enabelYesBtn

	if slot14 ~= nil then
		slot14 = slot0._btnContainer
		slot15 = slot14
		slot14 = slot14.GetChild
		slot16 = 1
		slot14 = slot14(slot15, slot16)
		slot15 = setButtonEnabled
		slot16 = slot14
		slot17 = slot1.enabelYesBtn

		slot15(slot16, slot17)

		slot15 = eachChild
		slot16 = slot14

		function slot17(slot0)
			slot1 = slot0
			slot1 = slot1.enabelYesBtn

			if slot1 then
				slot1 = 1
			else
				slot1 = 0.3
			end

			slot2 = GetOrAddComponent
			slot3 = slot0
			slot4 = typeof
			slot5 = CanvasGroup
			slot2 = slot2(slot3, slot4(slot5))
			slot2.alpha = slot1

			return
		end

		slot15(slot16, slot17)
	end

	slot14 = ipairs
	slot15 = slot0.singleItemIntros
	slot14, slot15, slot16 = slot14(slot15)

	for slot17, slot18 in slot14, slot15, slot16 do
		slot19 = setActive
		slot20 = slot18

		if slot17 > slot4 or slot5 ~= nil then
			slot21 = false
		else
			slot21 = true
		end

		slot19(slot20, slot21)
	end

	slot14 = slot1.show_medal

	if slot14 then
		slot15 = slot0
		slot14 = slot0.createBtn
		slot16 = {
			sibling = 0,
			hideEvent = true
		}
		slot17 = slot1.show_medal
		slot17 = slot17.desc
		slot16.text = slot17
		slot17 = slot3
		slot17 = slot17.BUTTON_MEDAL
		slot16.btnType = slot17
		slot17 = SFX_UI_BUILDING_EXCHANGE
		slot16.sound = slot17

		slot14(slot15, slot16)
	end

	slot15 = slot0
	slot14 = slot0.Loaded
	slot16 = slot1

	slot14(slot15, slot16)

	return
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

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
		slot2 = setAnchoredPosition
		slot3 = slot0._window
		slot4 = {}
		slot5 = slot1.helps
		slot5 = slot5.windowPos
		slot5 = slot5.x

		if not slot5 then
			slot5 = 0
		end

		slot4.x = slot5
		slot5 = slot1.helps
		slot5 = slot5.windowPos
		slot5 = slot5.y

		if not slot5 then
			slot5 = 0
		end

		slot4.y = slot5

		slot2(slot3, slot4)
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
		slot8 = slot0._helpList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot6 - 1
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot10 = slot8
		slot11 = true

		slot9(slot10, slot11)

		slot9 = setText
		slot10 = slot8
		slot11 = slot7.info

		if not slot11 then
			slot11 = ""
		end

		slot9(slot10, slot11)

		slot10 = slot8
		slot9 = slot8.Find
		slot11 = "icon"
		slot9 = slot9(slot10, slot11)
		slot10 = setActive
		slot11 = slot9
		slot12 = slot7.icon

		slot10(slot11, slot12)

		slot10 = setActive
		slot11 = findTF
		slot12 = slot8
		slot13 = "line"
		slot11 = slot11(slot12, slot13)
		slot12 = slot7.line

		slot10(slot11, slot12)

		slot10 = slot7.icon

		if slot10 then
			slot10 = 1
			slot11 = slot1.helps
			slot11 = slot11.ImageMode

			if slot11 then
				slot10 = 1.5
			end

			slot11 = slot9.transform
			slot12 = Vector2
			slot13 = slot7.icon
			slot13 = slot13.scale

			if not slot13 then
				slot13 = slot10
			end

			slot14 = slot7.icon
			slot14 = slot14.scale

			if not slot14 then
				slot14 = slot10
			end

			slot12 = slot12(slot13, slot14)
			slot11.localScale = slot12
			slot11 = slot7.icon
			slot11 = slot11.path
			slot12 = slot7.icon
			slot12 = slot12.posX

			if slot12 then
				slot12 = slot7.icon
				slot12 = slot12.posX

				if not slot12 then
					slot12 = -20
				end
			end

			slot13 = slot7.icon
			slot13 = slot13.posY

			if slot13 then
				slot13 = slot7.icon
				slot13 = slot13.posY

				if not slot13 then
					slot13 = 0
				end
			end

			slot14 = LoadSprite
			slot15 = slot7.icon
			slot15 = slot15.atlas
			slot16 = slot7.icon
			slot16 = slot16.path
			slot14 = slot14(slot15, slot16)
			slot15 = setImageSprite
			slot17 = slot9
			slot16 = slot9.GetComponent
			slot18 = typeof
			slot19 = Image
			slot16 = slot16(slot17, slot18(slot19))
			slot17 = slot14
			slot18 = true

			slot15(slot16, slot17, slot18)

			slot15 = setAnchoredPosition
			slot16 = slot9
			slot17 = {}
			slot17.x = slot12
			slot17.y = slot13

			slot15(slot16, slot17)

			slot15 = setActive
			slot17 = slot9
			slot16 = slot9.Find
			slot18 = "corner"
			slot16 = slot16(slot17, slot18)
			slot17 = slot1.helps
			slot17 = slot17.pageMode

			slot15(slot16, slot17)
		end
	end

	slot3 = slot1.helps
	slot3 = slot3.defaultpage

	if not slot3 then
		slot3 = 1
	end

	slot0.helpPage = slot3
	slot3 = slot1.helps
	slot3 = slot3.pageMode

	if slot3 then
		slot4 = slot0
		slot3 = slot0.switchHelpPage
		slot5 = slot0.helpPage

		slot3(slot4, slot5)
	end

	slot4 = slot0
	slot3 = slot0.Loaded
	slot5 = slot1

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0._btnContainer
	slot5 = slot0._btnContainer
	slot5 = slot5.transform
	slot5 = slot5.childCount
	slot6 = 0

	if slot5 <= slot6 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	return
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
			slot0 = slot0.GetInstance
			slot0 = slot0()
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

			return
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
	else
		if slot3 == "settips" then
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

			if not slot9 then
				slot9 = ""
			end

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
					slot3 = slot3.GetInstance
					slot3 = slot3()
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
		end
	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)

	return
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
	slot2 = true
	slot0.enable = slot2
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
		slot1 = print
		slot2 = "点击3"

		slot1(slot2)

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
