class("UserLoginCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	print("connect to gateway - " .. NetConst.GATEWAY_HOST .. ":" .. NetConst.GATEWAY_PORT)

	slot3 = ""

	if PLATFORM_CODE == 1 then
		if GetBiliServerId() == SHAREJOY_SERVER_ID then
			slot3 = "cps"
		elseif slot4 == BILI_SERVER_ID then
			slot3 = "0"
		elseif slot4 == UNION_SERVER_ID then
			slot3 = BilibiliSdkMgr.inst.channelUID
		end
	end

	if slot3 == "" then
		slot3 = PLATFORM_LOCAL
	end

	print("platformCode", slot3)

	if not slot2.arg4 then
		slot2.arg4 = "0"
	end

	print("login type -- : ", slot2.type, ", arg3 -- : ", (slot2.arg4 == "0" and slot2.arg3) or slot2.arg4, ", sessionid -- : " .. slot2.arg4)
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
				getProxy(SettingsProxy).setUserAgreement(slot2)

				slot3 = {}
				slot4 = {
					"*all gate info :"
				}

				for slot8, slot9 in ipairs(slot0.serverlist) do
					slot10, slot11 = nil

					if CSharpVersion >= 999 and VersionMgr.Inst:OnProxyUsing() then
						slot10 = ((slot9.proxy_ip == nil or slot9.proxy_ip == "") and slot9.ip) or slot9.proxy_ip
						slot11 = ((slot9.proxy_ip == nil or slot9.proxy_ip == "") and slot9.port) or slot9.proxy_port
					else
						slot10 = slot9.ip
						slot11 = slot9.port
					end

					slot12 = Server.New({
						id = slot9.ids[1],
						host = slot10,
						port = slot11,
						status = slot9.state,
						name = slot9.name,
						tag_state = slot9.tag_state,
						sort = slot9.sort
					})
					slot4[#slot4 + 1] = slot9.proxy_ip .. ":" .. slot9.proxy_port
					slot4[#slot4 + 1] = slot9.ip .. ":" .. slot9.port

					slot12:display()
					table.insert(slot3, slot12)
				end

				print(table.concat(slot4, "\n"))
				getProxy(ServerProxy).setServers(slot5, slot3, slot0.uid)
				getProxy(GatewayNoticeProxy).setGatewayNotices(slot6, slot0.notice_list)
				slot1.facade:sendNotification(GAME.USER_LOGIN_SUCCESS, slot0)
				pg.PushNotificationMgr.GetInstance():cancelAll()
				print("user logined............", #slot3)
			else
				print("user login failed ............")

				if slot0.result == 13 then
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
			end
		end, false)
	end)
end

return class("UserLoginCommand", pm.SimpleCommand)
