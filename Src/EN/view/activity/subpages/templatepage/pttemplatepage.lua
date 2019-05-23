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
	slot1 = LoadImageSpriteAsync
	slot3 = slot0
	slot2 = slot0.GetBgImg
	slot2 = slot2(slot3)
	slot3 = slot0.bg

	slot1(slot2, slot3)

	slot1 = ActivityPtData
	slot1 = slot1.New
	slot2 = slot0.activity
	slot1 = slot1(slot2)
	slot0.ptData = slot1
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
	slot8 = 1

	if slot6 >= slot8 then
		slot7.text = (setColorStr(slot1, COLOR_GREEN) or slot1) .. "/" .. slot2
		slot0.slider.value = slot6

		setActive(slot0.battleBtn, slot0.ptData:CanGetMorePt() and not slot0.ptData:CanGetAward() and not slot0.ptData:GetAllAward())
		setActive(slot0.getBtn, slot7)
		setActive(slot0.gotBtn, setColorStr(slot1, COLOR_GREEN) or slot1)
		updateDrop(slot0.awardTF, COLOR_GREEN)
		onButton(slot0, slot0.awardTF, function ()
			slot0:emit(BaseUI.ON_DROP, slot0)
		end, SFX_PANEL)

		return
	end
end

slot0.OnUpdateFlush = slot1

function slot1(slot0)
	return
end

slot0.OnDestroy = slot1

function slot1(slot0, slot1)
	slot2 = pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0)

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
end

slot0.GetWorldPtData = slot1

return slot0
