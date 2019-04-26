slot0 = class
slot1 = "NewPtActPanel"
slot2 = import
slot3 = ".ActivityPanel"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 300
slot0.TIME = slot1

function slot1(slot0)
	slot1 = {}

	function slot2(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getDataConfig
		slot3 = "drop_client"
		slot1 = slot1(slot2, slot3)
		slot0.dropList = slot1
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getDataConfig
		slot3 = "target"
		slot1 = slot1(slot2, slot3)
		slot0.targets = slot1
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getDataConfig
		slot3 = "pt"
		slot1 = slot1(slot2, slot3)
		slot0.resId = slot1
		slot2 = slot0
		slot1 = slot0.Update
		slot3 = slot0

		slot1(slot2, slot3)
	end

	function slot3(slot0, slot1)
		slot0.activity = slot1
		slot2 = slot1.data1
		slot0.count = slot2
		slot2 = 0
		slot0.level = slot2
		slot2 = ipairs
		slot3 = slot0.targets
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			slot7 = slot1.data2

			if slot6 == slot7 then
				slot0.level = slot5

				break
			end
		end

		slot2 = slot1.data3
		slot0.value2 = slot2
	end

	slot1.Update = slot3

	function slot3(slot0)
		slot1 = slot0.level
		slot2 = slot0.targets
		slot2 = #slot2
		slot3 = slot0.level
		slot4 = slot0.targets
		slot4 = #slot4
		slot3 = slot3 / slot4

		return slot1, slot2, slot3
	end

	slot1.GetLevelProgress = slot3

	function slot3(slot0)
		slot1 = math
		slot1 = slot1.min
		slot2 = slot0.level
		slot2 = slot2 + 1
		slot3 = slot0.targets
		slot3 = #slot3
		slot1 = slot1(slot2, slot3)
		slot2 = slot0.count
		slot3 = slot0.targets
		slot3 = slot3[slot1]
		slot4 = slot0.count
		slot5 = slot0.targets
		slot5 = slot5[slot1]
		slot4 = slot4 / slot5

		return slot2, slot3, slot4
	end

	slot1.GetResProgress = slot3

	function slot3(slot0)
		slot1 = slot0.activity
		slot1 = slot1.id

		return slot1
	end

	slot1.GetId = slot3

	function slot3(slot0)
		slot1 = {
			type = 1
		}
		slot2 = slot0.resId
		slot1.id = slot2

		return slot1
	end

	slot1.GetRes = slot3

	function slot3(slot0)
		slot1 = math
		slot1 = slot1.min
		slot2 = slot0.targets
		slot2 = #slot2
		slot3 = slot0.level
		slot3 = slot3 + 1
		slot1 = slot1(slot2, slot3)
		slot2 = slot0.dropList
		slot2 = slot2[slot1]
		slot3 = {}
		slot4 = slot2[1]
		slot3.type = slot4
		slot4 = slot2[2]
		slot3.id = slot4
		slot4 = slot2[3]
		slot3.count = slot4

		return slot3
	end

	slot1.GetAward = slot3

	function slot3(slot0)
		slot2 = slot0
		slot1 = slot0.GetAward
		slot1 = slot1(slot2)
		slot1 = slot1.id

		return slot1
	end

	slot1.GetResItemId = slot3

	function slot3(slot0)
		slot1 = slot0.value2

		return slot1
	end

	slot1.GetValue2 = slot3

	function slot3(slot0)
		slot1 = slot0.activity
		slot2 = slot1
		slot1 = slot1.getConfig
		slot3 = "bg"
		slot1 = slot1(slot2, slot3)
		slot1 = slot1[1]

		return slot1
	end

	slot1.GetBg = slot3

	function slot3(slot0)
		slot1, slot2, slot3 = slot0:GetResProgress()

		return slot3 >= 1 and not slot0:GetAllAward()
	end

	slot1.CanGetAward = slot3

	function slot3(slot0)
		return slot0.level == #slot0.targets
	end

	slot1.GetAllAward = slot3
	slot3 = slot2
	slot4 = slot1

	slot3(slot4)

	return slot1
end

function slot2(slot0)
	slot1 = {}

	function slot2(slot0)
		slot1 = slot0
		slot0._tf = slot1
		slot1 = UIItemList
		slot1 = slot1.New
		slot2 = slot0._tf
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = "window/scrollview/list"
		slot2 = slot2(slot3, slot4)
		slot3 = slot0._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/scrollview/item"
		slot1 = slot1(slot2, slot3(slot4, slot5))
		slot0.UIlist = slot1
		slot1 = slot0._tf
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "window/pt/Text"
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = typeof
		slot4 = Text
		slot1 = slot1(slot2, slot3(slot4))
		slot0.totalTxt = slot1
		slot1 = slot0._tf
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "window/pt/title"
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = typeof
		slot4 = Text
		slot1 = slot1(slot2, slot3(slot4))
		slot0.totalTitleTxt = slot1
		slot1 = slot0._tf
		slot2 = slot1
		slot1 = slot1.Find
		slot3 = "window/top/btnBack"
		slot1 = slot1(slot2, slot3)
		slot0.closeBtn = slot1
		slot1 = onButton
		slot2 = nil
		slot3 = slot0._tf

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.Hide

			slot0(slot1)
		end

		slot5 = SFX_PANEL

		slot1(slot2, slot3, slot4, slot5)

		slot1 = onButton
		slot2 = nil
		slot3 = slot0.closeBtn

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.Hide

			slot0(slot1)
		end

		slot5 = SFX_PANEL

		slot1(slot2, slot3, slot4, slot5)
	end

	function slot3(slot0, slot1, slot2, slot3)
		slot4 = slot0.UIlist
		slot5 = slot4
		slot4 = slot4.make

		function slot6(slot0, slot1, slot2)
			slot3 = UIItemList
			slot3 = slot3.EventUpdate

			if slot0 == slot3 then
				setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
				setText(slot2:Find("target/Text"), slot4)
				setText(slot2:Find("target/title"), slot2.resTitle)
				updateDrop(slot2:Find("award"), {
					type = slot0[slot1 + 1][1],
					id = slot0[slot1 + 1][2],
					count = slot0[slot1 + 1][3]
				})
				setActive(slot2:Find("award/mask"), slot1 + 1 <= slot0[slot1 + 1])
			end
		end

		slot4(slot5, slot6)

		slot4 = slot0.UIlist
		slot5 = slot4
		slot4 = slot4.align
		slot6 = #slot1

		slot4(slot5, slot6)
	end

	function slot4(slot0, slot1)
		slot2 = slot1.dropList
		slot3 = slot1.targets
		slot4 = slot1.level
		slot5 = slot1.count
		slot6 = slot1.resId
		slot7 = pg
		slot7 = slot7.item_data_statistics
		slot8 = id2ItemId
		slot9 = slot6
		slot8 = slot8(slot9)
		slot7 = slot7[slot8]
		slot7 = slot7.name
		slot8 = i18n
		slot9 = "pt_count"
		slot10 = slot7
		slot8 = slot8(slot9, slot10)
		slot9 = i18n
		slot10 = "pt_total_count"
		slot11 = slot7
		slot9 = slot9(slot10, slot11)
		slot0.cntTitle = slot9
		slot0.resTitle = slot8
		slot8 = slot0
		slot9 = slot0
		slot10 = slot2
		slot11 = slot3
		slot12 = slot4

		slot8(slot9, slot10, slot11, slot12)

		slot8 = slot0.totalTxt
		slot8.text = slot5
		slot8 = slot0.totalTitleTxt
		slot9 = slot0.cntTitle
		slot8.text = slot9
		slot8 = setActive
		slot9 = slot0._tf
		slot10 = true

		slot8(slot9, slot10)
	end

	slot1.Show = slot4

	function slot4(slot0)
		slot1 = setActive
		slot2 = slot0._tf
		slot3 = false

		slot1(slot2, slot3)
	end

	slot1.Hide = slot4

	function slot4(slot0)
		slot2 = slot0
		slot1 = slot0.Hide

		slot1(slot2)

		slot1 = removeOnButton
		slot2 = slot0._tf

		slot1(slot2)

		slot1 = removeOnButton
		slot2 = slot0.closeBtn

		slot1(slot2)
	end

	slot1.Dispose = slot4
	slot4 = slot2
	slot5 = slot1

	slot4(slot5)

	return slot1
end

function slot3(slot0)
	slot1 = "Clutter/banai_live"

	return slot1
end

slot0.getDefaultBg = slot3

function slot3(slot0)
	slot1 = slot0
	slot2 = slot0.activity
	slot1 = slot1(slot2)
	slot0.warpAct = slot1
	slot1 = slot1
	slot2 = slot0.view
	slot3 = slot2
	slot2 = slot2.findTF
	slot4 = "bonusWindow"
	slot1 = slot1(slot2(slot3, slot4))
	slot0.awardWindow = slot1
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
	slot3 = "AD/value2"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.value2 = slot1
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
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.displayBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.awardWindow
		slot1 = slot0
		slot0 = slot0.Show
		slot2 = slot0
		slot2 = slot2.warpAct

		slot0(slot1, slot2)
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
		slot0 = slot0.warpAct
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
		slot6 = slot6.warpAct
		slot7 = slot6
		slot6 = slot6.GetId
		slot6 = slot6(slot7)
		slot5.activity_id = slot6
		slot5.arg1 = slot1

		slot2(slot3, slot4, slot5)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.gotBtn

	function slot4()
		return
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.GetServerTime
	slot1 = slot1(slot2)
	slot0.time = slot1
end

slot0.onInit = slot3

function slot3(slot0)
	slot1 = slot0.warpAct
	slot2 = slot1
	slot1 = slot1.Update
	slot3 = slot0.activity

	slot1(slot2, slot3)

	slot1 = slot0.warpAct
	slot2 = slot1
	slot1 = slot1.GetLevelProgress
	slot1, slot2, slot3 = slot1(slot2)
	slot4 = slot0.warpAct
	slot5 = slot4
	slot4 = slot4.GetResProgress
	slot4, slot5, slot6 = slot4(slot5)
	slot7 = slot0.value
	slot8 = slot4
	slot9 = "/"
	slot10 = slot5
	slot8 = slot8 .. slot9 .. slot10
	slot7.text = slot8
	slot7 = slot0.value2
	slot8 = slot0.warpAct
	slot9 = slot8
	slot8 = slot8.GetValue2
	slot8 = slot8(slot9)
	slot7.text = slot8
	slot7 = slot0.progress
	slot8 = slot1
	slot9 = "/"
	slot10 = slot2
	slot8 = slot8 .. slot9 .. slot10
	slot7.text = slot8
	slot7 = slot0.sliderTxt
	slot8 = string
	slot8 = slot8.format
	slot9 = "%0.2f"
	slot10 = math
	slot10 = slot10.min
	slot11 = slot6
	slot12 = 1
	slot10 = slot10(slot11, slot12)
	slot10 = slot10 * 100
	slot8 = slot8(slot9, slot10)
	slot9 = "%"
	slot8 = slot8 .. slot9
	slot7.text = slot8
	slot7 = slot0.slider
	slot7.value = slot6
	slot7 = slot0.warpAct
	slot8 = slot7
	slot7 = slot7.CanGetAward
	slot7 = slot7(slot8)
	slot8 = slot0.warpAct
	slot9 = slot8
	slot8 = slot8.GetAllAward
	slot8 = slot8(slot9)
	slot9 = setActive
	slot10 = slot0.battleBtn
	slot11 = not slot7 and not slot8

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot0.getBtn
	slot11 = slot7

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot0.gotBtn
	slot11 = slot8

	slot9(slot10, slot11)

	slot9 = pg
	slot9 = slot9.TimeMgr
	slot9 = slot9.GetInstance
	slot9 = slot9()
	slot10 = slot9
	slot9 = slot9.GetServerTime
	slot9 = slot9(slot10)
	slot10 = slot0.time
	slot9 = slot9 - slot10
	slot10 = slot0
	slot10 = slot10.TIME
	slot11 = not slot8

	if not slot8 then
		slot11 = false

		if false then
			slot11 = true
		end
	end

	if slot10 <= slot9 then
		slot9 = pg
		slot9 = slot9.TimeMgr
		slot9 = slot9.GetInstance
		slot9 = slot9()
		slot10 = slot9
		slot9 = slot9.GetServerTime
		slot9 = slot9(slot10)
		slot0.time = slot9
		slot10 = slot0
		slot9 = slot0.emit
		slot11 = ActivityMediator
		slot11 = slot11.EVENT_PT_OPERATION
		slot12 = {
			cmd = 2
		}
		slot13 = slot0.warpAct
		slot14 = slot13
		slot13 = slot13.GetId
		slot13 = slot13(slot14)
		slot12.activity_id = slot13

		slot9(slot10, slot11, slot12)
	end

	slot9 = slot0.warpAct
	slot10 = slot9
	slot9 = slot9.GetAward
	slot9 = slot9(slot10)
	slot10 = updateDrop
	slot11 = slot0.awardTF
	slot12 = slot9

	slot10(slot11, slot12)

	slot10 = onButton
	slot11 = slot0
	slot12 = slot0.awardTF

	function slot13()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BaseUI
		slot2 = slot2.ON_DROP
		slot3 = slot1

		slot0(slot1, slot2, slot3)

		return
	end

	slot14 = SFX_PANEL

	slot10(slot11, slot12, slot13, slot14)

	return
end

slot0.onUpdate = slot3

function slot3(slot0)
	slot1 = slot0.awardWindow
	slot2 = slot1
	slot1 = slot1.Dispose

	slot1(slot2)

	return
end

slot0.onDispose = slot3

return slot0
