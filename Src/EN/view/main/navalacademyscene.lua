slot0 = class
slot1 = "NavalAcademyScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = "STATE_ACADEMY"
slot0.STATE_ACADEMY = slot1
slot1 = "STATE_COURSE"
slot0.STATE_COURSE = slot1
slot1 = "STATE_RESOURCE"
slot0.STATE_RESOURCE = slot1
slot1 = "STATE_MERCHANT"
slot0.STATE_MERCHANT = slot1
slot1 = 5
slot0.COURSE_COUNT = slot1
slot1 = 3
slot0.ICON_COUNT = slot1
slot1 = 3
slot0.MAX_SLOT = slot1
slot1 = 5
slot2 = "WARP_TO_TACTIC"
slot0.WARP_TO_TACTIC = slot2

function slot2(slot0)
	slot1 = "NavalAcademyUI"

	return slot1
end

slot0.getUIName = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "yinghuapiaoluoxiao (S=1.20)"
	slot1 = slot1(slot2, slot3)
	slot0.sakura = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "academyMap/map"
	slot1 = slot1(slot2, slot3)
	slot0._map = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "langhua_wave"
	slot4 = slot0._map
	slot1 = slot1(slot2, slot3, slot4)
	slot0.langhua = slot1
	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "classRoom"
	slot1 = slot1(slot2, slot3)
	slot0._classBtn = slot1
	slot1 = setActive
	slot2 = slot0._classBtn
	slot3 = LOCK_CLASSROOM
	slot3 = not slot3

	slot1(slot2, slot3)

	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "commander"
	slot1 = slot1(slot2, slot3)
	slot0._commanderBtn = slot1
	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "merchant"
	slot1 = slot1(slot2, slot3)
	slot0._merchant = slot1
	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "tacticRoom"
	slot1 = slot1(slot2, slot3)
	slot0._tacticRoom = slot1
	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "ship"
	slot1 = slot1(slot2, slot3)
	slot0._shipTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container"
	slot1 = slot1(slot2, slot3)
	slot0._blurLayer = slot1
	slot1 = slot0._blurLayer
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "top"
	slot1 = slot1(slot2, slot3)
	slot0._topPanel = slot1
	slot1 = slot0._topPanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "title/back"
	slot1 = slot1(slot2, slot3)
	slot0._backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/class_panel"
	slot1 = slot1(slot2, slot3)
	slot0._courseLayer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "class_describe"
	slot4 = slot0._courseLayer
	slot1 = slot1(slot2, slot3, slot4)
	slot0._courseDetail = slot1
	slot1 = slot0._courseLayer
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "slots"
	slot1 = slot1(slot2, slot3)
	slot0._slots = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "slot_tpl"
	slot4 = slot0._courseLayer
	slot1 = slot1(slot2, slot3, slot4)
	slot0._slotTpl = slot1
	slot1 = slot0._courseLayer
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "paint"
	slot1 = slot1(slot2, slot3)
	slot0._painting = slot1
	slot1 = slot0._courseLayer
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "chat"
	slot1 = slot1(slot2, slot3)
	slot0._chat = slot1
	slot1 = rtf
	slot2 = slot0._chat
	slot1 = slot1(slot2)
	slot2 = Vector3
	slot3 = 0
	slot4 = 0
	slot2 = slot2(slot3, slot4)
	slot1.localScale = slot2
	slot1 = slot0._chat
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "Text"
	slot1 = slot1(slot2, slot3)
	slot0._chatText = slot1
	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "shop"
	slot1 = slot1(slot2, slot3)
	slot0._shop = slot1
	slot1 = slot0._shop
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "popup_contain/popup"
	slot1 = slot1(slot2, slot3)
	slot0._getGold = slot1
	slot1 = slot0._map
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "canteen"
	slot1 = slot1(slot2, slot3)
	slot0._canteen = slot1
	slot1 = slot0._canteen
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "popup_contain/popup"
	slot1 = slot1(slot2, slot3)
	slot0._getOil = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/resource_panel"
	slot1 = slot1(slot2, slot3)
	slot0._resourceLayer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/merchant_panel"
	slot1 = slot1(slot2, slot3)
	slot0._merchatLayer = slot1
	slot1 = setActive
	slot2 = slot0._merchatLayer
	slot3 = false

	slot1(slot2, slot3)

	slot1 = slot0._merchant
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "title/name"
	slot1 = slot1(slot2, slot3)
	slot0._merchatName = slot1
	slot1 = slot0._merchant
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "title/count"
	slot1 = slot1(slot2, slot3)
	slot0._merchatCount = slot1
	slot1 = setText
	slot2 = slot0._merchatName
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "Text"
	slot2 = slot2(slot3, slot4)
	slot3 = pg
	slot3 = slot3.navalacademy_data_template
	slot4 = slot0
	slot3 = slot3[slot4]
	slot3 = slot3.name

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.getTpl
	slot3 = "frame/list/scrollView/view/item_tpl"
	slot4 = slot0._merchatLayer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.goodTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "merchant/tip"
	slot4 = slot0._map
	slot1 = slot1(slot2, slot3, slot4)
	slot0._merchantTip = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "tip"
	slot4 = slot0._tacticRoom
	slot1 = slot1(slot2, slot3, slot4)
	slot0._tacticTips = slot1
	slot1 = slot0.contextData
	slot1 = slot1.number
	slot0._currentCourseID = slot1
	slot1 = slot0.contextData
	slot1 = slot1.startCourseFlag
	slot0._startCourseFlag = slot1
	slot1 = slot0.contextData
	slot2 = nil
	slot1.number = slot2
	slot1 = slot0.contextData
	slot2 = nil
	slot1.selectedShips = slot2
	slot1 = slot0.contextData
	slot2 = nil
	slot1.startCourseFlag = slot2
	slot1 = slot0.contextData
	slot1 = slot1.warp
	slot0.warp = slot1
	slot1 = slot0.contextData
	slot2 = nil
	slot1.warp = slot2
	slot1 = {}
	slot0._panelTimer = slot1
	slot1 = {}
	slot0._buildingTimers = slot1
	slot1 = {}
	slot0._mapTimers = slot1
	slot1 = {}
	slot0.academyStudents = slot1
	slot1 = GraphPath
	slot1 = slot1.New
	slot2 = AcademyGraph
	slot1 = slot1(slot2)
	slot0.academyGraphPath = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_container/top/playerRes"
	slot1 = slot1(slot2, slot3)
	slot0._playerResOb = slot1
	slot1 = PlayerResource
	slot1 = slot1.New
	slot1 = slot1()
	slot0._resPanel = slot1
	slot1 = tf
	slot2 = slot0._resPanel
	slot2 = slot2._go
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.SetParent
	slot3 = tf
	slot4 = slot0._playerResOb
	slot3 = slot3(slot4)
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.uiStartAnimating

	slot1(slot2)
end

slot0.init = slot2

function slot2(slot0)
	slot1 = setAnchoredPosition
	slot2 = slot0._topPanel
	slot3 = {}
	slot4 = slot0._topPanel
	slot4 = slot4.rect
	slot4 = slot4.height
	slot3.y = slot4

	slot1(slot2, slot3)

	slot1 = shiftPanel
	slot2 = slot0._topPanel
	slot3 = nil
	slot4 = 0
	slot5 = 0.3
	slot6 = 0
	slot7 = true
	slot8 = true

	slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/bg/left"
	slot4 = slot0._topPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "title/bg/right"
	slot5 = slot0._topPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/bg/title_academy"
	slot6 = slot0._topPanel
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "title/bg/academy"
	slot7 = slot0._topPanel
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = topAnimation
	slot6 = slot1
	slot7 = slot2
	slot8 = slot3
	slot9 = slot4
	slot10 = nil

	function slot11()
		slot0 = slot0
		slot1 = nil
		slot0.tweens = slot1
	end

	slot5 = slot5(slot6, slot7, slot8, slot9, slot10, slot11)
	slot0.tweens = slot5
