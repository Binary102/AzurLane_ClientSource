slot0 = class("CollectionScene", import("..base.BaseUI"))
slot0.SHOW_DETAIL = "event show detail"
slot0.GET_AWARD = "event get award"
slot0.ACTIVITY_OP = "event activity op"
slot0.BEGIN_STAGE = "event begin state"
slot0.ON_INDEX = "event on index"
slot0.GO_LEVEL = "event go level"
slot0.GO_SCENE = "event go scene"
slot0.ShipOrderAsc = false
slot0.ShipIndex = {
	display = {
		index = IndexConst.FlagRange2Bits(IndexConst.IndexAll, IndexConst.IndexOther),
		camp = IndexConst.FlagRange2Bits(IndexConst.CampAll, IndexConst.CampOther),
		rarity = IndexConst.FlagRange2Bits(IndexConst.RarityAll, IndexConst.Rarity5)
	},
	index = IndexConst.Flags2Bits({
		IndexConst.IndexAll
	}),
	camp = IndexConst.Flags2Bits({
		IndexConst.CampAll
	}),
	rarity = IndexConst.Flags2Bits({
		IndexConst.RarityAll
	})
}

function slot0.getUIName(slot0)
	return "collectionui"
end

function slot0.setShipGroups(slot0, slot1)
	slot0.shipGroups = slot1
end

function slot0.setAwards(slot0, slot1)
	slot0.awards = slot1
end

function slot0.setCollectionRate(slot0, slot1, slot2, slot3)
	slot0.rate = slot1
	slot0.count = slot2
	slot0.totalCount = slot3
end

function slot0.setLinkCollectionCount(slot0, slot1)
	slot0.linkCount = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0.resPanel:setResources(slot0.player)
end

function slot0.setProposeList(slot0, slot1)
	slot0.proposeList = slot1
end

