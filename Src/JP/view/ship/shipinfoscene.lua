slot0 = class
slot1 = "ShipInfoScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = nil
slot2 = 0.2
slot3 = 0.3
slot4 = 3
slot5 = 0.5
slot6 = 11
slot7 = {
	1,
	2,
	3
}
slot0.UNLOCK_EQUPMENT_SKIN_POS = slot7
slot7 = {
	EQUIPMENT = 1,
	DETAIL = 0,
	INTENSIFY = 2,
	REMOULD = 5,
	UPGRADE = 3,
	FASHION = 4
}
slot0.PAGE = slot7

function slot7(slot0)
	slot1 = "ShipInfoUI2"

	return slot1
end

slot0.getUIName = slot7

function slot7(slot0, slot1)
	slot2 = parallelAsync
	slot3 = {}

	function slot4(slot0)
		slot1 = getProxy
		slot2 = BayProxy
		slot1 = slot1(slot2)
		slot3 = slot1
		slot2 = slot1.getShipById
		slot4 = slot0
		slot4 = slot4.contextData
		slot4 = slot4.shipId
		slot2 = slot2(slot3, slot4)
		slot3 = GetSpriteFromAtlasAsync
		slot4 = "bg/star_level_bg_"
		slot6 = slot2
		slot5 = slot2.getShipBgPrint
		slot5 = slot5(slot6)
		slot4 = slot4 .. slot5
		slot5 = ""
		slot6 = slot0

		slot3(slot4, slot5, slot6)
	end

	slot3[1] = slot4
	slot4 = slot1

	slot2(slot3, slot4)
end

slot0.preload = slot7

function slot7(slot0, slot1)
	slot0.player = slot1
	slot2 = slot0.resPanel
	slot3 = slot2
	slot2 = slot2.setResources
	slot4 = slot1

	slot2(slot3, slot4)
end

slot0.setPlayer = slot7

function slot7(slot0, slot1)
	slot0.shipList = slot1
end

slot0.setShipList = slot7

function slot7(slot0, slot1)
	slot0.equipmentProxy = slot1
end

slot0.setEquipments = slot7

function slot7(slot0, slot1)
	slot0.maxLevelHelpFlag = slot1
end

slot0.setMaxLevelHelpFlag = slot7

function slot7(slot0, slot1)
	slot2 = false
	slot3 = slot0.shipVO

	if slot3 then
		slot3 = slot0.shipVO
		slot3 = slot3.id
		slot4 = slot1.id

		if slot3 ~= slot4 then
			slot3 = slot0._currentVoice

			if slot3 then
				slot3 = slot0._currentVoice
				slot4 = slot3
				slot3 = slot3.Stop
				slot5 = true

				slot3(slot4, slot5)
			end

			slot3 = nil
			slot0._currentVoice = slot3
			slot3 = slot0.loadedCVBankName

			if slot3 then
				slot3 = pg
				slot3 = slot3.CriMgr
				slot3 = slot3.UnloadCVBank
				slot4 = slot0.loadedCVBankName

				slot3(slot4)

				slot3 = nil
				slot0.loadedCVBankName = slot3
			end

			slot2 = true
		end
	end

	slot0.shipVO = slot1
	slot4 = slot0
	slot3 = slot0.updatePreference
	slot5 = slot1

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updateDetail
	slot5 = slot1

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updateEquipments
	slot5 = slot1

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.updateLock

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.updateFashion

	slot3(slot4)

	slot3 = nil
	slot5 = slot1
	slot4 = slot1.hasCommander
	slot4 = slot4(slot5)

	if slot4 then
		slot4 = getProxy
		slot5 = CommanderProxy
		slot4 = slot4(slot5)
		slot5 = slot4
		slot4 = slot4.getCommanderById
		slot7 = slot1
		slot6 = slot1.getCommander
		slot4 = slot4(slot5, slot6(slot7))
		slot3 = slot4
	end

	slot5 = slot0
	slot4 = slot0.updateCommander
	slot6 = slot3

	slot4(slot5, slot6)

	slot4 = slot0.intensifyMask

	if slot4 then
		slot4 = slot0.upgradeMask

		if slot4 then
			slot4 = setActive
			slot5 = slot0.intensifyMask
			slot6 = slot0.shipVO
			slot7 = slot6
			slot6 = slot6.isTestShip
			slot6 = slot6(slot7)

			if not slot6 then
				slot6 = slot0.shipVO
				slot7 = slot6
				slot6 = slot6.isBluePrintShip
				slot6 = slot6(slot7)
			end

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.upgradeMask
			slot6 = slot0.shipVO
			slot7 = slot6
			slot6 = slot6.isTestShip
			slot6 = slot6(slot7)

			if not slot6 then
				slot6 = slot0.shipVO
				slot7 = slot6
				slot6 = slot6.isBluePrintShip
				slot6 = slot6(slot7)
			end

			slot4(slot5, slot6)
		end
	end

	slot4 = slot0.equipmentSkinPanel

	if slot4 then
		slot4 = slot0.equipmentSkinPanel
		slot5 = slot4
		slot4 = slot4.updateAll
		slot6 = slot0.shipVO

		slot4(slot5, slot6)
	end

	if slot2 then
		slot4 = slot0.page
		slot5 = slot0
		slot5 = slot5.PAGE
		slot5 = slot5.INTENSIFY

		if slot4 == slot5 then
			slot4 = slot0.intensifyMask
			slot4 = slot4.gameObject
			slot4 = slot4.activeSelf

			if slot4 then
				slot4 = triggerToggle
				slot5 = slot0.detailToggle
				slot6 = true

				slot4(slot5, slot6)
			end
		end

		slot4 = slot0.page
		slot5 = slot0
		slot5 = slot5.PAGE
		slot5 = slot5.UPGRADE

		if slot4 == slot5 then
			slot4 = slot0.upgradeMask
			slot4 = slot4.gameObject
			slot4 = slot4.activeSelf

			if slot4 then
				slot4 = triggerToggle
				slot5 = slot0.detailToggle
				slot6 = true

				slot4(slot5, slot6)
			end
		end

		slot4 = slot0.page
		slot5 = slot0
		slot5 = slot5.PAGE
		slot5 = slot5.FASHION

		if slot4 == slot5 then
			slot4 = slot0.fashionToggle
			slot4 = slot4.gameObject
			slot4 = slot4.activeSelf

			if not slot4 then
				slot4 = triggerToggle
				slot5 = slot0.fashionToggle
				slot6 = false

				slot4(slot5, slot6)

				slot4 = triggerToggle
				slot5 = slot0.detailToggle
				slot6 = true

				slot4(slot5, slot6)
			end
		end
	end

	slot4 = setActive
	slot5 = slot0.npcFlagTF
	slot7 = slot1
	slot6 = slot1.isActivityNpc

	slot4(slot5, slot6(slot7))

	slot5 = slot0
	slot4 = slot0.setToggleEnable

	slot4(slot5)
end

slot0.setShip = slot7

function slot7(slot0)
	slot1 = slot0.upgradeToggle

	if slot1 then
		slot1 = SetActive
		slot2 = slot0.upgradeToggle
		slot3 = slot0.shipVO
		slot4 = slot3
		slot3 = slot3.isBluePrintShip
		slot3 = slot3(slot4)
		slot3 = not slot3

		slot1(slot2, slot3)
	end

	slot1 = slot0.intensifyToggle

	if slot1 then
		slot1 = SetActive
		slot2 = slot0.intensifyToggle
		slot3 = slot0.shipVO
		slot4 = slot3
		slot3 = slot3.isBluePrintShip
		slot3 = slot3(slot4)
		slot3 = not slot3

		slot1(slot2, slot3)
	end

	slot1 = slot0.remouldToggle

	if slot1 then
		SetActive(slot0.remouldToggle, not slot0.shipVO:isBluePrintShip() and pg.ship_data_trans[slot0.shipVO.groupId])
	end

	slot1 = slot0.technologyToggle

	if slot1 then
		slot1 = SetActive
		slot2 = slot0.technologyToggle
		slot3 = slot0.shipVO
		slot4 = slot3
		slot3 = slot3.isBluePrintShip

		slot1(slot2, slot3(slot4))
	end
end

slot0.setToggleEnable = slot7

function slot7(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "icon"
	slot5 = slot0.commanderTF
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = setActive
	slot4 = slot2
	slot5 = slot1

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "add"
	slot6 = slot0.commanderTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = setActive
	slot5 = slot3
	slot6 = not slot1

	slot4(slot5, slot6)

	if slot1 then
		slot4 = setImageSprite
		slot5 = slot2
		slot6 = LoadSprite
		slot7 = "QIcon/"
		slot9 = slot1
		slot8 = slot1.getPainting
		slot8 = slot8(slot9)
		slot7 = slot7 .. slot8
		slot6 = slot6(slot7)
		slot7 = true

		slot4(slot5, slot6, slot7)
	end

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.commanderTF

	function slot7()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipInfoMediator
		slot2 = slot2.ON_SEL_COMMANDER

		slot0(slot1, slot2)
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)
end

slot0.updateCommander = slot7

function slot7(slot0, slot1)
	slot0.skinList = slot1
end

slot0.setSkinList = slot7

function slot7(slot0)
	slot1 = slot0.shipVO
	slot2 = slot1
	slot1 = slot1.GetLockState
	slot1 = slot1(slot2)
	slot2 = slot0.shipVO
	slot2 = slot2.LOCK_STATE_UNLOCK

	if slot1 == slot2 then
		slot2 = setActive
		slot3 = slot0.lockBtn
		slot4 = true

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = slot0.unlockBtn
		slot4 = false

		slot2(slot3, slot4)
	else
		slot2 = slot0.shipVO
		slot2 = slot2.LOCK_STATE_LOCK

		if slot1 == slot2 then
			slot2 = setActive
			slot3 = slot0.lockBtn
			slot4 = false

			slot2(slot3, slot4)

			slot2 = setActive
			slot3 = slot0.unlockBtn
			slot4 = true

			slot2(slot3, slot4)
		end
	end
end

slot0.updateLock = slot7

function slot7(slot0, slot1)
	slot0.modPanel = slot1
end

slot0.setModPanel = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.initShip

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.initPages

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top"
	slot4 = slot0.common
	slot1 = slot1(slot2, slot3, slot4)
	slot0.topPanel = slot1
	slot1 = setAnchoredPosition
	slot2 = slot0.topPanel
	slot3 = {}
	slot4 = slot0.topPanel
	slot4 = slot4.rect
	slot4 = slot4.height
	slot3.y = slot4

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main"
	slot1 = slot1(slot2, slot3)
	slot2 = EquipmentSkinPanel
	slot2 = slot2.New
	slot3 = slot1.gameObject
	slot2 = slot2(slot3)
	slot0.equipmentSkinPanel = slot2
	slot2 = slot0.equipmentSkinPanel
	slot3 = slot2
	slot2 = slot2.attach
	slot4 = slot0

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.equipmentSkinPanel
	slot3 = slot3._go
	slot4 = true

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "custom_msgbox"
	slot2 = slot2(slot3, slot4)
	slot0.customMsgbox = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/bg/item_panel"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxItemPanel = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/bg/item_panel/items"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgboxItemContains = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "equipmenttpl"
	slot5 = slot0.msgboxItemContains
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxItemTpl = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/bg/item_panel/content"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxItemContent = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/bg/item_panel/content_num"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxItemContent1 = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/btns/cancel_btn"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxCancelBtn = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/btns/confirm_btn"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxConfirmBtn = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/bg/content"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBoxContent = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "frame/top/btnBack"
	slot5 = slot0.customMsgbox
	slot2 = slot2(slot3, slot4, slot5)
	slot0.msgBtnBack = slot2
	slot2 = SetActive
	slot3 = slot0.customMsgbox
	slot4 = false

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "hunting_range"
	slot2 = slot2(slot3, slot4)
	slot0.huntingRange = slot2
	slot2 = setActive
	slot3 = slot0.huntingRange
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = CanvasGroup
	slot2 = slot2(slot3, slot4(slot5))
	slot0.mainCanvasGroup = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "common"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = CanvasGroup
	slot2 = slot2(slot3, slot4(slot5))
	slot0.commonCanvasGroup = slot2
	slot2 = Input
	slot3 = false
	slot2.multiTouchEnabled = slot3
end

slot0.init = slot7

function slot7(slot0, slot1)
	function slot2()
		slot0 = slot0
		slot0 = slot0.awakenAni
		slot1 = slot0
		slot0 = slot0.SetActive
		slot2 = true

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = true
		slot0.awakenPlay = slot1
		slot0 = onButton
		slot1 = slot0
		slot2 = slot0
		slot2 = slot2.awakenAni

		function slot3()
			slot0 = slot0
			slot0 = slot0.awakenAni
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = "Animator"
			slot0 = slot0(slot1, slot2)
			slot1 = slot0
			slot0 = slot0.SetBool
			slot2 = "endFlag"
			slot3 = true

			slot0(slot1, slot2, slot3)
		end

		slot0(slot1, slot2, slot3)

		slot0 = tf
		slot1 = slot0
		slot1 = slot1.awakenAni
		slot0 = slot0(slot1)
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.BlurPanel
		slot3 = slot0
		slot3 = slot3.awakenAni

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.SetAsLastSibling

		slot1(slot2)

		slot1 = setText
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.findTF
		slot4 = "window/desc"
		slot5 = slot0
		slot5 = slot5.awakenAni
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = slot1

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.GetComponent
		slot3 = "DftAniEvent"
		slot1 = slot1(slot2, slot3)
		slot3 = slot1
		slot2 = slot1.SetEndEvent

		function slot4(slot0)
			slot1 = slot0
			slot1 = slot1.awakenAni
			slot2 = slot1
			slot1 = slot1.GetComponent
			slot3 = "Animator"
			slot1 = slot1(slot2, slot3)
			slot2 = slot1
			slot1 = slot1.SetBool
			slot3 = "endFlag"
			slot4 = false

			slot1(slot2, slot3, slot4)

			slot1 = pg
			slot1 = slot1.UIMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.UnblurPanel
			slot3 = slot0
			slot3 = slot3.awakenAni
			slot4 = slot0
			slot4 = slot4.common

			slot1(slot2, slot3, slot4)

			slot1 = slot0
			slot1 = slot1.awakenAni
			slot2 = slot1
			slot1 = slot1.SetActive
			slot3 = false

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = false
			slot1.awakenPlay = slot2
		end

		slot2(slot3, slot4)
	end

	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "AwakenCompleteWindows(Clone)"
	slot3 = slot3(slot4, slot5)

	if slot3 then
		slot4 = go
		slot5 = slot3
		slot4 = slot4(slot5)
		slot0.awakenAni = slot4
	end

	slot4 = slot0.awakenAni

	if not slot4 then
		slot4 = PoolMgr
		slot4 = slot4.GetInstance
		slot4 = slot4()
		slot5 = slot4
		slot4 = slot4.GetUI
		slot6 = "AwakenCompleteWindows"
		slot7 = true

		function slot8(slot0)
			slot2 = slot0
			slot1 = slot0.SetActive
			slot3 = true

			slot1(slot2, slot3)

			slot1 = slot0
			slot1.awakenAni = slot0
			slot1 = slot1

			slot1()
		end

		slot4(slot5, slot6, slot7, slot8)
	else
		slot4 = slot2

		slot4()
	end
end

slot0.showAwakenCompleteAni = slot7

