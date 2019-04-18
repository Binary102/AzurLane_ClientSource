slot0 = class("ChargeScene", import("..base.BaseUI"))
slot0.TYPE_SKIN = 1
slot0.TYPE_DIAMOND = 2
slot0.TYPE_GIFT = 3
slot0.TYPE_ITEM = 4
slot1 = pg.skin_page_template

function slot0.getUIName(slot0)
	return "ChargeUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0.resPanel:setResources(slot1)
end

function slot0.setFirstChargeIds(slot0, slot1)
	slot0.firstChargeIds = slot1
end

function slot0.setChargedList(slot0, slot1)
	slot0.chargedList = slot1
end

function slot0.setNormalList(slot0, slot1)
	slot0.normalList = slot1
end

function slot0.setNormalGroupList(slot0, slot1)
	slot0.normalGroupList = slot1

	slot0:addRefreshTimer(GetZeroTime())
end

function slot0.setSkinList(slot0, slot1)
	slot0.skinList = slot1
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.top, {
		y = slot0.top.transform.rect.height
	})
	shiftPanel(slot0.top, nil, 0, slot2, slot1, true, true)

	slot0.tweens = topAnimation(slot0:findTF("left_top/left", slot0.top), slot0:findTF("left_top/right", slot0.top), slot0:findTF("left_top/title", slot0.top), slot0:findTF("left_top/activity", slot0.top), nil, function ()
		slot0.tweens = nil
	end)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.top, nil, slot0.top.transform.rect.height, 0.3, 0, true, true)
end

function slot0.init(slot0)
	slot0.cards = {}
	slot0.detail = slot0:findTF("frame/top/detail")

	setActive(findTF(slot0.detail, "skin_window"), false)

	slot0.togglePanel = slot0:findTF("frame/bottom/toggle_list")
	slot0.viewContainer = slot0:findTF("frame/viewContainer")
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0:findTF("frame/top/res"), false)

	slot0.top = slot0:findTF("frame/top")
	slot0.frame = slot0:findTF("frame")
	slot0.painting = slot0:findTF("frame/painting")
	slot0.chat = slot0:findTF("frame/chat")
	slot0.chatText = slot0:findTF("Text", slot0.chat)
	slot0.bg = slot0:findTF("frame/viewContainer/bg")
	slot0.skinSortBtn = slot0:findTF("frame/sort_btn")
	slot0.skinSortPanel = slot0:findTF("skin_index_panel")

	setActive(slot0.skinSortPanel, false)
	setActive(slot0.skinSortBtn, false)
	setActive(slot0.chat, false)

	slot0.birthWin = slot0:findTF("frame/top/birthday_win")
	slot0.birthTxt = slot0:findTF("window/birthday_input_panel/InputField", slot0.birthWin):GetComponent(typeof(InputField))
	slot0.birthCancelBtn = slot0:findTF("window/birthday_input_panel/btns/cancel_btn", slot0.birthWin)
	slot0.birthOkBtn = slot0:findTF("window/birthday_input_panel/btns/confirm_btn", slot0.birthWin)
	slot0.birthBackBtn = slot0:findTF("window/top/btnBack", slot0.birthWin)

	setActive(slot0.birthWin, false)

	slot0.diamondBtn = slot0:findTF("frame/bottom/toggle_list/diamond_btn")
	slot0.cvBankName = "cv-chargeShop"

	slot0:createLive2D("mingshi")

	slot0.live2dTimer = Timer.New(function ()
		if slot0:checkBuyDone(pg.ChargeShipTalkInfo.Actions[math.random(#pg.ChargeShipTalkInfo.Actions)].action) then
			slot0:displayShipWord(nil, false, slot1.dialog_index)
		end
	end, 20, -1)

	slot0.live2dTimer:Start()

	if isAiriJP() then
		slot0.userAgreeContainer = slot0:findTF("frame/agreement")
		slot0.userAgreeBtn3 = slot0:findTF("frame/raw1Btn")
		slot0.userAgreeBtn4 = slot0:findTF("frame/raw2Btn")
	end
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()
	onButton(slot0, slot0.skinSortBtn, function ()
		slot0:openSkinSortPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("frame/top/left_top/btnBack"), function ()
		slot0:uiExitAnimating()
		slot0.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.2)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("frame/switch_btn"), function ()
		slot0:emit(ChargeMediator.SWITCH_TO_SHOP)
		slot0.emit:stopCV()
	end, SFX_PANEL)
	onButton(slot0, slot0.painting, function ()
		slot0:displayShipWord()
		slot0.displayShipWord:emit(ChargeMediator.CLICK_MING_SHI)
	end, SFX_PANEL)
	slot0:setItemVOs()

	slot0.toggles = {}

	for slot4 = 1, 4, 1 do
		table.insert(slot0.toggles, slot5)
		onToggle(slot0, slot0.togglePanel:GetChild(slot4 - 1), function (slot0)
			if slot0 then
				slot0:switchPage(slot0.switchPage)
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot0.toggles[slot0.contextData.wrap or slot0.TYPE_DIAMOND], true)
	slot0:updateNoRes()
	onButton(slot0, slot0.birthWin, function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
		pg.UIMgr.GetInstance().UnblurPanel:uiExitAnimating()
		pg.UIMgr.GetInstance().UnblurPanel.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.2)
	end)
	onButton(slot0, slot0.birthCancelBtn, function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
		pg.UIMgr.GetInstance().UnblurPanel:uiExitAnimating()
		pg.UIMgr.GetInstance().UnblurPanel.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.2)
	end)
	onButton(slot0, slot0.birthBackBtn, function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
		pg.UIMgr.GetInstance().UnblurPanel:uiExitAnimating()
		pg.UIMgr.GetInstance().UnblurPanel.uiExitAnimating:emit(slot1.ON_BACK, nil, 0.2)
	end)
	onButton(slot0, slot0.birthOkBtn, function ()
		if slot0.birthTxt.text == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("set_birth_empty_tip"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				title = i18n("set_birth_title"),
				content = i18n("set_birth_confirm_tip", slot0.birthTxt.text),
				onYes = function ()
					pg.UIMgr.GetInstance():LoadingOn()
					pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
					setActive(slot0.birthWin, false)
					AiriSdkMgr.inst:SetBirth(slot0.birthTxt.text)
				end
			})
		end
	end)

	if isAiriJP() then
		onButton(slot0, slot0.userAgreeBtn3, function ()
			slot0:activeUserAgree(require("ShareCfg.UserAgreement3").content, true)
		end, SFX_PANEL)
		onButton(slot0, slot0.userAgreeBtn4, function ()
			slot0:activeUserAgree(require("ShareCfg.UserAgreement4").content, true)
		end, SFX_PANEL)
		onButton(slot0, slot0:findTF("frame/agreement"), function ()
			slot0:activeUserAgree("", false)
		end, SFX_CANCEL)
		onButton(slot0, slot0:findTF("frame/agreement/top/btnBack"), function ()
			slot0:activeUserAgree("", false)
		end, SFX_CANCEL)
	end
