slot0 = class("BackYardView")
slot1 = require("Mod/BackYard/view/BackYardTool")
slot2 = require("Framework.notify.event")

function slot0.emit(slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

function slot0.Ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.event = slot0.New()
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.mode = slot2
	slot0.bgm = slot4

	pg.DelegateInfo.New(slot0)

	slot0.backyardPoolMgr = slot3
end

function slot0.setHouse(slot0, slot1)
	slot0.houseVO = slot1
	slot0.furnitureVOs = slot0.houseVO.furnitures
	slot0.boatVOs = slot0.houseVO.ships
	slot0.wallPaperVO = slot0.houseVO.wallPaper
	slot0.floorPaperVO = slot0.houseVO.floorPaper
end

function slot0.updateExtendItemVO(slot0, slot1)
	slot0.itemVO = slot1:getItemById(ITEM_BACKYARD_AREA_EXTEND) or Item.New({
		count = 0,
		id = ITEM_BACKYARD_AREA_EXTEND
	})
end

function slot0.init(slot0)
	slot0.furnitureModals = {}
	slot0.furnItem = {}
	slot0.shipModels = {}
	slot0.furnBottomGrids = {}
	slot0._attachmentList = {}
	slot0.floorContain = slot0:findTF("bg/furContain/floor")
	slot0.floorGrid = slot0:findTF("bg/floorGrid")
	slot0.furnitureTpl = slot0:findTF("resources/furnituretpl")
	slot0.furContain = slot0:findTF("bg/furContain")
	slot0.wallContain = slot0:findTF("bg/furContain/wall")
	slot0.carpetContain = slot0:findTF("bg/furContain/carpet")
	slot0.decorationBtn = slot0:findTF("decorateBtn")
	slot0.warn = slot0:findTF("bg/warn")
	slot0.backBtn = findTF(slot0._tf, "back")
	slot0.mainTFCG = findTF(slot0._tf.parent, "main"):GetComponent(typeof(CanvasGroup))
	slot0.eyeBtn = findTF(slot0._tf.parent, "main/eye_btn")
	slot0.msgBoxPanel = slot0:findTF("msg_box")
	slot0.warnCG = slot0.warn:GetComponent("CanvasGroup")
	slot0.zoom = slot0:findTF("bg"):GetComponent("Zoom")
	slot0.loadingCount = 0
	slot0.loadingTotal = 0
	slot0.wallPaperModel = BackYardPaperModel.New(slot0:findTF("bg/wall"), Furniture.TYPE_WALLPAPER)
	slot0.floorPaperModel = BackYardPaperModel.New(slot0:findTF("bg/floor"), Furniture.TYPE_FLOORPAPER)

	slot0:didEnter()
	slot0:setMode()
end

function slot0.enableZoom(slot0, slot1)
	slot0.zoom.enabled = slot1
end

function slot0.setMode(slot0)
	setActive(slot0.decorationBtn, not (slot0.mode == BackYardConst.MODE_VISIT))

	slot0:findTF("bg"):GetComponent(typeof(CanvasGroup)).blocksRaycasts = not (slot0.mode == BackYardConst.MODE_VISIT)
end

function slot0.getProgress(slot0)
	if not slot0.loadingCount or not slot0.loadingTotal then
		return 0
	else
		return (slot0.loadingCount == slot0.loadingTotal and 1) or slot0.loadingCount / slot0.loadingTotal
	end
end

function slot0.stopAllBoatMove(slot0, slot1)
	pg.UIMgr:GetInstance():LoadingOn()

	slot2 = {}

	table.sort(slot3, function (slot0, slot1)
		return ((slot0.boatVO:hasSpineInterAction() and 1) or 0) > ((slot1.boatVO:hasSpineInterAction() and 1) or 0)
	end)

	for slot7, slot8 in pairs(slot3) do
		table.insert(slot2, function (slot0)
			if not slot0.boatVO:hasSpineInterAction() then
				slot1:emit(BackyardMainMediator.CANCEL_SHIP_MOVE, slot0.boatVO.id)
				slot0:removeItem()
				slot0:updateShadowTF(false)

				if not slot0.boatVO:hasInterActionFurnitrue() then
					slot0.tf:SetAsLastSibling()
				end

				slot0()
			elseif slot1.furnitureVOs[slot0.boatVO:getSpineId()]:isLoopSpineInterAction() then
				slot0()
			else
				slot0:breakSpineAnim(slot0)
			end
		end)
	end

	seriesAsync(slot2, function ()
		pg.UIMgr:GetInstance():LoadingOff()

		if pg.UIMgr.GetInstance().LoadingOff then
			slot0()
		end
	end)
end

function slot0.enableDecorateMode(slot0, slot1)
	slot0.decorateMode = slot1

	setActive(slot0.backBtn, slot1)
	SetActive(slot0.floorGrid, slot1)
	setActive(slot0.eyeBtn, not slot1)

	slot2 = pairs
	slot3 = slot0.shipModels or {}

	for slot5, slot6 in slot2(slot3) do
		if not IsNil(slot6.go) then
			slot6.canvasGroup.alpha = (not slot1 and 1) or 0
			slot6.canvasGroup.blocksRaycasts = not slot1

			slot6:updateShadowTF(not slot1)
		end
	end

	slot0.warnCG.blocksRaycasts = not slot1
	slot0.mainTFCG.blocksRaycasts = not slot1
	Input.multiTouchEnabled = not slot1
	slot2 = pairs
	slot3 = slot0.furnitureModals or {}

	for slot5, slot6 in slot2(slot3) do
		if not slot0.furnitureVOs[slot5]:canBeTouch() then
			slot6:Find("icon"):GetComponent(typeof(Image)).raycastTarget = slot1
		end
	end

	if not slot1 then
		slot0:closePreFurnSelected()
		slot0:emit(BackyardMainMediator.BOAT_POSITION_RESET)
		slot0:emit(BackyardMainMediator.CLOSE_GARNITURE)
		slot0.map.afterSortFunc(slot0.map.sortedItems)
	end
end

function slot0.didEnter(slot0)
	slot0:initHouse()
	onButton(slot0, slot0.floorGrid, function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
	end, SFX_PANEL)
	onButton(slot0, slot0.decorationBtn, function ()
		if slot0.inInitFurnitrues then
			pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_is_loading"))

			return
		end

		if slot0.blockEvent then
			return
		end

		slot0:stopAllBoatMove(function ()
			slot0:emit(BackyardMainMediator.OPEN_DECORATION)
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.warn, function ()
		if slot0.isDraging then
			return
		end

		triggerButton(slot0.baseBG)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.isDraging then
			return
		end

		if slot0.houseVO:hasChangeFurnitures() then
			slot0:closePreFurnSelected()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("backyard_backyardScene_quest_saveFurniture"),
				onYes = function ()
					slot0:save()
				end,
				yesSound = SFX_FURNITRUE_SAVE,
				onNo = function ()
					slot0:emit(BackyardMainMediator.RESTORE_FURNITURES)
				end
			})
		else
			slot0:enableDecorateMode(false)
		end
	end, SFX_CANCEL)
