slot0 = class("MiniGameOPCommand", pm.SimpleCommand)
slot0.CMD_COMPLETE = 1
slot0.CMD_ULTIMATE = 2
slot0.CMD_SPECIAL_GAME = 3

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6 = slot2.cbFunc

	pg.ConnectionMgr.GetInstance():Send(26103, {
		hubid = slot2.hubid,
		cmd = slot2.cmd,
		args1 = slot2.args1
	}, 26104, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(MiniGameProxy)

			if slot0.hub.id > 0 then
				slot1:UpdataHubData(slot0.hub)
			end

			if slot0.data.id > 0 then
				MiniGameDataCreator.DataCreateFunc(slot0, slot1, slot0.data.datas)
			end

			slot2 = {}

			for slot6, slot7 in ipairs(slot0.award_list) do
				table.insert(slot2, slot8)
				slot2:sendNotification(GAME.ADD_ITEM, Item.New({
					type = slot7.type,
					id = slot7.id,
					count = slot7.number
				}))
			end

			if slot0 == slot3.CMD_COMPLETE and slot1:GetHubByHubId(slot4):getConfig("reward_target") ~= "" then
				table.insert(slot2, {
					count = 1,
					type = DROP_TYPE_VITEM,
					id = slot4
				})
			end

			slot2:sendNotification(GAME.SEND_MINI_GAME_OP_DONE, {
				awards = slot2,
				cmd = slot0,
				argList = slot1
			})
		else
			pg.TipsMgr:GetInstance():ShowTips("mini game Error : " .. slot0.result)
		end
	end)
end

return slot0