end

function slot0.openSkinSortPanel(slot0)
	setActive(slot0.skinSortPanel, true)

	slot0.isOpenSkinSortPanel = true

	if not slot0.isInitSkinSortPanel then
		slot0.isInitSkinSortPanel = true

		onButton(slot0, slot0.skinSortPanel, function ()
			slot0:closeSkinSortPanel()
		end, SFX_PANEL)

		slot1 = UIItemList.New(slot0:findTF("content", slot0.skinSortPanel), slot0:findTF("content/tpl", slot0.skinSortPanel))

		slot1:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot3, slot4 = nil

				if slot1 == 0 then
					slot4 = slot1
					slot3 = GetSpriteFromAtlas("indextext", "index_skin_all")
				else
					slot3 = GetSpriteFromAtlas("indextext", "index_skin_" .. slot0[slot0.all[slot1]].res)
				end

				setImageSprite(slot2:Find("Image"), slot3, true)
				onToggle(slot1, slot2, function (slot0)
					if slot0 then
						slot0.contextData.skinSortId = slot0.contextData

						slot0:updateSkinPage()
						setImageSprite(slot0.skinSortBtn:Find("Image"), , true)
						slot0:closeSkinSortPanel()
					end
				end, SFX_PANEL)
			end
		end)
		slot1:align(#slot0.all + 1)
	end
end

function slot0.closeSkinSortPanel(slot0)
	setActive(slot0.skinSortPanel, false)

	slot0.isOpenSkinSortPanel = false
end

function slot0.activeUserAgree(slot0, slot1, slot2)
	SetActive(slot0.userAgreeContainer, slot2)

	if slot2 then
		pg.UIMgr.GetInstance():BlurPanel(slot0.userAgreeContainer)
		setText(slot0:findTF("container/scrollrect/content/Text", slot0.userAgreeContainer), slot1)
		scrollTo(slot0:findTF("container/scrollrect", slot0.userAgreeContainer), 0, 1)
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreeContainer, slot0.frame)
	end
end

function slot0.checkSetBirth(slot0)
	if isAiriJP() and not AiriSdkMgr.AiriSDKInst.IsBirthSet then
		pg.UIMgr.GetInstance():BlurPanel(slot0.top)
		setActive(slot0.birthWin, true)

		slot0.birthTxt.text = ""

		return false
	end

	return true
end

function slot0.triggerPageToggle(slot0, slot1)
	if slot0.contextData.page == slot1 then
		return
	end

	for slot5, slot6 in pairs(slot0.toggles) do
		if slot6:GetComponent("Toggle").isOn then
			triggerToggle(slot6, false)
		end
	end

	triggerToggle(slot0.toggles[slot1], true)
end

function slot0.switchPage(slot0, slot1)
	slot0.contextData.page = slot1

	if slot0.prePage and slot0.prePage == slot1 then
		return
	end

	if isAiriJP() then
		setActive(slot0.userAgreeBtn3, slot1 == slot0.TYPE_DIAMOND)
		setActive(slot0.userAgreeBtn4, slot1 == slot0.TYPE_DIAMOND)
	end

	if slot1 == slot0.TYPE_DIAMOND or slot1 == slot0.TYPE_GIFT then
		slot0:checkSetBirth()

		if not slot0.isInitDamonds then
			slot0:initDamonds()
		end

		if slot0.chargedList and slot0.firstChargeIds then
			slot0:sortDamondItems(0)
		end
	elseif slot1 == slot0.TYPE_SKIN then
		if not slot0.isInitDamonds then
			slot0:initDamonds()
		end

		slot0:updateSkinPage()
	elseif slot1 == slot0.TYPE_ITEM and not slot0.isInitItems then
		slot0:initItems()
	end

	setActive(slot0.skinSortBtn, not LOCK_SKIN_SORT and slot1 == slot0.TYPE_SKIN)

	slot0.prePage = slot1
end

function slot0.initRect(slot0, slot1, slot2, slot3)
	slot4 = slot1:GetComponent("LScrollRect")

	function slot4.onInitItem(slot0)
		slot0(slot0)
	end

	function slot4.onUpdateItem(slot0, slot1)
		slot0(slot0, slot1)
	end

	return slot4
end

function slot0.initDamondsData(slot0)
	slot0.damondItemVOs = {}

	for slot5, slot6 in pairs(pg.pay_data_display.all) do
		if AiriCheckAudit() and slot6 == 1 then
		else
			table.insert(slot0.damondItemVOs, Goods.New({
				shop_id = slot6
			}, Goods.TYPE_CHARGE))
		end
	end

	for slot6, slot7 in pairs(pg.shop_template.all) do
		if slot2[slot7].genre == "gift_package" then
			table.insert(slot0.damondItemVOs, Goods.New({
				shop_id = slot7
			}, Goods.TYPE_GIFT_PACKAGE))
		end
	end
end

