slot0 = class("BillboardLayer", import("..base.BaseUI"))
slot0.PAGE_MILITARY = "military_btn"
slot0.PAGE_POWER = "fighting_btn"
slot0.PAGE_CHALLENGE = "challenge_btn"
slot0.PAGE_EXTRA_CHAPTER = "extra_chpater_btn"
slot0.PAGE_BOSS_BATTLE = "act_boss_battle_btn"
slot0.type2name = {
	"fighting",
	"collect",
	"pt",
	"pledge",
	"challenge",
	"extra_chpater",
	"act_boss_battle",
	military = "military"
}
slot0.type2pic = {
	"chara_battle",
	"chara_rank_collect",
	"chara_rank_pt",
	"chara_rank_collect",
	"challenge_rank",
	"title_extra_chapter",
	"chara_rank_boss_battle",
	military = "chara_rank_mil"
}
slot0.tpye2titleWord = {
	{
		5,
		7,
		8,
		1
	},
	{
		5,
		7,
		8,
		2
	},
	{
		5,
		7,
		8,
		9
	},
	{
		5,
		7,
		8,
		3
	},
	{
		5,
		7,
		8,
		4
	},
	{
		5,
		7,
		8,
		4
	},
	{
		5,
		7,
		8,
		10
	},
	military = {
		5,
		6,
		8,
		9
	}
}

function slot0.getUIName(slot0)
	return "BillboardUI"
end

function slot0.getRankMsgList(slot0)
	if not slot0.rankMsgList then
		slot0.rankMsgList, slot0.rankMsgInfo = getProxy(MilitaryExerciseProxy):getRankMsg()
	end

	return slot0.rankMsgList
end

function slot0.getRankMsgInfo(slot0, slot1)
	if not slot0.rankMsgInfo then
		slot0:getRankMsgList()
	end

	return slot0.rankMsgInfo[slot1]
end

function slot0.getRankMsgId(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot3) do
		if slot0.rankMsgInfo[slot8].type == slot1 and (not slot2 or slot2 == slot9.act_id) then
			return slot2 or slot1
		end
	end

	return nil
end

function slot0.setBillboard(slot0, slot1)
	slot0.billboard = slot1 or {}

	slot0:updateBillboard()
end

