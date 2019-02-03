slot0 = class("LevelFleetPanel", import("..base.BasePanel"))

function slot0.init(slot0)
	slot0.super.init(slot0)

	slot0.txTitle = slot0:findTF("panel/title_form")
	slot0.txIntro = slot0:findTF("panel/intro")
	slot0.txCost = slot0:findTF("panel/cost/text")
	slot0.txProgress = slot0:findTF("panel/progress/Text/value")
	slot0.progress = slot0:findTF("panel/progress")
	slot0.head = slot0:findTF("panel/head/Image")
	slot0.head2 = slot0:findTF("panel/head2/Image")
	slot0.trAchieveTpl = slot0:findTF("panel/achieve")
	slot0.trAchieves = slot0:findTF("panel/achieves")
	slot0.passStateMask = slot0:findTF("panel/passState")
	slot0.passState = slot0:findTF("panel/passState/Image")

	setActive(slot0.passState, true)

	slot0.achieveList = UIItemList.New(slot0.trAchieves, slot0.trAchieveTpl)

	slot0.achieveList:make(function (slot0, slot1, slot2)
		slot0:updateAchieve(slot0, slot1, slot2)
	end)
	setActive(slot0.trAchieveTpl, false)

	slot0.trDropTpl = slot0:findTF("panel/drops/item")
	slot0.trDrops = slot0:findTF("panel/drops/list")
	slot0.dropList = UIItemList.New(slot0.trDrops, slot0.trDropTpl)

	slot0.dropList:make(function (slot0, slot1, slot2)
		slot0:updateDrop(slot0, slot1, slot2)
	end)
	setActive(slot0.trDropTpl, false)

	slot0.btnConfirm = slot0:findTF("panel/start_button")
	slot0.btnCancel = slot0:findTF("panel/btnBack")
	slot0.delayTween = {}
	slot0.onConfirm = nil
	slot0.onCancel = nil
end

