slot0 = class
slot1 = "PtTemplatePage"
slot2 = import
slot3 = "....base.BaseActivityPage"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD"
	slot1 = slot1(slot2, slot3)
	slot0.bg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/slider"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.slider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/slider/Text"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.sliderTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/value"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.value = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/progress"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.progress = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/display_btn"
	slot1 = slot1(slot2, slot3)
	slot0.displayBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/award"
	slot1 = slot1(slot2, slot3)
	slot0.awardTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/battle_btn"
	slot1 = slot1(slot2, slot3)
	slot0.battleBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/get_btn"
	slot1 = slot1(slot2, slot3)
	slot0.getBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "AD/got_btn"
	slot1 = slot1(slot2, slot3)
	slot0.gotBtn = slot1
end

slot0.OnInit = slot1

function slot1(slot0)
	slot1 = ActivityPtData
	slot1 = slot1.New
	slot2 = slot0.activity
	slot1 = slot1(slot2)
	slot0.ptData = slot1
	slot1 = LoadImageSpriteAsync
	slot3 = slot0
	slot2 = slot0.GetBgImg
	slot2 = slot2(slot3)
	slot3 = slot0.bg

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.displayBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.SHOW_AWARD_WINDOW
		slot3 = {}
		slot4 = slot0
		slot4 = slot4.ptData
		slot4 = slot4.dropList
		slot3.dropList = slot4
		slot4 = slot0
		slot4 = slot4.ptData
		slot4 = slot4.targets
		slot3.targets = slot4
		slot4 = slot0
		slot4 = slot4.ptData
		slot4 = slot4.level
		slot3.level = slot4
		slot4 = slot0
		slot4 = slot4.ptData
		slot4 = slot4.count
		slot3.count = slot4
		slot4 = slot0
		slot4 = slot4.ptData
		slot4 = slot4.resId
		slot3.resId = slot4

		slot0(slot1, slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.battleBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.BATTLE_OPERA

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.getBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.ptData
		slot1 = slot0
		slot0 = slot0.GetResProgress
		slot0, slot1 = slot0(slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.emit
		slot4 = ActivityMediator
		slot4 = slot4.EVENT_PT_OPERATION
		slot5 = {
			cmd = 1
		}
		slot6 = slot0
		slot6 = slot6.ptData
		slot7 = slot6
		slot6 = slot6.GetId
		slot6 = slot6(slot7)
		slot5.activity_id = slot6
		slot5.arg1 = slot1

		slot2(slot3, slot4, slot5)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.OnFirstFlush = slot1

function slot1(slot0)
	slot1 = slot0.ptData
	slot2 = slot1
	slot1 = slot1.Update
	slot3 = slot0.activity

	slot1(slot2, slot3)

	slot1 = slot0.ptData
	slot2 = slot1
	slot1 = slot1.GetLevelProgress
	slot1, slot2, slot3 = slot1(slot2)
	slot4 = slot0.ptData
	slot5 = slot4
	slot4 = slot4.GetResProgress
	slot4, slot5, slot6 = slot4(slot5)
	slot7 = slot0.value
	slot8 = slot4
	slot9 = "/"
	slot10 = slot5
	slot8 = slot8 .. slot9 .. slot10
	slot7.text = slot8
	slot7 = slot0.progress
	slot8 = slot1
	slot9 = "/"
	slot10 = slot2
	slot8 = slot8 .. slot9 .. slot10
	slot7.text = slot8
	slot7 = slot0.sliderTxt
	slot8 = math
	slot8 = slot8.floor
	slot9 = math
	slot9 = slot9.min
	slot10 = slot6
	slot11 = 1
	slot9 = slot9(slot10, slot11)
	slot9 = slot9 * 100
	slot8 = slot8(slot9)
	slot9 = "%"
	slot8 = slot8 .. slot9
	slot7.text = slot8
	slot7 = slot0.slider
	slot7.value = slot6
	slot7 = slot0.ptData
	slot8 = slot7
	slot7 = slot7.CanGetAward
	slot7 = slot7(slot8)
	slot8 = slot0.ptData
	slot9 = slot8
	slot8 = slot8.GetAllAward
	slot8 = slot8(slot9)
	slot9 = slot0.ptData
	slot10 = slot9
	slot9 = slot9.CanGetMorePt
	slot9 = slot9(slot10)
	slot10 = setActive
	slot11 = slot0.battleBtn
	slot12 = slot9 and not slot7 and not slot8

	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.getBtn
	slot12 = slot7

	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.gotBtn
	slot12 = slot8

	slot10(slot11, slot12)

	slot10 = slot0.ptData
	slot11 = slot10
	slot10 = slot10.GetAward
	slot10 = slot10(slot11)
	slot11 = updateDrop
	slot12 = slot0.awardTF
	slot13 = slot10

	slot11(slot12, slot13)

	slot11 = onButton
	slot12 = slot0
	slot13 = slot0.awardTF

	function slot14()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BaseUI
		slot2 = slot2.ON_DROP
		slot3 = slot1

		slot0(slot1, slot2, slot3)

		return
	end

	slot15 = SFX_PANEL

	slot11(slot12, slot13, slot14, slot15)

	return

	if not slot7 then
		slot12 = not slot8
	else
		slot12 = false

		if false then
			slot12 = true
		end
	end
end

slot0.OnUpdateFlush = slot1

function slot1(slot0)
	return
end

slot0.OnDestroy = slot1

function slot1(slot0, slot1)
	slot2 = pg
	slot2 = slot2.TimeMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetServerTime
	slot2 = slot2(slot3)
	slot3 = ActivityMainScene
	slot3 = slot3.Data2Time

	if not slot3 then
		slot3 = 0
	end

	slot2 = slot2 - slot3

	if slot1 <= slot2 then
		slot2 = ActivityMainScene
		slot3 = pg
		slot3 = slot3.TimeMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetServerTime
		slot3 = slot3(slot4)
		slot2.Data2Time = slot3
		slot3 = slot0
		slot2 = slot0.emit
		slot4 = ActivityMediator
		slot4 = slot4.EVENT_PT_OPERATION
		slot5 = {
			cmd = 2
		}
		slot6 = slot0.ptData
		slot7 = slot6
		slot6 = slot6.GetId
		slot6 = slot6(slot7)
		slot5.activity_id = slot6

		slot2(slot3, slot4, slot5)
	end

	return
end

slot0.GetWorldPtData = slot1

return slot0