end

function slot0.save(slot0)
	if slot0.houseVO:hasChangeFurnitures() then
		slot0:emit(BackyardMainMediator.SAVE_FURNITURE)
	else
		slot0:enableDecorateMode(false)
	end
end

function slot0.exitBoat(slot0, slot1)
	slot0.shipModels[slot1.id].dispose(slot2)
	PoolMgr.GetInstance():ReturnSpineChar(slot3, slot0.shipModels[slot1.id].go)

	slot0.shipModels[slot1.id] = nil
	slot0.boatVOs[slot1.id] = nil
end

function slot0.initHouse(slot0)
	slot0.maps = {}
	slot0.map = slot0:createMap(slot0.houseVO.endX + 1, slot0.houseVO.endY + 1)

	slot0:loadWallPaper(slot0.wallPaperVO, Furniture.TYPE_WALLPAPER)
	slot0:loadWallPaper(slot0.floorPaperVO, Furniture.TYPE_FLOORPAPER)
	slot0:initFurnitures()
	slot0:updateHouseArea(slot0.houseVO.level)
end

function slot0.updateHouseArea(slot0, slot1)
	slot2 = LoadAndInstantiateSync("dormbase", "state" .. slot1)

	if not IsNil(slot0.baseBG) then
		Destroy(slot0.baseBG)
	end

	slot0.baseBG = tf(slot2)

	slot0.baseBG:SetParent(slot0:findTF("bg"), false)
	slot0.baseBG:SetSiblingIndex(0)

	slot0:findTF("bg").sizeDelta = Vector2(slot0.baseBG.rect.width + 50, slot0.baseBG.rect.height + 60 * slot0.houseVO.level)

	scrollTo(slot0._tf, 0.5, 0.5)

	if slot1 <= 0 or slot1 > 3 then
		SetActive(slot0.warn, false)

		return
	end

	slot0.warn.localPosition = BackYardConst.level2WarnPos(slot1)

	onButton(slot0, slot0.baseBG, function ()
		slot3 = pg.item_data_statistics[id2ItemId(pg.shop_template[slot0.houseVO:getExpandId()].resource_type)].name

		function slot4()
			if slot0.itemVO.count <= 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("backyard_buyExtendItem_question", slot1.resource_num .. ),
					onYes = function ()
						slot0:emit(BackyardMainMediator.BUY_EXTEND_BACKYARD_ITEM, slot0, 1)
						slot0.emit:closeMsgBox()
					end
				})
			else
				slot0:emit(BackyardMainMediator.EXTEND_BACKYARD_AREA)
				slot0.emit:closeMsgBox()
			end
		end

		slot6 = {}

		for slot10, slot11 in ipairs(string.split(slot5, "||")) do
			slot6["text" .. slot10] = slot11
		end

		slot0:showMsgBox(slot4, slot6)
	end, SFX_PANEL)
end

function slot0.updateItemCount(slot0, slot1)
	setText(slot0:findTF("frame/tip_2/value_bg/Text", slot0.msgBoxPanel), (tonumber(slot1) <= 0 and setColorStr(slot1, COLOR_RED)) or setColorStr(slot1, COLOR_GREEN))
end

function slot0.showMsgBox(slot0, slot1, slot2)
	slot0.isOpenMsgBox = true

	setActive(slot0.msgBoxPanel, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.msgBoxPanel)
	setText(slot0:findTF("frame/tip_1/text_1", slot0.msgBoxPanel), slot2.text1)
	setText(slot0:findTF("frame/tip_1/value_bg/Text", slot0.msgBoxPanel), setColorStr(slot2.text2, COLOR_GREEN))
	setText(slot0:findTF("frame/tip_1/text_2", slot0.msgBoxPanel), slot2.text3)
	setText(slot0:findTF("frame/tip_2/text_1", slot0.msgBoxPanel), slot2.text4)
	slot0:updateItemCount(slot2.text5)
	setText(slot0:findTF("frame/tip_2/text_2", slot0.msgBoxPanel), slot2.text6)
	updateDrop(findTF(slot0.msgBoxPanel, "frame"), slot3)
	onButton(slot0, slot0:findTF("frame/ok_btn", slot0.msgBoxPanel), function ()
		if slot0 then
			slot0()
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("frame/cancel_btn", slot0.msgBoxPanel), function ()
		slot0:closeMsgBox()
	end, SFX_CANCEL)
	onButton(slot0, slot0.msgBoxPanel, function ()
		slot0:closeMsgBox()
	end, SFX_CANCEL)
end

function slot0.closeMsgBox(slot0)
	if slot0.isOpenMsgBox then
		slot0.isOpenMsgBox = nil

		setActive(slot0.msgBoxPanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.msgBoxPanel, slot0._tf)
	end
end

function slot0.createMap(slot0, slot1, slot2)
	slot3 = pg.IsometricMap.New(slot1, slot2)

	slot3:SetAfterFunc(function (slot0)
		slot1 = 0

		for slot5, slot6 in ipairs(slot0) do
			if not slot6.ob.isBoat then
				slot0.furnitureModals[slot6.ob.id]:SetSiblingIndex(slot1)
			end

			slot1 = slot1 + 1
		end

		slot0:sortBoat()
	end)

	return slot3
end

