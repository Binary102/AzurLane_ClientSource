class("BuildCommaderCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot6 = getProxy(PlayerProxy):getData()
	slot7 = getProxy(BagProxy)
	slot9 = {}

	for slot13, slot14 in ipairs(slot8) do
		if slot14[1] == DROP_TYPE_RESOURCE then
			if slot6:getResById(slot14[2]) < slot14[3] then
				pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end
		elseif slot14[1] == DROP_TYPE_ITEM and slot7:getItemCountById(slot14[2]) < slot14[3] then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end

		table.insert(slot9, Item.New({
			type = slot14[1],
			id = slot14[2],
			count = slot14[3]
		}))
	end

	pg.ConnectionMgr.GetInstance():Send(25002, {
		boxid = slot3
	}, 25003, function (slot0)
		if slot0.result == 0 then
			slot0:updateBox(slot1)

			for slot5, slot6 in ipairs(slot1) do
				slot2:sendNotification(GAME.CONSUME_ITEM, slot6)
			end

			slot2:sendNotification(GAME.COMMANDER_ON_BUILD_DONE)
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_build_done"))
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_build_erro", slot0.result))
		end
	end)
end

return class("BuildCommaderCommand", pm.SimpleCommand)
