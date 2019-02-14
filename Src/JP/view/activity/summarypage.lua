slot0 = class("SummaryPage")

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1

	function slot0.onOpenFunc(slot0, slot1)
		if slot1 then
			slot1()
		end
	end

	function slot0.onPrepare(slot0, slot1)
		if slot1 then
			slot1()
		end
	end
end

function slot0.init(slot0, slot1, slot2)
	slot0.index = slot1
	slot0.summaryInfoVO = slot2

	if slot0["initPage" .. slot1] then
		slot0["initPage" .. slot1](slot0)
	end
end

function slot0.initPage0(slot0)
	slot0.textTFs = {}

	eachChild(slot1, function (slot0)
		setActive(slot0, false)
		table.insert(slot0.textTFs, 1, slot0)
	end)

	slot2 = 0.05
	slot0.timers = {}

	function slot0.onPrepare()
		return
	end

	function slot0.onOpenFunc(slot0, slot1)
		slot2 = {}

		for slot6, slot7 in ipairs(slot0.textTFs) do
			table.insert(slot2, function (slot0)
				slot0.timers[] = Timer.New(function ()
					if slot0.timers[slot1] then
						slot0.timers[slot1]:Stop()

						slot0.timers[slot1].Stop.timers[slot0.timers[slot1]] = nil
					end

					setActive(slot2, true)
					slot2:GetComponent(typeof(Typewriter)):setSpeed(0.015)
					0.015()
				end, slot3 * slot1, 1)

				slot0.timers[]:Start()
			end)
		end

		table.insert(slot2, function (slot0)
			slot1 = slot0:GetComponent(typeof(CanvasGroup))

			LeanTween.value(go(slot0), 1, 0, 0.5):setOnUpdate(System.Action_float(function (slot0)
				slot0.alpha = slot0
			end)):setOnComplete(System.Action(slot0)):setDelay(0.6)
		end)
		seriesAsync(slot2, slot1)
	end

	setActive(slot0._go, false)
end

function slot0.initPage1(slot0)
	slot3 = findTF(slot0._go, "title1")
	slot4 = findTF(slot0._go, "title2")
	slot5 = findTF(slot1, "label")
	slot7 = findTF(slot6, "mask")

	setText(slot2, slot0.summaryInfoVO.name)

	slot10 = findTF(slot9, "line")
	slot11 = findTF(slot9, "line/print")
	slot12 = {}

	for slot16 = 1, findTF(slot0._go, "time_line").childCount, 1 do
		for slot22 = 1, slot8:GetChild(slot16 - 1).Find(slot17, "texts").childCount, 1 do
			if go(slot18:GetChild(slot22 - 1)).name == "guildName" then
				if not (not slot0.summaryInfoVO.guildName or slot25 == "") then
					setText(slot23:Find("text/Text"), "「" .. slot25 .. "」")
				end

				setActive(slot23:Find("image"), slot26)
				setActive(slot23:Find("text"), not slot26)
			else
				if slot24 == "days" or slot24 == "furnitureCount" or slot24 == "furnitureWorth" then
					setText(slot23:Find("Text"), slot0.summaryInfoVO[slot24])
				else
					if slot24 ~= "label" then
						setText(slot23:Find("Text"), "「" .. string.gsub(slot0.summaryInfoVO[slot24], "–", "-") .. "」")
					end
				end
			end
		end

		table.insert(slot12, slot17)
	end

	setPaintingPrefabAsync(slot7, slot13, "jiesuan")

	slot14 = 0

	function slot0.onPrepare()
		return
	end

	slot15 = 0.2

	function slot0.onOpenFunc(slot0, slot1)
		seriesAsync({
			function (slot0)
				slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
					slot0()

					return
				end)

				return
			end
		}, slot1)

		return
	end

	setActive(slot0._go, false)

	return
end

function slot0.initPage2(slot0)
	setText(slot1, slot0.summaryInfoVO.firstProposeName)

	slot0.textTFs = {}

	for slot6 = 1, findTF(slot0._go, "texts").childCount, 1 do
		if go(slot2:GetChild(slot6 - 1)).name ~= "label" then
			setText(slot7:Find("Text"), slot0.summaryInfoVO[slot8])
		end

		table.insert(slot0.textTFs, slot7)
	end

	setText(slot3, slot0.summaryInfoVO.firstLadyTime)

	slot4 = findTF(slot0._go, "painting")

	setPaintingPrefabAsync(slot5, slot6, "jiesuan")

	slot7 = findTF(slot0._go, "name")
	slot8 = findTF(slot0._go, "title1")
	slot9 = findTF(slot0._go, "title2")
	slot11 = slot7:Find("label1")
	slot12 = slot7:Find("line")
	slot13 = slot4:Find("anim").GetComponent(slot10, typeof(DftAniEvent))

	function slot0.onPrepare(slot0, slot1)
		return
	end

	function slot0.onOpenFunc(slot0, slot1)
		seriesAsync({
			function (slot0)
				slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
					slot0()

					return
				end)

				return
			end
		}, slot1)

		return
	end

	setActive(slot0._go, false)

	return
