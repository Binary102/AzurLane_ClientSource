slot0 = class
slot1 = "LevelFleetPanel"
slot2 = import
slot3 = "..base.BasePanel"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.init
	slot2 = slot0

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/shiptpl"
	slot1 = slot1(slot2, slot3)
	slot0.tfShipTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/emptytpl"
	slot1 = slot1(slot2, slot3)
	slot0.tfEmptyTpl = slot1
	slot1 = {}
	slot2 = FleetType
	slot2 = slot2.Normal
	slot3 = {}
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/fleet/1"
	slot4 = slot4(slot5, slot6)
	slot3[1] = slot4
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/fleet/2"
	slot3[MULTRES] = slot4(slot5, slot6)
	slot1[slot2] = slot3
	slot2 = FleetType
	slot2 = slot2.Submarine
	slot3 = {}
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "panel/sub/1"
	slot3[MULTRES] = slot4(slot5, slot6)
	slot1[slot2] = slot3
	slot0.tfFleets = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimit = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit_elite"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimitElite = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/limit_tip"
	slot1 = slot1(slot2, slot3)
	slot0.tfLimitTips = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/btnBack"
	slot1 = slot1(slot2, slot3)
	slot0.btnBack = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/start_button"
	slot1 = slot1(slot2, slot3)
	slot0.btnGo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "panel/commander_btn"
	slot1 = slot1(slot2, slot3)
	slot0.commanderBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mask"
	slot1 = slot1(slot2, slot3)
	slot0.toggleMask = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mask/list"
	slot1 = slot1(slot2, slot3)
	slot0.toggleList = slot1
	slot1 = {}
	slot0.toggles = slot1
	slot1 = 0
	slot2 = slot0.toggleList
	slot2 = slot2.childCount
	slot2 = slot2 - 1
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = table
		slot5 = slot5.insert
		slot6 = slot0.toggles
		slot7 = slot0.toggleList
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "item"
		slot10 = slot4 + 1
		slot9 = slot9 .. slot10

		slot5(slot6, slot7(slot8, slot9))
	end

	slot1 = setActive
	slot2 = slot0.tfShipTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.tfEmptyTpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.toggleMask
	slot3 = false

	slot1(slot2, slot3)

	slot1 = nil
	slot0.onConfirm = slot1
	slot1 = nil
	slot0.onCancel = slot1
end

slot0.init = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot0.chapter = slot1
	slot0.fleets = _(_.values(slot2)):chain():filter(function (slot0)
		return slot0:isRegularFleet()
	end):sort(function (slot0, slot1)
		return slot0.id < slot1.id
	end):value()
	slot0.selectIds = {
		[FleetType.Normal] = {},
		[FleetType.Submarine] = {}
	}
	slot4 = ipairs
	slot5 = slot3 or {}
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot0
		slot9 = slot0.getFleetById
		slot11 = slot8
		slot9 = slot9(slot10, slot11)

		if slot9 then
			slot11 = slot9
			slot10 = slot9.getFleetType
			slot10 = slot10(slot11)
			slot11 = slot0.selectIds
			slot11 = slot11[slot10]
			slot12 = #slot11
			slot14 = slot0
			slot13 = slot0.getLimitNums
			slot15 = slot10
			slot13 = slot13(slot14, slot15)

			if slot12 < slot13 then
				slot12 = table
				slot12 = slot12.insert
				slot13 = slot11
				slot14 = slot8

				slot12(slot13, slot14)
			end
		end
	end

	slot4 = setActive
	slot5 = slot0.tfLimitElite
	slot6 = false

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.tfLimitTips
	slot6 = false

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.tfLimit
	slot6 = true

	slot4(slot5, slot6)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.btnGo

	function slot7()
		slot0 = slot0
		slot0 = slot0.onConfirm

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onConfirm
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getSelectIds

			slot0(slot1(slot2))
		end
	end

	slot8 = SFX_UI_WEIGHANCHOR_GO

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.btnBack

	function slot7()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		end
	end

	slot8 = SFX_CANCEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0._tf

	function slot7()
		slot0 = slot0
		slot0 = slot0.onCancel

		if slot0 then
			slot0 = slot0
			slot0 = slot0.onCancel

			slot0()
		end
	end

	slot8 = SFX_CANCEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onButton
	slot5 = slot0
	slot6 = slot0.toggleMask

	function slot7()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideToggleMask

		slot0(slot1)
	end

	slot8 = SFX_CANCEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = onToggle
	slot5 = slot0
	slot6 = slot0.commanderBtn

	function slot7(slot0)
		slot1 = slot0
		slot1 = slot1.parent
		slot1 = slot1.contextData
		slot1.showCommander = slot0
		slot1 = pairs
		slot2 = slot0
		slot2 = slot2.tfFleets
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = 1
			slot7 = #slot5
			slot8 = 1

			for slot9 = slot6, slot7, slot8 do
				slot10 = slot0
				slot11 = slot10
				slot10 = slot10.updateCommanderBtn
				slot12 = slot4
				slot13 = slot9

				slot10(slot11, slot12, slot13)
			end
		end
	end

	slot8 = SFX_PANEL

	slot4(slot5, slot6, slot7, slot8)

	slot4 = triggerToggle
	slot5 = slot0.commanderBtn
	slot6 = slot0.parent
	slot6 = slot6.contextData
	slot6 = slot6.showCommander

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.commanderBtn
	slot6 = slot0.parent
	slot6 = slot6.openedCommanerSystem

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.clearFleets

	slot4(slot5)

	slot5 = slot0
	slot4 = slot0.updateFleets

	slot4(slot5)

	slot5 = slot0
	slot4 = slot0.updateLimit

	slot4(slot5)
