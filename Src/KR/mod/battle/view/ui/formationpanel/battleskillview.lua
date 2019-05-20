ys = ys or {}
slot1 = ys.Battle.BattleConfig
ys.Battle.BattleSkillView = class("BattleSkillView")
ys.Battle.BattleSkillView.__name = "BattleSkillView"

function ys.Battle.BattleSkillView.Ctor(slot0, slot1)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._mediator = slot1
	slot0._ui = slot1._ui

	slot0:InitBtns()
	slot0:EnableWeaponButton(false)
end

function ys.Battle.BattleSkillView.EnableWeaponButton(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._skillBtnList) do
		slot6:Enabled(slot1)
	end
end

function ys.Battle.BattleSkillView.DisableWeapnButton(slot0)
	for slot4, slot5 in ipairs(slot0._skillBtnList) do
		slot5:Disable()
	end
end

function ys.Battle.BattleSkillView.ShiftSubmarineManualButton(slot0, slot1)
	if slot1 == slot0.Battle.OxyState.STATE_FREE_FLOAT then
		slot0._diveBtn:SetActive(true)
		slot0._floatBtn:SetActive(false)
	elseif slot1 == slot0.Battle.OxyState.STATE_FREE_DIVE then
		slot0._diveBtn:SetActive(false)
		slot0._floatBtn:SetActive(true)
	end
end

function ys.Battle.BattleSkillView.InitBtns(slot0)
	slot0._skillBtnList = {}
	slot0._fleetVO = slot0._mediator._dataProxy:GetFleetByIFF(slot0.Battle.BattleConfig.FRIENDLY_CODE)
	slot0._chargeBtn = slot0.Battle.BattleWeaponButton.New()

	table.insert(slot0._skillBtnList, slot0._chargeBtn)
	slot0._chargeBtn:ConfigCallback(slot2, slot3, slot4, slot1)
	slot0:setSkillButtonPreferences(slot5, 1)
	slot0._chargeBtn:ConfigSkin(slot5)
	slot0._chargeBtn:SetTextActive(true)
	slot0._chargeBtn:SetProgressInfo(slot6)

	slot0._torpedoBtn = slot0.Battle.BattleWeaponButton.New()

	table.insert(slot0._skillBtnList, slot0._torpedoBtn)
	slot0._torpedoBtn:ConfigCallback(slot7, slot8, slot9, slot1)
	slot0:setSkillButtonPreferences(slot10, 2)
	slot0._torpedoBtn:ConfigSkin(slot10)
	slot0._torpedoBtn:SetTextActive(true)
	slot0._torpedoBtn:SetProgressInfo(slot11)

	slot0._airStrikeBtn = slot0.Battle.BattleWeaponButton.New()

	table.insert(slot0._skillBtnList, slot0._airStrikeBtn)
	slot0._airStrikeBtn:ConfigCallback(slot14, slot12, slot13, slot1)
	slot0:setSkillButtonPreferences(slot15, 3)
	slot0._airStrikeBtn:ConfigSkin(slot15)
	slot0._airStrikeBtn:SetTextActive(true)
	slot0._airStrikeBtn:SetProgressInfo(slot16)

	slot0._diveBtn = slot0.Battle.BattleSubmarineFuncButton.New()

	table.insert(slot0._skillBtnList, slot0._diveBtn)
	slot0._diveBtn:ConfigCallback(slot17, slot18, slot19, slot1)
	slot0._diveBtn:ConfigSkin(slot20)
	slot0._diveBtn:SetTextActive(true)
	slot0._diveBtn:SetProgressInfo(slot21)
	slot0._diveBtn:SetActive(false)

	slot0._floatBtn = slot0.Battle.BattleSubmarineFuncButton.New()

	table.insert(slot0._skillBtnList, slot0._floatBtn)
	slot0._floatBtn:ConfigCallback(slot22, slot23, slot24, slot1)
	slot0._floatBtn:ConfigSkin(slot25)
	slot0._floatBtn:SetTextActive(true)
	slot0._floatBtn:SetProgressInfo(slot26)
	slot0._floatBtn:SetActive(false)

	slot0._boostBtn = slot0.Battle.BattleSubmarineFuncButton.New()

	table.insert(slot0._skillBtnList, slot0._boostBtn)
	slot0._boostBtn:ConfigCallback(slot27, slot28, slot29, slot1)
	slot0._boostBtn:ConfigSkin(slot30)
	slot0._boostBtn:SetTextActive(true)
	slot0._boostBtn:SetProgressInfo(slot31)

	slot32 = slot0._ui:findTF("Skill_4")

	if not slot0._fleetVO._submarineVO:GetUseable() or slot33:GetCount() <= 0 then
		SetActive(slot32, false)
	else
		slot0._subStriveBtn = slot0.Battle.BattleSubmarineButton.New()

		table.insert(slot0._skillBtnList, slot0._subStriveBtn)
		slot0._subStriveBtn:ConfigCallback(slot36, slot34, slot35, slot1)
		slot0:setSkillButtonPreferences(slot32, 4)
		slot0._subStriveBtn:ConfigSkin(slot32)
		slot0._subStriveBtn:SetTextActive(true)
		slot0._subStriveBtn:SetProgressInfo(slot33)

		slot37 = slot32:GetComponent(typeof(Animator))

		slot32:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
			slot0.enabled = false
		end)
	end

	slot0._boostBtn:SetActive(false)
	slot0._diveBtn:SetActive(false)
	slot0._floatBtn:SetActive(false)
