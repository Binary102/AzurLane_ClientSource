slot1 = class("MapBuilderNormal", import(".MapBuilder"))

function slot1.Ctor(slot0, ...)
	slot0.super.Ctor(slot0, ...)

	slot0.mapItemTimer = {}
	slot0.chapterTFsById = {}
end

function slot1.GetType(slot0)
	return slot0.TYPENORMAL
end

function slot1.GetUIName(slot0)
	return "levels"
end

function slot1.Load(slot0, slot1)
	slot0.state = slot0.StateLoading
	slot0.tf = tf(slot2)

	slot0:Init()
	slot1()
end

function slot1.Destroy(slot0)
	if slot0.StateDestroy <= slot0.state then
		return
	end

	if slot0.StateInit <= slot0.state then
		slot0:Hide()
		slot0:OnDestroy()

		slot0.tf = nil
	end

	slot0.state = slot0.StateDestroy
end

function slot1.OnInit(slot0)
	slot0.tpl = slot0.tf:Find("level_tpl")

	setActive(slot0.tpl, false)

	slot0.itemHolder = slot0.tf:Find("items")
end

function slot1.OnHide(slot0)
	for slot4, slot5 in pairs(slot0.mapItemTimer) do
		if slot5 then
			slot5:Stop()
		end
	end

	slot0.mapItemTimer = {}
end

function slot1.OnDestroy(slot0)
	slot0.mapItemTimer = nil
end

function slot1.Update(slot0, slot1)
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.pivot = Vector2(0.5, 0.5)
	slot0.float.localPosition = Vector2(0, 0)

	slot0.super.Update(slot0, slot1)
end