end

slot0.uiStartAnimating = slot2

function slot2(slot0)
	slot1 = shiftPanel
	slot2 = slot0._topPanel
	slot3 = nil
	slot4 = slot0._topPanel
	slot4 = slot4.rect
	slot4 = slot4.height
	slot5 = 0.3
	slot6 = 0
	slot7 = true
	slot8 = true

	slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)
end

slot0.uiExitAnimating = slot2

function slot2(slot0)
	slot1 = setText
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "describe/canteen"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "naval_academy_res_desc_cateen"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "describe/shop"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "naval_academy_res_desc_shop"

	slot1(slot2, slot3(slot4))

	slot1 = slot0
	slot1 = slot1.STATE_ACADEMY
	slot0._currentState = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._backBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0._currentState
		slot1 = slot1
		slot1 = slot1.STATE_ACADEMY

		if slot0 == slot1 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.uiExitAnimating

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_BACK
			slot3 = nil
			slot4 = 0.2

			slot0(slot1, slot2, slot3, slot4)
		else
			slot0 = slot0
			slot0 = slot0._currentState
			slot1 = slot1
			slot1 = slot1.STATE_COURSE

			if slot0 == slot1 then
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.CloseCoursePanel

				slot0(slot1)
			else
				slot0 = slot0
				slot0 = slot0._currentState
				slot1 = slot1
				slot1 = slot1.STATE_RESOURCE

				if slot0 == slot1 then
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.CloseResourcePanel

					slot0(slot1)
				end
			end
		end
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._classBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.SystemOpenMgr
		slot1 = slot0
		slot0 = slot0.GetInstance
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.isOpenSystem
		slot2 = slot0
		slot2 = slot2._player
		slot2 = slot2.level
		slot3 = "ClassMediator"
		slot0, slot1 = slot0(slot1, slot2, slot3)

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
		slot4 = NavalAcademyMediator
		slot4 = slot4.OPEN_CLASS

		slot2(slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._canteen

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.OpenResourcePanel
		slot2 = slot0
		slot2 = slot2._oilVO

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._shop

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.OpenResourcePanel
		slot2 = slot0
		slot2 = slot2._goldVO

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._getGold

	function slot4()
		slot0 = slot0
		slot0 = slot0._player
		slot0 = slot0.goldField
		slot1 = 0

		if slot0 <= slot1 then
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = i18n
			slot3 = "battle_levelScene_0Gold"

			slot0(slot1, slot2(slot3))
		else
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = NavalAcademyMediator
			slot2 = slot2.GET_RES
			slot3 = ResourceField
			slot3 = slot3.TYPE_GOLD

			slot0(slot1, slot2, slot3)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._getOil

	function slot4()
		slot0 = slot0
		slot0 = slot0._player
		slot0 = slot0.oilField
		slot1 = 0

		if slot0 <= slot1 then
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = i18n
			slot3 = "battle_levelScene_0Oil"

			slot0(slot1, slot2(slot3))
		else
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = NavalAcademyMediator
			slot2 = slot2.GET_RES
			slot3 = ResourceField
			slot3 = slot3.TYPE_OIL

			slot0(slot1, slot2, slot3)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._merchant

	function slot4()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1._merchantTip
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = NavalAcademyMediator
		slot2 = slot2.GO_SHOP

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._tacticRoom

	function slot4()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1._tacticTips
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = NavalAcademyMediator
		slot2 = slot2.OPEN_TACTIC

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._commanderBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = NavalAcademyMediator
		slot2 = slot2.OPEN_COMMANDER

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3, slot4)

	slot1 = slot0._currentCourseID

	if slot1 ~= nil then
		slot1 = slot0._startCourseFlag

		if slot1 then
			slot1 = pg
			slot1 = slot1.TipsMgr
			slot2 = slot1
			slot1 = slot1.GetInstance
			slot1 = slot1(slot2)
			slot2 = slot1
			slot1 = slot1.ShowTips
			slot3 = i18n
			slot4 = "main_navalAcademyScene_quest_startClass"

			slot1(slot2, slot3(slot4))
		end

		slot1 = triggerToggle
		slot2 = slot0._toggleList
		slot3 = slot0._currentCourseID
		slot2 = slot2[slot3]
		slot3 = true

		slot1(slot2, slot3)

		slot1 = nil
		slot0.currentCourseID = slot1
	end

	slot1 = slot0.warp
	slot2 = slot0
	slot2 = slot2.WARP_TO_TACTIC

	if slot1 == slot2 then
		slot2 = slot0
		slot1 = slot0.emit
		slot3 = NavalAcademyMediator
		slot3 = slot3.OPEN_TACTIC

		slot1(slot2, slot3)
	end

	slot1 = blinkAni
	slot2 = go
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "blur_container/resource_panel/produce/pre_value/fill_area/value"
	slot2 = slot2(slot3(slot4, slot5))
	slot3 = 0.8

	slot1(slot2, slot3)

	slot1 = blinkAni
	slot2 = go
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "blur_container/resource_panel/store/pre_value/fill_area/value"
	slot2 = slot2(slot3(slot4, slot5))
	slot3 = 0.8

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateStudents

	slot1(slot2)
end

slot0.didEnter = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot0._player = slot1
	slot0._oilVO = slot2
	slot0._goldVO = slot3
	slot0._classVO = slot4
	slot6 = slot0
	slot5 = slot0.updateMap

	slot5(slot6)

	slot5 = slot0._resPanel
	slot6 = slot5
	slot5 = slot5.setResources
	slot7 = slot1

	slot5(slot6, slot7)
end

slot0.SetPlayerInfo = slot2

