class("FireworkFactoryMediator", import(".MiniHubMediator")).handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == MiniGameProxy.ON_HUB_DATA_UPDATE then
		slot0.viewComponent:SetMGHubData(slot3)
	elseif slot2 == GAME.SEND_MINI_GAME_OP_DONE then
		slot4 = slot3.argList

		if slot3.cmd == 1 then
			seriesAsync({
				function (slot0)
					slot0:sendNotification(GAME.MODIFY_MINI_GAME_DATA, {
						id = MiniGameDataCreator.ShrineGameID,
						map = {
							count = (getProxy(MiniGameProxy):GetMiniGameData(MiniGameDataCreator.ShrineGameID):GetRuntimeData("count") or 0) + 1
						}
					})
					slot0()
				end,
				function (slot0)
					if #slot0.awards > 0 then
						slot1.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1, slot0)
					else
						slot0()
					end
				end,
				function (slot0)
					slot0.viewComponent:AfterResult()
				end
			})
		end

		slot0.viewComponent:OnSendMiniGameOPDone(slot3.argList)
	elseif slot2 == GAME.MODIFY_MINI_GAME_DATA_DONE then
		slot0.viewComponent:OnModifyMiniGameDataDone(slot3)
	end
end

return class("FireworkFactoryMediator", import(".MiniHubMediator"))