function slot7(slot0, slot1)
	slot2 = true
	slot0.isShowCustomMsgBox = slot2
	slot2 = SetActive
	slot3 = slot0.customMsgbox
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setParent
	slot3 = slot0.customMsgbox
	slot4 = pg
	slot4 = slot4.UIMgr
	slot5 = slot4
	slot4 = slot4.GetInstance
	slot4 = slot4(slot5)
	slot4 = slot4.OverlayMain

	slot2(slot3, slot4)

	slot2 = slot1.items

	if not slot2 then
		setActive(slot0.msgBoxItemPanel, slot2)
		setActive(slot0.msgBoxContent, not (#slot1.items > 0))

		if #slot1.items > 0 then
			slot3 = slot1.items
			slot4 = slot0.msgboxItemContains
			slot4 = slot4.childCount
			slot5 = slot4 + 1
			slot6 = #slot3
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot9 = cloneTplTo
				slot10 = slot0.msgBoxItemTpl
				slot11 = slot0.msgboxItemContains

				slot9(slot10, slot11)
			end

			slot5 = slot0.msgboxItemContains
			slot4 = slot5.childCount
			slot5 = 1
			slot6 = slot4
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				SetActive(slot0.msgboxItemContains:GetChild(slot8 - 1), slot8 <= #slot3)

				slot10 = #slot3

				if slot8 <= slot10 then
					slot10 = slot3[slot8]
					slot11 = updateDrop
					slot12 = slot9
					slot13 = slot10

					slot11(slot12, slot13)

					slot11 = 0
					slot12 = slot10.type
					slot13 = DROP_TYPE_RESOURCE

					if slot12 == slot13 then
						slot12 = slot0.player
						slot13 = slot12
						slot12 = slot12.getResById
						slot14 = slot10.id
						slot12 = slot12(slot13, slot14)
						slot11 = slot12
					else
						slot12 = slot10.type
						slot13 = DROP_TYPE_ITEM

						if slot12 == slot13 then
							slot12 = getProxy
							slot13 = BagProxy
							slot12 = slot12(slot13)
							slot13 = slot12
							slot12 = slot12.getItemCountById
							slot14 = slot10.id
							slot12 = slot12(slot13, slot14)
							slot11 = slot12
						end
					end

					slot12 = slot10.count

					if slot11 < slot12 then
						slot12 = "<color=#D6341DFF>"
						slot13 = slot10.count
						slot14 = "</color>"
						slot12 = slot12 .. slot13 .. slot14

						if not slot12 then
							slot12 = "<color=#A9F548FF>"
							slot13 = slot10.count
							slot14 = "</color>"
							slot12 = slot12 .. slot13 .. slot14
						end
					end

					slot13 = setText
					slot15 = slot9
					slot14 = slot9.Find
					slot16 = "icon_bg/count"
					slot14 = slot14(slot15, slot16)
					slot15 = slot11
					slot16 = "/"
					slot17 = slot12
					slot15 = slot15 .. slot16 .. slot17

					slot13(slot14, slot15)
				end
			end

			setText(slot0.msgBoxItemContent, slot1.content or "")
			setText(slot0.msgBoxItemContent1, slot1.content1 or "")
		else
			setText(slot0.msgBoxContent, slot1.content or "")
		end
	end

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.msgBoxConfirmBtn

	function slot6()
		slot0 = slot0
		slot0 = slot0.onYes

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onYes

			slot0()
		else
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.hideCustomMsgBox

			slot0(slot1)
		end
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = SetActive
	slot4 = slot0.msgBoxCancelBtn
	slot5 = defaultValue
	slot6 = slot1.hideNO
	slot7 = false
	slot5 = slot5(slot6, slot7)
	slot5 = not slot5

	slot3(slot4, slot5)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.msgBoxCancelBtn

	function slot6()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		else
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.hideCustomMsgBox

			slot0(slot1)
		end
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.customMsgbox

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideCustomMsgBox

		slot0(slot1)
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.msgBtnBack

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideCustomMsgBox

		slot0(slot1)
	end

	slot7 = SFX_CANCEL

	slot3(slot4, slot5, slot6, slot7)
end

slot0.showCustomMsgBox = slot7

function slot7(slot0)
	slot1 = nil
	slot0.isShowCustomMsgBox = slot1
	slot1 = SetActive
	slot2 = slot0.customMsgbox
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setParent
	slot2 = slot0.customMsgbox
	slot3 = pg
	slot3 = slot3.UIMgr
	slot4 = slot3
	slot3 = slot3.GetInstance
	slot3 = slot3(slot4)
	slot3 = slot3.UIMain

	slot1(slot2, slot3)
end

slot0.hideCustomMsgBox = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/character"
	slot1 = slot1(slot2, slot3)
	slot0.shipInfo = slot1
	slot1 = setActive
	slot2 = slot0.shipInfo
	slot3 = true

	slot1(slot2, slot3)

	slot1 = rtf
	slot2 = slot0.shipInfo
	slot2 = slot2.parent
	slot1 = slot1(slot2)
	slot1 = slot1.rect
	slot1 = slot1.width
	slot1 = slot1 / 2
	slot1 = slot1 - 55
	slot0 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "painting"
	slot4 = slot0.shipInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot0.painting = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "common"
	slot1 = slot1(slot2, slot3)
	slot0.common = slot1
	slot1 = slot0.common
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "name/npc"
	slot1 = slot1(slot2, slot3)
	slot0.npcFlagTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "name"
	slot4 = slot0.common
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipName = slot1
	slot1 = setActive
	slot2 = slot0.shipName
	slot3 = true

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "star_tpl"
	slot4 = slot0.shipName
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipInfoStarTpl = slot1
	slot1 = setActive
	slot2 = slot0.shipInfoStarTpl
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "editFlag"
	slot4 = slot0.shipName
	slot1 = slot1(slot2, slot3, slot4)
	slot0.nameEditFlag = slot1
	slot1 = setActive
	slot2 = slot0.nameEditFlag
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "energy"
	slot4 = slot0.shipName
	slot1 = slot1(slot2, slot3, slot4)
	slot0.energyTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc"
	slot4 = slot0.energyTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.energyDescTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/desc"
	slot4 = slot0.energyTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.energyText = slot1
	slot1 = setActive
	slot2 = slot0.energyDescTF
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/detail_panel/intimacy"
	slot1 = slot1(slot2, slot3)
	slot0.intimacyTF = slot1
	slot1 = slot0.intimacyTF

	if not slot1 then
		slot2 = slot0
		slot1 = slot0.findTF
		slot3 = "intimacy"
		slot4 = slot0.shipName
		slot1 = slot1(slot2, slot3, slot4)
		slot0.intimacyTF = slot1
	end

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc"
	slot4 = slot0.intimacyTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.intimacyDescTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/desc"
	slot4 = slot0.intimacyTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.intimacyText = slot1
	slot1 = setActive
	slot2 = slot0.intimacyDescTF
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "heart"
	slot4 = slot0.intimacyTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.intimacyHeart = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/chat"
	slot1 = slot1(slot2, slot3)
	slot0.chat = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/chat/chatbgtop"
	slot1 = slot1(slot2, slot3)
	slot0.chatBg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/chat/chatbgtop/Text"
	slot1 = slot1(slot2, slot3)
	slot0.chatText = slot1
	slot1 = rtf
	slot2 = slot0.chat
	slot1 = slot1(slot2)
	slot2 = Vector3
	slot2 = slot2.New
	slot3 = 0
	slot4 = 0
	slot5 = 1
	slot2 = slot2(slot3, slot4, slot5)
	slot1.localScale = slot2
	slot1 = slot0.chatBg
	slot1 = slot1.sizeDelta
	slot1 = slot1.y
	slot0.initChatBgH = slot1
	slot1 = PlayerResource
	slot1 = slot1.New
	slot1 = slot1()
	slot0.resPanel = slot1
	slot1 = slot0.resPanel
	slot1 = slot1._tf
	slot2 = slot1
	slot1 = slot1.SetParent
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "common/top/playerRes"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "commander"
	slot4 = slot0.shipInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot0.commanderTF = slot1
	slot1 = setActive
	slot2 = slot0.commanderTF
	slot3 = false

	slot1(slot2, slot3)
end

slot0.initShip = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "background"
	slot1 = slot1(slot2, slot3)
	slot0.background = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main"
	slot1 = slot1(slot2, slot3)
	slot0.main = slot1
	slot1 = slot0.main
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = RectMask2D
	slot1 = slot1(slot2, slot3(slot4))
	slot0.mainMask = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "toggles"
	slot4 = slot0.common
	slot1 = slot1(slot2, slot3, slot4)
	slot0.toggles = slot1
	slot2 = slot0
	slot1 = slot0.initDetail

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.initEquipment

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.initFashion

	slot1(slot2)

	slot1 = slot0.contextData
	slot1 = slot1.page

	if not slot1 then
		slot1 = slot0
		slot1 = slot1.PAGE
		slot1 = slot1.DETAIL
	end

	slot0.page = slot1
	slot1 = slot0.page
	slot2 = slot0
	slot2 = slot2.PAGE
	slot2 = slot2.EQUIPMENT

	if slot1 == slot2 then
		slot1 = setAnchoredPosition
		slot2 = slot0.background
		slot3 = {
			x = 0
		}

		slot1(slot2, slot3)

		slot1 = setAnchoredPosition
		slot2 = slot0.shipInfo
		slot3 = {}
		slot4 = slot1
		slot3.x = slot4

		slot1(slot2, slot3)

		slot1 = setAnchoredPosition
		slot2 = slot0.chat
		slot3 = {
			x = 0
		}

		slot1(slot2, slot3)

		slot1 = "zhuangbei"
		slot0.paintingFrameName = slot1
	else
		slot1 = setAnchoredPosition
		slot2 = slot0.background
		slot3 = {
			x = -178
		}

		slot1(slot2, slot3)

		slot1 = slot0.page
		slot2 = slot0
		slot2 = slot2.PAGE
		slot2 = slot2.REMOULD

		if slot1 == slot2 then
			slot1 = setAnchoredPosition
			slot2 = slot0.shipInfo
			slot3 = {
				x = -700
			}

			slot1(slot2, slot3)

			slot1 = setActive
			slot2 = slot0.shipName
			slot3 = false

			slot1(slot2, slot3)
		else
			slot1 = setAnchoredPosition
			slot2 = slot0.shipInfo
			slot3 = {
				x = 275
			}

			slot1(slot2, slot3)
		end

		slot1 = setAnchoredPosition
		slot2 = slot0.chat
		slot3 = {
			x = -320
		}

		slot1(slot2, slot3)

		slot1 = "chuanwu"
		slot0.paintingFrameName = slot1
	end

	slot1 = setAnchoredPosition
	slot2 = slot0.detailPanel
	slot3 = {}
	slot4 = slot0.page
	slot5 = slot0
	slot5 = slot5.PAGE
	slot5 = slot5.DETAIL

	if slot4 == slot5 then
		slot4 = 0
	else
		slot4 = slot0.detailPanel
		slot4 = slot4.rect
		slot4 = slot4.width
	end

	slot3.x = slot4

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0.equipmentR
	slot3 = {}
	slot4 = slot0.page
	slot5 = slot0
	slot5 = slot5.PAGE
	slot5 = slot5.EQUIPMENT

	if slot4 == slot5 then
		slot4 = 0
	else
		slot4 = slot0.equipmentR
		slot4 = slot4.rect
		slot4 = slot4.width
	end

	slot3.x = slot4

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0.equipmentL
	slot3 = {}
	slot4 = slot0.page
	slot5 = slot0
	slot5 = slot5.PAGE
	slot5 = slot5.EQUIPMENT

	if slot4 == slot5 then
		slot4 = 0
	else
		slot4 = slot0.equipmentL
		slot4 = slot4.rect
		slot4 = slot4.width
		slot4 = -slot4
	end

	slot3.x = slot4

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0.stylePanel
	slot3 = {}
	slot4 = slot0.page
	slot5 = slot0
	slot5 = slot5.PAGE
	slot5 = slot5.FASHION

	if slot4 == slot5 then
		slot4 = 0
	else
		slot4 = slot0.stylePanel
		slot4 = slot4.rect
		slot4 = slot4.width
	end

	slot3.x = slot4

	slot1(slot2, slot3)
end

slot0.initPages = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/detail_panel"
	slot1 = slot1(slot2, slot3)
	slot0.detailPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "attrs"
	slot4 = slot0.detailPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrs = slot1
	slot1 = ShipDetailPanel
	slot1 = slot1.New
	slot2 = slot0.attrs
	slot3 = slot0
	slot1 = slot1(slot2, slot3)
	slot0.shipDetailPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipments"
	slot4 = slot0.detailPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipments = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipments"
	slot4 = slot0.equipments
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipmentsGrid = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipment_tpl"
	slot4 = slot0.equipments
	slot1 = slot1(slot2, slot3, slot4)
	slot0.detailEqupimentTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "empty_tpl"
	slot4 = slot0.equipments
	slot1 = slot1(slot2, slot3, slot4)
	slot0.emptyGridTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "lock_tpl"
	slot4 = slot0.equipments
	slot1 = slot1(slot2, slot3, slot4)
	slot0.lockGridTpl = slot1
	slot1 = slot0.detailPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "lock_btn"
	slot1 = slot1(slot2, slot3)
	slot0.lockBtn = slot1
	slot1 = slot0.detailPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "unlock_btn"
	slot1 = slot1(slot2, slot3)
	slot0.unlockBtn = slot1
	slot1 = slot0.detailPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "view_btn"
	slot1 = slot1(slot2, slot3)
	slot0.viewBtn = slot1
	slot1 = slot0.detailPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "evaluation_btn"
	slot1 = slot1(slot2, slot3)
	slot0.evaluationBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "changeName_panel"
	slot1 = slot1(slot2, slot3)
	slot0._renamePanel = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/queren"
	slot1 = slot1(slot2, slot3)
	slot0._renameConfirmBtn = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/cancel"
	slot1 = slot1(slot2, slot3)
	slot0._renameCancelBtn = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/revert_button"
	slot1 = slot1(slot2, slot3)
	slot0._renameRevert = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "maxlevel_tip"
	slot4 = slot0.attrs
	slot1 = slot1(slot2, slot3, slot4)
	slot0.maxlevel_tip = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "unload_all"
	slot4 = slot0.equipments
	slot1 = slot1(slot2, slot3, slot4)
	slot0.showRecordBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "record_panel"
	slot4 = slot0.detailPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.recordPanel = slot1
	slot1 = {}
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_1/record_btn"
	slot5 = slot0.recordPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot1[1] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_2/record_btn"
	slot5 = slot0.recordPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot1[2] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_3/record_btn"
	slot5 = slot0.recordPanel
	slot1[MULTRES] = slot2(slot3, slot4, slot5)
	slot0.recordBtns = slot1
	slot1 = {}
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_1/equipments"
	slot5 = slot0.recordPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot1[1] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_2/equipments"
	slot5 = slot0.recordPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot1[2] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_3/equipments"
	slot5 = slot0.recordPanel
	slot1[MULTRES] = slot2(slot3, slot4, slot5)
	slot0.recordEquipmentsTFs = slot1
	slot1 = {}
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_1/equip_btn"
	slot5 = slot0.recordPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot1[1] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_2/equip_btn"
	slot5 = slot0.recordPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot1[2] = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "container/record_3/equip_btn"
	slot5 = slot0.recordPanel
	slot1[MULTRES] = slot2(slot3, slot4, slot5)
	slot0.equipRecordBtns = slot1
	slot1 = setActive
	slot2 = slot0.recordPanel
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.detailEqupimentTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.emptyGridTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.lockGridTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.detailPanel
	slot3 = true

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.equipments

	function slot4()
		slot0 = triggerToggle
		slot1 = slot0
		slot1 = slot1.equipmentToggle
		slot2 = true

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.showRecordBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.isShowRecord

		if not slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.displayRecordPanel

			slot0(slot1)
		else
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.closeRecordPanel

			slot0(slot1)
		end

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.showRecordBtn
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "active"
		slot1 = slot1(slot2, slot3)
		slot2 = slot0
		slot2 = slot2.isShowRecord

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.showRecordBtn
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "inactive"
		slot1 = slot1(slot2, slot3)
		slot2 = slot0
		slot2 = slot2.isShowRecord
		slot2 = not slot2

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "unload_all"
	slot6 = slot0.recordPanel
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = Ship
		slot0 = slot0.canModifyShip
		slot1 = slot0
		slot1 = slot1.shipVO
		slot0, slot1 = slot0(slot1)

		if not slot0 then
			slot2 = pg
			slot2 = slot2.TipsMgr
			slot3 = slot2
			slot2 = slot2.GetInstance
			slot2 = slot2(slot3)
			slot3 = slot2
			slot2 = slot2.ShowTips
			slot4 = slot1

			slot2(slot3, slot4)
		else
			slot2 = pg
			slot2 = slot2.MsgboxMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.ShowMsgBox
			slot4 = {}
			slot5 = i18n
			slot6 = "ship_unequip_all_tip"
			slot5 = slot5(slot6)
			slot4.content = slot5

			function slot5()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ShipInfoMediator
				slot2 = slot2.UNEQUIP_FROM_SHIP_ALL
				slot3 = slot0
				slot3 = slot3.shipVO
				slot3 = slot3.id

				slot0(slot1, slot2, slot3)
			end

			slot4.onYes = slot5

			slot2(slot3, slot4)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.shipName

	function slot4()
		slot0 = slot0
		slot0 = slot0.shipVO
		slot0 = slot0.propose

		if not slot0 then
			return
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.shipName

	function slot4()
		slot0 = slot0
		slot0 = slot0.shipVO
		slot0 = slot0.propose

		if slot0 then
			slot0 = pg
			slot0 = slot0.PushNotificationMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.isEnableShipName
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = pg
				slot0 = slot0.TipsMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowTips
				slot2 = i18n
				slot3 = "word_rename_switch_tip"

				slot0(slot1, slot2(slot3))

				return
			end

			slot0 = slot0
			slot0 = slot0.shipVO
			slot0 = slot0.renameTime
			slot0 = slot0 + 2592000
			slot1 = pg
			slot1 = slot1.TimeMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.GetServerTime
			slot1 = slot1(slot2)
			slot0 = slot0 - slot1
			slot1 = 0

			if slot0 > slot1 then
				slot1 = math
				slot1 = slot1.floor
				slot2 = slot0 / 60
				slot2 = slot2 / 60
				slot2 = slot2 / 24
				slot1 = slot1(slot2)
				slot2 = 1

				if slot1 < slot2 then
					slot1 = 1
				end

				slot2 = pg
				slot2 = slot2.TipsMgr
				slot2 = slot2.GetInstance
				slot2 = slot2()
				slot3 = slot2
				slot2 = slot2.ShowTips
				slot4 = i18n
				slot5 = "word_rename_time_tip"
				slot6 = slot1

				slot2(slot3, slot4(slot5, slot6))
			else
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.DisplayRenamePanel
				slot3 = true

				slot1(slot2, slot3)
			end
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameConfirmBtn

	function slot4()
		slot0 = getInputText
		slot1 = findTF
		slot2 = slot0
		slot2 = slot2._renamePanel
		slot3 = "frame/name_field"
		slot0 = slot0(slot1(slot2, slot3))
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ShipInfoMediator
		slot3 = slot3.RENAME_SHIP
		slot4 = slot0
		slot4 = slot4.shipVO
		slot4 = slot4.id
		slot5 = slot0

		slot1(slot2, slot3, slot4, slot5)
	end

	slot5 = SFX_CONFIRM

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameRevert

	function slot4()
		slot0 = slot0
		slot0 = slot0.shipVO
		slot1 = slot0
		slot0 = slot0.isRemoulded
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = HXSet
			slot0 = slot0.hxLan
			slot1 = pg
			slot1 = slot1.ship_skin_template
			slot2 = slot0
			slot2 = slot2.shipVO
			slot3 = slot2
			slot2 = slot2.getRemouldSkinId
			slot2 = slot2(slot3)
			slot1 = slot1[slot2]
			slot1 = slot1.name
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = pg
				slot0 = slot0.ship_data_statistics
				slot1 = slot0
				slot1 = slot1.shipVO
				slot1 = slot1.configId
				slot0 = slot0[slot1]
				slot0 = slot0.name
			end
		end

		slot1 = setInputText
		slot2 = findTF
		slot3 = slot0
		slot3 = slot3._renamePanel
		slot4 = "frame/name_field"
		slot2 = slot2(slot3, slot4)
		slot3 = slot0

		slot1(slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameCancelBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.DisplayRenamePanel
		slot2 = false

		slot0(slot1, slot2)
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.initDetail = slot7

function slot7(slot0, slot1)
	slot0.isOpenRenamePanel = slot1
	slot2 = SetActive
	slot3 = slot0._renamePanel
	slot4 = slot1

	slot2(slot3, slot4)

	if slot1 then
		slot2 = pg
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0._renamePanel
		slot5 = false

		slot2(slot3, slot4, slot5)

		slot2 = getText
		slot4 = slot0
		slot3 = slot0.findTF
		slot5 = "name_mask/Text"
		slot6 = slot0.shipName
		slot2 = slot2(slot3(slot4, slot5, slot6))
		slot3 = setInputText
		slot4 = findTF
		slot5 = slot0._renamePanel
		slot6 = "frame/name_field"
		slot4 = slot4(slot5, slot6)
		slot5 = slot2

		slot3(slot4, slot5)
	else
		slot2 = pg
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.UnblurPanel
		slot4 = slot0._renamePanel
		slot5 = slot0._tf

		slot2(slot3, slot4, slot5)
	end
end

slot0.DisplayRenamePanel = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/equipment_r"
	slot1 = slot1(slot2, slot3)
	slot0.equipmentR = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/equipment_l"
	slot1 = slot1(slot2, slot3)
	slot0.equipmentL = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipment/equipment_r1"
	slot4 = slot0.equipmentR
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipmentR1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipment/equipment_r2"
	slot4 = slot0.equipmentR
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipmentR2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipment/equipment_r3"
	slot4 = slot0.equipmentR
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipmentR3 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipment/equipment_l1"
	slot4 = slot0.equipmentL
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipmentL1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipment/equipment_l2"
	slot4 = slot0.equipmentL
	slot1 = slot1(slot2, slot3, slot4)
	slot0.equipmentL2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "info"
	slot4 = slot0.equipmentR1
	slot1 = slot1(slot2, slot3, slot4)
	slot0.infoTplR = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "info"
	slot4 = slot0.equipmentL1
	slot1 = slot1(slot2, slot3, slot4)
	slot0.infoTplL = slot1
	slot1 = setActive
	slot2 = slot0.equipmentR
	slot3 = true

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.equipmentL
	slot3 = true

	slot1(slot2, slot3)

	slot1 = {}
	slot2 = slot0.equipmentR1
	slot1[1] = slot2
	slot2 = slot0.equipmentR2
	slot1[2] = slot2
	slot2 = slot0.equipmentR3
	slot1[3] = slot2
	slot2 = slot0.equipmentL1
	slot1[4] = slot2
	slot2 = slot0.equipmentL2
	slot1[5] = slot2
	slot0.equipmentPanels = slot1
	slot1 = {}
	slot0.equipmentNames = slot1
	slot1 = ipairs
	slot2 = slot0.equipmentPanels
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = IsNil
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "info"
		slot10 = slot5
		slot6 = slot6(slot7(slot8, slot9, slot10))

		if slot6 then
			slot6 = cloneTplTo
			slot7 = Ship
			slot7 = slot7.WEAPON_COUNT

			if slot4 <= slot7 then
				slot6(slot0.infoTplR or slot0.infoTplL, slot5, "info")
			end
		end

		slot6 = table
		slot6 = slot6.insert
		slot7 = slot0.equipmentNames
		slot8 = ScrollTxt
		slot8 = slot8.New
		slot10 = slot0
		slot9 = slot0.findTF
		slot11 = "info/cont/name_mask"
		slot12 = slot5
		slot9 = slot9(slot10, slot11, slot12)
		slot11 = slot0
		slot10 = slot0.findTF
		slot12 = "info/cont/name_mask/name"
		slot13 = slot5

		slot6(slot7, slot8(slot9, slot10(slot11, slot12, slot13)))
	end
end

slot0.initEquipment = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/style_display"
	slot1 = slot1(slot2, slot3)
	slot0.stylePanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "style_scroll"
	slot4 = slot0.stylePanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.styleScroll = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "view_port"
	slot4 = slot0.styleScroll
	slot1 = slot1(slot2, slot3, slot4)
	slot0.styleContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "style_card"
	slot4 = slot0.styleScroll
	slot1 = slot1(slot2, slot3, slot4)
	slot0.styleCard = slot1
	slot1 = setActive
	slot2 = slot0.stylePanel
	slot3 = true

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.styleCard
	slot3 = false

	slot1(slot2, slot3)

	slot1 = {}
	slot0.fashionSkins = slot1
	slot1 = {}
	slot0.fashionCellMap = slot1
	slot1 = 0
	slot0.fashionGroup = slot1
	slot1 = 0
	slot0.fashionSkinId = slot1
end

slot0.initFashion = slot7

function slot7(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getConfigTable
	slot2 = slot2(slot3)
	slot3 = slot0.shipVO
	slot4 = slot3
	slot3 = slot3.getName
	slot3 = slot3(slot4)
	slot4 = ScrollTxt
	slot4 = slot4.New
	slot5 = slot0.shipName
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "name_mask"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0.shipName
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "name_mask/Text"
	slot4 = slot4(slot5, slot6(slot7, slot8))
	slot0.scrollTxt = slot4
	slot4 = slot0.scrollTxt
	slot5 = slot4
	slot4 = slot4.setText
	slot6 = slot3

	slot4(slot5, slot6)

	slot4 = setText
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "english_name"
	slot8 = slot0.shipName
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot2.english_name

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.nameEditFlag
	slot6 = slot1.propose

	slot4(slot5, slot6)

	slot4 = GetSpriteFromAtlas
	slot5 = "energy"
	slot7 = slot1
	slot6 = slot1.getEnergyPrint
	slot4 = slot4(slot5, slot6(slot7))

	if not slot4 then
		slot5 = warning
		slot6 = "找不到疲劳"

		slot5(slot6)
	end

	slot5 = setImageSprite
	slot6 = slot0.energyTF
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = setActive
	slot6 = slot0.energyTF
	slot7 = true

	slot5(slot6, slot7)

	slot6 = slot1
	slot5 = slot1.getIntimacyDetail
	slot5, slot6, slot7 = slot5(slot6)
	slot8 = GetSpriteFromAtlas
	slot9 = "energy"
	slot10 = slot5
	slot8 = slot8(slot9, slot10)
	slot9 = setImageSprite
	slot10 = slot0.intimacyTF
	slot11 = slot8
	slot12 = true

	slot9(slot10, slot11, slot12)

	slot9 = setActive
	slot10 = slot0.intimacyTF
	slot11 = true

	slot9(slot10, slot11)

	slot9 = 1
	slot10 = LOCK_PROPOSE

	if not slot10 and slot6 <= slot7 then
		slot10 = slot0.shipVO
		slot10 = slot10.propose

		if not slot10 then
			slot10 = setActive
			slot11 = slot0.intimacyHeart
			slot12 = true

			slot10(slot11, slot12)

			slot9 = 0
		end
	else
		slot10 = setActive
		slot11 = slot0.intimacyHeart
		slot12 = false

		slot10(slot11, slot12)
	end

	slot10 = slot0.intimacyTF
	slot11 = slot10
	slot10 = slot10.GetComponent
	slot12 = typeof
	slot13 = Image
	slot10 = slot10(slot11, slot12(slot13))
	slot11 = Color
	slot11 = slot11.New
	slot12 = 1
	slot13 = 1
	slot14 = 1
	slot15 = slot9
	slot11 = slot11(slot12, slot13, slot14, slot15)
	slot10.color = slot11
	slot11 = slot0
	slot10 = slot0.findTF
	slot12 = "stars"
	slot13 = slot0.shipName
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = removeAllChildren
	slot12 = slot10

	slot11(slot12)

	slot12 = slot1
	slot11 = slot1.getStar
	slot11 = slot11(slot12)
	slot13 = slot1
	slot12 = slot1.getMaxStar
	slot12 = slot12(slot13)
	slot13 = 1
	slot14 = slot12
	slot15 = 1

	for slot16 = slot13, slot14, slot15 do
		slot17 = cloneTplTo
		slot18 = slot0.shipInfoStarTpl
		slot19 = slot10
		slot20 = "star_"
		slot21 = slot16
		slot20 = slot20 .. slot21

		slot17(slot18, slot19, slot20)
	end

	slot13 = slot12 - slot11
	slot14 = 1
	slot15 = slot13
	slot16 = 1

	for slot17 = slot14, slot15, slot16 do
		slot19 = slot10
		slot18 = slot10.GetChild
		slot20 = slot17 - 1
		slot18 = slot18(slot19, slot20)
		slot19 = setActive
		slot21 = slot18
		slot20 = slot18.Find
		slot22 = "star_tpl"
		slot20 = slot20(slot21, slot22)
		slot21 = false

		slot19(slot20, slot21)

		slot19 = setActive
		slot21 = slot18
		slot20 = slot18.Find
		slot22 = "empty_star_tpl"
		slot20 = slot20(slot21, slot22)
		slot21 = true

		slot19(slot20, slot21)
	end

	slot14 = slot0.page
	slot15 = slot0
	slot15 = slot15.PAGE
	slot15 = slot15.FASHION

	if slot14 ~= slot15 then
		slot15 = slot0
		slot14 = slot0.loadPainting
		slot16 = slot0.shipVO
		slot17 = slot16
		slot16 = slot16.getPainting

		slot14(slot15, slot16(slot17))

		slot15 = slot0
		slot14 = slot0.loadSkinBg
		slot16 = slot0.shipVO
		slot17 = slot16
		slot16 = slot16.rarity2bgPrintForGet
		slot16 = slot16(slot17)
		slot17 = slot0.shipVO
		slot18 = slot17
		slot17 = slot17.isBluePrintShip

		slot14(slot15, slot16, slot17(slot18))
	end

	slot14 = GetSpriteFromAtlas
	slot15 = "shiptype"
	slot17 = slot1
	slot16 = slot1.getShipType
	slot14 = slot14(slot15, slot16(slot17))

	if not slot14 then
		slot15 = warning
		slot16 = "找不到船形, shipConfigId: "
		slot17 = slot1.configId
		slot16 = slot16 .. slot17

		slot15(slot16)
	end

	slot15 = setImageSprite
	slot17 = slot0
	slot16 = slot0.findTF
	slot18 = "ship_type/type"
	slot19 = slot0.shipName
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = slot14
	slot18 = true

	slot15(slot16, slot17, slot18)
end

slot0.updatePreference = slot7

function slot7(slot0, slot1)
	slot2 = slot0.shipDetailPanel
	slot3 = slot2
	slot2 = slot2.flush
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = slot0.shipDetailPanel
	slot2 = slot2.tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "icons/hunting_range/bg"
	slot2 = slot2(slot3, slot4)
	slot3 = removeOnButton
	slot4 = slot2

	slot3(slot4)

	slot3 = table
	slot3 = slot3.contains
	slot4 = TeamType
	slot4 = slot4.SubShipType
	slot6 = slot1
	slot5 = slot1.getShipType
	slot3 = slot3(slot4, slot5(slot6))

	if slot3 then
		slot3 = onButton
		slot4 = slot0
		slot5 = slot2

		function slot6()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.displayHuntingRange
			slot2 = slot1

			slot0(slot1, slot2)
		end

		slot7 = SFX_PANEL

		slot3(slot4, slot5, slot6, slot7)
	end
end

slot0.updateDetail = slot7

function slot7(slot0, slot1)
	slot2 = setActive
	slot3 = slot0.huntingRange
	slot4 = true

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateHuntingRange
	slot4 = slot1
	slot6 = slot1
	slot5 = slot1.getHuntingLv

	slot2(slot3, slot4, slot5(slot6))

	slot2 = setText
	slot3 = slot0.huntingRange
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "frame/current_level"
	slot3 = slot3(slot4, slot5)
	slot4 = "Lv."
	slot6 = slot1
	slot5 = slot1.getHuntingLv
	slot5 = slot5(slot6)
	slot4 = slot4 .. slot5

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.huntingRange
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "frame/tips"
	slot3 = slot3(slot4, slot5)
	slot4 = i18n
	slot5 = "ship_hunting_level_tips"

	slot2(slot3, slot4(slot5))

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.huntingRange
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "frame/top/btnBack"
	slot4 = slot4(slot5, slot6)

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideHuntingRange

		slot0(slot1)
	end

	slot6 = SFX_CANCEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.huntingRange
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "frame/help"
	slot4 = slot4(slot5, slot6)

	function slot5()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowHelpWindow
		slot2 = {}
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.help_shipinfo_hunting
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = pg
	slot2 = slot2.UIMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.BlurPanel
	slot4 = slot0.huntingRange

	slot2(slot3, slot4)
end

slot0.displayHuntingRange = slot7

function slot7(slot0, slot1, slot2)
	slot3 = slot0.huntingRange
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "frame/range"
	slot3 = slot3(slot4, slot5)
	slot4 = 0
	slot5 = slot3.childCount
	slot5 = slot5 - 1
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot9 = slot3
		slot8 = slot3.GetChild
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot11 = slot0
		slot10 = slot0.findTF
		slot12 = "activate"
		slot13 = slot8
		slot10 = slot10(slot11, slot12, slot13)
		slot11 = false

		slot9(slot10, slot11)
	end

	_.each(slot4, function (slot0)
		if slot0:GetChild(slot0[1] * 7 + slot0[2] + math.floor(24.5)) and slot3 ~= 24 then
			setActive(slot1:findTF("activate", slot4), true)
		end
	end)
	setActive(slot5, slot2 > 1)
	setActive(slot0.huntingRange:Find("frame/next"), slot2 < #slot1:getConfig("hunting_range"))
	setText(slot0.huntingRange:Find("frame/level"), "Lv." .. slot2)

	slot7 = onButton
	slot8 = slot0
	slot9 = slot0.huntingRange:Find("frame/last")

	function slot10()
		if slot0 - 1 == 0 then
			slot0 = #slot1:getConfig("hunting_range")
		end

		slot2:updateHuntingRange(slot2.updateHuntingRange, slot0)
	end

	slot11 = SFX_PANEL

	slot7(slot8, slot9, slot10, slot11)

	slot7 = onButton
	slot8 = slot0
	slot9 = slot6

	function slot10()
		slot0 = slot0
		slot0 = slot0 + 1
		slot1 = slot1
		slot2 = slot1
		slot1 = slot1.getConfig
		slot3 = "hunting_range"
		slot1 = slot1(slot2, slot3)
		slot1 = #slot1
		slot1 = slot1 + 1

		if slot0 == slot1 then
			slot0 = 1
		end

		slot1 = slot2
		slot2 = slot1
		slot1 = slot1.updateHuntingRange
		slot3 = slot1
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot11 = SFX_PANEL

	slot7(slot8, slot9, slot10, slot11)
end

slot0.updateHuntingRange = slot7

function slot7(slot0)
	slot1 = setActive
	slot2 = slot0.huntingRange
	slot3 = false

	slot1(slot2, slot3)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0.huntingRange
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)
end

slot0.hideHuntingRange = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot4 = true
	slot0.inUpgradeAnim = slot4
	slot4 = slot0.shipDetailPanel
	slot5 = slot4
	slot4 = slot4.doLeveUpAnim
	slot6 = slot1
	slot7 = slot2

	function slot8()
		slot0 = slot0

		if slot0 then
			slot0 = slot0

			slot0()
		end

		slot0 = slot1
		slot1 = nil
		slot0.inUpgradeAnim = slot1
	end

	slot4(slot5, slot6, slot7, slot8)
end

slot0.doUpgradeMaxLeveAnim = slot7

function slot7(slot0, slot1)
	slot2 = removeAllChildren
	slot3 = slot0.equipmentsGrid

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.getActiveEquipments
	slot2 = slot2(slot3)
	slot3 = ipairs
	slot4 = slot1.equipments
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot2[slot6]
		slot9 = nil

		if slot7 then
			updateEquipment(slot9, slot7)
			onButton(slot0, slot9, function ()
				slot0:emit(slot1.ON_EQUIPMENT, {
					type = EquipmentInfoMediator.TYPE_SHIP,
					shipId = slot0.shipVO.id,
					pos = slot1.ON_EQUIPMENT
				})
			end, SFX_UI_DOCKYARD_EQUIPADD)
			setActive(cloneTplTo(slot0.detailEqupimentTpl, slot0.equipmentsGrid).Find(slot9, "icon_bg/tip"), slot7 and not slot8)
		else
			slot10 = cloneTplTo
			slot11 = slot0.emptyGridTpl
			slot12 = slot0.equipmentsGrid
			slot10 = slot10(slot11, slot12)
			slot9 = slot10
			slot10 = onButton
			slot11 = slot0
			slot12 = slot9

			function slot13()
				slot0 = triggerToggle
				slot1 = slot0
				slot1 = slot1.equipmentToggle
				slot2 = true

				slot0(slot1, slot2)
			end

			slot14 = SFX_UI_DOCKYARD_EQUIPADD

			slot10(slot11, slot12, slot13, slot14)
		end

		slot11 = slot0
		slot10 = slot0.updateEquipmentPanel
		slot12 = slot6
		slot13 = slot7
		slot14 = slot8

		slot10(slot11, slot12, slot13, slot14)
	end
end

slot0.updateEquipments = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot5 = findTF(slot4, "info")
	slot7 = findTF(slot5, "efficiency")

	setActive(slot5, slot2)
	setActive(slot6, not slot2)
	setActive(slot5:Find("icon_bg/tip"), slot2 and not slot3)

	slot8 = nil
	slot9, slot10, slot11 = pairs(slot0.shipVO.skills)

	for slot12, slot13 in slot9, slot10, slot11 do
		slot14 = ys
		slot14 = slot14.Battle
		slot14 = slot14.BattleDataFunction
		slot14 = slot14.GetBuffTemplate
		slot15 = slot13.id
		slot16 = slot13.level
		slot14 = slot14(slot15, slot16)
		slot15 = slot14.shipInfoScene

		if slot15 then
			slot15 = slot14.shipInfoScene
			slot15 = slot15.equip

			if slot15 then
				slot15 = slot14.shipInfoScene
				slot8 = slot15.equip
			end
		end
	end

	slot9 = findTF
	slot10 = slot4
	slot11 = "panel_title/type"
	slot9 = slot9(slot10, slot11)
	slot10 = findTF
	slot11 = slot4
	slot12 = "skin_icon"
	slot10 = slot10(slot11, slot12)

	if slot10 then
		slot11 = setActive
		slot12 = slot10

		if slot2 then
			slot14 = slot2
			slot13 = slot2.hasSkin
			slot13 = slot13(slot14)
		end

		slot11(slot12, slot13)
	end

	slot11 = setText
	slot12 = slot9
	slot13 = EquipType
	slot13 = slot13.Types2Title
	slot14 = slot1
	slot15 = slot0.shipVO
	slot15 = slot15.configId

	slot11(slot12, slot13(slot14, slot15))

	if slot2 then
		slot11 = setActive
		slot12 = slot7
		slot13 = slot2.config
		slot13 = slot13.type
		slot14 = EquipType
		slot14 = slot14.Equipment

		if slot13 ~= slot14 then
			slot13 = slot2.config
			slot13 = slot13.type
			slot14 = EquipType
			slot14 = slot14.Sonar

			if slot13 ~= slot14 then
				slot11(slot12, slot2.config.type ~= EquipType.AntiSubAircraft)

				slot11 = slot2.config.type
				slot12 = EquipType.Equipment

				if slot11 ~= slot12 then
					slot11 = pg
					slot11 = slot11.ship_data_statistics
					slot12 = slot0.shipVO
					slot12 = slot12.configId
					slot11 = slot11[slot12]
					slot12 = slot0.shipVO
					slot13 = slot12
					slot12 = slot12.getEquipProficiencyByPos
					slot14 = slot1
					slot12 = slot12(slot13, slot14)

					if slot12 then
						slot13 = slot12 * 100 or 0

						if slot8 then
							slot14 = 1
							slot15 = slot8.type

							if slot15 then
								slot15 = table
								slot15 = slot15.contains
								slot16 = slot8.type
								slot17 = slot2.config
								slot17 = slot17.type
								slot15 = slot15(slot16, slot17)

								if not slot15 then
									slot14 = slot14 * 0
								end
							end

							slot15 = slot8.nationality

							if slot15 then
								slot15 = table
								slot15 = slot15.contains
								slot16 = slot8.nationality
								slot17 = slot2.config
								slot17 = slot17.nationality
								slot15 = slot15(slot16, slot17)

								if not slot15 then
									slot14 = slot14 * 0
								end
							end

							if slot14 == 1 then
								slot15 = slot8.number
								slot13 = slot13 + slot15
							end
						end
					end

					slot14 = setButtonText
					slot15 = slot7
					slot16 = slot13
					slot17 = "%"
					slot16 = slot16 .. slot17

					slot14(slot15, slot16)
				end
			end
		end

		slot11 = updateEquipment
		slot12 = slot5
		slot13 = slot2

		slot11(slot12, slot13)

		slot11 = slot2.config
		slot11 = slot11.name
		slot12 = slot2.config
		slot12 = slot12.ammo_icon
		slot12 = slot12[1]

		if slot12 then
			slot12 = setActive
			slot13 = findTF
			slot14 = slot5
			slot15 = "cont/icon_ammo"
			slot13 = slot13(slot14, slot15)
			slot14 = true

			slot12(slot13, slot14)

			slot12 = setImageSprite
			slot13 = findTF
			slot14 = slot5
			slot15 = "cont/icon_ammo"
			slot13 = slot13(slot14, slot15)
			slot14 = GetSpriteFromAtlas
			slot15 = "ammo"
			slot16 = slot2.config
			slot16 = slot16.ammo_icon
			slot16 = slot16[1]

			slot12(slot13, slot14(slot15, slot16))
		else
			slot12 = setActive
			slot13 = findTF
			slot14 = slot5
			slot15 = "cont/icon_ammo"
			slot13 = slot13(slot14, slot15)
			slot14 = false

			slot12(slot13, slot14)
		end

		function slot12(slot0, slot1)
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.GetSkill
			slot2 = slot2(slot3)
			slot3 = setActive
			slot4 = slot0
			slot5 = slot2

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot1
			slot5 = not slot2

			slot3(slot4, slot5)

			if slot2 then
				slot3 = setText
				slot4 = findTF
				slot5 = slot0
				slot6 = "values/value"
				slot4 = slot4(slot5, slot6)
				slot5 = getSkillName
				slot6 = slot2.id

				slot3(slot4, slot5(slot6))

				slot3 = setText
				slot4 = findTF
				slot5 = slot0
				slot6 = "values/value_1"
				slot4 = slot4(slot5, slot6)
				slot5 = ""

				slot3(slot4, slot5)
			end
		end

		slot13 = findTF
		slot14 = slot5
		slot15 = "attrs/attr_3_1"
		slot13 = slot13(slot14, slot15)

		if slot13 then
			slot14 = setActive
			slot15 = slot13
			slot16 = slot2.config
			slot16 = slot16.type
			slot17 = EquipType
			slot17 = slot17.Equipment

			if slot16 == slot17 then
				slot14(slot15, slot1 <= 3)

				slot14 = slot0.equipmentNames
				slot14 = slot14[slot1]
				slot15 = slot14
				slot14 = slot14.setText
				slot16 = slot11

				slot14(slot15, slot16)

				slot15 = slot2
				slot14 = slot2.GetProperties
				slot14 = slot14(slot15)
				slot15 = false
				slot16 = 1
				slot17 = 4
				slot18 = 1

				for slot19 = slot16, slot17, slot18 do
					slot20 = findTF
					slot21 = slot5
					slot22 = "attrs/attr_"
					slot23 = slot19
					slot22 = slot22 .. slot23
					slot20 = slot20(slot21, slot22)

					if slot20 then
						slot21 = findTF
						slot22 = slot20
						slot23 = "panel"
						slot21 = slot21(slot22, slot23)
						slot22 = findTF
						slot23 = slot20
						slot24 = "lock"
						slot22 = slot22(slot23, slot24)
						slot23 = slot2.config
						slot23 = slot23.type
						slot24 = EquipType
						slot24 = slot24.Equipment

						if slot23 == slot24 then
							slot23 = 3

							if slot1 <= slot23 and slot19 == 3 then
								slot15 = true
								slot23 = setActive
								slot24 = slot13
								slot25 = true

								slot23(slot24, slot25)

								slot23 = SetActive
								slot24 = slot20
								slot25 = false

								slot23(slot24, slot25)

								slot23 = slot12
								slot24 = findTF
								slot25 = slot13
								slot26 = "panel"
								slot24 = slot24(slot25, slot26)
								slot25 = findTF
								slot26 = slot13
								slot27 = "lock"

								slot23(slot24, slot25(slot26, slot27))
							end
						else
							slot23 = slot2.config
							slot23 = slot23.type
							slot24 = EquipType
							slot24 = slot24.Equipment

							if slot23 == slot24 and slot19 == 3 then
								slot23 = SetActive
								slot24 = slot20
								slot25 = true

								slot23(slot24, slot25)

								slot23 = slot12
								slot24 = slot21
								slot25 = slot22

								slot23(slot24, slot25)
							elseif slot15 == true and slot19 == 4 then
								slot23 = SetActive
								slot24 = slot20
								slot25 = false

								slot23(slot24, slot25)
							else
								slot23 = SetActive
								slot24 = slot20
								slot25 = true

								slot23(slot24, slot25)

								slot23 = slot14[slot19]
								slot24 = setActive
								slot25 = slot21
								slot26 = slot23

								slot24(slot25, slot26)

								slot24 = setActive
								slot25 = slot22
								slot26 = not slot23

								slot24(slot25, slot26)

								if slot23 then
									slot24 = findTF
									slot25 = slot21
									slot26 = "tag"
									slot24 = slot24(slot25, slot26)
									slot25 = findTF
									slot26 = slot21
									slot27 = "values/value"
									slot25 = slot25(slot26, slot27)
									slot26 = findTF
									slot27 = slot21
									slot28 = "values/value_1"
									slot26 = slot26(slot27, slot28)
									slot27 = slot2.config
									slot27 = slot27.type
									slot28 = EquipType
									slot28 = slot28.Equipment

									if slot27 ~= slot28 then
										slot27 = slot23.type
										slot28 = AttributeType
										slot28 = slot28.Reload

										if slot27 == slot28 and slot19 == 4 then
											slot27 = slot0.shipVO
											slot28 = slot27
											slot27 = slot27.getWeaponCD
											slot29 = slot1
											slot27 = slot27(slot28, slot29)
											slot28 = setColorStr
											slot29 = slot27
											slot30 = "s"
											slot29 = slot29 .. slot30
											slot30 = COLOR_YELLOW
											slot28 = slot28(slot29, slot30)
											slot29 = setText
											slot30 = slot24
											slot31 = AttributeType
											slot31 = slot31.Type2Name
											slot32 = AttributeType
											slot32 = slot32.CD

											slot29(slot30, slot31(slot32))

											slot29 = setText
											slot30 = slot25
											slot31 = slot28

											slot29(slot30, slot31)

											slot29 = setText
											slot30 = slot26
											slot31 = i18n
											slot32 = "word_secondseach"

											slot29(slot30, slot31(slot32))
										end
									else
										slot27 = setText
										slot28 = slot24
										slot29 = AttributeType
										slot29 = slot29.Type2Name
										slot30 = slot23.type

										slot27(slot28, slot29(slot30))

										slot27 = setText
										slot28 = slot25
										slot29 = slot23.value

										slot27(slot28, slot29)

										slot27 = setText
										slot28 = slot26
										slot29 = ""

										slot27(slot28, slot29)
									end
								end
							end
						end
					end
				end

				slot16 = onButton
				slot17 = slot0
				slot18 = slot4

				function slot19()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = slot1
					slot2 = slot2.ON_EQUIPMENT
					slot3 = {}
					slot4 = EquipmentInfoMediator
					slot4 = slot4.TYPE_SHIP
					slot3.type = slot4
					slot4 = slot0
					slot4 = slot4.shipVO
					slot4 = slot4.id
					slot3.shipId = slot4
					slot4 = slot2
					slot3.pos = slot4

					slot0(slot1, slot2, slot3)
				end

				slot20 = SFX_UI_DOCKYARD_EQUIPADD

				slot16(slot17, slot18, slot19, slot20)
			end
		end
	else
		slot11 = onButton
		slot12 = slot0
		slot13 = slot4

		function slot14()
			slot0 = slot0
			slot0 = slot0.shipVO

			if slot0 then
				slot0 = Ship
				slot0 = slot0.canModifyShip
				slot1 = slot0
				slot1 = slot1.shipVO
				slot0, slot1 = slot0(slot1)

				if not slot0 then
					slot2 = pg
					slot2 = slot2.TipsMgr
					slot3 = slot2
					slot2 = slot2.GetInstance
					slot2 = slot2(slot3)
					slot3 = slot2
					slot2 = slot2.ShowTips
					slot4 = slot1

					slot2(slot3, slot4)

					return
				end

				slot2 = slot0
				slot3 = slot2
				slot2 = slot2.emit
				slot4 = ShipInfoMediator
				slot4 = slot4.ON_SELECT_EQUIPMENT
				slot5 = slot1

				slot2(slot3, slot4, slot5)
			end
		end

		slot15 = SFX_UI_DOCKYARD_EQUIPADD

		slot11(slot12, slot13, slot14, slot15)
	end
end

slot0.updateEquipmentPanel = slot7

function slot7(slot0, slot1)
	slot2 = ShipGroup
	slot2 = slot2.getSkinList
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = pg
	slot3 = slot3.ship_data_trans
	slot3 = slot3[slot1]

	if slot3 then
		slot3 = slot0.shipVO
		slot4 = slot3
		slot3 = slot3.isRemoulded
		slot3 = slot3(slot4)

		if not slot3 then
			slot3 = ShipGroup
			slot3 = slot3.GetGroupConfig
			slot4 = slot1
			slot3 = slot3(slot4)
			slot3 = slot3.trans_skin
			slot4 = #slot2
			slot5 = 1
			slot6 = -1

			for slot7 = slot4, slot5, slot6 do
				slot8 = slot2[slot7]
				slot8 = slot8.id

				if slot8 == slot3 then
					slot8 = table
					slot8 = slot8.remove
					slot9 = slot2
					slot10 = slot7

					slot8(slot9, slot10)

					break
				end
			end
		end
	end

	slot3 = #slot2
	slot4 = 1
	slot5 = -1

	for slot6 = slot3, slot4, slot5 do
		slot7 = slot2[slot6]
		slot8 = slot7.show_time

		if slot8 then
			slot8 = type
			slot9 = slot7.show_time
			slot8 = slot8(slot9)

			if slot8 == "string" then
				slot8 = slot7.show_time

				if slot8 ~= "stop" then
					slot8 = type
					slot9 = slot7.show_time
					slot8 = slot8(slot9)

					if slot8 == "table" then
						slot8 = pg
						slot8 = slot8.TimeMgr
						slot9 = slot8
						slot8 = slot8.GetInstance
						slot8 = slot8(slot9)
						slot9 = slot8
						slot8 = slot8.inTime
						slot10 = slot7.show_time
						slot8 = slot8(slot9, slot10)

						if not slot8 then
							slot8 = table
							slot8 = slot8.remove
							slot9 = slot2
							slot10 = slot6

							slot8(slot9, slot10)
						end
					end
				end
			end
		end
	end

	slot3 = PLATFORM_CODE
	slot4 = PLATFORM_CH

	if slot3 == slot4 then
		slot3 = pg
		slot3 = slot3.gameset
		slot3 = slot3.big_seven_old_skin_timestamp
		slot3 = slot3.key_value
		slot4 = #slot2
		slot5 = 1
		slot6 = -1

		for slot7 = slot4, slot5, slot6 do
			slot8 = slot2[slot7]
			slot9 = slot8.skin_type

			if slot9 == 3 then
				slot9 = slot0.shipVO
				slot9 = slot9.createTime

				if slot3 < slot9 then
					slot9 = table
					slot9 = slot9.remove
					slot10 = slot2
					slot11 = slot7

					slot9(slot10, slot11)
				end
			end
		end
	end

	return slot2
end

slot0.getGroupSkinList = slot7

function slot7(slot0)
	setActive(findTF(slot0.detailPanel, "fashion_toggle"), #slot0:getGroupSkinList(slot1) > 1)

	slot3 = slot0.page
	slot4 = slot0.PAGE.FASHION

	if slot3 == slot4 then
		slot3 = #slot2
		slot4 = 1

		if slot3 <= slot4 then
			return
		end
	end

	if false then
		slot3 = slot0.fashionGroup

		if slot3 ~= slot1 then
			slot0.fashionGroup = slot1
			slot0.fashionSkins = slot2
			slot3 = slot0.styleContainer
			slot3 = slot3.childCount
			slot4 = slot0.fashionSkins
			slot4 = #slot4
			slot4 = slot4 - 1
			slot5 = 1

			for slot6 = slot3, slot4, slot5 do
				slot7 = cloneTplTo
				slot8 = slot0.styleCard
				slot9 = slot0.styleContainer

				slot7(slot8, slot9)
			end

			slot3 = slot0.fashionSkins
			slot3 = #slot3
			slot4 = slot0.styleContainer
			slot4 = slot4.childCount
			slot4 = slot4 - 1
			slot5 = 1

			for slot6 = slot3, slot4, slot5 do
				slot7 = setActive
				slot8 = slot0.styleContainer
				slot9 = slot8
				slot8 = slot8.GetChild
				slot10 = slot6
				slot8 = slot8(slot9, slot10)
				slot9 = false

				slot7(slot8, slot9)
			end

			slot3 = ipairs
			slot4 = slot0.fashionSkins
			slot3, slot4, slot5 = slot3(slot4)

			for slot6, slot7 in slot3, slot4, slot5 do
				slot8 = slot0.fashionSkins
				slot8 = slot8[slot6]
				slot9 = slot0.styleContainer
				slot10 = slot9
				slot9 = slot9.GetChild
				slot11 = slot6 - 1
				slot9 = slot9(slot10, slot11)
				slot10 = slot0.fashionCellMap
				slot10 = slot10[slot9]

				if not slot10 then
					slot11 = ShipSkinCard
					slot11 = slot11.New
					slot12 = slot9.gameObject
					slot11 = slot11(slot12)
					slot10 = slot11
					slot11 = slot0.fashionCellMap
					slot11[slot9] = slot10
				end

				slot11 = slot0.shipVO
				slot12 = slot11
				slot11 = slot11.getRemouldSkinId
				slot11 = slot11(slot12)
				slot12 = slot8.id

				if slot11 == slot12 then
					slot11 = slot0.shipVO
					slot12 = slot11
					slot11 = slot11.isRemoulded
					slot11 = slot11(slot12)
				else
					slot11 = false

					if false then
						slot11 = true
					end
				end

				slot12 = slot0.shipVO
				slot13 = slot12
				slot12 = slot12.proposeSkinOwned
				slot14 = slot8
				slot12 = slot12(slot13, slot14)

				if not slot12 then
					slot12 = table
					slot12 = slot12.contains
					slot13 = slot0.skinList
					slot14 = slot8.id
					slot12 = slot12(slot13, slot14)

					if not slot12 and not slot11 then
						slot10:updateData(slot0.shipVO, slot8, slot8.skin_type == 3)
						slot10:updateUsing(slot0.shipVO.skinId == slot8.id)
						onButton(slot0, slot9, function ()
							if slot0.page ~= slot1.PAGE.FASHION then
								return
							end

							slot0.fashionSkinId = slot2.id

							slot0:updateFashionDetail(slot2)
							slot0.updateFashionDetail:loadPainting(slot2.painting)
							slot0.updateFashionDetail.loadPainting:loadSkinBg(slot0.shipVO:rarity2bgPrintForGet(), slot0.shipVO:isBluePrintShip())

							slot0, slot1, slot2 = ipairs(slot0.fashionSkins)

							for slot3, slot4 in slot0, slot1, slot2 do
								slot0.fashionCellMap[slot0.styleContainer:GetChild(slot3 - 1)]:updateSelected(slot4.id == slot0.fashionSkinId)
								slot6:updateUsing(slot0.shipVO.skinId == slot4.id)
							end
						end)
						setActive(slot9, true)
					end
				end
			end
		end
	end

	slot3 = slot0.fashionSkinId

	if slot3 == 0 then
		slot3 = slot0.shipVO
		slot3 = slot3.skinId
		slot0.fashionSkinId = slot3
	end

	slot3 = slot0.styleContainer
	slot4 = slot3
	slot3 = slot3.GetChild
	slot5 = 0
	slot3 = slot3(slot4, slot5)
	slot4 = ipairs
	slot5 = slot0.fashionSkins
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot8.id
		slot10 = slot0.fashionSkinId

		if slot9 == slot10 then
			slot9 = slot0.styleContainer
			slot10 = slot9
			slot9 = slot9.GetChild
			slot11 = slot7 - 1
			slot9 = slot9(slot10, slot11)
			slot3 = slot9

			break
		end
	end

	slot4 = triggerButton
	slot5 = slot3

	slot4(slot5)
end

slot0.updateFashion = slot7

function slot7(slot0)
	slot1 = 0
	slot0.fashionSkinId = slot1
end

slot0.resetFashion = slot7

function slot7(slot0, slot1)
	slot2 = slot0.fashionDetailWrapper

	if not slot2 then
		slot2 = {}
		slot3 = findTF
		slot4 = slot0.stylePanel
		slot5 = "style_desc/name_bg/name"
		slot3 = slot3(slot4, slot5)
		slot2.name = slot3
		slot3 = findTF
		slot4 = slot0.stylePanel
		slot5 = "style_desc/desc_frame/desc/Text"
		slot3 = slot3(slot4, slot5)
		slot2.descTxt = slot3
		slot3 = findTF
		slot4 = slot0.stylePanel
		slot5 = "style_desc/character"
		slot3 = slot3(slot4, slot5)
		slot2.character = slot3
		slot3 = findTF
		slot4 = slot0.stylePanel
		slot5 = "confirm_button"
		slot3 = slot3(slot4, slot5)
		slot2.confirm = slot3
		slot3 = findTF
		slot4 = slot0.stylePanel
		slot5 = "cancel_button"
		slot3 = slot3(slot4, slot5)
		slot2.cancel = slot3
		slot3 = findTF
		slot4 = slot2.confirm
		slot5 = "diamond"
		slot3 = slot3(slot4, slot5)
		slot2.diamond = slot3
		slot3 = findTF
		slot4 = slot2.confirm
		slot5 = "using"
		slot3 = slot3(slot4, slot5)
		slot2.using = slot3
		slot3 = findTF
		slot4 = slot2.confirm
		slot5 = "change"
		slot3 = slot3(slot4, slot5)
		slot2.change = slot3
		slot3 = findTF
		slot4 = slot2.confirm
		slot5 = "buy"
		slot3 = slot3(slot4, slot5)
		slot2.buy = slot3
		slot3 = findTF
		slot4 = slot2.confirm
		slot5 = "activity"
		slot3 = slot3(slot4, slot5)
		slot2.activity = slot3
		slot3 = findTF
		slot4 = slot2.confirm
		slot5 = "cantbuy"
		slot3 = slot3(slot4, slot5)
		slot2.cantbuy = slot3
		slot3 = "unknown"
		slot2.prefab = slot3
		slot0.fashionDetailWrapper = slot2
	end

	slot3 = setText
	slot4 = slot2.name
	slot5 = HXSet
	slot5 = slot5.hxLan
	slot6 = slot1.name

	slot3(slot4, slot5(slot6))

	slot3 = setText
	slot4 = slot2.descTxt
	slot5 = HXSet
	slot5 = slot5.hxLan
	slot6 = slot1.desc

	slot3(slot4, slot5(slot6))

	slot3 = slot2.descTxt
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Text
	slot3 = slot3(slot4, slot5(slot6))
	slot4 = slot3.text
	slot4 = #slot4
	slot5 = 50

	if slot4 > slot5 then
		slot4 = TextAnchor
		slot4 = slot4.MiddleLeft
		slot3.alignment = slot4
	else
		slot4 = TextAnchor
		slot4 = slot4.MiddleCenter
		slot3.alignment = slot4
	end

	slot4 = slot2.prefab
	slot5 = slot1.prefab

	if slot4 ~= slot5 then
		slot4 = slot2.character
		slot5 = slot4
		slot4 = slot4.Find
		slot6 = slot2.prefab
		slot4 = slot4(slot5, slot6)
		slot5 = IsNil
		slot6 = slot4
		slot5 = slot5(slot6)

		if not slot5 then
			slot5 = PoolMgr
			slot5 = slot5.GetInstance
			slot5 = slot5()
			slot6 = slot5
			slot5 = slot5.ReturnSpineChar
			slot7 = slot2.prefab
			slot8 = slot4.gameObject

			slot5(slot6, slot7, slot8)
		end

		slot5 = slot1.prefab
		slot2.prefab = slot5
		slot5 = slot2.prefab
		slot6 = PoolMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.GetSpineChar
		slot8 = slot5
		slot9 = true

		function slot10(slot0)
			slot1 = slot0
			slot1 = slot1.prefab
			slot2 = slot1

			if slot1 ~= slot2 then
				slot1 = PoolMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ReturnSpineChar
				slot3 = slot1
				slot4 = slot0

				slot1(slot2, slot3, slot4)
			else
				slot0.name = slot1
				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3(0.4, 0.4, 1)

				slot0.transform:SetParent(slot0.character, false)
				slot0:GetComponent(typeof(SpineAnimUI)):SetAction(slot2.show_skin or "stand", true)
			end
		end

		slot6(slot7, slot8, slot9, slot10)
	end

	slot4 = slot0.shipVO
	slot5 = slot4
	slot4 = slot4.getRemouldSkinId
	slot4 = slot4(slot5)
	slot5 = slot1.id

	if slot4 == slot5 then
		slot4 = slot0.shipVO
		slot5 = slot4
		slot4 = slot4.isRemoulded
		slot4 = slot4(slot5)
	else
		slot4 = false

		if false then
			slot4 = true
		end
	end

	slot5 = slot0.shipVO
	slot6 = slot5
	slot5 = slot5.proposeSkinOwned
	slot7 = slot1
	slot5 = slot5(slot6, slot7)

	if not slot5 then
		slot5 = ((table.contains(slot0.skinList, slot1.id) or slot4) and 1) or 0
		slot6 = slot1.shop_id
		slot7 = 0
		slot6 = pg.shop_template[slot1.shop_id] or nil

		if slot6 then
			slot7 = pg
			slot7 = slot7.TimeMgr
			slot7 = slot7.GetInstance
			slot7 = slot7()
			slot8 = slot7
			slot7 = slot7.inTime
			slot9 = slot6.time
			slot7 = slot7(slot8, slot9)
			slot7 = not slot7
		end

		slot8 = slot1.id == slot0.shipVO.skinId
		slot9 = slot1.id
		slot10 = slot0.shipVO:getConfig("skin_id")
		slot9 = 1
		slot9 = slot1.skin_type == 3

		setGray(slot2.confirm, false)
		setActive(slot2.using, false)
		setActive(slot2.change, false)
		setActive(slot2.buy, false)

		if slot8 then
			slot10 = setActive
			slot11 = slot2.using
			slot12 = true

			slot10(slot11, slot12)
		elseif slot9 then
			slot10 = setActive
			slot11 = slot2.change
			slot12 = true

			slot10(slot11, slot12)
		elseif slot6 then
			slot10 = setActive
			slot11 = slot2.buy
			slot12 = true

			slot10(slot11, slot12)

			slot10 = setGray
			slot11 = slot2.confirm
			slot12 = slot7

			slot10(slot11, slot12)
		else
			slot10 = setActive
			slot11 = slot2.change
			slot12 = true

			slot10(slot11, slot12)

			slot10 = setGray
			slot11 = slot2.confirm
			slot12 = true

			slot10(slot11, slot12)
		end
	end

	slot10 = onButton
	slot11 = slot0
	slot12 = slot2.confirm

	function slot13()
		slot0 = slot0

		if slot0 then
		else
			slot0 = slot1

			if slot0 then
				slot0 = slot2
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ShipInfoMediator
				slot2 = slot2.CHANGE_SKIN
				slot3 = slot2
				slot3 = slot3.shipVO
				slot3 = slot3.id
				slot4 = slot3
				slot4 = slot4.id
				slot5 = slot2
				slot5 = slot5.shipVO
				slot6 = slot5
				slot5 = slot5.getConfig
				slot7 = "skin_id"
				slot5 = slot5(slot6, slot7)

				if slot4 == slot5 then
					slot4 = 0
				else
					slot4 = slot3
					slot4 = slot4.id
				end

				slot0(slot1, slot2, slot3, slot4)
			else
				slot0 = slot4

				if slot0 then
					slot0 = slot5

					if slot0 then
						slot0 = pg
						slot0 = slot0.TipsMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowTips
						slot2 = i18n
						slot3 = "common_skin_out_of_stock"

						slot0(slot1, slot2(slot3))
					else
						slot0 = Goods
						slot0 = slot0.New
						slot1 = {}
						slot2 = slot4
						slot2 = slot2.id
						slot1.shop_id = slot2
						slot2 = Goods
						slot2 = slot2.TYPE_SKIN
						slot0 = slot0(slot1, slot2)
						slot2 = slot0
						slot1 = slot0.getConfig
						slot3 = "resource_num"
						slot1 = slot1(slot2, slot3)
						slot3 = slot0
						slot2 = slot0.isDisCount
						slot2 = slot2(slot3)

						if slot2 then
							slot4 = slot0
							slot3 = slot0.getConfig
							slot5 = "discount"
							slot3 = slot3(slot4, slot5)
							slot3 = 100 - slot3
							slot3 = slot3 / 100
							slot1 = slot1 * slot3
						end

						slot3 = pg
						slot3 = slot3.MsgboxMgr
						slot3 = slot3.GetInstance
						slot3 = slot3()
						slot4 = slot3
						slot3 = slot3.ShowMsgBox
						slot5 = {}
						slot6 = i18n
						slot7 = "text_buy_fashion_tip"
						slot8 = slot1
						slot9 = HXSet
						slot9 = slot9.hxLan
						slot10 = slot3
						slot10 = slot10.name
						slot6 = slot6(slot7, slot8, slot9(slot10))
						slot5.content = slot6

						function slot6()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = ShipInfoMediator
							slot2 = slot2.BUY_ITEM
							slot3 = slot1
							slot3 = slot3.id
							slot4 = 1

							slot0(slot1, slot2, slot3, slot4)
						end

						slot5.onYes = slot6

						slot3(slot4, slot5)
					end
				end
			end
		end
	end

	slot10(slot11, slot12, slot13)

	slot10 = onButton
	slot11 = slot0
	slot12 = slot2.cancel

	function slot13()
		slot0 = triggerToggle
		slot1 = slot0
		slot1 = slot1.detailToggle
		slot2 = true

		slot0(slot1, slot2)
	end

	slot10(slot11, slot12, slot13)
end

slot0.updateFashionDetail = slot7

function slot7(slot0)
	slot1 = slot0.fashionDetailWrapper

	if slot1 then
		slot1 = slot0.fashionDetailWrapper
		slot2 = slot1.character
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = slot1.prefab
		slot2 = slot2(slot3, slot4)
		slot3 = IsNil
		slot4 = slot2
		slot3 = slot3(slot4)

		if not slot3 then
			slot3 = PoolMgr
			slot3 = slot3.GetInstance
			slot3 = slot3()
			slot4 = slot3
			slot3 = slot3.ReturnSpineChar
			slot5 = slot1.prefab
			slot6 = slot2.gameObject

			slot3(slot4, slot5, slot6)
		end
	end

	slot1 = nil
	slot0.fashionDetailWrapper = slot1
	slot1 = pairs
	slot2 = slot0.fashionCellMap
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.clear

		slot6(slot7)
	end

	slot1 = {}
	slot0.fashionCellMap = slot1
	slot1 = {}
	slot0.fashionSkins = slot1
	slot1 = 0
	slot0.fashionGroup = slot1
	slot1 = 0
	slot0.fashionSkinId = slot1
end

slot0.clearFashion = slot7

function slot7(slot0)
	slot1 = GetOrAddComponent
	slot2 = slot0._tf
	slot3 = "EventTriggerListener"
	slot1 = slot1(slot2, slot3)
	slot2 = nil
	slot3 = 0
	slot4 = nil
	slot6 = slot1
	slot5 = slot1.AddBeginDragFunc

	function slot7()
		slot0 = 0
		slot1 = nil
	end

	slot5(slot6, slot7)

	slot6 = slot1
	slot5 = slot1.AddDragFunc

	function slot7(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.inPaintingView

		if not slot2 then
			slot2 = slot1.position
			slot3 = slot1

			if not slot3 then
				slot1 = slot2
			end

			slot3 = slot2.x
			slot4 = slot1
			slot4 = slot4.x
			slot3 = slot3 - slot4
			slot2 = slot3
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.moveUIPanels
			slot5 = slot0
			slot5 = slot5.page
			slot6 = math
			slot6 = slot6.abs
			slot7 = slot2

			slot3(slot4, slot5, slot6(slot7))
		end
	end

	slot5(slot6, slot7)

	slot6 = slot1
	slot5 = slot1.AddDragEndFunc

	function slot7(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.inPaintingView

		if not slot2 then
			slot2 = slot1
			slot3 = -50

			if slot2 < slot3 then
				slot2 = slot0
				slot3 = slot2
				slot2 = slot2.resetAllPage
				slot4 = slot0
				slot4 = slot4.page

				slot2(slot3, slot4)

				slot2 = slot0
				slot3 = slot2
				slot2 = slot2.emit
				slot4 = ShipInfoMediator
				slot4 = slot4.NEXTSHIP
				slot5 = -1

				slot2(slot3, slot4, slot5)
			else
				slot2 = slot1
				slot3 = 50

				if slot2 > slot3 then
					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.resetAllPage
					slot4 = slot0
					slot4 = slot4.page

					slot2(slot3, slot4)

					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.emit
					slot4 = ShipInfoMediator
					slot4 = slot4.NEXTSHIP

					slot2(slot3, slot4)
				else
					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.moveUIPanels
					slot4 = slot0
					slot4 = slot4.page
					slot5 = 0

					slot2(slot3, slot4, slot5)
				end
			end
		end
	end

	slot5(slot6, slot7)
end

slot0.addRingDragListenter = slot7

function slot7(slot0, slot1)
	slot2 = 0
	slot3 = 0.3
	slot4 = shiftPanel
	slot5 = slot0.topPanel
	slot6 = nil
	slot7 = 0
	slot8 = slot3
	slot9 = slot2
	slot10 = true
	slot11 = true
	slot12 = nil

	function slot13()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.dispatchUILoaded
		slot2 = true

		slot0(slot1, slot2)
	end

	slot4(slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)

	slot4 = topAnimation
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "bg/left"
	slot8 = slot0.topPanel
	slot5 = slot5(slot6, slot7, slot8)
	slot7 = slot0
	slot6 = slot0.findTF
	slot8 = "bg/right"
	slot9 = slot0.topPanel
	slot6 = slot6(slot7, slot8, slot9)
	slot8 = slot0
	slot7 = slot0.findTF
	slot9 = "bg/title_chara"
	slot10 = slot0.topPanel
	slot7 = slot7(slot8, slot9, slot10)
	slot9 = slot0
	slot8 = slot0.findTF
	slot10 = "bg/SHIPINFO"
	slot11 = slot0.topPanel
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = 0.27

	function slot10()
		slot0 = slot0

		if slot0 then
			slot0 = slot0

			slot0()
		end

		slot0 = slot1
		slot1 = nil
		slot0.tweens = slot1
	end

	slot4 = slot4(slot5, slot6, slot7, slot8, slot9, slot10)
	slot0.tweens = slot4
end

slot0.uiStartAnimating = slot7

function slot7(slot0)
	slot1 = shiftPanel
	slot2 = slot0.topPanel
	slot3 = nil
	slot4 = slot0.topPanel
	slot4 = slot4.rect
	slot4 = slot4.height
	slot5 = dur
	slot6 = delay
	slot7 = true
	slot8 = true
	slot9 = nil

	function slot10()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.dispatchUILoaded
		slot2 = true

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

slot0.uiExitAnimating = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.addRingDragListenter

	slot1(slot2)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "top/back"
	slot6 = slot0.common
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = slot0
		slot1 = true
		slot0.onClose = slot1
		slot0 = GetOrAddComponent
		slot1 = slot0
		slot1 = slot1._tf
		slot2 = typeof
		slot3 = CanvasGroup
		slot0 = slot0(slot1, slot2(slot3))
		slot1 = false
		slot0.interactable = slot1
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.uiExitAnimating

		slot1(slot2)

		slot1 = LeanTween
		slot1 = slot1.delayedCall
		slot2 = 0.3
		slot3 = System
		slot3 = slot3.Action

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_BACK

			slot0(slot1, slot2)
		end

		slot1(slot2, slot3(slot4))
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "main/detail_panel/attrs/icons"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowHelpWindow
		slot2 = {}
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.help_shipinfo_attr
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3, slot4)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.npcFlagTF

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowHelpWindow
		slot2 = {}
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.help_shipinfo_actnpc
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "help_btn"
	slot4 = slot0.common
	slot1 = slot1(slot2, slot3, slot4)
	slot0.helpBtn = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.page
		slot1 = slot1
		slot1 = slot1.PAGE
		slot1 = slot1.EQUIPMENT

		if slot0 == slot1 then
			slot0 = pg
			slot0 = slot0.MsgboxMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.ShowHelpWindow
			slot2 = {}
			slot3 = pg
			slot3 = slot3.gametip
			slot3 = slot3.help_shipinfo_equip
			slot3 = slot3.tip
			slot2.helps = slot3

			slot0(slot1, slot2)
		else
			slot0 = slot0
			slot0 = slot0.page
			slot1 = slot1
			slot1 = slot1.PAGE
			slot1 = slot1.DETAIL

			if slot0 == slot1 then
				slot0 = pg
				slot0 = slot0.MsgboxMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowHelpWindow
				slot2 = {}
				slot3 = pg
				slot3 = slot3.gametip
				slot3 = slot3.help_shipinfo_detail
				slot3 = slot3.tip
				slot2.helps = slot3

				slot0(slot1, slot2)
			else
				slot0 = slot0
				slot0 = slot0.page
				slot1 = slot1
				slot1 = slot1.PAGE
				slot1 = slot1.INTENSIFY

				if slot0 == slot1 then
					slot0 = pg
					slot0 = slot0.MsgboxMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.ShowHelpWindow
					slot2 = {}
					slot3 = pg
					slot3 = slot3.gametip
					slot3 = slot3.help_shipinfo_intensify
					slot3 = slot3.tip
					slot2.helps = slot3

					slot0(slot1, slot2)
				else
					slot0 = slot0
					slot0 = slot0.page
					slot1 = slot1
					slot1 = slot1.PAGE
					slot1 = slot1.UPGRADE

					if slot0 == slot1 then
						slot0 = pg
						slot0 = slot0.MsgboxMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowHelpWindow
						slot2 = {}
						slot3 = pg
						slot3 = slot3.gametip
						slot3 = slot3.help_shipinfo_upgrate
						slot3 = slot3.tip
						slot2.helps = slot3

						slot0(slot1, slot2)
					else
						slot0 = slot0
						slot0 = slot0.page
						slot1 = slot1
						slot1 = slot1.PAGE
						slot1 = slot1.FASHION

						if slot0 == slot1 then
							slot0 = pg
							slot0 = slot0.MsgboxMgr
							slot0 = slot0.GetInstance
							slot0 = slot0()
							slot1 = slot0
							slot0 = slot0.ShowHelpWindow
							slot2 = {}
							slot3 = pg
							slot3 = slot3.gametip
							slot3 = slot3.help_shipinfo_fashion
							slot3 = slot3.tip
							slot2.helps = slot3

							slot0(slot1, slot2)
						end
					end
				end
			end
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/equipment_r/equipment_skin_btn"
	slot1 = slot1(slot2, slot3)
	slot0.equipSkinBtn = slot1
	slot1 = setActive
	slot2 = slot0.equipSkinBtn
	slot3 = LOCK_EQUIP_SKIN
	slot3 = not slot3

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.equipSkinBtn

	function slot4()
		slot0 = Ship
		slot0 = slot0.canModifyShip
		slot1 = slot0
		slot1 = slot1.shipVO
		slot0, slot1 = slot0(slot1)

		if not slot0 then
			slot2 = pg
			slot2 = slot2.TipsMgr
			slot3 = slot2
			slot2 = slot2.GetInstance
			slot2 = slot2(slot3)
			slot3 = slot2
			slot2 = slot2.ShowTips
			slot4 = slot1

			slot2(slot3, slot4)

			return
		end

		slot2 = slot0
		slot2 = slot2.shipVO
		slot2 = slot2.equipments
		slot3 = _
		slot3 = slot3.all
		slot4 = slot1
		slot4 = slot4.UNLOCK_EQUPMENT_SKIN_POS

		function slot5(slot0)
			slot1 = slot0
			slot1 = slot1[slot0]
			slot1 = not slot1

			return slot1
		end

		slot3 = slot3(slot4, slot5)

		if slot3 then
			slot3 = pg
			slot3 = slot3.TipsMgr
			slot4 = slot3
			slot3 = slot3.GetInstance
			slot3 = slot3(slot4)
			slot4 = slot3
			slot3 = slot3.ShowTips
			slot5 = i18n
			slot6 = "equipment_skin_no_equipment_tip"

			slot3(slot4, slot5(slot6))

			return
		end

		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.switch2EquipmentSkinPage

		slot3(slot4)
	end

	slot1(slot2, slot3, slot4)

	slot1 = slot0.contextData
	slot1 = slot1.isInEquipmentSkinPage

	if slot1 then
		slot1 = slot0.contextData
		slot2 = nil
		slot1.isInEquipmentSkinPage = slot2
		slot1 = triggerButton
		slot2 = slot0.equipSkinBtn

		slot1(slot2)
	end

	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "detail_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.detailToggle = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "equpiment_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.equipmentToggle = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "upgrade_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.upgradeToggle = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "intensify_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.intensifyToggle = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "remould_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.remouldToggle = slot1
	slot1 = findTF
	slot2 = slot0.detailPanel
	slot3 = "fashion_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.fashionToggle = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "upgrade_toggle/mask"
	slot1 = slot1(slot2, slot3)
	slot0.upgradeMask = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "intensify_toggle/mask"
	slot1 = slot1(slot2, slot3)
	slot0.intensifyMask = slot1
	slot1 = findTF
	slot2 = slot0.toggles
	slot3 = "technology_toggle"
	slot1 = slot1(slot2, slot3)
	slot0.technologyToggle = slot1
	slot1 = setActive
	slot2 = slot0.intensifyMask
	slot3 = slot0.shipVO
	slot4 = slot3
	slot3 = slot3.isTestShip

	slot1(slot2, slot3(slot4))

	slot1 = setActive
	slot2 = slot0.upgradeMask
	slot3 = slot0.shipVO
	slot4 = slot3
	slot3 = slot3.isTestShip

	slot1(slot2, slot3(slot4))

	slot1 = {}
	slot2 = slot0.detailToggle
	slot1[1] = slot2
	slot2 = slot0.equipmentToggle
	slot1[2] = slot2
	slot2 = slot0.intensifyToggle
	slot1[3] = slot2
	slot2 = slot0.upgradeToggle
	slot1[4] = slot2
	slot2 = slot0.fashionToggle
	slot1[5] = slot2
	slot2 = slot0.remouldToggle
	slot1[6] = slot2
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.DETAIL
	slot2[1] = slot3
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.EQUIPMENT
	slot2[2] = slot3
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.INTENSIFY
	slot2[3] = slot3
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.UPGRADE
	slot2[4] = slot3
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.FASHION
	slot2[5] = slot3
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.REMOULD
	slot2[6] = slot3
	slot3 = onToggle
	slot4 = slot0
	slot5 = slot0.intensifyToggle

	function slot6(slot0)
		if slot0 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.switchToPage
			slot3 = slot1
			slot3 = slot3[3]

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShipInfoMediator
			slot3 = slot3.OPEN_INTENSIFY

			slot1(slot2, slot3)
		else
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShipInfoMediator
			slot3 = slot3.CLOSE_INTENSIFY

			slot1(slot2, slot3)
		end
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onToggle
	slot4 = slot0
	slot5 = slot0.remouldToggle

	function slot6(slot0)
		if slot0 then
			slot1 = LeanTween
			slot1 = slot1.isTweening
			slot2 = go
			slot3 = slot0
			slot3 = slot3.chat
			slot1 = slot1(slot2(slot3))

			if slot1 then
				slot1 = LeanTween
				slot1 = slot1.cancel
				slot2 = go
				slot3 = slot0
				slot3 = slot3.chat

				slot1(slot2(slot3))
			end

			slot1 = rtf
			slot2 = slot0
			slot2 = slot2.chat
			slot1 = slot1(slot2)
			slot2 = Vector3
			slot2 = slot2.New
			slot3 = 0
			slot4 = 0
			slot5 = 1
			slot2 = slot2(slot3, slot4, slot5)
			slot1.localScale = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.switchToPage
			slot3 = slot1
			slot3 = slot3[6]

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShipInfoMediator
			slot3 = slot3.OPEN_REMOULD

			slot1(slot2, slot3)
		else
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShipInfoMediator
			slot3 = slot3.CLOSE_REMOULD

			slot1(slot2, slot3)
		end
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.intensifyMask

	function slot6()
		slot0 = pg
		slot0 = slot0.TipsMgr
		slot1 = slot0
		slot0 = slot0.GetInstance
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.ShowTips
		slot2 = i18n
		slot3 = "test_ship_intensify_tip"

		slot0(slot1, slot2(slot3))
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.upgradeMask

	function slot6()
		slot0 = pg
		slot0 = slot0.TipsMgr
		slot1 = slot0
		slot0 = slot0.GetInstance
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.ShowTips
		slot2 = i18n
		slot3 = "test_ship_upgrade_tip"

		slot0(slot1, slot2(slot3))
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onToggle
	slot4 = slot0
	slot5 = slot0.upgradeToggle

	function slot6(slot0)
		if slot0 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.switchToPage
			slot3 = slot1
			slot3 = slot3[4]

			slot1(slot2, slot3)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShipInfoMediator
			slot3 = slot3.ON_UPGRADE

			slot1(slot2, slot3)
		else
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ShipInfoMediator
			slot3 = slot3.CLOSE_UPGRADE

			slot1(slot2, slot3)
		end
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = ipairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0.intensifyToggle

		if slot7 ~= slot8 then
			slot8 = slot0.upgradeToggle

			if slot7 ~= slot8 then
				slot8 = slot0.remouldToggle

				if slot7 ~= slot8 then
					slot8 = onToggle
					slot9 = slot0
					slot10 = slot7

					function slot11(slot0)
						if slot0 then
							slot1 = slot0
							slot2 = slot1
							slot1 = slot1.switchToPage
							slot3 = slot1
							slot4 = slot2
							slot3 = slot3[slot4]

							slot1(slot2, slot3)
						end
					end

					slot12 = SFX_PANEL

					slot8(slot9, slot10, slot11, slot12)
				end
			end
		end
	end

	slot3 = triggerToggle
	slot4 = slot0.page
	slot4 = slot4 + 1
	slot4 = slot1[slot4]
	slot5 = true

	slot3(slot4, slot5)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.lockBtn

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipInfoMediator
		slot2 = slot2.ON_LOCK
		slot3 = {}
		slot4 = slot0
		slot4 = slot4.shipVO
		slot4 = slot4.id
		slot3[1] = slot4
		slot4 = slot0
		slot4 = slot4.shipVO
		slot4 = slot4.LOCK_STATE_LOCK

		slot0(slot1, slot2, slot3, slot4)
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.unlockBtn

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipInfoMediator
		slot2 = slot2.ON_LOCK
		slot3 = {}
		slot4 = slot0
		slot4 = slot4.shipVO
		slot4 = slot4.id
		slot3[1] = slot4
		slot4 = slot0
		slot4 = slot4.shipVO
		slot4 = slot4.LOCK_STATE_UNLOCK

		slot0(slot1, slot2, slot3, slot4)
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.viewBtn

	function slot6()
		slot0 = Input
		slot1 = true
		slot0.multiTouchEnabled = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.paintView

		slot0(slot1)
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = tf
	slot6 = slot0.painting
	slot5 = slot5(slot6)

	function slot6()
		slot0 = slot0
		slot0 = slot0.page
		slot1 = slot1
		slot1 = slot1.PAGE
		slot1 = slot1.FASHION

		if slot0 ~= slot1 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.displayShipWord
			slot2 = "detail"

			slot0(slot1, slot2)
		end
	end

	slot3(slot4, slot5, slot6)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.evaluationBtn

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipInfoMediator
		slot2 = slot2.OPEN_EVALUATION
		slot3 = slot0
		slot3 = slot3.shipVO
		slot4 = slot3
		slot3 = slot3.getGroupId
		slot3 = slot3(slot4)
		slot4 = slot0
		slot4 = slot4.shipVO
		slot5 = slot4
		slot4 = slot4.isActivityNpc

		slot0(slot1, slot2, slot3, slot4(slot5))
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.energyTF

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.showEnergyDesc

		slot0(slot1)
	end

	slot3(slot4, slot5, slot6)

	slot3 = LOCK_PROPOSE

	if not slot3 then
		slot3 = onButton
		slot4 = slot0
		slot5 = slot0.intimacyTF

		function slot6()
			slot0 = slot0
			slot0 = slot0.shipVO
			slot1 = slot0
			slot0 = slot0.isActivityNpc
			slot0 = slot0(slot1)

			if slot0 then
				slot0 = pg
				slot0 = slot0.TipsMgr
				slot1 = slot0
				slot0 = slot0.GetInstance
				slot0 = slot0(slot1)
				slot1 = slot0
				slot0 = slot0.ShowTips
				slot2 = i18n
				slot3 = "npc_propse_tip"

				slot0(slot1, slot2(slot3))

				return
			end

			slot0 = slot0
			slot0 = slot0.chatFlag

			if slot0 then
				slot0 = slot0
				slot0 = slot0.chatani1Id

				if slot0 then
					slot0 = LeanTween
					slot0 = slot0.cancel
					slot1 = slot0
					slot1 = slot1.chatani1Id

					slot0(slot1)
				end

				slot0 = slot0
				slot0 = slot0.chatani2Id

				if slot0 then
					slot0 = LeanTween
					slot0 = slot0.cancel
					slot1 = slot0
					slot1 = slot1.chatani2Id

					slot0(slot1)
				end

				slot0 = LeanTween
				slot0 = slot0.scale
				slot1 = rtf
				slot2 = slot0
				slot2 = slot2.chat
				slot2 = slot2.gameObject
				slot1 = slot1(slot2)
				slot2 = Vector3
				slot2 = slot2.New
				slot3 = 0
				slot4 = 0
				slot5 = 1
				slot2 = slot2(slot3, slot4, slot5)
				slot3 = slot1
				slot0 = slot0(slot1, slot2, slot3)
				slot1 = slot0
				slot0 = slot0.setEase
				slot2 = LeanTweenType
				slot2 = slot2.easeInBack
				slot0 = slot0(slot1, slot2)
				slot1 = slot0
				slot0 = slot0.setOnComplete
				slot2 = System
				slot2 = slot2.Action

				function slot3()
					slot0 = slot0
					slot1 = nil
					slot0.chatFlag = slot1
				end

				slot0(slot1, slot2(slot3))
			end

			slot0 = slot0
			slot0 = slot0._currentVoice

			if slot0 then
				slot0 = slot0
				slot0 = slot0._currentVoice
				slot1 = slot0
				slot0 = slot0.Stop
				slot2 = true

				slot0(slot1, slot2)
			end

			slot0 = slot0
			slot0 = slot0.chatFlag

			if slot0 then
				slot0 = slot0
				slot0 = slot0.chatani1Id

				if slot0 then
					slot0 = LeanTween
					slot0 = slot0.cancel
					slot1 = slot0
					slot1 = slot1.chatani1Id

					slot0(slot1)
				end

				slot0 = slot0
				slot0 = slot0.chatani2Id

				if slot0 then
					slot0 = LeanTween
					slot0 = slot0.cancel
					slot1 = slot0
					slot1 = slot1.chatani2Id

					slot0(slot1)
				end

				slot0 = LeanTween
				slot0 = slot0.scale
				slot1 = rtf
				slot2 = slot0
				slot2 = slot2.chat
				slot2 = slot2.gameObject
				slot1 = slot1(slot2)
				slot2 = Vector3
				slot2 = slot2.New
				slot3 = 0
				slot4 = 0
				slot5 = 1
				slot2 = slot2(slot3, slot4, slot5)
				slot3 = slot1
				slot0 = slot0(slot1, slot2, slot3)
				slot1 = slot0
				slot0 = slot0.setEase
				slot2 = LeanTweenType
				slot2 = slot2.easeInBack
				slot0 = slot0(slot1, slot2)
				slot1 = slot0
				slot0 = slot0.setOnComplete
				slot2 = System
				slot2 = slot2.Action

				function slot3()
					slot0 = slot0
					slot1 = nil
					slot0.chatFlag = slot1
				end

				slot0(slot1, slot2(slot3))
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShipInfoMediator
			slot2 = slot2.PROPOSE
			slot3 = slot0
			slot3 = slot3.shipVO
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot3(slot4, slot5, slot6)
	end

	slot3 = pg
	slot3 = slot3.UIMgr
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3.OverlayMain
	slot5 = setParent
	slot6 = slot0.common
	slot7 = slot4

	slot5(slot6, slot7)

	slot6 = slot3
	slot5 = slot3.PartialBlur
	slot7 = slot0.toggles
	slot8 = true

	slot5(slot6, slot7, slot8)

	slot5 = slot0.page
	slot6 = slot0
	slot6 = slot6.PAGE
	slot6 = slot6.DETAIL

	if slot5 == slot6 then
		slot6 = slot0
		slot5 = slot0.displayShipWord
		slot8 = slot0
		slot7 = slot0.getInitmacyWords

		slot5(slot6, slot7(slot8))

		slot6 = slot0
		slot5 = slot0.checkFirstHelp

		slot5(slot6)

		slot6 = slot0
		slot5 = slot0.checkMaxLevelHelp

		slot5(slot6)
	end

	slot5 = onNextTick

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.uiStartAnimating

		slot0(slot1)
	end

	slot5(slot6)

	slot6 = slot0
	slot5 = slot0.setToggleEnable

	slot5(slot6)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot0.technologyToggle

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipInfoMediator
		slot2 = slot2.ON_TECHNOLOGY
		slot3 = slot0
		slot3 = slot3.shipVO

		slot0(slot1, slot2, slot3)
	end

	slot9 = SFX_PANEL

	slot5(slot6, slot7, slot8, slot9)
end

slot0.didEnter = slot7

function slot7(slot0)
	slot1 = slot0.inUpgradeAnim

	if slot1 then
		return
	end

	slot1 = slot0.awakenPlay

	if slot1 then
		return
	end

	slot1 = slot0.isOpenRenamePanel

	if slot1 then
		slot2 = slot0
		slot1 = slot0.DisplayRenamePanel
		slot3 = false

		slot1(slot2, slot3)

		return
	end

	slot1 = slot0.isShowCustomMsgBox

	if slot1 then
		slot2 = slot0
		slot1 = slot0.hideCustomMsgBox

		slot1(slot2)

		return
	end

	slot1 = isActive
	slot2 = slot0.huntingRange
	slot1 = slot1(slot2)

	if slot1 then
		slot2 = slot0
		slot1 = slot0.hideHuntingRange

		slot1(slot2)

		return
	end

	slot1 = slot0.inPaintingView

	if slot1 then
		slot2 = slot0
		slot1 = slot0.hidePaintView
		slot3 = true

		slot1(slot2, slot3)

		return
	end

	slot1 = playSoundEffect
	slot2 = SFX_CANCEL

	slot1(slot2)

	slot1 = triggerButton
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "top/back"
	slot5 = slot0.common

	slot1(slot2(slot3, slot4, slot5))
end

slot0.onBackPressed = slot7

function slot7(slot0)
	slot1 = slot0.energyTimer

	if slot1 then
		return
	end

	slot1 = setActive
	slot2 = slot0.energyDescTF
	slot3 = true

	slot1(slot2, slot3)

	slot1 = slot0.intimacyTimer

	if slot1 then
		slot1 = slot0.intimacyTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.intimacyTimer = slot1
	end

	slot1 = setActive
	slot2 = slot0.intimacyDescTF
	slot3 = false

	slot1(slot2, slot3)

	slot1 = slot0.shipVO
	slot2 = slot1
	slot1 = slot1.getEnergyPrint
	slot1, slot2 = slot1(slot2)
	slot3 = setText
	slot4 = slot0.energyText
	slot5 = i18n
	slot6 = slot2

	slot3(slot4, slot5(slot6))

	slot3 = Timer
	slot3 = slot3.New

	function slot4()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.energyDescTF
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.energyTimer
		slot1 = slot0
		slot0 = slot0.Stop

		slot0(slot1)

		slot0 = slot0
		slot1 = nil
		slot0.energyTimer = slot1
	end

	slot5 = 2
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot0.energyTimer = slot3
	slot3 = slot0.energyTimer
	slot4 = slot3
	slot3 = slot3.Start

	slot3(slot4)
end

slot0.showEnergyDesc = slot7

function slot7(slot0)
	slot1 = slot0.intimacyTimer

	if slot1 then
		return
	end

	slot1 = setActive
	slot2 = slot0.intimacyDescTF
	slot3 = true

	slot1(slot2, slot3)

	slot1 = slot0.energyTimer

	if slot1 then
		slot1 = slot0.energyTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.energyTimer = slot1
	end

	slot1 = setActive
	slot2 = slot0.energyDescTF
	slot3 = false

	slot1(slot2, slot3)

	slot1 = slot0.shipVO
	slot2 = slot1
	slot1 = slot1.getInitmacyInfo
	slot1, slot2 = slot1(slot2)
	slot3 = setText
	slot4 = slot0.intimacyText
	slot5 = i18n
	slot6 = slot2
	slot7 = slot0.shipVO
	slot8 = slot7
	slot7 = slot7.getConfigTable
	slot7 = slot7(slot8)
	slot7 = slot7.name

	slot3(slot4, slot5(slot6, slot7))

	slot3 = Timer
	slot3 = slot3.New

	function slot4()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.intimacyDescTF
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.intimacyTimer
		slot1 = slot0
		slot0 = slot0.Stop

		slot0(slot1)

		slot0 = slot0
		slot1 = nil
		slot0.intimacyTimer = slot1
	end

	slot5 = 2
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot0.intimacyTimer = slot3
	slot3 = slot0.intimacyTimer
	slot4 = slot3
	slot3 = slot3.Start

	slot3(slot4)
end

slot0.showIntimacyDesc = slot7

function slot7(slot0, slot1, slot2)
	if not slot2 then
		slot3 = slot0.chatFlag

		if not slot3 then
			slot3 = true
			slot0.chatFlag = slot3
			slot3 = slot0.chat
			slot4 = Vector3
			slot4 = slot4.zero
			slot3.localScale = slot4
			slot3 = setActive
			slot4 = slot0.chat
			slot5 = true

			slot3(slot4, slot5)

			slot3 = findTF
			slot4 = slot0.painting
			slot5 = "fitter"
			slot3 = slot3(slot4, slot5)
			slot3 = slot3.childCount
			slot4 = 0

			if slot3 > slot4 then
				slot3 = Ship
				slot3 = slot3.SetExpression
				slot4 = findTF
				slot5 = slot0.painting
				slot6 = "fitter"
				slot4 = slot4(slot5, slot6)
				slot5 = slot4
				slot4 = slot4.GetChild
				slot6 = 0
				slot4 = slot4(slot5, slot6)
				slot5 = slot0.paintingCode
				slot6 = slot1

				slot3(slot4, slot5, slot6)
			end

			slot3 = Ship
			slot3 = slot3.getWords
			slot4 = slot0.shipVO
			slot4 = slot4.skinId
			slot5 = slot1
			slot3, slot4 = slot3(slot4, slot5)
			slot5 = setText
			slot6 = slot0.chatText
			slot7 = slot3

			slot5(slot6, slot7)

			slot5 = slot0.chatText
			slot6 = slot5
			slot5 = slot5.GetComponent
			slot7 = typeof
			slot8 = Text
			slot5 = slot5(slot6, slot7(slot8))
			slot6 = setText
			slot7 = slot0.chatText
			slot8 = slot3

			slot6(slot7, slot8)

			slot6 = slot5.text
			slot6 = #slot6
			slot7 = CHAT_POP_STR_LEN

			if slot7 < slot6 then
				slot6 = TextAnchor
				slot6 = slot6.MiddleLeft
				slot5.alignment = slot6
			else
				slot6 = TextAnchor
				slot6 = slot6.MiddleCenter
				slot5.alignment = slot6
			end

			slot6 = slot5.preferredHeight
			slot6 = slot6 + 26
			slot7 = slot0.initChatBgH

			if slot7 < slot6 then
				slot7 = slot0.chatBg
				slot8 = Vector2
				slot8 = slot8.New
				slot9 = slot0.chatBg
				slot9 = slot9.sizeDelta
				slot9 = slot9.x
				slot10 = slot6
				slot8 = slot8(slot9, slot10)
				slot7.sizeDelta = slot8
			else
				slot7 = slot0.chatBg
				slot8 = Vector2
				slot8 = slot8.New
				slot9 = slot0.chatBg
				slot9 = slot9.sizeDelta
				slot9 = slot9.x
				slot10 = slot0.initChatBgH
				slot8 = slot8(slot9, slot10)
				slot7.sizeDelta = slot8
			end

			slot7 = slot0

			function slot8()
				slot0 = slot0
				slot0 = slot0.chatFlag

				if slot0 then
					slot0 = slot0
					slot0 = slot0.chatani1Id

					if slot0 then
						slot0 = LeanTween
						slot0 = slot0.cancel
						slot1 = slot0
						slot1 = slot1.chatani1Id

						slot0(slot1)
					end

					slot0 = slot0
					slot0 = slot0.chatani2Id

					if slot0 then
						slot0 = LeanTween
						slot0 = slot0.cancel
						slot1 = slot0
						slot1 = slot1.chatani2Id

						slot0(slot1)
					end
				end

				slot0 = slot0
				slot1 = LeanTween
				slot1 = slot1.scale
				slot2 = rtf
				slot3 = slot0
				slot3 = slot3.chat
				slot3 = slot3.gameObject
				slot2 = slot2(slot3)
				slot3 = Vector3
				slot3 = slot3.New
				slot4 = 1
				slot5 = 1
				slot6 = 1
				slot3 = slot3(slot4, slot5, slot6)
				slot4 = slot1
				slot1 = slot1(slot2, slot3, slot4)
				slot2 = slot1
				slot1 = slot1.setEase
				slot3 = LeanTweenType
				slot3 = slot3.easeOutBack
				slot1 = slot1(slot2, slot3)
				slot2 = slot1
				slot1 = slot1.setOnComplete
				slot3 = System
				slot3 = slot3.Action

				function slot4()
					slot0 = slot0
					slot1 = LeanTween
					slot1 = slot1.scale
					slot2 = rtf
					slot3 = slot0
					slot3 = slot3.chat
					slot3 = slot3.gameObject
					slot2 = slot2(slot3)
					slot3 = Vector3
					slot3 = slot3.New
					slot4 = 0
					slot5 = 0
					slot6 = 1
					slot3 = slot3(slot4, slot5, slot6)
					slot4 = slot1
					slot1 = slot1(slot2, slot3, slot4)
					slot2 = slot1
					slot1 = slot1.setEase
					slot3 = LeanTweenType
					slot3 = slot3.easeInBack
					slot1 = slot1(slot2, slot3)
					slot2 = slot1
					slot1 = slot1.setDelay
					slot3 = slot1
					slot4 = slot2
					slot3 = slot3 + slot4
					slot1 = slot1(slot2, slot3)
					slot2 = slot1
					slot1 = slot1.setOnComplete
					slot3 = System
					slot3 = slot3.Action

					function slot4()
						slot0 = slot0
						slot1 = nil
						slot0.chatFlag = slot1
					end

					slot1 = slot1(slot2, slot3(slot4))
					slot1 = slot1.uniqueId
					slot0.chatani2Id = slot1
				end

				slot1 = slot1(slot2, slot3(slot4))
				slot1 = slot1.uniqueId
				slot0.chatani1Id = slot1
			end

			if slot4 then
				function slot9()
					slot0 = slot0
					slot0 = slot0._currentVoice

					if slot0 then
						slot0 = slot0
						slot0 = slot0._currentVoice
						slot1 = slot0
						slot0 = slot0.Stop
						slot2 = true

						slot0(slot1, slot2)
					end

					slot0 = nil
					slot1 = slot0
					slot2 = playSoundEffect
					slot3 = slot1
					slot2, slot3 = slot2(slot3)
					slot0 = slot3
					slot1._currentVoice = slot2

					if slot0 then
						slot1 = long2int
						slot2 = slot0.length
						slot1 = slot1(slot2)
						slot1 = slot1 * 0.001
						slot2 = slot1
					end

					slot1 = slot3

					slot1()
				end

				slot10 = slot0.loadedCVBankName

				if slot10 then
					slot10 = slot9

					slot10()
				else
					slot10 = Ship
					slot10 = slot10.getCVKeyID
					slot11 = slot0.shipVO
					slot11 = slot11.skinId
					slot10 = slot10(slot11)

					function slot11()
						slot0 = pg
						slot0 = slot0.CriMgr
						slot0 = slot0.GetCVBankName
						slot1 = slot0
						slot0 = slot0(slot1)
						slot1 = slot1
						slot1 = slot1.exited

						if slot1 then
							slot1 = pg
							slot1 = slot1.CriMgr
							slot1 = slot1.UnloadCVBank
							slot2 = slot0

							slot1(slot2)
						else
							slot1 = slot2

							slot1()

							slot1 = slot1
							slot1 = slot1._currentVoice

							if slot1 then
								slot1 = slot1
								slot1.loadedCVBankName = slot0
							end
						end
					end

					slot12 = pg
					slot12 = slot12.CriMgr
					slot13 = slot12
					slot12 = slot12.LoadCV
					slot14 = slot10
					slot15 = slot11

					slot12(slot13, slot14, slot15)
				end
			else
				slot9 = slot8

				slot9()
			end
		end
	end
end

slot0.displayShipWord = slot7

function slot7(slot0)
	slot1 = slot0.chatFlag

	if slot1 then
		return
	end

	slot1 = slot0.chatTimer

	if slot1 then
		slot1 = slot0.chatTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.chatTimer = slot1
	end

	slot1 = Timer
	slot1 = slot1.New

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.displayShipWord
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.getInitmacyWords

		slot0(slot1, slot2(slot3))
	end

	slot3 = slot0
	slot4 = 1
	slot1 = slot1(slot2, slot3, slot4)
	slot0.chatTimer = slot1
	slot1 = slot0.chatTimer
	slot2 = slot1
	slot1 = slot1.Start

	slot1(slot2)
end

slot0.startChatTimer = slot7

function slot7(slot0, slot1)
	slot2 = slot0.page

	if slot2 == slot1 then
		return
	end

	slot2 = slot0.page
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.EQUIPMENT

	if slot2 == slot3 then
		slot2 = slot0.contextData
		slot2 = slot2.isInEquipmentSkinPage

		if slot2 then
			slot2 = triggerButton
			slot3 = slot0.equipSkinBtn

			slot2(slot3)
		end
	end

	slot2 = slot0.page
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.FASHION

	if slot2 == slot3 then
		slot3 = slot0
		slot2 = slot0.resetFashion

		slot2(slot3)
	end

	setActive(slot0.shipName, slot1 ~= slot0.PAGE.REMOULD)

	slot2 = slot0.PAGE.FASHION

	if slot1 ~= slot2 then
		slot3 = slot0
		slot2 = slot0.loadPainting
		slot4 = slot0.shipVO
		slot5 = slot4
		slot4 = slot4.getPainting

		slot2(slot3, slot4(slot5))

		slot3 = slot0
		slot2 = slot0.loadSkinBg
		slot4 = slot0.shipVO
		slot5 = slot4
		slot4 = slot4.rarity2bgPrintForGet
		slot4 = slot4(slot5)
		slot5 = slot0.shipVO
		slot6 = slot5
		slot5 = slot5.isBluePrintShip

		slot2(slot3, slot4, slot5(slot6))
	end

	setActive(slot0.helpBtn, slot1 ~= slot0.PAGE.FASHION)

	slot2 = slot0.page
	slot4 = slot0
	slot3 = slot0.switchPanel
	slot5 = slot0.detailPanel
	slot6 = slot0.detailPanel
	slot6 = slot6.rect
	slot6 = slot6.width
	slot7, slot8, slot9 = nil
	slot10 = true

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	slot4 = slot0
	slot3 = slot0.switchPanel
	slot5 = slot0.equipmentR
	slot6 = slot0.equipmentR
	slot6 = slot6.rect
	slot6 = slot6.width
	slot7, slot8, slot9 = nil
	slot10 = true

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	slot4 = slot0
	slot3 = slot0.switchPanel
	slot5 = slot0.equipmentL
	slot6 = slot0.equipmentL
	slot6 = slot6.rect
	slot6 = slot6.width
	slot6 = -slot6
	slot7, slot8, slot9 = nil
	slot10 = true

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	slot4 = slot0
	slot3 = slot0.switchPanel
	slot5 = slot0.stylePanel
	slot6 = slot0.stylePanel
	slot6 = slot6.rect
	slot6 = slot6.width
	slot7, slot8, slot9 = nil
	slot10 = true

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)

	slot3 = nil
	slot4 = slot0
	slot4 = slot4.PAGE
	slot4 = slot4.EQUIPMENT

	if slot1 == slot4 then
		slot5 = slot0
		slot4 = slot0.switchPanel
		slot6 = slot0.equipmentR
		slot7 = 0
		slot8, slot9 = nil
		slot10 = slot1

		slot4(slot5, slot6, slot7, slot8, slot9, slot10)

		slot5 = slot0
		slot4 = slot0.switchPanel
		slot6 = slot0.equipmentL
		slot7 = 0
		slot8, slot9 = nil
		slot10 = slot1

		slot4(slot5, slot6, slot7, slot8, slot9, slot10)

		slot5 = slot0
		slot4 = slot0.switchPanel
		slot6 = slot0.background
		slot7 = 0
		slot8 = nil
		slot9 = slot1
		slot9 = slot9 * 2

		slot4(slot5, slot6, slot7, slot8, slot9)

		slot5 = slot0
		slot4 = slot0.switchPanel
		slot6 = slot0.shipInfo
		slot7 = slot2
		slot8 = nil
		slot9 = slot1
		slot9 = slot9 * 2

		slot4(slot5, slot6, slot7, slot8, slot9)

		slot5 = slot0
		slot4 = slot0.switchPanel
		slot6 = slot0.chat
		slot7 = 0
		slot8 = nil
		slot9 = slot1
		slot9 = slot9 * 2
		slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
		slot3 = slot4
		slot5 = slot0
		slot4 = slot0.switchPainting
		slot6 = slot0.painting
		slot7 = "zhuangbei"
		slot8 = slot1
		slot8 = slot8 * 2

		slot4(slot5, slot6, slot7, slot8)
	else
		slot4 = slot0
		slot4 = slot4.PAGE
		slot4 = slot4.REMOULD

		if slot1 == slot4 then
			slot5 = slot0
			slot4 = slot0.switchPanel
			slot6 = slot0.shipInfo
			slot7 = slot2
			slot7 = -slot7
			slot8 = nil
			slot9 = slot1
			slot9 = slot9 * 2
			slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
			slot3 = slot4
			slot4 = nil
			slot0.chatFlag = slot4
		else
			slot4 = slot0
			slot4 = slot4.PAGE
			slot4 = slot4.DETAIL

			if slot1 == slot4 then
				slot5 = slot0
				slot4 = slot0.switchPanel
				slot6 = slot0.detailPanel
				slot7 = 0
				slot8, slot9 = nil
				slot10 = slot1

				slot4(slot5, slot6, slot7, slot8, slot9, slot10)
			else
				slot4 = slot0
				slot4 = slot4.PAGE
				slot4 = slot4.FASHION

				if slot1 == slot4 then
					slot5 = slot0
					slot4 = slot0.switchPanel
					slot6 = slot0.stylePanel
					slot7 = 0
					slot8, slot9 = nil
					slot10 = slot1

					slot4(slot5, slot6, slot7, slot8, slot9, slot10)
				end
			end

			slot5 = slot0
			slot4 = slot0.switchPanel
			slot6 = slot0.background
			slot7 = -178
			slot8 = nil
			slot9 = slot1
			slot9 = slot9 * 2

			slot4(slot5, slot6, slot7, slot8, slot9)

			slot5 = slot0
			slot4 = slot0.switchPanel
			slot6 = slot0.shipInfo
			slot7 = 275
			slot8 = nil
			slot9 = slot1
			slot9 = slot9 * 2

			slot4(slot5, slot6, slot7, slot8, slot9)

			slot5 = slot0
			slot4 = slot0.switchPanel
			slot6 = slot0.chat
			slot7 = -320
			slot8 = nil
			slot9 = slot1
			slot9 = slot9 * 2
			slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
			slot3 = slot4
			slot5 = slot0
			slot4 = slot0.switchPainting
			slot6 = slot0.painting
			slot7 = "chuanwu"
			slot8 = slot1
			slot8 = slot8 * 2

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	slot4 = slot0.contextData
	slot4.page = slot1
	slot0.page = slot1
	slot4 = slot0.page
	slot5 = slot0
	slot5 = slot5.PAGE
	slot5 = slot5.FASHION

	if slot4 == slot5 then
		slot5 = slot0
		slot4 = slot0.updateFashion

		slot4(slot5)
	else
		slot4 = slot0.page
		slot5 = slot0
		slot5 = slot5.PAGE
		slot5 = slot5.DETAIL

		if slot4 == slot5 then
			slot5 = slot0
			slot4 = slot0.checkMaxLevelHelp

			slot4(slot5)
		end
	end

	slot4 = setActive
	slot5 = slot0.npcFlagTF
	slot6 = slot0.page
	slot7 = slot0
	slot7 = slot7.PAGE
	slot7 = slot7.UPGRADE

	if slot6 ~= slot7 then
		slot6 = slot0.shipVO
		slot7 = slot6
		slot6 = slot6.isActivityNpc
		slot6 = slot6(slot7)
	else
		slot6 = false

		if false then
			slot6 = true
		end
	end

	slot4(slot5, slot6)

	if slot3 ~= nil then
		slot5 = slot3
		slot4 = slot3.setOnComplete
		slot6 = System
		slot6 = slot6.Action

		function slot7()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.checkFirstHelp

			slot0(slot1)
		end

		slot4(slot5, slot6(slot7))
	end
end

slot0.switchToPage = slot7

function slot7(slot0)
	slot1 = slot0.onClose

	if slot1 then
		return
	end

	slot1 = slot0.page
	slot2 = slot0
	slot2 = slot2.PAGE
	slot2 = slot2.EQUIPMENT

	if slot1 == slot2 then
		slot1 = checkFirstHelpShow
		slot2 = "help_shipinfo_equip"

		slot1(slot2)
	else
		slot1 = slot0.page
		slot2 = slot0
		slot2 = slot2.PAGE
		slot2 = slot2.DETAIL

		if slot1 == slot2 then
			slot1 = checkFirstHelpShow
			slot2 = "help_shipinfo_detail"

			slot1(slot2)
		else
			slot1 = slot0.page
			slot2 = slot0
			slot2 = slot2.PAGE
			slot2 = slot2.INTENSIFY

			if slot1 == slot2 then
				slot1 = checkFirstHelpShow
				slot2 = "help_shipinfo_intensify"

				slot1(slot2)
			end
		end
	end
end

slot0.checkFirstHelp = slot7

function slot7(slot0)
	slot1 = slot0.maxLevelHelpFlag

	if not slot1 then
		slot1 = slot0.shipVO

		if slot1 then
			slot1 = slot0.shipVO
			slot2 = slot1
			slot1 = slot1.isReachNextMaxLevel
			slot1 = slot1(slot2)

			if slot1 then
				slot1 = triggerButton
				slot2 = slot0.helpBtn
				slot3 = true

				slot1(slot2, slot3)

				slot2 = slot0
				slot1 = slot0.emit
				slot3 = ShipInfoMediator
				slot3 = slot3.MARK_MAXLEVELHELP_FLAG

				slot1(slot2, slot3)
			end
		end
	end
end

slot0.checkMaxLevelHelp = slot7

function slot7(slot0, slot1, slot2)
	slot3 = slot0
	slot3 = slot3.PAGE
	slot3 = slot3.EQUIPMENT

	if slot1 == slot3 then
		slot3 = setAnchoredPosition
		slot4 = slot0.equipmentR
		slot5 = {
			x = slot2
		}

		slot3(slot4, slot5)

		slot3 = setAnchoredPosition
		slot4 = slot0.equipmentL
		slot5 = {}
		slot6 = -slot2
		slot5.x = slot6

		slot3(slot4, slot5)
	else
		slot3 = slot0
		slot3 = slot3.PAGE
		slot3 = slot3.INTENSIFY

		if slot1 == slot3 then
			slot3 = slot0.modPanel

			if slot3 then
				slot3 = setAnchoredPosition
				slot4 = slot0.modPanel
				slot5 = {}
				slot6 = 620 + slot2
				slot5.x = slot6

				slot3(slot4, slot5)
			end
		else
			slot3 = slot0
			slot3 = slot3.PAGE
			slot3 = slot3.DETAIL

			if slot1 == slot3 then
				slot3 = setAnchoredPosition
				slot4 = slot0.detailPanel
				slot5 = {
					x = slot2
				}

				slot3(slot4, slot5)
			else
				slot3 = slot0
				slot3 = slot3.PAGE
				slot3 = slot3.FASHION

				if slot1 == slot3 then
					slot3 = setAnchoredPosition
					slot4 = slot0.stylePanel
					slot5 = {
						x = slot2
					}

					slot3(slot4, slot5)
				end
			end
		end
	end
end

slot0.moveUIPanels = slot7

function slot7(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.switchPanel
	slot4 = slot0.detailPanel
	slot5 = slot0.detailPanel
	slot5 = slot5.rect
	slot5 = slot5.width
	slot6, slot7, slot8 = nil
	slot9 = true

	slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	slot3 = slot0
	slot2 = slot0.switchPanel
	slot4 = slot0.equipmentR
	slot5 = slot0.equipmentR
	slot5 = slot5.rect
	slot5 = slot5.width
	slot6, slot7, slot8 = nil
	slot9 = true

	slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	slot3 = slot0
	slot2 = slot0.switchPanel
	slot4 = slot0.equipmentL
	slot5 = slot0.equipmentL
	slot5 = slot5.rect
	slot5 = slot5.width
	slot5 = -slot5
	slot6, slot7, slot8 = nil
	slot9 = true

	slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	slot3 = slot0
	slot2 = slot0.switchPanel
	slot4 = slot0.stylePanel
	slot5 = slot0.stylePanel
	slot5 = slot5.rect
	slot5 = slot5.width
	slot6, slot7, slot8 = nil
	slot9 = true

	slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	slot2 = slot0
	slot2 = slot2.PAGE
	slot2 = slot2.EQUIPMENT

	if slot1 == slot2 then
		slot3 = slot0
		slot2 = slot0.switchPanel
		slot4 = slot0.equipmentR
		slot5 = 0
		slot6, slot7 = nil
		slot8 = slot1

		slot2(slot3, slot4, slot5, slot6, slot7, slot8)

		slot3 = slot0
		slot2 = slot0.switchPanel
		slot4 = slot0.equipmentL
		slot5 = 0
		slot6, slot7 = nil
		slot8 = slot1

		slot2(slot3, slot4, slot5, slot6, slot7, slot8)
	else
		slot2 = slot0
		slot2 = slot2.PAGE
		slot2 = slot2.DETAIL

		if slot1 == slot2 then
			slot3 = slot0
			slot2 = slot0.switchPanel
			slot4 = slot0.detailPanel
			slot5 = 0
			slot6, slot7 = nil
			slot8 = slot1

			slot2(slot3, slot4, slot5, slot6, slot7, slot8)
		else
			slot2 = slot0
			slot2 = slot2.PAGE
			slot2 = slot2.FASHION

			if slot1 == slot2 then
				slot3 = slot0
				slot2 = slot0.switchPanel
				slot4 = slot0.stylePanel
				slot5 = 0
				slot6, slot7 = nil
				slot8 = slot1

				slot2(slot3, slot4, slot5, slot6, slot7, slot8)
			end
		end
	end
end

slot0.resetAllPage = slot7

function slot7(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = defaultValue
	slot8 = slot4
	slot9 = slot0
	slot7 = slot7(slot8, slot9)
	slot4 = slot7

	if slot6 then
		slot7 = LeanTween
		slot7 = slot7.cancel
		slot8 = go
		slot9 = slot1

		slot7(slot8(slot9))
	end

	slot7 = Vector3
	slot7 = slot7.New
	slot8 = tf
	slot9 = slot1
	slot8 = slot8(slot9)
	slot8 = slot8.localPosition
	slot8 = slot8.x
	slot9 = tf
	slot10 = slot1
	slot9 = slot9(slot10)
	slot9 = slot9.localPosition
	slot9 = slot9.y
	slot10 = tf
	slot11 = slot1
	slot10 = slot10(slot11)
	slot10 = slot10.localPosition
	slot10 = slot10.z
	slot7 = slot7(slot8, slot9, slot10)

	if slot2 then
		slot7.x = slot2
	end

	if slot3 then
		slot7.y = slot3
	end

	slot8 = LeanTween
	slot8 = slot8.move
	slot9 = rtf
	slot10 = slot1
	slot9 = slot9(slot10)
	slot10 = slot7
	slot11 = slot4
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = slot8
	slot8 = slot8.setEase
	slot10 = LeanTweenType
	slot10 = slot10.easeInOutSine
	slot8 = slot8(slot9, slot10)

	if slot5 then
		slot10 = slot8
		slot9 = slot8.setDelay
		slot11 = slot5

		slot9(slot10, slot11)
	end

	return slot8
end

slot0.switchPanel = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot0.paintingFrameName = slot2 or ""
	slot4 = GetOrAddComponent
	slot5 = findTF
	slot6 = slot1
	slot7 = "fitter"
	slot5 = slot5(slot6, slot7)
	slot6 = "PaintingScaler"
	slot4 = slot4(slot5, slot6)
	slot6 = slot4
	slot5 = slot4.Snapshoot

	slot5(slot6)

	slot5 = slot0.paintingFrameName
	slot4.FrameName = slot5
	slot5 = LeanTween
	slot5 = slot5.value
	slot6 = go
	slot7 = slot1
	slot6 = slot6(slot7)
	slot7 = 0
	slot8 = 1
	slot9 = slot3
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot6 = slot5
	slot5 = slot5.setOnUpdate
	slot7 = System
	slot7 = slot7.Action_float

	function slot8(slot0)
		slot1 = slot0
		slot1.Tween = slot0
	end

	slot5 = slot5(slot6, slot7(slot8))
	slot6 = slot5
	slot5 = slot5.setEase
	slot7 = LeanTweenType
	slot7 = slot7.easeInOutSine
	slot5 = slot5(slot6, slot7)

	return slot5
end

slot0.switchPainting = slot7

function slot7(slot0, slot1)
	slot2 = slot0.paintingCode

	if slot2 ~= slot1 then
		slot2 = slot0.paintingCode

		if slot2 then
			slot2 = retPaintingPrefab
			slot3 = slot0.painting
			slot4 = slot0.paintingCode

			slot2(slot3, slot4)
		end

		slot0.paintingCode = slot1
		slot2 = slot0.paintingCode

		if slot2 then
			slot2 = setPaintingPrefabAsync
			slot3 = slot0.painting
			slot4 = slot0.paintingCode
			slot5 = slot0.paintingFrameName

			slot2(slot3, slot4, slot5)
		end
	end
end

slot0.loadPainting = slot7

function slot7(slot0, slot1, slot2)
	slot3 = slot0.shipSkinBg

	if slot3 == slot1 then
		slot3 = slot0.isDesign

		if slot3 ~= slot2 then
			slot0.shipSkinBg = slot1
			slot0.isDesign = slot2
			slot3 = slot0.isDesign

			if slot3 then
				slot3 = slot0.designBg

				if not slot3 then
					slot3 = PoolMgr
					slot3 = slot3.GetInstance
					slot3 = slot3()
					slot4 = slot3
					slot3 = slot3.GetUI
					slot5 = "raritydesign5"
					slot6 = true

					function slot7(slot0)
						slot1 = slot0
						slot1.designBg = slot0
						slot1 = slot0.transform
						slot2 = slot1
						slot1 = slot1.SetParent
						slot3 = slot0
						slot3 = slot3._tf
						slot4 = false

						slot1(slot2, slot3, slot4)

						slot1 = slot0.transform
						slot2 = Vector3
						slot3 = 1
						slot4 = 1
						slot5 = 1
						slot2 = slot2(slot3, slot4, slot5)
						slot1.localPosition = slot2
						slot1 = slot0.transform
						slot2 = Vector3
						slot3 = 1
						slot4 = 1
						slot5 = 1
						slot2 = slot2(slot3, slot4, slot5)
						slot1.localScale = slot2
						slot1 = slot0.transform
						slot2 = slot1
						slot1 = slot1.SetSiblingIndex
						slot3 = 1

						slot1(slot2, slot3)

						slot1 = setActive
						slot2 = slot0
						slot3 = true

						slot1(slot2, slot3)
					end

					slot3(slot4, slot5, slot6, slot7)
				else
					slot3 = setActive
					slot4 = slot0.designBg
					slot5 = true

					slot3(slot4, slot5)
				end
			else
				slot3 = slot0.designBg

				if slot3 then
					slot3 = setActive
					slot4 = slot0.designBg
					slot5 = slot0.isDesign

					slot3(slot4, slot5)
				end
			end

			slot3 = GetSpriteFromAtlasAsync
			slot4 = "bg/star_level_bg_"
			slot5 = slot1
			slot4 = slot4 .. slot5
			slot5 = ""

			function slot6(slot0)
				slot1 = slot0
				slot1 = slot1.exited

				if not slot1 then
					slot1 = slot0
					slot1 = slot1.shipSkinBg
					slot2 = slot1

					if slot1 == slot2 then
						slot1 = setImageSprite
						slot2 = slot0
						slot2 = slot2.background
						slot3 = slot0

						slot1(slot2, slot3)
					end
				end
			end

			slot3(slot4, slot5, slot6)
		end
	end
end

slot0.loadSkinBg = slot7

function slot7(slot0)
	slot1 = slot0.shipVO
	slot2 = slot1
	slot1 = slot1.getIntimacyLevel
	slot1 = slot1(slot2)
	slot2 = Mathf
	slot2 = slot2.Clamp
	slot3 = slot1
	slot4 = 1
	slot5 = 5
	slot2 = slot2(slot3, slot4, slot5)
	slot1 = slot2
	slot2 = "feeling"
	slot3 = slot1
	slot2 = slot2 .. slot3

	return slot2
end

slot0.getInitmacyWords = slot7

function slot7(slot0)
	slot1 = true
	slot0.inPaintingView = slot1
	slot1 = {}
	slot2 = slot0._tf
	slot2 = slot2.childCount
	slot3 = 0

	while slot2 > slot3 do
		slot4 = slot0._tf
		slot5 = slot4
		slot4 = slot4.GetChild
		slot6 = slot3
		slot4 = slot4(slot5, slot6)
		slot5 = slot4.gameObject
		slot5 = slot5.activeSelf

		if slot5 then
			slot5 = slot0.main

			if slot4 ~= slot5 then
				slot5 = slot0.background

				if slot4 ~= slot5 then
					slot5 = #slot1
					slot5 = slot5 + 1
					slot1[slot5] = slot4
					slot5 = setActive
					slot6 = slot4
					slot7 = false

					slot5(slot6, slot7)
				end
			end
		end

		slot3 = slot3 + 1
	end

	slot4 = slot0.main
	slot2 = slot4.childCount
	slot3 = 0

	while slot2 > slot3 do
		slot4 = slot0.main
		slot5 = slot4
		slot4 = slot4.GetChild
		slot6 = slot3
		slot4 = slot4(slot5, slot6)
		slot5 = slot4.gameObject
		slot5 = slot5.activeSelf

		if slot5 then
			slot5 = slot0.shipInfo

			if slot4 ~= slot5 then
				slot5 = #slot1
				slot5 = slot5 + 1
				slot1[slot5] = slot4
				slot5 = setActive
				slot6 = slot4
				slot7 = false

				slot5(slot6, slot7)
			end
		end

		slot3 = slot3 + 1
	end

	slot4 = #slot1
	slot4 = slot4 + 1
	slot5 = slot0.chat
	slot1[slot4] = slot5
	slot4 = openPortrait

	slot4()

	slot4 = setActive
	slot5 = slot0.common
	slot6 = false

	slot4(slot5, slot6)

	slot4 = slot0.mainMask
	slot5 = false
	slot4.enabled = slot5
	slot4 = slot0.mainMask
	slot5 = slot4
	slot4 = slot4.PerformClipping

	slot4(slot5)

	slot4 = slot0.painting
	slot5 = slot4.anchoredPosition
	slot5 = slot5.x
	slot6 = slot4.anchoredPosition
	slot6 = slot6.y
	slot7 = slot4.rect
	slot7 = slot7.width
	slot8 = slot4.rect
	slot8 = slot8.height
	slot9 = slot0._tf
	slot9 = slot9.rect
	slot9 = slot9.width
	slot10 = UnityEngine
	slot10 = slot10.Screen
	slot10 = slot10.width
	slot9 = slot9 / slot10
	slot10 = slot0._tf
	slot10 = slot10.rect
	slot10 = slot10.height
	slot11 = UnityEngine
	slot11 = slot11.Screen
	slot11 = slot11.height
	slot10 = slot10 / slot11
	slot11 = slot7 / 2
	slot12 = slot8 / 2
	slot13, slot14 = nil
	slot15 = GetOrAddComponent
	slot16 = slot0.background
	slot17 = "MultiTouchZoom"
	slot15 = slot15(slot16, slot17)
	slot17 = slot15
	slot16 = slot15.SetZoomTarget
	slot18 = slot0.painting

	slot16(slot17, slot18)

	slot16 = GetOrAddComponent
	slot17 = slot0.background
	slot18 = "EventTriggerListener"
	slot16 = slot16(slot17, slot18)
	slot17 = true
	slot18 = false
	slot20 = slot16
	slot19 = slot16.AddPointDownFunc

	function slot21(slot0)
		slot1 = Input
		slot1 = slot1.touchCount

		if slot1 ~= 1 then
			slot1 = Application
			slot1 = slot1.isEditor

			if slot1 then
				slot0 = true
				slot1 = true
			else
				slot1 = Input
				slot1 = slot1.touchCount
				slot2 = 2

				if slot1 >= slot2 then
					slot1 = false
					slot0 = false
				end
			end
		end
	end

	slot19(slot20, slot21)

	slot20 = slot16
	slot19 = slot16.AddPointUpFunc

	function slot21(slot0)
		slot1 = Input
		slot1 = slot1.touchCount
		slot2 = 2

		if slot1 <= slot2 then
			slot0 = true
		end
	end

	slot19(slot20, slot21)

	slot20 = slot16
	slot19 = slot16.AddBeginDragFunc

	function slot21(slot0, slot1)
		slot0 = false
		slot2 = slot1.position
		slot2 = slot2.x
		slot3 = slot2
		slot2 = slot2 * slot3
		slot3 = slot3
		slot2 = slot2 - slot3
		slot3 = tf
		slot4 = slot4
		slot4 = slot4.painting
		slot3 = slot3(slot4)
		slot3 = slot3.localPosition
		slot3 = slot3.x
		slot2 = slot2 - slot3
		slot1 = slot2
		slot2 = slot1.position
		slot2 = slot2.y
		slot3 = slot6
		slot2 = slot2 * slot3
		slot3 = slot7
		slot2 = slot2 - slot3
		slot3 = tf
		slot4 = slot4
		slot4 = slot4.painting
		slot3 = slot3(slot4)
		slot3 = slot3.localPosition
		slot3 = slot3.y
		slot2 = slot2 - slot3
		slot5 = slot2
	end

	slot19(slot20, slot21)

	slot20 = slot16
	slot19 = slot16.AddDragFunc

	function slot21(slot0, slot1)
		slot2 = slot0

		if slot2 then
			slot2 = tf
			slot3 = slot1
			slot3 = slot3.painting
			slot2 = slot2(slot3)
			slot2 = slot2.localPosition
			slot3 = tf
			slot4 = slot1
			slot4 = slot4.painting
			slot3 = slot3(slot4)
			slot4 = Vector3
			slot5 = slot1.position
			slot5 = slot5.x
			slot6 = slot2
			slot5 = slot5 * slot6
			slot6 = slot3
			slot5 = slot5 - slot6
			slot6 = slot4
			slot5 = slot5 - slot6
			slot6 = slot1.position
			slot6 = slot6.y
			slot7 = slot5
			slot6 = slot6 * slot7
			slot7 = slot6
			slot6 = slot6 - slot7
			slot7 = slot7
			slot6 = slot6 - slot7
			slot7 = -22
			slot4 = slot4(slot5, slot6, slot7)
			slot3.localPosition = slot4
		end
	end

	slot19(slot20, slot21)

	slot19 = onButton
	slot20 = slot0
	slot21 = slot0.background

	function slot22()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hidePaintView

		slot0(slot1)
	end

	slot23 = SFX_CANCEL

	slot19(slot20, slot21, slot22, slot23)

	slot19 = setAnchoredPosition
	slot20 = slot0.background
	slot21 = {
		x = -88
	}

	slot19(slot20, slot21)

	slot19 = slot0

	function slot20(slot0, slot1)
		if not slot1 then
			slot2 = slot0

			if not slot2 then
				return
			end
		end

		slot2 = Input
		slot3 = false
		slot2.multiTouchEnabled = slot3
		slot2 = setActive
		slot3 = slot0.common
		slot4 = true

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.switchPanel
		slot4 = slot0.shipInfo
		slot5 = 275
		slot6 = nil
		slot7 = slot1
		slot7 = slot7 * 2

		slot2(slot3, slot4, slot5, slot6, slot7)

		slot2 = slot2
		slot3 = false
		slot2.enabled = slot3
		slot2 = slot3
		slot3 = false
		slot2.enabled = slot3
		slot2 = ipairs
		slot3 = slot4
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			slot7 = setActive
			slot8 = slot6
			slot9 = true

			slot7(slot8, slot9)
		end

		slot2 = closePortrait

		slot2()

		slot2 = slot0.painting
		slot3 = Vector3
		slot4 = 1
		slot5 = 1
		slot6 = 1
		slot3 = slot3(slot4, slot5, slot6)
		slot2.localScale = slot3
		slot2 = setAnchoredPosition
		slot3 = slot0.painting
		slot4 = {}
		slot5 = slot5
		slot4.x = slot5
		slot5 = slot6
		slot4.y = slot5

		slot2(slot3, slot4)

		slot2 = setAnchoredPosition
		slot3 = slot0.background
		slot4 = {
			x = 0
		}

		slot2(slot3, slot4)

		slot2 = slot0.background
		slot3 = slot2
		slot2 = slot2.GetComponent
		slot4 = "Button"
		slot2 = slot2(slot3, slot4)
		slot3 = false
		slot2.enabled = slot3
		slot2 = slot0.painting
		slot3 = slot2
		slot2 = slot2.GetComponent
		slot4 = "CanvasGroup"
		slot2 = slot2(slot3, slot4)
		slot3 = true
		slot2.blocksRaycasts = slot3
		slot2 = slot0.mainMask
		slot3 = true
		slot2.enabled = slot3
		slot2 = slot0.mainMask
		slot3 = slot2
		slot2 = slot2.PerformClipping

		slot2(slot3)

		slot2 = false
		slot0.inPaintingView = slot2
	end

	slot19.hidePaintView = slot20
	slot20 = slot0
	slot19 = slot0.switchPanel
	slot21 = slot0.shipInfo
	slot22 = slot2
	slot23 = nil
	slot24 = slot1
	slot24 = slot24 * 2
	slot19 = slot19(slot20, slot21, slot22, slot23, slot24)
	slot21 = slot19
	slot20 = slot19.setOnComplete
	slot22 = System
	slot22 = slot22.Action

	function slot23()
		slot0 = slot0
		slot1 = true
		slot0.enabled = slot1
		slot0 = slot1
		slot1 = true
		slot0.enabled = slot1
		slot0 = slot2
		slot0 = slot0.background
		slot1 = slot0
		slot0 = slot0.GetComponent
		slot2 = "Button"
		slot0 = slot0(slot1, slot2)
		slot1 = true
		slot0.enabled = slot1
		slot0 = slot2
		slot0 = slot0.painting
		slot1 = slot0
		slot0 = slot0.GetComponent
		slot2 = "CanvasGroup"
		slot0 = slot0(slot1, slot2)
		slot1 = false
		slot0.blocksRaycasts = slot1
	end

	slot20(slot21, slot22(slot23))
end

slot0.paintView = slot7

function slot7(slot0)
	slot1 = setParent
	slot2 = slot0.common
	slot3 = slot0._go

	slot1(slot2, slot3)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.PartialBlur
	slot3 = slot0.toggles
	slot4 = false

	slot1(slot2, slot3, slot4)
end

slot0.unPartialBlur = slot7
slot7 = 0.2

function slot8(slot0)
	slot1 = slot0.shipVO

	if not slot1 then
		return
	end

	slot1 = true
	slot0.isShowRecord = slot1
	slot1 = setActive
	slot2 = slot0.recordPanel
	slot3 = true

	slot1(slot2, slot3)

	slot1 = LeanTween
	slot1 = slot1.isTweening
	slot2 = go
	slot3 = slot0.recordPanel
	slot1 = slot1(slot2(slot3))

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = go
		slot3 = slot0.recordPanel

		slot1(slot2(slot3))
	end

	slot1 = LeanTween
	slot1 = slot1.scaleY
	slot2 = go
	slot3 = slot0.recordPanel
	slot2 = slot2(slot3)
	slot3 = 1
	slot4 = slot0
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.setFrom
	slot3 = 0
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.setEase
	slot3 = LeanTweenType
	slot3 = slot3.linear

	slot1(slot2, slot3)

	slot1 = ipairs
	slot2 = slot0.recordBtns
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = onButton
		slot7 = slot0
		slot8 = slot5

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShipInfoMediator
			slot2 = slot2.ON_RECORD_EQUIPMENT
			slot3 = slot0
			slot3 = slot3.shipVO
			slot3 = slot3.id
			slot4 = slot1
			slot5 = 1

			slot0(slot1, slot2, slot3, slot4, slot5)
		end

		slot10 = SFX_PANEL

		slot6(slot7, slot8, slot9, slot10)
	end

	slot1 = ipairs
	slot2 = slot0.equipRecordBtns
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = onButton
		slot7 = slot0
		slot8 = slot5

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShipInfoMediator
			slot2 = slot2.ON_RECORD_EQUIPMENT
			slot3 = slot0
			slot3 = slot3.shipVO
			slot3 = slot3.id
			slot4 = slot1
			slot5 = 2

			slot0(slot1, slot2, slot3, slot4, slot5)
		end

		slot10 = SFX_PANEL

		slot6(slot7, slot8, slot9, slot10)
	end

	slot1 = ipairs
	slot2 = slot0.recordEquipmentsTFs
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot0
		slot6 = slot0.updateRecordEquipments
		slot8 = slot4

		slot6(slot7, slot8)
	end
end

slot0.displayRecordPanel = slot8

function slot8(slot0)
	slot1 = slot0.isShowRecord

	if slot1 then
		slot1 = nil
		slot0.isShowRecord = slot1
		slot1 = LeanTween
		slot1 = slot1.isTweening
		slot2 = go
		slot3 = slot0.recordPanel
		slot1 = slot1(slot2(slot3))

		if slot1 then
			slot1 = LeanTween
			slot1 = slot1.cancel
			slot2 = go
			slot3 = slot0.recordPanel

			slot1(slot2(slot3))
		end

		slot1 = LeanTween
		slot1 = slot1.scaleY
		slot2 = go
		slot3 = slot0.recordPanel
		slot2 = slot2(slot3)
		slot3 = 0
		slot4 = slot0
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot1
		slot1 = slot1.setFrom
		slot3 = 1
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.setEase
		slot3 = LeanTweenType
		slot3 = slot3.linear

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0.recordPanel
		slot3 = false

		slot1(slot2, slot3)
	end
end

slot0.closeRecordPanel = slot8

function slot8(slot0, slot1)
	slot2 = slot0.recordEquipmentsTFs[slot1]
	slot4 = slot0.shipVO:getEquipmentRecord(slot0.player.id)[slot1] or {}
	slot5 = 1
	slot6 = 5
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot11 = slot2:Find("equipment_" .. slot8)

		setActive(slot13, slot10)
		setActive(slot11:Find("empty"), not (tonumber(slot4[slot8]) and tonumber(slot4[slot8]) ~= -1))

		slot14 = slot0.equipmentProxy
		slot15 = slot14
		slot14 = slot14.getEquipmentById
		slot16 = slot9
		slot14 = slot14(slot15, slot16)
		slot15 = slot0.shipVO
		slot15 = slot15.equipments
		slot15 = slot15[slot8]

		setActive(slot13:Find("tip"), slot17)
		updateEquipment(slot13, Equipment.New({
			id = slot9
		}))

		if slot14.count <= 0 then
			slot18 = onButton
			slot19 = slot0
			slot20 = slot13

			function slot21()
				slot0 = pg
				slot0 = slot0.TipsMgr
				slot1 = slot0
				slot0 = slot0.GetInstance
				slot0 = slot0(slot1)
				slot1 = slot0
				slot0 = slot0.ShowTips
				slot2 = i18n
				slot3 = "ship_quick_change_nofreeequip"

				slot0(slot1, slot2(slot3))
			end

			slot22 = SFX_PANEL

			slot18(slot19, slot20, slot21, slot22)
		end
	end
end

slot0.updateRecordEquipments = slot8

function slot8(slot0)
	slot1 = slot0.equipmentSkinPanel
	slot2 = slot1
	slot1 = slot1.isTweening
	slot1 = slot1(slot2)

	if slot1 then
		return
	end

	slot1 = slot0.equipmentSkinPanel
	slot2 = slot1
	slot1 = slot1.doSwitchAnim
	slot3 = slot0.contextData
	slot3 = slot3.isInEquipmentSkinPage

	slot1(slot2, slot3)

	slot1 = slot0.contextData
	slot2 = slot0.contextData
	slot2 = slot2.isInEquipmentSkinPage
	slot2 = not slot2
	slot1.isInEquipmentSkinPage = slot2
	slot1 = setActive
	slot2 = slot0.equipSkinBtn
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "unsel"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.contextData
	slot3 = slot3.isInEquipmentSkinPage
	slot3 = not slot3

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.equipSkinBtn
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "sel"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.contextData
	slot3 = slot3.isInEquipmentSkinPage

	slot1(slot2, slot3)

	slot1 = slot0.equipmentSkinPanel
	slot2 = slot1
	slot1 = slot1.updateAll
	slot3 = slot0.shipVO

	slot1(slot2, slot3)
end

slot0.switch2EquipmentSkinPage = slot8

function slot8(slot0)
	slot1 = Input
	slot2 = true
	slot1.multiTouchEnabled = slot2
	slot1 = slot0.designBg

	if slot1 then
		slot1 = PoolMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.ReturnUI
		slot3 = "raritydesign5"
		slot4 = slot0.designBg

		slot1(slot2, slot3, slot4)
	end

	slot1 = slot0.intensifyToggle
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "Toggle"
	slot1 = slot1(slot2, slot3)
	slot1 = slot1.onValueChanged
	slot2 = slot1
	slot1 = slot1.RemoveAllListeners

	slot1(slot2)

	slot1 = slot0.upgradeToggle
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "Toggle"
	slot1 = slot1(slot2, slot3)
	slot1 = slot1.onValueChanged
	slot2 = slot1
	slot1 = slot1.RemoveAllListeners

	slot1(slot2)

	slot1 = LeanTween
	slot1 = slot1.cancel
	slot2 = slot0.chat
	slot2 = slot2.gameObject

	slot1(slot2)

	slot1 = slot0.paintingCode

	if slot1 then
		slot1 = retPaintingPrefab
		slot2 = slot0.painting
		slot3 = slot0.paintingCode

		slot1(slot2, slot3)
	end

	slot1 = removeAllChildren
	slot2 = slot0.equipmentsGrid

	slot1(slot2)

	slot1 = clearImageSprite
	slot2 = slot0.background

	slot1(slot2)

	slot1 = slot0.resPanel
	slot2 = slot1
	slot1 = slot1.exit

	slot1(slot2)

	slot1 = nil
	slot0.resPanel = slot1
	slot1 = slot0.recordPanel

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.isTweening
		slot2 = go
		slot3 = slot0.recordPanel
		slot1 = slot1(slot2(slot3))

		if slot1 then
			slot1 = LeanTween
			slot1 = slot1.cancel
			slot2 = go
			slot3 = slot0.recordPanel

			slot1(slot2(slot3))
		end

		slot1 = nil
		slot0.recordPanel = slot1
	end

	slot1 = slot0.equipmentSkinPanel

	if slot1 then
		slot1 = slot0.equipmentSkinPanel
		slot2 = slot1
		slot1 = slot1.detach

		slot1(slot2)
	end

	slot1 = slot0.energyTimer

	if slot1 then
		slot1 = slot0.energyTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.energyTimer = slot1
	end

	slot1 = slot0.intimacyTimer

	if slot1 then
		slot1 = slot0.intimacyTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.intimacyTimer = slot1
	end

	slot1 = slot0.chatTimer

	if slot1 then
		slot1 = slot0.chatTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.chatTimer = slot1
	end

	slot1 = slot0._currentVoice

	if slot1 then
		slot1 = slot0._currentVoice
		slot2 = slot1
		slot1 = slot1.Stop
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = nil
	slot0._currentVoice = slot1
	slot1 = slot0.loadedCVBankName

	if slot1 then
		slot1 = pg
		slot1 = slot1.CriMgr
		slot1 = slot1.UnloadCVBank
		slot2 = slot0.loadedCVBankName

		slot1(slot2)

		slot1 = nil
		slot0.loadedCVBankName = slot1
	end

	slot2 = slot0
	slot1 = slot0.clearFashion

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.hideHuntingRange

	slot1(slot2)

	slot1 = cameraPaintViewAdjust
	slot2 = false

	slot1(slot2)

	slot1 = slot0.tweens

	if slot1 then
		slot1 = cancelTweens
		slot2 = slot0.tweens

		slot1(slot2)
	end

	slot1 = ipairs
	slot2 = slot0.equipmentNames
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.destroy

		slot6(slot7)
	end

	slot1 = nil
	slot0.equipmentNames = slot1
	slot1 = slot0.shipDetailPanel
	slot2 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = slot0.scrollTxt

	if slot1 then
		slot1 = slot0.scrollTxt
		slot2 = slot1
		slot1 = slot1.destroy

		slot1(slot2)
	end
end

slot0.willExit = slot8

return slot0