function slot2(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.isUpdateGoods
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = setActive
		slot3 = slot0._merchantTip
		slot4 = true

		slot2(slot3, slot4)
	end
end

slot0.SetMerchantInfo = slot2

function slot2(slot0, slot1)
	slot0.students = slot1
	slot2 = pg
	slot2 = slot2.TimeMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetServerTime
	slot2 = slot2(slot3)
	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot9 = slot7
		slot8 = slot7.getFinishTime
		slot8 = slot8(slot9)

		if slot8 <= slot2 then
			slot8 = setActive
			slot9 = slot0._tacticTips
			slot10 = true

			slot8(slot9, slot10)

			break
		end
	end
end

slot0.SetTacticInfo = slot2

function slot2(slot0, slot1)
	slot0._courseVO = slot1
end

slot0.SetCourseInfo = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.updateResourceBuilding
	slot3 = slot0._canteen
	slot4 = slot0._player
	slot4 = slot4.oilField
	slot5 = slot0._oilVO

	slot1(slot2, slot3, slot4, slot5)

	slot2 = slot0
	slot1 = slot0.updateResourceBuilding
	slot3 = slot0._shop
	slot4 = slot0._player
	slot4 = slot4.goldField
	slot5 = slot0._goldVO

	slot1(slot2, slot3, slot4, slot5)

	slot2 = slot0
	slot1 = slot0.updateResourceBuilding
	slot3 = slot0._classBtn
	slot4 = nil
	slot5 = slot0._classVO

	slot1(slot2, slot3, slot4, slot5)
end

slot0.updateMap = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot4 = pg
	slot4 = slot4.TimeMgr
	slot5 = slot4
	slot4 = slot4.GetInstance
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.RemoveTimer
	slot6 = slot0._buildingTimers
	slot6 = slot6[slot3]

	slot4(slot5, slot6)

	if slot2 then
		SetActive(slot1:Find("popup_contain/popup"), slot2 > 0)
	end

	slot4 = SetActive
	slot6 = slot1
	slot5 = slot1.Find
	slot7 = "tip"
	slot5 = slot5(slot6, slot7)
	slot6 = false

	slot4(slot5, slot6)

	slot4 = slot3._type
	slot5 = ResourceField
	slot5 = slot5.TYPE_CLASS

	if slot4 == slot5 then
		slot4 = slot0._courseVO
		slot5 = slot4
		slot4 = slot4.inClass
		slot4 = slot4(slot5)

		if slot4 then
			slot4 = pg
			slot4 = slot4.TimeMgr
			slot4 = slot4.GetInstance
			slot4 = slot4()
			slot5 = slot4
			slot4 = slot4.GetServerTime
			slot4 = slot4(slot5)
			slot5 = slot0._courseVO
			slot5 = slot5.timestamp
			slot4 = slot4 - slot5
			slot5 = AcademyCourse
			slot5 = slot5.MaxStudyTime

			if slot5 <= slot4 then
				slot4 = SetActive
				slot6 = slot1
				slot5 = slot1.Find
				slot7 = "tip"
				slot5 = slot5(slot6, slot7)
				slot6 = true

				slot4(slot5, slot6)
			end
		end
	end

	slot5 = slot1
	slot4 = slot1.Find
	slot6 = "title/name"
	slot4 = slot4(slot5, slot6)
	slot6 = slot1
	slot5 = slot1.Find
	slot7 = "title/count"
	slot5 = slot5(slot6, slot7)
	slot7 = slot3
	slot6 = slot3.GetUpgradeTimeStamp
	slot6 = slot6(slot7)

	if slot6 == 0 then
		slot6 = SetActive
		slot7 = slot4
		slot8 = true

		slot6(slot7, slot8)

		slot6 = SetActive
		slot7 = slot5
		slot8 = false

		slot6(slot7, slot8)

		slot7 = slot4
		slot6 = slot4.Find
		slot8 = "level"
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = typeof
		slot9 = Text
		slot6 = slot6(slot7, slot8(slot9))
		slot7 = "Lv."
		slot9 = slot3
		slot8 = slot3.GetLevel
		slot8 = slot8(slot9)
		slot7 = slot7 .. slot8
		slot6.text = slot7
		slot7 = slot3
		slot6 = slot3.CanUpgrade
		slot8 = slot0._player
		slot8 = slot8.level
		slot9 = slot0._player
		slot9 = slot9.gold
		slot6 = slot6(slot7, slot8, slot9)

		if slot6 then
			slot6 = SetActive
			slot8 = slot1
			slot7 = slot1.Find
			slot9 = "tip"
			slot7 = slot7(slot8, slot9)
			slot8 = true

			slot6(slot7, slot8)
		end
	else
		slot6 = SetActive
		slot7 = slot4
		slot8 = false

		slot6(slot7, slot8)

		slot6 = SetActive
		slot7 = slot5
		slot8 = true

		slot6(slot7, slot8)

		slot7 = slot5
		slot6 = slot5.Find
		slot8 = "Text"
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = typeof
		slot9 = Text
		slot6 = slot6(slot7, slot8(slot9))
		slot7 = pg
		slot7 = slot7.TimeMgr
		slot8 = slot7
		slot7 = slot7.GetInstance
		slot7 = slot7(slot8)
		slot8 = slot7
		slot7 = slot7.AddTimer
		slot9 = "timer"
		slot10 = 0
		slot11 = 1

		function slot12()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.GetDuration
			slot0 = slot0(slot1)

			if slot0 then
				slot1 = 0

				if slot0 > slot1 then
					slot1 = slot1
					slot2 = pg
					slot2 = slot2.TimeMgr
					slot2 = slot2.GetInstance
					slot2 = slot2()
					slot3 = slot2
					slot2 = slot2.DescCDTime
					slot4 = slot0
					slot2 = slot2(slot3, slot4)
					slot1.text = slot2
				end
			else
				slot1 = pg
				slot1 = slot1.TimeMgr
				slot2 = slot1
				slot1 = slot1.GetInstance
				slot1 = slot1(slot2)
				slot2 = slot1
				slot1 = slot1.RemoveTimer
				slot3 = slot2
				slot3 = slot3._buildingTimers
				slot4 = slot0
				slot3 = slot3[slot4]

				slot1(slot2, slot3)

				slot1 = slot2
				slot2 = slot1
				slot1 = slot1.emit
				slot3 = NavalAcademyMediator
				slot3 = slot3.UPGRADE_TIMES_UP

				slot1(slot2, slot3)
			end
		end

		slot7 = slot7(slot8, slot9, slot10, slot11, slot12)
		slot8 = slot0._buildingTimers
		slot8[slot3] = slot7
	end
end

slot0.updateResourceBuilding = slot2

function slot2(slot0, slot1)
	slot2 = setActive
	slot3 = slot0._topPanel
	slot4 = false

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.openSecondPanel

	slot2(slot3)

	slot2 = slot0
	slot2 = slot2.STATE_RESOURCE
	slot0._currentState = slot2
	slot2 = SetActive
	slot3 = slot0._resourceLayer
	slot4 = true

	slot2(slot3, slot4)

	slot2 = onButton
	slot3 = slot0
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "mengban"
	slot7 = slot0._resourceLayer
	slot4 = slot4(slot5, slot6, slot7)

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.CloseResourcePanel

		slot0(slot1)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot1
	slot2 = slot1.bindConfigTable
	slot2 = slot2(slot3)
	slot3 = slot0._resourceLayer
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "upgrade_btn"
	slot3 = slot3(slot4, slot5)
	slot4 = slot0._resourceLayer
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "upgrading_block"
	slot4 = slot4(slot5, slot6)
	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "cost"
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.GetComponent
	slot7 = "Text"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0._resourceLayer
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "upgrade_duration/Text"
	slot6 = slot6(slot7, slot8)
	slot7 = slot6
	slot6 = slot6.GetComponent
	slot8 = typeof
	slot9 = Text
	slot6 = slot6(slot7, slot8(slot9))
	slot7 = slot0._resourceLayer
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = "produce"
	slot7 = slot7(slot8, slot9)
	slot8 = slot0._resourceLayer
	slot9 = slot8
	slot8 = slot8.Find
	slot10 = "store"
	slot8 = slot8(slot9, slot10)
	slot9 = slot0._resourceLayer
	slot10 = slot9
	slot9 = slot9.Find
	slot11 = "bg/title/lv/current"
	slot9 = slot9(slot10, slot11)
	slot10 = slot0._resourceLayer
	slot11 = slot10
	slot10 = slot10.Find
	slot12 = "bg/title/lv/next"
	slot10 = slot10(slot11, slot12)
	slot11 = SetActive
	slot12 = slot0._resourceLayer
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "icon/"
	slot16 = slot1
	slot15 = slot1.GetKeyWord
	slot15 = slot15(slot16)
	slot14 = slot14 .. slot15
	slot12 = slot12(slot13, slot14)
	slot13 = true

	slot11(slot12, slot13)

	slot11 = setText
	slot12 = slot0._resourceLayer
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "icon/"
	slot16 = slot1
	slot15 = slot1.GetKeyWord
	slot15 = slot15(slot16)
	slot16 = "/current"
	slot14 = slot14 .. slot15 .. slot16
	slot12 = slot12(slot13, slot14)
	slot13 = "Lv."
	slot15 = slot1
	slot14 = slot1.GetLevel
	slot14 = slot14(slot15)
	slot13 = slot13 .. slot14

	slot11(slot12, slot13)

	slot11 = eachChild
	slot12 = slot0._resourceLayer
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "describe"
	slot12 = slot12(slot13, slot14)

	function slot13(slot0)
		slot1 = setActive
		slot2 = slot0
		slot3 = false

		slot1(slot2, slot3)
	end

	slot11(slot12, slot13)

	slot11 = SetActive
	slot12 = slot0._resourceLayer
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "describe/"
	slot16 = slot1
	slot15 = slot1.GetKeyWord
	slot15 = slot15(slot16)
	slot14 = slot14 .. slot15
	slot12 = slot12(slot13, slot14)
	slot13 = true

	slot11(slot12, slot13)

	slot11 = SetActive
	slot12 = slot0._resourceLayer
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "produce/label/"
	slot16 = slot1
	slot15 = slot1.GetKeyWord
	slot15 = slot15(slot16)
	slot14 = slot14 .. slot15
	slot12 = slot12(slot13, slot14)
	slot13 = true

	slot11(slot12, slot13)

	slot12 = slot1
	slot11 = slot1.GetLevel
	slot11 = slot11(slot12)
	slot12 = slot2.all
	slot13 = slot2.all
	slot13 = #slot13
	slot12 = slot12[slot13]
	slot13 = slot2[slot11]
	slot14 = slot2[slot12]

	if slot11 == slot12 then
		slot15 = SetActive
		slot16 = slot4
		slot17 = false

		slot15(slot16, slot17)

		slot16 = slot3
		slot15 = slot3.GetComponent
		slot17 = "Button"
		slot15 = slot15(slot16, slot17)
		slot16 = false
		slot15.interactable = slot16
		slot15 = "-"
		slot5.text = slot15
		slot15 = "-"
		slot6.text = slot15
		slot16 = slot9
		slot15 = slot9.GetComponent
		slot17 = typeof
		slot18 = Text
		slot15 = slot15(slot16, slot17(slot18))
		slot16 = "Lv.Max"
		slot15.text = slot16
		slot16 = slot10
		slot15 = slot10.GetComponent
		slot17 = typeof
		slot18 = Text
		slot15 = slot15(slot16, slot17(slot18))
		slot16 = "> -"
		slot15.text = slot16
		slot16 = slot0
		slot15 = slot0.setBar
		slot17 = slot7
		slot18 = slot13.production
		slot19 = 0
		slot20 = slot14.production
		slot21 = slot13.hour_time

		slot15(slot16, slot17, slot18, slot19, slot20, slot21)

		slot16 = slot0
		slot15 = slot0.setBar
		slot17 = slot8
		slot18 = slot13.store
		slot19 = 0
		slot20 = slot14.store

		slot15(slot16, slot17, slot18, slot19, slot20)
	else
		slot15 = slot11 + 1
		slot15 = slot2[slot15]
		slot16 = slot15.store
		slot17 = slot13.store
		slot16 = slot16 - slot17
		slot17 = slot15.production
		slot18 = slot13.production
		slot17 = slot17 - slot18
		slot19 = slot0
		slot18 = slot0.setBar
		slot20 = slot7
		slot21 = slot13.production
		slot22 = slot17
		slot23 = slot14.production
		slot24 = slot13.hour_time

		slot18(slot19, slot20, slot21, slot22, slot23, slot24)

		slot19 = slot0
		slot18 = slot0.setBar
		slot20 = slot8
		slot21 = slot13.store
		slot22 = slot16
		slot23 = slot14.store

		slot18(slot19, slot20, slot21, slot22, slot23)

		slot18 = slot0._player
		slot18 = slot18.gold
		slot19 = slot13.use
		slot19 = slot19[2]

		if slot19 <= slot18 then
			slot18 = slot13.use
			slot18 = slot18[2]

			if not slot18 then
				slot18 = "<color=#FB4A2C>"
				slot19 = slot13.use
				slot19 = slot19[2]
				slot20 = "</color>"
				slot18 = slot18 .. slot19 .. slot20
			end
		end

		slot5.text = slot18
		slot19 = slot9
		slot18 = slot9.GetComponent
		slot20 = typeof
		slot21 = Text
		slot18 = slot18(slot19, slot20(slot21))
		slot19 = "Lv."
		slot20 = slot11
		slot19 = slot19 .. slot20
		slot18.text = slot19
		slot19 = slot10
		slot18 = slot10.GetComponent
		slot20 = typeof
		slot21 = Text
		slot18 = slot18(slot19, slot20(slot21))
		slot19 = "> Lv."
		slot20 = slot11 + 1
		slot19 = slot19 .. slot20
		slot18.text = slot19
		slot19 = slot1
		slot18 = slot1.GetUpgradeTimeStamp
		slot18 = slot18(slot19)

		if slot18 == 0 then
			slot18 = SetActive
			slot19 = slot4
			slot20 = false

			slot18(slot19, slot20)

			slot18 = pg
			slot18 = slot18.TimeMgr
			slot18 = slot18.GetInstance
			slot18 = slot18()
			slot19 = slot18
			slot18 = slot18.DescCDTime
			slot20 = slot13.time
			slot18 = slot18(slot19, slot20)
			slot6.text = slot18
			slot19 = slot3
			slot18 = slot3.GetComponent
			slot20 = "Button"
			slot18 = slot18(slot19, slot20)
			slot19 = true
			slot18.interactable = slot19
			slot18 = onButton
			slot19 = slot0
			slot20 = slot3

			function slot21()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = NavalAcademyMediator
				slot2 = slot2.UPGRADE_FIELD
				slot3 = slot1

				slot0(slot1, slot2, slot3)
			end

			slot22 = SFX_UI_ACADEMY_LVLUP

			slot18(slot19, slot20, slot21, slot22)
		else
			slot18 = SetActive
			slot19 = slot4
			slot20 = true

			slot18(slot19, slot20)

			slot19 = slot3
			slot18 = slot3.GetComponent
			slot20 = "Button"
			slot18 = slot18(slot19, slot20)
			slot19 = false
			slot18.interactable = slot19
			slot18 = pg
			slot18 = slot18.TimeMgr
			slot19 = slot18
			slot18 = slot18.GetInstance
			slot18 = slot18(slot19)
			slot19 = slot18
			slot18 = slot18.AddTimer
			slot20 = "timer"
			slot21 = 0
			slot22 = 1

			function slot23()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.GetDuration
				slot0 = slot0(slot1)

				if slot0 then
					slot1 = 0

					if slot0 > slot1 then
						slot1 = slot1
						slot2 = pg
						slot2 = slot2.TimeMgr
						slot2 = slot2.GetInstance
						slot2 = slot2()
						slot3 = slot2
						slot2 = slot2.DescCDTime
						slot4 = slot0
						slot2 = slot2(slot3, slot4)
						slot1.text = slot2
					end
				else
					slot1 = slot2
					slot2 = slot1
					slot1 = slot1.emit
					slot3 = NavalAcademyMediator
					slot3 = slot3.UPGRADE_TIMES_UP
					slot4 = slot0

					slot1(slot2, slot3, slot4)
				end
			end

			slot18 = slot18(slot19, slot20, slot21, slot22, slot23)
			slot19 = slot0._panelTimer
			slot20 = slot0._panelTimer
			slot20 = #slot20
			slot20 = slot20 + 1
			slot19[slot20] = slot18
		end
	end

	slot15 = onButton
	slot16 = slot0
	slot17 = findTF
	slot18 = slot0._resourceLayer
	slot19 = "btnBack"
	slot17 = slot17(slot18, slot19)

	function slot18()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.CloseResourcePanel

		slot0(slot1)
	end

	slot19 = SFX_CANCEL

	slot15(slot16, slot17, slot18, slot19)
end

slot0.OpenResourcePanel = slot2

function slot2(slot0, slot1, slot2)
	if slot2 ~= 0 or not slot2 then
		slot3 = math
		slot3 = slot3.max
		slot4 = slot2
		slot5 = 0.08
		slot3 = slot3(slot4, slot5)
	end

	slot1.value = slot3
end

slot0.setSliderValue = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = slot1
	slot6 = slot1.Find
	slot8 = "pre_value"
	slot6 = slot6(slot7, slot8)
	slot7 = slot6
	slot6 = slot6.GetComponent
	slot8 = typeof
	slot9 = Slider
	slot6 = slot6(slot7, slot8(slot9))
	slot8 = slot1
	slot7 = slot1.Find
	slot9 = "value"
	slot7 = slot7(slot8, slot9)
	slot8 = slot7
	slot7 = slot7.GetComponent
	slot9 = typeof
	slot10 = Slider
	slot7 = slot7(slot8, slot9(slot10))
	slot9 = slot0
	slot8 = slot0.setSliderValue
	slot10 = slot6
	slot11 = slot2 + slot3
	slot11 = slot11 / slot4

	slot8(slot9, slot10, slot11)

	slot9 = slot0
	slot8 = slot0.setSliderValue
	slot10 = slot7
	slot11 = slot2 / slot4

	slot8(slot9, slot10, slot11)

	if slot5 then
		slot9 = slot1
		slot8 = slot1.Find
		slot10 = "current"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot2 * slot5
		slot10 = "/H"
		slot9 = slot9 .. slot10
		slot8.text = slot9
	else
		slot5 = 1
		slot9 = slot1
		slot8 = slot1.Find
		slot10 = "current"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot2
		slot10 = "/"
		slot11 = slot4
		slot9 = slot9 .. slot10 .. slot11
		slot8.text = slot9
	end

	slot9 = slot1
	slot8 = slot1.Find
	slot10 = "advance"
	slot8 = slot8(slot9, slot10)
	slot9 = 0

	if slot3 <= slot9 then
		slot9 = SetActive
		slot10 = slot8
		slot11 = false

		slot9(slot10, slot11)
	else
		slot9 = SetActive
		slot10 = slot8
		slot11 = true

		slot9(slot10, slot11)

		slot10 = slot8
		slot9 = slot8.GetComponent
		slot11 = typeof
		slot12 = Text
		slot9 = slot9(slot10, slot11(slot12))
		slot10 = "[+"
		slot11 = slot3 * slot5
		slot12 = "]"
		slot10 = slot10 .. slot11 .. slot12
		slot9.text = slot10
	end
end

slot0.setBar = slot2

function slot2(slot0)
	slot1 = setActive
	slot2 = slot0._topPanel
	slot3 = true

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = false

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "icon/canteen"
	slot2 = slot2(slot3, slot4)
	slot3 = false

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "icon/shop"
	slot2 = slot2(slot3, slot4)
	slot3 = false

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "describe/canteen"
	slot2 = slot2(slot3, slot4)
	slot3 = false

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "describe/shop"
	slot2 = slot2(slot3, slot4)
	slot3 = false

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "produce/label/canteen"
	slot2 = slot2(slot3, slot4)
	slot3 = false

	slot1(slot2, slot3)

	slot1 = SetActive
	slot2 = slot0._resourceLayer
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "produce/label/shop"
	slot2 = slot2(slot3, slot4)
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.closeSecondPanel

	slot1(slot2)
end

slot0.CloseResourcePanel = slot2

function slot2(slot0, slot1, slot2)
	slot3 = nil
	slot4 = ResourceField
	slot4 = slot4.TYPE_GOLD

	if slot1 == slot4 then
		slot3 = slot0._shop
	else
		slot4 = ResourceField
		slot4 = slot4.TYPE_OIL

		if slot1 == slot4 then
			slot3 = slot0._canteen
		end
	end

	slot4 = SetActive
	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "popup_contain/popup"
	slot5 = slot5(slot6, slot7)
	slot6 = false

	slot4(slot5, slot6)

	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "float"
	slot4 = slot4(slot5, slot6)
	slot6 = slot4
	slot5 = slot4.Find
	slot7 = "Text"
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.GetComponent
	slot7 = typeof
	slot8 = Text
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot4
	slot6 = slot4.GetComponent
	slot8 = typeof
	slot9 = Image
	slot6 = slot6(slot7, slot8(slot9))
	slot7 = SetActive
	slot8 = slot4
	slot9 = true

	slot7(slot8, slot9)

	slot7 = "+"
	slot8 = slot2
	slot7 = slot7 .. slot8
	slot5.text = slot7
	slot7 = slot4.localPosition
	slot8 = rtf
	slot9 = slot4
	slot8 = slot8(slot9)
	slot9 = Vector2
	slot10 = slot7.x
	slot11 = y
	slot9 = slot9(slot10, slot11)
	slot8.anchoredPosition = slot9
	slot8 = LeanTween
	slot8 = slot8.moveY
	slot9 = rtf
	slot10 = slot4
	slot9 = slot9(slot10)
	slot10 = 100
	slot11 = 4
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = slot8
	slot8 = slot8.setOnUpdate
	slot10 = System
	slot10 = slot10.Action_float

	function slot11(slot0)
		slot1 = Color
		slot2 = 1
		slot3 = 1
		slot4 = 1
		slot5 = slot0 * 0.05
		slot5 = 1.5 - slot5
		slot1 = slot1(slot2, slot3, slot4, slot5)
		slot2 = slot0
		slot2.color = slot1
		slot2 = slot1
		slot2.color = slot1
	end

	slot8 = slot8(slot9, slot10(slot11))
	slot9 = slot8
	slot8 = slot8.setOnComplete
	slot10 = System
	slot10 = slot10.Action

	function slot11()
		slot0 = SetActive
		slot1 = slot0
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot1
		slot0.localPosition = slot1
	end

	slot8(slot9, slot10(slot11))
end

slot0.GetResourceDone = slot2

function slot2(slot0)
	slot1 = true
	slot0.isOpenSecondPanel = slot1
	slot1 = ipairs
	slot2 = slot0._panelTimer
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.TimeMgr
		slot7 = slot6
		slot6 = slot6.GetInstance
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.RemoveTimer
		slot8 = slot5

		slot6(slot7, slot8)
	end

	slot1 = {}
	slot0._panelTimer = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.BlurPanel
	slot3 = slot0._blurLayer
	slot4 = false

	slot1(slot2, slot3, slot4)
end

slot0.openSecondPanel = slot2

function slot2(slot0)
	slot1 = nil
	slot0.isOpenSecondPanel = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0._blurLayer
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)

	slot1 = ipairs
	slot2 = slot0._panelTimer
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.TimeMgr
		slot7 = slot6
		slot6 = slot6.GetInstance
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.RemoveTimer
		slot8 = slot5

		slot6(slot7, slot8)
	end

	slot1 = {}
	slot0._panelTimer = slot1
	slot1 = slot0
	slot1 = slot1.STATE_ACADEMY
	slot0._currentState = slot1