function slot0.sortBoat(slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot0.boatVOs[slot4]:getPosition() and not slot0.boatVOs[slot4]:hasInterActionFurnitrue() and not slot0.boatVOs[slot4]:hasSpineInterAction() then
			slot5:removeItem()
			slot5:createItem(slot6)
		end
	end
end

function slot0.getMap(slot0, slot1)
	if slot1.parent ~= 0 and slot0.maps[slot1.parent] then
		return slot0.maps[slot1.parent]
	elseif slot1.parent ~= 0 and not slot0.maps[slot1.parent] then
		slot8, slot9 = slot0.furnitureVOs[slot1.parent]:getMapSize()
		slot0.maps[slot1.parent] = slot0:createMap(slot2, slot3)

		return slot0.maps[slot1.parent]
	else
		return slot0.map
	end
end

function slot0.createItem(slot0, slot1, slot2, slot3)
	if not slot1:isMapItem() then
		return
	end

	slot4 = slot0:getMap(slot1)
	slot9, slot10 = slot1:getSize()

	slot4:PlaceItem(slot2 + 1, slot3 + 1, slot4:CreateItem(slot5, slot6, {
		isBoat = false,
		id = slot1.id
	}))

	slot0.furnItem[slot1.id] = slot4.CreateItem(slot5, slot6, )
end

function slot0.removeItem(slot0, slot1)
	if not slot1:isMapItem() then
		return
	end

	if not slot0.furnItem[slot1.id] then
		return
	end

	if not slot1:hasParent() then
		if slot0.map then
			slot0.map:RemoveItem(slot2)
		end
	elseif slot0.maps[slot1.parent] then
		slot0.maps[slot1.parent]:RemoveItem(slot2)
	end

	slot0.furnItem[slot1.id] = nil
end

function slot0.initFurnitures(slot0)
	function slot1(slot0, slot1)
		slot0:loadFurnitureModel(slot0, function (slot0)
			if not slot0 then
				slot0()

				return
			end

			LeanTween.scale(rtf(slot0), Vector3(slot0.localScale.x + 0.2, slot0.localScale.y + 0.2, 1), 0.2):setFrom(0):setOnComplete(System.Action(function ()
				LeanTween.scale(rtf(slot0), Vector3(slot1, Vector3, 1), 0.1):setOnComplete(System.Action(0.1))
			end))
		end)
	end

	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}
	slot8 = {}
	slot9 = {}

	for slot13, slot14 in pairs(slot0.furnitureVOs) do
		if slot14:hasParent() and slot14:hasChild() then
			table.insert(slot4, slot14)
		elseif slot14:hasParent() then
			table.insert(slot5, slot14)
		elseif slot14:isStageFurniture() then
			table.insert(slot2, slot14)
		else
			table.insert(slot3, slot14)
		end
	end

	for slot13, slot14 in ipairs(slot2) do
		table.insert(slot6, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	for slot13, slot14 in ipairs(slot3) do
		table.insert(slot7, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	for slot13, slot14 in ipairs(slot4) do
		table.insert(slot8, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	for slot13, slot14 in ipairs(slot5) do
		table.insert(slot9, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	slot10 = {}

	for slot14, slot15 in pairs(slot0.boatVOs) do
		table.insert(slot10, function (slot0)
			onNextTick(function ()
				slot0:loadBoatModal(slot0, )
			end)
		end)
	end

	slot0.inInitFurnitrues = true

	seriesAsync({
		function (slot0)
			parallelAsync(slot0, slot0)
		end,
		function (slot0)
			parallelAsync(slot0, slot0)
		end,
		function (slot0)
			parallelAsync(slot0, slot0)
		end,
		function (slot0)
			seriesAsync(slot0, slot0)
		end,
		function (slot0)
			seriesAsync(slot0, slot0)
		end
	}, function ()
		slot0.inInitFurnitrues = nil

		slot0:sortWallFurns()
		slot0.sortWallFurns:sortAllMat()
	end)
end

function slot0.loadWallPaper(slot0, slot1, slot2)
	if slot2 == Furniture.TYPE_WALLPAPER then
		slot0.wallPaperModel:update(slot1, slot0.houseVO.level)
	elseif slot2 == Furniture.TYPE_FLOORPAPER then
		slot0.floorPaperModel:update(slot1, slot0.houseVO.level)
	end
end

function slot0.loadFurnitureModel(slot0, slot1, slot2)
	if not slot0.backyardPoolMgr then
		if slot2 then
			slot2()
		end

		return
	end

	slot4 = slot0.backyardPoolMgr:Dequeue(slot0.backyardPoolMgr.POOL_NAME.FURNITURE)

	setActive(slot4, false)
	SetParent(slot4, slot0.furContain)

	slot4.gameObject.name = slot1.id

	setActive(slot5, false)
	SetActive(slot0:findTF("rotation", slot4:Find("drag")), slot1:isFloor() and slot1:canRotate())

	slot0.furnitureModals[slot1.id] = slot4
	slot6 = slot1:getPosition()

	function slot7(slot0)
		if not slot0 then
			if slot0 then
				slot0()
			end

			return
		end

		slot1 = slot1:Find("icon")
		slot1.sizeDelta = Vector2(slot0.rect.width, slot0.rect.height)

		SetParent(slot1, slot1)

		slot2 = SetParent.getSign
		slot3 = slot1.dir == 2
		slot1.localScale = Vector3(SetParent.getSign, 1, 1)

		Vector3(SetParent.getSign, 1, 1):setWallModalDir(Vector3(SetParent.getSign, 1, 1).setWallModalDir, )
		Vector3(SetParent.getSign, 1, 1):updateFurnitruePos(Vector3(SetParent.getSign, 1, 1).updateFurnitruePos, true)

		true.anchoredPosition3D = Vector3(0, 0, 0)

		Vector3(0, 0, 0):registerFurnitureEvent(Vector3(0, 0, 0).registerFurnitureEvent)

		slot3 = false

		if false then
			slot3 = true
		end

		if slot4.decorateMode then
			if not IsNil(slot4.curFurnModal) then
				slot4:closePreFurnSelected()
			end

			triggerButton(slot1)
		end

		setActive(slot1, true)

		if slot0 then
			slot0(slot1)
		end

		return
	end

	if not slot1:isSpine() then
		slot0:loadImageFurniture(slot1, slot7)
	else
		slot0:loadSpineFurnitureModel(slot1, slot7)
	end
end

function slot0.loadImageFurniture(slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]

	GetSpriteFromAtlasAsync("furniture/" .. slot1:getConfig("picture"), "", function (slot0)
		if IsNil(slot0._tf) then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.pivot = getSpritePivot(slot0)
		slot1 = slot3.createImage("icon", true, , 1)

		slot1:AddComponent(typeof(AlphaCheck))
		setImageSprite(slot1, slot0, true)

		if slot4:hasInterActionMask() then
			slot0:loadFurnituresMasks(slot4, function ()
				slot0(slot1)

				return
			end)
		else
			if slot4:isArch() then
				slot0:loadArchMask(slot4, function ()
					slot0(slot1)

					return
				end)
			else
				slot1(slot0)
			end
		end

		return
	end)

	return
end

function slot0.loadArchMask(slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]

	ResourceMgr.Inst:getAssetAsync("furniture/" .. slot4, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		setActive(slot1, false)
		setImageSprite(slot0.createImage(BackYardConst.ARCH_MASK_NAME, false, slot0.createImage, 2, true), slot0, true)

		if setImageSprite then
			slot2()
		end

		return
	end), true, true)

	return
end

function slot0.loadFurnituresMasks(slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		table.insert(slot5, function (slot0)
			ResourceMgr.Inst:getAssetAsync("furniture/" .. slot0, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
				setActive(slot1, false)
				setImageSprite(slot0.createImage(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot1, false, , 2, true), slot0, true)
				slot0.createImage(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot1, false, , 2, true)()

				return
			end), true, true)

			return
		end)
	end

	seriesAsync(slot5, function ()
		if slot0 then
			slot0()
		end

		return
	end)

	return
end

function slot0.loadSpineFurnitureModel(slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]
	slot8, slot5 = slot1:getSpineName()

	LoadAndInstantiateAsync("sfurniture", slot4, function (slot0)
		if IsNil(slot0._tf) then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.pivot = rtf(slot0).pivot

		slot3(slot1, "icon", 1, function (slot0, slot1, slot2, slot3)
			slot0.gameObject.name = slot1
			slot0.anchorMax = Vector2(slot0.x, slot0.y)
			slot0.anchorMin = Vector2(slot0.x, slot0.y)

			SetParent(slot0.gameObject, slot1)

			slot0.localPosition = Vector3(0, 0, 0)

			slot0:SetSiblingIndex(slot2)

			if slot3 then
				GetOrAddComponent(slot4, "SpineAnimUI"):SetAction(slot3, 0)
			end

			return
		end)

		if slot3:hasSpineMask() then
			slot8, slot5 = slot4:getSpineMaskName()

			LoadAndInstantiateAsync("sfurniture", slot4, function (slot0)
				setActive(slot0, false)
				slot0(rtf(slot0), BackYardConst.FURNITRUE_MASK_NAME, 2)
				slot0:loadSpineAnimator(slot0, function ()
					slot0(slot1)

					return
				end)

				return
			end, true, true)
		else
			slot0:loadSpineAnimator(slot0.loadSpineAnimator, function ()
				slot0(slot1)

				return
			end)
		end

		return
	end, true, true)

	return
end

function slot0.loadSpineAnimator(slot0, slot1, slot2)
	if slot1:hasAnimator() then
		slot3 = {}
		slot5 = slot0.furnitureModals[slot1.id]

		for slot9 = 1, slot1:getSpineMaxCnt(), 1 do
			for slot14, slot15 in ipairs(slot10) do
				table.insert(slot3, function (slot0)
					LoadAndInstantiateAsync("sfurniture", slot0, function (slot0)
						go(slot0).name = slot0:getAnimtorControlGoName(slot1 - 1, slot0)

						setActive(slot0, false)
						SetParent(slot0, )
						slot0()

						return
					end)

					return
				end)
			end
		end

		parallelAsync(slot3, function ()
			if slot0 then
				slot0()
			end

			return
		end)

		return
	end

	if slot2 then
		slot2()
	end
end

function slot0.registerFurnitureEvent(slot0, slot1)
	slot3 = slot0.furnitureModals[slot1.id].Find(slot2, "drag")
	slot4 = slot0.furnitureModals[slot1.id].Find(slot2, "icon")
	slot5 = slot0:findTF("grids", slot0.furnitureModals[slot1.id])

	if not slot1:canBeTouch() then
		slot6 = slot0.decorateMode
	end

	slot4:GetComponent(typeof(Image)).raycastTarget = slot6
	slot7 = {
		false
	}

	onButton(slot0, slot4, function ()
		if slot0.decorateMode then
			if slot0.isDraging then
				return
			end

			if not LeanTween.isTweening(go(go)) then
				LeanTween.scale(LeanTween.scale, Vector3(slot1.localScale.x - 0.05, slot1.localScale.y - 0.05, slot1.localScale.z - 0.05), 0.01):setOnComplete(System.Action(function ()
					LeanTween.scale(LeanTween.scale, , 0.1)

					return
				end))
			end

			slot0:closePreFurnSelected()

			slot0.closePreFurnSelected.preFurnSelected = slot2
			slot0.closePreFurnSelected.curFurnModal = slot2

			SetActive(slot2, true)
			SetActive(slot3, true)
			SetActive:setPreSelectedParent(slot0.furContain)

			SetActive.setPreSelectedParent.preFurnSelected.localScale = Vector3(1, 1, 1)
		else
			if slot4:isShowDesc() then
				slot0:showFurnitrueDesc(slot4)
			else
				if slot4:isTouchSpine() then
					slot0:playTouchSpineAnim(slot4, slot5)
				end
			end
		end

		return
	end, SFX_PANEL)

	slot8 = GetOrAddComponent(slot3, "EventTriggerListener")
	slot0.dragTrigger = slot8

	slot8:AddBeginDragFunc(function ()
		slot0:furnitureBeginDrag(slot0)
		slot0.furnitureBeginDrag:enableZoom(false)

		return
	end)
	slot8:AddDragFunc(function (slot0, slot1)
		slot1:furnitureDrag(slot0.change2ScrPos(slot1.floorGrid, slot1.position), )

		return
	end)
	slot8:AddDragEndFunc(function (slot0, slot1)
		slot0:enableZoom(true)
		slot0:furnitureEndDrag(slot1.getMapPos(slot2), slot1.change2ScrPos(slot0.floorGrid, slot1.position))

		return
	end)
	onButton(slot0, slot0:findTF("ok", slot3), function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()

		return
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("cancel", slot3), function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
		slot0.closePreFurnSelected:emit(BackyardMainMediator.REMOVE_FURNITURE, slot1.id)

		return
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("rotation", slot3), function ()
		if slot0.isDraging then
			return
		end

		slot0.rotateId = slot1.id

		slot0:emit(BackyardMainMediator.FURNITURE_DIR_CHANGE, slot1.id)

		return
	end, SFX_PANEL)

	return
end

function slot0.playTouchSpineAnim(slot0, slot1, slot2)
	slot4 = GetOrAddComponent(slot0.furnitureModals[slot1.id].Find(slot3, "icon/spine"), typeof(SpineAnimUI))
	slot5, slot6 = slot1:getTouchSpineConfig()

	if not slot6 and slot2[1] then
		return
	end

	if slot2[1] and slot6 then
		slot4:SetAction("normal", 0)

		if slot1:isMoveable() then
			slot0:emit(BackyardMainMediator.ON_REMOVE_MOVE_FURNITURE, slot1.id)
		end

		slot2[1] = false

		return
	end

	slot4:SetActionCallBack(function (slot0)
		if slot0 == "finish" and not slot0 then
			slot1:SetAction("normal", 0)

			if slot1:isMoveable() then
				slot3:emit(BackyardMainMediator.ON_REMOVE_MOVE_FURNITURE, slot2.id)
			end

			slot1:SetActionCallBack(nil)

			slot4[1] = false
		end

		return
	end)

	if slot5 then
		slot4:SetAction(slot5, 0)

		slot2[1] = true

		if slot1:isMoveable() then
			slot0:emit(BackyardMainMediator.ON_ADD_MOVE_FURNITURE, slot1.id)
		end
	end

	return
end

function slot0.createbottomGrid(slot0, slot1, slot2)
	slot4 = slot0.furnitureModals[slot1.id].Find(slot3, "grids")
	slot5 = {}
	slot6 = slot1:isFloor()

	for slot11, slot12 in ipairs(slot7) do
		slot13 = slot0:getGridTpl(slot6)

		SetParent(slot13, slot0.furContain)

		slot5[slot11] = slot13
		slot13.localPosition = slot0.getLocalPos(slot12)

		if not slot6 and BackyardFurnitureVO.isRightWall(slot2) then
			slot13.localScale = Vector3(1, 1, 1)
		end

		slot13:SetParent(slot4, true)
	end

	slot0.furnBottomGrids[slot1.id] = slot5

	return
end

function slot0.showFurnitrueDesc(slot0, slot1)
	if slot0.isOpenDesc then
		return
	end

	slot0.isOpenDesc = true

	if not slot0.isInitOpenDesc then
		slot0.isInitOpenDesc = true
		slot0.descPanel = findTF(slot0._tf, "desc_panel")
		slot0.miniPanel = findTF(slot0.descPanel, "mini")
		slot0.maxFrame = findTF(slot0.descPanel, "max_panel")
		slot0.maxPanel = findTF(slot0.maxFrame, "max")
		slot0.maxIcon = findTF(slot0.maxPanel, "desc/iconframe/icon"):GetComponent(typeof(Image))
		slot0.maxName = findTF(slot0.maxPanel, "desc/Text"):GetComponent(typeof(Text))
		slot0.maxType = findTF(slot0.maxPanel, "desc/container/frame/type"):GetComponent(typeof(Text))
		slot0.maxContent = findTF(slot0.maxPanel, "desc/container/frame/content"):GetComponent(typeof(Text))
		slot0.maxComfortable = findTF(slot0.maxPanel, "desc/container/frame/comfortable_container/Text"):GetComponent(typeof(Text))
		slot0.maxApproach = findTF(slot0.maxPanel, "desc/container/frame/approach_container/Text"):GetComponent(typeof(Text))
		slot0.maxdate = findTF(slot0.maxPanel, "desc/container/frame/date_container/Text"):GetComponent(typeof(Text))
		slot0.miniIcon = findTF(slot0.miniPanel, "bg1/frame/icon"):GetComponent(typeof(Image))
		slot0.miniName = findTF(slot0.miniPanel, "name_container/Text"):GetComponent(typeof(Text))
		slot0.descPanelParent = slot0.descPanel.parent
		slot0.descPanelVoiceBtn = findTF(slot0.maxPanel, "desc/container/frame/voice")

		onButton(slot0, slot0.descPanel, function ()
			slot0:closeFurnitrueDesc()

			return
		end, SFX_PANEL)
		onButton(slot0, slot0.maxFrame, function ()
			slot0:closeFurnitrueDesc()

			return
		end, SFX_PANEL)
		onButton(slot0, slot0.maxPanel:Find("ok_btn"), function ()
			slot0:closeFurnitrueDesc()

			return
		end, SFX_PANEL)
	end

	setActive(slot0.descPanelVoiceBtn, slot1:existVoice())
	setActive(slot0.descPanel, true)
	setActive(slot0.miniPanel, false)
	SetActive(slot0.maxFrame, false)

	if slot1:existVoice() then
		onButton(slot0, slot0.descPanelVoiceBtn, function ()
			slot0:playFurnitureVoice(slot0)

			return
		end, SFX_PANEL)
	end

	slot3 = nil

	LoadSpriteAsync("FurnitureIcon/" .. slot1:getConfig("icon"), function (slot0)
		slot0.miniIcon.sprite = slot0

		return
	end)

	slot0.miniName.text = shortenString(slot1:getConfig("name"), 6)
	slot0.miniPanel.position = slot0.furnitureModals[slot1.id].Find(slot4, "icon").position

	function ()
		setActive(slot0.miniPanel, false)
		setActive(slot0.maxFrame, true)

		if slot0.maxFrame then
			slot0.maxIcon.sprite = slot1
		else
			LoadSpriteAsync("FurnitureIcon/" .. slot2:getConfig("icon"), function (slot0)
				slot0.maxIcon.sprite = slot0

				return
			end)
		end

		slot0.maxName.text = shortenString(slot2:getConfig("name"), 6)
		slot0.maxName.maxdate.text = slot2.getConfig("name"):getDate()
		slot0.maxName.maxdate.maxComfortable.text = "+" .. slot2.getConfig("name"):getConfig("comfortable")
		slot0.maxName.maxdate.maxComfortable.maxContent.text = slot2.getConfig("name").getConfig("comfortable"):getConfig("describe")
		slot0.maxName.maxdate.maxComfortable.maxContent.maxApproach.text = slot2.getConfig("name").getConfig("comfortable"):getGainby()
		slot0.maxName.maxdate.maxComfortable.maxContent.maxApproach.maxType.text = slot2.getConfig("name").getConfig("comfortable"):getChineseType()

		pg.UIMgr.GetInstance():BlurPanel(slot0.maxFrame)

		return
	end()

	return
end

function slot0.playFurnitureVoice(slot0, slot1)
	slot2 = slot1:getVoice()

	function slot3()
		slot0:stopCV()

		slot0.stopCV.currVoice = playSoundEffect(playSoundEffect)

		return
	end

	if slot0.loadedBank then
		slot3()
	else
		pg.CriMgr:GetInstance():LoadCV("furniture", function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot2()

				if slot2.currVoice then
					slot1.loadedBank = slot0
				end
			end

			return
		end)
	end

	return
end

function slot0.stopCV(slot0)
	if slot0.currVoice then
		slot0.currVoice:Stop(true)
	end

	slot0.currVoice = nil

	return
end

function slot0.closeFurnitrueDesc(slot0)
	if slot0.isOpenDesc then
		slot0:stopCV()

		slot0.isOpenDesc = nil

		setActive(slot0.descPanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.maxFrame, slot0.descPanel)
	end

	return
end

function slot0.updateFurnitruePos(slot0, slot1, slot2)
	slot0:setFurnitureParent(slot1)

	slot0.furnitureModals[slot1.id].localPosition = slot0.getLocalPos(slot1:getPosition())

	if slot2 then
		slot0:createbottomGrid(slot1, slot3)
	end

	if slot1.parent ~= 0 then
		slot9 = Vector2
		slot10 = slot4.localPosition.x

		if not slot0.furnitureVOs[slot1.parent].getConfig(slot6, "offset")[1] then
			slot11 = 0
		end

		slot10 = slot10 + slot11
		slot11 = slot7.y

		if not slot8[2] then
			slot12 = 0
		end

		slot4.localPosition = slot9(slot10, slot11 + slot12)

		slot4:SetParent(slot0.furnitureModals[slot5]:Find("childs"), true)

		if slot0.maps[slot5] then
			slot0.maps[slot5].afterSortFunc(slot0.maps[slot5].sortedItems)
		end
	end

	slot0:createItem(slot1, slot3.x, slot3.y)

	return
end

function slot0.updateFurnitureWithAnim(slot0, slot1, slot2, slot3)
	if slot2 == 0 then
		slot0:updateFurnitruePos(slot1)
	else
		function slot4(slot0, slot1)
			return slot0 - slot1.normalized * Vector2.Distance(slot1, slot0) * 0.5 + slot1
		end

		if LeanTween.isTweening(go(slot0.furnitureModals[slot1.id])) then
			LeanTween.cancel(go(slot5))
		end

		slot8 = slot4(slot5.localPosition, slot7)

		if slot1:isSpineCar() then
			if slot3.x < slot6.x then
				slot5.localScale = Vector3(-1, 1, 1)
			else
				if slot3.y < slot6.y then
					slot5.localScale = Vector3(1, 1, 1)
				else
					if (slot6.x >= slot3.x or slot6.y ~= slot3.y) and (slot3.y >= slot6.y or slot6.x ~= slot3.x) then
						slot9 = false
					else
						slot9 = true
					end

					if not slot9 or not Vector3(-1, 1, 1) then
						slot10 = Vector3(1, 1, 1)
					end

					slot5.localScale = slot10
				end
			end
		else
			if (slot6.x >= slot3.x or slot6.y ~= slot3.y) and (slot3.y >= slot6.y or slot6.x ~= slot3.x) then
				slot9 = false
			else
				slot9 = true
			end

			if not slot9 or not Vector3(-1, 1, 1) then
				slot10 = Vector3(1, 1, 1)
			end

			slot5.localScale = slot10
		end

		LeanTween.moveLocal(go(slot5), slot8, slot2 / 2):setOnComplete(System.Action(function ()
			slot0:removeItem(slot0)
			slot0.removeItem:createItem(slot0.removeItem, slot2.x, slot2.y)
			LeanTween.moveLocal(go(slot3), slot2.y, slot5 / 2)

			return
		end))
	end

	return
end

function slot0.removeFurn(slot0, slot1)
	slot2 = slot0.furnitureModals[slot1.id]

	function slot3(slot0)
		SetParent(slot0.shipModels[slot0].tf, slot0.floorContain)
		slot0.shipModels[slot0]:setAction("stand2")

		return
	end

	if slot1:hasInterActionShipId() then
		for slot8, slot9 in ipairs(slot4) do
			slot3(slot9)
			slot0.shipModels[slot9]:closeBodyMask()
		end
	end

	if slot1:getSpineId() then
		slot3(slot4)
		slot0.shipModels[slot1:getSpineId()]:clearSpine()
	end

	if slot1:hasStageShip() then
		slot5 = pairs

		if not slot1:getStageShip() then
			slot6 = {}
		end

		for slot8, slot9 in slot5(slot6) do
			slot3(slot9)
			slot0.shipModels[slot9]:clearStageInterAction()
		end
	end

	if slot1:hasSpineExtra() then
		for slot7, slot8 in pairs(slot1:getShipExtra()) do
			slot3(slot8)
		end
	end

	slot4 = slot0.furnBottomGrids[slot1.id]

	if not slot1:isFloor() or not slot0.backyardPoolMgr.POOL_NAME.GRID then
		slot5 = slot0.backyardPoolMgr.POOL_NAME.WALL
	end

	slot6 = pairs

	if not slot4 then
		slot7 = {}
	end

	for slot9, slot10 in slot6(slot7) do
		slot0.backyardPoolMgr:Enqueue(slot5, slot10)
	end

	slot0.furnBottomGrids[slot1.id] = nil

	slot0:clearFunriture(slot1)
	slot0.backyardPoolMgr:Enqueue(slot0.backyardPoolMgr.POOL_NAME.FURNITURE, slot2)

	slot0.curFurnModal = nil
	slot0.furnitureModals[slot1.id] = nil
	slot0.furnitureVOs[slot1.id] = nil

	if slot0.maps[slot1.id] then
		slot0.maps[slot1.id] = nil
	end

	return
end

function slot0.furnitureBeginDrag(slot0, slot1)
	if slot0.isDraging then
		return
	end

	slot0.isDraging = true

	if IsNil(slot0.decoratePanelCG) then
		slot0.decoratePanelCG = GetOrAddComponent(GameObject.Find("/UICamera/Canvas/UIMain/BackYardGarnitureUI(Clone)/decoratePanel"), typeof(CanvasGroup))
	end

	slot0.decoratePanelCG.blocksRaycasts = false

	slot0:setPreSelectedParent(slot0.furnitureModals[slot1.id])
	slot0.furnitureModals[slot1.id].SetAsLastSibling(slot2)

	if not slot1:isMapItem() then
		return
	end

	slot2:SetParent(slot0.floorContain, true)

	return
end

function slot0.furnitureDrag(slot0, slot1, slot2)
	if not slot0.isDraging then
		return
	end

	slot4 = slot0.houseVO:limitWallFurnWidth(slot3, slot2)

	if not slot2:isFloor() and not slot0.houseVO:isLimitWallBound(slot2, slot4) then
		return
	end

	slot5, slot10 = slot0.houseVO:isLegalPos(slot2, slot4)

	slot0:changeConflictGridColor(slot6, slot2, slot0.houseVO:isLocaledAndPutOn(slot2, slot4))
	slot0:setWallModalDir(slot2, slot3)

	slot8 = slot0.getLocalPos(slot4)
	slot9 = slot0.furnitureModals[slot2.id]

	if slot0.houseVO.isLocaledAndPutOn(slot2, slot4) then
		slot9.localPosition = Vector2(slot8.x + slot7:getConfig("offset")[1], slot8.y + slot7.getConfig("offset")[2])
	else
		slot9.localPosition = slot8
	end

	return
end

function slot0.furnitureEndDrag(slot0, slot1, slot2)
	if not slot0.isDraging then
		return
	end

	slot3 = slot0.furnitureModals[slot2.id]
	slot4 = slot0.houseVO:limitWallFurnWidth(slot1, slot2)

	slot0:changeConflictGridColor({}, slot2)

	if not slot2:isFloor() and not slot0.houseVO:isLimitWallBound(slot2, slot4) then
		slot4 = slot0.houseVO:getWallBound(slot1, slot2)
	end

	if not slot0.houseVO:isLegalPos(slot2, slot4) then
		slot0:setWallModalDir(slot2, slot5)
		LeanTween.moveLocal(go(slot3), Vector3(slot0.getLocalPos(slot5).x, slot0.getLocalPos(slot5).y, 0), 0.1):setOnComplete(System.Action(function ()
			if slot0:hasParent() then
				slot1 = slot1.furnitureVOs[slot0.parent].getConfig(slot0, "offset")
				slot2.localPosition = Vector2(slot0.localPosition.x + slot1[1], slot0.localPosition.y + slot1[2])

				slot2:SetParent(slot1.furnitureModals[slot0.parent].Find(slot3, "childs"), true)
				slot1.maps[slot0.parent].afterSortFunc(slot1.maps[slot0.parent].sortedItems)
			end

			slot1.map.afterSortFunc(slot1.map.sortedItems)
			slot1.map.sortedItems:setPreSelectedParent(slot1.furContain)

			if not slot1.map.sortedItems.setPreSelectedParent:isFloor() then
				slot1:sortWallFurns()
			end

			slot1.decoratePanelCG.blocksRaycasts = true
			true.isDraging = nil

			return
		end))

		return
	end

	slot7 = slot0
	slot6 = slot0.emit
	slot8 = BackyardMainMediator.FURNITURE_POS_CHNAGE
	slot9 = slot2.id
	slot10 = slot4

	if not slot0.houseVO:isLocaledAndPutOn() or not slot5.id then
		slot11 = slot5
	end

	slot6(slot7, slot8, slot9, slot10, slot11)
	slot0:setPreSelectedParent(slot0.furContain)

	if not slot2:isFloor() then
		slot0:sortWallFurns()
	end

	if slot2:isMat() then
		slot0:sortAllMat()
	end

	slot0.decoratePanelCG.blocksRaycasts = true
	slot0.isDraging = nil

	return
end

function slot0.sortAllMat(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7:isMat() then
			table.insert(slot2, slot7)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot1:getOccupyGridCount() >= slot0:getOccupyGridCount() then
			slot2 = false
		else
			slot2 = true
		end

		return slot2
	end)
	_.each(slot2, function (slot0)
		if slot0.furnitureModals[slot0.id] then
			slot1:SetAsLastSibling()
		end

		return
	end)

	return
end

function slot0.sortWallFurns(slot0)
	slot1, slot5, slot3 = slot0.houseVO:sortWallFurns()

	for slot7, slot8 in ipairs(slot2) do
		if not IsNil(slot0.furnitureModals[slot8.id]) then
			slot9:SetAsLastSibling()
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if not IsNil(slot0.furnitureModals[slot8.id]) then
			slot9:SetAsLastSibling()
		end
	end

	for slot7, slot8 in ipairs(slot3) do
		if not IsNil(slot0.furnitureModals[slot8.id]) then
			slot9:SetAsFirstSibling()
		end
	end

	return
end

function slot0.rotateFurn(slot0, slot1)
	slot2 = slot0.furnitureModals[slot1.id]

	for slot6, slot7 in pairs(slot1.child) do
		slot0:setFurnitureParent(slot0.furnitureVOs[slot6])
	end

	slot2.localScale = Vector3(-slot2.localScale.x, 1, 1)

	if slot1:hasInterActionShipId() then
		for slot7, slot8 in ipairs(slot3) do
			slot12 = slot0.shipModels[slot8]
			slot11 = slot0.shipModels[slot8].updateExpTFScale
			slot13 = slot0.getSign

			if slot2.localScale.x * slot0.shipModels[slot8].tf.localScale.x >= 0 then
				slot14 = false
			else
				slot14 = true
			end

			slot11(slot12, slot13(slot14))
		end
	else
		if slot1:getSpineId() then
			slot7 = slot0.shipModels[slot1:getSpineId()]
			slot6 = slot0.shipModels[slot1.getSpineId()].changeInnerDir
			slot8 = slot0.getSign

			if slot2.localScale.x * slot0.shipModels[slot1.getSpineId()].tf.localScale.x >= 0 then
				slot9 = false
			else
				slot9 = true
			end

			slot6(slot7, slot8(slot9))
			slot4:updateModelDir()
		end
	end

	if slot0.rotateId == slot1.id then
		slot0:createItem(slot1, slot1:getPosition().x, slot1.getPosition().y)
		slot0:setPreSelectedParent(slot2)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)

		slot0:setPreSelectedParent(slot0.furContain)

		slot0.rotateId = nil
	end

	return
end

function slot0.closePreFurnSelected(slot0)
	if not IsNil(slot0.preFurnSelected) and not IsNil(slot0.curFurnModal) then
		slot0:setPreSelectedParent(slot0.curFurnModal)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)

		SetActive(slot0.preFurnSelected, false)
		SetActive(slot0.curFurnModal:Find("grids"), false)

		slot0.preFurnSelected = nil
		slot0.curFurnModal = nil
	end

	return
end

function slot0.setPreSelectedParent(slot0, slot1)
	if not IsNil(slot0.preFurnSelected) and not IsNil(slot1) then
		slot0.preFurnSelected:SetParent(slot1, true)
	end

	return
end

function slot0.setWallModalDir(slot0, slot1, slot2)
	if slot1:isFloor() then
		return
	end

	slot3 = slot0.furnitureModals[slot1.id]
	slot4 = slot0.getSign(BackyardFurnitureVO.isRightWall(slot2))

	if not IsNil(slot0.preFurnSelected) then
		slot0:setPreSelectedParent(slot0.furContain)
	end

	slot3.localScale = Vector3(slot4, 1, 1)

	if not IsNil(slot0.preFurnSelected) then
		slot0:setPreSelectedParent(slot3)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)
	end

	return
