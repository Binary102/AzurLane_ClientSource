slot0 = class("HitMonsterNianLayer", import("..base.BaseUI"))
slot1 = 1
slot2 = 0.1
slot3 = 1

function slot4(slot0)
	return {
		_go = slot0.go,
		animator = ()["_go"]:GetComponent(typeof(Animator)),
		playAnim = function (slot0, slot1, slot2)
			slot0.animator:SetTrigger(slot1)
			slot0:updateHp(slot2)
		end,
		updateHp = function (slot0, slot1)
			slot0.animator:SetInteger("hp", slot1)
		end,
		dispose = function (slot0)
			return
		end
	}
end

function slot5(slot0)
	return {
		_go = slot0,
		animator = slot0:GetComponent(typeof(Animator)),
		playAnim = function (slot0, slot1, slot2)
			slot0.animator:SetTrigger(slot1)
			slot0:updateMonsterHp(slot2)
		end,
		updateMonsterHp = function (slot0, slot1)
			slot0.animator:SetInteger("hp", slot1)
		end,
		dispose = function (slot0)
			return
		end
	}
end

function slot6(slot0)
	setActive(({
		_go = slot0,
		protagonistGo = ()["_go"]:Find("bg/role"),
		monsterGo = ()["_go"]:Find("bg/monster"),
		hpTF = ()["_go"]:Find("bg/hp"):GetComponent(typeof(Slider)),
		attackTF = ()["_go"]:Find("bg/attack_count/Text"):GetComponent(typeof(Text)),
		curtainTF = ()["_go"]:Find("bg/stage"),
		startLabel = ()["_go"]:Find("bg/stage/start_label"),
		actionTF = ()["_go"]:Find("bg/actions"),
		actionStr = "",
		actionsTF = {
			()["_go"]:Find("bg/actions/content/1"),
			()["_go"]:Find("bg/actions/content/2"),
			()["_go"]:Find("bg/actions/content/3")
		},
		actions = {
			{
				"AAA",
				"isAttack1",
				"isAttack"
			},
			{
				"AAB",
				"isAttack2",
				"isAttack"
			},
			{
				"ABA",
				"isAttack3",
				"isAttack"
			},
			{
				"ABB",
				"isAttack4",
				"isAttack"
			},
			{
				"BBB",
				"isAttack5",
				"isAttack"
			},
			{
				"BAB",
				"isAttack6",
				"isAttack"
			},
			{
				"BBA",
				"isAttack7",
				"isAttack"
			},
			{
				"BAA",
				"isAttack3",
				"isAttack"
			}
		},
		init = function (slot0, slot1)
			slot0.monsterVO = slot0({
				go = slot0.monsterGo
			})
			slot0.protagonistVO = slot1(slot0.protagonistGo)

			slot0:update(slot1)
		end,
		start = function (slot0, slot1)
			setActive(slot0.curtainTF, true)

			if slot0:isEnd() or not slot0:isShowAnim() then
				setActive(slot0.curtainTF, false)
				slot1()
			else
				LeanTween.color(slot0.curtainTF, Color.white, slot0):setFromColor(Color.black):setOnComplete(System.Action(function ()
					setActive(slot0.startLabel, true)
					blinkAni(slot0.startLabel, , 2):setOnComplete(System.Action(function ()
						LeanTween.alpha(slot0.curtainTF, 0, ):setFrom(1)
						LeanTween.alpha(slot0.startLabel, 0, ):setFrom(1):setOnComplete(System.Action(System.Action))
					end))
				end))
				slot0:setPlayAnimFlag()
			end
		end,
		update = function (slot0, slot1, slot2)
			slot4 = slot1:getDataConfig("hp")
			slot0.stageVO = {
				leftAttackCnt = (slot0.isFake and slot1.data2) or slot1:getCountForHitMonster(),
				preHp = (slot0.stageVO and slot0.stageVO.hp) or math.max(slot4 - slot1.data3, 0),
				hp = math.max(slot4 - slot1.data3, 0),
				maxHp = slot4,
				storys = slot1:getDataConfig("story")
			}

			slot0:play(slot2)
		end,
		receiveAction = function (slot0, slot1, slot2)
			if slot0:isEnd() or slot0.inAnim then
				return
			end

			slot0:removeTimer()

			slot0.timer = Timer.New(function ()
				slot0:updateActionStr("")
				slot0.updateActionStr:removeTimer()
			end, 1.5, 1)

			slot0.timer:Start()
			slot0:updateActionStr(slot0.actionStr .. slot1)

			if _.detect(slot0.actions, function (slot0)
				return slot0[1] == slot0.actionStr
			end) and slot2 then
				slot2(slot3[2], slot3[3])
			end
		end,
		updateActionStr = function (slot0, slot1)
			slot0.actionStr = slot1

			if slot1 and slot1 ~= "" then
				for slot6, slot7 in pairs(slot0.actionsTF) do
					setActive(slot7:Find("a"), (string.sub(slot0.actionStr, slot6, slot6) or "") == "A")
					setActive(slot7:Find("b"), (string.sub(slot0.actionStr, slot6, slot6) or "") == "B")
				end
			end

			setActive(slot0.actionTF, slot2)
		end,
		play = function (slot0, slot1)
			slot0.inAnim = true
			slot2 = slot0.stageVO

			function slot3(slot0)
				LeanTween.value(slot1.hpTF.gameObject, slot1, slot2, 0.3):setOnUpdate(System.Action_float(function (slot0)
					slot0.hpTF.value = slot0
				end)):setOnComplete(System.Action(function ()
					slot0.attackTF.text = slot1.leftAttackCnt
					slot0.attackTF.inAnim = false

					slot0.attackTF:triggerStory(slot2)
				end))
			end

			if slot1 then
				slot0.protagonistVO:playAnim(slot4, slot2.hp)
				slot0.monsterVO:playAnim(slot5, slot2.hp)

				slot0.animTimer = Timer.New(function ()
					slot0.animTimer:Stop()

					slot0.animTimer.Stop.animTimer = nil

					nil(slot2.callback)

					return
				end, 2, 1)

				slot0.animTimer:Start()
			else
				slot0.protagonistVO:updateMonsterHp(slot2.hp)
				slot0.monsterVO:updateHp(slot2.hp)
				slot3(nil)
			end
		end,
		removeTimer = function (slot0)
			if slot0.timer then
				slot0.timer:Stop()

				slot0.timer = nil
			end

			return
		end,
		isShowAnim = function (slot0)
			return tonumber(PlayerPrefs.GetString("HitMonsterNianLayer" .. getProxy(PlayerProxy):getRawData().id, "0")) < pg.TimeMgr.GetInstance():GetServerTime()
		end,
		setPlayAnimFlag = function (slot0)
			PlayerPrefs.SetString("HitMonsterNianLayer" .. getProxy(PlayerProxy):getRawData().id, GetZeroTime())
			PlayerPrefs.Save()

			return
		end,
		isEnd = function (slot0)
			return slot0.stageVO.hp <= 0
		end,
		restart = function (slot0, slot1)
			slot0.isFake = true

			slot0:update(slot1)

			return
		end,
		isEnable = function (slot0)
			return slot0.stageVO.leftAttackCnt > 0
		end,
		triggerStory = function (slot0, slot1)
			slot1 = slot1 or function ()
				return
			end
			slot2 = false
			slot4 = pg.StoryMgr:GetInstance()

			if type(slot0.stageVO.storys) == "table" then
				for slot8, slot9 in pairs(slot3) do
					slot11 = slot9[2]

					if slot0.stageVO.hp <= slot9[1] and not slot4:IsPlayed(slot11) then
						slot2 = true

						slot4:Play(slot11, slot1)

						break
					end
				end
			end

			if not slot2 then
				slot1()
			end

			return
		end,
		dispose = function (slot0)
			slot0:removeTimer()
			slot0.monsterVO:dispose()
			slot0.protagonistVO:dispose()

			if slot0.animTimer then
				slot0.animTimer:Stop()

				slot0.animTimer = nil
			end

			slot0.stageVO = nil

			return
		end
	})["actionTF"], false)

	return 
