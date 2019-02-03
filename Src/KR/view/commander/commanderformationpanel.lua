slot0 = class("CommanderFormationPanel", import("..base.BasePanel"))

function slot0.init(slot0)
	slot0.samllTF = slot0:findTF("small")
	slot0.pos1 = slot0:findTF("small/commander1", slot0.topPanel)
	slot0.pos2 = slot0:findTF("small/commander2", slot0.topPanel)
	slot0.descPanel = slot0:findTF("desc")
	slot0.descFrameTF = slot0:findTF("desc/frame")
	slot0.descPos1 = slot0:findTF("commander1/frame/info", slot0.descFrameTF)
	slot0.descPos2 = slot0:findTF("commander2/frame/info", slot0.descFrameTF)
	slot0.skillTFPos1 = slot0:findTF("commander1/skill_info", slot0.descFrameTF)
	slot0.skillTFPos2 = slot0:findTF("commander2/skill_info", slot0.descFrameTF)
	slot0.abilitysTF = UIItemList.New(slot0:findTF("atttr_panel/abilitys/mask/content", slot0.descFrameTF), slot0:findTF("atttr_panel/abilitys/mask/content/attr", slot0.descFrameTF))
	slot0.talentsTF = UIItemList.New(slot0:findTF("atttr_panel/talents/mask/content", slot0.descFrameTF), slot0:findTF("atttr_panel/talents/mask/content/attr", slot0.descFrameTF))
	slot0.talentsTextList = {}
	slot0.abilityArr = slot0:findTF("desc/frame/atttr_panel/abilitys/arr")
	slot0.talentsArr = slot0:findTF("desc/frame/atttr_panel/talents/arr")
	slot0.btn = slot0:findTF("desc/Button")

	setActive(slot0.btn, Application.isEditor)
end

function slot0.update(slot0, slot1)
	slot0.fleet = slot1
	slot2 = slot0.fleet:getCommanders()

	for slot6 = 1, CommanderConst.MAX_FORMATION_POS, 1 do
		slot0:updateCommander(slot0["pos" .. slot6], slot6, slot2[slot6])
	end

	if slot0.parent.contextData.inDescPage then
		slot0:openDescPanel(0, function ()
			slot0:updateDesc()
		end)
	end
end

