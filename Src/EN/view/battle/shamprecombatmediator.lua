slot0 = class
slot1 = "ShamPreCombatMediator"
slot2 = import
slot3 = "..base.ContextMediator"
slot0 = slot0(slot1, slot2(slot3))
slot1 = "ShamPreCombatMediator.OP"
slot0.OP = slot1
slot1 = "ShamPreCombatMediator.SAVE"
slot0.SAVE = slot1
slot1 = "ShamPreCombatMediator.RESET"
slot0.RESET = slot1
slot1 = "ShamPreCombatMediator:START"
slot0.START = slot1
slot1 = "ShamPreCombatMediator:CHANGE_FLEET_SHIP"
slot0.CHANGE_FLEET_SHIP = slot1
slot1 = "ShamPreCombatMediator:OPEN_SHIP_INFO"
slot0.OPEN_SHIP_INFO = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = BayProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.setSelectShipId
	slot4 = nil

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.SAVE

	function slot5(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.save
		slot4 = slot1

		slot2(slot3, slot4)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.START

	function slot5(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.enter

		slot1(slot2)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.RESET

	function slot5(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.reset

		slot1(slot2)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.OP

	function slot5(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.save

		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.sendNotification
			slot2 = GAME
			slot2 = slot2.SHAM_OP
			slot3 = slot1

			slot0(slot1, slot2, slot3)
		end

		slot2(slot3, slot4)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.CHANGE_FLEET_SHIP

	function slot5(slot0, slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.openDockYard
		slot4 = slot1.type
		slot5 = slot1.shipVO
		slot6 = slot1.team

		slot2(slot3, slot4, slot5, slot6)
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.bind
	slot4 = slot0
	slot4 = slot4.OPEN_SHIP_INFO

	function slot5(slot0, slot1)
		slot2 = getProxy
		slot3 = BayProxy
		slot2 = slot2(slot3)
		slot4 = slot2
		slot3 = slot2.getShipById
		slot5 = slot1
		slot3 = slot3(slot4, slot5)

		if slot3 then
			slot3 = slot0
			slot3 = slot3.contextData
			slot3 = slot3.shamChapter
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.sendNotification
			slot6 = GAME
			slot6 = slot6.GO_SCENE
			slot7 = SCENE
			slot7 = slot7.SHIPINFO
			slot8 = {
				shipId = slot1
			}
			slot10 = slot3
			slot9 = slot3.getShips
			slot9 = slot9(slot10)
			slot8.shipVOs = slot9

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	slot2(slot3, slot4, slot5)

	slot2 = getProxy
	slot3 = PlayerProxy
	slot2 = slot2(slot3)
	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.setPlayerInfo
	slot6 = slot2
	slot5 = slot2.getData

	slot3(slot4, slot5(slot6))

	slot3 = slot0.contextData
	slot3 = slot3.shamChapter
	slot4 = slot0.viewComponent
	slot5 = slot4
	slot4 = slot4.updateChapter
	slot6 = slot3

	slot4(slot5, slot6)

	slot4 = slot3.active

	if not slot4 then
		slot4 = slot0.contextData
		slot4 = slot4.confirmed

		if slot4 then
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.displayFormation

			slot4(slot5)
		else
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.displayFleetPanel

			slot4(slot5)
		end
	end
end

slot0.register = slot1

function slot1(slot0)
	slot1 = {}
	slot2 = PlayerProxy
	slot2 = slot2.UPDATED
	slot1[1] = slot2
	slot2 = ChapterProxy
	slot2 = slot2.SHAM_CHAPTER_UPDATED
	slot1[2] = slot2
	slot2 = GAME
	slot2 = slot2.SHAM_ENTER_DONE
	slot1[3] = slot2
	slot2 = GAME
	slot2 = slot2.SHAM_OP_DONE
	slot1[4] = slot2
	slot2 = GAME
	slot2 = slot2.SHAM_ENTER_ERROR
	slot1[5] = slot2

	return slot1
end

slot0.listNotificationInterests = slot1

function slot1(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getName
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.getBody
	slot3 = slot3(slot4)
	slot4 = PlayerProxy
	slot4 = slot4.UPDATED

	if slot2 == slot4 then
		slot4 = getProxy
		slot5 = PlayerProxy
		slot4 = slot4(slot5)
		slot5 = slot0.viewComponent
		slot6 = slot5
		slot5 = slot5.setPlayerInfo
		slot8 = slot4
		slot7 = slot4.getData

		slot5(slot6, slot7(slot8))
	else
		slot4 = GAME
		slot4 = slot4.SHAM_ENTER_DONE

		if slot2 == slot4 then
			slot4 = slot0.viewComponent
			slot5 = slot4
			slot4 = slot4.emit
			slot6 = BaseUI
			slot6 = slot6.ON_CLOSE

			slot4(slot5, slot6)
		else
			slot4 = GAME
			slot4 = slot4.SHAM_ENTER_ERROR

			if slot2 == slot4 then
				if slot3 == 3 then
					slot5 = slot0
					slot4 = slot0.display

					slot4(slot5)
				end
			else
				slot4 = GAME
				slot4 = slot4.SHAM_OP_DONE

				if slot2 == slot4 then
					slot4 = slot3.type
					slot5 = ChapterConst
					slot5 = slot5.OpStrategy

					if slot4 ~= slot5 then
						slot4 = slot3.type
						slot5 = ChapterConst
						slot5 = slot5.OpRepair

						if slot4 ~= slot5 then
							slot4 = slot3.type
							slot5 = ChapterConst
							slot5 = slot5.OpRequest

							if slot4 == slot5 then
								slot5 = slot0
								slot4 = slot0.display

								slot4(slot5)
							end
						end
					end
				end
			end
		end
	end
end

slot0.handleNotification = slot1

function slot1(slot0)
	slot1 = getProxy
	slot2 = ChapterProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.getShamChapter
	slot2 = slot2(slot3)
	slot3 = slot0.contextData
	slot3.shamChapter = slot2
	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.updateChapter
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = slot0.viewComponent
	slot4 = slot3
	slot3 = slot3.displayFormation

	slot3(slot4)
end

slot0.display = slot1

function slot1(slot0, slot1)
	slot2 = getProxy
	slot3 = ChapterProxy
	slot2 = slot2(slot3)
	slot4 = slot2
	slot3 = slot2.getShamChapter
	slot3 = slot3(slot4)
	slot4 = slot0.contextData
	slot4 = slot4.shamChapter
	slot5 = nil

	function slot6()
		slot0 = coroutine
		slot0 = slot0.status
		slot1 = slot0
		slot0 = slot0(slot1)

		if slot0 == "suspended" then
			slot0 = coroutine
			slot0 = slot0.resume
			slot1 = slot0
			slot0, slot1 = slot0(slot1)
		end
	end

	slot7 = coroutine
	slot7 = slot7.create

	function slot8()
		slot0 = slot0
		slot0 = slot0.fleet
		slot1 = slot0
		slot0 = slot0.getShipIds
		slot0 = slot0(slot1)
		slot1 = slot1
		slot1 = slot1.active

		if slot1 then
			slot1 = slot0
			slot1 = slot1.fleet
			slot2 = slot1
			slot1 = slot1.isFormationDiffWith
			slot3 = slot1
			slot3 = slot3.fleet
			slot1 = slot1(slot2, slot3)

			if slot1 then
				slot1 = slot2
				slot2 = slot1
				slot1 = slot1.sendNotification
				slot3 = GAME
				slot3 = slot3.SHAM_CHANGE_FORMATION
				slot4 = {
					fleetShipIds = slot0
				}
				slot5 = slot3
				slot4.callback = slot5

				slot1(slot2, slot3, slot4)

				slot1 = coroutine
				slot1 = slot1.yield

				slot1()

				slot1 = slot4
				slot2 = slot1
				slot1 = slot1.getShamChapter
				slot1 = slot1(slot2)
				slot1 = slot1
			end
		else
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateFriendShip
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.getFriendShip

			slot1(slot2, slot3(slot4))

			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateRawShips
			slot3 = slot0
			slot4 = slot3
			slot3 = slot3.getRawShips

			slot1(slot2, slot3(slot4))

			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.updateFleetShips
			slot3 = slot0

			slot1(slot2, slot3)

			slot1 = slot4
			slot2 = slot1
			slot1 = slot1.updateShamChapter
			slot3 = slot1

			slot1(slot2, slot3)

			slot1 = slot4
			slot2 = slot1
			slot1 = slot1.localSaveShamChapter

			slot1(slot2)
		end

		slot1 = slot5

		if slot1 then
			slot1 = slot5

			slot1()
		end
	end

	slot7 = slot7(slot8)
	slot5 = slot7
	slot7 = slot6

	slot7()
end

slot0.save = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shamChapter
	slot3 = slot1
	slot2 = slot1.isOpen
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = pg
		slot2 = slot2.TipsMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.ShowTips
		slot4 = i18n
		slot5 = "common_activity_not_start"

		slot2(slot3, slot4(slot5))
	else
		slot3 = slot1
		slot2 = slot1.isValid
		slot2 = slot2(slot3)

		if not slot2 then
			slot2 = pg
			slot2 = slot2.TipsMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.ShowTips
			slot4 = i18n
			slot5 = "sham_team_limit"

			slot2(slot3, slot4(slot5))
		else
			slot2 = slot1.fleet
			slot3 = slot2
			slot2 = slot2.isValid
			slot2 = slot2(slot3)

			if not slot2 then
				slot2 = pg
				slot2 = slot2.TipsMgr
				slot2 = slot2.GetInstance
				slot2 = slot2()
				slot3 = slot2
				slot2 = slot2.ShowTips
				slot4 = i18n
				slot5 = "sham_formation_invalid"

				slot2(slot3, slot4(slot5))
			else
				slot2 = slot1.id

				if not slot2 then
					slot3 = ChapterConst
					slot3 = slot3.ActivateMirror

					if slot3 then
						slot3 = ChapterConst
						slot2 = slot3.MirrorShamId
					else
						slot2 = pg.sim_battle_template[slot1.simId] and pg.sim_battle_template[slot1.simId].sham_chapter_id
					end
				end

				if not slot2 then
					return
				end

				slot3 = slot1.active

				if slot3 then
					slot4 = slot0
					slot3 = slot0.save

					function slot5()
						slot0 = slot0
						slot0 = slot0.fleet
						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.getChapterCell
						slot3 = slot0.line
						slot3 = slot3.row
						slot4 = slot0.line
						slot4 = slot4.column
						slot1 = slot1(slot2, slot3, slot4)
						slot1slot2 = slot1.attachment
						slot3 = ChapterConst
						slot3 = slot3.AttachRival
						slot2 == slot3slot1.flag == 0slot3 = slot1
						slot4 = slot3
						slot3 = slot3.sendNotification
						slot5 = GAME
						slot5 = slot5.BEGIN_STAGE
						slot6 = {}
						slot7 = SYSTEM_SHAM
						slot6.system = slot7

						slot3(slot4, slot5, slot6)

						slot3 = slot1
						slot4 = slot3
						slot3 = slot3.save

						function slot5()
							slot0 = slot0
							slot0 = slot0.viewComponent
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = BaseUI
							slot2 = slot2.ON_CLOSE

							slot0(slot1, slot2)

							return
						end

						slot3(slot4, slot5)

						return
					end

					slot3(slot4, slot5)
				else
					slot3 = _
					slot3 = slot3.keys
					slot5 = slot1
					slot4 = slot1.getRawShips
					slot3 = slot3(slot4(slot5))
					slot4 = slot1.fleet
					slot5 = slot4
					slot4 = slot4.getShipIds
					slot4 = slot4(slot5)
					slot5 = 0
					slot6 = 0
					slot8 = slot1
					slot7 = slot1.getFriendShip
					slot7 = slot7(slot8)

					if slot7 then
						slot8 = getProxy
						slot9 = PlayerProxy
						slot8 = slot8(slot9)
						slot9 = slot8.playerAssists
						slot10 = pairs
						slot11 = slot9
						slot10, slot11, slot12 = slot10(slot11)

						for slot13, slot14 in slot10, slot11, slot12 do
							slot15 = slot14.ship
							slot15slot15 = slot14.ship
							slot15 = slot15.id
							slot16 = slot7.id
							slot15 == slot16slot5 = slot13
							slot6 = slot7.id

							break
						end
					end

					function slot8()
						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.sendNotification
						slot2 = GAME
						slot2 = slot2.SHAM_ENTER
						slot3 = {}
						slot4 = slot1
						slot3.id = slot4
						slot4 = slot2
						slot3.group_id_list = slot4
						slot4 = slot3
						slot3.formation_list = slot4
						slot4 = slot4
						slot3.friend_id = slot4
						slot4 = slot5
						slot3.friend_ship_id = slot4

						slot0(slot1, slot2, slot3)

						return
					end

					slot9 = 0

					if slot5 > slot9 then
						slot9 = slot8

						slot9()
					else
						slot9 = pg
						slot9 = slot9.MsgboxMgr
						slot9 = slot9.GetInstance
						slot9 = slot9()
						slot10 = slot9
						slot9 = slot9.ShowMsgBox
						slot11 = {
							hideNo = false
						}
						slot12 = i18n
						slot13 = "sham_friend_ship_tip"
						slot12 = slot12(slot13)
						slot11.content = slot12
						slot11.onYes = slot8

						slot9(slot10, slot11)
					end
				end
			end
		end
	end
end

slot0.enter = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.sendNotification
	slot3 = GAME
	slot3 = slot3.SHAM_OP
	slot4 = {}
	slot5 = ChapterConst
	slot5 = slot5.OpRetreat
	slot4.type = slot5

	slot1(slot2, slot3, slot4)

	return
end

slot0.reset = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = slot0.contextData
	slot4 = slot4.shamChapter
	slot5 = {
		inSham = false,
		inChapter = false,
		inAdmiral = false,
		inFleet = false,
		inClass = false,
		inEvent = false,
		inTactics = false,
		inBackyard = false
	}
	slot6 = nil

	function slot7()
		slot0 = coroutine
		slot0 = slot0.status
		slot1 = slot0
		slot0 = slot0(slot1)
		slot0 == "suspended"slot0 = coroutine
		slot0 = slot0.resume
		slot1 = slot0
		slot0, slot1 = slot0(slot1)

		return
	end

	slot8 = coroutine
	slot8 = slot8.create

	function slot9()
		slot0, slot1, slot2, slot3, slot4 = nil
		slot5 = slot0
		slot5 == 0slot5 = slot1
		slot6 = slot5
		slot5 = slot5.getShips
		slot7 = true
		slot5 = slot5(slot6, slot7)
		slot0 = slot5
		slot5 = #slot0
		slot6 = 1
		slot7 = -1

		for slot8 = slot5, slot6, slot7 do
			slot9 = slot0[slot8]
			slot9 = slot9.hpRant
			slot10 = 0
			slot9 <= slot10slot9 = table
			slot9 = slot9.remove
			slot10 = slot0
			slot11 = slot8

			slot9(slot10, slot11)

			slot9 = slot1
			slot9 = slot9.fleet
			slot10 = slot9
			slot9 = slot9.containsShip
			slot11 = slot0[slot8]
			slot11 = slot11.id
			slot9 = slot9(slot10, slot11)
			slot9slot9 = slot0[slot8]
			slot10 = true
			slot9.shamInFleet = slot10
		end

		slot5 = slot2
		slot5slot5 = {}
		slot6 = slot2
		slot6 = slot6.id
		slot5[1] = slot6
		not slot5slot1 = {}
		slot2 = 1
		slot3 = 1
		slot4 = true
		slot5 = slot0
		slot5 == 1slot5 = slot1
		slot6 = slot5
		slot5 = slot5.getShips
		slot5 = slot5(slot6)
		slot6 = _
		slot7 = slot5
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.chain
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.filter

		function slot8(slot0)
			slot2 = slot0
			slot1 = slot0.getTeamType
			slot1 = slot1(slot2)
			slot2 = slot0
			slot1 ~= slot2slot1 = false
			slot1 = true

			return slot1
		end

		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.map

		function slot8(slot0)
			slot1 = slot0.id

			return slot1
		end

		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.value
		slot6 = slot6(slot7)
		slot1 = slot6
		slot2 = 0
		slot6 = math
		slot6 = slot6.min
		slot7 = ChapterConst
		slot7 = slot7.ShamShipLimit
		slot8 = #slot5
		slot9 = #slot1
		slot8 = slot8 - slot9
		slot7 = slot7 - slot8
		slot8 = ChapterConst
		slot8 = slot8.ShamTeamShipLimit
		slot6 = slot6(slot7, slot8)
		slot3 = slot6
		slot6 = getProxy
		slot7 = BayProxy
		slot6 = slot6(slot7)
		slot8 = slot6
		slot7 = slot6.getData
		slot7 = slot7(slot8)
		slot8 = _
		slot8 = slot8.filter
		slot9 = _
		slot9 = slot9.values
		slot10 = slot7
		slot9 = slot9(slot10)

		function slot10(slot0)
			slot2 = slot0
			slot1 = slot0.getTeamType
			slot1 = slot1(slot2)
			slot2 = slot0
			slot1 ~= slot2slot1 = false
			slot1 = true

			return slot1
		end

		slot8 = slot8(slot9, slot10)
		slot0 = slot8
		slot4 = false
		slot5 = slot0
		slot5 == 2slot5 = getProxy
		slot6 = FriendProxy
		slot5 = slot5(slot6)
		slot7 = slot5
		slot6 = slot5.getRawData
		slot6 = slot6(slot7)
		slot7 = getProxy
		slot8 = PlayerProxy
		slot7 = slot7(slot8)
		slot8 = slot7.playerAssists
		slot9 = {}
		slot10 = pairs
		slot11 = slot6
		slot10, slot11, slot12 = slot10(slot11)

		for slot13, slot14 in slot10, slot11, slot12 do
			slot15 = slot8[slot13]
			slot15slot15 = pg
			slot15 = slot15.TimeMgr
			slot15 = slot15.GetInstance
			slot15 = slot15()
			slot16 = slot15
			slot15 = slot15.GetServerTime
			slot15 = slot15(slot16)
			slot16 = slot8[slot13]
			slot16 = slot16.timeStamp
			slot15 = slot15 - slot16
			slot16 = 60
			slot15 > slot16slot15 = table
			slot15 = slot15.insert
			slot16 = slot9
			slot17 = slot13

			slot15(slot16, slot17)
		end

		slot10 = #slot9
		slot11 = 0
		slot10 > slot11slot10 = slot4
		slot11 = slot10
		slot10 = slot10.sendNotification
		slot12 = GAME
		slot12 = slot12.REQ_PLAYER_ASSIST_SHIP
		slot13 = {}
		slot13.playerIds = slot9
		slot14 = Player
		slot14 = slot14.ASSISTS_TYPE_SHAM
		slot13.type = slot14
		slot14 = slot5
		slot13.callback = slot14

		slot10(slot11, slot12, slot13)

		slot10 = coroutine
		slot10 = slot10.yield

		slot10()

		slot0 = {}
		slot10 = pairs
		slot11 = slot8
		slot10, slot11, slot12 = slot10(slot11)

		for slot13, slot14 in slot10, slot11, slot12 do
			slot15 = slot6[slot13]
			slot15slot15 = slot14.ship
			slot15.playerId = slot13
			slot15 = table
			slot15 = slot15.insert
			slot16 = slot0
			slot17 = slot14.ship

			slot15(slot16, slot17)
		end

		slot10 = slot1
		slot11 = slot10
		slot10 = slot10.getFriendShip
		slot10 = slot10(slot11)
		slot10slot11 = {}
		slot12 = slot10.id
		slot11[1] = slot12
		not slot11slot1 = {}
		slot2 = 1
		slot3 = 1
		slot4 = true
		slot5 = slot4
		slot6 = slot5
		slot5 = slot5.getDockCallbackFuncs
		slot7 = slot0
		slot8 = slot2
		slot9 = slot3
		slot5, slot6, slot7 = slot5(slot6, slot7, slot8, slot9)
		slot8 = slot4
		slot9 = slot8
		slot8 = slot8.sendNotification
		slot10 = GAME
		slot10 = slot10.GO_SCENE
		slot11 = SCENE
		slot11 = slot11.DOCKYARD
		slot12 = {}
		slot12.shipVOs = slot0
		slot12.selectedIds = slot1
		slot12.selectedMin = slot2
		slot12.selectedMax = slot3
		slot13 = i18n
		slot14 = "ship_formationMediator_leastLimit"
		slot13 = slot13(slot14)
		slot12.leastLimitMsg = slot13
		slot12.quitTeam = slot4
		slot13 = slot3
		slot12.teamFilter = slot13
		slot13 = i18n
		slot14 = "word_formation"
		slot13 = slot13(slot14)
		slot12.leftTopInfo = slot13
		slot12.onShip = slot5
		slot12.confirmSelect = slot6
		slot12.onSelected = slot7
		slot13 = slot6
		slot12.flags = slot13
		slot13 = slot0
		slot13 = slot13 == 2
		slot12.selectFriend = slot13

		slot8(slot9, slot10, slot11, slot12)

		return

		slot13 = false
		slot13 = true
	end

	slot8 = slot8(slot9)
	slot6 = slot8
	slot8 = slot7

	slot8()

	return
end

slot0.openDockYard = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = slot0.contextData
	slot4 = slot4.shamChapter
	slot5 = slot4.fleet

	function slot6(slot0, slot1, slot2)
		slot3 = slot0
		slot3 == 0slot3 = slot1
		slot3 = slot3.fleet
		slot5 = slot3
		slot4 = slot3.containsShip
		slot6 = slot0.id
		slot4 = slot4(slot5, slot6)
		not slot4slot5 = slot3
		slot4 = slot3.containsSameKind
		slot6 = slot0
		slot4 = slot4(slot5, slot6)
		slot4slot4 = slot2
		slot4slot4 = slot2
		slot5 = slot4
		slot4 = slot4.isSameKind
		slot6 = slot0
		slot4 = slot4(slot5, slot6)
		not slot4slot4 = false
		slot5 = i18n
		slot6 = "event_same_type_not_allowed"

		return slot4, slot5(slot6)

		slot3 = slot0
		slot3 == 1slot3 = slot0.level
		slot4 = ChapterConst
		slot4 = slot4.ShamShipLevelLimit
		slot3 < slot4slot3 = false
		slot4 = i18n
		slot5 = "sham_ship_level_limit"
		slot6 = ChapterConst
		slot6 = slot6.ShamShipLevelLimit

		return slot3, slot4(slot5, slot6)

		slot3 = getProxy
		slot4 = BayProxy
		slot3 = slot3(slot4)
		slot4 = ipairs
		slot5 = slot2
		slot4, slot5, slot6 = slot4(slot5)

		for slot7, slot8 in slot4, slot5, slot6 do
			slot10 = slot3
			slot9 = slot3.getShipById
			slot11 = slot8
			slot9 = slot9(slot10, slot11)
			slot9slot11 = slot0
			slot10 = slot0.isSameKind
			slot12 = slot9
			slot10 = slot10(slot11, slot12)
			slot10slot10 = false
			slot11 = i18n
			slot12 = "event_same_type_not_allowed"

			return slot10, slot11(slot12)
		end

		slot3 = slot0
		slot3 == 2slot3 = slot0.level
		slot4 = ChapterConst
		slot4 = slot4.ShamShipLevelLimit
		slot3 < slot4slot3 = false
		slot4 = i18n
		slot5 = "sham_ship_level_limit"
		slot6 = ChapterConst
		slot6 = slot6.ShamShipLevelLimit

		return slot3, slot4(slot5, slot6)

		slot3 = true

		return slot3
	end

	function slot7(slot0, slot1, slot2)
		slot3 = slot1

		slot3()

		return
	end

	function slot8(slot0)
		slot1 = getProxy
		slot2 = BayProxy
		slot1 = slot1(slot2)
		slot2 = slot0
		slot2 == 0slot2 = nil
		slot3 = slot1
		slot4 = slot3
		slot3 = slot3.getFriendShip
		slot3 = slot3(slot4)
		slot3slot4 = slot3.id
		slot5 = slot0[1]
		slot4 == slot5slot2 = slot3
		slot4 = slot1
		slot5 = slot4
		slot4 = slot4.getShip
		slot6 = slot0[1]
		slot4 = slot4(slot5, slot6)
		slot2 = slot4
		not slot2slot4 = slot2
		slot4slot4 = slot2
		slot5 = slot4
		slot4 = slot4.getTeamType
		slot4 = slot4(slot5)
		slot5 = slot1
		slot5 = slot5.active
		slot5slot5 = slot3
		slot5 = slot5[slot4]
		slot5 = #slot5
		slot5 == 1slot5 = pg
		slot5 = slot5.TipsMgr
		slot5 = slot5.GetInstance
		slot5 = slot5()
		slot6 = slot5
		slot5 = slot5.ShowTips
		slot7 = i18n
		slot8 = "ship_formationUI_removeError_onlyShip"
		slot9 = slot2
		slot10 = slot9
		slot9 = slot9.getName
		slot9 = slot9(slot10)
		slot10 = ""
		slot11 = Fleet
		slot11 = slot11.C_TEAM_NAME
		slot11 = slot11[slot4]

		slot5(slot6, slot7(slot8, slot9, slot10, slot11))

		slot5 = slot3
		slot6 = slot5
		slot5 = slot5.removeShip
		slot7 = slot2
		slot7 = slot7.id

		slot5(slot6, slot7)

		slot4 = slot2
		slot4slot4 = slot3
		slot5 = slot4
		slot4 = slot4.containsShip
		slot6 = slot2.id
		slot4 = slot4(slot5, slot6)
		slot4slot4 = slot3
		slot5 = slot4
		slot4 = slot4.switchShip
		slot6 = slot2
		slot6 = slot6.id
		slot7 = slot2.id

		slot4(slot5, slot6, slot7)

		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.replaceShip
		slot6 = slot2
		slot6 = slot6.id
		slot7 = {}
		slot8 = slot2.id
		slot7.id = slot8
		slot8 = slot2.hpRant
		slot7.hp_rant = slot8
		slot8 = slot2.strategies
		slot7.strategies = slot8

		slot4(slot5, slot6, slot7)

		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.addShip
		slot6 = {}
		slot7 = slot2.id
		slot6.id = slot7
		slot7 = slot2.hpRant
		slot6.hp_rant = slot7
		slot7 = slot2.strategies
		slot6.strategies = slot7

		slot4(slot5, slot6)

		slot2 = slot0
		slot2 == 1slot2 = slot1
		slot2 = slot2.active
		not slot2slot2 = {}
		slot3 = _
		slot3 = slot3.each
		slot4 = slot0

		function slot5(slot0)
			slot1 = slot0
			slot2 = {
				hp_rant = 10000
			}
			slot2.id = slot0
			slot3 = {}
			slot2.strategies = slot3
			slot1[slot0] = slot2

			return
		end

		slot3(slot4, slot5)

		slot3 = slot1
		slot4 = slot3
		slot3 = slot3.updateRawShipsByTeam
		slot5 = slot2
		slot6 = slot4

		slot3(slot4, slot5, slot6)

		slot3 = _
		slot3 = slot3.each
		slot4 = _
		slot4 = slot4.keys
		slot5 = slot3
		slot5 = slot5.ships
		slot4 = slot4(slot5)

		function slot5(slot0)
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.containsShip
			slot3 = slot0
			slot1 = slot1(slot2, slot3)
			not slot1slot1 = slot1
			slot2 = slot1
			slot1 = slot1.removeShip
			slot3 = slot0

			slot1(slot2, slot3)

			return
		end

		slot3(slot4, slot5)

		slot2 = slot0
		slot2 == 2slot2 = slot1
		slot2 = slot2.active
		not slot2slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getFriendShip
		slot2, slot3 = slot2(slot3)
		slot4 = getProxy
		slot5 = PlayerProxy
		slot4 = slot4(slot5)
		slot5 = slot4.playerAssists
		slot6 = pairs
		slot7 = slot5
		slot6, slot7, slot8 = slot6(slot7)

		for slot9, slot10 in slot6, slot7, slot8 do
			slot11 = slot10.ship
			slot11slot11 = slot10.ship
			slot11 = slot11.id
			slot12 = slot0[1]
			slot11 == slot12slot11 = Clone
			slot12 = slot10.ship
			slot11 = slot11(slot12)
			slot3 = slot11
			slot11 = 10000
			slot3.hpRant = slot11
			slot11 = {}
			slot3.strategies = slot11

			break
		end

		slot6 = slot1
		slot7 = slot6
		slot6 = slot6.updateFriendShip
		slot8 = slot3

		slot6(slot7, slot8)

		slot2slot6 = slot3
		slot7 = slot6
		slot6 = slot6.containsShip
		slot8 = slot2.id
		slot6 = slot6(slot7, slot8)
		slot6slot3slot6 = slot3
		slot7 = slot6
		slot6 = slot6.replaceShip
		slot8 = slot2.id
		slot9 = {}
		slot10 = slot3.id
		slot9.id = slot10
		slot10 = slot3.hpRant
		slot9.hp_rant = slot10
		slot10 = slot3.strategies
		slot9.strategies = slot10

		slot6(slot7, slot8, slot9)

		slot6 = slot3
		slot7 = slot6
		slot6 = slot6.removeShip
		slot8 = slot2.id

		slot6(slot7, slot8)

		return
	end

	slot9 = slot6
	slot10 = slot7
	slot11 = slot8

	return slot9, slot10, slot11
end

slot0.getDockCallbackFuncs = slot1

return slot0