function slot0.set(slot0, slot1, slot2)
	slot0:cancelTween()

	slot0.chapter = slot1
	slot0.posStart = slot2 or Vector3(0, 0, 0)

	setText(slot0:findTF("title_index", slot0.txTitle), slot0.chapter:getConfigTable().chapter_name .. "  ")
	setText(slot0:findTF("title", slot0.txTitle), string.split(slot0.chapter.getConfigTable().name, "|")[1])
	setText(slot0:findTF("title_en", slot0.txTitle), string.split(slot0.chapter.getConfigTable().name, "|")[2] or "")

	if not slot1:existAchieve() then
		setActive(slot0.passState, false)
		setActive(slot0.progress, false)
		setActive(slot0.trAchieves, false)
	else
		setActive(slot0.passState, true)
		setActive(slot0.progress, true)
		setActive(slot0.trAchieves, true)

		slot0.passState.localPosition = Vector3(-slot0.passState.rect.width, 0, 0)

		setActive(slot0.passState, slot1:hasMitigation())

		if slot1.hasMitigation() then
			setImageSprite(slot0.passState, GetSpriteFromAtlas("passstate", slot1:getRiskLevel()), true)
		end

		setWidgetText(slot0.progress, i18n("levelScene_threat_to_rule_out", ": "))
		table.insert(slot0.delayTween, LeanTween.value(go(slot0.progress), 0, slot0.chapter.progress, 0.5):setDelay(0.15):setOnUpdate(System.Action_float(function (slot0)
			setSlider(slot0.progress, 0, 100, slot0)
			setText(slot0.txProgress, math.floor(slot0) .. "%")
		end)).uniqueId)
		slot0.achieveList:align(#slot0.chapter.achieves)
		slot0.achieveList:each(function (slot0, slot1)
			slot3 = ChapterConst.IsAchieved(slot2)

			table.insert(slot0.delayTween, LeanTween.delayedCall(0.15 + (slot0 + 1) * 0.15, System.Action(function ()
				if not IsNil(IsNil) then
					slot1(findTF(findTF, "desc"), (setTextColor and Color.yellow) or Color.white)
					setActive(findTF(slot0, "star"), setActive)
					setActive(findTF(slot0, "star_empty"), not slot1)
				end
			end)).uniqueId)
		end)
	end

	setText(slot0.txIntro, HXSet.hxLan(slot3.profiles))
	setText(slot0.txCost, slot3.oil)
	setImageSprite(slot0.head, LoadSprite("qicon/" .. slot3.icon[1]))
	setActive(slot0.head2.parent, slot3.icon[2])

	if slot3.icon[2] then
		setImageSprite(slot0.head2, LoadSprite("qicon/" .. slot5))
	end

	slot0.awards = slot0:getChapterAwards()

	slot0.dropList:align(#slot0.awards)
	onButton(slot0, slot0.btnConfirm, function ()
		if slot0.onConfirm then
			slot0.onConfirm()
		end
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot0.btnCancel, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)

	slot6 = slot1:getConfig("risk_levels") or {}

	onButton(slot0, slot0.passState, function ()
		if not slot0:hasMitigation() then
			return
		end

		if i18n("level_risk_level_desc", slot0:getChapterState()):isEliteChapter() then
			slot0 = slot0 .. "\n" .. i18n("level_diffcult_chapter_state_safety")
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = slot0
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.head, function ()
		triggerButton(slot0.passState)
	end, SFX_PANEL)

	slot7 = slot0:findTF("panel")
	slot7.transform.localPosition = slot0.posStart

	table.insert(slot0.delayTween, LeanTween.move(slot7, Vector3.zero, 0.2).uniqueId)

	slot7.localScale = Vector3.zero

	table.insert(slot0.delayTween, LeanTween.scale(slot7, Vector3(1, 1, 1), 0.2).uniqueId)
	table.insert(slot0.delayTween, LeanTween.moveX(slot0.passState, 0, 0.35):setEase(LeanTweenType.easeInOutSine):setDelay(0.3).uniqueId)
end

function slot0.cancelTween(slot0)
	_.each(slot0.delayTween, function (slot0)
		LeanTween.cancel(slot0)
	end)

	slot0.delayTween = {}
end

function slot0.updateAchieve(slot0, slot1, slot2, slot3)
	if slot1 == UIItemList.EventUpdate then
		setText(slot5, ChapterConst.GetAchieveDesc(slot0.chapter.achieves[slot2 + 1].type, slot0.chapter))
		setTextColor(slot5, Color.white)
		setActive(findTF(slot3, "star"), false)
		setActive(findTF(slot3, "star_empty"), true)
	end
end

function slot0.updateDrop(slot0, slot1, slot2, slot3)
	if slot1 == UIItemList.EventUpdate then
		updateDrop(slot3, slot6)
		onButton(slot0, slot3, function ()
			slot1 = {
				[99.0] = true
			}

			if pg.item_data_statistics[slot0[2]] and slot1[slot0.type] then
				slot3 = {}

				for slot7, slot8 in ipairs(slot2) do
					slot3[#slot3 + 1] = {
						hideName = true,
						type = slot9,
						id = slot8[2],
						anonymous = slot8[1] == DROP_TYPE_SHIP and not table.contains(slot1.chapter.dropShipIdList, slot8[2])
					}
				end

				slot1:emit(BaseUI.ON_DROP_LIST, {
					item2Row = true,
					itemList = slot3,
					content = slot0.display
				})
				slot1:initTestShowDrop(slot0, Clone(slot3))
			else
				slot1:emit(BaseUI.ON_DROP, slot1.emit)
			end
		end, SFX_PANEL)
	end
end

function slot0.getChapterAwards(slot0)
	slot2 = Clone(slot0.chapter.getConfig(slot1, "awards"))

	if slot0.chapter:getStageExtraAwards() then
		for slot7 = #slot3, 1, -1 do
			table.insert(slot2, 1, slot3[slot7])
		end
	end

	return slot2
end

function slot0.initTestShowDrop(slot0, slot1, slot2)
	if Application.isEditor then
		if IsNil(GameObject.Find("OverlayCamera/Overlay/UIMain/Msgbox(Clone)").transform:Find("button_test_show_drop")) then
			GameObject.New("button_test_show_drop").AddComponent(slot4, typeof(Button))
			GameObject.New("button_test_show_drop").AddComponent(slot4, typeof(RectTransform))
			GameObject.New("button_test_show_drop"):AddComponent(typeof(Image))
		end

		slot5 = slot4:GetComponent(typeof(RectTransform))

		slot5:SetParent(slot3.transform, false)

		slot5.anchoredPosition = Vector3(-239, 173, 0)
		slot5.sizeDelta = Vector2(40, 40)

		onButton(slot0, slot5, function ()
			_.each(_.each, function (slot0)
				slot0.anonymous = false
			end)
			_.each:emit(BaseUI.ON_DROP_LIST, {
				item2Row = true,
				itemList = slot0,
				content = slot2.display
			})
		end)
	end
end

function slot0.clearTestShowDrop(slot0)
	if Application.isEditor and not IsNil(GameObject.Find("OverlayCamera/Overlay/UIMain/Msgbox(Clone)").transform:Find("button_test_show_drop")) then
		Destroy(slot2)
	end
end

function slot0.clear(slot0)
	slot0:cancelTween()
	slot0.dropList:each(function (slot0, slot1)
		clearDrop(slot1)
	end)
	slot0:clearTestShowDrop()
end

return slot0