function slot0.setRank(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0.rankList[slot0:getRankMsgId(slot4, slot5)] then
		slot0.rankList[slot6] = {}
	end

	slot0.rankList[slot6][slot3 or 1] = slot1 or {}
	slot0.nextTime[slot6] = slot2

	if slot3 < 5 and slot0.rankList[slot6][slot3] and #slot0.rankList[slot6][slot3] >= 20 then
		slot0:emit(BillboardMediator.GET_POWERRANK, slot4, slot3 + 1, slot5)
	else
		slot0:updateRankCount(slot6)
		slot0:addRefreshTimer(slot0.nextTime[slot6], slot6)
	end
end

function slot0.setPresonalPoint(slot0, slot1, slot2, slot3)
	slot0.myPoint[slot4] = (slot0.myPoint[slot0:getRankMsgId(slot2, slot3)] and math.max(slot0.myPoint[slot4], slot1)) or slot1
end

function slot0.setPlayerRank(slot0, slot1, slot2, slot3, slot4)
	slot0.myPoint[slot5] = (slot0.myPoint[slot0:getRankMsgId(slot3, slot4)] and math.max(slot0.myPoint[slot5], slot1)) or slot1
	slot0.myRank[slot5] = (slot0.myRank[slot5] and math.max(slot0.myRank[slot5], slot2)) or slot2

	slot0:updatePlayerRankInfo(slot5)
end

function slot0.setSeasonInfo(slot0, slot1)
	slot0.seasonInfo = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setPlayerShip(slot0, slot1)
	slot0.playerShip = slot1
end

function slot0.init(slot0)
	slot0.rankList = {}
	slot0.myPoint = {}
	slot0.myRank = {}
	slot0.nextTime = {}
	slot0.initedRank = {}
	slot0.scroll = {}
	slot0.rankItems = {}
	slot0.rtPage = {}
	slot0.rtBtn = {}
	slot0.pageInit = {}
	slot0.closeBtn = slot0:findTF("top/btnBack")
	slot0.res = slot0:findTF("frame/res")
	slot0.sortBtns = slot0:findTF("frame/table_panel")
	slot0.tableTpl = slot0:findTF("btn_tpl", slot0.sortBtns)
	slot0.tipText = slot0:findTF("tip", slot0.sortBtns)
	slot0.mainPanel = slot0:findTF("frame/main_panel")
	slot0.pageTpl = slot0:findTF("page_tpl", slot0.mainPanel)
	slot0.militaryPage = slot0:findTF("military_page", slot0.mainPanel)
	slot0.collectCountAll = getProxy(CollectionProxy):getCollectionTotal()
	slot1 = slot0:findTF("title/frame", slot0.militaryPage)

	for slot5 = 1, 4, 1 do
		setText(slot1:GetChild(slot5 - 1), i18n("ranking_word_" .. slot0.tpye2titleWord.military[slot5]))
	end

	setActive(slot0.tableTpl, false)
	setActive(slot0.pageTpl, false)
	SetParent(slot0.tipText, slot0.res)

	for slot6, slot7 in ipairs(slot2) do
		slot0.rtPage[slot7] = cloneTplTo(slot0.pageTpl, slot0.mainPanel, slot0.type2name[slot0.rankMsgInfo[slot7].type] .. "_page")

		setActive(slot0.rtPage[slot7], false)

		slot9 = slot0:findTF("title/frame", slot0.rtPage[slot7])

		for slot13 = 1, 4, 1 do
			setText(slot9:GetChild(slot13 - 1), i18n("ranking_word_" .. slot0.tpye2titleWord[slot8.type][slot13]))
		end

		if slot8.type == 3 then
			setText(slot9:GetChild(3), pg.item_data_statistics[id2ItemId(getProxy(ActivityProxy):getActivityById(slot8.act_id):getConfig("config_id"))].name)
		end

		slot0.scroll[slot7] = slot0:findTF("content/rank_list", slot0.rtPage[slot7]):GetComponent("LScrollRect")
		slot0.rankItems[slot7] = {}

		slot0.scroll[slot7].onInitItem = function (slot0)
			slot0.rankItems[][slot0] = slot0:createRankItem(slot0)
		end

		slot0.scroll[slot7].onUpdateItem = function (slot0, slot1)
			if not slot0.rankItems[slot1][slot1] then
				slot0.rankItems[slot1][slot1] = slot0:createPowerRankItem(slot1)
			end

			slot0.rankList[slot1][math.floor(slot0 / 20) + 1][slot0 % 20 + 1].medal_small = slot0:getRankMsgInfo(slot1).medal_small
			slot3.max = (slot0.getRankMsgInfo(slot1).type == 2 and slot0.collectCountAll) or nil
			slot3.isTypePower = slot4.type == 1

			slot0:updatePowerRankTF(slot2.tf, slot3)
		end

		slot0.rtBtn[slot7] = cloneTplTo(slot0.tableTpl, slot0.sortBtns, slot0.type2name[slot8.type] .. "_btn")

		GetImageSpriteFromAtlasAsync("ui/billboardui_atlas", slot0.type2pic[slot8.type], slot0:findTF("off/Image", slot0.rtBtn[slot7]), true)
		GetImageSpriteFromAtlasAsync("ui/billboardui_atlas", slot0.type2pic[slot8.type] .. "_sel", slot0:findTF("on/Image", slot0.rtBtn[slot7]), true)
		onToggle(slot0, slot0.rtBtn[slot7], function (slot0)
			if slot0 and not slot0.pageInit[] then
				slot0:emit(BillboardMediator.INIT_RANK, slot0:getRankMsgInfo(slot0.emit))

				slot0.pageInit[] = true
			end

			setActive(slot0.rtPage[slot1], slot0)
			setActive(slot0.tipText, slot0)
		end, SFX_UI_TAG)
	end

	SetParent(slot0.tipText, slot0.sortBtns)

	slot0.title = slot0:findTF("title", slot0.militaryPage)
	slot0.content = slot0:findTF("content", slot0.militaryPage)
	slot0.rankContainer = slot0:findTF("rank_list/content", slot0.content)
	slot0.rankTpl = slot0:getTpl("rank_list/ranktpl", slot0.content)
	slot0.starty = slot0.rankContainer.anchoredPosition.y
	slot0.height = slot0.rankTpl:GetComponent(typeof(LayoutElement)).preferredHeight + slot0.rankContainer:GetComponent(typeof(VerticalLayoutGroup)).spacing
	slot0.scrollRect = slot0:findTF("military_page/content/rank_list", slot0.mainPanel)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.closeBtn, function ()
		slot0:emit(slot1.ON_BACK)

		return
	end, SFX_CANCEL)

	slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "BillboardMediator")

	for slot6, slot7 in ipairs(slot2) do
		if slot0.rankMsgInfo[slot7].type == 1 or slot8.type == 2 then
			setActive(slot0.sortBtns:GetChild(slot6), slot1)
		end
	end

	onToggle(slot0, slot0.sortBtns:Find("military_btn"), function (slot0)
		setActive(slot0.militaryPage, slot0)
		setActive(slot0.tipText, not slot0)

		return
	end, SFX_UI_TAG)
	slot0:updatePlayerMilitaryRankInfo()

	slot3 = slot0.contextData.index or BillboardLayer.PAGE_MILITARY

	triggerToggle(slot0.sortBtns:Find(slot0.contextData.index or BillboardLayer.PAGE_MILITARY), true)
	setActive(slot0.sortBtns, not ((slot0.contextData.index or BillboardLayer.PAGE_MILITARY) == BillboardLayer.PAGE_EXTRA_CHAPTER and slot0.contextData.view == "LevelScene2"))
	setActive(slot0:findTF("frame/extra_chapter_bg"), (slot0.contextData.index or BillboardLayer.PAGE_MILITARY) == BillboardLayer.PAGE_EXTRA_CHAPTER and slot0.contextData.view == "LevelScene2")

	return

	slot3 = BillboardLayer.PAGE_MILITARY

	if slot0.contextData.view ~= "LevelScene2" then
		slot4 = false
	else
		slot4 = true
	end