end

function slot0.setFurnitureParent(slot0, slot1)
	slot2 = slot0.furnitureModals[slot1.id]

	if not slot1:isFloor() or ((not slot1:isMat() or not slot0.carpetContain) and not slot0.floorContain) then
		slot3 = slot0.wallContain
	end

	slot2:SetParent(slot3, true)

	return
end

function slot0.changeConflictGridColor(slot0, slot1, slot2, slot3)
	for slot8, slot9 in pairs(slot4) do
		slot0.changeGridColor(slot9, BackYardConst.BACKYARD_GREEN)
	end

	if slot3 then
		for slot8, slot9 in ipairs(slot4) do
			slot0.changeGridColor(slot9, BackYardConst.BACKYARD_BLUE)
		end
	end

	for slot8, slot9 in pairs(slot1) do
		slot0.changeGridColor(slot4[slot9], BackYardConst.BACKYARD_RED)
	end

	return
end

function slot0.getGridTpl(slot0, slot1)
	if not slot1 or not slot0.backyardPoolMgr.POOL_NAME.GRID then
		slot2 = slot0.backyardPoolMgr.POOL_NAME.WALL
	end

	SetParent(slot0.backyardPoolMgr:Dequeue(slot2), slot0.furContain)

	return slot0.backyardPoolMgr.Dequeue(slot2)
