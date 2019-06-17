slot0 = class("CommanderDetailPage", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "CommanderDetailUI"
end

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.super.Ctor(slot0, slot1, slot2, slot3)
	slot0:Load()
end

function slot0.OnInit(slot0)
	slot0.statement = slot0:findTF("detail/statement")
	slot0.statement.localScale = Vector3(1, 0, 1)
	slot0.talentSkill = slot0:findTF("detail/talent_skill")
	slot1 = slot0:findTF("talent/content", slot0.talentSkill)
	slot0.talentList = UIItemList.New(slot1, slot1:GetChild(0))
	slot0.abilityAdditionTF = slot0:findTF("atttrs/content", slot0.statement)
	slot0.talentAdditionTF = slot0:findTF("talents/scroll/content", slot0.statement)
	slot0.talentAdditionList = UIItemList.New(slot0.talentAdditionTF, slot0.talentAdditionTF:GetChild(0))
	slot0.talentAdditionTextList = {}
	slot0.skillIcon = slot0:findTF("skill/icon/Image", slot0.talentSkill)
	slot0.lockTF = slot0:findTF("lock")
	slot0.commanderInfo = slot0:findTF("info")
	slot0.expPanel = slot0:findTF("exp", slot0.commanderInfo)
	slot0.commanderLevelTxt = slot0:findTF("exp/level", slot0.commanderInfo):GetComponent(typeof(Text))
	slot0.commanderExpImg = slot0:findTF("exp/Image", slot0.commanderInfo):GetComponent(typeof(Image))
	slot0.commanderNameTxt = slot0:findTF("name_bg/content/Text", slot0.commanderInfo):GetComponent(typeof(Text))
	slot0.modifyNameBtn = slot0:findTF("name_bg/content/modify", slot0.commanderInfo)

	setActive(slot0.modifyNameBtn, pg.gameset.commander_rename_open.key_value == 1)

	slot0.fleetTF = slot0:findTF("line/fleet", slot0.commanderInfo)
	slot0.leisureTF = slot0:findTF("line/leisure", slot0.commanderInfo)
	slot0.labelInBattleTF = slot0:findTF("line/inbattle", slot0.commanderInfo)
	slot0.rarityImg = slot0:findTF("rarity", slot0.commanderInfo):GetComponent(typeof(Image))
	slot0.abilityTF = slot0:findTF("ablitys", slot0.commanderInfo)
	slot0.skillBtn = slot0:findTF("skill_btn", slot0.commanderInfo)
	slot0.additionBtn = slot0:findTF("addition_btn", slot0.commanderInfo)
	slot0.blurPanel = slot0._parentTf.parent
	slot0.blurPanelParent = slot0.blurPanel.parent
	slot0.isOnSkill = false

	onToggle(slot0, slot0.skillBtn, function (slot0)
		slot0.isOnSkill = slot0

		slot0:Blur()
	end, SFX_PANEL)

	slot0.isOnAddition = false

	onToggle(slot0, slot0.additionBtn, function (slot0)
		slot0.isOnAddition = slot0
		slot0.statement.localScale = (slot0 and Vector3(1, 1, 1)) or Vector3(1, 0, 1)

		slot0:Blur()
	end, SFX_PANEL)
	onButton(slot0, slot0.modifyNameBtn, function ()
		if not slot0.commanderVO:canModifyName() then
			slot0:emit(CommandRoomMediator.SHOW_MSGBOX, {
				content = i18n("commander_rename_coldtime_tip", slot0:getRenameTimeDesc())
			})
		else
			slot0:emit(CommandRoomMediator.OPEN_RENAME_PANEL, slot0)
		end
	end, SFX_PANEL)
	slot0:Hide()

	slot0.blurFlag = false
end

function slot0.updateLockState(slot0)
	setActive(slot0.lockTF:Find("image"), slot0.commanderVO:getLock() == 0)
	onButton(slot0, slot0.lockTF, function ()
		slot1:emit(CommandRoomMediator.ON_LOCK, slot1.commanderVO.id, 1 - slot0)
	end, SFX_PANEL)
end

function slot0.HideExp(slot0)
	setActive(slot0.expPanel, false)
end

function slot0.Blur(slot0)
	function slot1(slot0)
		slot0.blurFlag = slot0

		if slot0 then
			pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanel)
		else
			pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0.blurPanelParent)
		end
	end

	if slot0.isOnAddition or slot0.isOnSkill then
		slot1(true)
	else
		slot1(false)
	end
end

function slot0.onPaintingView(slot0)
	if slot0.blurFlag then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0.blurPanelParent)
	end
end

function slot0.onExitPaintingView(slot0)
	if slot0.blurFlag then
		pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanel)
	end
end

function slot0.Update(slot0, slot1, slot2)
	slot0.commanderVO = slot1
	slot0.newCommander = slot2

	slot0:UpdateInfo()
	slot0:updateTalents()
	slot0:updateSkills()
	slot0:updateLockState()
	slot0:updatePreView(nil)
	slot0._tf:SetAsFirstSibling()
	slot0:Show()
end

function slot0.updatePreView(slot0, slot1)
	slot0:updateAbilitys(slot1)
	slot0:updatePreviewAddition(slot1)
	slot0:UpdateLevel(slot1)
end

function slot0.updatePreviewAddition(slot0, slot1)
	slot0:updateAbilityAddition(slot1)
	slot0:updateTalentAddition(slot1)
end

