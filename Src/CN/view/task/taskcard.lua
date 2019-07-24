slot0 = class("TaskCard")
slot1 = 0
slot2 = 1
slot3 = 2
slot4 = 3
slot5 = 0.3

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot0._go)
	slot0.viewComponent = slot2
	slot0.descTxt = slot0._tf:Find("frame/desc"):GetComponent(typeof(Text))
	slot0.tagTF = slot0._tf:Find("frame/tag")
	slot0.rewardPanel = slot0._tf:Find("frame/awards")
	slot0._rewardModel = slot0.rewardPanel:GetChild(0)
	slot0.progressBar = slot0._tf:Find("frame/slider"):GetComponent(typeof(Slider))
	slot0.progressNum = slot0._tf:Find("frame/slider/Text"):GetComponent(typeof(Text))
	slot0.GotoBtn = slot0._tf:Find("frame/go_btn")
	slot0.GetBtn = slot0._tf:Find("frame/get_btn")
	slot0.storyIconFrame = slot0._tf:Find("frame/storyIcon")
	slot0.storyIcon = slot0._tf:Find("frame/storyIcon/icon")
	slot0.frame = slot0._tf:Find("frame")
	slot0._modelWidth = slot0.frame.rect.width + 100
	slot0.finishBg = slot0._tf:Find("frame/finish_bg")
	slot0.unfinishBg = slot0._tf:Find("frame/unfinish_bg")
	slot0.tip = slot0._tf:Find("frame/tip")
	slot0.cg = GetOrAddComponent(slot0._tf, "CanvasGroup")
end

function slot0.update(slot0, slot1)
	slot0.taskVO = slot1

	if slot1.id == 10302 then
		slot0._go.name = slot1.id
	end

	slot0.descTxt.text = HXSet.hxLan(slot1:getConfig("desc"))

	slot0.viewComponent:setSpriteTo("taskTagOb/" .. slot1:getConfig("type"), slot0.tagTF)

	slot2 = slot1:getConfig("target_num")

	slot0:updateAwards(slot1)

	slot3 = slot1:getProgress()

	if slot1:isFinish() then
		slot0.progressNum.text = "COMPLETE"
	elseif slot1:getConfig("sub_type") == 1012 then
		slot0.progressNum.text = math.floor(slot3 / 100) .. "/" .. math.floor(slot2 / 100)
	else
		slot0.progressNum.text = slot3 .. "/" .. slot2
	end

	slot0.progressBar.value = slot3 / slot2

	slot0:updateBtnState(slot1)
	setActive(slot0.storyIconFrame, slot1:getConfig("story_id") and slot4 ~= "")

	if slot4 and slot4 ~= "" then
		if not slot1:getConfig("story_icon") or slot5 == "" then
			slot5 = "task_icon_default"
		end

		LoadSpriteAsync("shipmodels/" .. slot5, function (slot0)
			if slot0 then
				setImageSprite(slot0.storyIcon, slot0, true)
			end
		end)
		onButton(slot0, slot0.storyIconFrame, function ()
			pg.StoryMgr.GetInstance():Play(pg.StoryMgr.GetInstance().Play, nil, true)
		end, SFX_PANEL)
	else
		removeOnButton(slot0.storyIconFrame)
	end

	slot0.cg.alpha = 1

	setActive(slot0.frame, true)
end

function slot0.updateBtnState(slot0, slot1)
	slot2 = slot0

	removeOnButton(slot0.GotoBtn)
	removeOnButton(slot0.GetBtn)

	if slot1:isFinish() then
		slot2 = (slot1:isReceive() and slot1) or slot2

		onButton(slot0, slot0.GetBtn, function ()
			function slot0()
				if not slot0.isClick then
					slot0.isClick = true

					LeanTween.alphaCanvas(slot0.cg, 0, LeanTween.alphaCanvas):setFrom(1)
					LeanTween.value(go(slot0.frame), slot0.frame.localPosition.x, slot0.frame.localPosition.x + slot0._modelWidth, LeanTween.value):setOnUpdate(System.Action_float(function (slot0)
						slot0.frame.transform.localPosition = Vector3(slot0, slot1.y, slot1.z)
					end)):setOnComplete(System.Action(function ()
						slot0.frame.transform.localPosition = slot1

						setActive(slot0.frame, false)

						setActive.isClick = nil

						setActive.viewComponent:onSubmit(false)
					end))
				end
			end

			function slot3()
				function slot0.choice.onYes()
					if not slot0.index then
						pg.TipsMgr:GetInstance():ShowTips("未选择奖励,放弃领取")

						return
					end

					if slot1.overFlow then
						slot2()
					else
						slot3()
					end

					return
				end

				pg.MsgboxMgr:GetInstance():ShowMsgBox(slot0.choice)

				return
			end

			function slot4()
				function slot0.sub.onYes()
					if slot0.choice then
						slot1()
					else
						if slot0.overFlow then
							slot2()
						else
							slot3()
						end
					end

					return
				end

				pg.MsgboxMgr:GetInstance():ShowMsgBox(slot0.sub)

				return
			end

			if function ()
				function slot0.overFlow.onYes()
					slot0()

					return
				end

				pg.MsgboxMgr:GetInstance():ShowMsgBox(slot0.overFlow)

				return
			end:getConfirmSetting().sub then
				slot4()
			else
				if slot1.choice then
					slot3()
				else
					if slot1.overFlow then
						slot2()
					else
						slot0()
					end
				end
			end
		end, SFX_PANEL)
	else
		slot2 = slot4

		onButton(slot0, slot0.GotoBtn, function ()
			slot0.viewComponent:onGo(slot0.viewComponent)

			return
		end, SFX_PANEL)
	end

	SetActive(slot4, slot2 == slot0.GotoBtn)
	SetActive(slot0.GetBtn, slot2 == slot2)
	setActive(slot0.finishBg, slot2 == slot2 or slot2 == slot1)
	setActive(slot0.unfinishBg, slot2 ~= slot2 and slot2 ~= BTN_STATE_FETC)
	setActive(slot0.tip, slot2 == slot2 or slot2 == slot1)
end

function slot0.updateAwards(slot0, slot1)
	for slot7 = slot0.rewardPanel.childCount, #_.slice(slot1:getConfig("award_display"), 1, 3) - 1, 1 do
		cloneTplTo(slot0._rewardModel, slot0.rewardPanel)
	end

	for slot7 = 1, slot0.rewardPanel.childCount, 1 do
		setActive(slot0.rewardPanel:GetChild(slot7 - 1), slot7 <= #slot2)

		if slot9 then
			updateDrop(slot8, {
				type = slot2[slot7][1],
				id = slot2[slot7][2],
				count = slot2[slot7][3]
			})
		end
	end

	return
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)

	return
end

return slot0