function slot0.init(slot0)
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.backBtn = findTF(slot0._tf, "top/back")
	slot0.playerResOb = slot0:findTF("top/playerRes")
	slot0.resPanel = PlayerResource.New()

	tf(slot0.resPanel._go):SetParent(tf(slot0.playerResOb), false)

	slot0.skipableMsgBoxTF = slot0:findTF("skipableMsgBox")
	slot0.contextData.toggle = slot0.contextData.toggle or 2
	slot0.toggles = {
		slot0:findTF("left_length/toggles/card"),
		slot0:findTF("left_length/toggles/display"),
		slot0:findTF("left_length/toggles/trans"),
		slot0:findTF("left_length/toggles/memory")
	}
	slot0.toggleUpdates = {
		"initCardPanel",
		"initDisplayPanel",
		"initCardPanel",
		"initMemoryPanel"
	}
	slot0.cardList = slot0:findTF("list_card/scroll"):GetComponent("LScrollRect")

	function slot0.cardList.onInitItem(slot0)
		slot0:onInitCard(slot0)
	end

	function slot0.cardList.onUpdateItem(slot0, slot1)
		slot0:onUpdateCard(slot0, slot1)
	end

	function slot0.cardList.onReturnItem(slot0, slot1)
		slot0:onReturnCard(slot0, slot1)
	end

	slot0.cardItems = {}
	slot0.cardContent = slot0:findTF("ships", slot0.cardList)
	slot0.cardShip = slot0:findTF("ship", slot0.cardList)

	setActive(slot0.cardShip, false)

	slot0.contextData.cardToggle = slot0.contextData.cardToggle or 1
	slot0.cardToggleGroup = slot0:findTF("list_card/types")
	slot0.cardToggles = {
		slot0:findTF("char", slot0.cardToggleGroup),
		slot0:findTF("link", slot0.cardToggleGroup),
		slot0:findTF("blueprint", slot0.cardToggleGroup)
	}
	slot0.bonusPanel = slot0:findTF("bonus_panel")
	slot0.charTpl = slot0:getTpl("chartpl")
	slot0.tip = slot0:findTF("left_length/toggles/display/tip")
	slot0.leftLength = slot0:findTF("left_length")
	slot0.top = slot0:findTF("top")
	slot0.favoriteVOs = {}

	for slot5, slot6 in ipairs(pg.storeup_data_template.all) do
		table.insert(slot0.favoriteVOs, Favorite.New({
			id = slot5
		}))
	end

	slot0.memoryGroups = _.map(pg.memory_group.all, function (slot0)
		return pg.memory_group[slot0]
	end)
	slot0.memories = nil
	slot0.memoryList = slot0:findTF("list_memory"):GetComponent("LScrollRect")

	function slot0.memoryList.onInitItem(slot0)
		slot0:onInitMemory(slot0)
	end

	function slot0.memoryList.onUpdateItem(slot0, slot1)
		slot0:onUpdateMemory(slot0, slot1)
	end

	function slot0.memoryList.onReturnItem(slot0, slot1)
		slot0:onReturnMemory(slot0, slot1)
	end

	slot0.memoryItems = {}
	slot0.memoryContent = slot0:findTF("memories", slot0.memoryList)
	slot0.memoryItem = slot0:findTF("memory", slot0.memoryList)
	slot0.memoryMask = slot0:findTF("story_mask", slot0.top)

	setActive(slot0.memoryItem, false)
	setActive(slot0.memoryMask, false)

	slot0.memoryTogGroup = slot0:findTF("top/memory")

	setActive(slot0.memoryTogGroup, false)

	slot0.memoryToggles = {
		slot0:findTF("top/memory/0"),
		slot0:findTF("top/memory/1"),
		slot0:findTF("top/memory/2"),
		slot0:findTF("top/memory/3")
	}
	slot0.memoryFilterIndex = {
		true,
		true,
		true
	}
	slot0.toggleTitles = {
		{
			slot0:findTF("bg/title_chara", slot0.top),
			slot0:findTF("bg/title_chara/handbook", slot0.top)
		},
		{
			slot0:findTF("bg/title_collect", slot0.top),
			slot0:findTF("bg/title_collect/chara_collection", slot0.top)
		},
		{
			slot0:findTF("bg/title_chara", slot0.top),
			slot0:findTF("bg/title_chara/handbook", slot0.top)
		},
		{
			slot0:findTF("bg/title_memory", slot0.top),
			slot0:findTF("bg/title_memory/memory", slot0.top)
		}
	}
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.top, {
		y = 84
	})
	setAnchoredPosition(slot0.leftLength, {
		x = -1 * slot0.leftLength.rect.width
	})
	shiftPanel(slot0.top, nil, 0, slot2, slot1, true, true)
	shiftPanel(slot0.leftLength, 0, nil, slot2, slot1, true, true)

	slot0.tweens = topAnimation(slot0:findTF("bg/left", slot0.top), slot0:findTF("bg/right", slot0.top), slot0.toggleTitles[slot0.contextData.toggle][1], slot0.toggleTitles[slot0.contextData.toggle][2], 0.25, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.top, nil, 84, slot2, slot1, true, true)
	shiftPanel(slot0.leftLength, -1 * slot0.leftLength.rect.width, nil, 0.3, 0, true, true)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.toggles[4]:GetComponent(typeof(Toggle)).isOn and slot0.memories then
			slot0:return2MemoryGroup()
		else
			slot0:uiExitAnimating()
			slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.3)
		end

		slot0.contextData.cardScrollValue = 0
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp"), false)
	end

	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(8)
	end, SFX_CONFIRM)

	for slot4, slot5 in ipairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				slot1(slot0:findTF("total", slot0.top), setActive ~= 4)
				slot1(slot0:findTF("memory", slot0.top), setActive == 4)

				if slot1 == 4 and slot0.memories then
					slot0:return2MemoryGroup()
				end

				if slot0.contextData.toggle ~=  then
					if slot0.contextData.toggle == 1 and slot0.contextData.cardToggle == 1 then
						slot0.contextData.cardScrollValue = slot0.cardList.value
					end

					slot0.contextData.toggle = slot0.contextData

					if slot0.toggleUpdates[] then
						slot0[slot0.toggleUpdates[slot0]](slot0)
						slot0:calFavoriteRate()
					end
				end
			end
		end, SFX_UI_TAG)
	end

	for slot4, slot5 in ipairs(slot0.memoryToggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				if slot0 == 1 then
					slot1.memoryFilterIndex = {
						true,
						true,
						true
					}
				else
					for slot4 in ipairs(slot1.memoryFilterIndex) do
						slot1.memoryFilterIndex[slot4] = slot0 - 1 == slot4
					end
				end

				slot1:memoryFilter()
			end
		end, SFX_UI_TAG)
	end

	slot0.contextData.toggle = -1

	triggerToggle(slot0.toggles[slot0.contextData.toggle], true)

	if slot0.contextData.memoryGroup and pg.memory_group[slot2] then
		slot0:showSubMemories(pg.memory_group[slot2])
	else
		triggerToggle(slot0.memoryToggles[1], true)
	end

	for slot6, slot7 in ipairs(slot0.cardToggles) do
		triggerToggle(slot7, slot0.contextData.cardToggle == slot6)
		onToggle(slot0, slot7, function (slot0)
			if slot0 and slot0.contextData.cardToggle ~=  then
				if slot0.contextData.cardToggle == 1 then
					slot0.contextData.cardScrollValue = slot0.cardList.value
				end

				slot0.contextData.cardToggle = slot0.contextData

				slot0:initCardPanel()
				slot0:calFavoriteRate()
			end
		end)
	end

	slot0:initIndexPanel()
	slot0:calFavoriteRate()
	pg.UIMgr.GetInstance():PartialBlur(slot0.top, true)
	SetParent(slot0.top, pg.UIMgr:GetInstance().OverlayMain)
	setAnchoredPosition(slot0.top, {
		y = 84
	})
	setAnchoredPosition(slot0.leftLength, {
		x = -1 * slot0.leftLength.rect.width
	})
	onNextTick(function ()
		if slot0.exited then
			return
		end

		slot0:uiStartAnimating()
	end)
	onButton(slot0, slot0.bonusPanel, function ()
		slot0:closeBonus()
	end, SFX_PANEL)