function slot1.UpdateMapItems(slot0)
	slot0.super.UpdateMapItems(slot0)

	slot1 = slot0.data
	slot0.chapterTFsById = {}

	_.each(Chapter.bindConfigTable().all, function (slot0)
		if slot0:getChapter(slot0) and slot1:getConfig("map") == slot0.id and slot1:isValid() and not slot1:ifNeedHide() then
			table.insert(slot1, slot1)
		end
	end)

	slot4 = UIItemList.New(slot0.itemHolder, slot0.tpl)

	slot4:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1:UpdateMapItem(slot2, slot0[slot1 + 1])

			slot2.name = "Chapter_" .. slot0[slot1 + 1].id
			slot1.chapterTFsById[slot0[slot1 + 1].id] = slot2
		elseif slot0 == UIItemList.EventExcess and slot1.mapItemTimer[slot2] then
			slot1.mapItemTimer[slot2]:Stop()

			slot1.mapItemTimer[slot2] = nil
		end
	end)
	slot4:align(#{})
end

function slot1.UpdateMapItem(slot0, slot1, slot2, slot3)
	setAnchoredPosition(slot1, {
		x = slot0.mapWidth * slot2:getConfigTable().pos_x,
		y = slot0.mapHeight * slot2.getConfigTable().pos_y
	})

	if slot0.mapItemTimer[slot1] then
		slot0.mapItemTimer[slot1]:Stop()

		slot0.mapItemTimer[slot1] = nil
	end

	slot5 = findTF(slot1, "main")
	slot6 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then
		setActive(slot5, false)
		setActive(slot6, true)

		slot7 = findTF(slot6, "mask/count_down")
		slot0.mapItemTimer[slot1] = Timer.New(slot8, 1, -1)

		slot0.mapItemTimer[slot1]:Start()
		slot8()

		slot9 = findTF(slot6, "fighting")
		slot10 = GetOrAddComponent(slot9, "CanvasGroup")

		setText(findTF(slot9, "Text"), i18n("tag_level_fighting"))

		slot11 = findTF(slot6, "oni")
		slot12 = GetOrAddComponent(slot9, "CanvasGroup")

		setText(findTF(slot11, "Text"), i18n("tag_level_oni"))

		slot14 = GetOrAddComponent(slot11, "CanvasGroup")

		setText(findTF(slot13, "Text"), i18n("tag_level_narrative"))
		setActive(slot9, false)
		setActive(slot11, false)
		setActive(slot13, false)
		slot0:DeleteTween("fighting" .. slot2.id)

		slot6:GetComponent("Animator").enabled = true

		slot6:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			slot0.enabled = false
			slot3, slot2 = nil

			if slot1:getConfig("chapter_tag") == 1 then
				slot1 = slot2
				slot2 = slot3
			end

			if slot1.active then
				slot2 = slot5

				if slot1:existOni() then
					slot1 = slot6
					slot2 = slot7
				end
			end

			if slot1 then
				setActive(slot1, true)

				slot2.alpha = 1

				slot8:RecordTween("fighting" .. slot1.id, LeanTween.alphaCanvas(slot2, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end)
	else
		setActive(slot5, true)
		setActive(slot6, false)

		slot8 = findTF(slot5, "info/bk/fordark")

		setActive(findTF(slot5, "circle/fordark"), slot4.icon_outline == 1)
		setActive(slot8, slot4.icon_outline == 1)

		slot9 = findTF(slot5, "circle/clear_flag")
		slot11 = GetOrAddComponent(slot8, "CanvasGroup")

		setText(findTF(slot8, "Text"), i18n("tag_level_fighting"))

		slot12 = findTF(slot5, "circle/oni")
		slot13 = GetOrAddComponent(slot12, "CanvasGroup")

		setText(findTF(slot12, "Text"), i18n("tag_level_oni"))

		slot15 = GetOrAddComponent(slot12, "CanvasGroup")

		setText(findTF(slot14, "Text"), i18n("tag_level_narrative"))
		setText(findTF(slot5, "info/bk/title_form/title_index"), slot4.chapter_name .. "  ")
		setText(findTF(slot5, "info/bk/title_form/title"), string.split(slot4.name, "|")[1])
		setText(findTF(slot5, "info/bk/title_form/title_en"), string.split(slot4.name, "|")[2] or "")
		setFillAmount(findTF(slot5, "circle/progress"), slot2.progress / 100)
		setText(findTF(slot5, "circle/progress_text"), string.format("%d%%", slot2.progress))
		setActive(findTF(slot5, "circle/stars"), slot2:existAchieve())

		if slot2:existAchieve() then
			for slot23, slot24 in ipairs(slot2.achieves) do
				setActive(slot18:Find("star" .. slot23 .. "/light"), ChapterConst.IsAchieved(slot24))
			end
		end

		slot0:DeleteTween("fighting" .. slot2.id)
		setActive(slot10, false)
		setActive(slot12, false)
		setActive(slot14, false)
		setActive(slot9, false)
		setActive(slot17, true)

		if not slot2:isUnlock() and not slot2:activeAlways() then
			setActive(slot5, false)
		else
			setActive(slot5, true)

			slot20, slot21 = nil

			if slot2:getConfig("chapter_tag") == 1 then
				slot20 = slot14
				slot21 = slot15
			end

			if slot2.active then
				slot20 = slot10
				slot21 = slot11

				if slot2:existOni() then
					slot20 = slot12
					slot21 = slot13
				end
			elseif slot2:isClear() then
				setActive(slot9, true)
				setActive(slot17, false)
			end

			if slot20 then
				setActive(slot20, true)

				slot21.alpha = 1

				slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot21, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end

		setActive(slot20, false)

		slot23 = findTF(slot5, "circle")

		LeanTween.cancel(go(slot23))

		slot23.localScale = Vector3.zero

		LeanTween.scale(slot23, Vector3(1, 1, 1), 0.2):setDelay(0.3)
		setAnchoredPosition(slot24, {
			x = -1 * slot5:Find("info").rect.width
		})
		shiftPanel(findTF(slot5, "info/bk"), 0, nil, 0.4, 0.4, true, true, nil, function ()
			if slot0 then
				setActive(slot1, true)
			end

			if slot2 then
				slot2()
			end
		end)

		if slot2:isTriesLimit() then
			slot25 = slot2:getConfig("count")

			setText(slot20:Find("label"), i18n("levelScene_chapter_count_tip"))
			setText(slot20:Find("Text"), setColorStr(slot25 - slot2:getTodayDefeatCount() .. "/" .. slot25, (slot25 <= slot2:getTodayDefeatCount() and COLOR_RED) or COLOR_GREEN))
		end

		slot26 = 0

		for slot30, slot31 in ipairs(slot25) do
			slot26 = math.max(slot26, (pg.expedition_activity_template[slot31] and slot32.bonus_time) or 0)
		end

		if pg.chapter_defense[slot2.id] then
			slot26 = math.max(slot26, slot27.bonus_time or 0)
		end

		slot28 = findTF(slot5, "mark")
		slot31 = slot2:getOniChapterInfo()

		setActive(slot28:Find("bonus"), not slot0.data:isRemaster() and slot26 > 0 and math.max(slot26 - slot2.todayDefeatCount, 0) > 0)
		setActive(slot28, not slot0.data.isRemaster() and slot26 > 0 and math.max(slot26 - slot2.todayDefeatCount, 0) > 0)

		if slot30 then
			slot33 = slot28.anchoredPosition.y
			slot28:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot28))
			LeanTween.value(go(slot28), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
				slot0.alpha = slot0
				slot0.anchoredPosition.y = slot2 * slot0
				slot0.anchoredPosition.anchoredPosition = slot0.anchoredPosition
			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
		end
	end

	onButton(slot0.sceneParent, (isActive(slot5) and slot5) or slot6, function ()
		if slot0:InvokeParent("isfrozen") then
			return
		end

		if not slot1:isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", slot1:getPrevChapterName()))

			return
		end

		if slot0.sceneParent.player.level < slot1:getConfig("unlocklevel") then
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
		end

		slot1 = nil

		for slot5, slot6 in pairs(slot0.sceneParent.maps) do
			if slot6:getActiveChapter() then
				break
			end
		end

		if slot1 and slot1 ~= slot1 then
			slot0:InvokeParent("emit", LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
		end

		if slot1.active then
			slot0:InvokeParent("switchToChapter", slot1)
		else
			slot0:InvokeParent("displayChapterPanel", slot1, Vector3(slot2.localPosition.x - 10, slot2.localPosition.y + 150))
		end

		return
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function slot1.RefreshMapItems(slot0)
	if not slot0.chapterTFsById then
		return
	end

	slot1 = slot0.data

	for slot5, slot6 in pairs(slot0.chapterTFsById) do
		if slot1:getChapter(slot5) and (slot7:isUnlock() or slot7:activeAlways()) and not slot7:ifNeedHide() then
			setActive(slot6, true)
		else
			setActive(slot6, false)
		end
	end

	return
end

function slot1.UpdateChapterTF(slot0, slot1)
	slot3 = slot0.data:getChapter(slot1)

	if slot0.chapterTFsById[slot1] and slot3 then
		slot0:UpdateMapItem(slot2, slot3)
	end

	return
end

function slot1.TryOpenChapter(slot0, slot1)
	if slot0.chapterTFsById[slot1] then
		triggerButton((isActive(slot2:Find("main")) and slot3) or slot2:Find("sub"))
	end

	return
end

return slot1
