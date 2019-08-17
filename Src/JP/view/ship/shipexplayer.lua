slot0 = class("ShipExpLayer", import("..base.BaseUI"))
slot0.TypeDefault = 0
slot0.TypeClass = 1

function slot0.getUIName(slot0)
	return "ShipExpUI"
end

function slot0.init(slot0)
	slot0._grade = slot0:findTF("grade")
	slot0._gradeLabel = slot0:findTF("label", slot0._grade)
	slot0._levelText = slot0:findTF("Text", slot0._grade)
	slot0._main = slot0:findTF("main")
	slot0._leftPanel = slot0:findTF("leftPanel", slot0._main)
	slot0._topBar = slot0:findTF("topBar", slot0._leftPanel)
	slot0._expResult = slot0:findTF("expResult", slot0._leftPanel)
	slot0._expContainer = slot0:findTF("expContainer", slot0._expResult)
	slot0._extpl = slot0:getTpl("ShipCardTpl", slot0._expContainer)
	slot0._skipBtn = slot0:findTF("skipLayer")

	setActive(slot0._topBar, false)
end

function slot0.didEnter(slot0)
	slot0.tweenTFs = {}
	slot0.timerId = {}

	onButton(slot0, slot0._skipBtn, function ()
		slot0:skip()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	slot0:display()
end

function slot0.display(slot0)
	setActive(slot0._grade, true)
	setText(slot0._levelText, slot0.contextData.title)

	if slot0.contextData.type == slot0.TypeClass then
		setActive(slot0._gradeLabel, false)
	else
		setActive(slot0._gradeLabel, true)
		LoadImageSpriteAsync("battlescore/" .. ((slot0.contextData.isCri and "grade_label_task_perfect") or "grade_label_task_complete"), slot0._gradeLabel, true)
	end

	setActive(slot0._topBar, slot0.contextData.top)

	if slot0.contextData.top then
		setText(slot0._topBar:Find("text_1"), slot1.text1)
		setText(slot0._topBar:Find("text_2"), slot1.text2)
		setText(slot0._topBar:Find("text_3"), slot1.text3)

		slot0._topBar:Find("progress"):GetComponent(typeof(Image)).fillAmount = slot1.progress
	end

	slot0._expTFs = {}
	slot0._nameTxts = {}
	slot0._skipExp = {}
	slot0._maxRightDelay = 0
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.contextData.newShips) do
		slot2[slot7.id] = slot7
	end

	slot4 = 0.5

	for slot8, slot9 in ipairs(slot3) do
		slot11 = cloneTplTo(slot0._extpl, slot0._expContainer)
		slot14 = findTF(slot11, "content")
		slot15 = ScrollTxt.New(findTF(slot14, "info/name_mask"), findTF(slot14, "info/name_mask/name"))
		slot11.transform.anchoredPosition = Vector3(slot11.transform.anchoredPosition.x + (16.2 + rtf(slot11).rect.width) * (slot8 - 1), slot11.transform.anchoredPosition.y, slot11.transform.anchoredPosition.z)
		slot0._expTFs[#slot0._expTFs + 1] = slot11
		slot0._nameTxts[#slot0._nameTxts + 1] = slot15

		flushShipCard(slot11, slot9)
		slot15:setText(slot9:getName())

		slot17 = findTF(slot14, "dockyard/lv_bg/levelUpLabel")
		slot18 = findTF(slot14, "dockyard/lv_bg/levelup")

		setText(slot16, slot9.level)

		slot20 = findTF(slot19, "exp_text")
		slot21 = findTF(slot19, "exp_progress")
		slot0._maxRightDelay = math.max(slot0._maxRightDelay, slot2[slot9.id].level - slot9.level + slot8 * 0.5)

		function slot22()
			SetActive(SetActive, true)

			slot3:GetComponent(typeof(Image)).fillAmount = slot1.exp / SetActive:getLevelExpConfig().exp

			if slot1.level < slot2.level then
				for slot6 = slot1.level, slot2.level - 1, 1 do
					slot2 = slot2 + slot1:getLevelExpConfig(slot6).exp
				end

				slot4:PlayAnimation(slot5, 0, (slot2 + slot2.exp) - slot1.exp, 1, 0, function (slot0)
					setText(slot0, "+" .. math.ceil(slot0))
				end)

				function slot3(slot0)
					SetActive(slot0, true)
					SetActive(SetActive, true)
					LeanTween.moveY(rtf(slot0), slot0.localPosition.y + 30, 0.5):setOnComplete(System.Action(function ()
						SetActive(SetActive, false)

						SetActive.localPosition = SetActive

						playSoundEffect(SFX_BOAT_LEVEL_UP)
					end))
					setText(setText, slot0)
					table.insert(setText.tweenTFs, slot0)
				end

				LeanTween.value(go(go), slot1.exp / slot0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
					slot0:GetComponent(typeof(Image)).fillAmount = slot0
				end)):setOnComplete(System.Action(function ()
					slot1(slot0.level + 1)

					slot0 = slot0.level + 1 + 1
					slot1 = 0.1

					while slot0 <= slot2.level do
						slot2 = slot0

						LeanTween.value(go(slot3), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
							slot0:GetComponent(typeof(Image)).fillAmount = slot0
						end)):setDelay(slot1):setOnComplete(System.Action(function ()
							slot0(slot1)

							return
						end))

						slot1 = slot1 + 1
						slot0 = slot0 + 1
					end

					slot5.timerId[slot0.id] = pg.TimeMgr.GetInstance():AddTimer("delayTimer", slot1, 0, function ()
						if slot0.level == pg.ship_level[#pg.ship_level].level then
							slot1:GetComponent(typeof(Image)).fillAmount = 1
							slot2._skipExp[Image] = false

							return
						end

						slot2:PlayAnimation(slot4, 0, slot0.exp / slot5, 0.5, 0, function (slot0)
							slot0:GetComponent(typeof(Image)).fillAmount = slot0
							slot0.GetComponent(typeof(Image))._skipExp[slot0] = false

							return
						end)

						return
					end)
				end))
				table.insert(slot4.tweenTFs, )

				return
			end

			setText(slot6, "+" .. math.ceil(slot2:getExp() - slot1:getExp()))

			if slot1.level == slot1:getMaxLevel() then
				slot3:GetComponent(typeof(Image)).fillAmount = 1
				slot4._skipExp[slot10] = false

				return
			end

			slot4:PlayAnimation(slot5, slot1.exp / slot0, slot2.exp / slot0, 1, 0, function (slot0)
				slot0:GetComponent(typeof(Image)).fillAmount = slot0
				slot0.GetComponent(typeof(Image))._skipExp[slot0] = false

				return
			end)
		end

		slot0._skipExp[slot8] = function ()
			LeanTween.cancel(go(LeanTween.cancel))
			LeanTween.cancel(go(go))
			SetActive(go, true)
			SetActive(true, true)
			setText(slot3, slot4.level)

			if slot5.level == slot5:getMaxLevel() then
				setText(slot6, "+" .. math.ceil(slot4:getExp() - slot4:getExp()))

				slot7:GetComponent(typeof(Image)).fillAmount = 1
			else
				if slot5.level < slot4.level then
					slot0 = 0

					for slot4 = slot5.level, slot4.level - 1, 1 do
						slot0 = slot0 + slot5:getLevelExpConfig(slot4).exp
					end

					setText(slot6, "+" .. (slot0 + slot4.exp) - slot5.exp)
				else
					setText(slot6, "+" .. math.ceil(slot4.exp - slot5.exp))
				end

				slot7:GetComponent(typeof(Image)).fillAmount = slot4.exp / slot4:getLevelExpConfig().exp
			end

			SetActive(SetActive, false)

			SetActive:GetComponent("CanvasGroup").alpha = 1
			rtf(1).anchoredPosition = Vector2(rtf(slot1).anchoredPosition.x, 0)

			return
		end

		slot23 = slot11:GetComponent("CanvasGroup")

		setActive(slot11, false)
		LeanTween.moveY(rtf(slot11), 0, 0.2):setOnComplete(System.Action(function ()
			setActive(setActive, true)
			setActive()

			return
		end)):setDelay(slot24)
		table.insert(slot0.tweenTFs, slot11)
		LeanTween.value(go(slot11), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
			slot0.alpha = slot0

			return
		end)):setDelay(slot8 * 0.2)
	end