end

slot0.closeSecondPanel = slot2

function slot2(slot0, slot1, slot2, slot3)
	function slot4(slot0)
		slot1 = slot0

		if slot1 == nil then
			slot1 = PoolMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.ReturnSpineChar
			slot3 = slot1
			slot4 = slot0

			slot1(slot2, slot3, slot4)

			return
		end

		tf(slot0):SetParent(slot0, false)

		tf(slot0).localScale = Vector3(0.5, 0.5, 1)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)
		slot0:GetComponent("SpineAnimUI"):SetAction(slot2 or "stand", 0)

		slot2 or "stand".prefabs = slot2 or "stand".prefabs or {}

		table.insert(slot2 or "stand".prefabs, table.insert)

		slot2 or "stand".models = slot2 or "stand".models or {}
		slot1 = table.insert
		slot2 = slot2 or "stand".models
		slot3 = slot0

		slot1(slot2, slot3)
	end

	function slot5(slot0)
		slot1 = PoolMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.GetSpineChar
		slot3 = slot0
		slot4 = true

		function slot5(slot0)
			slot1 = slot0
			slot2 = slot0

			slot1(slot2)

			slot1 = slot1

			slot1()
		end

		slot1(slot2, slot3, slot4, slot5)
	end

	return slot5
end

slot0.loadCharacter = slot2

