ScrollTxt = class("ScrollTxt")
ScrollTxt._speed = 10
ScrollTxt._delayTime = 0.5
ScrollTxt._padding = 4

function ScrollTxt.Ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._mask = GetOrAddComponent(slot1, typeof(RectMask2D))

	if slot4 == nil then
	end

	slot0._vertical = slot4

	if slot3 == nil then
	end

	slot0._notSensitive = slot3
	slot0._maskRTF = slot1:GetComponent(typeof(RectTransform))

	slot0:setMaskEnable(slot5)

	slot0._txt = slot2:GetComponent(typeof(Text))
	slot0._txtRTF = slot2:GetComponent(typeof(RectTransform))

	slot0:setBaseSize(slot0._txtRTF)

	slot0._txtRect = slot0._txtRTF.rect
end

function ScrollTxt.changeToScroll(slot0, slot1)
	slot1:GetComponent(typeof(Text)).enabled = false
	ScrollTxt.New(slot1, cloneTplTo(slot1, slot1))._txtIsClone = true

	return ScrollTxt.New(slot1, cloneTplTo(slot1, slot1))
end

function ScrollTxt.setBaseSize(slot0, slot1)
	slot1.localScale = Vector3.one
	slot1.anchorMin = Vector2(0.5, 0.5)
	slot1.anchorMax = Vector2(0.5, 0.5)
	slot1.pivot = Vector2(0.5, 0.5)
	slot1.anchoredPosition = Vector2.zero
end

function ScrollTxt.setText(slot0, slot1)
	slot0:clear()

	slot0._txt.text = tostring(slot1)

	slot0:delayBegin()
end

function ScrollTxt.delayBegin(slot0)
	slot0.timer = Timer.New(function ()
		slot0:begin()
	end, 0.1, 1):Start()
end

function ScrollTxt.preCalFunc(slot0)
	slot1 = nil

	if slot0._vertical then
		if slot0:checkOverlength() then
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._txt.preferredHeight)

			slot0:setMaskEnable(true)

			slot0._topLimit = (slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding
			slot0._bottomLimit = -((slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding)
			slot0._tweenTime = ((slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding) / slot0._speed
			slot0._txtRTF.anchoredPosition = Vector2.New(0, slot0._bottomLimit)
		else
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._maskRTF.rect.height)

			slot0:setMaskEnable(false)

			slot0._txtRTF.anchoredPosition = Vector2.zero
		end
	else
		if slot0:checkOverlength() then
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._txt.preferredWidth, slot0._maskRTF.rect.height)

			slot0:setMaskEnable(true)

			slot0._leftLimit = -((slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding)
			slot0._rightLimit = (slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding
			slot0._tweenTime = ((slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding) / slot0._speed
			slot0._txtRTF.anchoredPosition = Vector2.New(slot0._rightLimit, 0)
		else
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._maskRTF.rect.height)

			slot0:setMaskEnable(false)

			slot0._txtRTF.anchoredPosition = Vector2.zero
		end
	end

	return
end

function ScrollTxt.begin(slot0)
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then
		return
	end

	slot0:preCalFunc()

	if slot0._vertical then
		if slot0:checkOverlength() then
			slot0:startTweenVertical()
		end
	else
		if slot0:checkOverlength() then
			slot0:startTween()
		end
	end

	return
end

function ScrollTxt.checkOverlength(slot0)
	if slot0._vertical then
		return slot0._maskRTF.rect.height ~= 0 and slot0._maskRTF.rect.height < slot0._txt.preferredHeight
	else
		return slot0._maskRTF.rect.width ~= 0 and slot0._maskRTF.rect.width < slot0._txt.preferredWidth
	end

	return
end

function ScrollTxt.startTween(slot0)
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then
		return
	end

	LeanTween.moveX(slot0._txtRTF, slot0._leftLimit, slot0._tweenTime):setFrom(slot0._rightLimit):setDelay(slot0._delayTime):setOnComplete(System.Action(function ()
		LeanTween.delayedCall(go(slot0._txtRTF), slot0._delayTime, System.Action(function ()
			slot0._txtRTF.anchoredPosition = Vector2.New(slot0._rightLimit, 0)

			slot0._txtRTF:startTween()

			return
		end))

		return
	end))

	return
end

function ScrollTxt.startTweenVertical(slot0)
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then
		return
	end

	LeanTween.moveY(slot0._txtRTF, slot0._topLimit, slot0._tweenTime):setFrom(slot0._bottomLimit):setDelay(slot0._delayTime):setOnComplete(System.Action(function ()
		LeanTween.delayedCall(go(slot0._txtRTF), slot0._delayTime, System.Action(function ()
			slot0._txtRTF.anchoredPosition = Vector2.New(0, slot0._bottomLimit)

			slot0._txtRTF:startTweenVertical()

			return
		end))

		return
	end))

	return
end

function ScrollTxt.setMaskEnable(slot0, slot1)
	if not slot0._notSensitive and slot0._mask then
		slot0._mask.enabled = slot1

		if not slot1 then
			slot0._maskRTF.gameObject:SetActive(false)
			slot0._maskRTF.gameObject:SetActive(true)
		end
	else
		slot0._mask.enabled = true
	end

	return
end

function ScrollTxt.clear(slot0)
	if not IsNil(slot0._txtRTF) then
		LeanTween.cancel(go(slot0._txtRTF))
	end

	if slot0.timer ~= nil then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	return
end

function ScrollTxt.destroy(slot0)
	slot0:clear()

	if slot0._txtIsClone then
		Destroy(slot0._txt.gameObject)

		slot0._mask:GetComponent(typeof(Text)).enabled = true
	end

	slot0._txt = nil
	slot0._txtRTF = nil
	slot0._txtRect = nil

	return
end

return ScrollTxt