end

function slot0.filter(slot0, slot1)
	return
end

function slot0.updateBillboard(slot0)
	if not slot0.isInitBillboard then
		eachChild(slot0.rankContainer, function (slot0)
			setActive(slot0, false)

			return
		end)

		slot0.rankTFs = {}

		for slot4, slot5 in ipairs(slot0.billboard) do
			slot6 = nil

			if slot4 > 3 then
				slot6 = cloneTplTo(slot0.rankTpl, slot0.rankContainer)
			else
				if slot4 > 0 and slot4 <= 3 then
					setActive(slot0.rankContainer:Find("ranktpl_" .. slot4), true)
				end
			end

			slot0.rankTFs[slot5.id] = slot6
		end

		slot0.loadRanks = Clone(slot0.billboard)
		slot1 = getBounds(slot0.scrollRect)

		onScroll(slot0, slot0.scrollRect, throttle(function (slot0)
			if not slot0._isLoaded then
				return
			end

			slot1 = {}

			for slot5, slot6 in pairs(slot0.loadRanks) do
				if getBounds(slot8):Intersects(slot1) and go(slot8).activeSelf then
					slot0:updateRankInfo(slot6)
				else
					table.insert(slot1, slot6)
				end
			end

			slot0.loadRanks = slot1

			return
		end, 0.01, true))
		scrollTo(slot0.scrollRect, 0, 1)

		slot0.isInitBillboard = true
	end

	return
end