end

function slot0.skip(slot0)
	if _.any(slot0._skipExp, function (slot0)
		return slot0
	end) then
		for slot4 = 1, #slot0._skipExp, 1 do
			if slot0._skipExp[slot4] then
				slot0._skipExp[slot4]()

				slot0._skipExp[slot4] = false
			end
		end
	else
		slot0:emit(BaseUI.ON_CLOSE)
	end

	return
end

function slot0.PlayAnimation(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	LeanTween.value(slot1.gameObject, slot2, slot3, slot4):setDelay(slot5):setOnUpdate(System.Action_float(function (slot0)
		slot0(slot0)

		return
	end))
	table.insert(slot0.tweenTFs, slot1)

	return
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.tweenTFs) do
		if LeanTween.isTweening(go(slot5)) then
			LeanTween.cancel(go(slot5))
		end
	end

	slot0.tweenTFs = nil

	for slot4, slot5 in pairs(slot0.timerId) do
		pg.TimeMgr.GetInstance():RemoveTimer(slot5)
	end

	slot0.timerId = nil

	for slot4 = #slot0._nameTxts, 1, -1 do
		slot0._nameTxts[slot4]:destroy()
		table.remove(slot0._nameTxts, slot4)
	end

	slot0._nameTxts = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	return
end

return slot0
