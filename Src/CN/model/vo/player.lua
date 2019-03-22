slot0 = class("Player", import(".BaseVO"))
slot1 = {
	"gold",
	"oil",
	"exploit",
	"gem",
	"oilField",
	"dormMoney",
	"goldField",
	"guildCoin",
	nil,
	nil,
	nil,
	nil,
	nil,
	"freeGem",
	[113.0] = "nvpu_pt",
	[2001.0] = "contribution_worldboss",
	[104.0] = "star",
	[112.0] = "jiujiu",
	[120.0] = "naerweikehaogan",
	[111.0] = "faxipt",
	[119.0] = "British_pt",
	[102.0] = "pt",
	[110.0] = "yisegefuke_pt",
	[118.0] = "tiancheng",
	[103.0] = "ema",
	[109.0] = "bilibili",
	[117.0] = "longxiang",
	[108.0] = "omamori",
	[116.0] = "chuansong",
	[101.0] = "battery",
	[107.0] = "mengjiu",
	[115.0] = "chuansonghaogan",
	[106.0] = "ema1",
	[114.0] = "zhandouzhixing",
	[105.0] = "grace"
}
slot2 = {
	59001,
	59002,
	59003,
	59004,
	0,
	59006,
	0,
	59008,
	nil,
	nil,
	nil,
	nil,
	nil,
	59005,
	[113.0] = 59115,
	[2001.0] = 59122,
	[104.0] = 59105,
	[112.0] = 59113,
	[120.0] = 59123,
	[111.0] = 59112,
	[119.0] = 59121,
	[102.0] = 59103,
	[110.0] = 59111,
	[118.0] = 59120,
	[103.0] = 59104,
	[109.0] = 59110,
	[117.0] = 59119,
	[108.0] = 59109,
	[116.0] = 59118,
	[101.0] = 59102,
	[107.0] = 59108,
	[115.0] = 59117,
	[106.0] = 59107,
	[114.0] = 59116,
	[105.0] = 59106
}
slot3 = nil
slot0.MAX_SHIP_BAG = 2000
slot0.MAX_EQUIP_BAG = 2000
slot0.MAX_COMMANDER_BAG = 200
slot0.ASSISTS_TYPE_SHAM = 0
slot0.ASSISTS_TYPE_GUILD = 1
slot0.CHANGE_NAME_KEY = 1

function id2res(slot0)
	return slot0[slot0]
end

function res2id(slot0)
	for slot4, slot5 in pairs(slot0) do
		if slot5 == slot0 then
			return slot4
		end
	end

	return 0
end

function id2ItemId(slot0)
	return slot0[slot0]
end

function itemId2Id(slot0)
	for slot4, slot5 in pairs(slot0) do
		if slot5 == slot0 then
			return slot4
		end
	end
end

function slot0.skin2Res(slot0)
	slot2 = 1
	slot3 = 0

	for slot7, slot8 in pairs(pg.drop_data_restore.all) do
		if slot0 == slot1[slot8].target_id then
			slot2 = slot9.resource_type
			slot3 = slot9.resource_num

			break
		end
	end

	return slot2, slot3
end