end

function slot0.getUIName(slot0)
	return "HitMonsterNianUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activityVO = Clone(slot1)

	if slot0.onActivityUpdate then
		slot0.onActivityUpdate()

		slot0.onActivityUpdate = nil
	end

	return
end

function slot0.init(slot0)
	slot0.attackA = slot0._tf:Find("bg/a_attack_btn")
	slot0.attackB = slot0._tf:Find("bg/b_attack_btn")

	return
end

function slot0.didEnter(slot0)
	slot0.triggers = {}
	slot0.stage = slot0(slot0._tf)

	slot0.stage:init(slot0.activityVO)

	slot1 = nil

	function slot2(slot0, slot1)
		seriesAsync({
			function (slot0)
				slot0.onActivityUpdate = slot0

				if slot0.stage.isFake then
					slot0:emit(HitMonsterNianMediator.ON_FAKE_HIT)
				else
					slot0:emit(HitMonsterNianMediator.ON_HIT)
				end

				return
			end,
			function (slot0)
				slot0.stage:update(slot0.activityVO, {
					action = slot1,
					action1 = slot0.stage,
					callback = slot0
				})

				return
			end,
			function (slot0)
				if not slot0.stage:isEnable() then
					slot1()
				end

				slot0()

				return
			end,
			function (slot0)
				if slot0.contextData.onAaward then
					slot0.contextData.onAaward()

					slot0.contextData.onAaward = nil
				end

				slot0()

				return
			end
		})

		return
	end

	slot0.stage:start(function ()
		slot0:clearEvents()
		slot0.clearEvents:reigsterEvent(slot0.attackA, function ()
			slot0.stage:receiveAction("A", slot0.stage)

			return
		end)
		slot0.clearEvents.reigsterEvent:reigsterEvent(slot0.attackB, function ()
			slot0.stage:receiveAction("B", slot0.stage)

			return
		end)

		return
	end)

	return
end

function slot0.reigsterEvent(slot0, slot1, slot2)
	slot3 = slot1:Find("deactive")
	slot4 = slot0.activityVO
	slot5 = slot0.stage:isEnable()
	slot6 = GetOrAddComponent(slot1, typeof(EventTriggerListener))

	slot6:AddPointDownFunc(function (slot0, slot1)
		if slot0 then
			setActive(slot1, false)
		end

		return
	end)
	slot6:AddPointUpFunc(function (slot0, slot1)
		if slot0.stage:isEnd() then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("activity_hit_monster_reset_tip"),
				onYes = function ()
					slot0.data2 = 100
					slot0.data3 = 0

					slot1.stage:restart(slot1.stage.restart)
					slot1.stage:setActivity(slot1.stage.setActivity)

					return
				end
			})
			setActive(setActive, true)
		else
			if slot3 then
				setActive(setActive, true)

				if true then
					slot4()
				end
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("activity_hit_monster_nocount"))
			end
		end

		return
	end)
	table.insert(slot0.triggers, slot6)

	return
end

function slot0.clearEvents(slot0)
	for slot4, slot5 in ipairs(slot0.triggers) do
		ClearEventTrigger(slot5)
	end

	return
end

function slot0.willExit(slot0)
	slot0:clearEvents()
	slot0.stage:dispose()

	return
end

return slot0
