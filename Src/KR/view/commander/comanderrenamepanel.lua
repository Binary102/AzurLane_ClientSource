slot0 = class("ComanderRenamePanel")

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot2
	slot0._tf = tf(slot2)
	slot0.renamePanel = slot0._tf
	slot0.parent = slot1

	onButton(slot0, slot0.renamePanel:Find("frame/close_btn"), function ()
		slot0:close()
	end, SFX_PANEL)
	onButton(slot0, slot0.renamePanel, function ()
		slot0:close()
	end, SFX_PANEL)
	onButton(slot0, slot0.renamePanel:Find("frame/cancel_btn"), function ()
		slot0:close()
	end, SFX_PANEL)

	slot0.input = findTF(slot0.renamePanel, "frame/bg/content/input")
end

function slot0.open(slot0, slot1)
	slot0.isShowMsgBox = true

	setActive(slot0.renamePanel, true)
	slot0._tf:SetAsLastSibling()
	setInputText(slot0.input, "")
	onButton(slot0, slot0.renamePanel:Find("frame/confirm_btn"), function ()
		if not getInputText(slot0.input) or slot0 == "" then
			return
		end

		slot0.parent:openMsgBox({
			content = i18n("commander_rename_warning", slot0),
			onYes = function ()
				slot0.parent:emit(CommanderInfoMediator.ON_RENAME, slot1.id, )
				slot0.parent.emit:close()
			end
		})
	end, SFX_PANEL)
end

function slot0.close(slot0)
	slot0.isShowMsgBox = nil

	setActive(slot0.renamePanel, false)
end

function slot0.clear(slot0)
	slot0:close()
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