function slot0.Ctor(slot0, slot1)
	if not slot0 then
		slot0 = pg.StoryMgr:GetInstance():GetStoryByName("index")
	end

	if not storyIndexAgain then
		storyIndexAgain = pg.StoryMgr:GetInstance():GetStoryByName("index_again")
	end

	slot0.id = slot1.id
	slot0.name = slot1.name
	slot0.level = slot1.level or slot1.lv
	slot0.configId = slot0.level
	slot0.exp = slot1.exp or 0
	slot0.icon = slot1.icon or 1
	slot0.attackCount = slot1.attack_count or 0
	slot0.winCount = slot1.win_count or 0
	slot0.manifesto = slot1.adv or slot1.manifesto
	slot0.character = slot1.character
	slot0.ship_bag_max = slot1.ship_bag_max
	slot0.equip_bag_max = slot1.equip_bag_max
	slot0.buff_list = slot1.buffList or {}
	slot0.rank = slot1.rank or slot1.title or 0
	slot0.pvp_attack_count = slot1.pvp_attack_count or 0
	slot0.pvp_win_count = slot1.pvp_win_count or 0
	slot0.collect_attack_count = slot1.collect_attack_count or 0
	slot0.guideIndex = slot1.guide_index
	slot0.buyOilCount = slot1.buy_oil_count
	slot0.chatRoomId = slot1.chat_room_id or 1
	slot0.score = slot1.score or 0
	slot0.guildWaitTime = slot1.guild_wait_time or 0
	slot0.commanderBagMax = slot1.commander_bag_max
	slot0.cdList = {}
	slot2 = ipairs
	slot3 = slot1.cd_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.cdList[slot6.key] = slot6.timestamp
	end

	slot0.commonFlagList = {}
	slot2 = ipairs
	slot3 = slot1.flag_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.commonFlagList[slot6] = true
	end

	slot0.registerTime = slot1.register_time
	slot0.vipCards = {}
	slot2 = ipairs
	slot3 = slot1.card_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.vipCards[VipCard.New(slot6).id] = VipCard.New(slot6)
	end

	slot0:updateResources(slot1.resource_list)

	slot0.maxRank = slot1.max_rank or 0
	slot0.shipCount = slot1.ship_count or 0
	slot0.chargeExp = slot1.acc_pay_lv or 0
	slot0.mingshiflag = 0
	slot0.mingshiCount = 0
	slot0.stories = {}
	slot0.storiesAgain = {}

	if slot1.story_list then
		for slot5, slot6 in pairs(slot1.story_list) do
			if slot6 == 20008 then
				slot6 = 1131
			end

			if slot6 == 20009 then
				slot6 = 1132
			end

			if slot6 == 20010 then
				slot6 = 1133
			end

			if slot6 == 20011 then
				slot6 = 1134
			end

			if slot6 == 20012 then
				slot6 = 1135
			end

			if slot6 == 20013 then
				slot6 = 1136
			end

			if slot6 == 20014 then
				slot6 = 1137
			end

			if slot0[slot6] then
				slot0.stories[slot6] = slot0[slot6]
			end

			if storyIndexAgain[slot6] then
				slot0.storiesAgain[slot6] = storyIndexAgain[slot6]
			end
		end
	end

	slot0.maxGold = pg.gameset.max_gold.key_value
	slot0.maxOil = pg.gameset.max_oil.key_value
	slot0.chatMsgBanTime = slot1.chat_msg_ban_time or 0
	slot0.skinId = slot1.skin_id or 0

	if slot0.skinId == 0 and pg.ship_data_statistics[slot0.icon] then
		slot0.skinId = slot2.skin_id
	end

	slot0.propose = slot1.propose and slot1.propose > 0
	slot0.proposeTime = slot1.propose
end

