slot0 = class("PlayerResource", import("..base.BaseUI"))
slot1 = 12
slot0.GO_MALL = "PlayerResource:GO_MALL"

function slot0.Ctor(slot0)
	slot0.super.Ctor(slot0)
	PoolMgr.GetInstance():GetUI("ResPanel", false, function (slot0)
		slot0.transform:SetParent(pg.UIMgr.GetInstance().UIMain.transform, false)
		slot0:onUILoaded(slot0)
	end)
end

function slot0.init(slot0)
	slot0.goldMax = slot0:findTF("gold_max_value")
	slot0.goldValue = slot0:findTF("gold_value")
	slot0.goldAddBtn = slot0:findTF("gold")
	slot0.oilMax = slot0:findTF("oil_max_value")
	slot0.oilValue = slot0:findTF("oil_value")
	slot0.oilAddBtn = slot0:findTF("oil")
	slot0.gemValue = slot0:findTF("gem_value")
	slot0.gemAddBtn = slot0:findTF("gem")
	slot1 = pg.shop_template

	onButton(slot0, slot0.goldAddBtn, function ()
		pg.goldExchangeMgr = GoldExchangeView.New()
	end, SFX_PANEL)
	onButton(slot0, slot0.oilAddBtn, function ()
		if not ShoppingStreet.getRiseShopId(ShopArgs.BuyOil, slot0.player.buyOilCount) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_today_buy_limit"))

			return
		end

		slot2 = pg.shop_template[slot0].num

		if pg.shop_template[slot0].num == -1 and slot1.genre == ShopArgs.BuyOil then
			slot2 = ShopArgs.getOilByLevel(slot0.player.level)
		end

		if slot0.player.buyOilCount < pg.gameset.buy_oil_limit.key_value then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_SINGLE_ITEM,
				windowSize = {
					y = 570
				},
				content = i18n("oil_buy_tip", slot1.resource_num, slot2, slot0.player.buyOilCount),
				drop = {
					id = 2,
					type = DROP_TYPE_RESOURCE,
					count = slot2
				},
				onYes = function ()
					pg.m02:sendNotification(GAME.SHOPPING, {
						count = 1,
						id = pg.m02.sendNotification
					})
				end,
				weight = LayerWeightConst.TOP_LAYER
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_oil_buy_limit"),
				custom = {
					{
						text = "text_iknow",
						sound = SFX_CANCEL
					}
				}
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.gemAddBtn, function ()
		function ()
			if not pg.m02:hasMediator(ChargeMediator.__cname) then
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
					wrap = ChargeScene.TYPE_DIAMOND
				})
			else
				pg.m02:sendNotification(slot0.GO_MALL)
			end
		end()
	end, SFX_PANEL)
end

function slot0.setParent(slot0, slot1, slot2)
	setParent(slot0._go, slot1, slot2)
end

function slot0.setResources(slot0, slot1)
	slot0.player = slot1

	setText(slot0.goldMax, "MAX: " .. slot3)
	setText(slot0.goldValue, slot1.gold)
	setText(slot0.oilMax, "MAX: " .. slot4)
	setText(slot0.oilValue, slot1.oil)
	setText(slot0.gemValue, slot1:getTotalGem())
end

function slot0.willExit(slot0)
	if pg.goldExchangeMgr then
		pg.goldExchangeMgr:willExit()
	end

	PoolMgr.GetInstance():ReturnUI("ResPanel", slot0._go)
end

return slot0
