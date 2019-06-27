slot0 = class
slot1 = "LevelGrid"
slot2 = import
slot3 = "..base.BasePanel"
slot0 = slot0(slot1, slot2(slot3))
slot1 = require
slot2 = "Mgr/Pool/PoolPlural"
slot1 = slot1(slot2)
slot2 = Vector3
slot3 = 420
slot4 = -1000
slot5 = -1000
slot2 = slot2(slot3, slot4, slot5)
slot0.MapDefaultPos = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.init
	slot2 = slot0

	slot1(slot2)

	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "LevelCamera"
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Camera
	slot1 = slot1(slot2, slot3(slot4))
	slot0.levelCam = slot1
	slot1 = {}
	slot0.quadTws = slot1
	slot1 = {}
	slot0.attachTws = slot1
	slot1 = {}
	slot0.shiningTws = slot1
	slot1 = {}
	slot0.presentTws = slot1
	slot1 = {}
	slot0.markTws = slot1
	slot1 = {}
	slot0.championTws = slot1
	slot1 = {}
	slot0.rivals = slot1
	slot1 = {}
	slot0.pools = slot1
	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "__Pool__"
	slot1 = slot1(slot2)
	slot0.poolParent = slot1
	slot1 = {}
	slot0.opBtns = slot1
	slot1 = nil
	slot0.onCellClick = slot1
	slot1 = nil
	slot0.onShipStepChange = slot1
	slot1 = nil
	slot0.onShipArrived = slot1
	slot1 = -1
	slot0.lastSelectedId = slot1
	slot1 = -1
	slot0.quadState = slot1
	slot1 = nil
	slot0.quadClickProxy = slot1
	slot1 = {}
	slot0.endAniFlag = slot1
end

slot0.init = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15)
	slot0.shipTpl = slot1
	slot0.subTpl = slot2
	slot0.transportTpl = slot3
	slot0.transportTargetTpl = slot4
	slot0.enemyTpl = slot5
	slot0.deadTpl = slot6
	slot0.boxTpl = slot7
	slot0.supplyTpl = slot8
	slot0.rivalTpl = slot9
	slot0.championTpl = slot10
	slot0.spineTpl = slot11
	slot0.oniTpl = slot12
	slot0.oniTargetTpl = slot13
	slot0.bombEnemyTpl = slot14
	slot0.arrowTpl = slot15
end

slot0.setItems = slot2

function slot2(slot0, slot1)
	slot2 = "fleet_"
	slot3 = slot1
	slot2 = slot2 .. slot3
	slot3 = slot0.pools
	slot3 = slot3[slot2]

	if not slot3 then
		slot4 = slot0.shipTpl
		slot5 = FleetType
		slot5 = slot5.Submarine

		if slot1 == slot5 then
			slot4 = slot0.subTpl
		else
			slot5 = FleetType
			slot5 = slot5.Transport

			if slot1 == slot5 then
				slot4 = slot0.transportTpl
			end
		end

		slot5 = slot0
		slot5 = slot5.New
		slot6 = slot4.gameObject
		slot7 = 2
		slot5 = slot5(slot6, slot7)
		slot3 = slot5
		slot5 = slot0.pools
		slot5[slot2] = slot3
	end

	return slot3
end

slot0.getFleetPool = slot2

function slot2(slot0, slot1)
	slot2 = "champion_"
	slot3 = slot1
	slot2 = slot2 .. slot3
	slot3 = slot0.pools
	slot3 = slot3[slot2]

	if not slot3 then
		slot4 = slot0.championTpl

		if slot1 == "oni" then
			slot4 = slot0.oniTpl
		end

		slot5 = slot0
		slot5 = slot5.New
		slot6 = slot4.gameObject
		slot7 = 1
		slot5 = slot5(slot6, slot7)
		slot3 = slot5
		slot5 = slot0.pools
		slot5[slot2] = slot3
	end

	return slot3
end

slot0.getChampionPool = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot0.cellAttachments

	if not slot2 then
		slot2 = {}
		slot0.cellAttachments = slot2
	end

	slot3 = slot0
	slot2 = slot0.initPlane

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initDrag

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initTargetArrow

	slot2(slot3)

	slot2 = 0
	slot3 = ChapterConst
	slot3 = slot3.MaxRow
	slot3 = slot3 - 1
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = 0
		slot7 = ChapterConst
		slot7 = slot7.MaxColumn
		slot7 = slot7 - 1
		slot8 = 1

		for slot9 = slot6, slot7, slot8 do
			slot11 = slot0
			slot10 = slot0.initCell
			slot12 = slot5
			slot13 = slot9

			slot10(slot11, slot12, slot13)
		end
	end

	slot3 = slot0
	slot2 = slot0.updateAttachments

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateCellFlagList

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initFleets

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initChampions

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateQuadCells
	slot4 = ChapterConst
	slot4 = slot4.QuadStateFrozen

	slot2(slot3, slot4)

	slot3 = slot1
	slot2 = slot1.existOni
	slot2 = slot2(slot3)

	if slot2 then
		slot3 = slot0
		slot2 = slot0.displayEscapeGrid

		slot2(slot3)
	end
end

slot0.initAll = slot2

function slot2(slot0)
	slot1 = IsNil
	slot2 = slot0.cellRoot
	slot1 = slot1(slot2)

	if not slot1 then
		slot2 = slot0
		slot1 = slot0.clearFleets

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.clearChampions

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.clearTargetArrow

		slot1(slot2)

		slot1 = 0
		slot2 = ChapterConst
		slot2 = slot2.MaxRow
		slot2 = slot2 - 1
		slot3 = 1

		for slot4 = slot1, slot2, slot3 do
			slot5 = 0
			slot6 = ChapterConst
			slot6 = slot6.MaxColumn
			slot6 = slot6 - 1
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot10 = slot0
				slot9 = slot0.clearCell
				slot11 = slot4
				slot12 = slot8

				slot9(slot10, slot11, slot12)
			end
		end

		slot2 = slot0
		slot1 = slot0.clearPlane

		slot1(slot2)
	end

	slot1 = pairs
	slot2 = slot0.pools
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.ClearItems

		slot6(slot7)
	end

	slot1 = {}
	slot0.pools = slot1
	slot1 = GetOrAddComponent
	slot2 = slot0._tf
	slot3 = "EventTriggerListener"
	slot1 = slot1(slot2, slot3)
	slot2 = false
	slot1.enabled = slot2
	slot2 = slot0.dragTrigger

	if slot2 then
		slot2 = ClearEventTrigger
		slot3 = slot0.dragTrigger

		slot2(slot3)

		slot2 = nil
		slot0.dragTrigger = slot2
	end

	slot2 = {}
	slot0.endAniFlag = slot2
end

slot0.clearAll = slot2

function slot2(slot0)
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot1 = slot1.UIMain
	slot1 = slot1.transform
	slot2 = slot1.rect
	slot2 = slot2.width
	slot3 = slot1.rect
	slot3 = slot3.height
	slot4 = Vector2
	slot4 = slot4.one
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.theme
	slot7 = slot3 * 0.5
	slot8 = math
	slot8 = slot8.tan
	slot9 = math
	slot9 = slot9.pi
	slot9 = slot9 / 180
	slot10 = slot6.fov
	slot9 = slot9 * slot10
	slot9 = slot9 * 0.5
	slot8 = slot8(slot9)
	slot7 = slot7 / slot8
	slot8 = math
	slot8 = slot8.pi
	slot8 = slot8 / 180
	slot9 = slot6.angle
	slot8 = slot8 * slot9
	slot9 = Vector3
	slot10 = 0
	slot11 = math
	slot11 = slot11.sin
	slot12 = slot8
	slot11 = slot11(slot12)
	slot11 = -slot11
	slot12 = math
	slot12 = slot12.cos
	slot13 = slot8
	slot12 = slot12(slot13)
	slot12 = -slot12
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = Vector3
	slot11 = 0
	slot12 = slot6.offsety
	slot13 = slot0
	slot13 = slot13.MapDefaultPos
	slot13 = slot13.y
	slot12 = slot12 + slot13
	slot13 = slot6.offsetz
	slot14 = slot0
	slot14 = slot14.MapDefaultPos
	slot14 = slot14.z
	slot13 = slot13 + slot14
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = Vector3
	slot11 = slot11.Dot
	slot12 = slot9
	slot13 = slot10
	slot11 = slot11(slot12, slot13)
	slot12 = math
	slot12 = slot12.clamp
	slot13 = slot7 - slot11
	slot13 = slot13 / slot7
	slot14 = 0
	slot15 = 1
	slot12 = slot12(slot13, slot14, slot15)
	slot4 = slot4 * slot12
	slot13 = slot5
	slot12 = slot5.getDragExtend
	slot12, slot13, slot14, slot15 = slot12(slot13)
	slot0.bottomExtend = slot15
	slot0.topExtend = slot14
	slot0.rightExtend = slot13
	slot0.leftExtend = slot12
	slot12 = slot0._tf
	slot13 = Vector2
	slot14 = slot2 * 2
	slot15 = slot3 * 2
	slot13 = slot13(slot14, slot15)
	slot12.sizeDelta = slot13
	slot12 = GetOrAddComponent
	slot13 = slot0._tf
	slot14 = "EventTriggerListener"
	slot12 = slot12(slot13, slot14)
	slot0.dragTrigger = slot12
	slot12 = slot0.dragTrigger
	slot13 = true
	slot12.enabled = slot13
	slot12 = slot0.dragTrigger
	slot13 = slot12
	slot12 = slot12.AddDragFunc

	function slot14(slot0, slot1)
		slot2 = slot0
		slot2 = slot2._tf
		slot2 = slot2.localPosition
		slot3 = math
		slot3 = slot3.clamp
		slot4 = slot2.x
		slot5 = slot1.delta
		slot5 = slot5.x
		slot6 = slot1
		slot6 = slot6.x
		slot5 = slot5 * slot6
		slot4 = slot4 + slot5
		slot5 = slot0
		slot5 = slot5.rightExtend
		slot5 = -slot5
		slot6 = slot0
		slot6 = slot6.leftExtend
		slot3 = slot3(slot4, slot5, slot6)
		slot2.x = slot3
		slot3 = math
		slot3 = slot3.clamp
		slot4 = slot2.y
		slot5 = slot1.delta
		slot5 = slot5.y
		slot6 = slot1
		slot6 = slot6.y
		slot5 = slot5 * slot6
		slot6 = math
		slot6 = slot6.cos
		slot7 = slot2
		slot6 = slot6(slot7)
		slot5 = slot5 / slot6
		slot4 = slot4 + slot5
		slot5 = slot0
		slot5 = slot5.topExtend
		slot5 = -slot5
		slot6 = slot0
		slot6 = slot6.bottomExtend
		slot3 = slot3(slot4, slot5, slot6)
		slot2.y = slot3
		slot3 = slot0
		slot3 = slot3._tf
		slot3.localPosition = slot2
	end

	slot12(slot13, slot14)
end

slot0.initDrag = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.theme
	slot3 = slot0.levelCam
	slot4 = slot2.fov
	slot3.fieldOfView = slot4
	slot3 = nil
	slot4 = PoolMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot5 = slot4
	slot4 = slot4.GetPrefab
	slot6 = "chapter/plane"
	slot7 = "plane"
	slot8 = false

	function slot9(slot0)
		slot1 = slot0.transform
		slot0 = slot1
	end

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = ChapterConst
	slot4 = slot4.PlaneName
	slot3.name = slot4
	slot5 = slot3
	slot4 = slot3.SetParent
	slot6 = slot0._tf
	slot7 = false

	slot4(slot5, slot6, slot7)

	slot4 = Vector3
	slot5 = 0
	slot6 = slot2.offsety
	slot7 = slot2.offsetz
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = Vector3
	slot6 = 0
	slot7 = slot0
	slot7 = slot7.MapDefaultPos
	slot7 = slot7.y
	slot8 = slot0
	slot8 = slot8.MapDefaultPos
	slot8 = slot8.z
	slot5 = slot5(slot6, slot7, slot8)
	slot4 = slot4 + slot5
	slot3.anchoredPosition3D = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "cells"
	slot4 = slot4(slot5, slot6)
	slot0.cellRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "quads"
	slot4 = slot4(slot5, slot6)
	slot0.quadRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "marks"
	slot4 = slot4(slot5, slot6)
	slot0.markRoot = slot4
	slot5 = slot3
	slot4 = slot3.Find
	slot6 = "UI_FX_list"
	slot4 = slot4(slot5, slot6)
	slot0.UIFXList = slot4
	slot4 = 1
	slot5 = slot0.UIFXList
	slot5 = slot5.childCount
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = slot0.UIFXList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot7 - 1
		slot8 = slot8(slot9, slot10)

		if slot8 then
			slot9 = setActive
			slot10 = slot8
			slot11 = false

			slot9(slot10, slot11)
		end
	end

	slot4 = slot0.UIFXList
	slot5 = slot4
	slot4 = slot4.Find
	slot7 = slot1
	slot6 = slot1.getConfig
	slot8 = "uifx"
	slot4 = slot4(slot5, slot6(slot7, slot8))

	if slot4 then
		slot5 = setActive
		slot6 = slot4
		slot7 = true

		slot5(slot6, slot7)
	end

	slot6 = slot3
	slot5 = slot3.Find
	slot7 = "display"
	slot5 = slot5(slot6, slot7)
	slot7 = slot5
	slot6 = slot5.Find
	slot8 = "mask/sea"
	slot6 = slot6(slot7, slot8)
	slot7 = GetSpriteFromAtlas
	slot8 = "chapter/pic/"
	slot9 = slot2.assetSea
	slot8 = slot8 .. slot9
	slot9 = slot2.assetSea
	slot7 = slot7(slot8, slot9)

	if slot7 then
		slot8 = setImageSprite
		slot9 = slot6
		slot10 = slot7
		slot11 = false

		slot8(slot9, slot10, slot11)

		slot8 = setImageAlpha
		slot9 = slot6
		slot10 = 1

		slot8(slot9, slot10)
	end

	slot8 = Vector2
	slot9 = 10000
	slot10 = 10000
	slot8 = slot8(slot9, slot10)
	slot9 = Vector2
	slot9 = slot9.zero
	slot10 = Vector2
	slot11 = ChapterConst
	slot11 = slot11.MaxColumn
	slot12 = ChapterConst
	slot12 = slot12.MaxRow
	slot10 = slot10(slot11, slot12)
	slot11 = Vector2
	slot12 = ChapterConst
	slot12 = slot12.MaxColumn
	slot12 = -slot12
	slot13 = ChapterConst
	slot13 = slot13.MaxRow
	slot13 = -slot13
	slot11 = slot11(slot12, slot13)
	slot12 = 0
	slot13 = ChapterConst
	slot13 = slot13.MaxRow
	slot13 = slot13 - 1
	slot14 = 1

	for slot15 = slot12, slot13, slot14 do
		slot16 = 0
		slot17 = ChapterConst
		slot17 = slot17.MaxColumn
		slot17 = slot17 - 1
		slot18 = 1

		for slot19 = slot16, slot17, slot18 do
			slot20 = ChapterCell
			slot20 = slot20.Line2Name
			slot21 = slot15
			slot22 = slot19
			slot20 = slot20(slot21, slot22)
			slot22 = slot1
			slot21 = slot1.getChapterCell
			slot23 = slot15
			slot24 = slot19
			slot21 = slot21(slot22, slot23, slot24)

			if slot21 then
				slot22 = math
				slot22 = slot22.min
				slot23 = slot8.x
				slot24 = slot19
				slot22 = slot22(slot23, slot24)
				slot8.x = slot22
				slot22 = math
				slot22 = slot22.min
				slot23 = slot8.y
				slot24 = ChapterConst
				slot24 = slot24.MaxRow
				slot24 = slot24 * 0.5
				slot24 = slot24 - slot15
				slot24 = slot24 - 1
				slot22 = slot22(slot23, slot24)
				slot8.y = slot22
				slot22 = math
				slot22 = slot22.min
				slot23 = slot10.x
				slot24 = slot19
				slot22 = slot22(slot23, slot24)
				slot10.x = slot22
				slot22 = math
				slot22 = slot22.min
				slot23 = slot10.y
				slot24 = slot15
				slot22 = slot22(slot23, slot24)
				slot10.y = slot22
				slot22 = math
				slot22 = slot22.max
				slot23 = slot11.x
				slot24 = slot19
				slot22 = slot22(slot23, slot24)
				slot11.x = slot22
				slot22 = math
				slot22 = slot22.max
				slot23 = slot11.y
				slot24 = slot15
				slot22 = slot22(slot23, slot24)
				slot11.y = slot22
			end
		end
	end

	slot12 = slot2.cellSize
	slot13 = slot2.cellSpace
	slot12 = slot12 + slot13
	slot13 = slot8.x
	slot14 = slot12.x
	slot13 = slot13 * slot14
	slot8.x = slot13
	slot13 = slot8.y
	slot14 = slot12.y
	slot13 = slot13 * slot14
	slot8.y = slot13
	slot13 = slot11.x
	slot14 = slot10.x
	slot13 = slot13 - slot14
	slot13 = slot13 + 1
	slot14 = slot12.x
	slot13 = slot13 * slot14
	slot9.x = slot13
	slot13 = slot11.y
	slot14 = slot10.y
	slot13 = slot13 - slot14
	slot13 = slot13 + 1
	slot14 = slot12.y
	slot13 = slot13 * slot14
	slot9.y = slot13
	slot13 = slot9 * 0.5
	slot13 = slot8 + slot13
	slot5.anchoredPosition = slot13
	slot5.sizeDelta = slot9
	slot13 = Vector2
	slot14 = math
	slot14 = slot14.floor
	slot15 = slot5.sizeDelta
	slot15 = slot15.x
	slot16 = slot12.x
	slot15 = slot15 / slot16
	slot14 = slot14(slot15)
	slot15 = math
	slot15 = slot15.floor
	slot16 = slot5.sizeDelta
	slot16 = slot16.y
	slot17 = slot12.y
	slot16 = slot16 / slot17
	slot13 = slot13(slot14, slot15(slot16))
	slot15 = slot5
	slot14 = slot5.Find
	slot16 = "ABC"
	slot14 = slot14(slot15, slot16)
	slot16 = slot14
	slot15 = slot14.GetChild
	slot17 = 0
	slot15 = slot15(slot16, slot17)
	slot17 = slot14
	slot16 = slot14.GetComponent
	slot18 = typeof
	slot19 = GridLayoutGroup
	slot16 = slot16(slot17, slot18(slot19))
	slot17 = Vector2
	slot18 = slot2.cellSize
	slot18 = slot18.x
	slot19 = slot2.cellSize
	slot19 = slot19.y
	slot17 = slot17(slot18, slot19)
	slot16.cellSize = slot17
	slot17 = Vector2
	slot18 = slot2.cellSpace
	slot18 = slot18.x
	slot19 = slot2.cellSpace
	slot19 = slot19.y
	slot17 = slot17(slot18, slot19)
	slot16.spacing = slot17
	slot17 = slot16.padding
	slot18 = slot2.cellSpace
	slot18 = slot18.x
	slot17.left = slot18
	slot17 = slot14.childCount
	slot17 = slot17 - 1
	slot18 = slot13.x
	slot19 = -1

	for slot20 = slot17, slot18, slot19 do
		slot21 = Destroy
		slot23 = slot14
		slot22 = slot14.GetChild
		slot24 = slot20

		slot21(slot22(slot23, slot24))
	end

	slot17 = slot14.childCount
	slot18 = slot13.x
	slot18 = slot18 - 1
	slot19 = 1

	for slot20 = slot17, slot18, slot19 do
		slot21 = Instantiate
		slot22 = slot15
		slot21 = slot21(slot22)
		slot21 = slot21.transform
		slot22 = slot21
		slot21 = slot21.SetParent
		slot23 = slot14
		slot24 = false

		slot21(slot22, slot23, slot24)
	end

	slot17 = 0
	slot18 = slot13.x
	slot18 = slot18 - 1
	slot19 = 1

	for slot20 = slot17, slot18, slot19 do
		slot21 = setText
		slot23 = slot14
		slot22 = slot14.GetChild
		slot24 = slot20
		slot22 = slot22(slot23, slot24)
		slot23 = string
		slot23 = slot23.char
		slot24 = string
		slot24 = slot24.byte
		slot25 = "A"
		slot24 = slot24(slot25)
		slot24 = slot24 + slot20

		slot21(slot22, slot23(slot24))
	end

	slot18 = slot5
	slot17 = slot5.Find
	slot19 = "123"
	slot17 = slot17(slot18, slot19)
	slot19 = slot17
	slot18 = slot17.GetChild
	slot20 = 0
	slot18 = slot18(slot19, slot20)
	slot20 = slot17
	slot19 = slot17.GetComponent
	slot21 = typeof
	slot22 = GridLayoutGroup
	slot19 = slot19(slot20, slot21(slot22))
	slot20 = Vector2
	slot21 = slot2.cellSize
	slot21 = slot21.x
	slot22 = slot2.cellSize
	slot22 = slot22.y
	slot20 = slot20(slot21, slot22)
	slot19.cellSize = slot20
	slot20 = Vector2
	slot21 = slot2.cellSpace
	slot21 = slot21.x
	slot22 = slot2.cellSpace
	slot22 = slot22.y
	slot20 = slot20(slot21, slot22)
	slot19.spacing = slot20
	slot20 = slot19.padding
	slot21 = slot2.cellSpace
	slot21 = slot21.y
	slot20.top = slot21
	slot20 = slot17.childCount
	slot20 = slot20 - 1
	slot21 = slot13.y
	slot22 = -1

	for slot23 = slot20, slot21, slot22 do
		slot24 = Destroy
		slot26 = slot17
		slot25 = slot17.GetChild
		slot27 = slot23

		slot24(slot25(slot26, slot27))
	end

	slot20 = slot17.childCount
	slot21 = slot13.y
	slot21 = slot21 - 1
	slot22 = 1

	for slot23 = slot20, slot21, slot22 do
		slot24 = Instantiate
		slot25 = slot18
		slot24 = slot24(slot25)
		slot24 = slot24.transform
		slot25 = slot24
		slot24 = slot24.SetParent
		slot26 = slot17
		slot27 = false

		slot24(slot25, slot26, slot27)
	end

	slot20 = 0
	slot21 = slot13.y
	slot21 = slot21 - 1
	slot22 = 1

	for slot23 = slot20, slot21, slot22 do
		slot24 = setText
		slot26 = slot17
		slot25 = slot17.GetChild
		slot27 = slot23
		slot25 = slot25(slot26, slot27)
		slot26 = 1 + slot23

		slot24(slot25, slot26)
	end

	slot21 = slot5
	slot20 = slot5.Find
	slot22 = "linev"
	slot20 = slot20(slot21, slot22)
	slot22 = slot20
	slot21 = slot20.GetChild
	slot23 = 0
	slot21 = slot21(slot22, slot23)
	slot23 = slot20
	slot22 = slot20.GetComponent
	slot24 = typeof
	slot25 = GridLayoutGroup
	slot22 = slot22(slot23, slot24(slot25))
	slot23 = Vector2
	slot24 = ChapterConst
	slot24 = slot24.LineCross
	slot25 = slot5.sizeDelta
	slot25 = slot25.y
	slot23 = slot23(slot24, slot25)
	slot22.cellSize = slot23
	slot23 = Vector2
	slot24 = slot12.x
	slot25 = ChapterConst
	slot25 = slot25.LineCross
	slot24 = slot24 - slot25
	slot25 = 0
	slot23 = slot23(slot24, slot25)
	slot22.spacing = slot23
	slot23 = slot22.padding
	slot24 = math
	slot24 = slot24.floor
	slot25 = slot22.spacing
	slot25 = slot25.x
	slot24 = slot24(slot25)
	slot23.left = slot24
	slot23 = slot20.childCount
	slot23 = slot23 - 1
	slot24 = math
	slot24 = slot24.max
	slot25 = slot13.x
	slot25 = slot25 - 1
	slot26 = 0
	slot24 = slot24(slot25, slot26)
	slot25 = -1

	for slot26 = slot23, slot24, slot25 do
		slot27 = 0

		if slot26 > slot27 then
			slot27 = Destroy
			slot29 = slot20
			slot28 = slot20.GetChild
			slot30 = slot26

			slot27(slot28(slot29, slot30))
		end
	end

	slot23 = slot20.childCount
	slot24 = slot13.x
	slot24 = slot24 - 2
	slot25 = 1

	for slot26 = slot23, slot24, slot25 do
		slot27 = Instantiate
		slot28 = slot21
		slot27 = slot27(slot28)
		slot27 = slot27.transform
		slot28 = slot27
		slot27 = slot27.SetParent
		slot29 = slot20
		slot30 = false

		slot27(slot28, slot29, slot30)
	end

	slot24 = slot5
	slot23 = slot5.Find
	slot25 = "lineh"
	slot23 = slot23(slot24, slot25)
	slot25 = slot23
	slot24 = slot23.GetChild
	slot26 = 0
	slot24 = slot24(slot25, slot26)
	slot26 = slot23
	slot25 = slot23.GetComponent
	slot27 = typeof
	slot28 = GridLayoutGroup
	slot25 = slot25(slot26, slot27(slot28))
	slot26 = Vector2
	slot27 = slot5.sizeDelta
	slot27 = slot27.x
	slot28 = ChapterConst
	slot28 = slot28.LineCross
	slot26 = slot26(slot27, slot28)
	slot25.cellSize = slot26
	slot26 = Vector2
	slot27 = 0
	slot28 = slot12.y
	slot29 = ChapterConst
	slot29 = slot29.LineCross
	slot28 = slot28 - slot29
	slot26 = slot26(slot27, slot28)
	slot25.spacing = slot26
	slot26 = slot25.padding
	slot27 = math
	slot27 = slot27.floor
	slot28 = slot25.spacing
	slot28 = slot28.y
	slot27 = slot27(slot28)
	slot26.top = slot27
	slot26 = slot23.childCount
	slot26 = slot26 - 1
	slot27 = math
	slot27 = slot27.max
	slot28 = slot13.y
	slot28 = slot28 - 1
	slot29 = 0
	slot27 = slot27(slot28, slot29)
	slot28 = -1

	for slot29 = slot26, slot27, slot28 do
		slot30 = 0

		if slot29 > slot30 then
			slot30 = Destroy
			slot32 = slot23
			slot31 = slot23.GetChild
			slot33 = slot29

			slot30(slot31(slot32, slot33))
		end
	end

	slot26 = slot23.childCount
	slot27 = slot13.y
	slot27 = slot27 - 2
	slot28 = 1

	for slot29 = slot26, slot27, slot28 do
		slot30 = Instantiate
		slot31 = slot24
		slot30 = slot30(slot31)
		slot30 = slot30.transform
		slot31 = slot30
		slot30 = slot30.SetParent
		slot32 = slot23
		slot33 = false

		slot30(slot31, slot32, slot33)
	end

	slot26 = slot2.seaBase

	if slot26 then
		slot27 = slot5
		slot26 = slot5.Find
		slot28 = "seaBase/sea"
		slot26 = slot26(slot27, slot28)
		slot27 = GetSpriteFromAtlas
		slot28 = "chapter/pic/"
		slot29 = slot2.seaBase
		slot28 = slot28 .. slot29
		slot29 = slot2.seaBase
		slot27 = slot27(slot28, slot29)

		if slot27 then
			slot28 = setImageSprite
			slot29 = slot26
			slot30 = slot27
			slot31 = false

			slot28(slot29, slot30, slot31)

			slot28 = setImageAlpha
			slot29 = slot26
			slot30 = 1

			slot28(slot29, slot30)
		end

		slot29 = slot5
		slot28 = slot5.Find
		slot30 = "mask"
		slot28 = slot28(slot29, slot30)
		slot29 = GetOrAddComponent
		slot30 = slot28
		slot31 = "RawImage"
		slot29 = slot29(slot30, slot31)
		slot30 = UnityEngine
		slot30 = slot30.Rect
		slot30 = slot30.New
		slot31 = 0.005
		slot32 = 0.007
		slot33 = 1
		slot34 = -1
		slot30 = slot30(slot31, slot32, slot33, slot34)
		slot29.uvRect = slot30
	end