end

function slot0.loadBoatModal(slot0, slot1, slot2)
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)
		if not IsNil(slot0._tf) then
			slot0.name = "model"
			rtf(slot0).sizeDelta = Vector2.New(200, 500)
			slot1 = GameObject("char_" .. slot1.id)

			slot1:AddComponent(typeof(RectTransform))
			SetParent(slot0, slot1)

			slot2 = BackYardShipModel.New(slot1, slot1)
			slot0.shipModels[slot1.id] = slot2

			slot2:onLoadSlotModel(slot0)

			if not slot1:hasInterActionFurnitrue() then
				slot0:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot1.id)
			end

			for slot7, slot8 in pairs(slot3) do
				if slot8.attachment_cusual[1] ~= "" then
					ResourceMgr.Inst:getAssetAsync("Effect/" .. slot9, slot9, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
						if not IsNil(slot0._tf) then
							slot1 = Object.Instantiate(slot0)
							slot0._attachmentList[#slot0._attachmentList + 1] = slot1

							tf(slot1):SetParent(tf(slot1))

							tf(slot1).localPosition = BuildVector3(slot2.attachment_cusual[2])
						end

						return
					end), true, true)
				end
			end
		end

		if slot2 then
			slot2()
		end

		return
	end)

	return
end

function slot0.setInterAction(slot0, slot1, slot2, slot3, slot4)
	if slot0.shipModels[slot2] then
		slot5:updateBoatVO(slot0.boatVOs[slot2])

		slot6 = slot0.furnitureVOs[slot3]

		if slot1 then
			slot5:updateSpineInterAction(slot6)
		else
			slot5:updateInterActionPos(slot6, slot4)
			slot5:InterActionSortSibling(slot3)
		end
	end

	return