function slot0.updateRankTF(slot0, slot1, slot2, slot3)
	slot4 = setActive
	slot5 = findTF(slot1, "rank")

	if slot2.rank > 3 then
		slot6 = false
	else
		slot6 = true
	end

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = findTF(slot1, "rank_num")

	if slot2.rank <= 3 then
		slot6 = false
	else
		slot6 = true
	end

	slot4(slot5, slot6)

	if slot2.rank > 3 then
		setText(findTF(slot1, "rank_num"), slot2.rank)
	else
		slot0:setSpriteTo("resources/" .. slot2.rank, findTF(slot1, "rank"), true)
	end

	setText(findTF(slot1, "name_bg/Text"), slot2.name)
	setText(findTF(slot1, "score_bg/Text"), slot2.score)
	setText(findTF(slot1, "medal/Text"), "")
	LoadImageSpriteAsync("emblem/" .. slot4, findTF(slot1, "medal"))

	if slot2.icon and slot2.icon ~= 0 then
		updateDrop(findTF(slot1, "shiptpl"), {
			type = DROP_TYPE_SHIP,
			id = slot2.icon,
			skinId = slot2.skinId,
			remoulded = slot2.remoulded,
			propose = slot2.proposeTime
		})
	end

	setText(findTF(slot1, "shiptpl/icon_bg/lv/Text"), slot2.level)

	return
end

function slot0.updateRankInfo(slot0, slot1)
	slot0:updateRankTF(slot2, slot1)
	onButton(slot0, slot0.rankTFs[slot1.id], function ()
		slot0:emit(BillboardMediator.OPEN_RIVAL_INFO, slot1.id)

		return
	end)

	return
end

function slot0.updatePlayerMilitaryRankInfo(slot0)
	slot0:updateRankTF(slot1, {
		rank = slot0.seasonInfo.rank,
		name = slot0.player.name,
		score = slot0.seasonInfo.score,
		icon = slot0.playerShip.configId,
		skinId = slot0.playerShip.skinId,
		level = slot0.player.level,
		remoulded = slot0.playerShip:isRemoulded(),
		proposeTime = slot0.playerShip.proposeTime
	})
	onButton(slot0, slot0:findTF("military_page/content/player_info", slot0.mainPanel), function ()
		slot0:scroll2PlayerRank(slot0.seasonInfo.rank)

		return
	end, SFX_PANEL)

	return
end