end

function slot0.updateCollectNotices(slot0, slot1)
	setActive(slot0.tip, slot1)
end

function slot0.calFavoriteRate(slot0)
	setActive(slot0:findTF("total/char", slot0.top), not (slot0.contextData.toggle == 1 and slot0.contextData.cardToggle == 2))
	setActive(slot0:findTF("total/link", slot0.top), slot0.contextData.toggle == 1 and slot0.contextData.cardToggle == 2)
	setText(slot0:findTF("total/char/rate", slot0.top), slot0.rate * 100 .. "%")
	setText(slot0:findTF("total/char/count", slot0.top), slot0.count .. "/" .. slot0.totalCount)
	setText(slot0:findTF("total/link/count", slot0.top), slot0.linkCount)
end

function slot0.initCardPanel(slot0)
	if slot0.contextData.toggle == 1 then
		setActive(slot0.cardToggleGroup, true)
		slot0:cardFilter()
	elseif slot0.contextData.toggle == 3 then
		setActive(slot0.cardToggleGroup, false)
		slot0:transFilter()
	end

	slot0.cardList:SetTotalCount(#slot0.codeShips, -1)
	slot0.cardList:ScrollTo(slot0.contextData.cardScrollValue or 0)
end

function slot0.initIndexPanel(slot0)
	slot0.indexBtn = slot0:findTF("top/index_button")

	onButton(slot0, slot0.indexBtn, function ()
		slot0 = Clone(slot0.ShipIndex.display)

		if slot0.ShipIndex.display.contextData.toggle == 1 and slot1.contextData.cardToggle == 2 then
			slot0.camp = nil
		end

		slot1:emit(slot0.ON_INDEX, {
			display = slot0,
			index = slot0.ShipIndex.index,
			camp = slot0.ShipIndex.camp,
			rarity = slot0.ShipIndex.rarity,
			callback = function (slot0)
				slot0.ShipIndex.index = slot0.index

				if slot0.camp then
					slot0.ShipIndex.camp = slot0.camp
				end

				slot0.ShipIndex.rarity = slot0.rarity

				slot0.ShipIndex:initCardPanel()
			end
		})
	end, SFX_PANEL)
end

function slot0.onInitCard(slot0, slot1)
	onButton(slot0, CollectionShipCard.New(slot1).go, function ()
		if slot0.state == ShipGroup.STATE_UNLOCK then
			if not slot1.onOpenDetail then
				slot1:uiExitAnimating()
				LeanTween.delayedCall(0.2, System.Action(function ()
					slot0.contextData.cardScrollValue = slot0.cardList.value

					slot0.contextData:emit(slot1.SHOW_DETAIL, slot2.showTrans, slot2.shipGroup.id)

					slot0.contextData.emit.onOpenDetail = false
				end))

				0.2.onOpenDetail = true
			end
		elseif slot0.state == ShipGroup.STATE_NOTGET and slot0.config then
			slot1:showSkipableMsgBox(slot0.config.description, slot0.shipGroup:getShipConfigId())
		end
	end, SOUND_BACK)

	slot0.cardItems[slot1] = CollectionShipCard.New(slot1)
end

function slot0.showSkipableMsgBox(slot0, slot1, slot2)
	if slot0.isShowSkipableMsg then
		return
	end

	slot0.isShowSkipableMsg = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.skipableMsgBoxTF)
	setActive(slot0.skipableMsgBoxTF, slot0.isShowSkipableMsg)

	if not slot0.skipableList then
		slot3 = slot0.skipableMsgBoxTF:Find("window/bg/main/skipable_list")
		slot0.skipableList = UIItemList.New(slot3, slot4)

		onButton(slot0, findTF(slot0.skipableMsgBoxTF, "window/bg/top/btnBack"), function ()
			slot0:closeSkipableMsgBox()
		end, SFX_PANEL)
		onButton(slot0, slot0.skipableMsgBoxTF, function ()
			slot0:closeSkipableMsgBox()
		end, SFX_PANEL)
	end

	updateDrop(slot0:findTF("window/bg/main", slot0.skipableMsgBoxTF), slot3)
	setText(slot0:findTF("window/bg/main/name_bg/Text", slot0.skipableMsgBoxTF), pg.ship_data_statistics[slot2].name)
	slot0.skipableList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot6 = slot0[slot1 + 1][3]

			setText(slot2:Find("title"), slot4)
			setActive(slot2:Find("skip_btn"), slot0[slot1 + 1][2][1] ~= "")

			if slot5[1] ~= "" then
				onButton(slot1, slot2:Find("skip_btn"), function ()
					if slot0 and slot0 ~= 0 and (not getProxy(ActivityProxy):getActivityById(getProxy(ActivityProxy).getActivityById) or slot0:isEnd()) then
						pg.TipsMgr:GetInstance():ShowTips(i18n("collection_way_is_unopen"))

						return
					end

					if slot1[1] == "LEVEL" and slot1[2] then
						slot2:emit(slot3.GO_LEVEL, slot1[2].chapterid)
					elseif slot1[1] == "COLLECTSHIP" then
						slot0 = 0
						slot1 = slot1[2].shipGroupId

						for slot5, slot6 in ipairs(slot2.favoriteVOs) do
							if slot6:containShipGroup(slot1) then
								slot0 = slot5

								break
							end
						end

						if not slot2.isInitDisplay then
							slot2:initDisplayPanel()
						end

						slot2.contextData.displayPos = slot2.displayRect:HeadIndexToValue(slot0 - 1)

						triggerToggle(slot2.toggles[2], true)
						triggerToggle:closeSkipableMsgBox()
					elseif slot1[1] == "SHOP" and slot1[2].warp == "supplies" and not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot2.player.level, "MilitaryExerciseMediator") then
						pg.TipsMgr:GetInstance():ShowTips(i18n("military_shop_no_open_tip"))
					else
						slot2:emit(slot3.GO_SCENE, SCENE[slot1[1]], slot1[2])
					end
				end, SFX_PANEL)
			end
		end
	end)
	slot0.skipableList:align(#slot1)
end

function slot0.closeSkipableMsgBox(slot0)
	if slot0.isShowSkipableMsg then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.skipableMsgBoxTF, slot0._tf)

		slot0.isShowSkipableMsg = false

		setActive(slot0.skipableMsgBoxTF, slot0.isShowSkipableMsg)
	end