function slot2(slot0, slot1)
	slot2 = setPaintingPrefabAsync
	slot3 = slot0._painting
	slot4 = Ship
	slot4 = slot4.getPaintingName
	slot5 = slot1
	slot4 = slot4(slot5)
	slot5 = "info"

	slot2(slot3, slot4, slot5)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0._painting

	function slot5()
		slot0 = setButtonEnabled
		slot1 = slot0
		slot1 = slot1._painting
		slot2 = false

		slot0(slot1, slot2)

		slot0 = {
			"touch",
			"touch2"
		}
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.displayShipWord
		slot3 = slot1
		slot4 = math
		slot4 = slot4.random
		slot5 = #slot0
		slot4 = slot4(slot5)
		slot4 = slot0[slot4]

		slot1(slot2, slot3, slot4)
	end

	slot2(slot3, slot4, slot5)
end

slot0.SetPainting = slot2

function slot2(slot0, slot1)
	slot2 = retPaintingPrefab
	slot3 = slot0._painting
	slot4 = Ship
	slot4 = slot4.getPaintingName
	slot5 = slot1

	slot2(slot3, slot4(slot5))
end

slot0.RetPainting = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0._chatFlag

	if not slot3 then
		slot3 = true
		slot0._chatFlag = slot3
		slot3 = slot0._chatTimer

		if slot3 then
			slot3 = slot0._chatTimer
			slot4 = slot3
			slot3 = slot3.Stop

			slot3(slot4)

			slot3 = nil
			slot0._chatTimer = slot3
		end

		slot3 = setText
		slot4 = slot0._chatText
		slot5 = Ship
		slot5 = slot5.getWords
		slot6 = slot1.skinId
		slot7 = slot2

		slot3(slot4, slot5(slot6, slot7))

		slot3 = slot0._chatText
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot4 = slot3.text
		slot4 = #slot4
		slot5 = CHAT_POP_STR_LEN_SHORT

		if slot5 < slot4 then
			slot4 = TextAnchor
			slot4 = slot4.MiddleLeft
			slot3.alignment = slot4
		else
			slot4 = TextAnchor
			slot4 = slot4.MiddleCenter
			slot3.alignment = slot4
		end

		slot4 = LeanTween
		slot4 = slot4.scale
		slot5 = rtf
		slot6 = slot0._chat
		slot6 = slot6.gameObject
		slot5 = slot5(slot6)
		slot6 = Vector3
		slot6 = slot6.New
		slot7 = 1
		slot8 = 1
		slot9 = 1
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = 0.3
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot4
		slot4 = slot4.setEase
		slot6 = LeanTweenType
		slot6 = slot6.easeOutBack
		slot4 = slot4(slot5, slot6)
		slot5 = slot4
		slot4 = slot4.setOnComplete
		slot6 = System
		slot6 = slot6.Action

		function slot7()
			slot0 = LeanTween
			slot0 = slot0.scale
			slot1 = rtf
			slot2 = slot0
			slot2 = slot2._chat
			slot2 = slot2.gameObject
			slot1 = slot1(slot2)
			slot2 = Vector3
			slot2 = slot2.New
			slot3 = 0
			slot4 = 0
			slot5 = 1
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = 0.3
			slot0 = slot0(slot1, slot2, slot3)
			slot1 = slot0
			slot0 = slot0.setEase
			slot2 = LeanTweenType
			slot2 = slot2.easeInBack
			slot0 = slot0(slot1, slot2)
			slot1 = slot0
			slot0 = slot0.setDelay
			slot2 = 2.3
			slot0 = slot0(slot1, slot2)
			slot1 = slot0
			slot0 = slot0.setOnComplete
			slot2 = System
			slot2 = slot2.Action

			function slot3()
				slot0 = slot0
				slot1 = nil
				slot0._chatFlag = slot1
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.startChatTimer
				slot2 = slot1

				slot0(slot1, slot2)

				slot0 = setButtonEnabled
				slot1 = slot0
				slot1 = slot1._painting
				slot2 = true

				slot0(slot1, slot2)
			end

			slot0(slot1, slot2(slot3))
		end

		slot4(slot5, slot6(slot7))
	end
