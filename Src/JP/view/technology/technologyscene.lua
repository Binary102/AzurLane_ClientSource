slot0 = class("TechnologyScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TechnologyUI"
end

function slot0.setTechnologys(slot0, slot1)
	slot0.technologyVOs = slot1
end

function slot0.setRefreshFlag(slot0, slot1)
	slot0.flag = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	if slot0._resPanel then
		slot0._resPanel:setResources(slot1)
	end
end

function slot0.setTendency(slot0, slot1)
	slot0.tendency = slot1

	setText(slot0:findTF("Text", slot0.tendencyBtn), i18n("tech_change_version_mark"))
	setImageSprite(slot0:findTF("version", slot0.tendencyBtn), GetSpriteFromAtlas("ui/technologyui_atlas", "version_" .. slot0.tendency))
end

function slot0.init(slot0)
	slot0.srcollView = slot0:findTF("main/srcoll_rect/content")
	slot0.cardTpl = slot0:findTF("card_tpl", slot0.srcollView)
	slot0.srcollViewCG = slot0.srcollView:GetComponent(typeof(CanvasGroup))
	slot0.technologyTpl = slot0:findTF("main/selecte_panel/technology_card")
	slot0.selectetPanel = slot0:findTF("main/selecte_panel")

	setActive(slot0.selectetPanel, false)

	slot0.helpBtn = slot0:findTF("main/help_btn")
	slot0.refreshBtn = slot0:findTF("main/refresh_btn")
	slot0.tendencyBtn = slot0:findTF("main/tendency_btn")
	slot0.backBtn = slot0:findTF("top/back")
	slot0.arrLeftBtn = slot0:findTF("main/selecte_panel/left_arr_btn")
	slot0.arrRightBtn = slot0:findTF("main/selecte_panel/right_arr_btn")
	slot0.descTxt = slot0:findTF("desc/bg/Text", slot0.selectetPanel):GetComponent(typeof(Text))
	slot0.timerTxt = slot0:findTF("timer/bg/Text", slot0.selectetPanel):GetComponent(typeof(Text))
	slot0.itemContainer = slot0:findTF("consume_panel/bg/container", slot0.selectetPanel)
	slot0.itemTpl = slot0:findTF("item_tpl", slot0.itemContainer)
	slot0.emptyTF = slot0:findTF("consume_panel/bg/empty", slot0.selectetPanel)
	slot0.taskPanel = slot0:findTF("consume_panel/bg/task_panel", slot0.selectetPanel)
	slot0.taskSlider = slot0.taskPanel:Find("slider"):GetComponent(typeof(Slider))
	slot0.taskDesc = slot0.taskPanel:Find("slider/Text"):GetComponent(typeof(Text))
	slot0.descBG = slot0:findTF("desc/bg", slot0.selectetPanel):GetComponent(typeof(Image))
	slot0.techTimer = {}
	slot0.refreshTimer = {}
	slot0.cardtimer = {}
	slot0._playerResOb = slot0:findTF("top/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)
end

function slot0.didEnter(slot0)
	slot0:initTechnologys()
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowHelpWindow({
			helps = pg.gametip.technology_help_text.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.refreshBtn, function ()
		if _.any(slot0.technologyVOs, function (slot0)
			return slot0.state ~= Technology.STATE_IDLE
		end) then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("technology_canot_refresh")
			})

			return
		end

		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("technology_refresh_tip"),
			onYes = function ()
				slot0:emit(TechnologyMediator.ON_REFRESH)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.tendencyBtn, function ()
		slot0:emit(TechnologyMediator.CHANGE_TENDENCY, (slot0.tendency + 1) % 3)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.selectetPanel, function ()
		slot0:cancelSelected()
	end, SFX_PANEL)
	slot0:updateRefreshBtn(slot0.flag)
	slot0._resPanel:setResources(slot0.player)
end

function slot0.initTechnologys(slot0)
	slot0.technologCards = {}
	slot0.lastButtonListener = slot0.lastButtonListener or {}

	if not slot0.itemList then
		slot0.itemList = UIItemList.New(slot0.srcollView, slot0.cardTpl)

		slot0.itemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot2.name = slot1 + 1
				slot0.technologCards[slot0.technologyVOs[slot1 + 1].id] = slot2

				slot0:updateTechnologyTF(slot2, slot3)
				slot0:updateTimer(slot3)

				slot4 = GetOrAddComponent(slot2, typeof(Button)).onClick

				if slot0.lastButtonListener[slot2] then
					slot4:RemoveListener(slot0.lastButtonListener[slot2])
				end

				if slot3.state == Technology.STATE_STARTING or slot3.state == Technology.STATE_FINISHED then
					Timer.New(function ()
						slot0.srcollView:GetComponent("EnhancelScrollView"):SetHorizontalTargetItemIndex(slot1:GetComponent("EnhanceItem").scrollViewItemIndex)
					end, 0.35, 1):Start()
				end

				slot0.lastButtonListener[slot2] = function ()
					playSoundEffect(SFX_PANEL)

					if playSoundEffect:gteState() == Technology.STATE_FINISHED then
						slot1:emit(TechnologyMediator.ON_FINISHED, {
							id = slot0.id,
							pool_id = slot0.poolId
						})
					else
						slot1:onSelected(slot2 + 1)
					end

					return
				end

				slot4:AddListener(slot0.lastButtonListener[slot2])
			end
		end)
	end

	slot0.itemList:align(#slot0.technologyVOs)
end

function slot0.updateRefreshBtn(slot0, slot1)
	setButtonEnabled(slot0.refreshBtn, slot1 == 0)

	return
end

function slot0.onSelected(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.technologyVOs[slot1] then
		return
	end

	slot0.technologyCount = table.getCount(slot0.technologyVOs)
	slot0.contextData.selectedIndex = slot1
	slot0.srcollViewCG.alpha = 0.3

	setActive(slot3, false)
	setActive(slot0.selectetPanel, true)

	slot4 = {}

	eachChild(slot0.srcollView, function (slot0)
		slot0[tonumber(slot0.name)] = slot0

		return
	end)

	function slot5(slot0, slot1)
		slot2 = {}
		slot3 = slot0
		slot4 = slot0[slot0].localPosition.x

		for slot8, slot9 in ipairs(slot0) do
			slot2[slot8] = slot0[slot8].localPosition.x - slot4
		end

		for slot8, slot9 in ipairs(slot2) do
			if slot9 ~= 0 and (slot2[slot3] == 0 or (slot1 and ((slot9 > 0 and slot2[slot3] > 0 and slot2[slot3] < slot9) or (slot9 < 0 and (slot2[slot3] > 0 or slot2[slot3] < slot9)))) or (not slot1 and ((slot9 < 0 and slot2[slot3] < 0 and slot9 < slot2[slot3]) or (slot9 > 0 and (slot2[slot3] < 0 or slot9 < slot2[slot3]))))) then
				slot3 = slot8
			end
		end

		return slot0[slot3]
	end

	slot0:updateSelectedInfo(slot2)
	onButton(slot0, slot0.arrLeftBtn, function ()
		if slot0.inAnim then
			return
		end

		slot0:cancelSelected()
		triggerButton(slot0(slot2, true))

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.arrRightBtn, function ()
		if slot0.inAnim then
			return
		end

		slot0:cancelSelected()
		triggerButton(slot0(slot2, false))

		return
	end, SFX_PANEL)

	return
end

function slot0.updateSelectedInfo(slot0, slot1)
	if not slot0.contextData.selectedIndex then
		return
	end

	slot0:updateTechnologyTF(slot0.technologyTpl, slot1, true)
	slot0:updateExtraInfo(slot1)

	return
end

function slot0.updateExtraInfo(slot0, slot1)
	slot0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot2)
	slot0.descTxt.text = slot1:getConfig("desc")
	slot0.descBG.sprite = GetSpriteFromAtlas("ui/TechnologyUI_atlas", slot1:getConfig("rarity"))

	for slot8 = slot0.itemContainer.childCount + 1, #slot1:getConfig("consume"), 1 do
		cloneTplTo(slot0.itemTpl, slot0.itemContainer)
	end

	for slot8 = 1, slot0.itemContainer.childCount, 1 do
		setActive(slot0.itemContainer:GetChild(slot8 - 1), slot8 <= #slot3)

		if slot8 <= #slot3 then
			slot0:updateItem(slot9, slot1, slot3[slot8])
		end
	end

	setActive(slot0.emptyTF, not slot3 or #slot3 <= 0)

	if slot1:hasCondition() then
		slot0.taskSlider.value = getProxy(TaskProxy):getTaskById(slot1:getTaskId()) or Task.New({
			id = slot5
		}).progress / getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("target_num")
		slot0.taskDesc.text = getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("desc") .. "(" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New().progress .. "/" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("target_num") .. ")"
	else
		slot0.taskDesc.text = i18n("technology_task_none_tip")
		slot0.taskSlider.value = 0
	end

	if slot0.techTimer[slot1.id] then
		slot0.techTimer[slot1.id]:Stop()

		slot0.techTimer[slot1.id] = nil
	end

	function slot5()
		slot0.techTimer[slot1.id]:Stop()

		slot0.techTimer[slot1.id].Stop.techTimer[slot0.techTimer[slot1.id].id] = nil
		slot0.techTimer[slot1.id].Stop.techTimer.timerTxt.text = "00:00:00"

		return
	end

	if slot1:isStarting() then
		slot0.techTimer[slot1.id] = Timer.New(function ()
			if slot0.time - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
				slot1()
			else
				slot2.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot0.time - slot0)
			end

			return
		end, 1, -1)

		slot0.techTimer[slot1.id]:Start()
		slot0.techTimer[slot1.id].func()
	end

	for slot10 = 1, slot0.itemContainer.childCount, 1 do
		slot11 = slot0.itemContainer:GetChild(slot10 - 1)

		setActive(slot11:Find("check"), slot1:isStart())
		setActive(slot11:Find("count"), not slot1:isStart())
	end

	return
end

function slot0.cancelSelected(slot0)
	if not slot0.contextData.selectedIndex then
		return
	end

	if not slot0.technologyVOs[slot1] then
		return
	end

	slot0.srcollViewCG.alpha = 1

	setActive(slot3, true)
	removeOnButton(slot0.arrLeftBtn)
	removeOnButton(slot0.arrRightBtn)
	setActive(slot0.selectetPanel, false)

	slot0.inAnim = true

	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	slot0.contextData.selectedIndex = nil
	slot0.timer = Timer.New(function ()
		slot0.inAnim = nil

		return
	end, 0.2, 1)

	slot0.timer:Start()

	if callback then
		callback()
	end

	if slot0.techTimer[slot2.id] then
		slot0.techTimer[slot2.id]:Stop()

		slot0.techTimer[slot2.id] = nil
	end

	return
end

function slot0.updateTechnology(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.technologyVOs) do
		if slot6.id == slot1.id then
			slot0.technologyVOs[slot5] = slot1
		end
	end

	slot0:updateTechnologyTF(slot2, slot1)
	slot0:updateTimer(slot1)

	return
end

function slot0.updateTimer(slot0, slot1)
	slot3 = slot0.technologCards[slot1.id].Find(slot2, "frame/btns/dev_btn/time")
	slot4 = slot0.technologCards[slot1.id].Find(slot2, "frame/btns/dev_btn/limit")

	if slot0.cardtimer[slot1.id] then
		slot0.cardtimer[slot1.id]:Stop()

		slot0.cardtimer[slot1.id] = nil
	end

	if Technology.STATE_STARTING == slot1:gteState() then
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.cardtimer[slot1.id] = Timer.New(function ()
			if slot0.time - pg.TimeMgr:GetInstance():GetServerTime() <= 0 then
				if slot1.cardtimer[slot0.id] then
					slot1.cardtimer[slot0.id]:Stop()

					slot1.cardtimer[slot0.id] = nil
				end

				if not slot0:canFinish() then
					setActive(setActive, false)
					setActive(setActive, true)
				else
					setText(slot2:Find("text"), "00:00:00")
				end
			else
				setText(slot2:Find("text"), pg.TimeMgr:GetInstance():DescCDTime(slot0 - slot1))
			end

			return
		end, 1, -1)

		slot0.cardtimer[slot1.id]:Start()
		slot0.cardtimer[slot1.id].func()
	end

	return
end

function slot0.updateTechnologyTF(slot0, slot1, slot2, slot3)
	slot0:updateInfo(slot1, slot2, slot3)

	slot4 = slot2:gteState()

	if slot0.refreshTimer[slot2.id] then
		slot0.refreshTimer[slot2.id]:Stop()

		slot0.refreshTimer[slot2.id] = nil
	end

	setActive(slot0:findTF("frame/btns/finish_btn", slot1), slot4 == Technology.STATE_FINISHED)

	if not slot3 then
		setActive(slot0:findTF("frame/btns/desc_btn", slot1), slot4 == Technology.STATE_IDLE)
		setActive(slot0:findTF("frame/btns/dev_btn", slot1), slot4 == Technology.STATE_STARTING)

		return
	end

	removeOnButton(slot5)
	removeOnButton(slot6)
	removeOnButton(slot7)
	setActive(slot0:findTF("frame/btns/start_btn", slot1), slot4 == Technology.STATE_IDLE)
	setActive(slot7, slot4 == Technology.STATE_STARTING)

	if slot4 == Technology.STATE_IDLE then
		onButton(slot0, slot6, function ()
			if _.any(slot0.technologyVOs, function (slot0)
				return slot0.state ~= Technology.STATE_IDLE
			end) then
				pg.TipsMgr:GetInstance():ShowTips(i18n("technology_is_actived"))

				return
			end

			if #slot1:getConfig("consume") > 0 then
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("technology_task_build_tip", getDropInfo(slot0)),
					onYes = function ()
						slot0:emit(TechnologyMediator.ON_START, {
							id = slot1.id,
							pool_id = slot1.poolId
						})

						return
					end
				})
			else
				slot0:emit(TechnologyMediator.ON_START, {
					id = slot1.id,
					pool_id = slot1.poolId
				})
			end

			return
		end, SFX_PANEL)
		setButtonEnabled(slot6, slot2:hasResToStart())
	else
		if slot4 == Technology.STATE_STARTING then
			onButton(slot0, slot7, function ()
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("technology_stop_tip"),
					onYes = function ()
						slot0:emit(TechnologyMediator.ON_STOP, {
							id = slot1.id,
							pool_id = slot1.poolId
						})

						return
					end
				})

				return
			end, SFX_PANEL)

			if slot2.time - pg.TimeMgr:GetInstance():GetServerTime() > 0 then
				slot0.refreshTimer[slot2.id] = Timer.New(function ()
					slot0:emit(TechnologyMediator.ON_TIME_OVER, slot1.id)

					return
				end, slot8, 1)

				slot0.refreshTimer[slot2.id]:Start()
			else
				slot0:emit(TechnologyMediator.ON_TIME_OVER, slot2.id)
			end
		else
			if slot4 == Technology.STATE_FINISHED then
				onButton(slot0, slot5, function ()
					slot0:emit(TechnologyMediator.ON_FINISHED, {
						id = slot1.id,
						pool_id = slot1.poolId
					})

					return
				end, SFX_PANEL)
			end
		end
	end

	return