end

function slot0.setStageInterAction(slot0, slot1, slot2)
	if slot0.shipModels[slot1] then
		slot3:updateStageInterAction(slot2)
	end

	return
end

function slot0.clearStageInterAction(slot0, slot1)
	if slot0.shipModels[slot1] then
		slot2:clearStageInterAction()
	end

	return
end

function slot0.updateArchInteraction(slot0, slot1, slot2)
	if slot0.shipModels[slot1] then
		slot3:updateArchInterAction(slot2)
	end

	return
end

function slot0.clearArchInteration(slot0, slot1)
	if slot0.shipModels[slot1] then
		slot2:clearArchInterAction()
	end

	return
end

function slot0.clearSpineInteraction(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] then
		slot4:clearSpineInteraction(slot3)
		slot4:removeAllActionCB()
	end

	return
end

function slot0.addSpineExtra(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] then
		if slot0.furnitureVOs[slot1]:hasTailAction() then
			slot4:endSpineAnimator(slot5, slot3)
			slot4:startSpineAnimator(slot5, slot3)
			slot4:setAction(slot6, 0)
			slot4:addSpineExtra(slot1, slot3)
		else
			slot6 = slot0.furnitureModals[slot1]

			slot0.shipModels[slot5:getSpineId()].pauseAnim(slot8)

			for slot12, slot13 in ipairs(slot5:getShipExtra()) do
				slot0.shipModels[slot13].addSpineExtra(slot14, slot1, slot12)
				slot8:registerActionCB(slot13, function (slot0)
					slot0:setAction(slot0, 0)

					return
				end, function ()
					slot0:endSpineAnimator(slot0, )
					slot0.endSpineAnimator:startSpineAnimator(slot0.endSpineAnimator, )

					return
				end)
			end

			slot8:resumeAnim()
		end
	end

	return
