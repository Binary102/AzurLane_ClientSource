slot0 = class
slot1 = "ChallengeMainScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 5
slot0.BOSS_NUM = slot1

function slot1(slot0)
	slot1 = "ChallengeMainUI"

	return slot1
end

slot0.getUIName = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findUI

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.initData

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.addListener

	slot1(slot2)
end

slot0.init = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.updateGrade
	slot3 = slot0.challengeInfo
	slot4 = slot3
	slot3 = slot3.getGradeList

	slot1(slot2, slot3(slot4))

	slot2 = slot0
	slot1 = slot0.updateTimePanel

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateSwitchModBtn

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateAwardPanel

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updatePaintingList
	slot3 = slot0.nameList
	slot4 = slot0.showingIndex

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.updateRoundText
	slot3 = slot0.showingIndex

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateSlider
	slot3 = slot0.showingIndex

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateResetBtn

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.showSLResetMsgBox

	slot1(slot2)

	slot1 = slot0.contextData
	slot1 = slot1.editFleet

	if slot1 then
		slot1 = triggerButton
		slot2 = slot0.formationBtn

		slot1(slot2)

		slot1 = slot0.contextData
		slot2 = nil
		slot1.editFleet = slot2
	end
end

slot0.didEnter = slot1

function slot1(slot0)
	slot1 = slot0.timer

	if slot1 then
		slot1 = slot0.timer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)
	end
end

slot0.willExit = slot1

function slot1(slot0)
	slot1 = isActive
	slot2 = slot0.fleetSelect
	slot1 = slot1(slot2)

	if slot1 then
		slot2 = slot0
		slot1 = slot0.hideFleetEdit

		slot1(slot2)
	else
		slot1 = triggerButton
		slot2 = slot0.backBtn

		slot1(slot2)
	end
end

slot0.onBackPressed = slot1

function slot1(slot0, slot1)
	slot2 = {}
	slot0.fleets = slot2

	function slot2(slot0)
		slot1 = slot0
		slot1 = slot1.fleets
		slot2 = {}
		slot3 = slot1
		slot4 = slot0 + 1
		slot3 = slot3[slot4]
		slot2[1] = slot3
		slot3 = slot1
		slot4 = slot0 + 11
		slot3 = slot3[slot4]
		slot2[11] = slot3
		slot1[slot0] = slot2
	end

	slot3 = slot2
	slot4 = ChallengeProxy
	slot4 = slot4.MODE_CASUAL

	slot3(slot4)

	slot3 = slot2
	slot4 = ChallengeProxy
	slot4 = slot4.MODE_INFINITE

	slot3(slot4)
end

