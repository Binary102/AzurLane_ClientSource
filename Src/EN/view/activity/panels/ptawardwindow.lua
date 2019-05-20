slot0 = class("PtAwardWindow")

function slot0.Ctor(slot0, slot1)
	slot0._tf = slot1
	slot0.UIlist = UIItemList.New(slot0._tf:Find("window/panel/list"), slot0._tf:Find("window/panel/list/item"))
	slot0.totalTxt = slot0._tf:Find("window/pt/Text"):GetComponent(typeof(Text))
	slot0.totalTitleTxt = slot0._tf:Find("window/pt/title"):GetComponent(typeof(Text))
	slot0.closeBtn = slot0._tf:Find("window/top/btnBack")

	onButton(nil, slot0._tf, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(nil, slot0.closeBtn, function ()
		slot0:Hide()
	end, SFX_PANEL)
end

function slot1(slot0, slot1, slot2, slot3)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setText(slot2:Find("target/Text"), slot4)
			setText(slot2:Find("target/title"), slot2.resTitle)
			updateDrop(slot2:Find("award"), {
				type = slot0[slot1 + 1][1],
				id = slot0[slot1 + 1][2],
				count = slot0[slot1 + 1][3]
			})
			setActive(slot2:Find("award/mask"), slot1 + 1 <= slot0[slot1 + 1])
			removeOnButton(slot2:Find("award"))
		end
	end)
	slot0.UIlist:align(#slot1)
end

function slot0.Show(slot0, slot1)
	slot0.cntTitle = i18n("pt_total_count", slot7)
	slot0.resTitle = i18n("pt_count", slot7)

	slot0(slot0, slot2, slot1.targets, slot1.level)

	slot0.totalTxt.text = slot1.count
	slot0.totalTitleTxt.text = slot0.cntTitle

	setActive(slot0._tf, true)
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)
end

function slot0.Dispose(slot0)
	slot0:Hide()
	removeOnButton(slot0._tf)
	removeOnButton(slot0.closeBtn)
end

return slot0
