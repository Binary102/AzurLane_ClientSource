slot0 = class("CommaderMsgBox")

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.msgbox = slot0._tf
end

function slot0.openMsgBox(slot0, slot1)
	slot0.isShowMsgBox = true

	setActive(slot0.msgbox, true)
	setText(slot0.msgbox:Find("frame/bg/content/Text"), slot1.content)
	onButton(slot0, slot0.msgbox:Find("frame/cancel_btn"), function ()
		slot0:closeMsgBox()

		if slot1.onNo then
			slot1.onNo()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.msgbox:Find("frame/confirm_btn"), function ()
		if slot0.onYes then
			slot0.onYes()
		end

		slot1:closeMsgBox()
	end, SFX_PANEL)
	onButton(slot0, slot0.msgbox:Find("frame/close_btn"), function ()
		slot0:closeMsgBox()

		if slot1.onClose then
			slot1.onClose()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.msgbox, function ()
		slot0:closeMsgBox()
	end, SFX_PANEL)
	slot0._tf:SetAsLastSibling()
end

function slot0.closeMsgBox(slot0)
	slot0.isShowMsgBox = nil

	setActive(slot0.msgbox, false)
end

function slot0.clear(slot0)
	slot0:closeMsgBox()
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