end

function ys.Battle.BattleSkillView.CustomButton(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0._skillBtnList[slot6]:SetActive(false)
	end
end

function ys.Battle.BattleSkillView.NormalButton(slot0)
	slot0._chargeBtn:SetActive(true)
	slot0._torpedoBtn:SetActive(true)
	slot0._airStrikeBtn:SetActive(true)
	slot0._boostBtn:SetActive(false)
	slot0._diveBtn:SetActive(false)
	slot0._floatBtn:SetActive(false)
end

function ys.Battle.BattleSkillView.SubmarineButton(slot0)
	slot0._chargeBtn:SetActive(false)
	slot0._torpedoBtn:SetActive(true)
	slot0._airStrikeBtn:SetActive(false)
	slot0._boostBtn:SetActive(true)
	slot0._diveBtn:SetActive(true)
	slot0._floatBtn:SetActive(true)

	slot0._torpedoBtn:GetSkin().transform.anchorMin = Vector2(slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[2].x, slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[2].y)
	slot0._torpedoBtn.GetSkin().transform.anchorMax = Vector2(slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[2].x, slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[2].y)
end

function ys.Battle.BattleSkillView.OnSkillCd(slot0, slot1)
	slot2 = slot1.Data.skillID

	if slot1.Data.coolDownTime < pg.TimeMgr.GetInstance():GetCombatTime() then
		return
	end

	slot0._skillCd[slot2] = slot3
end

function ys.Battle.BattleSkillView.Dispose(slot0)
	for slot4, slot5 in ipairs(slot0._skillBtnList) do
		slot5:Dispose()
	end

	slot0._ui = nil

	if _main_cannon_sound then
		slot0._main_cannon_sound:Stop(true)

		slot0._main_cannon_sound = nil
	end

	slot0.EventListener.DetachEventListener(slot0)
end

function ys.Battle.BattleSkillView.Update(slot0)
	for slot4, slot5 in ipairs(slot0._skillBtnList) do
		slot5:Update()
	end
end

function ys.Battle.BattleSkillView.setSkillButtonPreferences(slot0, slot1, slot2)
	slot1.transform.localScale = Vector3(slot4, slot4, 0)
	slot1.transform.anchorMin = Vector2(slot5, slot6)
	slot1.transform.anchorMax = Vector2(PlayerPrefs.GetFloat("skill_" .. slot2 .. "_anchorX", slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[slot2].x), PlayerPrefs.GetFloat("skill_" .. slot2 .. "_anchorY", slot0.SKILL_BUTTON_DEFAULT_PREFERENCE[slot2].y))
end

return
