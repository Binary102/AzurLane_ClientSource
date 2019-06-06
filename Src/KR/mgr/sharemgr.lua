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

function pg.ShareMgr.Init(slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		slot0.go = slot0

		slot0.go:SetActive(false)

		slot0.tr = slot0.transform
		slot0.panelBlack = slot0.tr:Find("panel")
		slot0.panelPink = slot0.tr:Find("panel_pink")
		slot0.decks = {
			slot0.tr:Find("deck"),
			slot0.tr:Find("deck_right"),
			slot0.tr:Find("deck_blue")
		}

		setActive(slot0.panelBlack, false)
		setActive(slot0.panelPink, false)

		for slot4, slot5 in pairs(slot0.decks) do
			setActive(slot5, false)
		end
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

function pg.ShareMgr.Share(slot0, slot1, slot2)
	if not WBManager.IsSupportShare() then
		slot0.TipsMgr.GetInstance():ShowTips(i18n("non_support_share"))

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

	if not getProxy(UserProxy):getRawData() or not slot5.server then
		slot7 = 0
	end

	slot6 = slot6[slot7]

	if not slot4 or not slot4.name then
		slot7 = ""
	end

	if not slot6 or not slot6.name then
		slot8 = ""
	end

	slot9 = slot0.decks
	slot10 = slot3.deck or 1

	SetActive(slot0.decks, true)
	setText(slot0.decks[slot10].Find(slot0.decks, "name"), slot7)
	setText(slot0.decks[slot10].Find(slot0.decks, "server"), i18n("server_name") .. slot8)
	setText(slot0.decks[slot10].Find(slot9, "lv"), slot4.level)

	slot0.decks[slot10].anchoredPosition3D = Vector3(slot3.qrcode_location[1], slot3.qrcode_location[2], -100)
	slot0.decks[slot10].anchoredPosition = Vector2(slot3.qrcode_location[1], slot3.qrcode_location[2])

	setParent(slot9, slot11, false)
	slot0.decks[slot10].SetAsLastSibling(slot9)
	_.each(slot3.hidden_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then
			table.insert(slot0.cacheComps, slot1)
			slot1:SetActive(false)
		end

		return
	end)
	_.each(slot3.show_comps, function (slot0)
		print("showpath:" .. slot0)

		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then
			print("showpath111:" .. slot0)
			table.insert(slot0.cacheShowComps, slot1)
			slot1:SetActive(true)
		end

		return
	end)
	_.each(slot3.move_comps, function (slot0)
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

	slot14 = nil
	slot10 = 1
	slot14 = ScreenShooter.New(math.floor(Screen.height * slot12), Screen.height, TextureFormat.ARGB32)

	if ScreenShooter.New(math.floor(Screen.height * slot12), Screen.height, TextureFormat.ARGB32) then
		slot14 = ScreenShooter.New(Screen.width, math.floor(Screen.width / slot12), TextureFormat.ARGB32)
	end

	if (1.7777777777777777 >= Screen.width / Screen.height or ScreenShooter.New(math.floor(Screen.height * slot12), Screen.height, TextureFormat.ARGB32)) and ScreenShooter.New(Screen.width, math.floor(Screen.width / slot12), TextureFormat.ARGB32):Take(slot10, slot0.screenshot) then
		print("截图位置: " .. slot0.screenshot)
		slot0:Show(slot3)
	else
		slot0.TipsMgr:GetInstance():ShowTips(i18n("shoot_screen_fail"))
	end

	setParent(slot9, slot0.tr, false)
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
	slot0.DelegateInfo.New(slot0)
	onButton(slot0, slot0.panel:Find("main/top/btnBack"), slot2)
	onButton(slot0, slot0.panel:Find("main/buttons/weibo"), function ()
		WBManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				slot0.TipsMgr:GetInstance():ShowTips(i18n("share_success"))
			end

			return
		end)

		return
	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weixin"), function ()
		WXManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				slot0.TipsMgr:GetInstance():ShowTips(i18n("share_success"))
			else
				if slot1 == 99 then
					slot0.TipsMgr:GetInstance():ShowTips(i18n("not_install_app"))
				end
			end

			return
		end)
		slot1.screenshot()

		return
	end)
	onButton(nil, slot0.panel:Find("main/buttons/facebook"), function ()
		slot0.SDKMgr:GetInstance():shareImg(slot1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				slot0.TipsMgr:GetInstance():ShowTips(i18n("share_success"))
			end

			return
		end)
		slot1.screenshot()

		return
	end)

	return
end

return