end

slot0.displayShipWord = slot2

function slot2(slot0, slot1)
	slot2 = slot0._chatFlag

	if slot2 then
		return
	end

	slot2 = slot0._chatTimer

	if slot2 then
		slot2 = slot0._chatTimer
		slot3 = slot2
		slot2 = slot2.Stop

		slot2(slot3)

		slot2 = nil
		slot0._chatTimer = slot2
	end

	slot2 = Timer
	slot2 = slot2.New

	function slot3()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.displayShipWord
		slot2 = slot1
		slot3 = "main"

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot1 = nil
		slot0._chatTimer = slot1
	end

	slot4 = 10
	slot5 = 1
	slot2 = slot2(slot3, slot4, slot5)
	slot0._chatTimer = slot2
	slot2 = slot0._chatTimer
	slot3 = slot2
	slot2 = slot2.Start

	slot2(slot3)
end

slot0.startChatTimer = slot2

function slot2(slot0)
	slot1 = slot0.prefabs

	if slot1 then
		slot1 = slot0.models

		if slot1 then
			slot1 = ipairs
			slot2 = slot0.prefabs
			slot1, slot2, slot3 = slot1(slot2)

			for slot4, slot5 in slot1, slot2, slot3 do
				slot6 = slot0.prefabs
				slot6 = slot6[slot4]
				slot7 = slot0.models
				slot7 = slot7[slot4]

				if slot6 and slot7 then
					slot8 = PoolMgr
					slot8 = slot8.GetInstance
					slot8 = slot8()
					slot9 = slot8
					slot8 = slot8.ReturnSpineChar
					slot10 = slot6
					slot11 = slot7

					slot8(slot9, slot10, slot11)
				end
			end
		end
	end

	slot1 = nil
	slot0.prefabs = slot1
	slot1 = nil
	slot0.models = slot1
end

slot0.recycleSpineChar = slot2

function slot2(slot0)
	slot1 = {}
	slot2 = {}
	slot3 = getProxy
	slot4 = TaskProxy
	slot3 = slot3(slot4)
	slot4 = getProxy
	slot5 = ActivityProxy
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.getActivitiesByType
	slot7 = ActivityConst
	slot7 = slot7.ACTIVITY_TYPE_TASK_LIST
	slot5 = slot5(slot6, slot7)
	slot6 = _
	slot6 = slot6.each
	slot7 = slot5

	function slot8(slot0)
		slot2 = slot0
		slot1 = slot0.isEnd
		slot1 = slot1(slot2)

		if not slot1 then
			slot2 = slot0
			slot1 = slot0.getConfig
			slot3 = "config_client"
			slot1 = slot1(slot2, slot3)
			slot3 = slot0
			slot2 = slot0.getConfig
			slot4 = "config_data"
			slot2 = slot2(slot3, slot4)
			slot3 = _
			slot3 = slot3.flatten
			slot4 = slot2
			slot3 = slot3(slot4)
			slot4, slot5 = nil
			slot6 = type
			slot7 = slot1
			slot6 = slot6(slot7)

			if slot6 == "table" then
				slot6 = ipairs
				slot7 = slot1
				slot6, slot7, slot8 = slot6(slot7)

				for slot9, slot10 in slot6, slot7, slot8 do
					slot11 = slot0
					slot12 = slot10.id
					slot13 = Ship
					slot13 = slot13.New
					slot14 = slot10
					slot13 = slot13(slot14)
					slot11[slot12] = slot13

					if slot9 == 1 then
						slot11 = slot0
						slot12 = slot10.id
						slot11 = slot11[slot12]
						slot12 = true
						slot11.withShipFace = slot12
						slot11 = {}
						slot12 = slot10.type

						if slot12 then
							slot12 = slot10.type
							slot11.type = slot12
							slot12 = slot10.param
							slot11.param = slot12
						end

						slot13 = slot0
						slot12 = slot0.getConfig
						slot14 = "config_id"
						slot12 = slot12(slot13, slot14)

						if slot12 ~= 2 then
							slot13 = slot0
							slot12 = slot0.getConfig
							slot14 = "config_id"
							slot12 = slot12(slot13, slot14)

							if slot12 == 3 then
								slot12 = getActivityTask
								slot13 = slot0
								slot14 = true
								slot12, slot13 = slot12(slot13, slot14)
								slot14 = slot1
								slot15 = slot14
								slot14 = slot14.getTaskById
								slot16 = slot12
								slot14 = slot14(slot15, slot16)
								slot15 = slot1
								slot16 = slot15
								slot15 = slot15.getFinishTaskById
								slot17 = slot12
								slot15 = slot15(slot16, slot17)

								if not slot12 or slot13 then
									if slot13 then
										slot17 = slot13
										slot16 = slot13.isFinish
										slot16 = slot16(slot17)

										if slot16 then
											slot17 = slot13
											slot16 = slot13.isReceive
											slot16 = slot16(slot17)
											slot16 = not slot16

											if not slot16 then
												slot16 = false
											end
										end
									end
								else
									slot16 = true
								end

								slot11.showTips = slot16
							else
								slot12 = slot1
								slot13 = slot12
								slot12 = slot12.getAcademyTask
								slot14 = slot0
								slot15 = slot10.id
								slot14 = slot14[slot15]
								slot14 = slot14.groupId
								slot12 = slot12(slot13, slot14)

								if slot12 then
									slot13 = slot1
									slot14 = slot13
									slot13 = slot13.getTaskById
									slot15 = slot12
									slot13 = slot13(slot14, slot15)

									if not slot13 then
										slot13 = slot1
										slot14 = slot13
										slot13 = slot13.getFinishTaskById
										slot15 = slot12
										slot13 = slot13(slot14, slot15)
									end

									if slot13 then
										slot5 = slot13
									else
										slot4 = slot12
									end
								end

								if slot5 then
									slot11.showTips = slot5:getTaskStatus() == 1
									slot11.acceptTaskId = slot4
									slot11.currentTask = slot5
								end
							end
						end

						slot12 = slot2
						slot13 = slot10.id
						slot12[slot13] = slot11
					end

					slot11 = slot10.tasks

					if slot11 then
						slot12 = true
						slot13 = table.indexof(slot3, slot4) or 0

						if slot5 then
							slot15 = (slot13 > 0 and slot13) or table.indexof(slot3, slot5.id) or 0
							slot16, slot17, slot18 = ipairs(slot11)

							for slot19, slot20 in slot16, slot17, slot18 do
								if slot20 == slot15 then
									slot12 = false

									break
								end
							end

							slot16 = slot0
							slot17 = slot10.id
							slot16 = slot16[slot17]
							slot16.hide = slot12
						end
					end
				end
			end
		end
	end

	slot6(slot7, slot8)

	slot6 = getProxy
	slot7 = NavalAcademyProxy
	slot6 = slot6(slot7)
	slot8 = slot6
	slot7 = slot6.fillStudens
	slot9 = slot1
	slot7 = slot7(slot8, slot9)
	slot1 = slot7
	slot7 = slot1
	slot8 = slot2

	return slot7, slot8