slot0.setFleet = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ForNorth"
	slot1 = slot1(slot2, slot3)
	slot0.northTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "PaintingList"
	slot1 = slot1(slot2, slot3)
	slot0.paintingListTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top/back_button"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GradeContainer"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.gradeContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonBestPoint/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonBestPointText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ActivityBestPoint/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityBestPointText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonLevelNum/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonLevelNumText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ActivityLevelNum/Text"
	slot4 = slot0.gradeContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityLevelNumText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "TimeTip"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.timeTipTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ActivityTimeText"
	slot4 = slot0.timeTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.activityTimeText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonTipText/DayText"
	slot4 = slot0.timeTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonDayText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SeasonTimeText"
	slot4 = slot0.timeTipTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seasonTimeText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SwitchMod"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.switchModTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "NormalBtn"
	slot4 = slot0.switchModTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.casualModBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "EndlessBtn"
	slot4 = slot0.switchModTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.infiniteModBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "BG"
	slot4 = slot0.casualModBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot0.casualModBtnBG = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "BG"
	slot4 = slot0.infiniteModBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot0.infiniteModBtnBG = slot1
	slot1 = GetComponent
	slot2 = slot0.casualModBtn
	slot3 = "Button"
	slot1 = slot1(slot2, slot3)
	slot0.casualModBtnSC = slot1
	slot1 = GetComponent
	slot2 = slot0.infiniteModBtn
	slot3 = "Button"
	slot1 = slot1(slot2, slot3)
	slot0.infiniteModBtnSC = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "FunctionBtns"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.functionBtnsTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "RankBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.rankBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "FormationBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.formationBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "StartBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.startBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ResetBtn"
	slot4 = slot0.functionBtnsTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.resetBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Award"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.awardTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "HelpBtn"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.helpBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "GetBtn"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.getBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ItemBG/item"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.itemTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Score/ScoreText"
	slot4 = slot0.awardTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.scoreText = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Slider"
	slot4 = slot0.northTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.slider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "SquareList"
	slot4 = slot0.slider
	slot1 = slot1(slot2, slot3, slot4)
	slot0.squareContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Squre"
	slot4 = slot0.slider
	slot1 = slot1(slot2, slot3, slot4)
	slot0.squareTpl = slot1
	slot1 = UIItemList
	slot1 = slot1.New
	slot2 = slot0.squareContainer
	slot3 = slot0.squareTpl
	slot1 = slot1(slot2, slot3)
	slot0.squareList = slot1
	slot1 = GetComponent
	slot2 = slot0.slider
	slot3 = "Slider"
	slot1 = slot1(slot2, slot3)
	slot0.sliderSC = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "PaintingList"
	slot1 = slot1(slot2, slot3)
	slot0.paintingContainer = slot1
	slot1 = GetComponent
	slot2 = slot0.paintingContainer
	slot3 = "Slider"
	slot1 = slot1(slot2, slot3)
	slot0.scrollSC = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Painting"
	slot4 = slot0.paintingContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.painting = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Card1"
	slot4 = slot0.paintingContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.card1TF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Mask/ShipPaint"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipPaintImg_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Tag"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.tag_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round/RoundText"
	slot4 = slot0.card1TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundText_1 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Card2"
	slot4 = slot0.paintingContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.card2TF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Mask/ShipPaint"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipPaintImg_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Tag"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.tag_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Round/RoundText"
	slot4 = slot0.card2TF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.roundText_2 = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "LevelFleetSelectView"
	slot1 = slot1(slot2, slot3)
	slot0.fleetSelect = slot1
	slot1 = ActivityFleetPanel
	slot1 = slot1.New
	slot2 = slot0.fleetSelect
	slot2 = slot2.gameObject
	slot1 = slot1(slot2)
	slot0.fleetEditPanel = slot1
	slot1 = slot0.fleetEditPanel

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideFleetEdit

		slot0(slot1)
	end

	slot1.onCancel = slot2
	slot1 = slot0.fleetEditPanel

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.commitEdit

		slot0(slot1)
	end

	slot1.onCommit = slot2
	slot1 = slot0.fleetEditPanel

	function slot2()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.commitEdit

		slot0(slot1)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ChallengeMainMediator
		slot2 = slot2.ON_PRECOMBAT
		slot3 = slot0
		slot3 = slot3.curMode

		slot0(slot1, slot2, slot3)
	end

	slot1.onCombat = slot2
	slot1 = slot0.fleetEditPanel

	function slot2(slot0, slot1)
		return
	end

	slot1.onLongPressShip = slot2
	slot1 = CmdLevelFormationPanel
	slot1 = slot1.New
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "commander_panel"
	slot1 = slot1(slot2(slot3, slot4))
	slot0.commanderFormationPanel = slot1
	slot1 = slot0.commanderFormationPanel
	slot2 = slot1
	slot1 = slot1.attach
	slot3 = slot0

	slot1(slot2, slot3)
end

slot0.findUI = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ChallengeProxy
	slot1 = slot1(slot2)
	slot0.challengeProxy = slot1
	slot1 = slot0.challengeProxy
	slot2 = slot1
	slot1 = slot1.getChallengeInfo
	slot1 = slot1(slot2)
	slot0.challengeInfo = slot1
	slot1 = slot0.challengeProxy
	slot2 = slot1
	slot1 = slot1.getUserChallengeInfoList
	slot1 = slot1(slot2)
	slot0.userChallengeInfoList = slot1
	slot1 = false
	slot0.timeOverTag = slot1
	slot2 = slot0
	slot1 = slot0.updateData

	slot1(slot2)

	slot1 = true
	slot0.openedCommanerSystem = slot1
end

slot0.initData = slot1

