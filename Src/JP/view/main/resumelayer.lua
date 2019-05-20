slot0 = class("resumeLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "resumeUI"
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.player = slot1
end

function slot0.init(slot0)
	slot0.frame = slot0:findTF("frame")
	slot0.resumeIcon = slot0:findTF("frame/window/info/circle/head")
	slot0.resumeStars = slot0:findTF("frame/window/info/circle/head/stars")
	slot0.resumeStarTpl = slot0:findTF("frame/window/info/circle/head/star")
	slot0.resumeLv = slot0:findTF("frame/window/info/player_info/level_bg/level"):GetComponent(typeof(Text))
	slot0.resumeName = slot0:findTF("frame/window/info/player_info/name_bg/name"):GetComponent(typeof(Text))
	slot0.resumeInfo = slot0:findTF("frame/window/summary/content")
	slot0.resumeEmblem = slot0:findTF("frame/window/info/rank_bg/rank/Image")
	slot0.resumeEmblemLabel = slot0:findTF("frame/window/info/rank_bg/rank/label")
	slot0.resumeMedalList = slot0:findTF("frame/window/medalList/container")
	slot0.resumeMedalTpl = slot0:findTF("frame/window/medal_tpl")
	slot0.closeBtn = slot0:findTF("frame/window/title_bg/close_btn")
end

function slot0.didEnter(slot0)
	slot0:display(slot0.player)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
end

slot1 = {
	{
		value = "shipCount",
		type = 1,
		tag = i18n("friend_resume_ship_count")
	},
	{
		type = 3,
		tag = i18n("friend_resume_collection_rate"),
		value = {
			"collectionCount"
		}
	},
	{
		value = "attackCount",
		type = 1,
		tag = i18n("friend_resume_attack_count")
	},
	{
		type = 2,
		tag = i18n("friend_resume_attack_win_rate"),
		value = {
			"attackCount",
			"winCount"
		}
	},
	{
		value = "pvp_attack_count",
		type = 1,
		tag = i18n("friend_resume_manoeuvre_count")
	},
	{
		type = 2,
		tag = i18n("friend_resume_manoeuvre_win_rate"),
		value = {
			"pvp_attack_count",
			"pvp_win_count"
		}
	},
	{
		value = "collect_attack_count",
		type = 1,
		tag = i18n("friend_event_count")
	}
}

function slot0.display(slot0, slot1)
	if slot0.contextData.parent then
		setParent(slot0._tf, slot0.contextData.parent)
	else
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	end

	slot2 = SeasonInfo.getMilitaryRank(slot1.score, slot1.rank)

	LoadImageSpriteAsync("emblem/" .. slot3, slot0.resumeEmblem)
	LoadImageSpriteAsync("emblem/n_" .. slot3, slot0.resumeEmblemLabel)

	slot0.resumeName.text = slot1.name
	slot0.resumeLv.text = "Lv." .. slot1.level

	LoadSpriteAsync("qicon/" .. slot1:getPainting(), function (slot0)
		if not IsNil(slot0.resumeIcon) then
			slot0.resumeIcon:GetComponent(typeof(Image)).color = Color.white
			slot1.sprite = slot0 or LoadSprite("heroicon/unknown")
		end
	end)
	setActive(findTF(slot0.resumeIcon, "popfront"), not slot1.propose)
	setActive(findTF(slot0.resumeIcon, "propose"), slot1.propose)

	for slot11 = slot0.resumeStars.childCount, Ship.New({
		configId = pg.ship_data_statistics[slot1.icon].id
	}).getStar(slot5) - 1, 1 do
		cloneTplTo(slot0.resumeStarTpl, slot0.resumeStars)
	end

	for slot11 = 0, slot0.resumeStars.childCount - 1, 1 do
		slot0.resumeStars:GetChild(slot11).gameObject:SetActive(slot11 < slot4.star)
	end

	removeAllChildren(slot0.resumeMedalList)

	for slot11 = 1, PlayerInfoLayer.MAX_MEDAL_DISPLAY, 1 do
		setActive(slot0:findTF("empty", cloneTplTo(slot0.resumeMedalTpl, slot0.resumeMedalList)), slot11 > #slot1.displayTrophyList)

		if slot11 <= #slot1.displayTrophyList then
			setActive(slot0:findTF("icon", slot12), true)
			LoadImageSpriteAsync("medal/" .. pg.medal_template[slot1.displayTrophyList[slot11]].icon, slot0:findTF("icon", slot12), true)
		end
	end

	for slot11, slot12 in ipairs(slot0) do
		slot13 = slot0.resumeInfo:GetChild(slot11 - 1)

		setText(slot13:Find("tag"), slot12.tag)

		slot14 = slot13:Find("value")

		if slot12.type == 1 then
			setText(slot14, slot0.player[slot12.value])
		elseif slot12.type == 2 then
			setText(slot14, string.format("%0.2f", math.max(slot0.player[slot12.value[2]], 0) / math.max(slot0.player[slot12.value[1]], 1) * 100) .. "%")
		elseif slot12.type == 3 then
			setText(slot14, string.format("%0.2f", (slot0.player[slot12.value[1]] or 1) / getProxy(CollectionProxy):getCollectionTotal() * 100) .. "%")
		end
	end
end

function slot0.willExit(slot0)
	if slot0.contextData.parent then
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, pg.UIMgr:GetInstance().UIMain)
	end
end

return slot0