end

function slot0.dfs(slot0, slot1, slot2)
	if slot1.name ~= "item_tpl" then
		for slot6 = 1, slot1.childCount, 1 do
			slot0:dfs(slot1:GetChild(slot6 - 1), slot2)
		end
	else
		slot2(slot1)
	end

	return
end

function slot0.updateInfo(slot0, slot1, slot2, slot3)
	setImageSprite(slot0:findTF("frame", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("bg") .. ((slot3 and "_l") or "")))
	setImageSprite(slot0:findTF("frame/icon_mask/icon", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("bg_icon")))
	setImageSprite(slot0:findTF("frame/label", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("label")))
	setImageSprite(slot0:findTF("frame/label/text", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("label_color")), true)
	setImageSprite(slot0:findTF("frame/label/version", slot1), GetSpriteFromAtlas("technologycard", "version_" .. slot2:getConfig("blueprint_version")), true)
	setText(slot0:findTF("frame/name_bg/Text", slot1), slot2:getConfig("name"))
	setText(slot0:findTF("frame/sub_name", slot1), slot2:getConfig("sub_name") or "")

	slot4 = slot2:getConfig("drop_client")
	slot6 = 0

	slot0:dfs(slot1:Find("frame/item_container"), function (slot0)
		slot1(slot0 + 1, slot0 + 1 <= #slot1)

		if slot0 <= #slot1 then
			slot2:updateItem(slot0, , slot1[slot0])
		end

		return
	end)

	if not slot3 then
		setActive(slot5:GetChild(1), #slot4 > 2)

		slot5:GetChild(0):GetComponent("HorizontalLayoutGroup").padding.right = (#slot4 == 4 and 25) or 0
		slot5:GetChild(1):GetComponent("HorizontalLayoutGroup").padding.left = (#slot4 == 4 and 25) or 0
	end

	return
end

function slot0.setIconColorful(slot0, slot1, slot2)
	slot3 = slot1:Find("icon/IconColorful(Clone)")

	if slot2 == 6 or slot2 == 5 then
		if not slot3 then
			PoolMgr.GetInstance():GetPrefab("UI/IconColorful", "IconColorful", true, function (slot0)
				setParent(slot0, slot0:Find("icon"))
				setActive(slot0, true)

				for slot4 = 5, 6, 1 do
					setActive(rtf(slot0):Find("r" .. slot4), slot4 == slot1)
				end

				setEffectClipRect(slot0)

				return
			end)
		else
			setActive(slot3, true)

			for slot7 = 5, 6, 1 do
				setActive(rtf(slot3):Find("r" .. slot7), slot7 == slot2)
			end

			setEffectClipRect(slot3)
		end
	else
		if slot3 then
			setActive(slot3, false)
		end
	end

	return
end

function slot0.updateItem(slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot3[1] == DROP_TYPE_RESOURCE then
		slot4 = Item.New({
			id = id2ItemId(slot3[2])
		})
	else
		if slot3[1] == DROP_TYPE_ITEM then
			slot4 = Item.New({
				id = slot3[2]
			})
		end
	end

	GetImageSpriteFromAtlasAsync(slot4:getConfig("icon"), "", slot7)

	slot8 = slot4:getConfig("rarity")

	setImageSprite(slot5, GetSpriteFromAtlas("TechnologyCard", "frame_" .. slot8))
	setImageSprite(slot6, GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(slot8)))
	slot0:setIconColorful(slot1, slot8)

	if not IsNil(slot0:findTF("count", slot1)) then
		slot11 = nil

		setColorCount(slot10, (slot3[1] ~= DROP_TYPE_RESOURCE or slot0.player:getResById(slot3[2])) and getProxy(BagProxy):getItemCountById(slot4.id), slot3[3])
	end

	onButton(slot0, slot1, function ()
		if #(slot0:getConfig("display_icon") or {}) > 0 then
			pg.MsgboxMgr.GetInstance():ShowItemBox({
				items = _.map(slot0, function (slot0)
					return {
						type = slot0[1],
						id = slot0[2]
					}
				end),
				content = slot0:getConfig("display"),
				itemFunc = function (slot0)
					slot0:emit(slot1.ON_ITEM, slot0.id)

					return
				end
			})
		else
			slot1:emit(slot2.ON_ITEM, slot0.id)
		end

		return
	end, SFX_PANEL)

	return
end

function slot0.clearTimer(slot0, ...)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	for slot4, slot5 in pairs(slot0.techTimer) do
		slot5:Stop()
	end

	slot0.techTimer = {}

	for slot4, slot5 in pairs(slot0.refreshTimer) do
		slot5:Stop()
	end

	slot0.refreshTimer = {}

	for slot4, slot5 in pairs(slot0.cardtimer) do
		slot5:Stop()
	end

	slot0.cardtimer = {}

	return
end

function slot0.willExit(slot0)
	slot0:clearTimer()

	slot0.techTimer = nil
	slot0.refreshTimer = nil

	return
end

return slot0