end

function slot0.onUpdateCard(slot0, slot1, slot2)
	if not slot0.cardItems[slot2] then
		slot0:onInitCard(slot2)

		slot3 = slot0.cardItems[slot2]
	end

	slot6 = false

	if slot0.codeShips[slot1 + 1].group then
		slot6 = slot0.proposeList[slot5.group.id]
	end

	slot3:update(slot5.code, slot5.group, slot5.showTrans, slot6, slot5.id)
end

function slot0.onReturnCard(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if slot0.cardItems[slot2] then
		slot3:clear()
	end
end

function slot0.cardFilter(slot0)
	slot0.codeShips = {}
	slot2 = _.min(slot1)
	slot3 = _.max(slot1)

	if slot0.ShipIndex.index == bit.lshift(1, IndexConst.IndexAll) and slot0.ShipIndex.rarity == bit.lshift(1, IndexConst.RarityAll) and slot0.contextData.cardToggle == 1 and slot0.ShipIndex.camp == bit.lshift(1, IndexConst.CampAll) then
		for slot7 = slot2, slot3, 1 do
			slot8 = false
			slot10 = false

			if pg.ship_data_group[slot7] then
				slot8 = slot0.shipGroups[slot9.group_type]
				slot10 = Nation.IsLinkType(ShipGroup.getDefaultShipConfig(slot9.group_type).nationality)
			end

			if slot0.contextData.cardToggle == 1 and not slot10 then
				slot0.codeShips[slot7] = {
					showTrans = false,
					id = slot7,
					code = slot7,
					group = slot8
				}
			elseif slot0.contextData.cardToggle == 2 and slot10 then
				slot0.codeShips[slot7] = {
					showTrans = false,
					id = slot7,
					code = slot7 - 10000,
					group = slot8
				}
			elseif slot0.contextData.cardToggle == 3 then
				slot0.codeShips[slot7] = {
					showTrans = false,
					id = slot7,
					code = slot7 - 20000,
					group = slot8
				}
			end
		end
	else
		for slot7 = slot2, slot3, 1 do
			if pg.ship_data_group[slot7] then
				slot9 = ShipGroup.New({
					id = slot8.group_type
				})
				slot10 = slot0.shipGroups[slot8.group_type]

				if ShipGroup.getState(slot7, slot0.shipGroups[slot8.group_type], false) ~= ShipGroup.STATE_LOCK and slot9 and IndexConst.filterByIndex(slot9, slot0.ShipIndex.index) and IndexConst.filterByRarity(slot9, slot0.ShipIndex.rarity) then
					slot12 = Nation.IsLinkType(slot9:getNation())

					if slot0.contextData.cardToggle == 1 and not slot12 and IndexConst.filterByCamp(slot9, slot0.ShipIndex.camp) then
						slot0.codeShips[#slot0.codeShips + 1] = {
							showTrans = false,
							id = slot7,
							code = slot7,
							group = slot10
						}
					elseif slot0.contextData.cardToggle == 2 and slot12 then
						slot0.codeShips[#slot0.codeShips + 1] = {
							showTrans = false,
							id = slot7,
							code = slot7 - 10000,
							group = slot10
						}
					elseif slot0.contextData.cardToggle == 3 and IndexConst.filterByCamp(slot9, slot0.ShipIndex.camp) then
						slot0.codeShips[#slot0.codeShips + 1] = {
							showTrans = false,
							id = slot7,
							code = slot7 - 20000,
							group = slot10
						}
					end
				end
			end
		end
	end
end

function slot0.transFilter(slot0)
	slot0.codeShips = {}
	slot2 = _.min(slot1)
	slot3 = _.max(slot1)

	if slot0.ShipIndex.index == bit.lshift(1, IndexConst.IndexAll) and slot0.ShipIndex.rarity == bit.lshift(1, IndexConst.RarityAll) and slot0.ShipIndex.camp == bit.lshift(1, IndexConst.CampAll) then
		for slot7 = slot2, slot3, 1 do
			slot8 = false

			if pg.ship_data_group[slot7] and pg.ship_data_trans[slot9.group_type] then
				if slot0.shipGroups[slot9.group_type] and not slot10.trans then
					slot10 = nil
				end

				slot0.codeShips[#slot0.codeShips + 1] = {
					showTrans = true,
					id = slot7,
					code = 3000 + slot7,
					group = slot10
				}
			end
		end
	else
		for slot7 = slot2, slot3, 1 do
			if pg.ship_data_group[slot7] and slot0.shipGroups[slot8.group_type] and slot9.trans and IndexConst.filterByIndex(slot9, slot0.ShipIndex.index) and IndexConst.filterByRarity(slot9, slot0.ShipIndex.rarity) and IndexConst.filterByCamp(slot9, slot0.ShipIndex.camp) then
				slot0.codeShips[#slot0.codeShips + 1] = {
					showTrans = true,
					id = slot7,
					code = 3000 + slot7,
					group = slot9
				}
			end
		end
	end
end

function slot0.createFavorite(slot0, slot1)
	return {
		go = slot1,
		tr = tf(slot1),
		charTpl = slot0.charTpl,
		charContainer = ()["tr"]:Find("char_list"),
		isInitChar = false,
		maxStar = 0,
		nameTF = ()["tr"]:Find("namePanel/name"):GetComponent(typeof(Text)),
		countTF = ()["tr"]:Find("namePanel/star_container/starCount"):GetComponent(typeof(Text)),
		tagFecth = ()["tr"]:Find("bonus/item_tpl/tags/fecth"),
		tagFecthed = ()["tr"]:Find("bonus/item_tpl/tags/fecthed"),
		tagLock = ()["tr"]:Find("bonus/item_tpl/tags/lock"),
		tip = ()["tr"]:Find("bonus/tip"),
		starCount = ()["tr"]:Find("bonus/stars/process"):GetComponent(typeof(Text)),
		awardTF = ()["tr"]:Find("bonus/item_tpl"),
		iconTF = ()["awardTF"]:Find("icon_bg"),
		box = ()["tr"]:Find("box"),
		createChar = function (slot0, slot1)
			return {
				go = slot1,
				tr = tf(slot1),
				icon = ()["tr"]:Find("icon"),
				iconImg = ()["icon"]:GetComponent(typeof(Image)),
				stars = findTF(()["tr"], "stars"),
				starTpl = findTF(()["stars"], "star"),
				name = findTF(()["tr"], "name"):GetComponent(typeof(Text)),
				update = function (slot0, slot1, slot2)
					slot0.name.text = slot1:getConfig("name")

					LoadSpriteAsync("shipmodels/" .. Ship.getPaintingName(slot1.configId), function (slot0)
						if slot0 then
							rtf(slot0.icon).pivot = getSpritePivot(slot0)
							rtf(slot0.icon).iconImg.sprite = slot0

							rtf(slot0.icon).iconImg.iconImg:SetNativeSize()
						end
					end)
					setActive(slot0.stars, slot2)

					if slot2 then
						setImageColor(slot0.icon, Color.New(1, 1, 1, 1))

						for slot7 = slot0.stars.childCount + 1, slot1:getMaxStar(), 1 do
							cloneTplTo(slot0.starTpl, slot0.stars)
						end

						for slot8 = 0, slot0.stars.childCount - 1, 1 do
							setActive(slot0.stars:GetChild(slot4 - 1 - slot8), slot8 < slot3)
							setActive(slot9:Find("emptystartpl"), slot2.star <= slot8)
							setActive(slot9:Find("startpl"), slot8 < slot2.star)
						end
					else
						setImageColor(slot0.icon, Color.New(0, 0, 0, 0.3))
					end
				end
			}
		end,
		update = function (slot0, slot1, slot2, slot3)
			slot0.favoriteVO = slot1
			slot0.shipGroups = slot2
			slot0.awards = slot3
			slot4 = {}

			for slot9 = slot0.charContainer.childCount, #slot1:getConfig("char_list") - 1, 1 do
				cloneTplTo(slot0.charTpl, slot0.charContainer)
			end

			for slot9 = 0, slot0.charContainer.childCount - 1, 1 do
				setActive(slot0.charContainer:GetChild(slot9), slot9 < #slot5)

				slot11 = slot5[slot9 + 1]

				if slot9 < #slot5 then
					slot4[slot11] = slot0:createChar(slot10)
				end
			end

			slot6 = 0
			slot7 = 0

			for slot11, slot12 in pairs(slot4) do
				slot12:update(Ship.New({
					configId = slot11 * 10 + 1
				}), slot2[slot11])

				slot6 = slot6 + ((slot2[slot11] and slot2[slot11].star) or 0)
				slot7 = slot7 + slot14:getMaxStar()
			end

			slot0.nameTF.text = slot1:getConfig("name")
			slot0.countTF.text = slot6 .. "/" .. slot7

			slot0:updateBound()
		end,
		updateBound = function (slot0)
			slot0.state = slot0.favoriteVO:getState(slot0.shipGroups, slot0.awards)

			setActive(slot0.tagFecth, slot0.state == Favorite.STATE_AWARD)
			setActive(slot0.tagFecthed, slot0.state == Favorite.STATE_FETCHED)
			setActive(slot0.tagLock, slot0.state == Favorite.STATE_LOCK)
			setActive(slot0.tip, slot0.state == Favorite.STATE_AWARD)

			if slot0.state ~= Favorite.STATE_LOCK then
				setGray(slot0.iconTF, slot0.state ~= Favorite.STATE_AWARD, true)
			end

			updateDrop(slot0.awardTF, {
				type = (slot0.favoriteVO:getConfig("award_display")[slot0.favoriteVO:getNextAwardIndex(slot0.awards)] and slot2[slot1]) or slot2[#slot2][1],
				id = (slot0.favoriteVO.getConfig("award_display")[slot0.favoriteVO.getNextAwardIndex(slot0.awards)] and slot2[slot1]) or slot2[#slot2][2],
				count = (slot0.favoriteVO.getConfig("award_display")[slot0.favoriteVO.getNextAwardIndex(slot0.awards)] and slot2[slot1]) or slot2[#slot2][3]
			})

			slot0.starCount.text = slot0.favoriteVO:getStarCount(slot0.shipGroups) .. "/" .. (slot0.favoriteVO:getConfig("level")[slot1] or slot4[#slot4])
		end
	}
end

function slot0.sortDisplay(slot0)
	table.sort(slot0.favoriteVOs, function (slot0, slot1)
		if slot0:getState(slot0.shipGroups, slot0.awards) == slot1:getState(slot0.shipGroups, slot0.awards) then
			return slot0.id < slot1.id
		else
			return slot2 < slot3
		end
	end)
	slot0.displayRect:SetTotalCount(#slot0.favoriteVOs, (slot0.contextData.displayPos and slot0.contextData.displayPos) or 0)
end

function slot0.initDisplayPanel(slot0)
	if not slot0.isInitDisplay then
		slot0.isInitDisplay = true
		slot0.displayRect = slot0:findTF("list_display"):GetComponent("LScrollRect")

		function slot0.displayRect.onInitItem(slot0)
			slot0:initFavoriteCard(slot0)
		end

		function slot0.displayRect.onUpdateItem(slot0, slot1)
			slot0:updateFavoriteCard(slot0, slot1)
		end

		slot0.favoriteCards = {}
	end

	slot0:sortDisplay()
end

function slot0.initFavoriteCard(slot0, slot1)
	slot2 = slot0:createFavorite(slot1)

	onButton(slot0, slot2.awardTF, function ()
		if slot0.state == Favorite.STATE_AWARD then
			slot1:emit(slot2.GET_AWARD, slot0.favoriteVO.id, slot0.favoriteVO:getNextAwardIndex(slot0.awards))
		elseif slot0.state == Favorite.STATE_LOCK then
			pg.TipsMgr:GetInstance():ShowTips(i18n("collection_lock"))
		elseif slot0.state == Favorite.STATE_FETCHED then
			pg.TipsMgr:GetInstance():ShowTips(i18n("collection_fetched"))
		elseif slot0.state == Favorite.STATE_STATE_WAIT then
			pg.TipsMgr:GetInstance():ShowTips(i18n("collection_nostar"))
		end
	end, SFX_PANEL)
	onButton(slot0, slot2.box, function ()
		slot0:openBonus(slot1.favoriteVO)
	end, SFX_PANEL)

	slot0.favoriteCards[slot1] = slot2
end

function slot0.updateFavoriteCard(slot0, slot1, slot2)
	if not slot0.favoriteCards[slot2] then
		slot0:initFavoriteCard(slot2)

		slot3 = slot0.favoriteCards[slot2]
	end

	slot3:update(slot0.favoriteVOs[slot1 + 1], slot0.shipGroups, slot0.awards)
end

function slot0.openBonus(slot0, slot1)
	if not slot0.isInitBound then
		slot0.isInitBound = true
		slot0.boundName = findTF(slot0.bonusPanel, "frame/name/Text"):GetComponent(typeof(Text))
		slot0.progress = findTF(slot0.bonusPanel, "frame/progress/bar"):GetComponent(typeof(Image))
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.bonusPanel)
	setActive(slot0.bonusPanel, true)

	slot0.boundName.text = slot1:getConfig("name")
	slot2 = slot1:getConfig("award_display")

	for slot7, slot8 in ipairs(slot3) do
		slot9 = slot2[slot7]

		setText(findTF(slot10, "star/count"), slot8)
		setActive(findTF(slot10, "lingqu"), slot1:getAwardState(slot0.shipGroups, slot0.awards, slot7) == Favorite.STATE_AWARD)
		setActive(findTF(slot10, "yilingqu"), slot11 == Favorite.STATE_FETCHED)
		setActive(findTF(slot10, "weikaifang"), slot11 == Favorite.STATE_LOCK)

		if slot9 then
			updateDrop(findTF(slot10, "item_tpl"), {
				count = 0,
				type = slot9[1],
				id = slot9[2]
			})
			onButton(slot0, slot10, function ()
				if slot0[1] == DROP_TYPE_RESOURCE then
					slot1:emit(slot2.ON_ITEM, id2ItemId(slot0[2]))
				elseif slot0[1] == DROP_TYPE_ITEM then
					slot1:emit(slot2.ON_DROP, {
						type = slot0[1],
						id = slot0[2],
						count = slot0[3]
					})
				elseif slot0[1] == DROP_TYPE_SHIP then
					pg.MsgboxMgr:GetInstance():showSingleItemBox({
						hideNo = true,
						drop = {
							type = slot0[1],
							id = slot0[2],
							count = slot0[3]
						}
					})
				elseif slot0[1] == DROP_TYPE_FURNITURE then
					pg.MsgboxMgr.GetInstance():showSingleItemBox({
						hideNo = true,
						content = "",
						yesText = "text_confirm",
						drop = {
							type = DROP_TYPE_FURNITURE,
							id = slot0[2],
							cfg = pg.furniture_data_template[slot0[2]]
						}
					})
				elseif slot0[1] == DROP_TYPE_EQUIP then
					slot1:emit(slot2.ON_EQUIPMENT, {
						equipmentId = slot0[2],
						type = EquipmentInfoMediator.DISPLAY
					})
				end
			end, SFX_PANEL)
		else
			GetOrAddComponent(slot10, typeof(Button)).onClick:RemoveAllListeners()
		end
	end

	slot0.progress.fillAmount = slot1:getStarCount(slot0.shipGroups) / slot3[#slot3]
end

function slot0.closeBonus(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.bonusPanel, slot0._tf)
	setActive(slot0.bonusPanel, false)
end

function slot0.showSubMemories(slot0, slot1)
	slot0.contextData.memoryGroup = slot1.id
	slot0.memories = _.map(slot1.memories, function (slot0)
		return pg.memory_template[slot0]
	end)

	slot0.memoryList:SetTotalCount(#slot0.memories, 0)
	setActive(slot0:findTF("memory", slot0.top), false)
end

function slot0.return2MemoryGroup(slot0)
	slot0.contextData.memoryGroup = nil
	slot0.memories = nil

	slot0.memoryList:SetTotalCount(#slot0.memoryGroups, 0)
	setActive(slot0:findTF("memory", slot0.top), true)
end

function slot0.initMemoryPanel(slot0)
	if getProxy(ActivityProxy):getActivityById(ActivityConst.QIXI_ACTIVITY_ID) and not slot2:isEnd() and getProxy(TaskProxy):getTaskById(_.flatten(slot3)[#_.flatten(slot3)]) and not slot7:isFinish() then
		pg.StoryMgr.GetInstance():Play("HOSHO8", function ()
			slot0:emit(CollectionScene.ACTIVITY_OP, {
				cmd = 2,
				activity_id = slot1.id
			})
		end, true)
	end

	slot0:memoryFilter()
end

function slot0.onInitMemory(slot0, slot1)
	onButton(slot0, MemoryCard.New(slot1).go, function ()
		if slot0.info then
			if slot0.isGroup then
				slot1:showSubMemories(slot0.info)
			elseif slot0.info.is_open == 1 or pg.StoryMgr.GetInstance():IsPlayed(slot0.info.story, true) then
				slot1:playMemory(slot0.info)
			end
		end
	end, SOUND_BACK)

	slot0.memoryItems[slot1] = MemoryCard.New(slot1)
end

function slot0.onUpdateMemory(slot0, slot1, slot2)
	if not slot0.memoryItems[slot2] then
		slot0:onInitMemory(slot2)

		slot3 = slot0.memoryItems[slot2]
	end

	if slot0.memories then
		slot3:update(false, slot0.memories[slot1 + 1])
	else
		slot3:update(true, slot0.memoryGroups[slot1 + 1])
	end

	_.any({
		slot3.lock,
		slot3.normal,
		slot3.group
	}, function (slot0)
		if isActive(slot0) then
			slot0.go:GetComponent(typeof(Button)).targetGraphic = slot0:GetComponent(typeof(Image))
		end

		return slot1
	end)
end

function slot0.onReturnMemory(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	if slot0.memoryItems[slot2] then
		slot3:clear()
	end
end

function slot0.playMemory(slot0, slot1)
	if slot1.type == 1 then
		slot2 = findTF(slot0.memoryMask, "pic")

		if string.len(slot1.mask) > 0 then
			setActive(slot2, true)

			slot2:GetComponent(typeof(Image)).sprite = LoadSprite(slot1.mask)
		else
			setActive(slot2, false)
		end

		setActive(slot0.memoryMask, true)
		pg.StoryMgr.GetInstance():Play(slot1.story, function ()
			setActive(slot0.memoryMask, false)
		end, true)
	elseif slot1.type == 2 then
		slot3 = 0

		for slot7, slot8 in pairs(slot2) do
			if slot1.story == slot8 then
				slot3 = slot7

				break
			end
		end

		slot0:emit(slot0.BEGIN_STAGE, {
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = slot3
		})
	end
end

function slot0.memoryFilter(slot0)
	slot0.memoryGroups = {}

	for slot4, slot5 in pairs(pg.memory_group) do
		if slot0.memoryFilterIndex[slot5.type] then
			table.insert(slot0.memoryGroups, slot5)
		end
	end

	table.sort(slot0.memoryGroups, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.memoryList:SetTotalCount(#slot0.memoryGroups, 0)
end

function slot0.willExit(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	SetParent(slot0.top, slot0._tf)
	pg.UIMgr.GetInstance():PartialBlur(slot0.top, false)

	if slot0.bonusPanel.gameObject.activeSelf then
		slot0:closeBonus()
	end

	Destroy(slot0.bonusPanel)

	slot0.bonusPanel = nil

	slot0.resPanel:exit()

	slot0.resPanel = nil

	for slot4, slot5 in pairs(slot0.cardItems) do
		slot5:clear()
	end

	slot0:closeSkipableMsgBox()

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.bonusPanel.gameObject.activeSelf then
		slot0:closeBonus()

		return
	end

	if slot0.isShowSkipableMsg then
		slot0:closeSkipableMsgBox()

		return
	end

	triggerButton(slot0.backBtn)
end

return slot0