end

function slot0.clearSpineExtra(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot2] and slot0.furnitureVOs[slot1]:getSpineId() then
		slot4:clearSpineExtra(slot1, slot3)
		slot0.shipModels[slot6]:removeActionCB(slot2)
	end

	return
end

function slot0.boatMove(slot0, slot1, slot2, slot3)
	slot0.shipModels[slot1]:move(slot2, slot3)

	return
end

function slot0.boatMoveOnFurniture(slot0, slot1, slot2, slot3)
	slot0.shipModels[slot1]:moveOnFurniture(slot2, slot3)

	return
end

function slot0.cancelShipMove(slot0, slot1)
	slot0.shipModels[slot1]:cancelMove()

	return
end

function slot0.updateShipPos(slot0, slot1)
	slot0.boatVOs[slot1.id]:setPosition(slot1:getPosition())

	if slot0.shipModels[slot1.id] then
		slot3:updateBoatVO(slot0.boatVOs[slot1.id])
		slot3:updatePosition(slot2)
	end

	return
end

function slot0.acquireEffect(slot0, slot1, slot2, slot3)
	if slot0.shipModels[slot1] then
		slot4:acquireEffect(slot2, slot3)
	end

	return
end

function slot0.addBoatInimacyAndMoney(slot0, slot1)
	if slot0.shipModels[slot1.id] then
		slot2:updateInimacy(slot1:hasInimacy())
		slot2:updateMoney(slot1:hasMoney())
	else
		slot0.boatVOs[slot1.id].setInimacy(slot3, slot1.inimacy)
		slot0.boatVOs[slot1.id]:setMoney(slot1.money)
	end

	return