end

slot0.set = slot1

function slot1(slot0, slot1)
	slot2 = _
	slot2 = slot2.detect
	slot3 = slot0.fleets

	function slot4(slot0)
		return slot0.id == slot0
	end

	return slot2(slot3, slot4)
end

slot0.getFleetById = slot1

function slot1(slot0, slot1)
	slot2 = 0
	slot3 = FleetType
	slot3 = slot3.Normal

	if slot1 == slot3 then
		slot3 = slot0.chapter
		slot4 = slot3
		slot3 = slot3.getConfig
		slot5 = "group_num"
		slot3 = slot3(slot4, slot5)
		slot2 = slot3
	else
		slot3 = FleetType
		slot3 = slot3.Submarine

		if slot1 == slot3 then
			slot3 = slot0.chapter
			slot4 = slot3
			slot3 = slot3.getConfig
			slot5 = "submarine_num"
			slot3 = slot3(slot4, slot5)
			slot2 = slot3
		end
	end

	return slot2
end

slot0.getLimitNums = slot1

function slot1(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0.selectIds
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = ipairs
		slot8 = slot6
		slot7, slot8, slot9 = slot7(slot8)

		for slot10, slot11 in slot7, slot8, slot9 do
			slot12 = 0

			if slot11 > slot12 then
				slot12 = table
				slot12 = slot12.insert
				slot13 = slot1
				slot14 = slot11

				slot12(slot13, slot14)
			end
		end
	end

	slot2 = _
	slot2 = slot2.sort
	slot3 = slot1

	function slot4(slot0, slot1)
		return slot0 < slot1
	end

	slot2(slot3, slot4)

	return slot1
end

slot0.getSelectIds = slot1

function slot1(slot0)
	slot1 = pairs
	slot2 = slot0.tfFleets
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = 1
		slot7 = #slot5
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot11 = slot0
			slot10 = slot0.updateFleet
			slot12 = slot4
			slot13 = slot9

			slot10(slot11, slot12, slot13)
		end
	end
end

slot0.updateFleets = slot1

function slot1(slot0)
	slot1 = _
	slot1 = slot1.filter
	slot2 = slot0.selectIds
	slot3 = FleetType
	slot3 = slot3.Normal
	slot2 = slot2[slot3]

	function slot3(slot0)
		return slot0 > 0
	end

	slot1 = slot1(slot2, slot3)
	slot1 = #slot1
	slot2 = _
	slot2 = slot2.filter
	slot3 = slot0.selectIds
	slot4 = FleetType
	slot4 = slot4.Submarine
	slot3 = slot3[slot4]

	function slot4(slot0)
		return slot0 > 0
	end

	slot2 = slot2(slot3, slot4)
	slot2 = #slot2
	slot4 = slot0
	slot3 = slot0.getLimitNums
	slot5 = FleetType
	slot5 = slot5.Normal
	slot3 = slot3(slot4, slot5)
	slot4 = setText
	slot5 = slot0.tfLimit
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "number"
	slot5 = slot5(slot6, slot7)
	slot6 = string
	slot6 = slot6.format
	slot7 = "%d/%d"
	slot8 = slot1
	slot9 = slot3

	slot4(slot5, slot6(slot7, slot8, slot9))

	slot5 = slot0
	slot4 = slot0.getLimitNums
	slot6 = FleetType
	slot6 = slot6.Submarine
	slot4 = slot4(slot5, slot6)
	slot5 = setText
	slot6 = slot0.tfLimit
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "number_sub"
	slot6 = slot6(slot7, slot8)
	slot7 = string
	slot7 = slot7.format
	slot8 = "%d/%d"
	slot9 = slot2
	slot10 = slot4

	slot5(slot6, slot7(slot8, slot9, slot10))
end

slot0.updateLimit = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = fleetId

	if slot4 ~= slot3 then
		slot4 = slot0.selectIds
		slot4 = slot4[slot1]
		slot5 = 0

		if slot3 > slot5 then
			slot5 = table
			slot5 = slot5.contains
			slot6 = slot4
			slot7 = slot3
			slot5 = slot5(slot6, slot7)

			if slot5 then
				return
			end
		end

		slot5 = FleetType
		slot5 = slot5.Normal

		if slot1 == slot5 then
			slot6 = slot0
			slot5 = slot0.getLimitNums
			slot7 = slot1
			slot5 = slot5(slot6, slot7)
			slot6 = 0

			if slot5 > slot6 and slot3 == 0 then
				slot5 = _
				slot5 = slot5.filter
				slot6 = slot4

				function slot7(slot0)
					return slot0 > 0
				end

				slot5 = slot5(slot6, slot7)
				slot5 = #slot5

				if slot5 == 1 then
					slot5 = pg
					slot5 = slot5.TipsMgr
					slot6 = slot5
					slot5 = slot5.GetInstance
					slot5 = slot5(slot6)
					slot6 = slot5
					slot5 = slot5.ShowTips
					slot7 = i18n
					slot8 = "level_fleet_lease_one_ship"

					slot5(slot6, slot7(slot8))

					return
				end
			end
		end

		slot6 = slot0
		slot5 = slot0.getFleetById
		slot7 = slot3
		slot5 = slot5(slot6, slot7)

		if slot5 then
			slot7 = slot5
			slot6 = slot5.isUnlock
			slot6 = slot6(slot7)

			if not slot6 then
				return
			end

			slot7 = slot5
			slot6 = slot5.isLegalToFight
			slot6 = slot6(slot7)

			if slot6 ~= true then
				slot6 = pg
				slot6 = slot6.TipsMgr
				slot7 = slot6
				slot6 = slot6.GetInstance
				slot6 = slot6(slot7)
				slot7 = slot6
				slot6 = slot6.ShowTips
				slot8 = i18n
				slot9 = "level_fleet_not_enough"

				slot6(slot7, slot8(slot9))

				return
			end
		end

		slot4[slot2] = slot3
		slot7 = slot0
		slot6 = slot0.updateFleet
		slot8 = slot1
		slot9 = slot2

		slot6(slot7, slot8, slot9)

		slot7 = slot0
		slot6 = slot0.updateLimit

		slot6(slot7)
	end
end

slot0.selectFleet = slot1

function slot1(slot0, slot1, slot2)
	slot7 = slot0:findTF("btn_clear", slot5)
	slot8 = slot0:findTF("blank", slot5)
	slot9 = slot0:findTF("commander", slot5)
	slot11 = slot0:getFleetById(slot10)
	slot12 = setActive
	slot13 = slot0:findTF("btn_select", slot5)

	if slot2 <= slot0:getLimitNums(slot1) then
		slot14 = slot0.parent
		slot14 = slot14.contextData
		slot14 = slot14.showCommander
		slot14 = not slot14
	end

	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot7

	if slot3 then
		slot14 = slot0.parent
		slot14 = slot14.contextData
		slot14 = slot14.showCommander
		slot14 = not slot14
	end

	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot8

	if slot3 then
		if slot3 then
			if not slot11 then
				slot14 = slot0.parent
				slot14 = slot14.contextData
				slot14 = slot14.showCommander
			else
				slot14 = false
			end
		end
	else
		slot14 = true
	end

	slot12(slot13, slot14)
	setActive(slot9, slot0.parent.contextData.showCommander and slot3 and slot11)
end

slot0.updateCommanderBtn = slot1

function slot1(slot0, slot1, slot2)
	slot0:updateCommanderBtn(slot1, slot2)

	slot5 = slot0:getFleetById(slot4)
	slot6 = slot2 <= slot0:getLimitNums(slot1)
	slot9 = slot0:findTF(TeamType.Main, slot7)
	slot10 = slot0:findTF(TeamType.Vanguard, slot7)
	slot11 = slot0:findTF(TeamType.Submarine, slot7)
	slot12 = slot0:findTF("btn_select", slot7)
	slot14 = slot0:findTF("btn_clear", slot7)
	slot15 = slot0:findTF("blank", slot7)
	slot17 = slot0:findTF("commander", slot7)

	setActive(slot13, false)
	setActive(slot16, false)
	setText(findTF(slot7, "bg/name"), "")

	if slot9 then
		setActive(slot9, slot6 and slot5)
	end

	if slot10 then
		setActive(slot10, slot6 and slot5)
	end

	if slot11 then
		setActive(slot11, slot6 and slot5)
	end

	if slot6 then
		slot18 = setText
		slot19 = slot8
		slot20 = slot5.name

		slot18(slot19, Fleet.DEFAULT_NAME[slot5.id] or slot5.name)

		slot18 = FleetType.Submarine

		if slot1 == slot18 then
			slot19 = slot0
			slot18 = slot0.updateShips
			slot20 = slot11
			slot21 = slot5.subShips

			slot18(slot19, slot20, slot21)
		else
			slot19 = slot0
			slot18 = slot0.updateShips
			slot20 = slot9
			slot21 = slot5.mainShips

			slot18(slot19, slot20, slot21)

			slot19 = slot0
			slot18 = slot0.updateShips
			slot20 = slot10
			slot21 = slot5.vanguardShips

			slot18(slot19, slot20, slot21)
		end

		slot19 = slot0
		slot18 = slot0.updateCommanders
		slot20 = slot17
		slot21 = slot5

		slot18(slot19, slot20, slot21)

		slot18 = onButton
		slot19 = slot0
		slot20 = slot12

		function slot21()
			slot0 = slot0
			slot0 = slot0.toggleList
			slot1 = slot1
			slot1 = slot1.position
			slot2 = slot2
			slot2 = slot2.position
			slot1 = slot1 + slot2
			slot1 = slot1 / 2
			slot0.position = slot1
			slot0 = slot0
			slot0 = slot0.toggleList
			slot1 = slot0
			slot1 = slot1.toggleList
			slot1 = slot1.anchoredPosition
			slot2 = Vector2
			slot3 = slot0
			slot3 = slot3.toggleList
			slot3 = slot3.rect
			slot3 = slot3.width
			slot3 = -slot3
			slot3 = slot3 / 2
			slot4 = slot1
			slot4 = slot4.rect
			slot4 = slot4.height
			slot4 = -slot4
			slot4 = slot4 / 2
			slot2 = slot2(slot3, slot4)
			slot1 = slot1 + slot2
			slot0.anchoredPosition = slot1
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showToggleMask
			slot2 = slot3

			function slot3(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.hideToggleMask

				slot1(slot2)

				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.selectFleet
				slot3 = slot1
				slot4 = slot2
				slot5 = slot0

				slot1(slot2, slot3, slot4, slot5)
			end

			slot0(slot1, slot2, slot3)
		end

		slot22 = SFX_UI_CLICK

		slot18(slot19, slot20, slot21, slot22)

		slot18 = onButton
		slot19 = slot0
		slot20 = slot14

		function slot21()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.selectFleet
			slot2 = slot1
			slot3 = slot2
			slot4 = 0

			slot0(slot1, slot2, slot3, slot4)
		end

		slot22 = SFX_UI_CLICK

		slot18(slot19, slot20, slot21, slot22)
	end
end

slot0.updateFleet = slot1

function slot1(slot0, slot1, slot2)
	slot3 = 1
	slot4 = 2
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot8 = slot2
		slot7 = slot2.getCommanderByPos
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot9 = slot1
		slot8 = slot1.Find
		slot10 = "pos"
		slot11 = slot6
		slot10 = slot10 .. slot11
		slot8 = slot8(slot9, slot10)
		slot10 = slot8
		slot9 = slot8.Find
		slot11 = "add"
		slot9 = slot9(slot10, slot11)
		slot11 = slot8
		slot10 = slot8.Find
		slot12 = "info"
		slot10 = slot10(slot11, slot12)
		slot11 = setActive
		slot12 = slot9
		slot13 = not slot7

		slot11(slot12, slot13)

		slot11 = setActive
		slot12 = slot10
		slot13 = slot7

		slot11(slot12, slot13)

		if slot7 then
			slot11 = Commander
			slot11 = slot11.rarity2Frame
			slot13 = slot7
			slot12 = slot7.getRarity
			slot11 = slot11(slot12(slot13))
			slot12 = setImageSprite
			slot14 = slot10
			slot13 = slot10.Find
			slot15 = "frame"
			slot13 = slot13(slot14, slot15)
			slot14 = GetSpriteFromAtlas
			slot15 = "weaponframes"
			slot16 = "commander_"
			slot17 = slot11
			slot16 = slot16 .. slot17

			slot12(slot13, slot14(slot15, slot16))

			slot12 = GetImageSpriteFromAtlasAsync
			slot13 = "CommanderHrz/"
			slot15 = slot7
			slot14 = slot7.getPainting
			slot14 = slot14(slot15)
			slot13 = slot13 .. slot14
			slot14 = ""
			slot16 = slot10
			slot15 = slot10.Find
			slot17 = "mask/icon"

			slot12(slot13, slot14, slot15(slot16, slot17))
		end

		slot11 = onButton
		slot12 = slot0
		slot13 = slot9

		function slot14()
			slot0 = getProxy
			slot1 = PlayerProxy
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.setFlag
			slot2 = "lastFleetIndex"
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.getSelectIds

			slot0(slot1, slot2, slot3(slot4))

			slot0 = slot0
			slot0 = slot0.parent
			slot1 = slot0
			slot0 = slot0.openCommanderPanel
			slot2 = slot1
			slot3 = slot0
			slot3 = slot3.chapter
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot15 = SFX_PANEL

		slot11(slot12, slot13, slot14, slot15)

		slot11 = onButton
		slot12 = slot0
		slot13 = slot10

		function slot14()
			slot0 = slot0
			slot0 = slot0.parent
			slot1 = slot0
			slot0 = slot0.openCommanderPanel
			slot2 = slot1
			slot3 = slot0
			slot3 = slot3.chapter
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot15 = SFX_PANEL

		slot11(slot12, slot13, slot14, slot15)
	end
end

slot0.updateCommanders = slot1

function slot1(slot0, slot1, slot2)
	slot3 = UIItemList
	slot3 = slot3.New
	slot4 = slot1
	slot5 = slot0.tfShipTpl
	slot3 = slot3(slot4, slot5)
	slot5 = slot3
	slot4 = slot3.make

	function slot6(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = getProxy
			slot4 = BayProxy
			slot3 = slot3(slot4)
			slot5 = slot3
			slot4 = slot3.getShipById
			slot6 = slot0
			slot7 = slot1 + 1
			slot6 = slot6[slot7]
			slot4 = slot4(slot5, slot6)
			slot5 = updateShip
			slot6 = slot2
			slot7 = slot4

			slot5(slot6, slot7)

			slot6 = slot2
			slot5 = slot2.Find
			slot7 = "icon_bg/energy"
			slot5 = slot5(slot6, slot7)
			slot7 = slot4
			slot6 = slot4.getEnergeConfig
			slot6 = slot6(slot7)

			if slot6 then
				slot7 = slot6.id
				slot8 = 2

				if slot7 <= slot8 then
					slot7 = setActive
					slot8 = slot5
					slot9 = true

					slot7(slot8, slot9)

					slot7 = GetImageSpriteFromAtlasAsync
					slot8 = "energy"
					slot9 = slot6.icon
					slot10 = slot5

					slot7(slot8, slot9, slot10)
				end
			else
				slot7 = setActive
				slot8 = slot5
				slot9 = false

				slot7(slot8, slot9)
			end
		end
	end

	slot4(slot5, slot6)

	slot5 = slot3
	slot4 = slot3.align
	slot6 = #slot2

	slot4(slot5, slot6)
end

slot0.updateShips = slot1

function slot1(slot0, slot1, slot2)
	slot3 = setActive
	slot4 = slot0.toggleMask
	slot5 = true

	slot3(slot4, slot5)

	slot3 = _
	slot3 = slot3.filter
	slot4 = slot0.fleets

	function slot5(slot0)
		return slot0:getFleetType() == slot0
	end

	slot3 = slot3(slot4, slot5)
	slot4 = ipairs
	slot5 = slot0.toggles
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot3[slot7]
		slot10 = setActive
		slot11 = slot8
		slot12 = slot9

		slot10(slot11, slot12)

		if slot9 then
			slot11 = slot9
			slot10 = slot9.isUnlock
			slot10, slot11 = slot10(slot11)
			slot13 = slot8
			slot12 = slot8.Find
			slot14 = "lock"
			slot12 = slot12(slot13, slot14)
			slot13 = setButtonEnabled
			slot14 = slot8
			slot15 = slot10

			slot13(slot14, slot15)

			slot13 = setActive
			slot14 = slot12
			slot15 = not slot10

			slot13(slot14, slot15)

			if slot10 then
				slot13 = table
				slot13 = slot13.contains
				slot14 = slot0.selectIds
				slot14 = slot14[slot1]
				slot15 = slot9.id
				slot13 = slot13(slot14, slot15)
				slot14 = setActive
				slot15 = findTF
				slot16 = slot8
				slot17 = "selected"
				slot15 = slot15(slot16, slot17)
				slot16 = slot13

				slot14(slot15, slot16)

				slot14 = setActive
				slot15 = findTF
				slot16 = slot8
				slot17 = "text"
				slot15 = slot15(slot16, slot17)
				slot16 = not slot13

				slot14(slot15, slot16)

				slot14 = setActive
				slot15 = findTF
				slot16 = slot8
				slot17 = "text_selected"
				slot15 = slot15(slot16, slot17)
				slot16 = slot13

				slot14(slot15, slot16)

				slot14 = onButton
				slot15 = slot0
				slot16 = slot8

				function slot17()
					slot0 = slot0
					slot1 = slot1
					slot1 = slot1.id

					slot0(slot1)
				end

				slot18 = SFX_UI_TAG

				slot14(slot15, slot16, slot17, slot18)
			else
				slot13 = onButton
				slot14 = slot0
				slot15 = slot12

				function slot16()
					slot0 = pg
					slot0 = slot0.TipsMgr
					slot0 = slot0.GetInstance
					slot0 = slot0()
					slot1 = slot0
					slot0 = slot0.ShowTips
					slot2 = slot0

					slot0(slot1, slot2)
				end

				slot17 = SFX_UI_CLICK

				slot13(slot14, slot15, slot16, slot17)
			end
		end
	end
end

slot0.showToggleMask = slot1

function slot1(slot0)
	slot1 = setActive
	slot2 = slot0.toggleMask
	slot3 = false

	slot1(slot2, slot3)
end

slot0.hideToggleMask = slot1

function slot1(slot0)
	slot1 = pairs
	slot2 = slot0.tfFleets
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = _
		slot6 = slot6.each
		slot7 = slot5

		function slot8(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.clearFleet
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot6(slot7, slot8)
	end
end

slot0.clearFleets = slot1

function slot1(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = TeamType
	slot4 = slot4.Main
	slot5 = slot1
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = TeamType
	slot5 = slot5.Vanguard
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = TeamType
	slot6 = slot6.Submarine
	slot7 = slot1
	slot4 = slot4(slot5, slot6, slot7)

	if slot2 then
		slot5 = removeAllChildren
		slot6 = slot2

		slot5(slot6)
	end

	if slot3 then
		slot5 = removeAllChildren
		slot6 = slot3

		slot5(slot6)
	end

	if slot4 then
		slot5 = removeAllChildren
		slot6 = slot4

		slot5(slot6)
	end
end

slot0.clearFleet = slot1

function slot1(slot0)
	slot1 = triggerToggle
	slot2 = slot0.commanderBtn
	slot3 = false

	slot1(slot2, slot3)
end

slot0.clear = slot1

return slot0