end

slot0.getStudents = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.getStudents
	slot1, slot2 = slot1(slot2)
	slot3 = _
	slot3 = slot3.each
	slot4 = _
	slot4 = slot4.keys
	slot5 = slot0.academyStudents
	slot4 = slot4(slot5)

	function slot5(slot0)
		slot1 = slot0
		slot1 = slot1[slot0]
		slot2 = slot1
		slot2 = slot2[slot0]
		slot3 = slot2
		slot3 = slot3.academyStudents
		slot3 = slot3[slot0]

		if slot1 then
			slot5 = slot3
			slot4 = slot3.updateStudent
			slot6 = slot1
			slot7 = slot2

			slot4(slot5, slot6, slot7)
		else
			slot5 = slot3
			slot4 = slot3.detach

			slot4(slot5)
		end
	end

	slot3(slot4, slot5)

	slot3 = pairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0.academyStudents
		slot8 = slot8[slot6]

		if not slot8 then
			slot8 = slot2[slot6]
			slot9 = cloneTplTo
			slot10 = slot0._shipTpl
			slot11 = slot0._map
			slot9 = slot9(slot10, slot11)
			slot10 = NavalAcademyStudent
			slot10 = slot10.New
			slot11 = slot9.gameObject
			slot10 = slot10(slot11)
			slot12 = slot10
			slot11 = slot10.attach

			slot11(slot12)

			slot12 = slot10
			slot11 = slot10.setPathFinder
			slot13 = slot0.academyGraphPath

			slot11(slot12, slot13)

			slot12 = slot10
			slot11 = slot10.setCallBack

			function slot13(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.onStateChange
				slot3 = slot1
				slot4 = slot0

				slot1(slot2, slot3, slot4)
			end

			function slot14(slot0, slot1)
				slot2 = slot0
				slot3 = slot2
				slot2 = slot2.getStudents
				slot2, slot3 = slot2(slot3)
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.onTask
				slot6 = slot1
				slot7 = slot2
				slot7 = slot3[slot7]

				slot4(slot5, slot6, slot7)
			end

			slot11(slot12, slot13, slot14)

			slot12 = slot10
			slot11 = slot10.updateStudent
			slot13 = slot7
			slot14 = slot8

			slot11(slot12, slot13, slot14)

			slot11 = slot0.academyStudents
			slot11[slot6] = slot10
		end
	end

	slot4 = slot0
	slot3 = slot0.sortStudents

	slot3(slot4)
end

slot0.updateStudents = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.sortTimer

	if slot3 then
		slot3 = slot0.sortTimer
		slot4 = slot3
		slot3 = slot3.Stop

		slot3(slot4)

		slot3 = nil
		slot0.sortTimer = slot3
	end

	slot3 = NavalAcademyStudent
	slot3 = slot3.ShipState
	slot3 = slot3.Walk

	if slot2 == slot3 then
		slot3 = Timer
		slot3 = slot3.New

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.sortStudents

			slot0(slot1)
		end

		slot5 = 0.2
		slot6 = -1
		slot3 = slot3(slot4, slot5, slot6)
		slot0.sortTimer = slot3
		slot3 = slot0.sortTimer
		slot4 = slot3
		slot3 = slot3.Start

		slot3(slot4)
	end
end

slot0.onStateChange = slot2

function slot2(slot0)
	slot1 = {}
	slot2 = slot0._fountain
	slot1[1] = slot2
	slot2 = pairs
	slot3 = slot0.academyStudents
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = table
		slot7 = slot7.insert
		slot8 = slot1
		slot9 = slot6._tf

		slot7(slot8, slot9)
	end

	slot2 = table
	slot2 = slot2.sort
	slot3 = slot1

	function slot4(slot0, slot1)
		return slot0.anchoredPosition.y < slot1.anchoredPosition.y
	end

	slot2(slot3, slot4)

	slot2 = 5
	slot3 = ipairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot9 = slot7
		slot8 = slot7.SetSiblingIndex
		slot10 = slot2

		slot8(slot9, slot10)
	end
end

slot0.sortStudents = slot2

function slot2(slot0, slot1, slot2)
	slot3 = getProxy
	slot4 = TaskProxy
	slot3 = slot3(slot4)
	slot4 = getProxy
	slot5 = ActivityProxy
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.getActivitiesByType
	slot7 = ActivityConst
	slot7 = slot7.ACTIVITY_TYPE_TASK_LIST
	slot5 = slot5(slot6, slot7)
	slot6 = _
	slot6 = slot6.detect
	slot7 = slot5

	function slot8(slot0)
		slot2 = slot0
		slot1 = slot0.getTaskShip
		slot1 = slot1(slot2)

		if slot1 then
			return slot1.groupId == slot0.groupId
		end
	end

	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot8 = slot6
		slot7 = slot6.isEnd
		slot7 = slot7(slot8)

		if not slot7 then
			slot7 = slot6.id
			slot8 = ActivityConst
			slot8 = slot8.JYHZ_ACTIVITY_ID

			if slot7 == slot8 then
				slot7 = slot2.acceptTaskId

				if slot7 then
					slot8 = slot3
					slot7 = slot3.getAcademyTask
					slot9 = slot1.groupId
					slot7 = slot7(slot8, slot9)
					slot9 = slot4
					slot8 = slot4.getActivityByType
					slot10 = ActivityConst
					slot10 = slot10.ACTIVITY_TYPE_ZPROJECT
					slot8 = slot8(slot9, slot10)

					if slot8 then
						slot10 = slot8
						slot9 = slot8.getConfig
						slot11 = "config_data"
						slot9 = slot9(slot10, slot11)
						slot10 = _
						slot10 = slot10.detect
						slot11 = slot9

						function slot12(slot0)
							return pg.chapter_template[slot0].npc_data[3] == slot0
						end

						slot10 = slot10(slot11, slot12)

						if slot10 then
							slot11 = getProxy
							slot12 = ChapterProxy
							slot11 = slot11(slot12)
							slot13 = slot11
							slot12 = slot11.getChapterById
							slot14 = slot10
							slot12 = slot12(slot13, slot14)
							slot13 = slot12.active

							if slot13 then
								slot13 = pg
								slot13 = slot13.TipsMgr
								slot13 = slot13.GetInstance
								slot13 = slot13()
								slot14 = slot13
								slot13 = slot13.ShowTips
								slot15 = i18n
								slot16 = "task_target_chapter_in_progress"

								slot13(slot14, slot15(slot16))

								return
							end
						end
					end
				end
			end

			slot7 = slot2.type

			if slot7 then
				slot7 = slot2.type

				if slot7 == 1 then
					slot7 = Application
					slot7 = slot7.OpenURL
					slot8 = slot2.param

					slot7(slot8)
				else
					slot7 = slot2.type

					if slot7 == 2 then
						slot8 = slot0
						slot7 = slot0.emit
						slot9 = NavalAcademyMediator
						slot9 = slot9.GO_SCENE
						slot10 = slot2.param

						slot7(slot8, slot9, slot10)
					else
						slot7 = slot2.type

						if slot7 == 3 then
							slot8 = slot0
							slot7 = slot0.emit
							slot9 = NavalAcademyMediator
							slot9 = slot9.OPEN_ACTIVITY_PANEL
							slot10 = tonumber
							slot11 = slot2.param

							slot7(slot8, slot9, slot10(slot11))
						else
							slot7 = slot2.type

							if slot7 == 4 then
								slot8 = slot0
								slot7 = slot0.emit
								slot9 = NavalAcademyMediator
								slot9 = slot9.OPEN_ACTIVITY_SHOP

								slot7(slot8, slot9)
							else
								slot7 = slot2.type

								if slot7 == 5 then
									slot8 = slot0
									slot7 = slot0.emit
									slot9 = NavalAcademyMediator
									slot9 = slot9.OPEN_SCROLL
									slot10 = tonumber
									slot11 = slot2.param

									slot7(slot8, slot9, slot10(slot11))
								end
							end
						end
					end
				end
			else
				slot7 = slot2.acceptTaskId

				if slot7 then
					slot7 = getProxy
					slot8 = PlayerProxy
					slot7 = slot7(slot8)
					slot9 = slot7
					slot8 = slot7.getRawData
					slot8 = slot8(slot9)
					slot9 = pg
					slot9 = slot9.task_data_template
					slot10 = slot2.acceptTaskId
					slot9 = slot9[slot10]
					slot10 = slot8.level
					slot11 = slot9.level

					if slot10 < slot11 then
						slot10 = pg
						slot10 = slot10.TipsMgr
						slot10 = slot10.GetInstance
						slot10 = slot10()
						slot11 = slot10
						slot10 = slot10.ShowTips
						slot12 = i18n
						slot13 = "task_level_notenough"
						slot14 = slot9.level

						slot10(slot11, slot12(slot13, slot14))

						return
					end

					slot11 = slot0
					slot10 = slot0.emit
					slot12 = NavalAcademyMediator
					slot12 = slot12.ACTIVITY_OP
					slot13 = {
						cmd = 1
					}
					slot14 = slot6.id
					slot13.activity_id = slot14
					slot14 = slot2.acceptTaskId
					slot13.arg1 = slot14

					slot10(slot11, slot12, slot13)
				else
					slot7 = slot2.currentTask

					if slot7 then
						slot7 = slot2.currentTask
						slot8 = slot7
						slot7 = slot7.isFinish
						slot7 = slot7(slot8)

						if not slot7 then
							slot7 = slot2.currentTask
							slot8 = slot7
							slot7 = slot7.getConfig
							slot9 = "sub_type"
							slot7 = slot7(slot8, slot9)

							if slot7 == 29 then
								slot8 = slot0
								slot7 = slot0.emit
								slot9 = NavalAcademyMediator
								slot9 = slot9.TASK_GO
								slot10 = {}
								slot11 = slot2.currentTask
								slot10.taskVO = slot11

								slot7(slot8, slot9, slot10)
							end
						else
							slot8 = slot0
							slot7 = slot0.emit
							slot9 = NavalAcademyMediator
							slot9 = slot9.GO_TASK_SCENE
							slot10 = {
								page = "activity"
							}

							slot7(slot8, slot9, slot10)
						end
					else
						slot7 = pg
						slot7 = slot7.TipsMgr
						slot7 = slot7.GetInstance
						slot7 = slot7()
						slot8 = slot7
						slot7 = slot7.ShowTips
						slot9 = i18n
						slot10 = "main_navalAcademyScene_work_done"

						slot7(slot8, slot9(slot10))
					end
				end
			end
		end
	end
end

slot0.onTask = slot2

function slot2(slot0)
	slot1 = slot0.sortTimer

	if slot1 then
		slot1 = slot0.sortTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.sortTimer = slot1
	end

	slot1 = pairs
	slot2 = slot0.academyStudents
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.detach

		slot6(slot7)

		slot6 = Destroy
		slot7 = slot5._go

		slot6(slot7)
	end

	slot1 = {}
	slot0.academyStudents = slot1
end

slot0.clearStudents = slot2

function slot2(slot0)
	slot1 = triggerButton
	slot2 = slot0._backBtn

	slot1(slot2)
end

slot0.onBackPressed = slot2

function slot2(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0._blurLayer
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)

	slot1 = ipairs
	slot2 = slot0._panelTimer
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.TimeMgr
		slot7 = slot6
		slot6 = slot6.GetInstance
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.RemoveTimer
		slot8 = slot5

		slot6(slot7, slot8)
	end

	slot1 = pairs
	slot2 = slot0._buildingTimers
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.TimeMgr
		slot7 = slot6
		slot6 = slot6.GetInstance
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.RemoveTimer
		slot8 = slot5

		slot6(slot7, slot8)
	end

	slot1 = slot0._chatTimer

	if slot1 then
		slot1 = slot0._chatTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0._chatTimer = slot1
	end

	slot1 = IsNil
	slot2 = slot0._courseLayer
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = Destroy
		slot2 = slot0._courseLayer

		slot1(slot2)

		slot1 = nil
		slot0._courseLayer = slot1
	end

	slot1 = IsNil
	slot2 = slot0._resourceLayer
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = Destroy
		slot2 = slot0._resourceLayer

		slot1(slot2)

		slot1 = nil
		slot0._resourceLayer = slot1
	end

	slot1 = IsNil
	slot2 = slot0._merchatLayer
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = Destroy
		slot2 = slot0._merchatLayer

		slot1(slot2)

		slot1 = nil
		slot0._merchatLayer = slot1
	end

	slot1 = slot0._resPanel

	if slot1 then
		slot1 = slot0._resPanel
		slot2 = slot1
		slot1 = slot1.exit

		slot1(slot2)

		slot1 = nil
		slot0._resPanel = slot1
	end

	slot1 = slot0.tweens

	if slot1 then
		slot1 = cancelTweens
		slot2 = slot0.tweens

		slot1(slot2)
	end

	slot2 = slot0
	slot1 = slot0.clearStudents

	slot1(slot2)
end

slot0.willExit = slot2

function slot2(slot0, slot1)
	slot2 = setActive
	slot3 = slot0.sakura
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.langhua
	slot4 = slot1

	slot2(slot3, slot4)
end

slot0.activeSakura = slot2

return slot0
