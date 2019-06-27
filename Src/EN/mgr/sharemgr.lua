pg = pg or {}
pg.ShareMgr = singletonClass("ShareMgr")
pg.ShareMgr.TypeAdmira = 1
pg.ShareMgr.TypeShipProfile = 2
pg.ShareMgr.TypeNewShip = 3
pg.ShareMgr.TypeBackyard = 4
pg.ShareMgr.TypeNewSkin = 5
pg.ShareMgr.TypeSummary = 6
pg.ShareMgr.TypePhoto = 7
pg.ShareMgr.TypeReflux = 8
pg.ShareMgr.TypeCommander = 9
pg.ShareMgr.TypeColoring = 10
pg.ShareMgr.TypeChallenge = 11
pg.ShareMgr.PANEL_TYPE_BLACK = 1
pg.ShareMgr.PANEL_TYPE_PINK = 2
pg.ShareMgr.ANCHORS_TYPE = {
	{
		0,
		0,
		0,
		0
	},
	{
		1,
		0,
		1,
		0
	},
	{
		0,
		1,
		0,
		1
	},
	{
		1,
		1,
		1,
		1
	}
}

function pg.ShareMgr.Init(slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		slot0.go = slot0

		slot0.go:SetActive(false)

		slot0.tr = slot0.transform
		slot0.panelBlack = slot0.tr:Find("panel")
		slot0.panelPink = slot0.tr:Find("panel_pink")
		slot0.deckTF = slot0.tr:Find("deck")

		setActive(slot0.panelBlack, false)
		setActive(slot0.panelPink, false)
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

function pg.ShareMgr.Share(slot0, slot1, slot2)
	if not isAiriUS() and not WBManager.IsSupportShare() then
		slot0.TipsMgr:GetInstance():ShowTips("指挥官，当前平台暂不支持分享功能哦")

		return
	end

	if IsNil(slot0.go) then
		slot0:Init()
	end

	if not slot2 then
		slot2 = slot1.PANEL_TYPE_BLACK
	end

	if slot2 == slot1.PANEL_TYPE_BLACK then
		slot0.panel = slot0.panelBlack
	else
		if slot2 == slot1.PANEL_TYPE_PINK then
			slot0.panel = slot0.panelPink
		end
	end

	slot3 = setActive
	slot4 = slot0.panelBlack

	if slot2 ~= slot1.PANEL_TYPE_BLACK then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.panelPink

	if slot2 ~= slot1.PANEL_TYPE_PINK then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	slot3 = slot0.share_template[slot1]
	slot4 = getProxy(PlayerProxy):getRawData()
	slot6 = getProxy(ServerProxy):getRawData()
	slot7 = (getProxy(UserProxy):getRawData() and slot5.server) or 0
	slot0.deckTF.anchorMin = Vector2(slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or {
		0.5,
		0.5,
		0.5,
		0.5
	}[1], slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or [2])
	slot0.deckTF.anchorMax = Vector2(slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or [3], slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or [4])

	setText(slot0.deckTF:Find("name/value"), (slot4 and slot4.name) or "")
	setText(slot0.deckTF:Find("server/value"), (slot6[slot7] and slot6[slot7].name) or "")
	setText(slot0.deckTF:Find("lv/value"), slot4.level)

	slot0.deckTF.anchoredPosition3D = Vector3(slot3.qrcode_location[1], slot3.qrcode_location[2], -100)
	slot0.deckTF.anchoredPosition = Vector2(slot3.qrcode_location[1], slot3.qrcode_location[2])

	_.each(slot3.hidden_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then
			table.insert(slot0.cacheComps, slot1)
			slot1:SetActive(false)
		end

		return
	end)
	_.each(slot3.show_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then
			table.insert(slot0.cacheShowComps, slot1)
			slot1:SetActive(true)
		end

		return
	end)
	_.each(slot3.move_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0.path)) then
			table.insert(slot0.cacheMoveComps, {
				slot1,
				slot1.transform.anchoredPosition.x,
				slot1.transform.anchoredPosition.y
			})
			setAnchoredPosition(slot1, {
				x = slot0.x,
				y = slot0.y
			})
		end

		return
	end)
	SetParent(slot0.deckTF, slot12, false)
	slot0.deckTF:SetAsLastSibling()

	slot13 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32)

	if not slot5.server then
		slot7 = 0
	end

	if not slot4.name then
		slot7 = ""
	end

	if not slot6[slot7].name then
		slot8 = ""
	end

	slot10 = 

	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		slot14 = slot13:TakePhoto(slot11)

		slot14:LoadImage(slot15)
		GameShare(slot3.description, slot14)
		slot0.UIMgr.GetInstance():LoadingOn()

		time = Timer.New(function ()
			slot0.UIMgr.GetInstance():LoadingOff()

			return
		end, 2, 0, 1)

		time:Start()
	else
		if slot13:Take(slot11, slot0.screenshot) then
			print("截图位置: " .. slot0.screenshot)
			slot0:Show(slot3)
		else
			slot0.TipsMgr:GetInstance():ShowTips("截图失败")
		end
	end

	SetParent(slot9, slot0.tr, false)
	_.each(slot0.cacheComps, function (slot0)
		slot0:SetActive(true)

		return
	end)

	slot0.cacheComps = {}

	_.each(slot0.cacheShowComps, function (slot0)
		slot0:SetActive(false)

		return
	end)

	slot0.cacheShowComps = {}

	_.each(slot0.cacheMoveComps, function (slot0)
		setAnchoredPosition(slot0[1], {
			x = slot0[2],
			y = slot0[3]
		})

		return
	end)

	slot0.cacheMoveComps = {}

	return
end

function pg.ShareMgr.Show(slot0, slot1)
	slot0.go:SetActive(true)
	slot0.UIMgr.GetInstance():BlurPanel(slot0.panel)
	slot0.panel:SetAsLastSibling()
	slot0.DelegateInfo.New(slot0)
	onButton(slot0, slot0.panel:Find("main/top/btnBack"), slot2)
	onButton(slot0, slot0.panel:Find("main/buttons/weibo"), function ()
		WBManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				slot0.TipsMgr:GetInstance():ShowTips("分享成功")
			end

			return
		end)
		slot1.screenshot()

		return
	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weixin"), function ()
		WXManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				slot0.TipsMgr:GetInstance():ShowTips("分享成功")
			else
				if slot1 == 99 then
					slot0.TipsMgr:GetInstance():ShowTips("指挥官，你没有安装微信客户端哦")
				end
			end

			return
		end)
		slot1.screenshot()

		return
	end)

	return
end

return
