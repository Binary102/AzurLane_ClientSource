slot0 = class("AssignedShipScene", import("..base.BaseUI"))
slot0.list = {
	"S",
	"B",
	"T",
	"W",
	"H",
	"E",
	"I",
	"P",
	"A"
}
slot0.shiplist = {
	102081,
	202121,
	303111,
	205021,
	204031,
	107061,
	207031,
	205061,
	303121
}

function slot0.getUIName(slot0)
	return "AssignedShipUI"
end

function slot0.preload(slot0, slot1)
	GetSpriteFromAtlasAsync("ui/assign_ship_atlas_1", "SP", slot1)
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("layer/back", slot0._tf)
	slot0.confirmBtn = slot0:findTF("layer/confirm", slot0._tf)
	slot0.print = slot0:findTF("layer/print", slot0._tf)
	slot0.selectPanel = slot0:findTF("layer/select_panel/layout", slot0._tf)
	slot0.selectTarget = nil
	slot0.selectedVO = nil
	slot0.count = 1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)

	for slot5 = 1, slot0.selectPanel.childCount, 1 do
		onButton(slot0, slot0.selectPanel:GetChild(slot5 - 1), function (slot0)
			if not LeanTween.isTweening(go(slot0.print)) then
				slot0:setSelectTarget(slot0.setSelectTarget)
			end
		end, SFX_PANEL)
		SetActive(slot0:findTF("selected", slot0.selectPanel:GetChild(slot5 - 1)), false)
	end

	onButton(slot0, slot0.confirmBtn, function ()
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("nine_choose_one", pg.ship_data_statistics[slot0.selectedShipNumber].name),
			onYes = function ()
				slot0:emit(AssignedShipMediator.ON_USE_ITEM, slot0.itemVO.id, slot0.count, slot0.selectedVO)
			end
		})
	end, SFX_PANEL)
	slot0:setSelectTarget(1)
end

function slot0.setSelectTarget(slot0, slot1)
	if slot0.selectTarget then
		SetActive(slot0:findTF("selected", slot0.selectPanel:GetChild(slot0.selectTarget - 1)), false)
		LeanTween.alpha(rtf(slot0.print), 0, 0.3):setOnComplete(System.Action(function ()
			GetImageSpriteFromAtlasAsync("ui/assign_ship_atlas_1", slot0.list[slot1] .. "P", slot0.print)
			LeanTween.alpha(rtf(slot0.print), 1, 0.3)
		end))
		SetActive(slot0:findTF("selected", slot0.selectPanel:GetChild(slot1 - 1)), true)
	else
		GetImageSpriteFromAtlasAsync("ui/assign_ship_atlas_1", slot0.list[slot1] .. "P", slot0.print)
		SetActive(slot0:findTF("selected", slot0.selectPanel:GetChild(slot1 - 1)), true)
	end

	slot0.selectTarget = slot1
	slot0.selectedVO = slot0.itemVO:getTempCfgTable().usage_arg[slot1]
	slot0.selectedShipNumber = slot0.shiplist[slot1]
end

function slot0.setItemVO(slot0, slot1)
	slot0.itemVO = slot1
end

function slot0.willExit(slot0)
	clearImageSprite(slot0.print)
end

return slot0
