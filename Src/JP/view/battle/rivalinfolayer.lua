slot0 = class("RivalInfoLayer", import("..base.BaseUI"))
slot0.TYPE_DISPLAY = 1
slot0.TYPE_BATTLE = 2
slot0.TYPE_SHAM = 3

function slot0.getUIName(slot0)
	return "RivalInfoUI"
end

function slot0.setRival(slot0, slot1)
	slot0.rivalVO = slot1
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():LoadingOn()
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end)

	slot2 = findTF(slot0._tf, "ships_container/return_btn")
	slot3 = findTF(slot0._tf, "info/title_miex")
	slot4 = findTF(slot0._tf, "info/title_rival")
	slot5 = findTF(slot1, "text_miex")
	slot6 = findTF(slot1, "text_rival")

	if slot0.contextData.type == slot0.TYPE_DISPLAY then
		setActive(slot1, false)
		setActive(slot2, true)
		setActive(slot3, false)
		setActive(slot4, false)
	elseif slot0.contextData.type == slot0.TYPE_BATTLE then
		setActive(slot1, true)
		setActive(slot2, false)
		setActive(slot3, true)
		setActive(slot4, false)
		setActive(slot5, true)
		setActive(slot6, false)
	elseif slot0.contextData.type == slot0.TYPE_SHAM then
		setActive(slot1, true)
		setActive(slot2, false)
		setActive(slot3, false)
		setActive(slot4, true)
		setActive(slot5, false)
		setActive(slot6, true)
	end

	if slot0.contextData.type == slot0.TYPE_DISPLAY then
		slot0.targetBtn = slot2

		onButton(slot0, slot2, function ()
			slot0:emit(slot1.ON_CLOSE)
		end)
	elseif slot0.contextData.type == slot0.TYPE_BATTLE or slot0.contextData.type == slot0.TYPE_SHAM then
		slot0.targetBtn = slot1

		onButton(slot0, slot1, function ()
			slot0:emit(RivalInfoMediator.START_BATTLE)
		end, SFX_CONFIRM)
	end

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:initRivalInfo()
end

function slot0.initRivalInfo(slot0)
	setText(findTF(slot0._tf, "info/name/container/name"), slot0.rivalVO.name)
	setText(findTF(slot0._tf, "info/name/container/lv"), "Lv." .. slot0.rivalVO.level)
	setActive(findTF(slot0._tf, "info/rank"), slot0.rivalVO.rank ~= nil)
	setActive(findTF(slot0._tf, "info/medal"), slot0.rivalVO.rank ~= nil)

	slot0._nameTxts = {}

	if slot0.rivalVO.rank then
		setText(findTF(slot0._tf, "info/rank/container/value"), slot0.rivalVO.rank)

		slot1 = SeasonInfo.getMilitaryRank(slot0.rivalVO.score, slot0.rivalVO.rank)
		slot2 = findTF(slot0._tf, "info/medal"):GetComponent(typeof(Image))

		LoadSpriteAsync("emblem/" .. slot3, function (slot0)
			slot0.sprite = slot0
		end)
	end

	function slot1(slot0, slot1)
		slot2 = slot0:findTF("content/frame/info/star_tpl", slot0)
		slot3 = findTF(slot0, "content/frame/info/type"):GetComponent(typeof(Image))

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot1:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot1.configId)
		end

		slot3.sprite = slot4

		setText(findTF(slot0, "content/frame/info/lv/Text"), slot1.level)

		slot5 = nil

		if not slot0._nameTxts[slot0] then
			slot0._nameTxts[slot0] = ScrollTxt.New(findTF(slot0, "content/frame/info/name_mask"), findTF(slot0, "content/frame/info/name_mask/name"))
		else
			slot5 = slot0._nameTxts[slot0]
		end

		slot5:setText(slot1:getName())

		slot6 = findTF(slot0, "content/frame/bg"):GetComponent(typeof(Image))

		GetSpriteFromAtlasAsync("shipframe", (slot1.propose and "prop") or slot1:rarity2bgPrint(), function (slot0)
			slot0.sprite = slot0

			slot0:SetNativeSize()
		end)

		findTF(slot0, "content/ship_icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

		LoadSpriteAsync("shipYardIcon/" .. slot1:getPainting(), function (slot0)
			slot0.sprite = slot0

			slot0:SetNativeSize()
		end)

		slot9 = findTF(slot0, "content/bg"):GetComponent(typeof(Image))

		LoadSpriteAsync("bg/star_level_card_" .. slot1.rarity2bgPrint(), function (slot0)
			slot0.sprite = slot0
		end)

		for slot16 = findTF(slot0, "content/frame/info/stars").childCount, slot1:getStar() - 1, 1 do
			cloneTplTo(slot2, slot10)
		end

		slot13 = slot1:getStar()

		for slot17 = 0, slot10.childCount - 1, 1 do
			slot10:GetChild(slot17).gameObject:SetActive(slot17 < slot13)
		end

		setActive(findTF(slot0, "content/duang"), slot1.propose)
	end

	function slot2(slot0, slot1, slot2, slot3)
		slot4 = slot2:GetChild(slot1 - 1)

		if slot3 then
			if slot1 <= slot0 then
				setActive(slot4, true)
				slot0(slot4, slot3)
			else
				setActive(slot4, false)
			end
		else
			setActive(slot4, false)
		end
	end

	slot3 = slot0:findTF("ships_container/ships/main", slot0._tf)
	slot4 = #slot0.rivalVO.mainShips

	for slot8 = 1, 3, 1 do
		slot2(slot4, slot8, slot3, slot0.rivalVO.mainShips[slot8])
	end

	slot5 = slot0:findTF("ships_container/ships/vanguard", slot0._tf)
	slot6 = #slot0.rivalVO.vanguardShips

	for slot10 = 1, 3, 1 do
		slot2(slot6, slot10, slot5, slot0.rivalVO.vanguardShips[slot10])
	end

	setActive(slot0.targetBtn, false)
	LeanTween.alpha(rtf(slot7), 0, 0)
	LeanTween.alpha(rtf(slot8), 0, 0)
	LeanTween.value(go(slot9), 0, slot11, 0.5):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0, math.floor(slot0))
	end)):setOnComplete(System.Action(function ()
		LeanTween.alpha(rtf(slot0), 1, 0)
		blinkAni(blinkAni, 0.1, 2)
	end))
	LeanTween.value(go(slot10), 0, slot12, 0.5):setOnUpdate(System.Action_float(function (slot0)
		setText(slot0, math.floor(slot0))

		return
	end)):setOnComplete(System.Action(function ()
		LeanTween.alpha(rtf(slot0), 1, 0)
		blinkAni(blinkAni, 0.1, 2):setOnComplete(System.Action(function ()
			setActive(slot0.targetBtn, true)
			pg.UIMgr.GetInstance():LoadingOff()

			return
		end))

		return
	end))
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, pg.UIMgr.GetInstance().UIMain)

	for slot4, slot5 in pairs(slot0._nameTxts) do
		slot5:destroy()
	end

	slot0._nameTxts = nil

	return
end

return slot0
