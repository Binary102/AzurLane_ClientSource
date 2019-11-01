slot0 = class("MusicFestivalScene", import("view.base.BaseUI"))

function slot0.getUIName(slot0)
	return "MusicFestivalUI"
end

function slot0.getBGM(slot0)
	return "azumaster-ins"
end

slot0.HUB_ID = 2

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0._closeBtn = slot0:findTF("top/back")
	slot0._helpBtn = slot0:findTF("top/help")
	slot0.btn_actskin = slot0.top:Find("idol_jump")
	slot0.btn_ins = slot0.top:Find("ins_jump")
	slot0._map = slot0:findTF("scrollRect/map")
	slot0.stage = slot0._map:Find("stage")
	slot0.screen = slot0._map:Find("screen")
	slot0.shop = slot0._map:Find("shop")
	slot0.painting = slot0._map:Find("painting")
	slot0.cube = slot0._map:Find("cube")
	slot0.foutain = slot0._map:Find("foutain")
	slot0.door = slot0._map:Find("door")
	slot0.bottom = slot0._map:Find("bottom")
	slot0.front = slot0._map:Find("front")
	slot0._shipTpl = slot0._map:Find("ship")
	slot0._xiefei = slot0._map:Find("model/xiefei")
	slot0._modeltip = slot0._xiefei:Find("tip")
	slot0._stageShip = slot0._map:Find("stageship")

	setActive(slot0._modeltip, false)

	slot0.graphPath = GraphPath.New(MusicFestivalGraph)
	slot0._loadingRequest = {}
	slot0._ReturnRequest = {}

	table.insert(slot0._loadingRequest, LoadPrefabRequestPackage.New("ui/" .. slot1, slot1, function (slot0)
		setParent(slot0, slot0._map)

		slot2 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(Canvas)).sortingOrder

		for slot7 = 0, slot0:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
			slot3[slot7].sortingOrder = slot2 + 1
		end
	end):Start())
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._closeBtn, function ()
		slot0:emit(slot1.ON_BACK)

		return
	end)
	onButton(slot0, slot0._helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.music_main.tip
		})

		return
	end)
	onButton(slot0, slot0.btn_actskin, function ()
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.MUSIC_CHUIXUE7DAY_ID
		})

		return
	end)
	onButton(slot0, slot0.btn_ins, function ()
		slot0:emit(MusicFestivalMediator.GO_SUBLAYER, Context.New({
			viewComponent = InstagramLayer,
			mediator = InstagramMediator,
			data = {
				id = ActivityConst.IDOL_INS_ID
			}
		}))

		return
	end)
	onButton(slot0, slot0._xiefei, function ()
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.MUSIC_FESTIVAL_ID
		})

		return
	end)
	slot0:InitFacility(slot0.stage, function ()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 6)

		return
	end)
	slot0:InitFacility(slot0.screen, function ()
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.IDOL_PT_ID
		})

		return
	end)
	slot0:InitFacility(slot0.shop, function ()
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.SHOP, {
			warp = ShopsLayer.TYPE_ACTIVITY
		})

		return
	end)
	slot0:InitFacility(slot0.painting, function ()
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.SKINSHOP)

		return
	end)
	slot0:InitFacility(slot0.cube, function ()
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.GETBOAT, {
			projectName = "new",
			page = 1
		})

		return
	end)
	slot0:InitFacility(slot0.foutain, function ()
		slot0:emit(MusicFestivalMediator.GO_SUBLAYER, Context.New({
			mediator = IdolMedalCollectionMediator,
			viewComponent = IdolMedalCollectionView,
			data = {},
			onRemoved = function ()
				setActive(slot0._tf, true)

				return
			end
		}), function ()
			setActive(slot0._tf, false)

			return
		end)

		return
	end)
	slot0:InitFacility(slot0.door, function ()
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()
		slot2 = slot0 and getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot0].on_activity)

		if not slot2 or slot2:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot1,
			mapIdx = slot0
		})

		return
	end)

	slot0.academyStudents = {}

	slot0:InitAreaTransFunc()
	slot0:updateStudents()
	slot0:updateStageShip()
	slot0:UpdateView()

	return
end

function slot0.UpdateView(slot0)
	slot3 = nil

	if getProxy(ActivityProxy).getActivityById(slot1, ActivityConst.MUSIC_FESTIVAL_ID) and not slot2:isEnd() then
		slot3 = slot2:readyToAchieve()
	end

	setActive(slot0._modeltip, slot3)
	setActive(slot0.btn_actskin:Find("tip"), slot1:getActivityById(ActivityConst.MUSIC_CHUIXUE7DAY_ID) and not slot5:isEnd() and slot5:readyToAchieve())
	setActive(slot0.btn_ins:Find("tip"), slot1:getActivityById(ActivityConst.IDOL_INS_ID) and not slot7:isEnd() and slot7:ShouldShowTip())
	setActive(slot8, slot1.getActivityById(ActivityConst.IDOL_INS_ID) and not slot7.isEnd() and slot7.ShouldShowTip())
	setActive(slot9, slot1.getActivityById(ActivityConst.IDOL_INS_ID) and not slot7.isEnd() and slot7.ShouldShowTip())
	setActive(slot0.stage:Find("tip"), getProxy(MiniGameProxy).GetHubByHubId(slot11, slot0.HUB_ID).count > 0)

	return
