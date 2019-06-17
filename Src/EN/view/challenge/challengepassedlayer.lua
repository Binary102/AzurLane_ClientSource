slot0 = class("ChallengePassedLayer", import("..base.BaseUI"))
slot0.BOSS_NUM = 5
slot0.GROW_TIME = 0.5

function slot0.getUIName(slot0)
	return "ChallengePassedUI"
end

function slot0.init(slot0)
	slot0:findUI()
	slot0:initData()
	slot0:addListener()
end

function slot0.didEnter(slot0)
	slot0:updatePainting("aheye")
	slot0:updateSlider(1)
	slot0:moveSlider(1)
end

function slot0.willExit(slot0)
	return
end

function slot0.onBackPressed(slot0)
	triggerButton(slot0.bg)
end

function slot0.findUI(slot0)
	slot0.bg = slot0:findTF("BG")
	slot0.paintingTF = slot0:findTF("Painting")
	slot0.slider = slot0:findTF("Slider")
	slot0.squareContainer = slot0:findTF("SquareList", slot0.slider)
	slot0.squareTpl = slot0:findTF("Squre", slot0.slider)
	slot0.squareList = UIItemList.New(slot0.squareContainer, slot0.squareTpl)
	slot0.sliderSC = GetComponent(slot0.slider, "Slider")
end

function slot0.initData(slot0)
	slot0.curIndex = nil
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.bg, function ()
		slot0:emit(ChallengeConst.OPEN_CHALLENGE_MAIN_SCENE)
	end, SFX_PANEL)
	LeanTween.cancelAll()
end

function slot0.updatePainting(slot0, slot1)
	setPaintingPrefabAsync(slot0.paintingTF, slot1, "chuanwu")
end

function slot0.updateSlider(slot0, slot1)
	slot0.sliderSC.value = ((slot1 or slot0.curIndex) - 1) * 1 / (ChallengeConst.BOSS_NUM - 1)

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
			if slot1 + 1 < slot1 then
				setActive(slot6, false)
				slot7()
			elseif slot1 + 1 == slot1 then
				setActive(slot6, true)
				slot9()
			elseif slot1 < slot1 + 1 then
				setActive(slot6, false)
				slot8()
			end
		end
	end)
	slot0.squareList:align(ChallengeConst.BOSS_NUM)
end

function slot0.moveSlider(slot0, slot1)
	if (slot1 or slot0.curIndex) == ActivityConst.BOSS_NUM then
		return
	end

	LeanTween.value(go(slot0.slider), slot4, slot5, slot0.GROW_TIME):setOnUpdate(System.Action_float(function (slot0)
		slot0.sliderSC.value = slot0
	end)):setOnComplete(System.Action(function ()
		slot0:updateSlider(slot1 + 1)
	end))
end

return slot0