function slot0.initDamonds(slot0)
	slot0.isInitDamonds = true

	slot0:initDamondsData()

	slot0.damondItems = {}
	slot0.diamondRect = slot0:initRect(slot0.viewContainer:Find("diamondPanel"), function (slot0)
		slot1 = slot0:createGoods(slot0)

		onButton(slot0, slot1.tr, function ()
			slot0:confirm(slot0)
		end, SFX_PANEL)
		onButton(slot0, slot1.mask, function ()
			return
		end, SFX_PANEL)

		slot0.damondItems[slot0] = slot1
	end, function (slot0, slot1)
		if not slot0.damondItems[slot1] then
			slot1(slot1)

			slot2 = slot0.damondItems[slot1]
		end

		slot2:update(slot0.tempDamondVOs[slot0 + 1], slot0.player, slot0.firstChargeIds)
	end)
end

function slot0.confirm(slot0, slot1)
	if slot1.goods:isChargeType() then
		slot4 = ((table.contains(slot0.firstChargeIds, slot1.goods.id) or slot1.goods:firstPayDouble()) and 4) or slot1.goods:getConfig("tag")

		if slot1.goods:isMonthCard() or slot1.goods:isGiftBox() or slot1.goods:isItemBox() then
			slot6 = {}

			for slot11, slot12 in ipairs(slot7) do
				table.insert(slot6, {
					type = slot12[1],
					id = slot12[2],
					count = slot12[3]
				})
			end

			slot8 = slot1.goods:getConfig("gem") + slot1.goods:getConfig("extra_gem")

			if not slot5 and slot8 > 0 then
				table.insert(slot6, {
					id = 4,
					type = 1,
					count = slot8
				})
			end

			slot9 = nil

			if slot5 then
				slot9 = {
					id = 4,
					type = 1,
					count = slot8
				}
			end

			slot0:showItemDetail({
				isChargeType = true,
				icon = "chargeicon/" .. slot1.goods:getConfig("picture"),
				name = slot1.goods:getConfig("name"),
				tipExtra = (slot5 and i18n("charge_title_getitem_month")) or i18n("charge_title_getitem"),
				extraItems = slot6,
				price = slot1.goods:getConfig("money"),
				tagType = slot4,
				isMonthCard = slot5,
				tipBonus = (slot5 and i18n("charge_title_getitem_soon")) or "",
				bonusItem = slot9,
				descExtra = slot1.goods:getConfig("descrip_extra"),
				onYes = function ()
					if slot0:checkSetBirth() then
						slot0:emit(ChargeMediator.CHARGE, slot1.goods.id)
						SetActive(slot0.detail, false)
						pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
					end
				end
			})
		elseif slot1.goods:isGem() then
			slot0:showItemDetail({
				isChargeType = true,
				icon = "chargeicon/" .. slot1.goods:getConfig("picture"),
				name = slot1.goods:getConfig("name"),
				price = slot1.goods:getConfig("money"),
				tagType = slot4,
				normalTip = i18n("charge_start_tip", slot1.goods:getConfig("money"), (slot3 and slot1.goods:getConfig("gem") + slot1.goods:getConfig("gem")) or slot1.goods.getConfig("gem") + slot1.goods:getConfig("extra_gem")),
				onYes = function ()
					if slot0:checkSetBirth() then
						slot0:emit(ChargeMediator.CHARGE, slot1.goods.id)
						SetActive(slot0.detail, false)
						pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
					end
				end
			})
		end
	elseif slot1.goods.type == Goods.TYPE_SKIN then
		slot3 = pg.ship_skin_template[slot1.goods:getConfig("effect_args")[1]]
		slot4 = slot1.goods.buyCount or 0

		if slot4 == 0 then
			slot0:showSkinDetail(slot1.goods)
		end
	elseif slot1.goods.type == Goods.TYPE_ACTIVITY or slot1.goods.type == Goods.TYPE_ACTIVITY_EXTRA then
		if slot1.goods:getConfig("commodity_type") == DROP_TYPE_SKIN then
			slot3 = pg.ship_skin_template[slot1.goods:getConfig("commodity_id")]
			slot4 = slot1.goods.buyCount or 0

			if slot4 == 0 then
				slot0:showSkinDetail(slot1.goods)
			end
		end
	else
		slot2 = {}

		if type(pg.item_data_statistics[slot1.goods:getConfig("effect_args")[1]].display_icon) == "table" then
			for slot9, slot10 in ipairs(slot5) do
				table.insert(slot2, {
					type = slot10[1],
					id = slot10[2],
					count = slot10[3]
				})
			end
		end

		slot0:showItemDetail({
			isChargeType = false,
			isMonthCard = false,
			icon = slot4.icon,
			name = slot4.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = slot2,
			price = slot1.goods:getConfig("resource_num"),
			tagType = slot1.goods:getConfig("tag"),
			onYes = function ()
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", slot0.goods:getConfig("resource_num"), slot1.name),
					onYes = function ()
						slot0:emit(ChargeMediator.BUY_ITEM, slot1.goods.id, 1)
						SetActive(slot0.detail, false)
						pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
					end
				})
			end
		})
	end
end