end

function slot0.InitFacility(slot0, slot1, slot2)
	onButton(slot0, slot1, slot2)
	onButton(slot0, slot1:Find("button"), slot2)

	return
end

function slot0.getStudents(slot0)
	slot1 = {}

	if not getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) then
		return slot1
	end

	if slot3:getConfig("config_client") and slot4.stage_off_ship then
		slot5 = 0
		slot6 = #Clone(slot4)

		while slot5 < 3 and slot6 > 0 do
			table.insert(slot1, slot4[math.random(1, slot6)])

			slot4[math.random(1, slot6)] = slot4[slot6]
			slot6 = slot6 - 1
			slot5 = slot5 + 1
		end
	end

	return slot1
end

function slot0.InitAreaTransFunc(slot0)
	slot0.edge2area = {
		1_2 = slot0.bottom,
		2_3 = slot0.bottom,
		3_4 = slot0.bottom
	}

	return
end

function slot0.updateStudents(slot0)
	for slot5, slot6 in pairs(slot1) do
		if not slot0.academyStudents[slot5] then
			cloneTplTo(slot0._shipTpl, slot0._map).gameObject.name = slot5
			slot8 = SummerFeastNavigationAgent.New(cloneTplTo(slot0._shipTpl, slot0._map).gameObject)

			slot8:attach()
			slot8:setPathFinder(slot0.graphPath)
			slot8:SetOnTransEdge(function (slot0, slot1, slot2)
				slot0._tf:SetParent(slot0.edge2area[slot1 .. "_" .. math.max(slot1, slot2)] or slot0.front)

				return
			end)
			slot8:updateStudent(slot6)

			slot0.academyStudents[slot5] = slot8
		end
	end

	if #slot1 > 0 then
		slot0.sortTimer = Timer.New(function ()
			slot0:sortStudents()

			return
		end, 0.2, -1)

		slot0.sortTimer:Start()
		slot0.sortTimer.func()
	end

	return
end

function slot0.getStageShip(slot0)
	if not getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) then
		return
	end

	if slot2:getConfig("config_client") and slot3.stage_on_ship then
		return slot4[math.random(1, slot5)], slot4.action[1]
	end

	return
end

function slot0.updateStageShip(slot0)
	slot1, slot2 = slot0:getStageShip()

	if slot1 then
		slot0._loadingRequest[slot1] = LoadSpineRequestPackage.New(slot1, function (slot0)
			slot0.transform.localScale = Vector3(0.5, 0.5, 1)
			slot0.transform.localPosition = Vector3.zero

			slot0.transform:SetParent(slot0._stageShip, false)
			slot0.transform:SetSiblingIndex(1)
			setActive(slot0._stageShip, true)

			slot1 = slot0:GetComponent(typeof(SpineAnimUI))

			slot1:SetAction(slot1, 0)

			slot0._loadingRequest[] = nil
			slot0._ReturnRequest[] = ReturnSpineRequestPackage.New(slot0._ReturnRequest, slot0)

			return
		end):Start()
	end

	return
end

function slot0.sortStudents(slot0)
	for slot5, slot6 in pairs(slot1) do
		if slot6.childCount > 1 then
			slot7 = {}

			for slot11 = 1, slot6.childCount, 1 do
				table.insert(slot7, {
					tf = slot6:GetChild(slot11 - 1),
					index = slot11
				})
			end

			table.sort(slot7, function (slot0, slot1)
				if math.abs(slot2) < 1 then
					return slot0.index < slot1.index
				else
					return slot2 > 0
				end

				return
			end)

			for slot11, slot12 in ipairs(slot7) do
				slot12.tf:SetSiblingIndex(slot11 - 1)
			end
		end
	end

	return
end

function slot0.clearStudents(slot0)
	if slot0.sortTimer then
		slot0.sortTimer:Stop()

		slot0.sortTimer = nil
	end

	for slot4, slot5 in pairs(slot0.academyStudents) do
		slot5:detach()
		Destroy(slot5._go)
	end

	slot0.academyStudents = {}

	return
end

function slot0.Clone2Full(slot0, slot1, slot2)
	slot3 = {}
	slot4 = slot1:GetChild(0)

	for slot9 = 0, slot1.childCount - 1, 1 do
		table.insert(slot3, slot1:GetChild(slot9))
	end

	for slot9 = slot5, slot2 - 1, 1 do
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
	end

	return slot3
end

function slot0.TryPlayStory(slot0)
	if "TIANHOUYUYI2" then
		pg.StoryMgr.GetInstance():Play(slot1)
	end

	return
end

function slot0.willExit(slot0)
	slot0:clearStudents()

	for slot4, slot5 in pairs(slot0._loadingRequest) do
		slot5:Stop()
	end

	table.clear(slot0._loadingRequest)

	for slot4, slot5 in pairs(slot0._ReturnRequest) do
		slot5()
	end

	table.clear(slot0._ReturnRequest)

	return
end

return slot0
