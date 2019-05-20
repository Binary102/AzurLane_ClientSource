class("UserLoginCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	print("connect to gateway - " .. NetConst.GATEWAY_HOST .. ":" .. NetConst.GATEWAY_PORT)

	if pg.SDKMgr:GetInstance():GetChannelUID() == "" then
		slot3 = PLATFORM_LOCAL
	end

	print("platformCode", slot3)

	if not slot2.arg4 then
		slot2.arg4 = "0"
	end

	print("sessionid -- : " .. slot2.arg4)
	print("login_type:", slot2.type, "arg1:", slot2.arg1, "arg2:", slot2.arg2, "arg3:", (slot2.arg4 == "0" and slot2.arg3) or slot2.arg4, "arg4:", slot3, "check_key:", HashUtil.CalcMD5(slot2.arg1 .. AABBUDUD), "device:", PLATFORM)
	pg.ConnectionMgr.GetInstance():Connect(NetConst.GATEWAY_HOST, NetConst.GATEWAY_PORT, function ()
		pg.ConnectionMgr.GetInstance():Send(10020, {
			login_type = slot0.type,
			arg1 = slot0.arg1,
			arg2 = slot0.arg2,
			arg3 = slot1,
			arg4 = slot2,
			check_key = HashUtil.CalcMD5(slot0.arg1 .. AABBUDUD),
			device = PLATFORM
		}, 10021, function (slot0)
			print("disconnect from gateway...")
			pg.ConnectionMgr.GetInstance():Disconnect()

			if slot0.device ~= 0 and slot0.device ~= PLATFORM then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_failed"))

				return
			end

			if slot0.result == 0 then
				slot0.id = slot0.account_id
				slot0.uid = slot0.account_id
				slot0.token = slot0.server_ticket

				getProxy(UserProxy).setLastLogin(slot1, slot0)

				slot2 = {}
				slot3 = {
					"*all gate info :"
				}

				for slot7, slot8 in ipairs(slot0.serverlist) do
					slot9 = Server.New({
						id = slot8.ids[1],
						host = slot8.ip,
						port = slot8.port,
						proxy_host = slot8.proxy_ip,
						proxy_port = slot8.proxy_port,
						status = slot8.state,
						name = slot8.name,
						tag_state = slot8.tag_state,
						sort = slot8.sort
					})
					slot3[#slot3 + 1] = slot8.proxy_ip .. ":" .. slot8.proxy_port
					slot3[#slot3 + 1] = slot8.ip .. ":" .. slot8.port

					slot9:display()
					table.insert(slot2, slot9)
				end

				print(table.concat(slot3, "\n"))
				getProxy(ServerProxy).setServers(slot4, slot2, slot0.uid)
				getProxy(GatewayNoticeProxy).setGatewayNotices(slot5, slot0.notice_list)
				slot1.facade:sendNotification(GAME.USER_LOGIN_SUCCESS, slot0)
				pg.PushNotificationMgr.GetInstance():cancelAll()
				print("user logined............", #slot2)
			elseif slot0.result == 13 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_gate_not_ready"))
			elseif slot0.result == 15 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_game_rigister_full"))
			elseif slot0.result == 18 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("system_database_busy"))
			elseif slot0.result == 6 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_game_login_full"))
			else
				slot1.facade:sendNotification(GAME.USER_LOGIN_FAILED, slot0.result)
			end
		end, false)
	end)
end

return class("UserLoginCommand", pm.SimpleCommand)