function slot1(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = slot1
		slot2 = slot2.ON_BACK

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_HELP
		slot2.type = slot3
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.challenge_help
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.rankBtn

	function slot4()
		return
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.formationBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.fleetEditPanel
		slot1 = slot0
		slot0 = slot0.attach
		slot2 = slot0

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.fleetEditPanel
		slot1 = slot0
		slot0 = slot0.setFleets
		slot2 = slot0
		slot2 = slot2.fleets
		slot3 = slot0
		slot3 = slot3.curMode
		slot2 = slot2[slot3]

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.fleetEditPanel
		slot1 = slot0
		slot0 = slot0.set
		slot2 = 1
		slot3 = 1

		slot0(slot1, slot2, slot3)

		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.BlurPanel
		slot2 = slot0
		slot2 = slot2.fleetEditPanel
		slot2 = slot2._tf

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.startBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.isCrossedSeason
		slot0 = slot0(slot1)

		if slot0 == true then
			slot0 = slot0
			slot0 = slot0.challengeProxy
			slot1 = slot0
			slot0 = slot0.getCurMode
			slot0 = slot0(slot1)
			slot1 = slot0
			slot1 = slot1.curModeInfo

			if not slot1 then
				slot1 = pg
				slot1 = slot1.MsgboxMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ShowMsgBox
				slot3 = {
					hideNo = true
				}
				slot4 = i18n
				slot5 = "challenge_season_update"
				slot4 = slot4(slot5)
				slot3.content = slot4

				function slot4()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = slot1

					slot0(slot1, slot2, slot3)
				end

				slot3.onYes = slot4

				function slot4()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = slot1

					slot0(slot1, slot2, slot3)
				end

				slot3.onNo = slot4

				slot1(slot2, slot3)

				return
			else
				slot1 = (slot0 == ChallengeProxy.MODE_CASUAL and "challenge_season_update_casual_clear") or "challenge_season_update_infinite_clear"
				slot2 = ChallengeProxy.MODE_CASUAL

				if slot0 == slot2 then
					slot2 = slot0
					slot2 = slot2.curModeInfo
					slot3 = slot2
					slot2 = slot2.getScore
					slot2 = slot2(slot3)

					if not slot2 then
						slot2 = slot0
						slot2 = slot2.curModeInfo
						slot3 = slot2
						slot2 = slot2.getLevel
						slot2 = slot2(slot3)
					end
				end

				slot3 = pg
				slot3 = slot3.MsgboxMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowMsgBox
				slot5 = {
					hideNo = false
				}
				slot6 = i18n
				slot7 = slot1
				slot8 = slot2
				slot6 = slot6(slot7, slot8)
				slot5.content = slot6

				function slot6()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = slot1

					slot0(slot1, slot2, slot3)
				end

				slot5.onYes = slot6

				slot3(slot4, slot5)

				return
			end
		end

		slot0 = slot0
		slot0 = slot0.curModeInfo

		if not slot0 then
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = "挑战没有初始化"

			slot0(slot1, slot2)

			return
		end

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ChallengeMainMediator
		slot2 = slot2.ON_PRECOMBAT
		slot3 = slot0
		slot3 = slot3.curMode

		slot0(slot1, slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.resetBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {
			hideNo = false
		}
		slot3 = i18n
		slot4 = "challenge_normal_reset"
		slot3 = slot3(slot4)
		slot2.content = slot3

		function slot3()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ChallengeConst
			slot2 = slot2.RESET_DATA_EVENT
			slot3 = slot0
			slot3 = slot3.challengeProxy
			slot4 = slot3
			slot3 = slot3.getCurMode

			slot0(slot1, slot2, slot3(slot4))
		end

		slot2.onYes = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	function slot1()
		slot0 = slot0
		slot0 = slot0.showingIndex

		if slot0 == 1 then
			return
		end

		slot0 = slot0
		slot1 = slot0
		slot1 = slot1.showingIndex
		slot1 = slot1 - 1
		slot0.showingIndex = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updatePaintingList
		slot2 = slot0
		slot2 = slot2.nameList
		slot3 = slot0
		slot3 = slot3.showingIndex

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateRoundText
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateSlider
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)
	end

	function slot2()
		slot0 = slot0
		slot0 = slot0.showingIndex
		slot1 = slot1
		slot1 = slot1.BOSS_NUM

		if slot0 == slot1 then
			return
		end

		slot0 = slot0
		slot1 = slot0
		slot1 = slot1.showingIndex
		slot1 = slot1 + 1
		slot0.showingIndex = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updatePaintingList
		slot2 = slot0
		slot2 = slot2.nameList
		slot3 = slot0
		slot3 = slot3.showingIndex

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateRoundText
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateSlider
		slot2 = slot0
		slot2 = slot2.showingIndex

		slot0(slot1, slot2)
	end

	slot3 = addSlip
	slot4 = SLIP_TYPE_HRZ
	slot5 = slot0.paintingContainer
	slot6 = slot1
	slot7 = slot2

	slot3(slot4, slot5, slot6, slot7)
end

slot0.addListener = slot1

function slot1(slot0)
	slot1 = slot0.challengeProxy
	slot2 = slot1
	slot1 = slot1.getCurMode
	slot1 = slot1(slot2)
	slot0.curMode = slot1
	slot1 = slot0.userChallengeInfoList
	slot2 = slot0.curMode
	slot1 = slot1[slot2]
	slot0.curModeInfo = slot1
	slot1 = false
	slot0.timeOverTag = slot1
	slot1 = slot0.curModeInfo

	if not slot1 then
		slot1 = 1
		slot0.curLevel = slot1
		slot1 = slot0.curLevel
		slot0.showingIndex = slot1
		slot1 = slot0.curMode
		slot2 = ChallengeProxy
		slot2 = slot2.MODE_CASUAL

		if slot1 == slot2 then
			slot1 = slot0.challengeInfo
			slot2 = slot1
			slot1 = slot1.getDungeonIDList
			slot1 = slot1(slot2)
			slot0.dungeonIDList = slot1
		else
			slot1 = slot0.curMode
			slot2 = ChallengeProxy
			slot2 = slot2.MODE_INFINITE

			if slot1 == slot2 then
				slot1 = slot0.challengeInfo
				slot2 = slot1
				slot1 = slot1.getSeasonID
				slot1 = slot1(slot2)
				slot2 = pg
				slot2 = slot2.activity_event_challenge
				slot2 = slot2.infinite_stage
				slot2 = slot2[slot1]
				slot2 = slot2[1]
				slot0.dungeonIDList = slot2
			end
		end
	else
		slot1 = slot0.curModeInfo
		slot2 = slot1
		slot1 = slot1.getLevel
		slot1 = slot1(slot2)
		slot0.curLevel = slot1
		slot1 = slot0.curLevel
		slot0.showingIndex = slot1
		slot1 = slot0.curModeInfo
		slot2 = slot1
		slot1 = slot1.getDungeonIDList
		slot1 = slot1(slot2)
		slot0.dungeonIDList = slot1
	end

	slot1 = {}
	slot0.nameList = slot1
	slot1 = ipairs
	slot2 = slot0.dungeonIDList
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.expedition_challenge_template
		slot6 = slot6[slot5]
		slot6 = slot6.char_icon
		slot6 = slot6[1]
		slot7 = slot0.nameList
		slot7[slot4] = slot6
	end
end

slot0.updateData = slot1

function slot1(slot0, slot1, slot2)
	setPaintingPrefabAsync(slot0.painting, slot1 or slot0.nameList[slot2 or slot0.showingIndex], "chuanwu")

	slot5 = slot0.BOSS_NUM - (slot2 or slot0.showingIndex)
	slot6 = 2

	if slot5 >= slot6 then
		slot5 = setActive
		slot6 = slot0.card1TF
		slot7 = true

		slot5(slot6, slot7)

		slot5 = setActive
		slot6 = slot0.card2TF
		slot7 = true

		slot5(slot6, slot7)

		slot5 = LoadSpriteAsync
		slot6 = "shipYardIcon/"
		slot7 = slot4 + 1
		slot7 = slot3[slot7]
		slot6 = slot6 .. slot7

		function slot7(slot0)
			slot1 = setImageSprite
			slot2 = slot0
			slot2 = slot2.shipPaintImg_1
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot5(slot6, slot7)

		slot5 = LoadSpriteAsync
		slot6 = "shipYardIcon/"
		slot7 = slot4 + 2
		slot7 = slot3[slot7]
		slot6 = slot6 .. slot7

		function slot7(slot0)
			slot1 = setImageSprite
			slot2 = slot0
			slot2 = slot2.shipPaintImg_2
			slot3 = slot0

			slot1(slot2, slot3)
		end

		slot5(slot6, slot7)
	else
		slot5 = slot0
		slot5 = slot5.BOSS_NUM
		slot5 = slot5 - slot4

		if slot5 == 1 then
			slot5 = setActive
			slot6 = slot0.card1TF
			slot7 = true

			slot5(slot6, slot7)

			slot5 = setActive
			slot6 = slot0.card2TF
			slot7 = false

			slot5(slot6, slot7)

			slot5 = LoadSpriteAsync
			slot6 = "shipYardIcon/"
			slot7 = slot4 + 1
			slot7 = slot3[slot7]
			slot6 = slot6 .. slot7

			function slot7(slot0)
				slot1 = setImageSprite
				slot2 = slot0
				slot2 = slot2.shipPaintImg_1
				slot3 = slot0

				slot1(slot2, slot3)
			end

			slot5(slot6, slot7)
		else
			slot5 = setActive
			slot6 = slot0.card1TF
			slot7 = false

			slot5(slot6, slot7)

			slot5 = setActive
			slot6 = slot0.card2TF
			slot7 = false

			slot5(slot6, slot7)
		end
	end
end

slot0.updatePaintingList = slot1

function slot1(slot0, slot1)
	setText(slot0.roundText_1, "Round" .. (slot1 or slot0.showingIndex) + 1)
	setText(slot0.roundText_2, "Round" .. (slot1 or slot0.showingIndex) + 2)
end

slot0.updateRoundText = slot1

function slot1(slot0, slot1)
	slot2 = slot1 or slot0.showingIndex
	slot0.sliderSC.value = (slot0.curLevel - 1) * 1 / (ChallengeConst.BOSS_NUM - 1)

	slot0.squareList:make(function (slot0, slot1, slot2)
		slot3 = slot0:findTF("UnFinished", slot2)
		slot4 = slot0:findTF("Finished", slot2)
		slot5 = slot0:findTF("Challengeing", slot2)
		slot6 = slot0:findTF("Arrow", slot2)

		function slot7()
			setActive(setActive, true)
			setActive(setActive, false)
			setActive(false, false)
		end

		function slot8()
			setActive(setActive, false)
			setActive(setActive, true)
			setActive(true, false)
		end

		function slot9()
			setActive(setActive, false)
			setActive(setActive, false)
			setActive(false, true)
		end

		if slot0 == UIItemList.EventUpdate then
			if slot1 + 1 < slot0.curLevel then
				slot7()
			elseif slot1 + 1 == slot0.curLevel then
				slot9()
			elseif slot0.curLevel < slot1 + 1 then
				slot8()
			end

			if slot1 + 1 == slot1 then
				setActive(slot6, true)
			else
				setActive(slot6, false)
			end
		end
	end)
	slot0.squareList:align(ChallengeConst.BOSS_NUM)
end

slot0.updateSlider = slot1

function slot1(slot0, slot1)
	slot2 = setText
	slot3 = slot0.seasonBestPointText
	slot4 = slot1.seasonMaxScore

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.activityBestPointText
	slot4 = slot1.activityMaxScore

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.seasonLevelNumText
	slot4 = slot1.seasonMaxLevel

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0.activityLevelNumText
	slot4 = slot1.activityMaxLevel

	slot2(slot3, slot4)
end

slot0.updateGrade = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ActivityProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getActivityByType
	slot4 = ActivityConst
	slot4 = slot4.ACTIVITY_TYPE_CHALLENGE
	slot2 = slot2(slot3, slot4)
	slot3 = slot2.stopTime
	slot4 = pg
	slot4 = slot4.TimeMgr
	slot5 = slot4
	slot4 = slot4.GetInstance
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.DescTime
	slot6 = slot3
	slot7 = "%Y.%m.%d"
	slot8 = true
	slot4 = slot4(slot5, slot6, slot7, slot8)
	slot5 = setText
	slot6 = slot0.activityTimeText
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = pg
	slot5 = slot5.TimeMgr
	slot6 = slot5
	slot5 = slot5.GetInstance
	slot5 = slot5(slot6)
	slot6 = slot5
	slot5 = slot5.GetSecondsToNextWeek
	slot5 = slot5(slot6)
	slot6 = pg
	slot6 = slot6.TimeMgr
	slot7 = slot6
	slot6 = slot6.GetInstance
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.parseTimeFrom
	slot8 = slot5
	slot6, slot7, slot8, slot9 = slot6(slot7, slot8)
	slot10 = setText
	slot11 = slot0.seasonDayText
	slot12 = slot6

	slot10(slot11, slot12)

	slot10 = setText
	slot11 = slot0.seasonTimeText
	slot12 = string
	slot12 = slot12.format
	slot13 = "%02d:%02d:%02d"
	slot14 = slot7
	slot15 = slot8
	slot16 = slot9

	slot10(slot11, slot12(slot13, slot14, slot15, slot16))

	slot10 = slot0.timer

	if slot10 then
		slot10 = slot0.timer
		slot11 = slot10
		slot10 = slot10.Stop

		slot10(slot11)
	end

	slot10 = Timer
	slot10 = slot10.New

	function slot11()
		slot0 = slot0
		slot0 = slot0 - 1
		slot0 = slot0
		slot0 = pg
		slot0 = slot0.TimeMgr
		slot1 = slot0
		slot0 = slot0.GetInstance
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.parseTimeFrom
		slot2 = slot0
		slot0, slot1, slot2, slot3 = slot0(slot1, slot2)
		slot4 = setText
		slot5 = slot1
		slot5 = slot5.seasonDayText
		slot6 = slot0

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = slot1
		slot5 = slot5.seasonTimeText
		slot6 = string
		slot6 = slot6.format
		slot7 = "%02d:%02d:%02d"
		slot8 = slot1
		slot9 = slot2
		slot10 = slot3

		slot4(slot5, slot6(slot7, slot8, slot9, slot10))

		slot4 = slot0
		slot5 = 0

		if slot4 <= slot5 then
			slot4 = slot1
			slot5 = true
			slot4.timeOverTag = slot5
			slot4 = slot1
			slot4 = slot4.timer
			slot5 = slot4
			slot4 = slot4.Stop

			slot4(slot5)

			slot4 = slot1
			slot5 = slot4
			slot4 = slot4.updateTimePanel

			slot4(slot5)
		end
	end

	slot12 = 1
	slot13 = -1
	slot10 = slot10(slot11, slot12, slot13)
	slot0.timer = slot10
	slot10 = slot0.timer
	slot11 = slot10
	slot10 = slot10.Start

	slot10(slot11)
end

slot0.updateTimePanel = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.isFinishedCasualMode
	slot1 = slot1(slot2)

	if not slot1 then
		slot1 = setActive
		slot2 = slot0.infiniteModBtn
		slot3 = false

		slot1(slot2, slot3)
	else
		slot1 = setActive
		slot2 = slot0.infiniteModBtn
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.casualModBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.curMode
		slot1 = ChallengeProxy
		slot1 = slot1.MODE_CASUAL

		if slot0 == slot1 then
			return
		end

		slot0 = slot0
		slot0 = slot0.curModeInfo

		if slot0 then
			slot1 = slot0.self.timeOverTag

			if slot1 then
				slot1 = slot0
				slot1 = slot1.curModeInfo

				if slot1 then
					slot1 = "challenge_season_update_infinite_switch"
					slot2 = slot0
					slot3 = pg
					slot3 = slot3.MsgboxMgr
					slot3 = slot3.GetInstance
					slot3 = slot3()
					slot4 = slot3
					slot3 = slot3.ShowMsgBox
					slot5 = {
						hideNo = false
					}
					slot6 = i18n
					slot7 = slot1
					slot8 = slot2
					slot6 = slot6(slot7, slot8)
					slot5.content = slot6

					function slot6()
						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.emit
						slot2 = ChallengeConst
						slot2 = slot2.RESET_DATA_EVENT
						slot3 = ChallengeProxy
						slot3 = slot3.MODE_INFINITE
						slot4 = true

						slot0(slot1, slot2, slot3, slot4)
					end

					slot5.onYes = slot6

					slot3(slot4, slot5)

					return
				end
			end
		end

		slot1 = pg
		slot1 = slot1.MsgboxMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.ShowMsgBox
		slot3 = {
			hideNo = false
		}
		slot4 = i18n
		slot5 = "challenge_infinite_click_switch"
		slot6 = slot0
		slot4 = slot4(slot5, slot6)
		slot3.content = slot4

		function slot4()
			slot0 = slot0
			slot0 = slot0.challengeProxy
			slot1 = slot0
			slot0 = slot0.setCurMode
			slot2 = ChallengeProxy
			slot2 = slot2.MODE_CASUAL

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.casualModBtnBG
			slot2 = true

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.infiniteModBtnBG
			slot2 = false

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateData

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updatePaintingList
			slot2 = slot0
			slot2 = slot2.nameList
			slot3 = slot0
			slot3 = slot3.showingIndex

			slot0(slot1, slot2, slot3)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateRoundText
			slot2 = slot0
			slot2 = slot2.showingIndex

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateSlider
			slot2 = slot0
			slot2 = slot2.showingIndex

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateResetBtn

			slot0(slot1)
		end

		slot3.onYes = slot4

		slot1(slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.infiniteModBtn

	function slot4()
		slot0 = print
		slot1 = tostring
		slot2 = slot0
		slot2 = slot2.infiniteModBtn

		slot0(slot1(slot2))

		slot0 = slot0
		slot0 = slot0.curMode
		slot1 = ChallengeProxy
		slot1 = slot1.MODE_INFINITE

		if slot0 == slot1 then
			return
		end

		slot0 = slot0
		slot0 = slot0.curModeInfo

		if slot0 then
			slot0 = slot0
			slot0 = slot0.curModeInfo
			slot1 = slot0
			slot0 = slot0.getScore
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.challengeInfo
				slot1 = slot0
				slot0 = slot0.getGradeList
				slot0 = slot0(slot1)
				slot0 = slot0.seasonMaxScore
				slot0 = slot0()
			end
		end

		slot1 = slot0
		slot1 = slot1.self
		slot1 = slot1.timeOverTag

		if slot1 then
			slot1 = slot0
			slot1 = slot1.curModeInfo

			if slot1 then
				slot1 = "challenge_season_update_casual_switch"
				slot2 = slot0
				slot3 = pg
				slot3 = slot3.MsgboxMgr
				slot3 = slot3.GetInstance
				slot3 = slot3()
				slot4 = slot3
				slot3 = slot3.ShowMsgBox
				slot5 = {
					hideNo = false
				}
				slot6 = i18n
				slot7 = slot1
				slot8 = slot2
				slot6 = slot6(slot7, slot8)
				slot5.content = slot6

				function slot6()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = ChallengeConst
					slot2 = slot2.RESET_DATA_EVENT
					slot3 = ChallengeProxy
					slot3 = slot3.MODE_CASUAL

					slot0(slot1, slot2, slot3)
				end

				slot5.onYes = slot6

				slot3(slot4, slot5)

				return
			end
		end

		slot1 = pg
		slot1 = slot1.MsgboxMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.ShowMsgBox
		slot3 = {
			hideNo = false
		}
		slot4 = i18n
		slot5 = "challenge_casual_click_switch"
		slot6 = slot0
		slot4 = slot4(slot5, slot6)
		slot3.content = slot4

		function slot4()
			slot0 = slot0
			slot0 = slot0.challengeProxy
			slot1 = slot0
			slot0 = slot0.setCurMode
			slot2 = ChallengeProxy
			slot2 = slot2.MODE_INFINITE

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.casualModBtnBG
			slot2 = false

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.infiniteModBtnBG
			slot2 = true

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateData

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updatePaintingList
			slot2 = slot0
			slot2 = slot2.nameList
			slot3 = slot0
			slot3 = slot3.showingIndex

			slot0(slot1, slot2, slot3)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateRoundText
			slot2 = slot0
			slot2 = slot2.showingIndex

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateSlider
			slot2 = slot0
			slot2 = slot2.showingIndex

			slot0(slot1, slot2)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.updateResetBtn

			slot0(slot1)
		end

		slot3.onYes = slot4

		slot1(slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.updateSwitchModBtn = slot1

function slot1(slot0)
	slot1 = slot0.userChallengeInfoList
	slot2 = slot0.curMode
	slot1 = slot1[slot2]

	if slot1 then
		slot2 = GetComponent
		slot3 = slot0.resetBtn
		slot4 = "Button"
		slot2 = slot2(slot3, slot4)
		slot3 = true
		slot2.interactable = slot3
	else
		slot2 = GetComponent
		slot3 = slot0.resetBtn
		slot4 = "Button"
		slot2 = slot2(slot3, slot4)
		slot3 = false
		slot2.interactable = slot3
	end
end

slot0.updateResetBtn = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = TaskProxy
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.getTaskById
	slot3 = ChallengeConst
	slot3 = slot3.CHALLENGE_AWARD_TASK_ID
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.getConfig
	slot4 = "target_num"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.challengeInfo
	slot4 = slot3
	slot3 = slot3.getGradeList
	slot3 = slot3(slot4)
	slot3 = slot3.activityMaxScore
	slot4 = setText
	slot5 = slot0.scoreText
	slot6 = slot3
	slot7 = " / "
	slot8 = slot2
	slot6 = slot6 .. slot7 .. slot8

	slot4(slot5, slot6)

	slot5 = slot1
	slot4 = slot1.getTaskStatus
	slot4 = slot4(slot5)

	if slot4 == 0 then
		slot5 = GetComponent
		slot6 = slot0.getBtn
		slot7 = "Button"
		slot5 = slot5(slot6, slot7)
		slot6 = false
		slot5.interactable = slot6
	elseif slot4 == 1 then
		slot5 = GetComponent
		slot6 = slot0.getBtn
		slot7 = "Button"
		slot5 = slot5(slot6, slot7)
		slot6 = true
		slot5.interactable = slot6
	elseif slot4 == 2 then
		slot5 = GetComponent
		slot6 = slot0.getBtn
		slot7 = "Button"
		slot5 = slot5(slot6, slot7)
		slot6 = false
		slot5.interactable = slot6
	end

	slot6 = slot1
	slot5 = slot1.getConfig
	slot7 = "award_display"
	slot5 = slot5(slot6, slot7)
	slot5 = slot5[1]
	slot6 = {}
	slot7 = slot5[1]
	slot6.type = slot7
	slot7 = slot5[2]
	slot6.id = slot7
	slot7 = slot5[3]
	slot6.count = slot7
	slot7 = updateDrop
	slot8 = slot0.itemTF
	slot9 = slot6

	slot7(slot8, slot9)

	slot7 = onButton
	slot8 = slot0
	slot9 = slot0.itemTF

	function slot10()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = BaseUI
		slot2 = slot2.ON_DROP
		slot3 = slot1

		slot0(slot1, slot2, slot3)
	end

	slot11 = SFX_PANEL

	slot7(slot8, slot9, slot10, slot11)

	slot7 = onButton
	slot8 = slot0
	slot9 = slot0.getBtn

	function slot10()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ChallengeConst
		slot2 = slot2.CLICK_GET_AWARD_BTN
		slot3 = slot1
		slot3 = slot3.id

		slot0(slot1, slot2, slot3)
	end

	slot11 = SFX_PANEL

	slot7(slot8, slot9, slot10, slot11)

	slot7 = nil
end

slot0.updateAwardPanel = slot1

function slot1(slot0)
	slot1 = false
	slot2, slot3 = nil
	slot4 = pairs
	slot5 = slot0.userChallengeInfoList
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.getResetFlag
		slot9 = slot9(slot10)
		slot10 = ChallengeConst
		slot10 = slot10.NEED_TO_RESET_SAVELOAD

		if slot9 == slot10 then
			slot1 = true
			slot2 = slot8
			slot3 = slot7

			break
		end
	end

	if slot1 == true then
		slot4, slot5 = nil
		slot6 = ChallengeProxy
		slot6 = slot6.MODE_CASUAL

		if slot3 == slot6 then
			slot4 = "challenge_casual_reset"
			slot7 = slot2
			slot6 = slot2.getScore
			slot6 = slot6(slot7)
			slot5 = slot6
		else
			slot6 = ChallengeProxy
			slot6 = slot6.MODE_INFINITE

			if slot3 == slot6 then
				slot4 = "challenge_infinite_reset"
				slot7 = slot2
				slot6 = slot2.getLevel
				slot6 = slot6(slot7)
				slot5 = slot6 - 1
			end
		end

		slot6 = pg
		slot6 = slot6.MsgboxMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.ShowMsgBox
		slot8 = {
			hideNo = true
		}
		slot9 = i18n
		slot10 = slot4
		slot11 = slot5
		slot9 = slot9(slot10, slot11)
		slot8.content = slot9

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ChallengeConst
			slot2 = slot2.RESET_DATA_EVENT
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot8.onYes = slot9

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ChallengeConst
			slot2 = slot2.RESET_DATA_EVENT
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot8.onNo = slot9

		slot6(slot7, slot8)
	end
end

slot0.showSLResetMsgBox = slot1

function slot1(slot0)
	slot1 = false
	slot2 = slot0.userChallengeInfoList
	slot3 = ChallengeProxy
	slot3 = slot3.MODE_INFINITE
	slot2 = slot2[slot3]
	slot3 = slot0.userChallengeInfoList
	slot4 = ChallengeProxy
	slot4 = slot4.MODE_CASUAL
	slot3 = slot3[slot4]

	if slot2 then
		slot1 = true
	elseif not slot2 then
		if slot3 then
			slot5 = slot3
			slot4 = slot3.getSeasonID
			slot4 = slot4(slot5)
			slot5 = slot0.challengeInfo
			slot6 = slot5
			slot5 = slot5.getSeasonID
			slot5 = slot5(slot6)

			if slot4 == slot5 then
				slot4 = slot0.challengeInfo
				slot5 = slot4
				slot4 = slot4.getGradeList
				slot4 = slot4(slot5)
				slot4 = slot4.seasonMaxLevel
				slot5 = ChallengeConst
				slot5 = slot5.BOSS_NUM

				if slot4 == slot5 then
					slot1 = true
				else
					slot1 = false
				end
			else
				slot1 = false
			end
		elseif not slot3 then
			slot1 = false
		end
	end

	return slot1
end

slot0.isFinishedCasualMode = slot1

function slot1(slot0)
	slot1 = false
	slot2 = slot0.timeOverTag

	if slot2 == true then
		slot1 = true
	else
		slot2 = slot0.curModeInfo

		if slot2 then
			slot2 = slot0.curModeInfo
			slot3 = slot2
			slot2 = slot2.getSeasonID
			slot2 = slot2(slot3)
			slot3 = slot0.challengeInfo
			slot4 = slot3
			slot3 = slot3.getSeasonID
			slot3 = slot3(slot4)

			if slot2 ~= slot3 then
				slot1 = true
			end
		else
			slot1 = false
		end
	end

	return slot1
end

slot0.isCrossedSeason = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.emit
	slot3 = ChallengeMainMediator
	slot3 = slot3.ON_COMMIT_FLEET

	slot1(slot2, slot3)
end

slot0.commitEdit = slot1

function slot1(slot0)
	slot1 = setActive
	slot2 = slot0.fleetSelect
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.closeCommanderPanel

	slot1(slot2)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0.fleetSelect
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)

	slot1 = setParent
	slot2 = slot0.fleetSelect
	slot3 = slot0._tf
	slot4 = false

	slot1(slot2, slot3, slot4)
end

slot0.hideFleetEdit = slot1

function slot1(slot0)
	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.setFleets
	slot3 = slot0.fleets
	slot4 = slot0.curMode
	slot3 = slot3[slot4]

	slot1(slot2, slot3)

	slot1 = slot0.fleetEditPanel
	slot2 = slot1
	slot1 = slot1.updateFleets

	slot1(slot2)
end

slot0.updateEditPanel = slot1

function slot1(slot0, slot1)
	slot0.commanderPrefabs = slot1
end

slot0.setCommanderPrefabs = slot1

function slot1(slot0, slot1, slot2)
	function slot3(slot0)
		slot1 = slot0.type
		slot2 = LevelUIConst
		slot2 = slot2.COMMANDER_OP_ADD

		if slot1 == slot2 then
			slot1 = slot0
			slot1 = slot1.contextData
			slot2 = {}
			slot3 = slot1
			slot2.fleetIndex = slot3
			slot3 = slot0.pos
			slot2.cmdPos = slot3
			slot3 = slot0
			slot3 = slot3.curMode
			slot2.mode = slot3
			slot1.eliteCommanderSelected = slot2
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ChallengeMainMediator
			slot3 = slot3.ON_SELECT_ELITE_COMMANDER
			slot4 = slot1
			slot5 = slot0.pos
			slot6 = chapterId

			slot1(slot2, slot3, slot4, slot5, slot6)

			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.closeCommanderPanel

			slot1(slot2)
		else
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ChallengeMainMediator
			slot3 = slot3.ON_COMMANDER_OP
			slot4 = {}
			slot5 = LevelUIConst
			slot5 = slot5.FLEET_TYPE_EDIT
			slot4.FleetType = slot5
			slot4.data = slot0
			slot5 = slot1
			slot4.index = slot5
			slot5 = chapterId
			slot4.chapterId = slot5

			slot1(slot2, slot3, slot4)
		end

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.hideFleetEdit

		slot1(slot2)
	end

	slot4 = LevelCMDFormationView
	slot4 = slot4.New
	slot5 = slot0.fleetSelect
	slot6 = slot0.event
	slot7 = slot0.contextData
	slot4 = slot4(slot5, slot6, slot7)
	slot0.levelCMDFormationView = slot4
	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.Load

	slot4(slot5)

	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.ActionInvoke
	slot6 = "update"
	slot7 = slot1
	slot8 = slot0.commanderPrefabs
	slot9 = slot3

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = slot0.levelCMDFormationView
	slot5 = slot4
	slot4 = slot4.ActionInvoke
	slot6 = "open"

	slot4(slot5, slot6)
end

slot0.openCommanderPanel = slot1

function slot1(slot0)
	slot1 = slot0.levelCMDFormationView

	if slot1 then
		slot1 = slot0.levelCMDFormationView
		slot2 = slot1
		slot1 = slot1.GetLoaded
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = slot0.levelCMDFormationView
			slot2 = slot1
			slot1 = slot1.ActionInvoke
			slot3 = "updatePrefabs"
			slot4 = slot0.commanderPrefabs

			slot1(slot2, slot3, slot4)
		end
	end
end

slot0.updateCommanderPrefab = slot1

function slot1(slot0)
	slot1 = slot0.levelCMDFormationView

	if slot1 then
		slot1 = slot0.levelCMDFormationView
		slot2 = slot1
		slot1 = slot1.GetLoaded
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = slot0.levelCMDFormationView
			slot2 = slot1
			slot1 = slot1.close

			slot1(slot2)
		end
	end
end

slot0.closeCommanderPanel = slot1

return slot0
