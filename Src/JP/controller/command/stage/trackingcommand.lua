class("TrackingCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().fleetIds

	if getProxy(ChapterProxy).getChapterById(slot5, slot1.getBody().chapterId).active then
		pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_strategying"))

		return
	end

	if slot6:getMapType() == Map.ESCORT and slot5:getMaxEscortChallengeTimes() <= slot5.escortChallengeTimes then
		pg.TipsMgr.GetInstance():ShowTips(i18n("escort_less_count_to_combat"))

		return
	end

	slot8 = getProxy(BayProxy).getRawData(slot7)

	if not getProxy(PlayerProxy).getData(slot10):isEnough({
		oil = slot6:getConfig("oil")
	}) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	slot12 = getProxy(DailyLevelProxy)

	if slot6:getConfig("type") == Chapter.CustomFleet and not slot6:isActivity() and not slot12:IsEliteEnabled() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_elite_no_quota"))

		return
	end

	slot13 = slot6:getConfig("map")
	slot15 = slot6:getEliteFleetCommanders()
	slot16 = {}

	for slot20, slot21 in ipairs(slot14) do
		if slot6:singleEliteFleetVertify(slot20) then
			slot22 = {}
			slot23 = {}
			slot24 = {}
			slot25 = {}
			slot26 = {}

			for slot30, slot31 in ipairs(slot21) do
				if pg.ship_data_by_type[slot8[slot31]:getShipType()].team_type == TeamType.Vanguard then
					slot24[#slot24 + 1] = slot31
				elseif slot33 == TeamType.Main then
					slot23[#slot23 + 1] = slot31
				elseif slot33 == TeamType.Submarine then
					slot25[#slot25 + 1] = slot31
				end
			end

			for slot31, slot32 in pairs(slot27) do
				table.insert(slot26, {
					id = slot31,
					commanderid = slot32
				})
			end

			slot22.map_id = slot13
			slot22.main_id = slot23
			slot22.scout_id = slot24
			slot22.submarine_id = slot25
			slot22.commanders = slot26
			slot16[#slot16 + 1] = slot22
		else
			slot16[#slot16 + 1] = {
				main_id = {},
				scout_id = {},
				submarine_id = {},
				commanders = {}
			}
		end
	end

	pg.ConnectionMgr.GetInstance():Send(13101, {
		id = slot3,
		group_id_list = slot4,
		elite_fleet_list = slot16
	}, 13102, function (slot0)
		if slot0.result == 0 then
			slot0:consume({
				oil = slot0.consume
			})
			slot0:updatePlayer(slot0)
			slot3:update(slot0.current_chapter)

			for slot4, slot5 in pairs(slot3.cells) do
				if ChapterConst.NeedMarkAsLurk(slot5) then
					slot5.trait = ChapterConst.TraitLurk
				end
			end

			for slot4, slot5 in ipairs(slot3.champions) do
				slot5.trait = ChapterConst.TraitLurk
			end

			slot4:updateChapter(slot3)

			if slot3:getMapType() == Map.ESCORT then
				getProxy(ChapterProxy).escortChallengeTimes = getProxy(ChapterProxy).escortChallengeTimes + 1
			end

			slot5:sendNotification(GAME.TRACKING_DONE, )
		elseif slot0.result == 1 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_tracking_error_retry"))
			slot5:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		elseif slot0.result == 3010 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_tracking_error_3001"))
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("levelScene_tracking_erro", slot0.result))
		end
	end)
end

return class("TrackingCommand", pm.SimpleCommand)