function slot0.canModifyName(slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.level < pg.gameset.player_name_change_lv_limit.key_value then
		return false, i18n("player_name_change_time_lv_tip", slot2)
	end

	if slot1 < slot0:getModifyNameTimestamp() then
		slot4, slot5, slot6, slot7 = pg.TimeMgr.GetInstance():parseTimeFrom(slot3 - slot1)
		slot8 = nil

		return false, i18n("player_name_change_time_limit_tip", (slot4 == 0 and ((slot5 == 0 and math.max(slot6, 1) .. i18n("word_minute")) or slot5 .. i18n("word_hour"))) or slot4 .. i18n("word_date"))
	end

	return true
end

function slot0.getModifyNameComsume(slot0)
	return pg.gameset.player_name_change_cost.description
end

function slot0.getModifyNameTimestamp(slot0)
	return slot0.cdList[slot0.CHANGE_NAME_KEY] or 0
end

function slot0.updateModifyNameColdTime(slot0, slot1)
	slot0.cdList[slot0.CHANGE_NAME_KEY] = slot1
end

function slot0.getMaxGold(slot0)
	slot1 = 0

	if getProxy(GuildProxy):getData() then
		slot1 = slot2.maxGoldAddition
	end

	return slot0.maxGold + slot1
end

function slot0.getMaxOil(slot0)
	slot1 = 0

	if getProxy(GuildProxy):getData() then
		slot1 = slot2.maxOilAddition
	end

	return slot0.maxOil + slot1
end

function slot0.getResource(slot0, slot1)
	return slot0[id2res(slot1)] or 0
end

function slot0.updateResources(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if slot6 == "gem" then
			slot0.chargeGem = 0
		elseif slot6 == "freeGem" then
			slot0.awardGem = 0
		else
			slot0[slot6] = 0
		end
	end

	slot2 = ipairs
	slot3 = slot1 or {}

	for slot5, slot6 in slot2(slot3) do
		if id2res(slot6.type) == "gem" then
			slot0.chargeGem = slot6.num
		elseif slot7 == "freeGem" then
			slot0.awardGem = slot6.num
		else
			slot0[slot7] = slot6.num
		end
	end
end

function slot0.getPainting(slot0)
	return (pg.ship_skin_template[slot0.skinId] and slot1.painting) or "unknown"
end

function slot0.inGuildCDTime(slot0)
	return slot0.guildWaitTime > 0 and pg.TimeMgr.GetInstance():GetServerTime() < slot0.guildWaitTime
end

function slot0.setGuildWaitTime(slot0, slot1)
	slot0.guildWaitTime = slot1
end

function slot0.addStory(slot0, slot1)
	slot0.stories[slot1] = slot0[slot1]
end

function slot0.getStoryIndexID(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if slot6 == slot1 then
			return slot5
		end
	end

	return 0
end

function slot0.getStoryByIndexID(slot0, slot1)
	return slot0[slot1]
end

function slot0.addStoryAgain(slot0, slot1)
	slot0.storiesAgain[slot1] = storyIndexAgain[slot1]
end

function slot0.getStoryIndexAgainID(slot0, slot1)
	for slot5, slot6 in pairs(storyIndexAgain) do
		if slot6 == slot1 then
			return slot5
		end
	end

	return 0
end

function slot0.IsPlayed(slot0, slot1, slot2)
	return (table.contains(slot0.stories, slot1) or slot0.stories[slot1]) and (slot2 or slot0:IsPlayedAgain(slot1))
end

function slot0.IsPlayedAgain(slot0, slot1)
	return slot0:getStoryIndexAgainID(slot1) <= 0 or table.contains(slot0.storiesAgain, slot1) or slot0.storiesAgain[slot1]
end

function slot0.getChargeLevel(slot0)
	slot2 = pg.pay_level_award.all[1]
	slot3 = pg.pay_level_award.all[#pg.pay_level_award.all]

	for slot7, slot8 in ipairs(pg.pay_level_award.all) do
		if slot1[slot8].exp <= slot0.chargeExp then
			slot2 = math.min(slot8 + 1, slot3)
		end
	end

	return slot2
end

function slot0.getCardById(slot0, slot1)
	return Clone(slot0.vipCards[slot1])
end

function slot0.addVipCard(slot0, slot1)
	slot0.vipCards[slot1.id] = slot1
end

function slot0.addShipBagCount(slot0, slot1)
	slot0.ship_bag_max = slot0.ship_bag_max + slot1
end

function slot0.addEquipmentBagCount(slot0, slot1)
	slot0.equip_bag_max = slot0.equip_bag_max + slot1
end

function slot0.bindConfigTable(slot0)
	return pg.user_level
end

function slot0.updateScoreAndRank(slot0, slot1, slot2)
	slot0.score = slot1
	slot0.rank = slot2
end

function slot0.increasePvpCount(slot0)
	slot0.pvp_attack_count = slot0.pvp_attack_count + 1
end

function slot0.increasePvpWinCount(slot0)
	slot0.pvp_win_count = slot0.pvp_win_count + 1
end

function slot0.isEnough(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] == nil or slot0[slot5] < slot6 then
			return false, slot5
		end
	end

	return true
end

function slot0.increaseBuyOilCount(slot0)
	slot0.buyOilCount = slot0.buyOilCount + 1
end

function slot0.changeChatRoom(slot0, slot1)
	slot0.chatRoomId = slot1
end

function slot0.increaseAttackCount(slot0)
	slot0.attackCount = slot0.attackCount + 1
end

function slot0.increaseAttackWinCount(slot0)
	slot0.winCount = slot0.winCount + 1
end

function slot0.increaseShipCount(slot0, slot1)
	slot0.shipCount = slot0.shipCount + ((slot1 and slot1) or 1)
end

function slot0.isFull(slot0)
	for slot4, slot5 in pairs(slot0) do
		if pg.user_level["max_" .. slot5] and slot0[slot5] < slot6 then
			return false
		end
	end

	return true
end

function slot0.__index(slot0, slot1)
	if slot1 == "gem" then
		return slot0:getChargeGem()
	elseif slot1 == "freeGem" then
		return slot0:getTotalGem()
	end

	return rawget(slot0, slot1) or slot0[slot1] or slot0.super[slot1]
end

function slot0.__newindex(slot0, slot1, slot2)
	rawset(slot0, slot1, slot2)
end

function slot0.getFreeGem(slot0)
	return slot0.awardGem
end

function slot0.getChargeGem(slot0)
	return slot0.chargeGem
end

function slot0.getTotalGem(slot0)
	return slot0:getFreeGem() + slot0:getChargeGem()
end

function slot0.getResById(slot0, slot1)
	if slot1 == 4 then
		return slot0:getTotalGem()
	else
		return slot0[id2res(slot1)]
	end
end

function slot0.consume(slot0, slot1)
	slot1.freeGem = nil
	slot1.gem = nil

	if (slot1.freeGem or 0) + (slot1.gem or 0) > 0 then
		slot0.awardGem = slot0:getFreeGem() - math.min(slot2, slot3)
		slot0.chargeGem = slot0.chargeGem - (slot2 - math.min(slot2, slot3))
	end

	for slot6, slot7 in pairs(slot1) do
		slot0[slot6] = slot0[slot6] - slot7
	end
end

function slot0.addResources(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot5 == "gold" then
			slot0[slot5] = math.min(slot0[slot5] + slot6, slot0.maxGold)
		elseif slot5 == "oil" then
			slot0[slot5] = math.min(slot0[slot5] + slot6, slot0.maxOil)
		elseif slot5 == "chargeGem" then
			slot0.chargeGem = slot0:getChargeGem() + slot6
		elseif slot5 == "gem" or slot5 == "freeGem" then
			slot0.awardGem = slot0:getFreeGem() + slot6
		else
			slot0[slot5] = slot0[slot5] + slot6
		end
	end
end

function slot0.resetBuyOilCount(slot0)
	slot0.buyOilCount = 0
end

function slot0.addExp(slot0, slot1)
	slot0.exp = slot0.exp + slot1

	while slot0:canLevelUp() do
		slot0.exp = slot0.exp - slot0:getLevelExpConfig().exp_interval
		slot0.level = slot0.level + 1

		BilibiliSdkMgr.inst:levelUp()
	end
end

function slot0.getBuffByType(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.buff_list) do
		if pg.benefit_buff_template[slot7.id].benefit_type == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getLevelExpConfig(slot0)
	return getConfigFromLevel1(pg.user_level, slot0.level)
end

function slot0.getMaxLevel(slot0)
	return pg.user_level.all[#pg.user_level.all]
end

function slot0.getTotalExp(slot0)
	return slot0:getLevelExpConfig().exp_start + slot0.exp
end

function slot0.canLevelUp(slot0)
	return getConfigFromLevel1(pg.user_level, slot0.level + 1) and getConfigFromLevel1(pg.user_level, slot0.level) ~= slot1 and slot0:getLevelExpConfig().exp_interval <= slot0.exp
end

function slot0.isSelf(slot0)
	return getProxy(PlayerProxy):isSelf(slot0.id)
end

function slot0.isFriend(slot0)
	return getProxy(FriendProxy):isFriend(slot0.id)
end

function slot0.OilMax(slot0, slot1)
	if (slot1 or 0) < 0 then
		slot1 = 0
	end

	return pg.gameset.max_oil.key_value < slot0.oil + slot1
end

function slot0.GoldMax(slot0, slot1)
	return pg.gameset.max_gold.key_value < slot0.gold + (slot1 or 0)
end

function slot0.UpdateCommonFlag(slot0, slot1)
	slot0.commonFlagList[slot1] = true
end

function slot0.GetCommonFlag(slot0, slot1)
	return slot0.commonFlagList[slot1]
end

function slot0.updateCommanderBagMax(slot0, slot1)
	slot0.commanderBagMax = slot0.commanderBagMax + slot1
end

return slot0
