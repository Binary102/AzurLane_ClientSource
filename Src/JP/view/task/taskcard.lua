slot0 = class("TaskCard")
slot1 = 0
slot2 = 1
slot3 = 2
slot4 = 3
slot5 = 0.5

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot0._go)
	slot0.viewComponent = slot2
	slot0.leftPanel = slot0._tf:Find("frame/left_panel")
	slot0.nameTxt = slot0.leftPanel:Find("task_name"):GetComponent(typeof(Text))
	slot0.descTxt = slot0.leftPanel:Find("task_desc"):GetComponent(typeof(Text))
	slot0.tagTF = slot0.leftPanel:Find("task_tag")
	slot0.rightPanel = slot0._tf:Find("frame/right_panel")
	slot0.rewardPanel = slot0.rightPanel:Find("rewards_panel")
	slot0._rewardModel = slot0.rewardPanel:GetChild(0)
	slot0.progressFrame = slot0.leftPanel:Find("progress_frame")
	slot0.progressBar = slot0.leftPanel:Find("progress_frame/Fill"):GetComponent(typeof(Slider))
	slot0.progressNum = slot0.leftPanel:Find("progress_frame/label"):GetComponent(typeof(Text))
	slot0.finishTag = slot0.rightPanel:Find("GetBtn/finish_tag")

	if not slot0.finishTag then
		slot0.finishTag = slot0.rightPanel:Find("finish_tag")
	end

	slot0.GotoBtn = slot0.rightPanel:Find("GotoBtn")
	slot0.GetBtn = slot0.rightPanel:Find("GetBtn")
	slot0.isGet = slot0.rightPanel:Find("isGet")
	slot0.finishImg = slot0.leftPanel:Find("progress_frame/finish_img")
	slot0.isGetPanel = slot0._tf:Find("frame/isGet_panel")
	slot0.storyIcon = slot0._tf:Find("frame/storyIcon")
	slot0.frame = slot0._tf:Find("frame")
	slot0._modelWidth = slot0.frame.rect.width + 100
end

function slot0.update(slot0, slot1)
	slot0.taskVO = slot1
	slot0._go.name = slot1.id
	slot0.nameTxt.text = HXSet.hxLan(slot1:getConfig("name"))
	slot0.descTxt.text = HXSet.hxLan(slot1:getConfig("desc"))

	slot0.viewComponent:setSpriteTo("taskTagOb/" .. slot1:getConfig("type"), slot0.tagTF)

	slot2 = slot1:getConfig("target_num")

	slot0:updateAwards(slot1)

	slot3 = slot1:getProgress()

	if slot1:getConfig("sub_type") == 1012 then
		slot0.progressNum.text = math.floor(slot3 / 100) .. "/" .. math.floor(slot2 / 100)
	else
		slot0.progressNum.text = slot3 .. "/" .. slot2
	end

	slot0.progressBar.value = slot3 / slot2

	slot0:updateBtnState(slot1)
	setActive(slot0.storyIcon, slot1:getConfig("story_id") and slot4 ~= "")

	if slot4 and slot4 ~= "" then
		if slot1:getConfig("story_icon") or slot5 == "" then
			slot5 = "task_icon_default"
		end

		slot0.viewComponent:setTaskStoryIconRes(slot0.storyIcon, slot5)
		onButton(slot0, slot0.storyIcon, function ()
			pg.StoryMgr.GetInstance():Play(pg.StoryMgr.GetInstance().Play, nil, true)
		end, SFX_PANEL)
	else
		removeOnButton(slot0.storyIcon)
	end

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

					LeanTween.value(go(slot0.frame), slot0.frame.localPosition.x, slot0.frame.localPosition.x + slot0._modelWidth, LeanTween.value):setOnUpdate(System.Action_float(function (slot0)
						slot0.frame.transform.localPosition = Vector3(slot0, slot1.y, slot1.z)
					end)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
						slot0.frame.transform.localPosition = slot1

						setActive(slot0.frame, false)

						setActive.isClick = nil

						setActive.viewComponent:onSubmit(false)

						return
					end))
				end
			end

			slot1 = 0

			for slot6, slot7 in ipairs(slot2) do
				if slot7[1] == DROP_TYPE_ITEM and slot7[2] == ITEM_ID_REACT_CHAPTER_TICKET then
					slot1 = slot1 + slot7[3]
				end
			end

			if pg.gameset.reactivity_ticket_max.key_value < getProxy(ChapterProxy).remasterTickets + slot1 then
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("tack_tickets_max_warning", math.max(slot4 - slot3, 0)),
					onYes = function ()
						slot0()

						return
					end
				})

				return
			end

			slot0()
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
	SetActive(slot0.isGet, slot2 == slot1)
	SetActive(slot0.isGet, slot2 == slot0.progressNum.gameObject)
	SetActive(slot0.finishTag, slot2 == slot2 or slot2 == slot1)
	SetActive(slot0.finishImg, slot2 == slot2 or slot2 == slot1)
	SetActive(slot0.isGetPanel, slot2 == slot1)
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