function slot0.UpdateInfo(slot0)
	LoadImageSpriteAsync("CommanderRarity/" .. slot2, slot0.rarityImg, true)

	if slot0.commanderVO.fleetId then
		eachChild(slot0.fleetTF, function (slot0)
			setActive(slot0, go(slot0).name == tostring(slot0.fleetId))
		end)
	end

	setActive(slot0.fleetTF, slot1.fleetId and not slot1.inBattle)
	setActive(slot0.leisureTF, not slot1.inFleet and not slot1.inBattle)
	setActive(slot0.labelInBattleTF, slot1.inBattle)

	slot0.commanderNameTxt.text = slot1:getName()
end

function slot0.UpdateLevel(slot0, slot1)
	slot0.commanderLevelTxt.text = setColorStr("LV." .. slot1 or slot0.commanderVO.level, (slot1 and slot0.commanderVO.level < slot1.level and COLOR_GREEN) or COLOR_WHITE)

	if slot2:isMaxLevel() then
		slot0.commanderExpImg.fillAmount = 1
	else
		slot0.commanderExpImg.fillAmount = slot2.exp / slot2:getNextLevelExp()
	end
end

function slot0.updateAbilitys(slot0, slot1)
	slot3 = slot0.commanderVO.getAbilitys(slot2)
	slot4 = nil

	if slot1 then
		slot4 = slot1:getAbilitys()
	end

	for slot8, slot9 in pairs(slot3) do
		slot10 = slot0.abilityTF:Find(slot8)
		slot11 = nil

		if slot4 and slot4[slot8].value - slot9.value <= 0 then
			slot11 = nil
		end

		setText(slot13, slot9.value)
		setText(slot10:Find("add"), (slot11 and setColorStr("+" .. slot11, COLOR_GREEN)) or " ")
	end
end

function slot0.updateAbilityAddition(slot0, slot1)
	slot3 = slot0.commanderVO.getAbilitysAddition(slot2)
	slot4 = nil

	if slot1 then
		slot4 = slot1:getAbilitysAddition()
	end

	slot5 = 0

	for slot9, slot10 in pairs(slot3) do
		if slot10 > 0 then
			slot11 = slot0.abilityAdditionTF:GetChild(slot5)

			GetImageSpriteFromAtlasAsync("attricon", slot9, slot11:Find("bg/icon"), false)
			setText(slot11:Find("bg/name"), AttributeType.Type2Name(slot9))

			slot12 = string.format("%0.3f", slot10)

			setText(slot11:Find("bg/value"), "+" .. math.floor(slot10 * 1000) / 1000 .. "%")
			setActive(slot11:Find("up"), slot10 < ((slot4 and slot4[slot9]) or slot10))
			setActive(slot11:Find("down"), ((slot4 and slot4[slot9]) or slot10) < slot10)

			slot5 = slot5 + 1
		end
	end
end

function slot0.updateTalents(slot0)
	function slot1(slot0, slot1)
		setText(slot1:Find("Text"), slot0:getConfig("name"))
		GetImageSpriteFromAtlasAsync("CommanderTalentIcon/" .. slot0:getConfig("icon"), "", slot1)
	end

	slot0.talentList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0(slot1[slot1 + 1], slot2)
			onButton(slot2, slot2, function ()
				slot0:emit(CommandRoomMediator.ON_TREE_MSGBOX, slot1[slot2 + 1])
			end, SFX_PANEL)
		end
	end)
	slot0.talentList:align(#slot0.commanderVO.getTalents(slot2))
end

function slot0.updateTalentAddition(slot0, slot1)
	slot2 = slot0.commanderVO
	slot3 = nil

	if slot1 then
		slot3 = _.values(slot1:getTalentsDesc())
	end

	slot0.talentAdditionList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot0[slot1 + 1]

			if not slot1.talentAdditionTextList[slot1 + 1] then
				slot1.talentAdditionTextList[slot1 + 1] = ScrollTxt.New(findTF(slot2, "bg/name_mask"), findTF(slot2, "bg/name_mask/name"), true)
			end

			slot1.talentAdditionTextList[slot1 + 1]:setText(slot3.name)
			setText(slot2:Find("bg/value"), ((slot3.value > 0 and "+") or "") .. slot3.value .. ((slot3.type == CommanderConst.TALENT_ADDITION_RATIO and "%") or ""))
			setActive(slot2:Find("up"), slot3.value < ((slot2 and slot2[slot1 + 1] and slot2[slot1 + 1].value) or slot3.value))
			setActive(slot2:Find("down"), ((slot2 and slot2[slot1 + 1] and slot2[slot1 + 1].value) or slot3.value) < slot3.value)

			slot2:Find("bg"):GetComponent(typeof(Image)).enabled = slot1 % 2 ~= 0
		end
	end)
	slot0.talentAdditionList:align(#_.values(slot2:getTalentsDesc()))
end

function slot0.updateSkills(slot0)
	GetImageSpriteFromAtlasAsync("commanderskillicon/" .. slot0.commanderVO.getSkills(slot1)[1].getConfig(slot3, "icon"), "", slot0.skillIcon)
	onButton(slot0, slot0.skillIcon, function ()
		slot0:emit(CommandRoomMediator.ON_CMD_SKILL, slot0)
	end)
end

function slot0.ToggleOn(slot0)
	triggerToggle(slot0.skillBtn, true)
	triggerToggle(slot0.additionBtn, true)
	setActive(slot0.lockTF, false)
end

function slot0.tweenHide(slot0, slot1)
	LeanTween.moveY(rtf(slot0._tf), -1100, slot1)
end

function slot0.tweenShow(slot0, slot1)
	LeanTween.moveY(rtf(slot0._tf), 0, slot1)
end

function slot0.OnDestroy(slot0)
	if slot0.blurFlag then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0.blurPanelParent)
	end
end

return slot0