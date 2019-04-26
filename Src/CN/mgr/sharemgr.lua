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
pg.ShareMgr.TypeNewShipDesignSSR = 11

function pg.ShareMgr.Init(slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		slot0.go = slot0

		slot0.go:SetActive(false)

		slot0.tr = slot0.transform
		slot0.panel = slot0.tr:Find("panel")
		slot0.decks = {
			slot0.tr:Find("deck"),
			slot0.tr:Find("deck_right"),
			slot0.tr:Find("deck_blue")
		}

		setActive(slot0.panel, true)

		for slot4, slot5 in pairs(slot0.decks) do
			setActive(slot5, false)
		end
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

function pg.ShareMgr.Share(slot0, slot1)
	if not isAiriJP() and not WBManager.IsSupportShare() then
		slot0.TipsMgr:GetInstance():ShowTips("指挥官，当前平台暂不支持分享功能哦")

		return
	end

	if IsNil(slot0.go) then
		slot0:Init()
	end

	slot2 = slot0.share_template[slot1]
	slot3 = getProxy(PlayerProxy):getRawData()
	slot5 = getProxy(ServerProxy):getRawData()

	if not getProxy(UserProxy):getRawData() or not slot4.server then
		slot6 = 0
	end

	slot5 = slot5[slot6]

	if not slot3 or not slot3.name then
		slot6 = ""
	end

	if not slot5 or not slot5.name then
		slot7 = ""
	end

	slot8 = slot0.decks
	slot9 = slot2.deck or 1

	SetActive(slot0.decks, true)
	setText(slot0.decks[slot9].Find(slot0.decks, "name"), slot6)
	setText(slot0.decks[slot9].Find(slot0.decks, "server"), "所在服务器：" .. slot7)
	setText(slot0.decks[slot9].Find(slot8, "lv"), slot3.level)

	slot0.decks[slot9].anchoredPosition3D = Vector3(slot2.qrcode_location[1], slot2.qrcode_location[2], -100)
	slot0.decks[slot9].anchoredPosition = Vector2(slot2.qrcode_location[1], slot2.qrcode_location[2])

	setParent(slot8, slot10, false)
	slot0.decks[slot9].SetAsLastSibling(slot8)
	_.each(slot2.hidden_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then
			table.insert(slot0.cacheComps, slot1)
			slot1:SetActive(false)
		end

		return
	end)
	_.each(slot2.show_comps, function (slot0)
		print("showpath:" .. slot0)

		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then
			print("showpath111:" .. slot0)
			table.insert(slot0.cacheShowComps, slot1)
			slot1:SetActive(true)
		end

		return
	end)
	_.each(slot2.move_comps, function (slot0)
		print("movepath:" .. slot0.path)

		if not IsNil(GameObject.Find(slot0.path)) then
			print("movepath:" .. slot0.path, slot4, slot0.y)
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

	slot13 = nil
	slot13 = (1.7777777777777777 >= Screen.width / Screen.height or ScreenShooter.New(math.floor(Screen.height * slot11), Screen.height, TextureFormat.ARGB32)) and ScreenShooter.New(Screen.width, math.floor(Screen.width / slot11), TextureFormat.ARGB32)
	slot9 = 1
	slot13 = ScreenShooter.New(math.floor(Screen.height * slot11), Screen.height, TextureFormat.ARGB32)

	if ScreenShooter.New(math.floor(Screen.height * slot11), Screen.height, TextureFormat.ARGB32) then
		slot13 = ScreenShooter.New(Screen.width, math.floor(Screen.width / slot11), TextureFormat.ARGB32)
	end

	if isAiriJP() then
		slot14 = slot13:TakePhoto(slot9)

		slot14:LoadImage(slot15)
		AiriSdkMgr.inst:ShareCustomScreenshot(slot2.description, slot14)
		slot0.UIMgr.GetInstance():LoadingOn()

		time = Timer.New(function ()
			slot0.UIMgr.GetInstance():LoadingOff()

			return
		end, 2, 0, 1)

		time:Start()
	else
		if slot13:Take(slot9, slot0.screenshot) then
			print("截图位置: " .. slot0.screenshot)
			slot0:Show(slot2)
		else
			slot0.TipsMgr:GetInstance():ShowTips("截图失败")
		end
	end

	setParent(slot8, slot0.tr, false)
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
	onButton(nil, slot0.panel:Find("main/btnBack"), slot2)
	onButton(nil, slot0.panel:Find("main/buttons/weibo"), function ()
		WBManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				slot0.TipsMgr:GetInstance():ShowTips("分享成功")
			end

			return
		end)
		slot1.screenshot()

		return
	end)
	onButton(nil, slot0.panel:Find("main/buttons/weixin"), function ()
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