function slot0.sortDamondItems(slot0, slot1)
	if slot0.contextData.page ~= slot0.TYPE_DIAMOND and slot2 ~= slot0.TYPE_GIFT then
		return
	end

	slot0.tempDamondVOs = {}

	for slot6, slot7 in ipairs(slot0.damondItemVOs) do
		if slot7:isChargeType() then
			slot7:updateBuyCount(slot0:getBuyCount(slot0.chargedList, slot7.id))

			if slot2 == slot0.TYPE_DIAMOND and (slot7:isMonthCard() or slot7:isGem() or slot7:isGiftBox()) then
				if slot7:canPurchase() and slot7:inTime() then
					table.insert(slot0.tempDamondVOs, slot7)
				end
			elseif slot2 == slot0.TYPE_GIFT and slot7:isItemBox() and slot7:canPurchase() and slot7:inTime() then
				table.insert(slot0.tempDamondVOs, slot7)
			end
		elseif not slot7:isChargeType() and slot2 == slot0.TYPE_GIFT and not slot7:isLevelLimit(slot0.player.level, true) then
			slot7:updateBuyCount(slot0:getBuyCount(slot0.normalList, slot7.id))

			slot9 = false

			if (slot7:getConfig("group") or 0) > 0 then
				slot7:updateGroupCount(slot0:getGroupLimit(slot8))

				slot9 = slot7:getConfig("group_limit") > 0 and slot10 <= slot11
				slot10, slot11 = pg.TimeMgr.GetInstance():inTime(slot7:getConfig("time"))
			end

			if slot11 then
				slot0:addUpdateTimer(slot11)
			end

			if slot10 and slot7:canPurchase() and not slot9 then
				table.insert(slot0.tempDamondVOs, slot7)
			end
		end
	end

	table.sort(slot0.tempDamondVOs, function (slot0, slot1)
		slot3 = (not table.contains(slot0.firstChargeIds, slot0.id) and slot0:firstPayDouble() and 1) or 0
		slot5 = (not table.contains(slot0.firstChargeIds, slot1.id) and slot1:firstPayDouble() and 1) or 0
		slot6 = 0
		slot7 = 0
		slot8 = nil

		if slot0:isChargeType() and slot0:isMonthCard() and slot0.player:getCardById(VipCard.MONTH) then
			slot6 = (math.floor((slot9:getLeftDate() - pg.TimeMgr.GetInstance():GetServerTime()) / 86400) > (slot0:getConfig("limit_arg") or 0) and 1) or 0
		end

		if slot6 ~= ((math.floor((slot9:getLeftDate() - pg.TimeMgr.GetInstance():GetServerTime()) / 86400) > (slot1:getConfig("limit_arg") or 0) and 1) or 0) then
			return slot6 < slot7
		end

		if slot3 and slot5 then
			if slot2 == slot4 then
				if ((slot0:getConfig("tag") == 2 and 1) or 0) == ((slot1:getConfig("tag") == 2 and 1) or 0) then
					return slot0.id < slot1.id
				else
					return slot10 < slot9
				end
			else
				return ((slot2 and 1) or 0) > ((slot4 and 1) or 0)
			end
		end

		return slot0.id < slot1.id
	end)
	slot0.diamondRect:SetTotalCount(#slot0.tempDamondVOs, slot1 or slot0.diamondRect.value)
end

function slot0.updateSkinPage(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(pg.shop_template.all) do
		if pg.shop_template[slot6].genre == "skin_shop" then
			slot7:updateBuyCount((table.contains(slot0.skinList, Goods.New({
				shop_id = slot6
			}, Goods.TYPE_SKIN).getConfig(slot7, "effect_args")[1]) and 1) or 0)

			slot10, slot11 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[slot6].time)

			if slot11 then
				slot0:addUpdateTimer(slot11)
			end

			if slot10 then
				table.insert(slot1, slot7)

				slot12, slot13 = pg.TimeMgr.GetInstance():inTime(slot7:getConfig("discount_time"))

				if slot13 then
					slot0:addUpdateTimer(slot13)
				end
			end
		end
	end

	slot2 = getProxy(ActivityProxy)

	for slot6, slot7 in ipairs(pg.activity_shop_template.all) do
		if pg.activity_shop_template[slot7].commodity_type == DROP_TYPE_SKIN and slot2:getActivityById(slot8.activity) and not slot9:isEnd() then
			slot10:updateBuyCount((table.contains(slot0.skinList, Goods.New({
				shop_id = slot7
			}, Goods.TYPE_ACTIVITY).getConfig(slot10, "commodity_id")) and 1) or 0)
			table.insert(slot1, slot10)
		end
	end

	for slot6, slot7 in ipairs(pg.activity_shop_extra.all) do
		if pg.activity_shop_extra[slot7].commodity_type == DROP_TYPE_SKIN then
			slot9 = slot2:getActivityById(slot8.activity)

			if (slot8.activity == 0 and pg.TimeMgr.GetInstance():inTime(slot8.time)) or (slot9 and not slot9:isEnd()) then
				slot10:updateBuyCount((table.contains(slot0.skinList, Goods.New({
					shop_id = slot7
				}, Goods.TYPE_ACTIVITY_EXTRA).getConfig(slot10, "commodity_id")) and 1) or 0)
				table.insert(slot1, slot10)
			end
		end
	end

	slot3 = slot0.contextData.skinSortId or 0

	for slot7 = #slot1, 1, -1 do
		if pg.ship_skin_template[slot1[slot7]:getSkinId()].shop_type_id ~= slot3 and slot3 ~= 0 and (slot9.shop_type_id ~= 0 or slot3 ~= 9999) then
			table.remove(slot1, slot7)
		end
	end

	table.sort(slot1, function (slot0, slot1)
		if (slot0.buyCount or 0) == (slot1.buyCount or 0) then
			if slot0:getConfig("order") == slot1:getConfig("order") then
				return slot0.id < slot1.id
			else
				return slot4 < slot5
			end
		else
			return slot2 < slot3
		end
	end)

	slot0.tempDamondVOs = slot1

	slot0.diamondRect:SetTotalCount(#slot0.tempDamondVOs, 0)
end

function slot0.createGoods(slot0, slot1)
	return ChargeCard.New(slot1)
end

function slot0.setItemVOs(slot0)
	slot0.itemVOs = {}

	for slot5, slot6 in pairs(pg.shop_template.all) do
		if slot1[slot6].genre == "gem_shop" then
			table.insert(slot0.itemVOs, Goods.New({
				count = 0,
				shop_id = slot6
			}, Goods.TYPE_MILITARY))
		end
	end
end

function slot0.initItems(slot0)
	slot0.isInitItems = true
	slot0.itemGos = {}
	slot0.itemRect = slot0:initRect(slot0.viewContainer:Find("itemPanel"), function (slot0)
		slot1 = GoodsCard.New(slot0)

		table.insert(slot0.cards, slot1)
		onButton(slot0, slot1.tr, function ()
			if slot0.goodsVO:isLevelLimit(slot1.player.level) then
				pg.TipsMgr:GetInstance():ShowTips(i18n("charge_level_limit"))

				return
			end

			slot1 = {}
			slot2 = nil

			if slot0.goodsVO:getConfig("effect_args") == "ship_bag_size" then
				if Player.MAX_SHIP_BAG <= slot1.player.ship_bag_max then
					pg.TipsMgr:GetInstance():ShowTips(i18n("charge_ship_bag_max"))

					return
				end

				slot2 = ({
					count = 1,
					type = DROP_TYPE_ITEM,
					id = Goods.SHIP_BAG_SIZE_ITEM
				})["id"]
			elseif slot0 == "equip_bag_size" then
				if Player.MAX_EQUIP_BAG <= slot1.player.equip_bag_max then
					pg.TipsMgr:GetInstance():ShowTips(i18n("charge_equip_bag_max"))

					return
				end

				slot2 = ({
					count = 1,
					type = DROP_TYPE_ITEM,
					id = Goods.EQUIP_BAG_SIZE_ITEM
				})["id"]
			elseif slot0 == "commander_bag_size" then
				if Player.MAX_COMMANDER_BAG <= slot1.player.commanderBagMax then
					pg.TipsMgr:GetInstance():ShowTips(i18n("charge_commander_bag_max"))

					return
				end

				slot2 = ({
					count = 1,
					type = DROP_TYPE_ITEM,
					id = Goods.COMMANDER_BAG_SIZE_ITEM
				})["id"]
			else
				slot2 = (slot0.goodsVO:getConfig("type") ~= DROP_TYPE_RESOURCE or id2ItemId(({
					id = slot0.goodsVO:getConfig("effect_args")[1],
					type = slot0.goodsVO:getConfig("type"),
					count = slot0.goodsVO:getConfig("num")
				})["id"])) and ()["id"]

				pg.MsgboxMgr.GetInstance():showSingleItemBox({
					hideLine = true,
					yesText = "text_buy",
					drop = ,
					onYes = function ()
						if slot0 then
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("charge_scene_buy_confirm", slot1.goodsVO:getConfig("resource_num"), Item.New({
									id = slot0
								}):getConfig("name")),
								onYes = function ()
									slot0:emit(ChargeMediator.BUY_ITEM, slot1.goodsVO.id, 1)
								end
							})
						end
					end
				})

				return
			end
		end)

		slot0.itemGos[slot0] = slot1
	end, function (slot0, slot1)
		if not slot0.itemGos[slot1] then
			slot1(slot1)

			slot2 = slot0.itemGos[slot1]
		end

		slot2:update(slot3)
		slot2:setLevelMask(slot0.player.level)
		slot2:setGroupMask(slot0:getGroupLimit(slot0.itemVOs[slot0 + 1]:getConfig("group")))
	end)

	slot0:sortItems()