function slot0.scroll2PlayerRank(slot0, slot1)
	if math.min(#slot0.billboard - 2, slot1) > 0 then
		rtf(slot0.rankContainer).anchoredPosition = Vector3(0, slot0.starty + slot0.height * (slot1 - 1), 0)
	end

	return
end

function slot0.willExit(slot0)
	if GameObject.Find("/UICamera/Canvas/UIMain/MilitaryExerciseUI(Clone)/bottom/buttons/rank_btn") then
		triggerToggle(slot1, false)
	end

	return
end

function slot0.addRefreshTimer(slot0, slot1, slot2)
	slot3()

	slot4 = slot0:getRankMsgInfo(slot2)
	slot0.refreshTimer[slot2] = Timer.New(function ()
		if (slot0 + 1) - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			slot1()
			slot2:emit(BillboardMediator.GET_POWERRANK, slot3.type, 1, slot3.act_id)
		end

		return
	end, 1, -1)

	slot0.refreshTimer[slot2]:Start()
	slot0.refreshTimer[slot2].func()

	return
end

function slot0.updatePowerRankTF(slot0, slot1, slot2)
	if slot2.id then
		slot3 = setActive
		slot4 = findTF(slot1, "bg_1")

		if slot2.rank ~= 1 then
			slot5 = false
		else
			slot5 = true
		end

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF(slot1, "bg_2")

		if slot2.rank ~= 2 then
			slot5 = false
		else
			slot5 = true
		end

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF(slot1, "bg_3")

		if slot2.rank ~= 3 then
			slot5 = false
		else
			slot5 = true
		end

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF(slot1, "bg_nor")

		if slot2.rank <= 3 and slot2.rank ~= 0 then
			slot5 = false
		else
			slot5 = true
		end

		slot3(slot4, slot5)

		slot3 = findTF(slot1, "medal").transform

		if slot2.rank > 3 or not Vector3(0.45, 0.45, 1) then
			slot4 = Vector3(0.34, 0.34, 1)
		end

		slot3.localScale = slot4
	end

	slot3 = setActive
	slot4 = findTF(slot1, "rank")

	if slot2.rank > 3 or slot2.rank <= 0 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF(slot1, "rank_num")

	if slot2.rank <= 3 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF(slot1, "rank_none")

	if slot2.rank ~= 0 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)
	setActive(findTF(slot1, "medal_small"), slot2.medal_small)

	if slot2.medal_small then
		LoadImageSpriteAsync(slot2.medal_small, findTF(slot1, "medal_small"))
	end

	if slot2.rank <= 3 and slot2.rank > 0 then
		slot0:setSpriteTo("resources/" .. slot2.rank, findTF(slot1, "rank"), true)
	else
		setText(findTF(slot1, "rank_num"), slot2.rank)
	end

	setText(findTF(slot1, "nameText"), slot2.name)

	if slot2.max and slot2.max > 0 then
		setText(findTF(slot1, "scoreText"), string.format("%0.01f", slot2.power / slot2.max * 100) .. "%")
	else
		if not slot2.isTypePower or not math.floor(slot2.power^0.667) then
			slot3 = slot2.power
		end

		setText(findTF(slot1, "scoreText"), slot3)
	end

	if findTF(slot1, "medal") then
		if math.max(slot2.arenaRank, 1) > 14 then
			slot3 = 14
		end

		LoadImageSpriteAsync("emblem/" .. slot3, findTF(slot1, "medal"))
	end

	if slot2.icon and slot2.icon ~= 0 then
		updateDrop(findTF(slot1, "shiptpl"), {
			type = DROP_TYPE_SHIP,
			id = slot2.icon,
			skinId = slot2.skinId,
			remoulded = slot2.remoulded,
			propose = slot2.proposeTime
		})
	end

	setText(findTF(slot1, "shiptpl/icon_bg/lv/Text"), slot2.lv)

	return
end

function slot0.updatePlayerRankInfo(slot0, slot1)
	setActive(slot2, true)

	slot3 = slot0:getRankMsgInfo(slot1)

	if not slot0.collectCountAll then
		slot0.collectCountAll = getProxy(CollectionProxy):getCollectionTotal()
	end

	slot5 = slot0
	slot4 = slot0.updatePowerRankTF
	slot6 = slot2
	slot7 = {}

	if not slot0.myRank[slot1] then
		slot8 = 0
	end

	slot7.rank = slot8
	slot7.power = slot0.myPoint[slot1]
	slot7.icon = slot0.playerShip.configId
	slot7.skinId = slot0.playerShip.skinId
	slot7.lv = slot0.player.level
	slot7.arenaRank = slot0.player.maxRank
	slot7.name = slot0.player.name
	slot7.remoulded = slot0.playerShip:isRemoulded()
	slot7.proposeTime = slot0.playerShip.proposeTime
	slot7.medal_small = slot3.medal_small

	if slot3.type ~= 2 or not slot0.collectCountAll then
		slot8 = nil
	end

	slot7.max = slot8

	if slot3.type ~= 1 then
		slot8 = false
	else
		slot8 = true
	end

	slot7.isTypePower = slot8

	slot4(slot5, slot6, slot7)

	return
end

function slot0.updateRankCount(slot0, slot1)
	if not slot0.initedRank[slot1] then
		slot0.scroll[slot1]:SetTotalCount(slot0:getRankCount(slot1), -1)

		slot0.initedRank[slot1] = true
	else
		slot0.scroll[slot1]:SetTotalCount(slot0:getRankCount(slot1), -1)
	end

	return
end

function slot0.getRankCount(slot0, slot1)
	slot2 = 0

	for slot6 = 1, #slot0.rankList[slot1], 1 do
		slot2 = slot2 + #slot0.rankList[slot1][slot6]
	end

	return slot2
end

function slot0.createRankItem(slot0, slot1)
	return {
		go = slot1,
		tf = tf(slot1)
	}
end

return slot0