end

slot0.initPlane = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "plane/display/mask"
	slot1 = slot1(slot2, slot3)
	slot2 = GetOrAddComponent
	slot3 = slot1
	slot4 = "RawImage"
	slot2 = slot2(slot3, slot4)
	slot4 = slot0
	slot3 = slot0.getPoisonTex
	slot3 = slot3(slot4)
	slot2.texture = slot3
end

slot0.updatePoisonArea = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "plane/display"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.sizeDelta
	slot3 = slot3.x
	slot4 = slot2.sizeDelta
	slot4 = slot4.y
	slot3 = slot3 / slot4
	slot4 = 100
	slot5 = math
	slot5 = slot5.floor
	slot6 = slot4 / slot3
	slot5 = slot5(slot6)
	slot6 = nil
	slot7 = slot0.preChapterId
	slot8 = slot1.id

	if slot7 ~= slot8 then
		slot7 = UnityEngine
		slot7 = slot7.Texture2D
		slot7 = slot7.New
		slot8 = slot4
		slot9 = slot5
		slot7 = slot7(slot8, slot9)
		slot6 = slot7
		slot0.maskTexture = slot6
		slot7 = slot1.id
		slot0.preChapterId = slot7
	else
		slot6 = slot0.maskTexture
	end

	slot7 = {}
	slot9 = slot1
	slot8 = slot1.getPoisonArea
	slot10 = slot2.sizeDelta
	slot10 = slot10.x
	slot10 = slot4 / slot10
	slot8 = slot8(slot9, slot10)
	slot9 = slot0.poisonRectDir

	if slot9 == nil then
		slot7 = slot8
	else
		slot9 = pairs
		slot10 = slot8
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = slot0.poisonRectDir
			slot14 = slot14[slot12]

			if slot14 == nil then
				slot7[slot12] = slot13
			end
		end
	end

	function slot9(slot0)
		slot1 = slot0.x
		slot2 = slot0.w
		slot3 = slot0.x
		slot2 = slot2 + slot3
		slot3 = 1

		for slot4 = slot1, slot2, slot3 do
			slot5 = slot0.y
			slot6 = slot0.h
			slot7 = slot0.y
			slot6 = slot6 + slot7
			slot7 = 1

			for slot8 = slot5, slot6, slot7 do
				slot9 = slot0
				slot10 = slot9
				slot9 = slot9.SetPixel
				slot11 = slot4
				slot12 = slot8
				slot13 = Color
				slot13 = slot13.New
				slot14 = 1
				slot15 = 1
				slot16 = 1
				slot17 = 0

				slot9(slot10, slot11, slot12, slot13(slot14, slot15, slot16, slot17))
			end
		end
	end

	drawArea = slot9
	slot9 = pairs
	slot10 = slot7
	slot9, slot10, slot11 = slot9(slot10)

	for slot12, slot13 in slot9, slot10, slot11 do
		slot14 = drawArea
		slot15 = slot13

		slot14(slot15)
	end

	slot10 = slot6
	slot9 = slot6.Apply

	slot9(slot10)

	slot0.poisonRectDir = slot8

	return slot6
end

slot0.getPoisonTex = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.killQuadTws

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.killPresentTws

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.hideQuadMark

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.cellRoot

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.quadRoot

	slot1(slot2)

	slot1 = removeAllChildren
	slot2 = slot0.markRoot

	slot1(slot2)

	slot1 = nil
	slot0.cellRoot = slot1
	slot1 = nil
	slot0.quadRoot = slot1
	slot1 = nil
	slot0.markRoot = slot1
	slot1 = slot0._tf
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = ChapterConst
	slot3 = slot3.PlaneName
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.Find
	slot4 = "display/seaBase/sea"
	slot2 = slot2(slot3, slot4)
	slot3 = clearImageSprite
	slot4 = slot2

	slot3(slot4)

	slot3 = PoolMgr
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.ReturnPrefab
	slot5 = "chapter/plane"
	slot6 = "plane"
	slot7 = slot1.gameObject

	slot3(slot4, slot5, slot6, slot7)
end

slot0.clearPlane = slot2

function slot2(slot0)
	slot1 = slot0.cellFleets

	if slot1 then
		return
	end

	slot1 = {}
	slot0.cellFleets = slot1
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getDataType
	slot2 = slot2(slot3)
	slot3 = ipairs
	slot4 = slot1.fleets
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0.cellFleets
		slot9 = false
		slot8[slot6] = slot9
		slot8, slot9 = nil
		slot11 = slot7
		slot10 = slot7.isValid
		slot10 = slot10(slot11)

		if slot10 then
			slot11 = slot7
			slot10 = slot7.getFleetType
			slot10 = slot10(slot11)
			slot11 = FleetType
			slot11 = slot11.Transport

			if slot10 == slot11 then
				slot11 = slot7
				slot10 = slot7.getPrefab
				slot10 = slot10(slot11)
				slot8 = slot10
			else
				slot11 = slot1
				slot10 = slot1.getMapShip
				slot12 = slot7
				slot10 = slot10(slot11, slot12)

				if slot10 then
					slot12 = slot10
					slot11 = slot10.getPrefab
					slot11 = slot11(slot12)
					slot8 = slot11
					slot12 = slot10
					slot11 = slot10.getAttachmentPrefab
					slot11 = slot11(slot12)
					slot9 = slot11
				end
			end
		end

		if slot8 then
			slot11 = slot0
			slot10 = slot0.getFleetPool
			slot13 = slot7
			slot12 = slot7.getFleetType
			slot10 = slot10(slot11, slot12(slot13))
			slot12 = slot10
			slot11 = slot10.Dequeue
			slot11 = slot11(slot12)
			slot12 = "cell_fleet_"
			slot13 = slot8
			slot12 = slot12 .. slot13
			slot11.name = slot12
			slot12 = slot11.transform
			slot13 = Vector3
			slot14 = slot1.theme
			slot14 = slot14.angle
			slot14 = -slot14
			slot15 = 0
			slot16 = 0
			slot13 = slot13(slot14, slot15, slot16)
			slot12.localEulerAngles = slot13
			slot12 = setParent
			slot13 = slot11
			slot14 = slot0.cellRoot
			slot15 = false

			slot12(slot13, slot14, slot15)

			slot12 = setActive
			slot13 = slot11
			slot14 = true

			slot12(slot13, slot14)

			slot13 = slot7
			slot12 = slot7.getFleetType
			slot12 = slot12(slot13)
			slot13 = FleetType
			slot13 = slot13.Transport

			if slot12 == slot13 then
				slot12 = slot0.cellFleets
				slot13 = TransportCellView
				slot13 = slot13.New
				slot14 = slot11
				slot13 = slot13(slot14)
				slot12[slot6] = slot13
			else
				slot13 = slot7
				slot12 = slot7.getFleetType
				slot12 = slot12(slot13)
				slot13 = FleetType
				slot13 = slot13.Submarine

				if slot12 == slot13 then
					slot12 = slot0.cellFleets
					slot13 = SubCellView
					slot13 = slot13.New
					slot14 = slot11
					slot13 = slot13(slot14)
					slot12[slot6] = slot13
				else
					slot12 = slot0.cellFleets
					slot13 = FleetCellView
					slot13 = slot13.New
					slot14 = slot11
					slot13 = slot13(slot14)
					slot12[slot6] = slot13
				end
			end

			slot12 = slot0.cellFleets
			slot12 = slot12[slot6]
			slot14 = slot7
			slot13 = slot7.getFleetType
			slot13 = slot13(slot14)
			slot12.fleetType = slot13
			slot14 = slot12
			slot13 = slot12.setLine
			slot15 = slot7.line

			slot13(slot14, slot15)

			slot14 = slot12
			slot13 = slot12.setPrefab
			slot15 = slot8

			slot13(slot14, slot15)

			slot14 = slot12
			slot13 = slot12.setAttachment
			slot15 = slot9

			slot13(slot14, slot15)

			slot14 = slot12
			slot13 = slot12.setAction
			slot15 = ChapterConst
			slot15 = slot15.ShipIdleAction

			slot13(slot14, slot15)

			slot14 = slot0
			slot13 = slot0.updateFleet
			slot15 = slot6

			slot13(slot14, slot15)

			slot14 = slot12
			slot13 = slot12.loadSpine

			function slot15()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getModel
				slot0 = slot0(slot1)
				slot0 = slot0.transform
				slot1 = slot1
				slot1 = slot1.rotation
				slot0.localRotation = slot1
				slot0 = slot2
				slot1 = slot0
				slot0 = slot0.updateFleet
				slot2 = slot3

				slot0(slot1, slot2)
			end

			slot13(slot14, slot15)
		end
	end
end

slot0.initFleets = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.cellFleets
	slot3 = slot3[slot1]

	if slot3 then
		slot5 = slot3
		slot4 = slot3.showPoisonDamage
		slot6 = slot2

		slot4(slot5, slot6)
	end
end

slot0.showFleetPoisonDamage = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = ipairs
	slot3 = slot1.fleets
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.updateFleet
		slot9 = slot5

		slot7(slot8, slot9)
	end

	slot2 = pairs
	slot3 = slot0.opBtns
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = slot1.fleets
		slot7 = slot7[slot5]

		if not slot7 then
			slot7 = setActive
			slot8 = slot6
			slot9 = false

			slot7(slot8, slot9)
		end
	end
end

slot0.updateFleets = slot2