end

function slot0.willExit(slot0)
	if slot0.dragTrigger then
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
	end

	pg.DelegateInfo.Dispose(slot0)
	slot0.event:clear()
	slot0:clearUI()
	slot0:closeMsgBox()
	slot0:closeFurnitrueDesc()

	slot0.backyardPoolMgr = nil

	return
end

function slot0.clearFunriture(slot0, slot1)
	slot3 = {
		{
			"grids",
			"childs",
			"mask"
		},
		{
			"drag"
		}
	}

	if slot0.furnitureModals[slot1.id] and slot1 then
		slot4 = _.flatten(slot3)

		eachChild(slot2, function (slot0)
			if not table.contains(slot0, go(slot0).name) then
				Destroy(slot0)
			end

			if table.contains(slot1[1], go(slot0).name) then
				removeAllChildren(slot0)
			end

			return
		end)
	end

	return
end

function slot0.clearUI(slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		slot5:dispose()
		PoolMgr.GetInstance():ReturnSpineChar(slot0.boatVOs[slot4]:getPrefab(), go(slot5.model))
	end

	for slot4, slot5 in pairs(slot0.furnBottomGrids) do
		for slot9, slot10 in pairs(slot5) do
			if not IsNil(slot10) then
				if not slot0.furnitureVOs[slot4]:isFloor() or not slot0.backyardPoolMgr.POOL_NAME.GRID then
					slot11 = slot0.backyardPoolMgr.POOL_NAME.WALL
				end

				slot0.backyardPoolMgr:Enqueue(slot11, slot10)
			end
		end
	end

	for slot4, slot5 in pairs(slot0.furnitureModals) do
		if not IsNil(slot5) then
			slot0:clearFunriture(slot0.furnitureVOs[slot4])
			slot0.backyardPoolMgr:Enqueue(slot0.backyardPoolMgr.POOL_NAME.FURNITURE, slot5)
		end
	end

	if not IsNil(slot0.furContain) then
		removeAllChildren(slot0.furContain:Find("shadow"))
		setActive(slot0.furContain:Find("ship_grid"), false)
	end

	if not IsNil(slot0.carpetContain) then
		removeAllChildren(slot0.carpetContain)
	end

	if not IsNil(slot0.wallContain) then
		removeAllChildren(slot0.wallContain)
	end

	if not IsNil(slot0.floorContain) then
		removeAllChildren(slot0.floorContain)
	end

	if not IsNil(slot0.baseBG) then
		Destroy(slot0.baseBG)
	end

	slot0.wallPaperModel:dispose()
	slot0.floorPaperModel:dispose()

	if not IsNil(slot0.floorGrid) then
		setActive(slot0.floorGrid, false)
	end

	for slot4, slot5 in ipairs(slot0._attachmentList) do
		Object.Destroy(slot5)
	end

	slot0._attachmentList = nil

	return
end

return slot0