function slot0.attach(slot0, slot1)
	slot0.super.attach(slot0, slot1)
	onButton(slot0, slot0.btn, function ()
		slot1 = slot0.fleet:getCommanders()

		for slot5, slot6 in ipairs(slot0) do
			slot7 = getProxy(BayProxy):getShipById(slot6)
			slot9 = slot7:getName() .. "\n"

			for slot13, slot14 in pairs(slot8) do
				slot9 = slot9 .. slot13 .. ":" .. slot14 .. "\n"
			end

			print(slot9)
		end
	end)
	onButton(slot0, slot0.samllTF, function ()
		slot0:openDescPanel(0.2, function ()
			slot0:updateDesc()
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.descPanel, function ()
		slot0:closeDescPanel()
	end, SFX_PANEL)
end

function slot0.openDescPanel(slot0, slot1, slot2)
	slot3 = slot1 or 0.2

	if LeanTween.isTweening(go(slot0.samllTF)) or LeanTween.isTweening(go(slot0.descFrameTF)) then
		return
	end

	LeanTween.moveX(slot0.samllTF, 204, slot3):setFrom(0):setOnComplete(System.Action(function ()
		setActive(slot0.descPanel, true)
		LeanTween.moveX(slot0.descFrameTF, 0, ):setFrom(574):setOnComplete(System.Action(System.Action))
	end))

	slot0.parent.contextData.inDescPage = true

	slot0._tf:SetAsLastSibling()
end

function slot0.closeDescPanel(slot0, slot1)
	slot2 = slot1 or 0.2

	if LeanTween.isTweening(go(slot0.samllTF)) or LeanTween.isTweening(go(slot0.descFrameTF)) then
		return
	end

	LeanTween.moveX(slot0.descFrameTF, 574, slot2):setFrom(0):setOnComplete(System.Action(function ()
		setActive(slot0.descPanel, false)
		LeanTween.moveX(slot0.samllTF, 0, ):setFrom(204)
	end))

	slot0.parent.contextData.inDescPage = false
end

function slot0.updateDesc(slot0)
	slot1 = slot0.fleet:getCommanders()

	for slot5 = 1, CommanderConst.MAX_FORMATION_POS, 1 do
		slot0:updateCommander(slot0["descPos" .. slot5], slot5, slot6, true)
		slot0:updateSkillTF(slot1[slot5], slot0["skillTFPos" .. slot5])
	end

	slot0:updateAdditions()
end

function slot0.updateAdditions(slot0)
	slot3, slot4 = slot0.fleet.getCommandersAddition(slot1)

	slot0.abilitysTF:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("name"), AttributeType.Type2Name(slot0[slot1 + 1].attrName))
			setText(slot2:Find("Text"), "+" .. math.floor(slot0[slot1 + 1].value * 1000) / 1000 .. "%")
			GetImageSpriteFromAtlasAsync("attricon", slot0[slot1 + 1].attrName, slot2:Find("icon"), false)
			setActive(slot2:Find("bg"), slot1 % 2 ~= 0)
		end
	end)
	slot0.abilitysTF:align(#slot3)
	setActive(slot0.abilityArr, #slot3 > 4)
	slot0.talentsTF:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot0[slot1 + 1]

			if not slot1.talentsTextList[slot1 + 1] then
				slot1.talentsTextList[slot1 + 1] = ScrollTxt.New(findTF(slot2, "name_mask"), findTF(slot2, "name_mask/name"), true)
			end

			slot1.talentsTextList[slot1 + 1]:setText(slot3.name)
			setText(slot2:Find("Text"), ((slot3.value > 0 and "+") or "") .. slot3.value .. ((slot3.type == CommanderConst.TALENT_ADDITION_RATIO and "%") or ""))
			setActive(slot2:Find("bg"), slot1 % 2 ~= 0)
		end
	end)
	slot0.talentsTF:align(#_.values(slot0.fleet.getCommandersTalentDesc(slot1)))
	setActive(slot0.talentsArr, #_.values(slot0.fleet.getCommandersTalentDesc(slot1)) > 4)
end

function slot0.updateSkillTF(slot0, slot1, slot2)
	setActive(slot2, slot1)

	if slot1 then
		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. slot1:getSkills()[1].getConfig(slot3, "icon"), "", slot2:Find("icon"))
		setText(slot2:Find("level"), "Lv." .. slot1.getSkills()[1].getLevel(slot3))
		onButton(slot0, slot2, function ()
			slot0.parent:emit(FormationMediator.ON_CMD_SKILL, slot0.parent)
		end, SFX_PANEL)

		return
	end

	removeOnButton(slot2)
end

function slot0.updateCommander(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1:Find("add")
	slot6 = slot1:Find("info")

	if slot3 then
		slot8 = slot1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot3:getPainting(), "", slot1:Find("info/mask/icon"))

		if slot1:Find("info/name") then
			setText(slot9, slot3:getName())
		end

		setImageSprite(slot8, GetSpriteFromAtlas("weaponframes", "commander_" .. Commander.rarity2Frame(slot3:getRarity())))
	end

	if slot4 then
		onButton(slot0, slot6, function ()
			slot0.parent:emit(FormationMediator.ON_SELECT_COMMANDER, slot0.parent, slot0.fleet.id)
		end, SFX_PANEL)
		onButton(slot0, slot5, function ()
			slot0.parent:emit(FormationMediator.ON_SELECT_COMMANDER, slot0.parent, slot0.fleet.id)
		end, SFX_PANEL)
	end

	setActive(slot5, not slot3)
	setActive(slot6, slot3)
end

function slot0.enable(slot0, slot1)
	setActive(slot0._go, slot1)
end

function slot0.clear(slot0)
	return
end

return slot0