function slot2(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.getDataType
	slot3 = slot3(slot4)
	slot4 = slot0.cellFleets
	slot4 = slot4[slot1]
	slot5 = slot2.fleets
	slot5 = slot5[slot1]

	if slot4 then
		slot6 = slot5.line
		slot8 = slot5
		slot7 = slot5.isValid
		slot7 = slot7(slot8)
		slot8 = setActive
		slot9 = slot4.go
		slot10 = slot7

		slot8(slot9, slot10)

		slot9 = slot5
		slot8 = slot5.getFleetType
		slot8 = slot8(slot9)
		slot9 = FleetType
		slot9 = slot9.Normal

		if slot8 == slot9 then
			slot9, slot10 = slot2:existEnemy(ChapterConst.SubjectPlayer, slot6.row, slot6.column)

			setActive(slot4.tfShadow, not slot9 and not slot2:existFleet(FleetType.Transport, slot6.row, slot6.column))
			setActive(slot4.tfShip, not slot9 and not slot2.existFleet(FleetType.Transport, slot6.row, slot6.column))
			setActive(slot4.tfArrow, setActive)
			setActive(slot4.tfOp, false)

			slot13 = slot0.opBtns[slot1]

			if not slot13 then
				slot14 = tf
				slot15 = Instantiate
				slot16 = slot4.tfOp
				slot14 = slot14(slot15(slot16))
				slot13 = slot14
				slot14 = "op"
				slot15 = slot1
				slot14 = slot14 .. slot15
				slot13.name = slot14
				slot15 = slot13
				slot14 = slot13.SetParent
				slot16 = slot0._tf
				slot17 = false

				slot14(slot15, slot16, slot17)

				slot14 = Vector3
				slot15 = slot2.theme
				slot15 = slot15.angle
				slot15 = -slot15
				slot16 = 0
				slot17 = 0
				slot14 = slot14(slot15, slot16, slot17)
				slot13.localEulerAngles = slot14
				slot14 = slot0.opBtns
				slot14[slot1] = slot13
			end

			slot14 = setActive
			slot15 = slot13
			slot16 = true

			slot14(slot15, slot16)

			slot14 = slot4.tfOp
			slot14 = slot14.position
			slot13.position = slot14
			slot15 = slot13
			slot14 = slot13.Find
			slot16 = "retreat"
			slot14 = slot14(slot15, slot16)
			slot15 = setActive
			slot17 = slot14
			slot16 = slot14.Find
			slot18 = "retreat"
			slot16 = slot16(slot17, slot18)

			if slot12 and slot7 and slot9 then
				slot17 = ChapterConst
				slot17 = slot17.AttachBoss

				if slot10 ~= slot17 then
					slot17 = _
					slot17 = slot17.any
					slot18 = slot2.fleets

					function slot19(slot0)
						slot1 = slot0.id
						slot2 = slot0
						slot2 = slot2.id

						if slot1 ~= slot2 then
							slot2 = slot0
							slot1 = slot0.getFleetType
							slot1 = slot1(slot2)
							slot2 = FleetType
							slot2 = slot2.Normal

							if slot1 == slot2 then
								slot2 = slot0
								slot1 = slot0.isValid
								slot1 = slot1(slot2)
							end
						else
							slot1 = false

							if false then
								slot1 = true
							end
						end

						return slot1
					end

					slot17 = slot17(slot18, slot19)
				else
					slot17 = false

					if false then
						slot17 = true
					end
				end
			end

			slot15(slot16, slot17)

			slot15 = setActive
			slot17 = slot14
			slot16 = slot14.Find
			slot18 = "escape"
			slot16 = slot16(slot17, slot18)

			if slot12 and slot7 and slot9 then
				slot15(slot16, slot10 == ChapterConst.AttachBoss)

				slot15 = setActive
				slot16 = slot14
				slot18 = slot14
			end

			slot17 = slot14.Find
			slot19 = "retreat"
			slot17 = slot17(slot18, slot19)
			slot17 = slot17.gameObject
			slot17 = slot17.activeSelf

			if not slot17 then
				slot18 = slot14
				slot17 = slot14.Find
				slot19 = "escape"
				slot17 = slot17(slot18, slot19)
				slot17 = slot17.gameObject
				slot17 = slot17.activeSelf
			end

			slot15(slot16, slot17)

			slot15 = slot14.gameObject
			slot15 = slot15.activeSelf

			if slot15 then
				slot15 = onButton
				slot16 = slot0
				slot17 = slot14

				function slot18()
					slot0 = slot0
					slot0 = slot0.parent
					slot1 = slot0
					slot0 = slot0.isfrozen
					slot0 = slot0(slot1)

					if slot0 then
						return
					end

					slot0 = slot1
					slot1 = ChapterConst
					slot1 = slot1.AttachBoss

					if slot0 == slot1 then
						function slot0()
							slot0 = {}
							slot1 = {
								1,
								0
							}
							slot0[1] = slot1
							slot1 = {
								-1,
								0
							}
							slot0[2] = slot1
							slot1 = {
								0,
								1
							}
							slot0[3] = slot1
							slot1 = {
								0,
								-1
							}
							slot0[4] = slot1
							slot1 = ipairs
							slot2 = slot0
							slot1, slot2, slot3 = slot1(slot2)

							for slot4, slot5 in slot1, slot2, slot3 do
								slot6 = slot0
								slot7 = slot6
								slot6 = slot6.considerAsStayPoint
								slot8 = ChapterConst
								slot8 = slot8.SubjectPlayer
								slot9 = slot1
								slot9 = slot9.row
								slot10 = slot5[1]
								slot9 = slot9 + slot10
								slot10 = slot1
								slot10 = slot10.column
								slot11 = slot5[2]
								slot10 = slot10 + slot11
								slot6 = slot6(slot7, slot8, slot9, slot10)

								if slot6 then
									slot6 = slot0
									slot7 = slot6
									slot6 = slot6.existEnemy
									slot8 = ChapterConst
									slot8 = slot8.SubjectPlayer
									slot9 = slot1
									slot9 = slot9.row
									slot10 = slot5[1]
									slot9 = slot9 + slot10
									slot10 = slot1
									slot10 = slot10.column
									slot11 = slot5[2]
									slot10 = slot10 + slot11
									slot6 = slot6(slot7, slot8, slot9, slot10)

									if not slot6 then
										slot6 = slot2
										slot7 = slot6
										slot6 = slot6.emit
										slot8 = LevelMediator2
										slot8 = slot8.ON_OP
										slot9 = {}
										slot10 = ChapterConst
										slot10 = slot10.OpMove
										slot9.type = slot10
										slot10 = slot3
										slot10 = slot10.id
										slot9.id = slot10
										slot10 = slot1
										slot10 = slot10.row
										slot11 = slot5[1]
										slot10 = slot10 + slot11
										slot9.arg1 = slot10
										slot10 = slot1
										slot10 = slot10.column
										slot11 = slot5[2]
										slot10 = slot10 + slot11
										slot9.arg2 = slot10
										slot10 = slot3
										slot10 = slot10.line
										slot9.ordLine = slot10

										slot6(slot7, slot8, slot9)

										slot6 = false

										return slot6
									end
								end
							end

							slot1 = true

							return slot1
						end

						slot0 = slot0()

						if slot0 then
							slot0 = pg
							slot0 = slot0.TipsMgr
							slot1 = slot0
							slot0 = slot0.GetInstance
							slot0 = slot0(slot1)
							slot1 = slot0
							slot0 = slot0.ShowTips
							slot2 = i18n
							slot3 = "no_way_to_escape"

							slot0(slot1, slot2(slot3))
						end
					else
						slot0 = pg
						slot0 = slot0.MsgboxMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowMsgBox
						slot2 = {}
						slot3 = i18n
						slot4 = "levelScene_who_to_retreat"
						slot5 = slot4
						slot5 = slot5.name
						slot3 = slot3(slot4, slot5)
						slot2.content = slot3

						function slot3()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = LevelMediator2
							slot2 = slot2.ON_OP
							slot3 = {}
							slot4 = ChapterConst
							slot4 = slot4.OpRetreat
							slot3.type = slot4
							slot4 = slot1
							slot4 = slot4.id
							slot3.id = slot4

							slot0(slot1, slot2, slot3)
						end

						slot2.onYes = slot3

						slot0(slot1, slot2)
					end
				end

				slot19 = SFX_UI_WEIGHANCHOR_WITHDRAW

				slot15(slot16, slot17, slot18, slot19)
			end

			setActive(slot15, false)
			setActive(slot4.tfAmmo, slot3 == ChapterConst.TypeNone and not slot11)

			slot16 = ChapterConst.TypeNone

			if slot3 == slot16 then
				slot17 = slot2
				slot16 = slot2.getFleetAmmo
				slot18 = slot5
				slot16, slot17 = slot16(slot17, slot18)
				slot18 = slot17
				slot19 = "/"
				slot20 = slot16
				slot18 = slot18 .. slot19 .. slot20

				if slot17 == 0 then
					slot19 = setColorStr
					slot20 = slot18
					slot21 = COLOR_RED
					slot19 = slot19(slot20, slot21)
					slot18 = slot19
				end

				slot19 = setText
				slot20 = slot4.tfAmmoText
				slot21 = slot18

				slot19(slot20, slot21)
			end

			if slot9 or slot11 then
				if slot9 then
					slot16 = ChapterConst
					slot16 = slot16.AttachChampion

					if slot10 == slot16 then
						slot16 = slot4.tfArrow
						slot17 = Vector2
						slot18 = 0
						slot19 = 180
						slot17 = slot17(slot18, slot19)
						slot16.anchoredPosition = slot17
						slot16 = slot4.tfAmmo
						slot17 = Vector2
						slot18 = 60
						slot19 = 100
						slot17 = slot17(slot18, slot19)
						slot16.anchoredPosition = slot17
					end
				else
					slot16 = slot4.tfArrow
					slot17 = Vector2
					slot18 = 0
					slot19 = 100
					slot17 = slot17(slot18, slot19)
					slot16.anchoredPosition = slot17
					slot16 = slot4.tfAmmo
					slot17 = Vector2
					slot18 = 22
					slot19 = 56
					slot17 = slot17(slot18, slot19)
					slot16.anchoredPosition = slot17
				end

				slot16 = slot4.tfAmmo
				slot17 = slot16
				slot16 = slot16.SetAsLastSibling

				slot16(slot17)
			else
				slot16 = slot4.tfArrow
				slot17 = Vector2
				slot18 = 0
				slot19 = 175
				slot17 = slot17(slot18, slot19)
				slot16.anchoredPosition = slot17
				slot16 = slot4.tfAmmo
				slot17 = Vector2
				slot18 = -60
				slot19 = 85
				slot17 = slot17(slot18, slot19)
				slot16.anchoredPosition = slot17
			end

			slot17 = slot4
			slot16 = slot4.getModel
			slot16 = slot16(slot17)
			slot17 = IsNil
			slot18 = slot16
			slot17 = slot17(slot18)

			if not slot17 and slot12 then
				slot17 = slot0.lastSelectedId
				slot18 = slot5.id

				if slot17 ~= slot18 then
					if not slot9 and not slot11 then
						slot17 = slot0.lastSelectedId

						if slot17 ~= -1 then
							slot18 = slot0
							slot17 = slot0.frozen

							slot17(slot18)

							slot18 = slot16
							slot17 = slot16.GetComponent
							slot19 = "SkeletonGraphic"
							slot17 = slot17(slot18, slot19)
							slot18 = slot17.material
							slot19 = Shader
							slot19 = slot19.Find
							slot20 = "Spine/SkeletonGraphic (Additive)"
							slot19 = slot19(slot20)
							slot20 = Material
							slot20 = slot20.New
							slot21 = slot19
							slot20 = slot20(slot21)
							slot21 = LeanTween
							slot21 = slot21.value
							slot22 = slot16
							slot23 = 0
							slot24 = 1
							slot25 = 0.2
							slot21 = slot21(slot22, slot23, slot24, slot25)
							slot22 = slot21
							slot21 = slot21.setEase
							slot23 = LeanTweenType
							slot23 = slot23.easeInOutSine
							slot21 = slot21(slot22, slot23)
							slot22 = slot21
							slot21 = slot21.setLoopPingPong
							slot23 = 2
							slot21 = slot21(slot22, slot23)
							slot22 = slot21
							slot21 = slot21.setOnUpdate
							slot23 = System
							slot23 = slot23.Action_float

							function slot24(slot0)
								slot1 = slot0
								slot2 = slot1
								slot1 = slot1.SetColor
								slot3 = "_Color"
								slot4 = Color
								slot4 = slot4.Lerp
								slot5 = Color
								slot5 = slot5.New
								slot6 = 0
								slot7 = 0
								slot8 = 0
								slot9 = 0
								slot5 = slot5(slot6, slot7, slot8, slot9)
								slot6 = Color
								slot6 = slot6.New
								slot7 = 0.5
								slot8 = 0.5
								slot9 = 0.5
								slot10 = 0
								slot6 = slot6(slot7, slot8, slot9, slot10)
								slot7 = slot0

								slot1(slot2, slot3, slot4(slot5, slot6, slot7))

								slot1 = slot1
								slot2 = slot0
								slot1.material = slot2
							end

							slot21 = slot21(slot22, slot23(slot24))
							slot22 = slot21
							slot21 = slot21.setOnComplete
							slot23 = System
							slot23 = slot23.Action

							function slot24()
								slot0 = slot0
								slot1 = slot1
								slot0.material = slot1
								slot0 = slot2
								slot1 = slot0
								slot0 = slot0.unfrozen

								slot0(slot1)
							end

							slot21(slot22, slot23(slot24))
						end
					end

					slot17 = slot5.id
					slot0.lastSelectedId = slot17
				end
			end
		else
			slot9 = FleetType
			slot9 = slot9.Submarine

			if slot8 == slot9 then
				slot10 = slot2
				slot9 = slot2.existEnemy
				slot11 = ChapterConst
				slot11 = slot11.SubjectPlayer
				slot12 = slot6.row
				slot13 = slot6.column
				slot9 = slot9(slot10, slot11, slot12, slot13)

				if not slot9 then
					slot10 = slot2
					slot9 = slot2.existAlly
					slot11 = slot5
					slot9 = slot9(slot10, slot11)
				end

				setActive(slot4.tfShadow, not slot9)
				setActive(slot4.tfShip, not slot9)
				setActive(slot4.tfAmmo, slot3 == ChapterConst.TypeNone and not slot9)

				slot11 = slot2
				slot10 = slot2.getFleetAmmo
				slot12 = slot5
				slot10, slot11 = slot10(slot11, slot12)
				slot12 = slot11
				slot13 = "/"
				slot14 = slot10
				slot12 = slot12 .. slot13 .. slot14

				if slot11 == 0 then
					slot13 = setColorStr
					slot14 = slot12
					slot15 = COLOR_RED
					slot13 = slot13(slot14, slot15)
					slot12 = slot13
				end

				slot13 = setText
				slot14 = slot4.tfAmmoText
				slot15 = slot12

				slot13(slot14, slot15)
			else
				slot9 = FleetType
				slot9 = slot9.Transport

				if slot8 == slot9 then
					slot9 = setText
					slot10 = slot4.tfHpText
					slot12 = slot5
					slot11 = slot5.getRestHp
					slot11 = slot11(slot12)
					slot12 = "/"
					slot14 = slot5
					slot13 = slot5.getTotalHp
					slot13 = slot13(slot14)
					slot11 = slot11 .. slot12 .. slot13

					slot9(slot10, slot11)

					slot10 = slot2
					slot9 = slot2.existEnemy
					slot11 = ChapterConst
					slot11 = slot11.SubjectPlayer
					slot12 = slot6.row
					slot13 = slot6.column
					slot9 = slot9(slot10, slot11, slot12, slot13)
					slot10 = GetImageSpriteFromAtlasAsync
					slot11 = "enemies/"
					slot13 = slot5
					slot12 = slot5.getPrefab
					slot12 = slot12(slot13)
					slot11 = slot11 .. slot12
					slot12 = ""
					slot13 = slot4.tfIcon
					slot14 = true

					slot10(slot11, slot12, slot13, slot14)

					slot10 = setActive
					slot11 = slot4.tfFighting
					slot12 = slot9

					slot10(slot11, slot12)
				end
			end
		end

		slot9 = slot4.tf
		slot10 = slot2.theme
		slot11 = slot10
		slot10 = slot10.GetLinePosition
		slot12 = slot6.row
		slot13 = slot6.column
		slot10 = slot10(slot11, slot12, slot13)
		slot9.localPosition = slot10
		slot10 = slot4
		slot9 = slot4.setLine
		slot11 = {}
		slot12 = slot6.row
		slot11.row = slot12
		slot12 = slot6.column
		slot11.column = slot12

		slot9(slot10, slot11)

		slot10 = slot0
		slot9 = slot0.sortItems

		slot9(slot10)
	end
end

slot0.updateFleet = slot2

function slot2(slot0)
	slot1 = slot0.cellFleets

	if slot1 then
		slot1 = slot0.contextData
		slot1 = slot1.chapterVO
		slot2 = ipairs
		slot3 = slot0.cellFleets
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			if slot6 then
				slot8 = slot6
				slot7 = slot6.clear

				slot7(slot8)

				slot7 = LeanTween
				slot7 = slot7.cancel
				slot8 = slot6.go

				slot7(slot8)

				slot7 = setActive
				slot8 = slot6.go
				slot9 = false

				slot7(slot8, slot9)

				slot7 = setParent
				slot8 = slot6.go
				slot9 = slot0.poolParent
				slot10 = false

				slot7(slot8, slot9, slot10)

				slot8 = slot0
				slot7 = slot0.getFleetPool
				slot9 = slot6.fleetType
				slot7 = slot7(slot8, slot9)
				slot9 = slot7
				slot8 = slot7.Enqueue
				slot10 = slot6.go
				slot11 = false

				slot8(slot9, slot10, slot11)
			end
		end

		slot2 = nil
		slot0.cellFleets = slot2
	end

	slot1 = pairs
	slot2 = slot0.opBtns
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = Destroy
		slot7 = slot5.gameObject

		slot6(slot7)
	end

	slot1 = {}
	slot0.opBtns = slot1
end

slot0.clearFleets = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = cloneTplTo
	slot3 = slot0.arrowTpl
	slot4 = slot0._tf
	slot2 = slot2(slot3, slot4)
	slot0.arrowTarget = slot2
	slot2 = slot0.arrowTarget
	slot3 = Vector3
	slot4 = slot1.theme
	slot4 = slot4.angle
	slot4 = -slot4
	slot5 = 0
	slot6 = 0
	slot3 = slot3(slot4, slot5, slot6)
	slot2.localEulerAngles = slot3
	slot2 = setActive
	slot3 = slot0.arrowTarget
	slot4 = false

	slot2(slot3, slot4)
end

slot0.initTargetArrow = slot2

function slot2(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = ChapterCell
	slot3 = slot3.Line2Name
	slot4 = slot1.row
	slot5 = slot1.column
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.cellRoot
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot5 = slot0.arrowTarget
	slot6 = slot5
	slot5 = slot5.SetParent
	slot7 = slot4

	slot5(slot6, slot7)

	slot6 = slot2
	slot5 = slot2.existEnemy
	slot7 = ChapterConst
	slot7 = slot7.SubjectPlayer
	slot8 = slot1.row
	slot9 = slot1.column
	slot5, slot6 = slot5(slot6, slot7, slot8, slot9)

	if slot5 then
		slot7 = ChapterConst
		slot7 = slot7.AttachChampion

		if slot6 == slot7 then
			slot8 = slot2
			slot7 = slot2.getChampion
			slot9 = slot1.row
			slot10 = slot1.column
			slot7 = slot7(slot8, slot9, slot10)
			slot8 = slot7
			slot7 = slot7.getScale
			slot7 = slot7(slot8)
			slot7 = slot7 / 100
			slot8 = slot0.arrowTarget
			slot9 = Vector3
			slot10 = 0
			slot11 = 80 * slot7
			slot11 = 20 + slot11
			slot12 = -80 * slot7
			slot9 = slot9(slot10, slot11, slot12)
			slot8.localPosition = slot9
		end
	else
		slot7 = slot0.arrowTarget
		slot8 = Vector3
		slot9 = 0
		slot10 = 20
		slot11 = 0
		slot8 = slot8(slot9, slot10, slot11)
		slot7.localPosition = slot8
	end
end

slot0.updateTargetArrow = slot2

function slot2(slot0)
	slot1 = IsNil
	slot2 = slot0.arrowTarget
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = Destroy
		slot2 = slot0.arrowTarget

		slot1(slot2)

		slot1 = nil
		slot0.arrowTarget = slot1
	end
end

slot0.clearTargetArrow = slot2

function slot2(slot0)
	slot1 = slot0.cellChampions

	if slot1 then
		return
	end

	slot1 = {}
	slot0.cellChampions = slot1
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getDataType
	slot2 = slot2(slot3)
	slot3 = ipairs
	slot4 = slot1.champions
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0.cellChampions
		slot9 = false
		slot8[slot6] = slot9
		slot8 = slot7.flag

		if slot8 ~= 1 then
			slot9 = slot7
			slot8 = slot7.getPoolType
			slot8 = slot8(slot9)
			slot10 = slot0
			slot9 = slot0.getChampionPool
			slot11 = slot8
			slot9 = slot9(slot10, slot11)
			slot11 = slot9
			slot10 = slot9.Dequeue
			slot10 = slot10(slot11)
			slot11 = "cell_champion_"
			slot13 = slot7
			slot12 = slot7.getPrefab
			slot12 = slot12(slot13)
			slot11 = slot11 .. slot12
			slot10.name = slot11
			slot11 = slot10.transform
			slot12 = Vector3
			slot13 = slot1.theme
			slot13 = slot13.angle
			slot13 = -slot13
			slot14 = 0
			slot15 = 0
			slot12 = slot12(slot13, slot14, slot15)
			slot11.localEulerAngles = slot12
			slot11 = setParent
			slot12 = slot10
			slot13 = slot0.cellRoot
			slot14 = false

			slot11(slot12, slot13, slot14)

			slot11 = setActive
			slot12 = slot10
			slot13 = true

			slot11(slot12, slot13)

			slot11 = slot7.attachment
			slot12 = ChapterConst
			slot12 = slot12.AttachOni

			if slot11 == slot12 then
				slot11 = slot0.cellChampions
				slot12 = OniCellView
				slot12 = slot12.New
				slot13 = slot10
				slot12 = slot12(slot13)
				slot11[slot6] = slot12
			else
				slot11 = slot0.cellChampions
				slot12 = ChampionCellView
				slot12 = slot12.New
				slot13 = slot10
				slot12 = slot12(slot13)
				slot11[slot6] = slot12
			end

			slot11 = slot0.cellChampions
			slot11 = slot11[slot6]
			slot11.poolType = slot8
			slot13 = slot11
			slot12 = slot11.setLine
			slot14 = {}
			slot15 = slot7.row
			slot14.row = slot15
			slot15 = slot7.column
			slot14.column = slot15

			slot12(slot13, slot14)

			slot13 = slot11
			slot12 = slot11.setPrefab
			slot15 = slot7
			slot14 = slot7.getPrefab

			slot12(slot13, slot14(slot15))

			slot13 = slot11
			slot12 = slot11.setAction
			slot14 = ChapterConst
			slot14 = slot14.ShipIdleAction

			slot12(slot13, slot14)

			slot13 = slot0
			slot12 = slot0.updateChampion
			slot14 = slot6

			slot12(slot13, slot14)

			slot13 = slot11
			slot12 = slot11.loadSpine

			function slot14()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getModel
				slot0 = slot0(slot1)
				slot0 = slot0.transform
				slot1 = slot1
				slot1 = slot1.rotation
				slot0.localRotation = slot1
				slot1 = slot1
				slot2 = slot1
				slot1 = slot1.getScale
				slot1 = slot1(slot2)
				slot1 = slot1 / 100
				slot2 = Vector3
				slot3 = 0.4 * slot1
				slot4 = 0.4 * slot1
				slot5 = 1
				slot2 = slot2(slot3, slot4, slot5)
				slot0.localScale = slot2
				slot2 = slot2
				slot3 = slot2
				slot2 = slot2.updateChampion
				slot4 = slot3

				slot2(slot3, slot4)
			end

			slot12(slot13, slot14)
		end
	end
end

slot0.initChampions = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = ipairs
	slot3 = slot0.cellChampions
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.updateChampion
		slot9 = slot5

		slot7(slot8, slot9)
	end
end

slot0.updateChampions = slot2

function slot2(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = slot0.cellChampions
	slot3 = slot3[slot1]
	slot4 = slot2.champions
	slot4 = slot4[slot1]

	if slot3 and slot4 then
		slot5 = slot4.attachment
		slot6 = ChapterConst
		slot6 = slot6.AttachOni

		if slot5 == slot6 then
			slot5 = 1
			slot6 = _
			slot6 = slot6.each
			slot7 = slot2.fleets

			function slot8(slot0)
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.inAlertRange
				slot3 = slot0.line
				slot3 = slot3.row
				slot4 = slot0.line
				slot4 = slot4.column
				slot1 = slot1(slot2, slot3, slot4)

				if slot1 then
					slot1 = slot1
					slot1 = slot1 + 1
					slot1 = slot1
				end
			end

			slot6(slot7, slot8)

			slot6 = GetImageSpriteFromAtlasAsync
			slot7 = "enemies/sp_"
			slot8 = slot5
			slot7 = slot7 .. slot8
			slot8 = ""
			slot9 = slot3.tfIcon
			slot10 = true

			slot6(slot7, slot8, slot9, slot10)
		end

		slot5(slot6, slot7)

		slot6 = slot0
		slot5 = slot0.sortItems

		slot5(slot6)
	end
end

slot0.updateChampion = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = nil
	slot3 = ipairs
	slot4 = slot1.champions
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.attachment
		slot9 = ChapterConst
		slot9 = slot9.AttachOni

		if slot8 == slot9 then
			slot2 = slot6

			break
		end
	end

	if slot2 then
		slot4 = slot0
		slot3 = slot0.updateChampion
		slot5 = slot2

		slot3(slot4, slot5)
	end
end

slot0.updateOni = slot2

function slot2(slot0)
	slot1 = slot0.cellChampions

	if slot1 then
		slot1 = ipairs
		slot2 = slot0.cellChampions
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			if slot5 then
				slot6 = slot0.championTws
				slot6 = slot6[slot4]

				if slot6 then
					slot6 = LeanTween
					slot6 = slot6.cancel
					slot7 = slot0.championTws
					slot7 = slot7[slot4]
					slot7 = slot7.uniqueId

					slot6(slot7)

					slot6 = slot0.championTws
					slot7 = nil
					slot6[slot4] = slot7
					slot7 = slot5
					slot6 = slot5.getModel
					slot6 = slot6(slot7)

					if slot6 then
						slot8 = slot6
						slot7 = slot6.GetComponent
						slot9 = "SkeletonGraphic"
						slot7 = slot7(slot8, slot9)
						slot8 = Color
						slot8 = slot8.white
						slot7.color = slot8
					end
				end

				slot7 = slot5
				slot6 = slot5.clear

				slot6(slot7)

				slot6 = LeanTween
				slot6 = slot6.cancel
				slot7 = slot5.go

				slot6(slot7)

				slot6 = setActive
				slot7 = slot5.go
				slot8 = false

				slot6(slot7, slot8)

				slot6 = setParent
				slot7 = slot5.go
				slot8 = slot0.poolParent
				slot9 = false

				slot6(slot7, slot8, slot9)

				slot7 = slot0
				slot6 = slot0.getChampionPool
				slot8 = slot5.poolType
				slot6 = slot6(slot7, slot8)
				slot8 = slot6
				slot7 = slot6.Enqueue
				slot9 = slot5.go
				slot10 = false

				slot7(slot8, slot9, slot10)
			end
		end

		slot1 = nil
		slot0.cellChampions = slot1
	end
end

slot0.clearChampions = slot2

function slot2(slot0)
	slot1 = slot0.sortFunc

	if not slot1 then
		slot1 = debounce

		function slot2()
			slot0 = slot0
			slot0 = slot0.exited

			if slot0 then
				return
			end

			slot0 = {}
			slot1 = slot0
			slot1 = slot1.cellFleets

			if slot1 then
				slot1 = _
				slot1 = slot1.each
				slot2 = slot0
				slot2 = slot2.cellFleets

				function slot3(slot0)
					if slot0 then
						slot1 = table
						slot1 = slot1.insert
						slot2 = slot0
						slot3 = slot0

						slot1(slot2, slot3)
					end
				end

				slot1(slot2, slot3)
			end

			slot1 = slot0
			slot1 = slot1.cellChampions

			if slot1 then
				slot1 = _
				slot1 = slot1.each
				slot2 = slot0
				slot2 = slot2.cellChampions

				function slot3(slot0)
					if slot0 then
						slot1 = table
						slot1 = slot1.insert
						slot2 = slot0
						slot3 = slot0

						slot1(slot2, slot3)
					end
				end

				slot1(slot2, slot3)
			end

			slot1 = slot0
			slot1 = slot1.cellAttachments

			if slot1 then
				slot1 = _
				slot1 = slot1.each
				slot2 = slot0
				slot2 = slot2.cellAttachments

				function slot3(slot0)
					if slot0 then
						slot1 = table
						slot1 = slot1.insert
						slot2 = slot0
						slot3 = slot0

						slot1(slot2, slot3)
					end
				end

				slot1(slot2, slot3)
			end

			slot1 = _
			slot1 = slot1.sort
			slot2 = slot0

			function slot3(slot0, slot1)
				return slot0:getLine().row * 10000 + (ChapterConst.MaxColumn - slot0.getLine().column) * 100 + slot0:getOrder() < slot1:getLine().row * 10000 + (ChapterConst.MaxColumn - slot1.getLine().column) * 100 + slot1:getOrder()
			end

			slot1(slot2, slot3)

			slot1 = nil
			slot2 = 0
			slot3 = ChapterConst
			slot3 = slot3.MaxRow
			slot3 = slot3 - 1
			slot4 = 1

			for slot5 = slot2, slot3, slot4 do
				slot6 = ChapterConst
				slot6 = slot6.MaxColumn
				slot6 = slot6 - 1
				slot7 = 0
				slot8 = -1

				for slot9 = slot6, slot7, slot8 do
					slot10 = ChapterCell
					slot10 = slot10.Line2Name
					slot11 = slot5
					slot12 = slot9
					slot10 = slot10(slot11, slot12)
					slot11 = slot0
					slot11 = slot11.cellRoot
					slot12 = slot11
					slot11 = slot11.Find
					slot13 = slot10
					slot11 = slot11(slot12, slot13)

					if slot11 then
						slot13 = slot11
						slot12 = slot11.SetAsLastSibling

						slot12(slot13)
					end

					slot12 = #slot0
					slot13 = 0

					while slot12 > slot13 do
						slot12 = slot0[1]
						slot13 = slot12
						slot12 = slot12.getLine
						slot12 = slot12(slot13)
						slot13 = slot12.row

						if slot5 == slot13 and slot9 == 0 then
							slot13 = slot0[1]
							slot13 = slot13.tf
							slot14 = slot13
							slot13 = slot13.SetAsLastSibling

							slot13(slot14)

							slot13 = table
							slot13 = slot13.remove
							slot14 = slot0
							slot15 = 1

							slot13(slot14, slot15)
						else
							break
						end
					end
				end
			end
		end

		slot3 = 0.1
		slot4 = false
		slot1 = slot1(slot2, slot3, slot4)
		slot0.sortFunc = slot1
	end

	slot1 = slot0.sortFunc

	slot1()
end

slot0.sortItems = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getChapterCell
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)

	if slot4 then
		slot5 = slot3.theme
		slot5 = slot5.cellSize
		slot6 = ChapterCell
		slot6 = slot6.Line2QuadName
		slot7 = slot1
		slot8 = slot2
		slot6 = slot6(slot7, slot8)
		slot7 = nil
		slot8 = slot4.walkable

		if slot8 then
			slot8 = PoolMgr
			slot8 = slot8.GetInstance
			slot8 = slot8()
			slot9 = slot8
			slot8 = slot8.GetPrefab
			slot10 = "chapter/cell_quad"
			slot11 = "cell_quad"
			slot12 = false

			function slot13(slot0)
				slot1 = slot0.transform
				slot0 = slot1
			end

			slot8(slot9, slot10, slot11, slot12, slot13)

			slot7.name = slot6
			slot9 = slot7
			slot8 = slot7.SetParent
			slot10 = slot0.quadRoot
			slot11 = false

			slot8(slot9, slot10, slot11)

			slot7.sizeDelta = slot5
			slot8 = slot3.theme
			slot9 = slot8
			slot8 = slot8.GetLinePosition
			slot10 = slot1
			slot11 = slot2
			slot8 = slot8(slot9, slot10, slot11)
			slot7.anchoredPosition = slot8
			slot9 = slot7
			slot8 = slot7.SetAsLastSibling

			slot8(slot9)
		end

		slot8 = ChapterCell
		slot8 = slot8.Line2Name
		slot9 = slot1
		slot10 = slot2
		slot8 = slot8(slot9, slot10)
		slot9 = nil
		slot10 = PoolMgr
		slot10 = slot10.GetInstance
		slot10 = slot10()
		slot11 = slot10
		slot10 = slot10.GetPrefab
		slot12 = "chapter/cell"
		slot13 = "cell"
		slot14 = false

		function slot15(slot0)
			slot1 = slot0.transform
			slot0 = slot1
		end

		slot10(slot11, slot12, slot13, slot14, slot15)

		slot9.name = slot8
		slot11 = slot9
		slot10 = slot9.SetParent
		slot12 = slot0.cellRoot
		slot13 = false

		slot10(slot11, slot12, slot13)

		slot9.sizeDelta = slot5
		slot10 = slot3.theme
		slot11 = slot10
		slot10 = slot10.GetLinePosition
		slot12 = slot1
		slot13 = slot2
		slot10 = slot10(slot11, slot12, slot13)
		slot9.anchoredPosition = slot10
		slot11 = slot9
		slot10 = slot9.SetAsLastSibling

		slot10(slot11)

		slot11 = slot9
		slot10 = slot9.Find
		slot12 = ChapterConst
		slot12 = slot12.ChildItem
		slot10 = slot10(slot11, slot12)
		slot11 = Vector3
		slot12 = slot3.theme
		slot12 = slot12.angle
		slot12 = -slot12
		slot13 = 0
		slot14 = 0
		slot11 = slot11(slot12, slot13, slot14)
		slot10.localEulerAngles = slot11
		slot11 = setActive
		slot12 = slot10
		slot13 = slot4.item

		slot11(slot12, slot13)

		slot11 = slot4.item

		if slot11 then
			slot12 = slot0
			slot11 = slot0.frozen

			slot11(slot12)

			slot11 = PoolMgr
			slot11 = slot11.GetInstance
			slot11 = slot11()
			slot12 = slot11
			slot11 = slot11.GetPrefab
			slot13 = "chapter/"
			slot14 = slot4.item
			slot13 = slot13 .. slot14
			slot14 = slot4.item
			slot15 = true

			function slot16(slot0)
				slot2 = slot0
				slot1 = slot0.GetComponent
				slot3 = typeof
				slot4 = UnityEngine
				slot4 = slot4.UI
				slot4 = slot4.Graphic
				slot1 = slot1(slot2, slot3(slot4))
				slot2 = IsNil
				slot3 = slot1
				slot2 = slot2(slot3)

				if not slot2 then
					slot2 = false
					slot1.raycastTarget = slot2
				end

				slot3 = slot0
				slot2 = slot0.GetComponentsInChildren
				slot4 = typeof
				slot5 = UnityEngine
				slot5 = slot5.UI
				slot5 = slot5.Graphic
				slot4 = slot4(slot5)
				slot5 = true
				slot2 = slot2(slot3, slot4, slot5)
				slot3 = 0
				slot4 = slot2.Length
				slot4 = slot4 - 1
				slot5 = 1

				for slot6 = slot3, slot4, slot5 do
					slot7 = slot2[slot6]
					slot8 = false
					slot7.raycastTarget = slot8
				end

				slot3 = slot0.transform
				slot4 = slot0
				slot4 = slot4.item
				slot3.name = slot4
				slot5 = slot3
				slot4 = slot3.SetParent
				slot6 = slot1
				slot7 = false

				slot4(slot5, slot6, slot7)

				slot4 = slot0
				slot4 = slot4.itemOffset
				slot3.anchoredPosition = slot4
				slot4 = slot2
				slot5 = slot4
				slot4 = slot4.unfrozen

				slot4(slot5)
			end

			slot11(slot12, slot13, slot14, slot15, slot16)
		end

		slot12 = slot9
		slot11 = slot9.Find
		slot13 = ChapterConst
		slot13 = slot13.ChildAttachment
		slot11 = slot11(slot12, slot13)
		slot12 = Vector3
		slot13 = slot3.theme
		slot13 = slot13.angle
		slot13 = -slot13
		slot14 = 0
		slot15 = 0
		slot12 = slot12(slot13, slot14, slot15)
		slot11.localEulerAngles = slot12

		if slot7 then
			slot12 = onButton
			slot13 = slot0
			slot14 = slot7

			function slot15()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.isfrozen
				slot0 = slot0(slot1)

				if not slot0 then
					slot0 = slot0
					slot0 = slot0.quadState
					slot1 = ChapterConst
					slot1 = slot1.QuadStateStrategy

					if slot0 == slot1 then
						slot0 = slot0
						slot0 = slot0.quadClickProxy

						if slot0 then
							slot0 = slot0
							slot0 = slot0.quadClickProxy
							slot1 = slot1

							slot0(slot1)
						end
					else
						slot0 = slot0
						slot0 = slot0.onCellClick

						if slot0 then
							slot0 = slot0
							slot0 = slot0.onCellClick
							slot1 = slot1

							slot0(slot1)
						end
					end
				end
			end

			slot16 = SFX_CONFIRM

			slot12(slot13, slot14, slot15, slot16)
		end
	end
end

slot0.initCell = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getChapterCell
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = ChapterCell
	slot5 = slot5.Line2Name
	slot6 = slot1
	slot7 = slot2
	slot5 = slot5(slot6, slot7)
	slot6 = ChapterCell
	slot6 = slot6.Line2QuadName
	slot7 = slot1
	slot8 = slot2
	slot6 = slot6(slot7, slot8)
	slot7 = slot0.cellRoot
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = slot5
	slot7 = slot7(slot8, slot9)
	slot8 = slot0.quadRoot
	slot9 = slot8
	slot8 = slot8.Find
	slot10 = slot6
	slot8 = slot8(slot9, slot10)
	slot9 = IsNil
	slot10 = slot7
	slot9 = slot9(slot10)

	if not slot9 then
		function slot9(slot0, slot1)
			slot2 = slot0.childCount
			slot3 = 0

			if slot2 > slot3 then
				slot3 = slot0
				slot2 = slot0.GetChild
				slot4 = 0
				slot2 = slot2(slot3, slot4)
				slot3 = PoolMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ReturnPrefab
				slot5 = "chapter/"
				slot6 = slot2.name
				slot5 = slot5 .. slot6
				slot6 = slot2.name
				slot7 = slot2.gameObject

				slot3(slot4, slot5, slot6, slot7)

				if slot1 then
					slot3 = PoolMgr
					slot3 = slot3.GetInstance
					slot3 = slot3()
					slot4 = slot3
					slot3 = slot3.DestroyPrefab
					slot5 = "chapter/"
					slot6 = slot2.name
					slot5 = slot5 .. slot6
					slot6 = slot2.name

					slot3(slot4, slot5, slot6)
				end
			end
		end

		slot10 = slot9
		slot12 = slot7
		slot11 = slot7.Find
		slot13 = ChapterConst
		slot13 = slot13.ChildItem
		slot11 = slot11(slot12, slot13)
		slot12 = true

		slot10(slot11, slot12)

		slot10 = slot0.attachTws
		slot10 = slot10[slot5]

		if slot10 then
			slot10 = LeanTween
			slot10 = slot10.cancel
			slot11 = slot0.attachTws
			slot11 = slot11[slot5]
			slot11 = slot11.uniqueId

			slot10(slot11)

			slot10 = slot0.attachTws
			slot11 = nil
			slot10[slot5] = slot11
		end

		slot10 = slot0.shiningTws
		slot10 = slot10[slot5]

		if slot10 then
			slot10 = LeanTween
			slot10 = slot10.cancel
			slot11 = slot0.shiningTws
			slot11 = slot11[slot5]
			slot11 = slot11.uniqueId

			slot10(slot11)

			slot10 = slot0.shiningTws
			slot11 = nil
			slot10[slot5] = slot11
		end

		slot11 = slot7
		slot10 = slot7.Find
		slot12 = ChapterConst
		slot12 = slot12.ChildAttachment
		slot10 = slot10(slot11, slot12)
		slot11 = slot4.attachment
		slot12 = ChapterConst
		slot12 = slot12.AttachRival

		if slot11 == slot12 then
			slot11 = ChapterConst
			slot11 = slot11.Line2RivalName
			slot12 = slot4.row
			slot13 = slot4.column
			slot11 = slot11(slot12, slot13)
			slot12 = slot0.rivals
			slot12 = slot12[slot11]

			if slot12 then
				slot12 = slot0.rivals
				slot12 = slot12[slot11]
				slot13 = slot12
				slot12 = slot12.clear

				slot12(slot13)

				slot12 = slot0.rivals
				slot13 = nil
				slot12[slot11] = slot13
			end
		else
			slot11 = slot4.attachment
			slot12 = ChapterConst
			slot12 = slot12.AttachBox

			if slot11 == slot12 then
				slot11 = slot10.childCount
				slot12 = 0

				if slot11 > slot12 then
					slot12 = slot10
					slot11 = slot10.GetChild
					slot13 = 0
					slot11 = slot11(slot12, slot13)
					slot12 = slot11
					slot11 = slot11.Find
					slot13 = "icon"
					slot11 = slot11(slot12, slot13)

					if slot11 then
						slot12 = slot11.childCount
						slot13 = 0

						if slot12 > slot13 then
							slot12 = pg
							slot12 = slot12.box_data_template
							slot13 = slot4.attachmentId
							slot12 = slot12[slot13]
							slot13 = PoolMgr
							slot13 = slot13.GetInstance
							slot13 = slot13()
							slot14 = slot13
							slot13 = slot13.ReturnPrefab
							slot15 = "boxprefab/"
							slot16 = slot12.icon
							slot15 = slot15 .. slot16
							slot16 = slot12.icon
							slot18 = slot11
							slot17 = slot11.GetChild
							slot19 = 0
							slot17 = slot17(slot18, slot19)
							slot17 = slot17.gameObject

							slot13(slot14, slot15, slot16, slot17)
						end
					end
				end
			end
		end

		slot11 = UIUtil
		slot11 = slot11.ClearChildren
		slot12 = slot10.gameObject

		slot11(slot12)

		slot11 = PoolMgr
		slot11 = slot11.GetInstance
		slot11 = slot11()
		slot12 = slot11
		slot11 = slot11.ReturnPrefab
		slot13 = "chapter/cell"
		slot14 = "cell"
		slot15 = slot7.gameObject

		slot11(slot12, slot13, slot14, slot15)
	end

	slot9 = IsNil
	slot10 = slot8
	slot9 = slot9(slot10)

	if not slot9 then
		slot9 = slot0.quadTws
		slot9 = slot9[slot6]

		if slot9 then
			slot9 = LeanTween
			slot9 = slot9.cancel
			slot10 = slot0.quadTws
			slot10 = slot10[slot6]
			slot10 = slot10.uniqueId

			slot9(slot10)

			slot9 = slot0.quadTws
			slot10 = nil
			slot9[slot6] = slot10
		end

		slot9 = PoolMgr
		slot9 = slot9.GetInstance
		slot9 = slot9()
		slot10 = slot9
		slot9 = slot9.ReturnPrefab
		slot11 = "chapter/cell_quad"
		slot12 = "cell_quad"
		slot13 = slot8.gameObject

		slot9(slot10, slot11, slot12, slot13)
	end
end

slot0.clearCell = slot2

function slot2(slot0)
	slot1 = 0
	slot2 = ChapterConst
	slot2 = slot2.MaxRow
	slot2 = slot2 - 1
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = 0
		slot6 = ChapterConst
		slot6 = slot6.MaxColumn
		slot6 = slot6 - 1
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot10 = slot0
			slot9 = slot0.updateAttachment
			slot11 = slot4
			slot12 = slot8

			slot9(slot10, slot11, slot12)
		end
	end

	slot2 = slot0
	slot1 = slot0.updateExtraAttachments

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateAreaAttachment
	slot3 = ChapterConst
	slot3 = slot3.AttachAreaBoss

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateCoastalGunAttachArea

	slot1(slot2)
end

slot0.updateAttachments = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.cells
	slot3 = {}
	slot4 = pairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.checkHadFlag
		slot11 = ChapterConst
		slot11 = slot11.FlagBanaiAirStrike
		slot9 = slot9(slot10, slot11)

		if slot9 then
			slot9 = table
			slot9 = slot9.insert
			slot10 = slot3
			slot11 = slot8

			slot9(slot10, slot11)
		end
	end

	slot5 = slot0
	slot4 = slot0.hideQuadMark
	slot6 = ChapterConst
	slot6 = slot6.MarkBanaiAirStrike

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.showQuadMark
	slot6 = slot3
	slot7 = ChapterConst
	slot7 = slot7.MarkBanaiAirStrike
	slot8 = "cell_coastal_gun"
	slot9 = Vector2
	slot10 = 110
	slot11 = 110
	slot9 = slot9(slot10, slot11)
	slot10 = true

	slot4(slot5, slot6, slot7, slot8, slot9, slot10)

	slot5 = slot0
	slot4 = slot0.updatePoisonArea

	slot4(slot5)
end

slot0.updateCellFlagList = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot1.cellAttachments
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.row
		slot9 = slot7.column
		slot10 = ChapterCell
		slot10 = slot10.Line2Name
		slot11 = slot8
		slot12 = slot9
		slot10 = slot10(slot11, slot12)
		slot11 = slot0.cellRoot
		slot12 = slot11
		slot11 = slot11.Find
		slot13 = slot10
		slot11 = slot11(slot12, slot13)
		slot13 = slot11
		slot12 = slot11.Find
		slot14 = ChapterConst
		slot14 = slot14.ChildAttachment
		slot12 = slot12(slot13, slot14)
		slot13 = slot7.data
		slot14 = pg
		slot14 = slot14.map_event_template
		slot15 = slot7.attachmentId
		slot14 = slot14[slot15]
		slot15 = slot14.icon
		slot16 = slot14.ship_prefab
		slot17 = "story_"
		slot18 = slot8
		slot19 = "_"
		slot20 = slot9
		slot21 = "_"
		slot22 = slot7.attachmentId
		slot17 = slot17 .. slot18 .. slot19 .. slot20 .. slot21 .. slot22
		slot19 = slot12
		slot18 = slot12.Find
		slot20 = slot17
		slot18 = slot18(slot19, slot20)
		slot19 = slot0.cellRoot
		slot20 = slot19
		slot19 = slot19.Find
		slot21 = slot17
		slot19 = slot19(slot20, slot21)

		if slot16 ~= "" then
			slot20 = IsNil
			slot21 = slot18
			slot20 = slot20(slot21)

			if slot20 then
				slot20 = cloneTplTo
				slot21 = slot0.spineTpl
				slot22 = slot12
				slot23 = slot17
				slot20 = slot20(slot21, slot22, slot23)
				slot18 = slot20
				slot20 = PoolMgr
				slot20 = slot20.GetInstance
				slot20 = slot20()
				slot21 = slot20
				slot20 = slot20.GetSpineChar
				slot22 = slot16
				slot23 = false

				function slot24(slot0)
					slot1 = slot0.transform
					slot2 = Vector3
					slot3 = 0.4
					slot4 = 0.4
					slot5 = 1
					slot2 = slot2(slot3, slot4, slot5)
					slot1.localScale = slot2
					slot1 = slot0.transform
					slot2 = slot1
					slot1 = slot1.GetComponent
					slot3 = "SpineAnimUI"
					slot1 = slot1(slot2, slot3)
					slot2 = slot1
					slot1 = slot1.SetAction
					slot3 = ChapterConst
					slot3 = slot3.ShipIdleAction
					slot4 = 0

					slot1(slot2, slot3, slot4)

					slot1 = slot0.transform
					slot2 = slot1
					slot1 = slot1.SetParent
					slot3 = slot0
					slot4 = false

					slot1(slot2, slot3, slot4)
				end

				slot20(slot21, slot22, slot23, slot24)

				slot20 = setActive
				slot21 = findTF
				slot22 = slot18
				slot23 = "help"
				slot21 = slot21(slot22, slot23)
				slot22 = true

				slot20(slot21, slot22)
			end
		end

		if slot15 ~= "" then
			slot20 = IsNil
			slot21 = slot18
			slot20 = slot20(slot21)

			if slot20 then
				slot20 = GameObject
				slot21 = slot17
				slot20 = slot20(slot21)
				slot18 = slot20.transform
				slot21 = slot18
				slot20 = slot18.SetParent
				slot22 = slot12
				slot23 = false

				slot20(slot21, slot22, slot23)

				slot21 = slot18
				slot20 = slot18.SetAsFirstSibling

				slot20(slot21)

				slot20 = PoolMgr
				slot20 = slot20.GetInstance
				slot20 = slot20()
				slot21 = slot20
				slot20 = slot20.GetPrefab
				slot22 = "ui/"
				slot23 = slot15
				slot24 = "_1"
				slot22 = slot22 .. slot23 .. slot24
				slot23 = slot15
				slot24 = "_1"
				slot23 = slot23 .. slot24
				slot24 = false

				function slot25(slot0)
					slot1 = slot0.transform
					slot2 = slot1
					slot1 = slot1.SetParent
					slot3 = slot0
					slot4 = false

					slot1(slot2, slot3, slot4)
				end

				slot20(slot21, slot22, slot23, slot24, slot25)
			end

			slot20 = IsNil
			slot21 = slot19
			slot20 = slot20(slot21)

			if slot20 then
				slot20 = PoolMgr
				slot20 = slot20.GetInstance
				slot20 = slot20()
				slot21 = slot20
				slot20 = slot20.GetPrefab
				slot22 = "ui/"
				slot23 = slot15
				slot24 = "_1shangceng"
				slot22 = slot22 .. slot23 .. slot24
				slot23 = slot15
				slot24 = "_1shangceng"
				slot23 = slot23 .. slot24
				slot24 = false

				function slot25(slot0)
					slot1 = slot0
					slot0.name = slot1
					slot1 = slot0.transform
					slot1 = slot1
					slot1 = slot0.transform
					slot2 = slot1
					slot1 = slot1.SetParent
					slot3 = slot2
					slot3 = slot3.cellRoot
					slot4 = false

					slot1(slot2, slot3, slot4)

					slot1 = slot0.transform
					slot2 = slot3
					slot2 = slot2.theme
					slot3 = slot2
					slot2 = slot2.GetLinePosition
					slot4 = slot4
					slot5 = slot5
					slot2 = slot2(slot3, slot4, slot5)
					slot1.localPosition = slot2
					slot1 = slot0.transform
					slot2 = Vector3
					slot3 = slot3
					slot3 = slot3.theme
					slot3 = slot3.angle
					slot3 = -slot3
					slot4 = 0
					slot5 = 0
					slot2 = slot2(slot3, slot4, slot5)
					slot1.localEulerAngles = slot2
					slot1 = table
					slot1 = slot1.insert
					slot2 = slot2
					slot2 = slot2.cellAttachments
					slot3 = HaloAttachmentView
					slot3 = slot3.New
					slot4 = slot0.transform
					slot5 = slot4
					slot6 = slot5

					slot1(slot2, slot3(slot4, slot5, slot6))
				end

				slot20(slot21, slot22, slot23, slot24, slot25)
			end
		end

		slot21 = slot1
		slot20 = slot1.getChapterCell
		slot22 = slot8
		slot23 = slot9
		slot20 = slot20(slot21, slot22, slot23)
		slot21 = slot7.flag

		if slot21 == 3 then
			slot21 = slot20.trait ~= ChapterConst.TraitLurk
			slot22 = pg.map_event_template[slot7.attachmentId].gametip
			slot23 = IsNil(slot18)

			if not slot23 then
				slot23 = setActive
				slot24 = slot18
				slot25 = slot21

				slot23(slot24, slot25)
			end
		end

		slot23 = IsNil
		slot24 = slot19
		slot23 = slot23(slot24)

		if not slot23 then
			slot23 = setActive
			slot24 = slot19
			slot25 = slot21

			slot23(slot24, slot25)
		end
	end
end

slot0.updateExtraAttachments = slot2

function slot2(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot4 = slot2
	slot3 = slot2.calcAttachmenArea
	slot5 = slot1
	slot3, slot4, slot5, slot6, slot7, slot8 = slot3(slot4, slot5)
	slot10 = slot2
	slot9 = slot2.getChapterCell
	slot11 = slot4
	slot12 = slot6
	slot9 = slot9(slot10, slot11, slot12)

	if slot9 then
		setActive(slot12, slot9.trait ~= ChapterConst.TraitLurk)

		slot13 = slot9.trait
		slot14 = ChapterConst.TraitLurk

		if slot13 == slot14 then
			return
		end

		slot13 = slot9.attachment
		slot14 = ChapterConst
		slot14 = slot14.AttachAreaBoss

		if slot13 == slot14 then
			slot13 = pg
			slot13 = slot13.expedition_data_template
			slot14 = slot9.attachmentId
			slot13 = slot13[slot14]
			slot14 = "enemy_"
			slot15 = slot9.attachmentId
			slot14 = slot14 .. slot15
			slot15 = "dead_"
			slot16 = slot9.attachmentId
			slot15 = slot15 .. slot16
			slot17 = slot12
			slot16 = slot12.Find
			slot18 = slot14
			slot16 = slot16(slot17, slot18)
			slot18 = slot12
			slot17 = slot12.Find
			slot19 = slot15
			slot17 = slot17(slot18, slot19)
			slot18 = slot9.flag

			if slot18 == 0 then
				slot18 = IsNil
				slot19 = slot16
				slot18 = slot18(slot19)

				if slot18 then
					slot18 = cloneTplTo
					slot19 = slot0.enemyTpl
					slot20 = slot12
					slot21 = slot14
					slot18 = slot18(slot19, slot20, slot21)
					slot16 = slot18
					slot16.anchoredPosition = slot7
					slot18 = GetImageSpriteFromAtlasAsync
					slot19 = "enemies/"
					slot20 = slot13.icon
					slot19 = slot19 .. slot20
					slot20 = ""
					slot21 = findTF
					slot22 = slot16
					slot23 = "icon"
					slot21 = slot21(slot22, slot23)
					slot22 = true

					slot18(slot19, slot20, slot21, slot22)

					slot18 = setText
					slot19 = findTF
					slot20 = slot16
					slot21 = "lv/Text"
					slot19 = slot19(slot20, slot21)
					slot20 = slot13.level

					slot18(slot19, slot20)

					slot18 = setActive
					slot19 = findTF
					slot20 = slot16
					slot21 = "titleContain/bg_s"
					slot19 = slot19(slot20, slot21)
					slot20 = ChapterConst
					slot20 = slot20.EnemySize
					slot21 = slot13.type
					slot20 = slot20[slot21]

					if slot20 ~= 1 then
						slot20 = ChapterConst
						slot20 = slot20.EnemySize
						slot21 = slot13.type
						slot20 = slot20[slot21]
						slot20 = not slot20

						if not slot20 then
							slot20 = false
						end
					else
						slot20 = true
					end

					slot18(slot19, slot20)
					setActive(findTF(slot16, "titleContain/bg_m"), ChapterConst.EnemySize[slot13.type] == 2)
					setActive(findTF(slot16, "titleContain/bg_h"), ChapterConst.EnemySize[slot13.type] == 3)
					setActive(findTF(slot16, "titleContain/bg_boss"), ChapterConst.EnemySize[slot13.type] == 99)
				end

				setActive(findTF(slot16, "huoqiubaozha"), false)
				setActive(findTF(slot16, "effect_found"), slot9.trait == ChapterConst.TraitVirgin)

				slot18 = slot9.trait
				slot19 = ChapterConst.TraitVirgin

				if slot18 == slot19 then
					slot18 = playSoundEffect
					slot19 = SFX_UI_WEIGHANCHOR_ENEMY

					slot18(slot19)
				end

				slot18 = setActive
				slot19 = findTF
				slot20 = slot16
				slot21 = "fighting"
				slot19 = slot19(slot20, slot21)
				slot20 = _
				slot20 = slot20.any
				slot21 = slot2.fleets

				function slot22(slot0)
					slot2 = slot0
					slot1 = slot0.isValid
					slot1 = slot1(slot2)

					if slot1 then
						slot1 = slot0.line
						slot1 = slot1.row
						slot2 = slot0
						slot1 = slot0.line
						slot1 = slot1.row
						slot2 = slot1
						slot1 = slot0.line
						slot1 = slot1.column
						slot2 = slot2

						return slot0.line.column <= slot3
					end
				end

				slot18(slot19, slot20(slot21, slot22))
			else
				slot18 = slot9.flag

				if slot18 == 1 then
					slot18 = slot9.attachment
					slot19 = ChapterConst
					slot19 = slot19.AttachAmbush

					if slot18 ~= slot19 then
						slot18 = IsNil
						slot19 = slot16
						slot18 = slot18(slot19)

						if not slot18 then
							slot18 = slot16.gameObject
							slot18 = slot18.activeSelf
						else
							slot18 = false

							if false then
								slot18 = true
							end
						end

						slot19 = IsNil
						slot20 = slot17
						slot19 = slot19(slot20)

						if slot19 then
							slot19 = cloneTplTo
							slot20 = slot0.deadTpl
							slot21 = slot12
							slot22 = slot15
							slot19 = slot19(slot20, slot21, slot22)
							slot17 = slot19
							slot17.anchoredPosition = slot7
							slot19 = "blue"
							slot20 = GetImageSpriteFromAtlasAsync
							slot21 = "enemies/"
							slot22 = slot13.icon
							slot23 = "_d_"
							slot24 = slot19
							slot21 = slot21 .. slot22 .. slot23 .. slot24
							slot22 = ""
							slot24 = slot17
							slot23 = slot17.Find
							slot25 = "icon"
							slot23 = slot23(slot24, slot25)
							slot24 = true

							slot20(slot21, slot22, slot23, slot24)

							slot20 = setActive
							slot22 = slot17
							slot21 = slot17.Find
							slot23 = "effect_not_open"
							slot21 = slot21(slot22, slot23)
							slot22 = false

							slot20(slot21, slot22)

							slot20 = setActive
							slot22 = slot17
							slot21 = slot17.Find
							slot23 = "effect_open"
							slot21 = slot21(slot22, slot23)
							slot22 = false

							slot20(slot21, slot22)
						end

						slot19 = setActive
						slot21 = slot17
						slot20 = slot17.Find
						slot22 = "huoqiubaozha"
						slot20 = slot20(slot21, slot22)
						slot21 = slot18

						slot19(slot20, slot21)
					end
				end
			end

			slot18 = IsNil
			slot19 = slot16
			slot18 = slot18(slot19)

			if not slot18 then
				setActive(slot16, slot9.flag == 0)
			end

			slot18 = IsNil
			slot19 = slot17
			slot18 = slot18(slot19)

			if not slot18 then
				setActive(slot17, slot9.flag == 1)
			end
		end
	end
end

slot0.updateAreaAttachment = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot5 = slot3
	slot4 = slot3.getChapterCell
	slot6 = slot1
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)

	if slot4 then
		slot5 = slot4.attachment
		slot6 = ChapterConst
		slot6 = slot6.AttachAreaBoss

		if slot5 == slot6 then
			return
		end

		slot5 = ChapterCell
		slot5 = slot5.Line2Name
		slot6 = slot1
		slot7 = slot2
		slot5 = slot5(slot6, slot7)
		slot6 = slot0.cellRoot
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = slot5
		slot6 = slot6(slot7, slot8)
		slot8 = slot6
		slot7 = slot6.Find
		slot9 = ChapterConst
		slot9 = slot9.ChildAttachment
		slot7 = slot7(slot8, slot9)
		slot8 = true
		slot9 = slot4.attachment
		slot10 = ChapterConst
		slot10 = slot10.AttachEnemy

		if slot9 ~= slot10 then
			slot9 = slot4.attachment
			slot10 = ChapterConst
			slot10 = slot10.AttachElite

			if slot9 ~= slot10 then
				slot9 = slot4.attachment
				slot10 = ChapterConst
				slot10 = slot10.AttachAmbush

				if slot9 ~= slot10 then
					slot9 = slot4.attachment
					slot10 = ChapterConst
					slot10 = slot10.AttachBoss

					if slot9 == slot10 then
						slot9 = slot4.flag

						if slot9 ~= 1 then
							slot10 = slot3
							slot9 = slot3.existFleet
							slot11 = FleetType
							slot11 = slot11.Transport
							slot12 = slot4.row
							slot13 = slot4.column
							slot9 = slot9(slot10, slot11, slot12, slot13)

							if slot9 then
								slot8 = false
							end
						end
					end
				end
			end
		end

		setActive(slot7, slot4.trait ~= ChapterConst.TraitLurk and slot8)

		slot9 = isActive(slot7)

		if not slot9 then
			return
		end

		slot9 = slot4.attachment
		slot10 = ChapterConst
		slot10 = slot10.AttachEnemy

		if slot9 ~= slot10 then
			slot9 = slot4.attachment
			slot10 = ChapterConst
			slot10 = slot10.AttachElite

			if slot9 ~= slot10 then
				slot9 = slot4.attachment
				slot10 = ChapterConst
				slot10 = slot10.AttachAmbush

				if slot9 ~= slot10 then
					slot9 = slot4.attachment
					slot10 = ChapterConst
					slot10 = slot10.AttachBoss

					if slot9 == slot10 then
						slot9 = pg
						slot9 = slot9.expedition_data_template
						slot10 = slot4.attachmentId
						slot9 = slot9[slot10]
						slot10 = slot9.add_icon
						slot11 = "enemy_"
						slot12 = slot4.attachmentId
						slot11 = slot11 .. slot12
						slot12 = "dead_"
						slot13 = slot4.attachmentId
						slot12 = slot12 .. slot13
						slot14 = slot7
						slot13 = slot7.Find
						slot15 = slot11
						slot13 = slot13(slot14, slot15)
						slot15 = slot7
						slot14 = slot7.Find
						slot16 = slot12
						slot14 = slot14(slot15, slot16)
						slot15 = false
						slot16 = slot4.attachment
						slot17 = ChapterConst
						slot17 = slot17.AttachAmbush

						if slot16 == slot17 then
							slot16 = slot4.flag

							if slot16 == 2 then
							end
						else
							slot16 = slot4.flag

							if slot16 == 0 then
								slot16 = IsNil
								slot17 = slot13
								slot16 = slot16(slot17)

								if slot16 then
									slot16 = cloneTplTo
									slot17 = slot0.enemyTpl
									slot18 = slot7
									slot19 = slot11
									slot16 = slot16(slot17, slot18, slot19)
									slot13 = slot16

									if slot10 ~= "" then
										slot16 = setActive
										slot17 = findTF
										slot18 = slot13
										slot19 = "labels/"
										slot20 = slot10
										slot19 = slot19 .. slot20
										slot17 = slot17(slot18, slot19)
										slot18 = true

										slot16(slot17, slot18)
									end

									slot16 = slot9.icon_type

									if slot16 == 1 then
										slot16 = Vector2
										slot17 = 0
										slot18 = 10
										slot16 = slot16(slot17, slot18)
										slot13.anchoredPosition = slot16
										slot16 = GetImageSpriteFromAtlasAsync
										slot17 = "enemies/"
										slot18 = slot9.icon
										slot17 = slot17 .. slot18
										slot18 = ""
										slot19 = findTF
										slot20 = slot13
										slot21 = "icon"

										slot16(slot17, slot18, slot19(slot20, slot21))

										slot16 = setText
										slot17 = findTF
										slot18 = slot13
										slot19 = "lv/Text"
										slot17 = slot17(slot18, slot19)
										slot18 = slot9.level

										slot16(slot17, slot18)

										slot16 = setActive
										slot17 = findTF
										slot18 = slot13
										slot19 = "titleContain/bg_s"
										slot17 = slot17(slot18, slot19)
										slot18 = ChapterConst
										slot18 = slot18.EnemySize
										slot19 = slot9.type
										slot18 = slot18[slot19]

										if slot18 ~= 1 then
											slot18 = ChapterConst
											slot18 = slot18.EnemySize
											slot19 = slot9.type
											slot18 = slot18[slot19]
											slot18 = not slot18

											if not slot18 then
												slot18 = false
											end
										else
											slot18 = true
										end

										slot16(slot17, slot18)
										setActive(findTF(slot13, "titleContain/bg_m"), ChapterConst.EnemySize[slot9.type] == 2)
										setActive(findTF(slot13, "titleContain/bg_h"), ChapterConst.EnemySize[slot9.type] == 3)
										setActive(findTF(slot13, "titleContain/bg_boss"), ChapterConst.EnemySize[slot9.type] == 99)
									else
										slot16 = Vector2
										slot17 = 0
										slot18 = 0
										slot16 = slot16(slot17, slot18)
										slot13.anchoredPosition = slot16
										slot16 = SetActive
										slot17 = findTF
										slot18 = slot13
										slot19 = "icon"
										slot17 = slot17(slot18, slot19)
										slot18 = false

										slot16(slot17, slot18)

										slot16 = PoolMgr
										slot16 = slot16.GetInstance
										slot16 = slot16()
										slot17 = slot16
										slot16 = slot16.GetSpineChar
										slot18 = slot9.icon
										slot19 = false

										function slot20(slot0)
											slot1 = slot0
											slot1 = slot1.scale
											slot1 = slot1 * 0.01
											slot2 = slot0.transform
											slot3 = Vector3
											slot4 = 0.4 * slot1
											slot5 = 0.4 * slot1
											slot6 = 1
											slot3 = slot3(slot4, slot5, slot6)
											slot2.localScale = slot3
											slot2 = slot0.transform
											slot3 = slot2
											slot2 = slot2.GetComponent
											slot4 = "SpineAnimUI"
											slot2 = slot2(slot3, slot4)
											slot3 = slot2
											slot2 = slot2.SetAction
											slot4 = ChapterConst
											slot4 = slot4.ShipIdleAction
											slot5 = 0

											slot2(slot3, slot4, slot5)

											slot2 = slot0.transform
											slot3 = slot2
											slot2 = slot2.GetComponent
											slot4 = "SkeletonGraphic"
											slot2 = slot2(slot3, slot4)
											slot3 = false
											slot2.raycastTarget = slot3
											slot2 = slot0.transform
											slot3 = slot2
											slot2 = slot2.SetParent
											slot4 = slot1
											slot5 = false

											slot2(slot3, slot4, slot5)

											slot2 = slot0.transform
											slot3 = slot2
											slot2 = slot2.SetAsFirstSibling

											slot2(slot3)
										end

										slot16(slot17, slot18, slot19, slot20)

										slot16 = setActive
										slot17 = findTF
										slot18 = slot13
										slot19 = "lv"
										slot17 = slot17(slot18, slot19)
										slot18 = false

										slot16(slot17, slot18)

										slot16 = setActive
										slot17 = findTF
										slot18 = slot13
										slot19 = "titleContain"
										slot17 = slot17(slot18, slot19)
										slot18 = false

										slot16(slot17, slot18)
									end

									slot16 = findTF
									slot17 = slot13
									slot18 = "random_buff_container"
									slot16 = slot16(slot17, slot18)
									slot17 = slot9.bufficon
									slot17 = #slot17
									slot18 = 0

									if slot17 > slot18 then
										slot17 = setActive
										slot18 = slot16
										slot19 = true

										slot17(slot18, slot19)

										slot17 = ipairs
										slot18 = slot9.bufficon
										slot17, slot18, slot19 = slot17(slot18)

										for slot20, slot21 in slot17, slot18, slot19 do
											slot22 = setActive
											slot23 = findTF
											slot24 = slot16
											slot25 = slot21
											slot23 = slot23(slot24, slot25)
											slot24 = true

											slot22(slot23, slot24)
										end
									end
								end

								setActive(findTF(slot13, (slot4.attachment == ChapterConst.AttachBoss and "effect_found_boss") or "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

								slot16 = slot4.trait
								slot17 = ChapterConst.TraitVirgin

								if slot16 == slot17 then
									slot16 = playSoundEffect
									slot17 = SFX_UI_WEIGHANCHOR_ENEMY

									slot16(slot17)
								end

								setActive(findTF(slot13, "fighting"), slot3:existFleet(FleetType.Normal, slot1, slot2))

								slot13:GetComponent("Animator").enabled = slot4.data > 0

								setActive(findTF(slot13, "damage_count"), slot4.data > 0)

								slot16 = slot0:isHuntingRangeVisible()

								if slot16 then
									slot16 = _
									slot16 = slot16.any
									slot17 = slot3.fleets

									function slot18(slot0)
										slot2 = slot0
										slot1 = slot0.getFleetType
										slot1 = slot1(slot2)
										slot2 = FleetType
										slot2 = slot2.Submarine

										if slot1 == slot2 then
											slot2 = slot0
											slot1 = slot0.isValid
											slot1 = slot1(slot2)

											if slot1 then
												slot2 = slot0
												slot1 = slot0.inHuntingRange
												slot3 = slot0
												slot3 = slot3.row
												slot4 = slot0
												slot4 = slot4.column
												slot1 = slot1(slot2, slot3, slot4)
											end
										else
											slot1 = false

											if false then
												slot1 = true
											end
										end

										return slot1
									end

									slot16 = slot16(slot17, slot18)
									slot15 = slot16
								end
							else
								slot16 = slot4.flag

								if slot16 == 1 then
									slot16 = slot4.attachment
									slot17 = ChapterConst
									slot17 = slot17.AttachAmbush

									if slot16 ~= slot17 then
										slot16 = IsNil
										slot17 = slot13
										slot16 = slot16(slot17)

										if not slot16 then
											slot16 = slot13.gameObject
											slot16 = slot16.activeSelf
										else
											slot16 = false

											if false then
												slot16 = true
											end
										end

										slot17 = IsNil
										slot18 = slot14
										slot17 = slot17(slot18)

										if slot17 then
											slot17 = slot9.icon_type

											if slot17 == 1 then
												slot17 = cloneTplTo
												slot18 = slot0.deadTpl
												slot19 = slot7
												slot20 = slot12
												slot17 = slot17(slot18, slot19, slot20)
												slot14 = slot17
												slot17 = Vector2
												slot18 = 0
												slot19 = 10
												slot17 = slot17(slot18, slot19)
												slot14.anchoredPosition = slot17
												slot17 = "blue"
												slot18 = GetImageSpriteFromAtlasAsync
												slot19 = "enemies/"
												slot20 = slot9.icon
												slot21 = "_d_"
												slot22 = slot17
												slot19 = slot19 .. slot20 .. slot21 .. slot22
												slot20 = ""
												slot22 = slot14
												slot21 = slot14.Find
												slot23 = "icon"

												slot18(slot19, slot20, slot21(slot22, slot23))

												slot18 = setActive
												slot20 = slot14
												slot19 = slot14.Find
												slot21 = "effect_not_open"
												slot19 = slot19(slot20, slot21)
												slot20 = false

												slot18(slot19, slot20)

												slot18 = setActive
												slot20 = slot14
												slot19 = slot14.Find
												slot21 = "effect_open"
												slot19 = slot19(slot20, slot21)
												slot20 = false

												slot18(slot19, slot20)
											end
										end

										slot17 = IsNil
										slot18 = slot14
										slot17 = slot17(slot18)

										if not slot17 then
											slot17 = setActive
											slot19 = slot14
											slot18 = slot14.Find
											slot20 = "huoqiubaozha"
											slot18 = slot18(slot19, slot20)
											slot19 = slot16

											slot17(slot18, slot19)
										end
									end
								end
							end
						end

						slot16 = IsNil
						slot17 = slot13
						slot16 = slot16(slot17)

						if not slot16 then
							setActive(slot13, slot4.flag == 0)
						end

						slot16 = IsNil
						slot17 = slot14
						slot16 = slot16(slot17)

						if not slot16 then
							setActive(slot14, slot4.flag == 1)
						end

						if slot15 then
							slot16 = slot0.attachTws
							slot16 = slot16[slot5]

							if not slot16 and slot13 then
								slot16 = _
								slot16 = slot16.values
								slot17 = slot0.attachTws
								slot16 = slot16(slot17)
								slot16 = slot16[1]

								if slot16 then
									slot17 = slot16.tw.passed or 0

									if slot16 then
										slot19 = LeanTween.color(findTF(slot13, "icon"), Color.New(1, 0.6, 0.6), 1):setFromColor(Color.white):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
										slot19.passed = slot17
										slot19.direction = slot16.tw.direction or 1
										slot0.attachTws[slot5] = {
											tw = slot19,
											uniqueId = slot19.uniqueId
										}

										if false then
											slot16 = slot0.attachTws
											slot16 = slot16[slot5]

											if slot16 then
												slot16 = LeanTween
												slot16 = slot16.cancel
												slot17 = slot0.attachTws
												slot17 = slot17[slot5]
												slot17 = slot17.uniqueId

												slot16(slot17)

												slot16 = slot0.attachTws
												slot17 = nil
												slot16[slot5] = slot17

												if slot13 then
													slot16 = setImageColor
													slot17 = findTF
													slot18 = slot13
													slot19 = "icon"
													slot17 = slot17(slot18, slot19)
													slot18 = Color
													slot18 = slot18.white

													slot16(slot17, slot18)
												end
											end
										end
									end
								end
							end
						end
					else
						slot9 = slot4.attachment
						slot10 = ChapterConst
						slot10 = slot10.AttachBox

						if slot9 == slot10 then
							slot9 = pg
							slot9 = slot9.box_data_template
							slot10 = slot4.attachmentId
							slot9 = slot9[slot10]
							slot10 = "box_"
							slot11 = slot4.attachmentId
							slot10 = slot10 .. slot11
							slot12 = slot7
							slot11 = slot7.Find
							slot13 = slot10
							slot11 = slot11(slot12, slot13)
							slot12 = slot4.flag

							if slot12 == 0 then
								slot12 = IsNil
								slot13 = slot11
								slot12 = slot12(slot13)

								if slot12 then
									slot12 = cloneTplTo
									slot13 = slot0.boxTpl
									slot14 = slot7
									slot15 = slot10
									slot12 = slot12(slot13, slot14, slot15)
									slot11 = slot12
									slot12 = Vector2
									slot13 = 0
									slot14 = 30
									slot12 = slot12(slot13, slot14)
									slot11.anchoredPosition = slot12
									slot12 = PoolMgr
									slot12 = slot12.GetInstance
									slot12 = slot12()
									slot13 = slot12
									slot12 = slot12.GetPrefab
									slot14 = "boxprefab/"
									slot15 = slot9.icon
									slot14 = slot14 .. slot15
									slot15 = slot9.icon
									slot16 = false

									function slot17(slot0)
										slot1 = slot0.transform
										slot2 = slot1
										slot1 = slot1.SetParent
										slot3 = slot0
										slot4 = slot3
										slot3 = slot3.Find
										slot5 = "icon"
										slot3 = slot3(slot4, slot5)
										slot4 = false

										slot1(slot2, slot3, slot4)
									end

									slot12(slot13, slot14, slot15, slot16, slot17)

									slot12 = slot9.type
									slot13 = ChapterConst
									slot13 = slot13.BoxTorpedo

									if slot12 ~= slot13 then
										slot12 = LeanTween
										slot12 = slot12.moveY
										slot13 = slot11
										slot14 = 40
										slot15 = 1.5
										slot12 = slot12(slot13, slot14, slot15)
										slot13 = slot12
										slot12 = slot12.setEase
										slot14 = LeanTweenType
										slot14 = slot14.easeInOutSine
										slot12 = slot12(slot13, slot14)
										slot13 = slot12
										slot12 = slot12.setLoopPingPong
										slot12 = slot12(slot13)
										slot13 = slot0.attachTws
										slot14 = {
											tw = slot12
										}
										slot15 = slot12.uniqueId
										slot14.uniqueId = slot15
										slot13[slot5] = slot14
									end
								end

								setActive(findTF(slot11, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

								slot12 = slot4.trait
								slot13 = ChapterConst.TraitVirgin

								if slot12 == slot13 then
									slot12 = playSoundEffect
									slot13 = SFX_UI_WEIGHANCHOR_ENEMY

									slot12(slot13)
								end
							end

							slot12 = IsNil
							slot13 = slot11
							slot12 = slot12(slot13)

							if not slot12 then
								setActive(slot11, slot4.flag == 0)
							end
						else
							slot9 = slot4.attachment
							slot10 = ChapterConst
							slot10 = slot10.AttachSupply

							if slot9 == slot10 then
								slot9 = "supply"
								slot11 = slot7
								slot10 = slot7.Find
								slot12 = slot9
								slot10 = slot10(slot11, slot12)
								slot11 = IsNil
								slot12 = slot10
								slot11 = slot11(slot12)

								if slot11 then
									slot11 = cloneTplTo
									slot12 = slot0.supplyTpl
									slot13 = slot7
									slot14 = slot9
									slot11 = slot11(slot12, slot13, slot14)
									slot10 = slot11
									slot11 = Vector2
									slot12 = 0
									slot13 = 30
									slot11 = slot11(slot12, slot13)
									slot10.anchoredPosition = slot11
									slot11 = LeanTween
									slot11 = slot11.moveY
									slot12 = slot10
									slot13 = 40
									slot14 = 1.5
									slot11 = slot11(slot12, slot13, slot14)
									slot12 = slot11
									slot11 = slot11.setEase
									slot13 = LeanTweenType
									slot13 = slot13.easeInOutSine
									slot11 = slot11(slot12, slot13)
									slot12 = slot11
									slot11 = slot11.setLoopPingPong
									slot11 = slot11(slot12)
									slot12 = slot0.attachTws
									slot13 = {
										tw = slot11
									}
									slot14 = slot11.uniqueId
									slot13.uniqueId = slot14
									slot12[slot5] = slot13
								end

								setActive(findTF(slot10, "normal"), slot4.attachmentId > 0)

								slot11 = setActive
								slot12 = findTF
								slot13 = slot10
								slot14 = "empty"
								slot12 = slot12(slot13, slot14)
								slot13 = false

								slot11(slot12, slot13)
							else
								slot9 = slot4.attachment
								slot10 = ChapterConst
								slot10 = slot10.AttachRival

								if slot9 == slot10 then
									slot9 = ChapterConst
									slot9 = slot9.Line2RivalName
									slot10 = slot4.row
									slot11 = slot4.column
									slot9 = slot9(slot10, slot11)
									slot10 = slot0.rivals
									slot10 = slot10[slot9]
									slot11 = slot4.flag

									if slot11 == 0 then
										if not slot10 then
											slot11 = cloneTplTo
											slot12 = slot0.rivalTpl
											slot13 = slot7
											slot14 = slot9
											slot11 = slot11(slot12, slot13, slot14)
											slot12 = Vector2
											slot13 = 0
											slot14 = 0
											slot12 = slot12(slot13, slot14)
											slot11.anchoredPosition = slot12
											slot12 = setActive
											slot13 = slot11
											slot14 = true

											slot12(slot13, slot14)

											slot12 = slot0.rivals
											slot13 = RivalCellView
											slot13 = slot13.New
											slot14 = slot11.gameObject
											slot13 = slot13(slot14)
											slot12[slot9] = slot13
											slot12 = slot0.rivals
											slot10 = slot12[slot9]
											slot13 = slot10
											slot12 = slot10.setLine
											slot14 = {}
											slot15 = slot4.row
											slot14.row = slot15
											slot15 = slot4.column
											slot14.column = slot15

											slot12(slot13, slot14)
										end

										slot10:setAction(ChapterConst.ShipIdleAction)
										slot10:setPrefab(slot4.rival.mainShips[1]:getPrefab())
										slot0:frozen()
										slot10:loadSpine(function ()
											slot0:unfrozen()
										end)
										setActive(slot10.tfEffectFound, slot4.trait == ChapterConst.TraitVirgin)

										slot11 = slot4.trait
										slot12 = ChapterConst.TraitVirgin

										if slot11 == slot12 then
											slot11 = playSoundEffect
											slot12 = SFX_UI_WEIGHANCHOR_ENEMY

											slot11(slot12)
										end

										setActive(slot10.tfFighting, slot3:existFleet(FleetType.Normal, slot1, slot2))
										setText(slot10.tfName, slot4.rival.name)
										setActive(slot10.tfDamageCount, slot4.data > 0)
									else
										slot11 = slot4.flag

										if slot11 == 1 and slot10 then
											slot12 = slot10
											slot11 = slot10.unloadSpine

											slot11(slot12)
										end
									end

									if slot10 then
										setActive(slot10.tf, slot4.flag == 0)
									end
								else
									slot9 = slot4.attachment
									slot10 = ChapterConst
									slot10 = slot10.AttachTransport_Target

									if slot9 == slot10 then
										slot9 = "transport_target"
										slot11 = slot7
										slot10 = slot7.Find
										slot12 = slot9
										slot10 = slot10(slot11, slot12)
										slot11 = IsNil
										slot12 = slot10
										slot11 = slot11(slot12)

										if slot11 then
											slot11 = cloneTplTo
											slot12 = slot0.transportTargetTpl
											slot13 = slot7
											slot14 = slot9
											slot11 = slot11(slot12, slot13, slot14)
											slot10 = slot11
											slot11 = Vector2
											slot12 = 0
											slot13 = 0
											slot11 = slot11(slot12, slot13)
											slot10.anchoredPosition = slot11
											slot11 = LeanTween
											slot11 = slot11.moveY
											slot12 = slot10
											slot13 = 10
											slot14 = 1.5
											slot11 = slot11(slot12, slot13, slot14)
											slot12 = slot11
											slot11 = slot11.setEase
											slot13 = LeanTweenType
											slot13 = slot13.easeInOutSine
											slot11 = slot11(slot12, slot13)
											slot12 = slot11
											slot11 = slot11.setLoopPingPong
											slot11 = slot11(slot12)
											slot12 = slot0.attachTws
											slot13 = {
												tw = slot11
											}
											slot14 = slot11.uniqueId
											slot13.uniqueId = slot14
											slot12[slot9] = slot13
										end
									else
										slot9 = slot4.attachment
										slot10 = ChapterConst
										slot10 = slot10.AttachStory

										if slot9 == slot10 then
											slot9 = slot4.data
											slot10 = pg
											slot10 = slot10.map_event_template
											slot11 = slot4.attachmentId
											slot10 = slot10[slot11]
											slot11 = slot10.icon
											slot12 = slot10.ship_prefab
											slot13 = "story_"
											slot14 = slot1
											slot15 = "_"
											slot16 = slot2
											slot17 = "_"
											slot18 = slot4.attachmentId
											slot13 = slot13 .. slot14 .. slot15 .. slot16 .. slot17 .. slot18
											slot15 = slot7
											slot14 = slot7.Find
											slot16 = slot13
											slot14 = slot14(slot15, slot16)
											slot16 = slot7
											slot15 = slot7.Find
											slot17 = slot11
											slot15 = slot15(slot16, slot17)
											slot16 = slot0.cellRoot
											slot17 = slot16
											slot16 = slot16.Find
											slot18 = slot13
											slot16 = slot16(slot17, slot18)

											if slot11 ~= "" then
												slot17 = IsNil
												slot18 = slot14
												slot17 = slot17(slot18)

												if slot17 then
													slot17 = slot4.data
													slot18 = ChapterConst
													slot18 = slot18.Story

													if slot17 == slot18 then
														slot17 = GameObject
														slot17 = slot17.New
														slot18 = slot13
														slot17 = slot17(slot18)
														slot14 = slot17.transform
														slot18 = slot14
														slot17 = slot14.SetParent
														slot19 = slot7
														slot20 = false

														slot17(slot18, slot19, slot20)

														slot17 = cloneTplTo
														slot18 = slot0.boxTpl
														slot19 = slot7
														slot20 = slot11
														slot17 = slot17(slot18, slot19, slot20)
														slot15 = slot17
														slot17 = Vector2
														slot18 = 0
														slot19 = 30
														slot17 = slot17(slot18, slot19)
														slot15.anchoredPosition = slot17
														slot17 = PoolMgr
														slot17 = slot17.GetInstance
														slot17 = slot17()
														slot18 = slot17
														slot17 = slot17.GetPrefab
														slot19 = "boxprefab/mapevent1"
														slot20 = "mapevent1"
														slot21 = false

														function slot22(slot0)
															slot1 = slot0.transform
															slot2 = slot1
															slot1 = slot1.SetParent
															slot3 = slot0
															slot4 = slot3
															slot3 = slot3.Find
															slot5 = "icon"
															slot3 = slot3(slot4, slot5)
															slot4 = false

															slot1(slot2, slot3, slot4)
														end

														slot17(slot18, slot19, slot20, slot21, slot22)

														if slot11 ~= "mapevent1" then
															slot17 = PoolMgr
															slot17 = slot17.GetInstance
															slot17 = slot17()
															slot18 = slot17
															slot17 = slot17.GetPrefab
															slot19 = "ui/"
															slot20 = slot11
															slot21 = "_2"
															slot19 = slot19 .. slot20 .. slot21
															slot20 = slot11
															slot21 = "_2"
															slot20 = slot20 .. slot21
															slot21 = false

															function slot22(slot0)
																slot1 = slot0.transform
																slot2 = slot1
																slot1 = slot1.SetParent
																slot3 = slot0
																slot4 = false

																slot1(slot2, slot3, slot4)

																slot1 = SetActive
																slot2 = slot0.transform
																slot3 = slot2
																slot2 = slot2.Find
																slot4 = "Xyz/F"
																slot2 = slot2(slot3, slot4)
																slot3 = false

																slot1(slot2, slot3)
															end

															slot17(slot18, slot19, slot20, slot21, slot22)
														end

														slot17 = LeanTween
														slot17 = slot17.moveY
														slot18 = slot15
														slot19 = 40
														slot20 = 1.5
														slot17 = slot17(slot18, slot19, slot20)
														slot18 = slot17
														slot17 = slot17.setEase
														slot19 = LeanTweenType
														slot19 = slot19.easeInOutSine
														slot17 = slot17(slot18, slot19)
														slot18 = slot17
														slot17 = slot17.setLoopPingPong
														slot17 = slot17(slot18)
														slot18 = slot0.attachTws
														slot19 = {
															tw = slot17
														}
														slot20 = slot17.uniqueId
														slot19.uniqueId = slot20
														slot18[slot5] = slot19
													else
														slot17 = slot4.data
														slot18 = ChapterConst
														slot18 = slot18.StoryObstacle

														if slot17 == slot18 then
															slot17 = GameObject
															slot17 = slot17.New
															slot18 = slot13
															slot17 = slot17(slot18)
															slot14 = slot17.transform
															slot18 = slot14
															slot17 = slot14.SetParent
															slot19 = slot7
															slot20 = false

															slot17(slot18, slot19, slot20)

															slot17 = PoolMgr
															slot17 = slot17.GetInstance
															slot17 = slot17()
															slot18 = slot17
															slot17 = slot17.GetPrefab
															slot19 = "ui/"
															slot20 = slot11
															slot21 = "_2"
															slot19 = slot19 .. slot20 .. slot21
															slot20 = slot11
															slot21 = "_2"
															slot20 = slot20 .. slot21
															slot21 = false

															function slot22(slot0)
																slot1 = slot0.transform
																slot2 = slot1
																slot1 = slot1.SetParent
																slot3 = slot0
																slot4 = false

																slot1(slot2, slot3, slot4)
															end

															slot17(slot18, slot19, slot20, slot21, slot22)
														end
													end
												end
											end

											slot17 = false
											slot18 = nil
											slot19 = slot4.data
											slot20 = ChapterConst
											slot20 = slot20.Story

											if slot19 == slot20 then
												slot17 = slot4.flag == 0
											else
												slot19 = slot4.data
												slot20 = ChapterConst
												slot20 = slot20.StoryObstacle

												if slot19 == slot20 then
													slot17 = slot4.flag == 3
													slot20 = slot0.endAniFlag[slot4.attachment .. "_" .. slot4.attachmentId]

													if slot20 ~= nil then
														slot20 = slot0.endAniFlag
														slot20 = slot20[slot19]
														slot21 = slot4.flag

														if slot20 ~= slot21 and not slot17 then
															slot20 = pg
															slot20 = slot20.map_event_template
															slot21 = slot4.attachmentId
															slot20 = slot20[slot21]

															if not slot17 and slot20 then
																slot21 = slot20.animation

																if slot21 then
																	slot18 = slot20.animation
																end
															end
														end
													end

													slot20 = slot0.endAniFlag
													slot21 = slot4.flag
													slot20[slot19] = slot21
												else
													slot19 = slot4.data
													slot20 = ChapterConst
													slot20 = slot20.StoryTrigger

													if slot19 == slot20 then
														slot17 = slot4.flag == 3
														slot19 = IsNil(slot14)
													end
												end
											end

											if not slot19 then
												slot19 = setActive
												slot20 = slot14
												slot21 = slot17

												slot19(slot20, slot21)
											end

											slot19 = IsNil
											slot20 = slot15
											slot19 = slot19(slot20)

											if not slot19 then
												slot19 = setActive
												slot20 = slot15
												slot21 = slot17

												slot19(slot20, slot21)
											end

											slot19 = IsNil
											slot20 = slot16
											slot19 = slot19(slot20)

											if not slot19 then
												slot19 = setActive
												slot20 = slot16
												slot21 = slot17

												slot19(slot20, slot21)
											end

											if slot18 and slot18 ~= "" then
												slot19 = PoolMgr
												slot19 = slot19.GetInstance
												slot19 = slot19()
												slot20 = slot19
												slot19 = slot19.GetPrefab
												slot21 = "ui/"
												slot22 = slot18
												slot21 = slot21 .. slot22
												slot22 = slot18
												slot23 = false

												function slot24(slot0)
													slot1 = setParent
													slot2 = slot0.transform
													slot3 = slot0
													slot4 = false

													slot1(slot2, slot3, slot4)

													slot2 = slot0
													slot1 = slot0.GetComponent
													slot3 = typeof
													slot4 = ParticleSystemEvent
													slot1 = slot1(slot2, slot3(slot4))
													slot2 = IsNil
													slot3 = slot1
													slot2 = slot2(slot3)

													if not slot2 then
														slot3 = slot1
														slot2 = slot1.AddEndEvent

														function slot4(slot0)
															slot1 = PoolMgr
															slot1 = slot1.GetInstance
															slot1 = slot1()
															slot2 = slot1
															slot1 = slot1.ReturnPrefab
															slot3 = "ui/"
															slot4 = slot0
															slot3 = slot3 .. slot4
															slot4 = slot0
															slot5 = slot0

															slot1(slot2, slot3, slot4, slot5)
														end

														slot2(slot3, slot4)
													end
												end

												slot19(slot20, slot21, slot22, slot23, slot24)
											end
										else
											slot9 = slot4.attachment
											slot10 = ChapterConst
											slot10 = slot10.AttachBomb_Enemy

											if slot9 == slot10 then
												slot9 = pg
												slot9 = slot9.specialunit_template
												slot10 = slot4.attachmentId
												slot9 = slot9[slot10]
												slot10 = "bomb_enemy_"
												slot11 = slot4.attachmentId
												slot10 = slot10 .. slot11
												slot11 = "bomb_dead_"
												slot12 = slot4.attachmentId
												slot11 = slot11 .. slot12
												slot13 = slot7
												slot12 = slot7.Find
												slot14 = slot10
												slot12 = slot12(slot13, slot14)
												slot14 = slot7
												slot13 = slot7.Find
												slot15 = slot11
												slot13 = slot13(slot14, slot15)
												slot14 = slot4.flag

												if slot14 == 0 then
													slot14 = IsNil
													slot15 = slot12
													slot14 = slot14(slot15)

													if slot14 then
														cloneTplTo(slot0.bombEnemyTpl, slot7, slot10).anchoredPosition = Vector2(0, 10)

														GetImageSpriteFromAtlasAsync("enemies/" .. slot9.prefab, "", findTF(cloneTplTo(slot0.bombEnemyTpl, slot7, slot10), "icon"))
														setActive(findTF(slot12, "titleContain/bg_s"), slot9.enemy_point == 5)
														setActive(findTF(cloneTplTo(slot0.bombEnemyTpl, slot7, slot10), "titleContain/bg_m"), slot9.enemy_point == 8)
														setActive(findTF(cloneTplTo(slot0.bombEnemyTpl, slot7, slot10), "titleContain/bg_h"), slot9.enemy_point == 10)
													end

													setActive(findTF(slot12, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

													slot14 = slot4.trait
													slot15 = ChapterConst.TraitVirgin

													if slot14 == slot15 then
														slot14 = playSoundEffect
														slot15 = SFX_UI_WEIGHANCHOR_ENEMY

														slot14(slot15)
													end
												else
													slot14 = slot4.flag

													if slot14 == 1 then
														slot14 = IsNil
														slot15 = slot12
														slot14 = slot14(slot15)

														if not slot14 then
															slot14 = slot12.gameObject
															slot14 = slot14.activeSelf
														else
															slot14 = false

															if false then
																slot14 = true
															end
														end

														slot15 = IsNil
														slot16 = slot13
														slot15 = slot15(slot16)

														if slot15 then
															slot15 = cloneTplTo
															slot16 = slot0.deadTpl
															slot17 = slot7
															slot18 = slot11
															slot15 = slot15(slot16, slot17, slot18)
															slot13 = slot15
															slot15 = Vector2
															slot16 = 0
															slot17 = 10
															slot15 = slot15(slot16, slot17)
															slot13.anchoredPosition = slot15
															slot15 = "blue"
															slot16 = GetImageSpriteFromAtlasAsync
															slot17 = "enemies/"
															slot18 = slot9.prefab
															slot19 = "_d_"
															slot20 = slot15
															slot17 = slot17 .. slot18 .. slot19 .. slot20
															slot18 = ""
															slot20 = slot13
															slot19 = slot13.Find
															slot21 = "icon"

															slot16(slot17, slot18, slot19(slot20, slot21))

															slot16 = setActive
															slot18 = slot13
															slot17 = slot13.Find
															slot19 = "effect_not_open"
															slot17 = slot17(slot18, slot19)
															slot18 = false

															slot16(slot17, slot18)

															slot16 = setActive
															slot18 = slot13
															slot17 = slot13.Find
															slot19 = "effect_open"
															slot17 = slot17(slot18, slot19)
															slot18 = false

															slot16(slot17, slot18)
														end

														slot15 = setActive
														slot17 = slot13
														slot16 = slot13.Find
														slot18 = "huoqiubaozha"
														slot16 = slot16(slot17, slot18)
														slot17 = slot14

														slot15(slot16, slot17)
													end
												end

												slot14 = IsNil
												slot15 = slot12
												slot14 = slot14(slot15)

												if not slot14 then
													setActive(slot12, slot4.flag == 0)
												end

												slot14 = IsNil
												slot15 = slot13
												slot14 = slot14(slot15)

												if not slot14 then
													setActive(slot13, slot4.flag == 1)
												end
											else
												slot9 = slot4.attachment
												slot10 = ChapterConst
												slot10 = slot10.AttachLandbase

												if slot9 == slot10 then
													slot9 = pg
													slot9 = slot9.land_based_template
													slot10 = slot4.attachmentId
													slot9 = slot9[slot10]
													slot10 = "landbase_"
													slot11 = slot4.attachmentId
													slot10 = slot10 .. slot11
													slot11 = "landbase_dead_"
													slot12 = slot4.attachmentId
													slot11 = slot11 .. slot12
													slot13 = slot7
													slot12 = slot7.Find
													slot14 = slot10
													slot12 = slot12(slot13, slot14)
													slot14 = slot7
													slot13 = slot7.Find
													slot15 = slot11
													slot13 = slot13(slot14, slot15)
													slot14 = slot4.flag

													if slot14 == 0 then
														slot14 = IsNil
														slot15 = slot12
														slot14 = slot14(slot15)

														if slot14 then
															slot14 = cloneTplTo
															slot15 = slot0.enemyTpl
															slot16 = slot7
															slot17 = slot10
															slot14 = slot14(slot15, slot16, slot17)
															slot12 = slot14
															slot14 = Vector2
															slot15 = 0
															slot16 = 10
															slot14 = slot14(slot15, slot16)
															slot12.anchoredPosition = slot14
															slot14 = GetImageSpriteFromAtlasAsync
															slot15 = "enemies/"
															slot16 = slot9.prefab
															slot15 = slot15 .. slot16
															slot16 = ""
															slot17 = findTF
															slot18 = slot12
															slot19 = "icon"

															slot14(slot15, slot16, slot17(slot18, slot19))

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "lv"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "titleContain"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "damage_count"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)

															slot14 = setActive
															slot15 = findTF
															slot16 = slot12
															slot17 = "fighting"
															slot15 = slot15(slot16, slot17)
															slot16 = false

															slot14(slot15, slot16)
														end

														setActive(findTF(slot12, "effect_found"), slot4.trait == ChapterConst.TraitVirgin)

														slot14 = slot4.trait
														slot15 = ChapterConst.TraitVirgin

														if slot14 == slot15 then
															slot14 = playSoundEffect
															slot15 = SFX_UI_WEIGHANCHOR_ENEMY

															slot14(slot15)
														end
													else
														slot14 = slot4.flag

														if slot14 == 1 then
															slot14 = IsNil
															slot15 = slot12
															slot14 = slot14(slot15)

															if not slot14 then
																slot14 = slot12.gameObject
																slot14 = slot14.activeSelf
															else
																slot14 = false

																if false then
																	slot14 = true
																end
															end

															slot15 = IsNil
															slot16 = slot13
															slot15 = slot15(slot16)

															if slot15 then
																slot15 = cloneTplTo
																slot16 = slot0.deadTpl
																slot17 = slot7
																slot18 = slot11
																slot15 = slot15(slot16, slot17, slot18)
																slot13 = slot15
																slot15 = Vector2
																slot16 = 0
																slot17 = 10
																slot15 = slot15(slot16, slot17)
																slot13.anchoredPosition = slot15
																slot15 = "blue"
																slot16 = GetImageSpriteFromAtlasAsync
																slot17 = "enemies/"
																slot18 = slot9.prefab
																slot19 = "_d_"
																slot20 = slot15
																slot17 = slot17 .. slot18 .. slot19 .. slot20
																slot18 = ""
																slot20 = slot13
																slot19 = slot13.Find
																slot21 = "icon"

																slot16(slot17, slot18, slot19(slot20, slot21))

																slot16 = setActive
																slot18 = slot13
																slot17 = slot13.Find
																slot19 = "effect_not_open"
																slot17 = slot17(slot18, slot19)
																slot18 = false

																slot16(slot17, slot18)

																slot16 = setActive
																slot18 = slot13
																slot17 = slot13.Find
																slot19 = "effect_open"
																slot17 = slot17(slot18, slot19)
																slot18 = false

																slot16(slot17, slot18)
															end

															slot15 = setActive
															slot17 = slot13
															slot16 = slot13.Find
															slot18 = "huoqiubaozha"
															slot16 = slot16(slot17, slot18)
															slot17 = slot14

															slot15(slot16, slot17)
														end
													end

													slot14 = IsNil
													slot15 = slot12
													slot14 = slot14(slot15)

													if not slot14 then
														setActive(slot12, slot4.flag == 0)
													end

													slot14 = IsNil
													slot15 = slot13
													slot14 = slot14(slot15)

													if not slot14 then
														setActive(slot13, slot4.flag == 1)
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

slot0.updateAttachment = slot2

function slot2(slot0, slot1, ...)
	if not slot1 then
		slot2 = ChapterConst
		slot2 = slot2.QuadStateNormal
	end

	slot0.quadState = slot2
	slot2 = slot0.contextData
	slot2 = slot2.chapterVO
	slot3 = slot2.fleet

	if slot3 == nil then
		return
	end

	slot4 = 0
	slot5 = ChapterConst
	slot5 = slot5.MaxRow
	slot5 = slot5 - 1
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = 0
		slot9 = ChapterConst
		slot9 = slot9.MaxColumn
		slot9 = slot9 - 1
		slot10 = 1

		for slot11 = slot8, slot9, slot10 do
			slot13 = slot2
			slot12 = slot2.getChapterCell
			slot14 = slot7
			slot15 = slot11
			slot12 = slot12(slot13, slot14, slot15)

			if slot12 then
				slot13 = slot12.walkable

				if slot13 then
					slot13 = ChapterCell
					slot13 = slot13.Line2QuadName
					slot14 = slot7
					slot15 = slot11
					slot13 = slot13(slot14, slot15)
					slot14 = slot0.quadRoot
					slot15 = slot14
					slot14 = slot14.Find
					slot16 = slot13
					slot14 = slot14(slot15, slot16)
					slot15 = Vector3
					slot15 = slot15.one
					slot14.localScale = slot15
					slot16 = slot2
					slot15 = slot2.getQuadCellPic
					slot17 = slot12
					slot15 = slot15(slot16, slot17)

					if slot15 then
						slot17 = slot0
						slot16 = slot0.startQuadTween
						slot18 = slot13
						slot19 = slot14

						slot16(slot17, slot18, slot19)
					else
						slot17 = slot0
						slot16 = slot0.cancelQuadTween
						slot18 = slot13
						slot19 = slot14

						slot16(slot17, slot18, slot19)

						slot16 = setImageAlpha
						slot17 = slot14
						slot18 = ChapterConst
						slot18 = slot18.CellEaseOutAlpha

						slot16(slot17, slot18)
					end

					slot16 = defaultValue
					slot17 = slot15
					slot18 = "cell_normal"
					slot16 = slot16(slot17, slot18)
					slot15 = slot16
					slot16 = setImageSprite
					slot17 = slot14
					slot18 = GetSpriteFromAtlas
					slot19 = "chapter/pic/cellgrid"
					slot20 = slot15

					slot16(slot17, slot18(slot19, slot20))
				end
			end
		end
	end

	slot4 = {}
	slot5 = ChapterConst
	slot5 = slot5.AttachAreaBoss
	slot4[1] = slot5
	slot5 = ipairs
	slot6 = slot4
	slot5, slot6, slot7 = slot5(slot6)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot11 = slot2
		slot10 = slot2.calcAttachmenArea
		slot12 = slot9
		slot10, slot11, slot12, slot13, slot14, slot15 = slot10(slot11, slot12)
		slot17 = slot2
		slot16 = slot2.getChapterCell
		slot18 = slot11
		slot19 = slot13
		slot16 = slot16(slot17, slot18, slot19)

		if slot16 then
			slot17 = slot16.walkable

			if slot17 then
				slot17 = ChapterCell
				slot17 = slot17.MinMaxLine2QuadName
				slot18 = slot10
				slot19 = slot12
				slot20 = slot11
				slot21 = slot13
				slot17 = slot17(slot18, slot19, slot20, slot21)
				slot18 = slot0.quadRoot
				slot19 = slot18
				slot18 = slot18.Find
				slot20 = slot17
				slot18 = slot18(slot19, slot20)
				slot19 = IsNil
				slot20 = slot18
				slot19 = slot19(slot20)

				if slot19 then
					slot19 = PoolMgr
					slot19 = slot19.GetInstance
					slot19 = slot19()
					slot20 = slot19
					slot19 = slot19.GetPrefab
					slot21 = "chapter/cell_quad"
					slot22 = "cell_quad"
					slot23 = false

					function slot24(slot0)
						slot1 = slot0.transform
						slot0 = slot1
					end

					slot19(slot20, slot21, slot22, slot23, slot24)

					slot18.name = slot17
					slot20 = slot18
					slot19 = slot18.SetParent
					slot21 = slot0.quadRoot
					slot22 = false

					slot19(slot20, slot21, slot22)

					slot19 = ChapterCell
					slot19 = slot19.Line2QuadName
					slot20 = slot11
					slot21 = slot13
					slot19 = slot19(slot20, slot21)
					slot20 = slot0.quadRoot
					slot21 = slot20
					slot20 = slot20.Find
					slot22 = slot19
					slot20 = slot20(slot21, slot22)
					slot22 = slot18
					slot21 = slot18.SetSiblingIndex
					slot24 = slot20
					slot23 = slot20.GetSiblingIndex

					slot21(slot22, slot23(slot24))
				end

				slot18.sizeDelta = slot15
				slot19 = slot2.theme
				slot20 = slot19
				slot19 = slot19.GetLinePosition
				slot21 = slot11
				slot22 = slot13
				slot19 = slot19(slot20, slot21, slot22)
				slot20 = Vector3
				slot21 = slot14.x
				slot22 = slot14.y
				slot23 = 0
				slot20 = slot20(slot21, slot22, slot23)
				slot19 = slot19 + slot20
				slot18.anchoredPosition = slot19
				slot19 = Vector3
				slot19 = slot19.one
				slot18.localScale = slot19
				slot20 = slot2
				slot19 = slot2.getQuadCellPic
				slot21 = slot16
				slot19 = slot19(slot20, slot21)

				if slot19 then
					slot21 = slot0
					slot20 = slot0.startQuadTween
					slot22 = slot17
					slot23 = slot18

					slot20(slot21, slot22, slot23)
				else
					slot21 = slot0
					slot20 = slot0.cancelQuadTween
					slot22 = slot17
					slot23 = slot18

					slot20(slot21, slot22, slot23)

					slot20 = setImageAlpha
					slot21 = slot18
					slot22 = ChapterConst
					slot22 = slot22.CellEaseOutAlpha

					slot20(slot21, slot22)
				end

				slot20 = defaultValue
				slot21 = slot19
				slot22 = "cell_normal"
				slot20 = slot20(slot21, slot22)
				slot19 = slot20
				slot20 = setImageSprite
				slot21 = slot18
				slot22 = GetSpriteFromAtlas
				slot23 = "chapter/pic/cellgrid"
				slot24 = slot19

				slot20(slot21, slot22(slot23, slot24))
			end
		end
	end

	slot5 = _
	slot5 = slot5.any
	slot6 = slot2.champions

	function slot7(slot0)
		slot1 = ChapterCell
		slot1 = slot1.Line2QuadName
		slot2 = slot0.row
		slot3 = slot0.column
		slot1 = slot1(slot2, slot3)
		slot2 = slot0
		slot2 = slot2.quadRoot
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = slot1
		slot2 = slot2(slot3, slot4)
		slot3 = Vector3
		slot3 = slot3.one
		slot2.localScale = slot3
		slot3 = "cell_normal"
		slot4 = slot0.flag

		if slot4 ~= 1 then
			slot4 = slot0.trait
			slot5 = ChapterConst
			slot5 = slot5.TraitLurk

			if slot4 ~= slot5 then
				slot4 = slot1
				slot5 = slot4
				slot4 = slot4.getChampionVisibility
				slot6 = slot0
				slot4 = slot4(slot5, slot6)

				if slot4 then
					slot4 = slot1
					slot5 = slot4
					slot4 = slot4.existFleet
					slot6 = FleetType
					slot6 = slot6.Transport
					slot7 = slot0.row
					slot8 = slot0.column
					slot4 = slot4(slot5, slot6, slot7, slot8)

					if not slot4 then
						slot3 = "cell_enemy"
						slot4 = slot0
						slot5 = slot4
						slot4 = slot4.startQuadTween
						slot6 = slot1
						slot7 = slot2

						slot4(slot5, slot6, slot7)
					end
				end
			end
		else
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.cancelQuadTween
			slot6 = slot1
			slot7 = slot2

			slot4(slot5, slot6, slot7)

			slot4 = setImageAlpha
			slot5 = slot2
			slot6 = ChapterConst
			slot6 = slot6.CellEaseOutAlpha

			slot4(slot5, slot6)
		end

		slot4 = setImageSprite
		slot5 = slot2
		slot6 = GetSpriteFromAtlas
		slot7 = "chapter/pic/cellgrid"
		slot8 = slot3

		slot4(slot5, slot6(slot7, slot8))
	end

	slot5(slot6, slot7)

	slot5 = {}
	slot6 = "cell_normal"
	slot7 = slot0.quadState
	slot8 = ChapterConst
	slot8 = slot8.QuadStateStrategy

	if slot7 == slot8 then
		slot7 = {
			...
		}
		slot5 = slot7[1]
		slot8 = slot7[2]
		slot0.quadClickProxy = slot8
		slot6 = "cell_barrier_select"
	else
		slot7 = slot0.quadState
		slot8 = ChapterConst
		slot8 = slot8.QuadStateNormal

		if slot7 == slot8 then
			slot8 = slot2
			slot7 = slot2.existMoveLimit
			slot7 = slot7(slot8)

			if slot7 then
				slot8 = slot2
				slot7 = slot2.checkAnyInteractive
				slot7 = slot7(slot8)

				if not slot7 then
					slot8 = slot2
					slot7 = slot2.calcWalkableCells
					slot9 = ChapterConst
					slot9 = slot9.SubjectPlayer
					slot10 = slot3.line
					slot10 = slot10.row
					slot11 = slot3.line
					slot11 = slot11.column
					slot13 = slot3
					slot12 = slot3.getSpeed
					slot7 = slot7(slot8, slot9, slot10, slot11, slot12(slot13))
					slot5 = slot7
				end
			end
		end
	end

	slot8 = slot0
	slot7 = slot0.killPresentTws

	slot7(slot8)

	slot7 = #slot5
	slot8 = 0

	if slot7 > slot8 then
		slot7 = _
		slot7 = slot7.min
		slot8 = slot5

		function slot9(slot0)
			slot1 = ManhattonDist
			slot2 = slot0
			slot3 = slot0
			slot3 = slot3.line

			return slot1(slot2, slot3)
		end

		slot7 = slot7(slot8, slot9)
		slot8 = ManhattonDist
		slot9 = slot7
		slot10 = slot3.line
		slot8 = slot8(slot9, slot10)
		slot9 = _
		slot9 = slot9.each
		slot10 = slot5

		function slot11(slot0)
			slot1 = ChapterCell
			slot1 = slot1.Line2QuadName
			slot2 = slot0.row
			slot3 = slot0.column
			slot1 = slot1(slot2, slot3)
			slot2 = slot0
			slot2 = slot2.quadRoot
			slot3 = slot2
			slot2 = slot2.Find
			slot4 = slot1
			slot2 = slot2(slot3, slot4)
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.cancelQuadTween
			slot5 = slot1
			slot6 = slot2

			slot3(slot4, slot5, slot6)

			slot3 = slot0
			slot3 = slot3.quadState
			slot4 = ChapterConst
			slot4 = slot4.QuadStateFrozen

			if slot3 ~= slot4 then
				slot3 = setImageSprite
				slot4 = slot2
				slot5 = GetSpriteFromAtlas
				slot6 = "chapter/pic/cellgrid"
				slot7 = slot1

				slot3(slot4, slot5(slot6, slot7))
			end

			slot3 = slot2
			slot4 = slot3
			slot3 = slot3.getRound
			slot3 = slot3(slot4)
			slot4 = ChapterConst
			slot4 = slot4.RoundPlayer

			if slot3 == slot4 then
				slot3 = slot0
				slot3 = slot3.quadState
				slot4 = ChapterConst
				slot4 = slot4.QuadStateNormal

				if slot3 == slot4 then
					slot3 = setImageAlpha
					slot4 = slot2
					slot5 = 1

					slot3(slot4, slot5)
				else
					slot3 = slot0
					slot3 = slot3.quadState
					slot4 = ChapterConst
					slot4 = slot4.QuadStateStrategy

					if slot3 == slot4 then
						slot3 = setImageAlpha
						slot4 = slot2
						slot5 = 1

						slot3(slot4, slot5)
					else
						slot3 = slot0
						slot3 = slot3.quadState
						slot4 = ChapterConst
						slot4 = slot4.QuadStateFrozen

						if slot3 == slot4 then
							slot3 = setImageAlpha
							slot4 = slot2
							slot5 = ChapterConst
							slot5 = slot5.CellEaseOutAlpha

							slot3(slot4, slot5)
						end
					end
				end
			else
				slot3 = slot2
				slot4 = slot3
				slot3 = slot3.getRound
				slot3 = slot3(slot4)
				slot4 = ChapterConst
				slot4 = slot4.RoundEnemy

				if slot3 == slot4 then
					slot3 = setImageAlpha
					slot4 = slot2
					slot5 = ChapterConst
					slot5 = slot5.CellEaseOutAlpha

					slot3(slot4, slot5)
				end
			end

			slot3 = slot0
			slot3 = slot3.quadState
			slot4 = ChapterConst
			slot4 = slot4.QuadStateNormal

			if slot3 ~= slot4 then
				slot3 = slot0
				slot3 = slot3.quadState
				slot4 = ChapterConst
				slot4 = slot4.QuadStateStrategy

				if slot3 == slot4 then
					slot3 = LeanTween
					slot3 = slot3.scale
					slot4 = slot2
					slot5 = Vector3
					slot5 = slot5.one
					slot6 = 0.2
					slot3 = slot3(slot4, slot5, slot6)
					slot4 = slot3
					slot3 = slot3.setFrom
					slot5 = Vector3
					slot5 = slot5.zero
					slot3 = slot3(slot4, slot5)
					slot4 = slot3
					slot3 = slot3.setEase
					slot5 = LeanTweenType
					slot5 = slot5.easeInOutSine
					slot3 = slot3(slot4, slot5)
					slot4 = slot3
					slot3 = slot3.setDelay
					slot5 = ManhattonDist
					slot6 = slot0
					slot7 = slot3
					slot7 = slot7.line
					slot5 = slot5(slot6, slot7)
					slot6 = slot4
					slot5 = slot5 - slot6
					slot5 = slot5 * 0.1
					slot3 = slot3(slot4, slot5)
					slot4 = slot0
					slot4 = slot4.presentTws
					slot5 = {}
					slot6 = slot3.uniqueId
					slot5.uniqueId = slot6
					slot4[slot1] = slot5
					slot4 = Vector3
					slot4 = slot4.zero
					slot2.localScale = slot4
				end
			end
		end

		slot9(slot10, slot11)
	end

	slot8 = slot2
	slot7 = slot2.isPlayingWithBombEnemy
	slot7 = slot7(slot8)

	if slot7 then
		slot8 = slot0
		slot7 = slot0.hideQuadMark
		slot9 = ChapterConst
		slot9 = slot9.MarkBomb

		slot7(slot8, slot9)

		slot7 = slot0.quadState
		slot8 = ChapterConst
		slot8 = slot8.QuadStateNormal

		if slot7 == slot8 then
			slot7 = slot2.fleet
			slot8 = _
			slot8 = slot8.map
			slot9 = {}
			slot10 = {
				-1,
				0
			}
			slot9[1] = slot10
			slot10 = {
				1,
				0
			}
			slot9[2] = slot10
			slot10 = {
				0,
				-1
			}
			slot9[3] = slot10
			slot10 = {
				0,
				1
			}
			slot9[4] = slot10

			function slot10(slot0)
				slot1 = {}
				slot2 = slot0[1]
				slot3 = slot0
				slot3 = slot3.line
				slot3 = slot3.row
				slot2 = slot2 + slot3
				slot1.row = slot2
				slot2 = slot0[2]
				slot3 = slot0
				slot3 = slot3.line
				slot3 = slot3.column
				slot2 = slot2 + slot3
				slot1.column = slot2

				return slot1
			end

			slot8 = slot8(slot9, slot10)
			slot10 = slot0
			slot9 = slot0.showQuadMark
			slot11 = slot8
			slot12 = ChapterConst
			slot12 = slot12.MarkBomb
			slot13 = "cell_bomb"
			slot14 = Vector2
			slot15 = 100
			slot16 = 100
			slot14 = slot14(slot15, slot16)
			slot15 = true

			slot9(slot10, slot11, slot12, slot13, slot14, slot15)
		end
	end
end

slot0.updateQuadCells = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.presentTws
	slot3 = slot3[slot1]

	if slot3 then
		slot3 = LeanTween
		slot3 = slot3.cancel
		slot4 = slot0.presentTws
		slot4 = slot4[slot1]
		slot4 = slot4.uniqueId

		slot3(slot4)

		slot3 = slot0.presentTws
		slot4 = nil
		slot3[slot1] = slot4
	end

	slot3 = slot0.quadTws
	slot3 = slot3[slot1]

	if not slot3 then
		slot3 = setImageAlpha
		slot4 = slot2
		slot5 = 1

		slot3(slot4, slot5)

		slot3 = _
		slot3 = slot3.values
		slot4 = slot0.quadTws
		slot3 = slot3(slot4)
		slot3 = slot3[1]
		slot4 = slot3.tw.passed or 0
		slot6 = LeanTween.alpha(slot2, ChapterConst.CellEaseOutAlpha, 1):setLoopPingPong()
		slot6.passed = slot4
		slot6.direction = slot3.tw.direction or 1
		slot0.quadTws[slot1] = {
			tw = slot6,
			uniqueId = slot6.uniqueId
		}
	end
end

slot0.startQuadTween = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.quadTws
	slot3 = slot3[slot1]

	if slot3 then
		slot3 = LeanTween
		slot3 = slot3.cancel
		slot4 = slot0.quadTws
		slot4 = slot4[slot1]
		slot4 = slot4.uniqueId

		slot3(slot4)

		slot3 = slot0.quadTws
		slot4 = nil
		slot3[slot1] = slot4
	end

	slot3 = setImageAlpha
	slot4 = slot2
	slot5 = ChapterConst
	slot5 = slot5.CellEaseOutAlpha

	slot3(slot4, slot5)
end

slot0.cancelQuadTween = slot2

function slot2(slot0)
	slot1 = pairs
	slot2 = slot0.quadTws
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = LeanTween
		slot6 = slot6.cancel
		slot7 = slot5.uniqueId

		slot6(slot7)
	end

	slot1 = {}
	slot0.quadTws = slot1
end

slot0.killQuadTws = slot2

function slot2(slot0)
	slot1 = pairs
	slot2 = slot0.presentTws
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = LeanTween
		slot6 = slot6.cancel
		slot7 = slot5.uniqueId

		slot6(slot7)
	end

	slot1 = {}
	slot0.presentTws = slot1
end

slot0.killPresentTws = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.markTws
	slot3 = slot3[slot1]

	if not slot3 then
		slot3 = setImageAlpha
		slot4 = slot2
		slot5 = 1

		slot3(slot4, slot5)

		slot3 = _
		slot3 = slot3.values
		slot4 = slot0.markTws
		slot3 = slot3(slot4)
		slot3 = slot3[1]
		slot4 = slot3.tw.passed or 0
		slot6 = LeanTween.alpha(slot2, 0.4, 1):setLoopPingPong():setEase(LeanTweenType.easeInOutSine):setDelay(1)
		slot6.passed = slot4
		slot6.direction = slot3.tw.direction or 1
		slot0.markTws[slot1] = {
			tw = slot6,
			uniqueId = slot6.uniqueId
		}
	end
end

slot0.startMarkTween = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.markTws
	slot3 = slot3[slot1]

	if slot3 then
		slot3 = LeanTween
		slot3 = slot3.cancel
		slot4 = slot0.markTws
		slot4 = slot4[slot1]
		slot4 = slot4.uniqueId

		slot3(slot4)

		slot3 = slot0.markTws
		slot4 = nil
		slot3[slot1] = slot4
	end

	slot3 = setImageAlpha
	slot4 = slot2
	slot5 = ChapterConst
	slot5 = slot5.CellEaseOutAlpha

	slot3(slot4, slot5)
end

slot0.cancelMarkTween = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot4 = pairs
	slot5 = slot0.cellFleets
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot3.fleets
		slot9 = slot9[slot7]

		if slot8 then
			slot10 = slot9.line
			slot10 = slot10.row

			if slot10 == slot1 then
				slot10 = slot9.line
				slot10 = slot10.column

				if slot10 == slot2 then
					slot11 = slot9
					slot10 = slot9.getFleetType
					slot10 = slot10(slot11)
					slot11 = FleetType
					slot11 = slot11.Submarine

					if slot10 == slot11 then
						slot11 = slot0
						slot10 = slot0.updateFleet
						slot12 = slot7

						slot10(slot11, slot12)
					end
				end
			end
		end
	end
end

slot0.updateSubFleetByPos = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot7 = slot5
	slot6 = slot5.getDataType
	slot6 = slot6(slot7)
	slot7 = slot5.fleet
	slot8 = slot0.cellFleets
	slot9 = slot5.findex
	slot8 = slot8[slot9]
	slot9 = setActive
	slot10 = slot8.tfShip
	slot11 = true

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot8.tfShadow
	slot11 = true

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot0.arrowTarget
	slot11 = true

	slot9(slot10, slot11)

	slot10 = slot0
	slot9 = slot0.updateTargetArrow
	slot11 = #slot2
	slot11 = slot2[slot11]

	slot9(slot10, slot11)

	if slot3 then
		slot10 = slot0
		slot9 = slot0.updateAttachment
		slot11 = slot3.row
		slot12 = slot3.column

		slot9(slot10, slot11, slot12)
	end

	function slot9(slot0)
		slot1 = slot0
		slot2 = ChapterConst
		slot2 = slot2.TypeNone

		if slot1 == slot2 then
			slot1 = slot1
			slot2 = slot1
			slot2 = slot2.step
			slot2 = slot2 + 1
			slot1.step = slot2
		end

		slot1 = slot2
		slot1 = slot1.onShipStepChange

		if slot1 then
			slot1 = slot2
			slot1 = slot1.onShipStepChange
			slot2 = slot0

			slot1(slot2)
		end
	end

	function slot10(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot11()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.arrowTarget
		slot2 = false

		slot0(slot1, slot2)

		slot0 = slot1
		slot0 = slot0.fleet
		slot0 = slot0.line
		slot1 = slot1
		slot2 = slot1
		slot1 = slot1.getChapterCell
		slot3 = slot0.row
		slot4 = slot0.column
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot2
		slot3 = ChapterConst
		slot3 = slot3.TypeNone

		if slot2 == slot3 then
			slot2 = ChapterConst
			slot2 = slot2.NeedClearStep
			slot3 = slot1
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = slot3
				slot3 = 0
				slot2.step = slot3
			end
		end

		slot2 = slot3
		slot3 = slot4
		slot4 = slot3
		slot3 = slot3.getModel
		slot3 = slot3(slot4)
		slot3 = slot3.transform
		slot3 = slot3.localRotation
		slot2.rotation = slot3
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateAttachment
		slot4 = slot0.row
		slot5 = slot0.column

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateFleet
		slot4 = slot1
		slot4 = slot4.findex

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.updateOni

		slot2(slot3)

		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getChampionIndex
		slot4 = slot0.row
		slot5 = slot0.column
		slot2 = slot2(slot3, slot4, slot5)

		if slot2 then
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.updateChampion
			slot5 = slot2

			slot3(slot4, slot5)
		end

		slot3 = slot0
		slot3 = slot3.onShipArrived

		if slot3 then
			slot3 = slot0
			slot3 = slot3.onShipArrived

			slot3()
		end

		slot3 = slot5

		if slot3 then
			slot3 = slot5

			slot3()
		end
	end

	slot13 = slot0
	slot12 = slot0.updateQuadCells
	slot14 = ChapterConst
	slot14 = slot14.QuadStateFrozen

	slot12(slot13, slot14)

	slot13 = slot0
	slot12 = slot0.moveCellView
	slot14 = slot8
	slot15 = slot1
	slot16 = slot2
	slot17 = slot9
	slot18 = slot10
	slot19 = slot11

	slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19)
end

slot0.moveFleet = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.fleets
	slot6 = slot6[slot1]
	slot7 = slot0.cellFleets
	slot7 = slot7[slot1]

	function slot8(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.existEnemy
		slot3 = ChapterConst
		slot3 = slot3.SubjectPlayer
		slot4 = slot0.row
		slot5 = slot0.column
		slot1 = slot1(slot2, slot3, slot4, slot5)

		if not slot1 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.existAlly
			slot3 = slot1
			slot1 = slot1(slot2, slot3)
		end

		slot2 = setActive
		slot3 = slot2
		slot3 = slot3.tfShadow
		slot4 = not slot1

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = slot2
		slot3 = slot3.tfShip
		slot4 = not slot1

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = slot2
		slot3 = slot3.tfAmmo
		slot4 = not slot1

		slot2(slot3, slot4)
	end

	function slot9(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot10()
		slot0 = slot0
		slot1 = slot1
		slot2 = slot1
		slot1 = slot1.getModel
		slot1 = slot1(slot2)
		slot1 = slot1.transform
		slot1 = slot1.localRotation
		slot0.rotation = slot1
		slot0 = slot2
		slot1 = slot0
		slot0 = slot0.updateFleet
		slot2 = slot3

		slot0(slot1, slot2)

		slot0 = slot4

		if slot0 then
			slot0 = slot4

			slot0()
		end
	end

	slot12 = slot0
	slot11 = slot0.updateQuadCells
	slot13 = ChapterConst
	slot13 = slot13.QuadStateFrozen

	slot11(slot12, slot13)

	slot12 = slot0
	slot11 = slot0.moveCellView
	slot13 = slot7
	slot14 = slot2
	slot15 = slot3
	slot16 = slot8
	slot17 = slot9
	slot18 = slot10

	slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
end

slot0.moveSub = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.champions
	slot6 = slot6[slot1]
	slot7 = slot0.cellChampions
	slot7 = slot7[slot1]

	function slot8(slot0)
		return
	end

	function slot9(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot10()
		slot0 = slot0
		slot1 = slot1
		slot2 = slot1
		slot1 = slot1.getModel
		slot1 = slot1(slot2)
		slot1 = slot1.transform
		slot1 = slot1.localRotation
		slot0.rotation = slot1
		slot0 = slot2
		slot1 = slot0
		slot0 = slot0.updateChampion
		slot2 = slot3

		slot0(slot1, slot2)

		slot0 = slot4

		if slot0 then
			slot0 = slot4

			slot0()
		end
	end

	slot11 = slot0.championTws
	slot11 = slot11[slot1]

	if slot11 then
		slot11 = LeanTween
		slot11 = slot11.cancel
		slot12 = slot0.championTws
		slot12 = slot12[slot1]
		slot12 = slot12.uniqueId

		slot11(slot12)

		slot11 = slot0.championTws
		slot12 = nil
		slot11[slot1] = slot12
	end

	slot12 = slot5
	slot11 = slot5.getChampionVisibility
	slot13 = slot6
	slot11 = slot11(slot12, slot13)

	if slot11 then
		slot12 = slot0
		slot11 = slot0.moveCellView
		slot13 = slot7
		slot14 = slot2
		slot15 = slot3
		slot16 = slot8
		slot17 = slot9
		slot18 = slot10

		slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	else
		slot11 = slot10

		slot11()
	end
end

slot0.moveChampion = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.contextData
	slot5 = slot5.chapterVO
	slot6 = slot5.fleets
	slot6 = slot6[slot1]
	slot7 = slot0.cellFleets
	slot7 = slot7[slot1]

	function slot8(slot0)
		return
	end

	function slot9(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.sortItems

		slot1(slot2)
	end

	function slot10()
		slot0 = slot0
		slot1 = slot1
		slot2 = slot1
		slot1 = slot1.getModel
		slot1 = slot1(slot2)
		slot1 = slot1.transform
		slot1 = slot1.localRotation
		slot0.rotation = slot1
		slot0 = slot2
		slot1 = slot0
		slot0 = slot0.updateFleet
		slot2 = slot3

		slot0(slot1, slot2)

		slot0 = slot4

		if slot0 then
			slot0 = slot4

			slot0()
		end
	end

	slot12 = slot0
	slot11 = slot0.updateQuadCells
	slot13 = ChapterConst
	slot13 = slot13.QuadStateFrozen

	slot11(slot12, slot13)

	slot12 = slot0
	slot11 = slot0.moveCellView
	slot13 = slot7
	slot14 = slot2
	slot15 = slot3
	slot16 = slot8
	slot17 = slot9
	slot18 = slot10

	slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
end

slot0.moveTransport = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = nil
	slot8 = coroutine
	slot8 = slot8.wrap

	function slot9()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.frozen

		slot0(slot1)

		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.chapterVO
		slot1 = 0.3
		slot2 = ChapterConst
		slot2 = slot2.ShipStepDuration
		slot3 = ChapterConst
		slot3 = slot3.ShipMoveTailLength
		slot2 = slot2 * slot3
		slot3 = 0.1
		slot4 = 0
		slot5 = table
		slot5 = slot5.insert
		slot6 = slot1
		slot7 = 1
		slot8 = slot2
		slot9 = slot8
		slot8 = slot8.getLine

		slot5(slot6, slot7, slot8(slot9))

		slot5 = _
		slot5 = slot5.each
		slot6 = slot1

		function slot7(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getChapterCell
			slot3 = slot0.row
			slot4 = slot0.column
			slot1 = slot1(slot2, slot3, slot4)
			slot2 = ChapterConst
			slot2 = slot2.NeedEasePathCell
			slot3 = slot1
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = ChapterCell
				slot2 = slot2.Line2QuadName
				slot3 = slot1.row
				slot4 = slot1.column
				slot2 = slot2(slot3, slot4)
				slot3 = slot1
				slot3 = slot3.quadRoot
				slot4 = slot3
				slot3 = slot3.Find
				slot5 = slot2
				slot3 = slot3(slot4, slot5)
				slot4 = slot1
				slot5 = slot4
				slot4 = slot4.cancelQuadTween
				slot6 = slot2
				slot7 = slot3

				slot4(slot5, slot6, slot7)

				slot4 = LeanTween
				slot4 = slot4.alpha
				slot5 = slot3
				slot6 = 1
				slot7 = slot2
				slot4 = slot4(slot5, slot6, slot7)
				slot5 = slot4
				slot4 = slot4.setDelay
				slot6 = slot3

				slot4(slot5, slot6)

				slot4 = slot3
				slot5 = slot4
				slot4 = slot4 + slot5
				slot3 = slot4
			end
		end

		slot5(slot6, slot7)

		slot5 = _
		slot5 = slot5.each
		slot6 = slot3

		function slot7(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.moveStep
			slot3 = slot1
			slot4 = slot0
			slot5 = slot2
			slot6 = slot2
			slot6 = #slot6
			slot5 = slot5[slot6]

			function slot6()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.getLine
				slot0 = slot0(slot1)
				slot1 = slot1
				slot2 = slot1
				slot1 = slot1.getChapterCell
				slot3 = slot0.row
				slot4 = slot0.column
				slot1 = slot1(slot2, slot3, slot4)
				slot2 = ChapterConst
				slot2 = slot2.NeedEasePathCell
				slot3 = slot1
				slot2 = slot2(slot3)

				if slot2 then
					slot2 = ChapterCell
					slot2 = slot2.Line2QuadName
					slot3 = slot1.row
					slot4 = slot1.column
					slot2 = slot2(slot3, slot4)
					slot3 = slot2
					slot3 = slot3.quadRoot
					slot4 = slot3
					slot3 = slot3.Find
					slot5 = slot2
					slot3 = slot3(slot4, slot5)
					slot4 = LeanTween
					slot4 = slot4.scale
					slot5 = slot3
					slot6 = Vector3
					slot6 = slot6.zero
					slot7 = slot3

					slot4(slot5, slot6, slot7)
				end

				slot2 = slot4
				slot3 = slot5

				slot2(slot3)
			end

			function slot7()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.setLine
				slot2 = slot1

				slot0(slot1, slot2)

				slot0 = slot2
				slot1 = slot1

				slot0(slot1)

				slot0 = slot3

				slot0()
			end

			slot1(slot2, slot3, slot4, slot5, slot6, slot7)

			slot1 = coroutine
			slot1 = slot1.yield

			slot1()
		end

		slot5(slot6, slot7)

		slot5 = _
		slot5 = slot5.each
		slot6 = slot1

		function slot7(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.getChapterCell
			slot3 = slot0.row
			slot4 = slot0.column
			slot1 = slot1(slot2, slot3, slot4)
			slot2 = ChapterConst
			slot2 = slot2.NeedEasePathCell
			slot3 = slot1
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = ChapterCell
				slot2 = slot2.Line2QuadName
				slot3 = slot1.row
				slot4 = slot1.column
				slot2 = slot2(slot3, slot4)
				slot3 = slot1
				slot3 = slot3.quadRoot
				slot4 = slot3
				slot3 = slot3.Find
				slot5 = slot2
				slot3 = slot3(slot4, slot5)
				slot4 = LeanTween
				slot4 = slot4.cancel
				slot5 = slot3.gameObject

				slot4(slot5)

				slot4 = setImageAlpha
				slot5 = slot3
				slot6 = ChapterConst
				slot6 = slot6.CellEaseOutAlpha

				slot4(slot5, slot6)

				slot4 = Vector3
				slot4 = slot4.one
				slot3.localScale = slot4
			end
		end

		slot5(slot6, slot7)

		slot5 = slot2
		slot6 = slot5
		slot5 = slot5.setAction
		slot7 = ChapterConst
		slot7 = slot7.ShipIdleAction

		slot5(slot6, slot7)

		slot5 = slot7

		slot5()

		slot5 = slot0
		slot6 = slot5
		slot5 = slot5.unfrozen

		slot5(slot6)
	end

	slot8 = slot8(slot9)
	slot7 = slot8
	slot8 = slot7

	slot8()
end

slot0.moveCellView = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0.contextData
	slot6 = slot6.chapterVO
	slot8 = slot1
	slot7 = slot1.getModel
	slot7 = slot7(slot8)
	slot9 = slot1
	slot8 = slot1.getAction
	slot8 = slot8(slot9)
	slot10 = slot1
	slot9 = slot1.getLine
	slot9 = slot9(slot10)
	slot10 = IsNil
	slot11 = slot7
	slot10 = slot10(slot11)

	if not slot10 then
		slot10 = ChapterConst
		slot10 = slot10.ShipMoveAction

		if slot8 ~= slot10 then
			slot11 = slot1
			slot10 = slot1.setAction
			slot12 = ChapterConst
			slot12 = slot12.ShipMoveAction

			slot10(slot11, slot12)
		end

		slot10 = slot2.column
		slot11 = slot9.column

		if slot10 == slot11 then
			slot10 = slot3.column
			slot11 = slot9.column

			if slot10 ~= slot11 then
				slot10 = slot7.transform
				slot11 = Quaternion
				slot11 = slot11.identity
				slot10.localRotation = slot11
				slot10 = slot2.column
				slot11 = slot9.column

				if slot10 >= slot11 then
					slot10 = slot2.column
					slot11 = slot9.column

					if slot10 == slot11 then
						slot10 = slot3.column
						slot11 = slot9.column

						if slot10 < slot11 then
							slot10 = slot7.transform
							slot11 = Quaternion
							slot11 = slot11.Euler
							slot12 = 0
							slot13 = 180
							slot14 = 0
							slot11 = slot11(slot12, slot13, slot14)
							slot10.localRotation = slot11
						end
					end
				end
			end
		end
	end

	slot10 = slot1.tf
	slot10 = slot10.localPosition
	slot11 = slot6.theme
	slot12 = slot11
	slot11 = slot11.GetLinePosition
	slot13 = slot2.row
	slot14 = slot2.column
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = 0
	slot13 = LeanTween
	slot13 = slot13.value
	slot14 = slot1.go
	slot15 = 0
	slot16 = 1
	slot17 = ChapterConst
	slot17 = slot17.ShipStepDuration
	slot13 = slot13(slot14, slot15, slot16, slot17)
	slot14 = slot13
	slot13 = slot13.setOnComplete
	slot15 = System
	slot15 = slot15.Action
	slot16 = slot5
	slot13 = slot13(slot14, slot15(slot16))
	slot14 = slot13
	slot13 = slot13.setOnUpdate
	slot15 = System
	slot15 = slot15.Action_float

	function slot16(slot0)
		slot1 = slot0
		slot1 = slot1.tf
		slot2 = Vector3
		slot2 = slot2.Lerp
		slot3 = slot1
		slot4 = slot2
		slot5 = slot0
		slot2 = slot2(slot3, slot4, slot5)
		slot1.localPosition = slot2
		slot1 = slot3
		slot2 = 0.5

		if slot1 <= slot2 then
			slot1 = 0.5

			if slot0 > slot1 then
				slot1 = slot4

				slot1()
			end
		end

		slot3 = slot0
	end

	slot13(slot14, slot15(slot16))
end

slot0.moveStep = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot2 = slot0.cellFleets
	slot3 = slot1.findex
	slot2 = slot2[slot3]

	if slot2 then
		slot4 = slot0
		slot3 = slot0.cameraFocus
		slot5 = slot2.tf
		slot5 = slot5.position

		slot3(slot4, slot5)
	end
end

slot0.adjustCameraFocus = slot2

function slot2(slot0, slot1, slot2)
	slot3 = ChapterCell
	slot3 = slot3.Line2Name
	slot4 = slot1.row
	slot5 = slot1.column
	slot3 = slot3(slot4, slot5)
	slot4 = slot0.cellRoot
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot6 = slot0
	slot5 = slot0.cameraFocus
	slot7 = slot4.position
	slot8 = slot2

	slot5(slot6, slot7, slot8)
end

slot0.focusOnCell = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot4 = slot3.theme
	slot5 = slot0._tf
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = ChapterConst
	slot7 = slot7.PlaneName
	slot5 = slot5(slot6, slot7)
	slot6 = slot0._tf
	slot6 = slot6.parent
	slot7 = slot6
	slot6 = slot6.InverseTransformVector
	slot8 = slot5.position
	slot8 = slot1 - slot8
	slot6 = slot6(slot7, slot8)
	slot7 = slot6.x
	slot8 = slot5.localPosition
	slot8 = slot8.x
	slot7 = slot7 + slot8
	slot6.x = slot7
	slot7 = slot6.y
	slot8 = slot5.localPosition
	slot8 = slot8.y
	slot7 = slot7 + slot8
	slot8 = slot5.localPosition
	slot8 = slot8.z
	slot9 = math
	slot9 = slot9.tan
	slot10 = math
	slot10 = slot10.pi
	slot10 = slot10 / 180
	slot11 = slot4.angle
	slot10 = slot10 * slot11
	slot9 = slot9(slot10)
	slot8 = slot8 * slot9
	slot7 = slot7 - slot8
	slot6.y = slot7
	slot7 = math
	slot7 = slot7.clamp
	slot8 = slot6.x
	slot8 = -slot8
	slot9 = slot0.rightExtend
	slot9 = -slot9
	slot10 = slot0.leftExtend
	slot7 = slot7(slot8, slot9, slot10)
	slot6.x = slot7
	slot7 = math
	slot7 = slot7.clamp
	slot8 = slot6.y
	slot8 = -slot8
	slot9 = slot0.topExtend
	slot9 = -slot9
	slot10 = slot0.bottomExtend
	slot7 = slot7(slot8, slot9, slot10)
	slot6.y = slot7
	slot7 = 0
	slot6.z = slot7
	slot8 = slot0
	slot7 = slot0.frozen

	slot7(slot8)

	slot7 = slot0.dragTrigger
	slot8 = false
	slot7.enabled = slot8
	slot7 = LeanTween
	slot7 = slot7.moveLocal
	slot8 = slot0._tf
	slot8 = slot8.gameObject
	slot9 = slot6
	slot10 = 0.4
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = slot7
	slot7 = slot7.setEase
	slot9 = LeanTweenType
	slot9 = slot9.easeInOutSine
	slot7 = slot7(slot8, slot9)
	slot8 = slot7
	slot7 = slot7.setOnComplete
	slot9 = System
	slot9 = slot9.Action

	function slot10()
		slot0 = slot0
		slot0 = slot0.dragTrigger
		slot1 = true
		slot0.enabled = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.unfrozen

		slot0(slot1)

		slot0 = slot1

		if slot0 then
			slot0 = slot1

			slot0()
		end
	end

	slot7 = slot7(slot8, slot9(slot10))
end

slot0.cameraFocus = slot2

function slot2(slot0)
	return slot0.contextData.huntingRangeVisibility % 2 == 0
end

slot0.isHuntingRangeVisible = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.hideQuadMark
	slot3 = ChapterConst
	slot3 = slot3.MarkHuntingRange

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.isHuntingRangeVisible
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = slot0.contextData
		slot1 = slot1.chapterVO
		slot2 = _
		slot2 = slot2.each
		slot3 = slot1.fleets

		function slot4(slot0)
			slot2 = slot0
			slot1 = slot0.getFleetType
			slot1 = slot1(slot2)
			slot2 = FleetType
			slot2 = slot2.Submarine

			if slot1 == slot2 then
				slot2 = slot0
				slot1 = slot0.isValid
				slot1 = slot1(slot2)

				if slot1 then
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.showQuadMark
					slot4 = slot0
					slot3 = slot0.getHuntingRange
					slot3 = slot3(slot4)
					slot4 = ChapterConst
					slot4 = slot4.MarkHuntingRange
					slot5 = "cell_hunting_range"
					slot6 = Vector2
					slot7 = 117
					slot8 = 117

					slot1(slot2, slot3, slot4, slot5, slot6(slot7, slot8))
				end
			end
		end

		slot2(slot3, slot4)
	end

	slot1 = slot0.contextData
	slot2 = slot0.contextData
	slot2 = slot2.huntingRangeVisibility
	slot2 = slot2 + 1
	slot1.huntingRangeVisibility = slot2
	slot2 = slot0
	slot1 = slot0.updateAttachments

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateChampions

	slot1(slot2)
end

slot0.toggleHuntingRange = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getOniChapterInfo
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.hideQuadMark
	slot5 = ChapterConst
	slot5 = slot5.MarkEscapeGrid

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.showQuadMark
	slot5 = _
	slot5 = slot5.map
	slot6 = slot2.escape_grids

	function slot7(slot0)
		slot1 = {}
		slot2 = slot0[1]
		slot1.row = slot2
		slot2 = slot0[2]
		slot1.column = slot2

		return slot1
	end

	slot5 = slot5(slot6, slot7)
	slot6 = ChapterConst
	slot6 = slot6.MarkEscapeGrid
	slot7 = "cell_escape_grid"
	slot8 = Vector2
	slot9 = 105
	slot10 = 105

	slot3(slot4, slot5, slot6, slot7, slot8(slot9, slot10))
end

slot0.displayEscapeGrid = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0.contextData
	slot6 = slot6.chapterVO
	slot7 = ipairs
	slot8 = slot1
	slot7, slot8, slot9 = slot7(slot8)

	for slot10, slot11 in slot7, slot8, slot9 do
		slot13 = slot6
		slot12 = slot6.getChapterCell
		slot14 = slot11.row
		slot15 = slot11.column
		slot12 = slot12(slot13, slot14, slot15)

		if slot12 then
			slot13 = slot12.walkable

			if slot13 then
				slot13 = ChapterCell
				slot13 = slot13.Line2MarkName
				slot14 = slot11.row
				slot15 = slot11.column
				slot16 = slot2
				slot13 = slot13(slot14, slot15, slot16)
				slot14 = slot0.markRoot
				slot15 = slot14
				slot14 = slot14.Find
				slot16 = slot13
				slot14 = slot14(slot15, slot16)

				if not slot14 then
					slot15 = PoolMgr
					slot15 = slot15.GetInstance
					slot15 = slot15()
					slot16 = slot15
					slot15 = slot15.GetPrefab
					slot17 = "chapter/cell_quad"
					slot18 = "cell_quad"
					slot19 = false

					function slot20(slot0)
						slot1 = slot0.transform
						slot0 = slot1
					end

					slot15(slot16, slot17, slot18, slot19, slot20)
				end

				slot14.name = slot13
				slot16 = slot14
				slot15 = slot14.SetParent
				slot17 = slot0.markRoot
				slot18 = false

				slot15(slot16, slot17, slot18)

				slot15 = slot6.theme
				slot15 = slot15.cellSize
				slot14.sizeDelta = slot15
				slot15 = slot6.theme
				slot16 = slot15
				slot15 = slot15.GetLinePosition
				slot17 = slot11.row
				slot18 = slot11.column
				slot15 = slot15(slot16, slot17, slot18)
				slot14.anchoredPosition = slot15
				slot15 = Vector3
				slot15 = slot15.one
				slot14.localScale = slot15
				slot16 = slot14
				slot15 = slot14.SetAsLastSibling

				slot15(slot16)

				slot15 = setImageSprite
				slot16 = slot14
				slot17 = GetSpriteFromAtlas
				slot18 = "chapter/pic/cellgrid"
				slot19 = slot3

				slot15(slot16, slot17(slot18, slot19))

				slot15 = setImageAlpha
				slot16 = slot14
				slot17 = 1

				slot15(slot16, slot17)

				slot14.sizeDelta = slot4

				if not slot5 then
					slot16 = slot0
					slot15 = slot0.startMarkTween
					slot17 = slot13
					slot18 = slot14

					slot15(slot16, slot17, slot18)
				end
			end
		end
	end
end

slot0.showQuadMark = slot2

function slot2(slot0, slot1)
	slot2 = slot0.markRoot
	slot2 = slot2.childCount
	slot2 = slot2 - 1
	slot3 = 0
	slot4 = -1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot0.markRoot
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5
		slot6 = slot6(slot7, slot8)
		slot7 = slot6.name

		if slot1 then
			slot8 = tonumber
			slot9 = string
			slot9 = slot9.sub
			slot10 = slot7
			slot11 = string
			slot11 = slot11.find
			slot12 = slot7
			slot13 = "#"
			slot11 = slot11(slot12, slot13)
			slot11 = slot11 + 1
			slot8 = slot8(slot9(slot10, slot11))

			if slot8 == slot1 then
				slot9 = slot0
				slot8 = slot0.cancelMarkTween
				slot10 = slot7
				slot11 = slot6

				slot8(slot9, slot10, slot11)

				slot8 = PoolMgr
				slot8 = slot8.GetInstance
				slot8 = slot8()
				slot9 = slot8
				slot8 = slot8.ReturnPrefab
				slot10 = "chapter/cell_quad"
				slot11 = "cell_quad"
				slot12 = slot6.gameObject

				slot8(slot9, slot10, slot11, slot12)
			end
		end
	end
end

slot0.hideQuadMark = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot4 = slot0.contextData
	slot4 = slot4.chapterVO
	slot6 = slot4
	slot5 = slot4.existEnemy
	slot7 = ChapterConst
	slot7 = slot7.SubjectPlayer
	slot8 = slot1
	slot9 = slot2
	slot5 = slot5(slot6, slot7, slot8, slot9)

	if slot5 then
		slot5 = nil
		slot7 = slot4
		slot6 = slot4.getChapterCell
		slot8 = slot1
		slot9 = slot2
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = ChapterCell
		slot7 = slot7.Line2Name
		slot8 = slot1
		slot9 = slot2
		slot7 = slot7(slot8, slot9)
		slot8 = slot0.cellRoot
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot10 = slot8
		slot9 = slot8.Find
		slot11 = ChapterConst
		slot11 = slot11.ChildAttachment
		slot9 = slot9(slot10, slot11)
		slot10 = slot6.attachment
		slot11 = ChapterConst
		slot11 = slot11.AttachEnemy

		if slot10 ~= slot11 then
			slot10 = slot6.attachment
			slot11 = ChapterConst
			slot11 = slot11.AttachElite

			if slot10 ~= slot11 then
				slot10 = slot6.attachment
				slot11 = ChapterConst
				slot11 = slot11.AttachAmbush

				if slot10 ~= slot11 then
					slot10 = slot6.attachment
					slot11 = ChapterConst
					slot11 = slot11.AttachBoss

					if slot10 == slot11 then
						slot10 = slot9.childCount
						slot11 = 0

						if slot10 > slot11 then
							slot11 = slot9
							slot10 = slot9.GetChild
							slot12 = 0
							slot10 = slot10(slot11, slot12)
							slot11 = slot10
							slot10 = slot10.Find
							slot12 = "icon"
							slot10 = slot10(slot11, slot12)
							slot5 = slot10
						end
					else
						slot10 = slot6.attachment
						slot11 = ChapterConst
						slot11 = slot11.AttachRival

						if slot10 == slot11 then
							slot10 = slot9.childCount
							slot11 = 0

							if slot10 > slot11 then
								slot11 = slot9
								slot10 = slot9.GetChild
								slot12 = 0
								slot10 = slot10(slot11, slot12)
								slot11 = slot10
								slot10 = slot10.Find
								slot12 = "ship"
								slot10 = slot10(slot11, slot12)
								slot11 = slot10.childCount
								slot12 = 0

								if slot11 > slot12 then
									slot12 = slot10
									slot11 = slot10.GetChild
									slot13 = 0
									slot11 = slot11(slot12, slot13)
									slot5 = slot11
								end
							end
						end
					end
				end
			end
		end

		slot11 = slot4
		slot10 = slot4.existChampion
		slot12 = slot1
		slot13 = slot2
		slot10 = slot10(slot11, slot12, slot13)

		if slot10 then
		end

		if slot7 and slot5 then
			if slot3 then
				slot10 = slot0.shiningTws
				slot10 = slot10[slot7]

				if not slot10 then
					slot10 = _
					slot10 = slot10.values
					slot11 = slot0.quadTws
					slot10 = slot10(slot11)
					slot10 = slot10[1]

					if slot10 then
						slot11 = slot10.tw.passed or 0

						if slot10 then
							slot13 = slot5:GetComponent("Image")
							slot15 = Material.New(slot14)
							slot16 = LeanTween.value(slot5.gameObject, 0, 1, 1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong():setOnUpdate(System.Action_float(function (slot0)
								slot0:SetColor("_Color", Color.Lerp(Color.black, Color.gray, slot0))

								slot0.SetColor.material = slot0
							end))
							slot16.passed = slot11
							slot16.direction = slot10.tw.direction or 1
							slot0.shiningTws[slot7] = {
								tw = slot16,
								uniqueId = slot16.uniqueId
							}
						end
					end
				end
			else
				slot10 = slot0.shiningTws
				slot10 = slot10[slot7]

				if slot10 then
					slot10 = LeanTween
					slot10 = slot10.cancel
					slot11 = slot0.shiningTws
					slot11 = slot11[slot7]
					slot11 = slot11.uniqueId

					slot10(slot11)

					slot10 = slot0.shiningTws
					slot11 = nil
					slot10[slot7] = slot11
					slot11 = slot5
					slot10 = slot5.GetComponent
					slot12 = "Image"
					slot10 = slot10(slot11, slot12)
					slot11 = nil
					slot10.material = slot11
				end
			end
		end
	end
end

slot0.shiningTarget = slot2

function slot2(slot0, slot1, slot2)
	slot3 = slot0.contextData
	slot3 = slot3.chapterVO
	slot4, slot5 = nil
	slot7 = slot3
	slot6 = slot3.existChampion
	slot8 = slot1.row
	slot9 = slot1.column
	slot6 = slot6(slot7, slot8, slot9)

	if slot6 then
		slot7 = slot3
		slot6 = slot3.getChampionIndex
		slot8 = slot1.row
		slot9 = slot1.column
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = slot0.cellChampions
		slot7 = slot7[slot6]
		slot4 = slot7.tf
		slot8 = slot4
		slot7 = slot4.Find
		slot9 = "huoqiubaozha"
		slot7 = slot7(slot8, slot9)
		slot5 = slot7
	else
		slot6 = ChapterCell
		slot6 = slot6.Line2Name
		slot7 = slot1.row
		slot8 = slot1.column
		slot6 = slot6(slot7, slot8)
		slot7 = slot0.cellRoot
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot4 = slot7
		slot8 = slot3
		slot7 = slot3.getChapterCell
		slot9 = slot1.row
		slot10 = slot1.column
		slot7 = slot7(slot8, slot9, slot10)
		slot9 = slot4
		slot8 = slot4.Find
		slot10 = "attachment"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = "enemy_"
		slot11 = slot7.attachmentId
		slot10 = slot10 .. slot11
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = "huoqiubaozha"
		slot8 = slot8(slot9, slot10)
		slot5 = slot8
	end

	slot6 = slot4.localPosition
	slot6 = slot6.x
	slot7 = slot4.localPosition
	slot8 = slot6 + 10
	slot7.x = slot8
	slot4.localPosition = slot7
	slot8 = LeanTween
	slot8 = slot8.moveX
	slot9 = slot4
	slot10 = slot6 - 10
	slot11 = 0.05
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = slot8
	slot8 = slot8.setEase
	slot10 = LeanTweenType
	slot10 = slot10.easeInOutSine
	slot8 = slot8(slot9, slot10)
	slot9 = slot8
	slot8 = slot8.setLoopPingPong
	slot10 = 3
	slot8 = slot8(slot9, slot10)
	slot9 = slot8
	slot8 = slot8.setOnComplete
	slot10 = System
	slot10 = slot10.Action

	function slot11()
		slot0 = slot0
		slot0 = slot0.localPosition
		slot1 = slot1
		slot0.x = slot1
		slot1 = slot0
		slot1.localPosition = slot0
		slot1 = slot2

		if slot1 then
			slot1 = slot2

			slot1()
		end
	end

	slot8(slot9, slot10(slot11))

	slot8 = setActive
	slot9 = slot5
	slot10 = true

	slot8(slot9, slot10)

	return slot4
end

slot0.shakeCell = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.chapterVO
	slot3 = slot1
	slot2 = slot1.getCoastalGunArea
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.hideQuadMark
	slot5 = ChapterConst
	slot5 = slot5.MarkCoastalGun

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.showQuadMark
	slot5 = slot2
	slot6 = ChapterConst
	slot6 = slot6.MarkCoastalGun
	slot7 = "cell_coastal_gun"
	slot8 = Vector2
	slot9 = 110
	slot10 = 110
	slot8 = slot8(slot9, slot10)
	slot9 = false

	slot3(slot4, slot5, slot6, slot7, slot8, slot9)
end

slot0.updateCoastalGunAttachArea = slot2

function slot2(slot0, slot1)
	slot2 = slot0.parent
	slot3 = slot2
	slot2 = slot2.frozen
	slot4 = slot1

	slot2(slot3, slot4)
end

slot0.frozen = slot2

function slot2(slot0)
	slot1 = slot0.exited

	if slot1 then
		return
	end

	slot1 = slot0.parent
	slot2 = slot1
	slot1 = slot1.unfrozen

	slot1(slot2)
end

slot0.unfrozen = slot2

function slot2(slot0)
	return slot0.parent.frozenCount > 0
end

slot0.isfrozen = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.clearAll

	slot1(slot2)
end

slot0.clear = slot2

return slot0