end

function slot0.initPage3(slot0)
	slot1 = findTF(slot0._go, "name")
	slot2 = findTF(slot0._go, "title1")
	slot3 = findTF(slot0._go, "title2")
	slot5 = findTF(slot0._go, "painting").Find(slot4, "mask")
	slot6 = slot1:Find("label1")
	slot7 = slot1:Find("label2")
	slot8 = slot1:Find("label3")

	function slot0.onPrepare(slot0, slot1)
		return
	end

	slot9 = 0.2

	function slot0.onOpenFunc(slot0, slot1)
		seriesAsync({
			function (slot0)
				slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
					slot0()

					return
				end)

				return
			end
		}, slot1)

		return
	end

	setActive(slot0._go, false)

	return
end

function slot0.initPage4(slot0)
	slot2 = slot0.summaryInfoVO.furnitures
	slot3 = {}
	slot4 = findTF(slot0._go, "name")
	slot5 = findTF(slot0._go, "name/label1")
	slot6 = findTF(slot0._go, "name/label2")

	for slot10 = 1, findTF(slot0._go, "content").childCount, 1 do
		triggerToggle(findTF(slot11, "info"), slot2[tonumber(go(slot11).name)])

		if slot2[tonumber(go(slot11).name)] then
			setText(slot12:Find("from/Text"), slot14:getConfig("gain_by"))
		else
			setText(slot12:Find("from/Text"), pg.furniture_data_template[slot13].gain_by)
		end

		setText(slot12:Find("date/Text"), (slot14 and slot14:getDate()) or i18n("summary_page_un_rearch"))
		table.insert(slot3, slot12)
	end

	function slot0.onPrepare(slot0, slot1)
		return
	end

	function slot0.onOpenFunc(slot0, slot1)
		seriesAsync({
			function (slot0)
				slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
					slot0()

					return
				end)

				return
			end
		}, slot1)

		return
	end

	setActive(slot0._go, false)

	return
end

function slot0.initPage5(slot0)
	onButton(slot0, slot1, function ()
		if slot0:inAnim() then
			return
		end

		pg.ShareMgr:GetInstance():Share(pg.ShareMgr.TypeSummary)

		return
	end, SFX_PANEL)
	setText(slot3, slot0.summaryInfoVO.name)
	setActive(slot0._go, false)

	slot0.textTFs = {}

	for slot8 = 1, findTF(slot0._go, "frame/texts").childCount, 1 do
		if go(slot4:GetChild(slot8 - 1)).name == "list" or slot10 == "list1" then
			for slot14 = 1, slot9.childCount, 1 do
				setActive(slot9:GetChild(slot14 - 1), (go(slot15).name ~= "guildName" or slot0.summaryInfoVO:hasGuild()) and (slot16 ~= "medalCount" or not not slot0.summaryInfoVO:hasMedal()))

				if go(slot15).name ~= "label" then
					if slot16 == "guildName" or slot16 == "chapterName" then
						setText(slot15:Find("image/Text"), "「" .. string.gsub(slot0.summaryInfoVO[go(slot15).name] .. "」", "–", "-"))
					else
						setText(slot15:Find("image/Text"), slot0.summaryInfoVO[go(slot15).name])
					end
				end
			end
		else
			if slot10 ~= "label" then
				setText(slot9:Find("Text"), slot0.summaryInfoVO[slot10])
			end
		end

		table.insert(slot0.textTFs, slot9)
	end

	slot5 = findTF(slot0._go, "frame")
	slot6 = findTF(slot0._go, "frame/arrs")
	slot7 = findTF(slot2, "lable")
	slot8 = 0.2

	function slot0.onPrepare(slot0, slot1)
		return
	end

	function slot0.onOpenFunc(slot0, slot1)
		seriesAsync({
			function (slot0)
				slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
					slot0()

					return
				end)

				return
			end
		}, slot1)

		return
	end

	return
end

function slot0.inAnim(slot0)
	return slot0.isAniming
end

function slot0.show(slot0, slot1)
	slot0.isAniming = true

	if slot0.onPrepare then
		slot0:onPrepare()
	end

	setActive(slot0._go, true)

	if slot0.onOpenFunc then
		slot0:onOpenFunc(function ()
			slot0()

			slot1.isAniming = nil

			return
		end)
	else
		slot0.isAniming = nil
	end

	return
end

function slot0.hide(slot0, slot1)
	slot0.isAniming = true

	setActive(slot0._go, false)

	if slot1 then
		slot1()

		slot0.isAniming = nil
	else
		slot0.isAniming = nil
	end

	return
end

function slot0.setSpriteTo(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).sprite = findTF(slot0._go, slot1):GetComponent(typeof(Image)).sprite

	if slot3 then
		slot4:SetNativeSize()
	end

	return
end

function slot0.dispose(slot0)
	slot0.onOpenFunc = nil

	if slot0.timers then
		for slot4, slot5 in pairs(slot0.timers) do
			slot5:Stop()
		end

		slot0.timers = nil
	end

	pg.DelegateInfo.Dispose(slot0)

	return
end

return slot0
