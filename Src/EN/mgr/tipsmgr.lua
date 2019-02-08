pg = pg or {}
pg.TipsMgr = singletonClass("TipsMgr")

function pg.TipsMgr.Ctor(slot0)
	slot0._go = nil
end

function pg.TipsMgr.Init(slot0, slot1)
	print("initializing tip manager...")

	slot0._count = 0
	slot0._tipTable = {}

	PoolMgr.GetInstance():GetUI("TipPanel", true, function (slot0)
		slot0._go = slot0

		slot0._go:SetActive(false)
		slot0._go.transform:SetParent(GameObject.Find("Overlay/UIOverlay").transform, false)

		slot0._tips = slot0._go.transform:Find("toolTip")
		slot0._picTips = slot0._go.transform:Find("toolPicTip")
		slot0._grid = slot0._go.transform:Find("Grid")

		GameObject.Find("Overlay/UIOverlay")()
	end)
end

function pg.TipsMgr.ShowTips(slot0, slot1, slot2, slot3)
	slot4 = playSoundEffect

	if not slot3 then
		slot5 = SFX_UI_TIP
	end

	slot4(slot5)
	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot0._count = slot0._count + 1
	slot4 = cloneTplTo(slot0._tips, slot0._grid)
	slot5 = slot2 or "white"

	setText(cloneTplTo(slot0._tips, slot0._grid).transform:Find("Text"), "<color=" .. slot5 .. ">" .. slot1 .. "</color>")

	slot6, slot7 = filterSpecChars(slot1)
	slot5 = "white"

	if slot7 > 16 then
		rtf(slot8).sizeDelta = Vector2(600 + (slot7 - 16) * 22, rtf(slot4.transform:Find("BG")).rect.height)
	end

	slot4.transform.localScale = Vector3(0, 0.1, 1)

	LeanTween.scale(slot4, Vector3(1.8, 0.1, 1), 0.1):setUseEstimatedTime(true)
	LeanTween.scale(slot4, Vector3(1.1, 1.1, 1), 0.1):setDelay(0.1):setUseEstimatedTime(true)

	function slot8(slot0, slot1)
		slot2 = GetOrAddComponent(slot0, "CanvasGroup")

		LeanTween.scale(slot0, Vector3(0.1, 1.5, 1), 0.1):setDelay(3):setUseEstimatedTime(true)
		LeanTween.scale(slot0, Vector3.zero, 0.1):setDelay(3.1):setUseEstimatedTime(true):setOnComplete(System.Action(function ()
			Destroy(Destroy)

			for slot3, slot4 in pairs(Destroy._tipTable) do
				if slot4 == slot0 then
					table.remove(slot1._tipTable, slot3)
				end
			end

			slot1._count = slot1._count - 1

			if slot1._count == 0 then
				SetActive(slot1._go, false)
			end

			return
		end))

		return
	end

	if slot0._count <= 3 then
		slot0._tipTable[slot0._count] = slot4

		slot8(slot4, slot0._count)
	else
		Destroy(slot0._tipTable[1])
		table.remove(slot0._tipTable, 1)

		slot0._count = 3
		slot0._tipTable[3] = slot4

		slot8(slot4, slot0._count)
	end

	return
end

function pg.TipsMgr.ShowPicTips(slot0, slot1, slot2, slot3, slot4)
	slot5 = playSoundEffect

	if not slot4 then
		slot6 = SFX_UI_TIP
	end

	slot5(slot6)
	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot0._count = slot0._count + 1
	slot5 = cloneTplTo(slot0._picTips, slot0._grid)

	if not slot3 then
		slot6 = "white"
	end

	setText(slot5.transform:Find("Text"), "<color=" .. slot6 .. ">\"" .. slot1 .. "\" x" .. slot2 .. "</color>")

	function slot7(slot0)
		slot1 = GetOrAddComponent(slot0, "CanvasGroup")
		slot2 = LeanTween.value(go(slot0), 1, 0, 5):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			slot0.alpha = slot0

			return
		end)):setOnComplete(System.Action(function ()
			Destroy(Destroy)

			for slot3, slot4 in pairs(Destroy._tipTable) do
				if slot4 == slot0 then
					table.remove(slot1._tipTable, slot3)
				end
			end

			slot1._count = slot1._count - 1

			if slot1._count == 0 then
				SetActive(slot1._go, false)
			end

			return
		end))

		return
	end

	if slot0._count <= 3 then
		slot0._tipTable[slot0._count] = slot5

		slot7(slot5)
	else
		Destroy(slot0._tipTable[1])
		table.remove(slot0._tipTable, 1)

		slot0._count = 3
		slot0._tipTable[3] = slot5

		slot7(slot5)
	end

	return
end

return