end

function slot0.updateItemVO(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.itemVOs) do
		if slot1.id == slot6.id then
			slot0.itemVOs[slot5] = slot1
		end
	end

	slot0:sortItems()
end

function slot0.sortItems(slot0)
	table.sort(slot0.itemVOs, function (slot0, slot1)
		if ((slot0:isLevelLimit(slot0.player.level) and 1) or 0) == ((slot1:isLevelLimit(slot0.player.level) and 1) or 0) then
			return slot1.id < slot0.id
		end

		return slot2 < slot3
	end)
	slot0.itemRect:SetTotalCount(#slot0.itemVOs, -1)
end

function slot0.closeItemDetail(slot0)
	if slot0.detail then
		SetActive(slot0.detail, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
	end
end

function slot0.showItemDetail(slot0, slot1)
	slot2 = slot1.icon
	slot3 = (slot1.name and slot1.name) or ""
	slot4 = slot1.tipBonus or ""
	slot5 = slot1.bonusItem
	slot6 = (slot1.tipExtra and slot1.tipExtra) or ""
	slot7 = (slot1.extraItems and slot1.extraItems) or {}
	slot8 = (slot1.price and slot1.price) or 0
	slot9 = slot1.isChargeType
	slot10 = slot1.isMonthCard
	slot11 = slot1.tagType

	setActive(slot0:findTF("window2", slot0.detail), slot12)
	setActive(slot0:findTF("window", slot0.detail), not slot1.normalTip)
	slot0:bindDetailTF((slot1.normalTip and slot0:findTF("window2", slot0.detail)) or slot0:findTF("window", slot0.detail))

	if slot0.detailNormalTip then
		setActive(slot0.detailNormalTip, slot12)
	end

	if slot0.detailContain then
		setActive(slot0.detailContain, not slot12)
	end

	if slot12 then
		if slot0.detailNormalTip:GetComponent("Text") then
			setText(slot0.detailNormalTip, slot12)
		else
			setButtonText(slot0.detailNormalTip, slot12)
		end
	end

	setActive(slot0.detailTag, slot11 > 0)

	if slot11 > 0 then
		for slot16, slot17 in ipairs(slot0.detailTags) do
			setActive(slot17, slot16 == slot11)
		end
	end

	slot0.detailIconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

	LoadSpriteAsync(slot2, function (slot0)
		if slot0 then
			slot0.detailIconTF.sprite = slot0
		end
	end)
	setText(slot0.detailName, slot3)
	setActive(slot0.detailRmb, slot9)
	setActive(slot0.detailGem, not slot9)
	setText(slot0.detailPrice, slot8)

	if slot0.detailDescExtra ~= nil then
		setActive(slot0.detailDescExtra, slot1.descExtra and slot1.descExtra ~= "")
		setText(slot0.detailDescExtra, slot1.descExtra or "")
	end

	if slot0.detailContain then
		SetActive(slot0.normal, slot10)

		if slot10 then
			updateDrop(slot0.detailItem, slot5)

			slot13, slot14 = contentWrap(slot5.cfg.name, 10, 2)

			if slot13 then
				slot14 = slot14 .. "..."
			end

			setText(slot0.detailItem:Find("name"), slot14)
			setText(slot0.detailTip, slot4)
		end

		setText(slot0.detailTip2, slot6)

		for slot16 = #slot7, slot0.detailItemList.childCount - 1, 1 do
			Destroy(slot0.detailItemList:GetChild(slot16))
		end

		for slot16 = slot0.detailItemList.childCount, #slot7 - 1, 1 do
			cloneTplTo(slot0.detailItem, slot0.detailItemList)
		end

		for slot16 = 1, #slot7, 1 do
			updateDrop(slot17, slot7[slot16])

			slot18, slot19 = contentWrap(slot7[slot16].cfg.name, 8, 2)

			if slot18 then
				slot19 = slot19 .. "..."
			end

			setText(slot17:Find("name"), slot19)
			onButton(slot0, slot17, function ()
				pg.MsgboxMgr.GetInstance():showSingleItemBox({
					hideNo = true,
					drop = slot0[pg.MsgboxMgr.GetInstance()]
				})
			end, SFX_PANEL)
		end
	end

	onButton(slot0, slot0:findTF("button_container/button_cancel", slot0.detailWindow), function ()
		SetActive(slot0.detail, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("button_container/button_ok", slot0.detailWindow), slot1.onYes or function ()
		return
	end, SFX_PANEL)
	setActive(slot0.detail, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.top)
end

function slot0.bindDetailTF(slot0, slot1)
	slot0.detailWindow = slot1
	slot0.detailName = slot0:findTF("goods/name", slot0.detailWindow)
	slot0.detailIcon = slot0:findTF("goods/icon", slot0.detailWindow)
	slot0.detailIconTF = slot0.detailIcon:GetComponent(typeof(Image))
	slot0.detailRmb = slot0:findTF("prince_bg/contain/icon_rmb", slot0.detailWindow)
	slot0.detailGem = slot0:findTF("prince_bg/contain/icon_gem", slot0.detailWindow)
	slot0.detailPrice = slot0:findTF("prince_bg/contain/Text", slot0.detailWindow)
	slot0.detailTag = slot0:findTF("goods/tag", slot0.detailWindow)
	slot0.detailTags = {}

	table.insert(slot0.detailTags, slot0:findTF("hot", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("new", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("advice", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("double", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("discount", slot0.detailTag))

	slot0.detailTagDoubleTF = slot0:findTF("double", slot0.detailTag)
	slot0.detailTagAdviceTF = slot0:findTF("advice", slot0.detailTag)
	slot0.detailContain = slot0:findTF("container", slot0.detailWindow)

	if slot0.detailContain then
		slot0.extra = slot0:findTF("container/items", slot0.detailWindow)
		slot0.detailTip2 = slot0:findTF("Text", slot0.extra)
		slot0.detailItemList = slot0:findTF("scrollview/list", slot0.extra)
		slot0.normal = slot0:findTF("container/normal_items", slot0.detailWindow)
		slot0.detailTip = slot0:findTF("Text", slot0.normal)
		slot0.detailItem = slot0:findTF("item_tpl", slot0.normal)
		slot0.detailDescExtra = slot0:findTF("container/Text", slot0.detailWindow)
	end

	slot0.detailNormalTip = slot0:findTF("NormalTips", slot0.detailWindow)
end

function slot0.showSkinDetail(slot0, slot1)
	if not slot0.skinWindow then
		slot0.skinWindow = {
			tf = findTF(slot0.detail, "skin_window"),
			tag = findTF(()["tf"], "goods/tag"),
			tagDiscount = findTF(()["tf"], "goods/tag/discount"),
			character = findTF(()["tf"], "goods/character"),
			name = findTF(()["tf"], "goods/name"),
			diamond = findTF(()["tf"], "prince_bg/diamond"),
			price = findTF(()["tf"], "prince_bg/diamond/Text"),
			activity = findTF(()["tf"], "prince_bg/activity"),
			desc = findTF(()["tf"], "NormalTips/Text"),
			confirm = findTF(()["tf"], "button_container/button_ok"),
			cancel = findTF(()["tf"], "button_container/button_cancel"),
			confirm_buy = findTF(()["confirm"], "buy"),
			confirm_go = findTF(()["confirm"], "go"),
			discount = findTF(()["tf"], "prince_bg/diamond/dicount"),
			tags = findTF(()["tf"], "tags")
		}
	end

	setActive(slot0:findTF("window2", slot0.detail), false)
	setActive(slot0:findTF("window", slot0.detail), false)
	setActive(slot2.diamond, false)
	setActive(slot2.activity, false)
	setActive(slot2.confirm_buy, false)
	setActive(slot2.confirm_go, false)

	slot3 = 0
	slot4 = 0
	slot5 = 0

	if slot1.type == Goods.TYPE_SKIN then
		slot3 = slot1:getConfig("effect_args")[1]
		slot4 = slot1:getConfig("tag")

		setActive(slot2.diamond, true)

		slot5 = slot1:getConfig("resource_num")

		if slot1:isDisCount() then
			slot5 = slot5 * (100 - slot1:getConfig("discount")) / 100

			setText(slot2.discount, slot1:getConfig("resource_num"))

			slot4 = 7

			setText(slot2.tagDiscount, slot1:getConfig("discount") .. " %OFF")
		end

		setActive(slot2.discount, slot6)
		setText(slot2.price, slot5)
		setActive(slot2.confirm_buy, true)
	elseif slot1.type == Goods.TYPE_ACTIVITY or slot1.type == Goods.TYPE_ACTIVITY_EXTRA then
		slot3 = slot1:getConfig("commodity_id")
		slot4 = 5

		setActive(slot2.activity, true)
		setActive(slot2.confirm_go, true)
	end

	setActive(slot2.tag, slot4 > 0)

	if slot4 > 0 then
		for slot9 = slot2.tag.childCount - 1, 0, -1 do
			setActive(slot2.tag:GetChild(slot9), slot9 + 1 == slot4)
		end
	end

	slot2.prefabName = pg.ship_skin_template[slot3].prefab

	PoolMgr.GetInstance():GetSpineChar(pg.ship_skin_template[slot3].prefab, true, function (slot0)
		if slot0.prefab ~= slot1.prefabName then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0)
		else
			setParent(slot0, slot1.character, false)

			slot0.name = slot0.prefab
			slot0.transform.localScale = Vector3(0.5, 0.5, 1)

			slot0:GetComponent(typeof(SpineAnimUI)):SetAction(slot0.show_skin or "stand", 0)
		end
	end)
	setText(slot2.name, HXSet.hxLan(pg.ship_skin_template[slot3].name))
	setActive(slot2.tags, true)

	for slot10 = 0, slot2.tags.childCount - 1, 1 do
		setActive(slot2.tags:GetChild(slot10), false)
	end

	_.each(slot6.tag, function (slot0)
		setActive(slot0.tags:Find("tag" .. slot0), true)
	end)
	setText(slot2.desc, HXSet.hxLan(slot7))

	if #slot2.desc:GetComponent(typeof(Text)).text > 50 then
		slot8.alignment = TextAnchor.MiddleLeft
	else
		slot8.alignment = TextAnchor.MiddleCenter
	end

	function slot0.skinWindow.closeWindow()
		if slot0.prefabName then
			if not IsNil(findTF(slot0.character, slot0.prefabName)) then
				PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.gameObject)
			end

			slot0.prefabName = nil
		end

		setActive(slot0.tf, false)
		SetActive(slot0.tf.detail, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot1.top, slot1.frame)
	end

	onButton(slot0, slot2.confirm, function ()
		slot0.skinWindow.closeWindow()

		if slot1.type == Goods.TYPE_SKIN then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("charge_scene_buy_confirm", , HXSet.hxLan(slot3.name)),
				onYes = function ()
					slot0:emit(ChargeMediator.BUY_ITEM, slot1.id, 1)
				end
			})
		else
			slot0.contextData.wrap = slot4.TYPE_SKIN

			if slot1.type == Goods.TYPE_ACTIVITY or slot1.type == Goods.TYPE_ACTIVITY_EXTRA then
				slot0 = slot1:getConfig("time")
				slot2 = getProxy(ActivityProxy):getActivityById(slot1:getConfig("activity"))

				if (slot1.getConfig("activity") == 0 and pg.TimeMgr.GetInstance():inTime(slot0)) or (slot2 and not slot2:isEnd()) then
					if slot1.type == Goods.TYPE_ACTIVITY then
						slot0:emit(ChargeMediator.GO_SHOPS_LAYER)
					elseif slot1.type == Goods.TYPE_ACTIVITY_EXTRA then
						if slot1:getConfig("scene") and #slot3 > 0 then
							slot0:emit(ChargeMediator.OPEN_SCENE, slot3)
						else
							slot0:emit(ChargeMediator.OPEN_ACTIVITY, slot1)
						end
					end
				else
					pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_not_start"))
				end
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot2.cancel, slot0.skinWindow.closeWindow, SFX_PANEL)
	setActive(slot2.tf, true)
	setActive(slot0.detail, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.top)
end

function slot0.getBuyCount(slot0, slot1, slot2)
	if not slot1 then
		return 0
	end

	return (slot1[slot2] and slot3.buyCount) or 0
end

function slot0.getGroupLimit(slot0, slot1)
	if not slot0.normalGroupList then
		return 0
	end

	for slot5, slot6 in ipairs(slot0.normalGroupList) do
		if slot6.shop_id == slot1 then
			return slot6.pay_count
		end
	end

	return 0
end

function slot0.updateNoRes(slot0, slot1)
	if not slot1 then
		slot1 = slot0.contextData.noRes
	else
		slot0.contextData.noRes = slot1
	end

	if not slot1 or #slot1 <= 0 then
		return
	end

	slot0.contextData.noRes = {}
	slot3 = getProxy(BagProxy).getData(slot2)
	slot4 = ""

	for slot8, slot9 in ipairs(slot1) do
		if slot9[2] > 0 then
			if slot9[1] == 59001 then
				slot1[slot8][2] = slot9[3] - slot0.player.gold
			else
				slot1[slot8][2] = slot9[3] - ((slot3[slot9[1]] and slot3[slot9[1]].count) or 0)
			end
		end

		if slot1[slot8][2] > 0 then
			table.insert(slot0.contextData.noRes, slot1[slot8])
		end
	end

	for slot8, slot9 in ipairs(slot0.contextData.noRes) do
		slot4 = slot4 .. i18n((slot9[1] == 59001 and "text_noRes_info_tip") or "text_noRes_info_tip2", pg.item_data_statistics[slot9[1]].name, slot9[2])

		if slot8 < #slot0.contextData.noRes then
			slot4 = slot4 .. i18n("text_noRes_info_tip_link")
		end
	end

	if slot4 == "" then
		slot0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
	else
		slot0:displayShipWord(i18n("text_shop_noRes_tip", slot4), true)
	end
end

function slot0.displayShipWord(slot0, slot1, slot2, slot3)
	if not slot0.chatFlag then
		if not slot1 and slot0.contextData.noRes and #slot0.contextData.noRes > 0 then
			setActive(slot0.chat, false)

			slot0.chat.transform.localScale = Vector3(0, 0, 1)
		end

		slot0.chatFlag = true

		setActive(slot0.chat, true)

		slot6 = nil
		slot6 = (not slot3 or pg.pay_level_award[slot3 or math.random(1, slot0.player:getChargeLevel())].dialog) and (slot1 or pg.pay_level_award[slot3 or math.random(1, slot0.player.getChargeLevel())].dialog)

		if not slot1 then
			slot0:playCV(slot5)
		end

		setText(slot0.chatText, HXSet.hxLan(slot6))

		if CHAT_POP_STR_LEN_SHORT < #slot0.chatText:GetComponent(typeof(Text)).text then
			slot7.alignment = TextAnchor.MiddleLeft
		else
			slot7.alignment = TextAnchor.MiddleCenter
		end

		function ()
			LeanTween.scale(rtf(slot0.chat.gameObject), Vector3.New(1, 1, 1), slot1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
				if not slot0 then
					LeanTween.scale(rtf(slot1.chat.gameObject), Vector3.New(0, 0, 1), ):setEase(LeanTweenType.easeInBack):setDelay(LeanTweenType.easeInBack + Vector3.New(0, 0, 1)):setOnComplete(System.Action(function ()
						slot0.chatFlag = nil

						setActive(slot0.chat, false)

						if setActive.contextData.noRes and #slot0.contextData.noRes > 0 then
							slot0:updateNoRes()
						end
					end))
				else
					slot1.chatFlag = nil
				end
			end))
		end()
	end
end

function slot0.playHeartEffect(slot0)
	if slot0.heartsTimer then
		slot0.heartsTimer:Stop()
	end

	setActive(slot1, true)

	slot0.heartsTimer = Timer.New(function ()
		setActive(setActive, false)
	end, 1, 1)

	slot0.heartsTimer:Start()
end

function slot0.addRefreshTimer(slot0, slot1)
	slot2()

	slot0.refreshTimer = Timer.New(function ()
		if (slot0 + 1) - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			slot1()
			slot2:emit(ChargeMediator.GET_CHARGE_LIST)
		else
			slot1 = pg.TimeMgr.GetInstance():DescCDTime(slot0)
		end
	end, 1, -1)

	slot0.refreshTimer:Start()
	slot0.refreshTimer.func()
end

function slot0.addUpdateTimer(slot0, slot1)
	slot2 = pg.TimeMgr:GetInstance()

	if slot0.refreshTime and slot2:LaterThan(slot1, slot0.refreshTime) then
		return
	end

	slot0.refreshTime = slot1

	slot0:removeUpdateTimer()

	slot0.updateTimer = Timer.New(function ()
		if slot0:LaterThan(os.server_date("*t", slot0:GetServerTime()), slot0.LaterThan) then
			slot2:removeUpdateTimer()

			if slot2.contextData.page == slot3.TYPE_SKIN then
				slot2:updateSkinPage()
			else
				slot2:sortDamondItems()
			end
		end
	end, 1, -1)

	slot0.updateTimer:Start()
	slot0.updateTimer.func()
end

function slot0.removeUpdateTimer(slot0)
	if slot0.updateTimer then
		slot0.updateTimer:Stop()

		slot0.updateTimer = nil
	end
end

function slot0.createLive2D(slot0, slot1)
	if slot0.l2dChar then
		pg.Live2DMgr.GetInstance():AddRefCount(slot0.l2dChar.name)
		Destroy(slot0.l2dChar.gameObject)

		slot0.l2dChar = nil
	end

	pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot1, function (slot0)
		if slot0.exited then
			Destroy(slot0)

			return
		end

		UIUtil.SetLayerRecursively(slot0, LayerMask.NameToLayer("UI"))
		setParent(slot0, slot2, true)

		slot0.transform.localScale = Vector3(52, 52, 52)
		slot0.transform.localPosition = Vector3(0, 0, 100)
		slot0.l2dChar = GetComponent(slot0, "Live2dChar")
		slot0.l2dChar.name = slot1

		function slot0.l2dChar.FinishAction(slot0)
			slot0.preAniName = nil

			if slot0 ~= slot0 then
				slot0.l2dChar:SetAction(slot0.l2dChar.SetAction)
			end
		end

		slot0.l2dChar:SetAction(slot4)
		setActive(slot0:findTF("frame/painting/live2d"), true)
	end)
end

function slot0.checkBuyDone(slot0, slot1)
	if not slot0.l2dChar then
		return
	end

	slot2 = nil

	if type(slot1) == "string" then
		if slot1 == "damonds" then
			slot2 = "diamond"
		else
			slot2 = slot1
		end
	elseif pg.shop_template[slot1] and slot3.effect_args and type(slot3.effect_args) == "table" then
		for slot7, slot8 in ipairs(slot3.effect_args) do
			if slot8 == 1 then
				slot2 = "gold"
			end
		end
	end

	slot5 = ((slot0.preAniName == "gold" or slot0.preAniName == "diamond") and (slot2 == "gold" or slot2 == "diamond")) or not (slot0.preAniName == "gold" or slot0.preAniName == "diamond")

	if slot2 then
		if slot0.preAniName ~= slot2 then
		else
			slot5 = false

			if false then
				slot5 = true
			end
		end
	end

	if slot5 then
		slot0.preAniName = slot2

		slot0.l2dChar:SetAction(pg.AssistantInfo.action2Id[slot2])
	end

	return slot5
end

function slot0.playCV(slot0, slot1)
	slot3 = nil

	if pg.pay_level_award[slot1] and slot2.cv_key ~= "" then
		slot3 = "event:/cv/chargeShop/" .. slot2.cv_key
	end

	if slot3 then
		function slot4()
			slot0:stopCV()

			slot0.stopCV._currentVoice = playSoundEffect(playSoundEffect)
		end

		if slot0.loadedCVBankName then
			slot4()
		else
			pg.CriMgr:LoadCV("chargeShop", function ()
				slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

				if pg.CriMgr.GetCVBankName.exited then
					pg.CriMgr.UnloadCVBank(slot0)
				else
					slot2()

					if slot2._currentVoice then
						slot1.loadedCVBankName = slot0
					end
				end
			end)
		end
	end
end

function slot0.stopCV(slot0)
	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil
end

function slot0.onBackPressed(slot0)
	if slot0.isOpenSkinSortPanel then
		slot0:closeSkinSortPanel()

		return
	end

	if slot0.skinWindow and isActive(slot0.skinWindow.tf) then
		slot0.skinWindow.closeWindow()
	elseif slot0.detail and isActive(slot0.detail) then
		setActive(slot0.detail, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
	else
		playSoundEffect(SFX_CANCEL)
		slot0:emit(slot0.ON_BACK)
	end
end

function slot0.willExit(slot0)
	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:dispose()
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end

	slot1 = pairs
	slot2 = slot0.damondItems or {}

	for slot4, slot5 in slot1(slot2) do
		if slot5.skinPainting then
			retPaintingPrefab(slot5.painting, slot5.skinPainting)

			slot5.skinPainting = nil
		end

		slot5:destoryTimer()
	end

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	pg.UIMgr.GetInstance():UnblurPanel(slot0.top, slot0.frame)
	SetParent(slot0.viewContainer, slot0.frame)
	slot0:removeUpdateTimer()

	if slot0.heartsTimer then
		slot0.heartsTimer:Stop()

		slot0.heartsTimer = nil
	end

	if slot0.l2dChar then
		pg.Live2DMgr.GetInstance():SubRefCount(slot0.l2dChar.name)

		slot0.l2dChar = nil
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	slot0:stopCV()

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end
end

return slot0
