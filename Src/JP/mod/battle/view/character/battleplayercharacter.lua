ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleConfig
slot3 = ys.Battle.BattleConst
slot4 = class("BattlePlayerCharacter", ys.Battle.BattleCharacter)
ys.Battle.BattlePlayerCharacter = slot4
slot4.__name = "BattlePlayerCharacter"

function slot4.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot4.SetUnitData(slot0, slot1)
	slot0.super.SetUnitData(slot0, slot1)

	slot0._chargeWeaponList = {}

	for slot5, slot6 in ipairs(slot1:GetChargeList()) do
		slot0:InitChargeWeapon(slot6)
	end

	slot0._torpedoWeaponList = {}

	for slot5, slot6 in ipairs(slot1:GetTorpedoList()) do
		slot0:InitTorpedoWeapon(slot6)
	end

	slot0._airAssistList = {}

	if slot1:GetAirAssistList() ~= nil then
		for slot6, slot7 in ipairs(slot2) do
			slot0:InitAirAssit(slot7)
		end
	end
end

function slot4.AddUnitEvent(slot0)
	slot0.super.AddUnitEvent(slot0)
	slot0._unitData:RegisterEventListener(slot0, slot1.WILL_DIE, slot0.onWillDie)
	slot0._unitData:RegisterEventListener(slot0, slot1.INIT_COOL_DOWN, slot0.onInitWeaponCD)
end

function slot4.RemoveUnitEvent(slot0)
	for slot4, slot5 in ipairs(slot0._chargeWeaponList) do
		slot5:UnregisterEventListener(slot0, slot0.CHARGE_WEAPON_FINISH)
		slot0:UnregisterWeaponListener(slot5)
	end

	for slot4, slot5 in ipairs(slot0._torpedoWeaponList) do
		slot5:UnregisterEventListener(slot0, slot0.TORPEDO_WEAPON_FIRE)
		slot5:UnregisterEventListener(slot0, slot0.TORPEDO_WEAPON_PREPAR)
		slot5:UnregisterEventListener(slot0, slot0.TORPEDO_WEAPON_CANCEL)
		slot5:UnregisterEventListener(slot0, slot0.TORPEDO_WEAPON_READY)
		slot0:UnregisterWeaponListener(slot5)
	end

	for slot4, slot5 in ipairs(slot0._airAssistList) do
		slot5:UnregisterEventListener(slot0, slot0.CHARGE_WEAPON_FINISH)
		slot5:UnregisterEventListener(slot0, slot0.FIRE)
	end

	slot0._unitData:UnregisterEventListener(slot0, slot0.WILL_DIE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.INIT_COOL_DOWN)
	slot0._unitData.UnregisterEventListener.super.RemoveUnitEvent(slot0)
end

function slot4.Update(slot0)
	slot0.super.Update(slot0)
	slot0:UpdatePosition()
	slot0:UpdateMatrix()

	if not slot0._inViewArea or not slot0._alwaysHideArrow then
		slot0:UpdateArrowBarPostition()
	end

	if slot0._unitData:GetOxyState() then
		slot0:UpdateOxygenBar()
	end
end

function slot4.UpdateOxygenBar(slot0)
	slot0._oxygenSlider.value = slot0._unitData:GetOxygenProgress()
end

function slot4.UpdateVectorBar(slot0)
	slot0._vectorProgress.fillAmount = slot0._unitData:GetHPRate()
end

function slot4.AddArrowBar(slot0, slot1)
	slot0.super.AddArrowBar(slot0, slot1)

	slot0._vectorProgress = slot0._arrowBarTf:Find("HPBar/HPProgress"):GetComponent(typeof(Image))

	setImageSprite(findTF(slot0._arrowBar, "icon"), slot1.Battle.BattleResourceManager.GetInstance().GetCharacterQIcon(slot2, slot0._unitData:GetTemplate().painting))

	if slot0._unitData:IsMainFleetUnit() and slot0._unitData:GetFleetVO().GetMainList(slot4)[3] == slot0._unitData then
		slot1.transform:SetSiblingIndex(slot1.transform.parent.childCount - 3)
	end

	slot0:UpdateVectorBar()
end

function slot4.GetReferenceVector(slot0, slot1)
	if slot0._inViewArea then
		return slot0.super.GetReferenceVector(slot0, slot1)
	else
		return slot0._arrowVector
	end
end

function slot4.DisableWeaponTrack(slot0)
	if slot0._torpedoTrack then
		slot0._torpedoTrack:SetActive(false)
	end
end

function slot4.SonarAcitve(slot0, slot1)
	if slot0.Battle.BattleAttr.HasSonar(slot0._unitData) then
		slot0._sonar:GetComponent(typeof(Animator)).enabled = slot1
	end
end

function slot4.UpdateDiveInvisible(slot0)
	slot0.super.UpdateDiveInvisible(slot0)
	SetActive(slot0._diveMark, slot1)
	SetActive(slot0._oxygenBar, slot0._unitData:GetOxygenVisible())
end

function slot4.Dispose(slot0)
	slot0._torpedoIcons = nil
	slot0._renderer = nil
	slot0._sonar = nil
	slot0._diveMark = nil
	slot0._oxygenBar = nil
	slot0._oxygenSlider = nil

	Object.Destroy(slot0._arrowBar)
	slot0.super.Dispose(slot0)
end

function slot4.GetModleID(slot0)
	return slot0._unitData:GetTemplate().prefab
end

function slot4.OnUpdateHP(slot0, slot1)
	slot0.super.OnUpdateHP(slot0, slot1)
	slot0:UpdateVectorBar()
end

function slot4.onInitWeaponCD(slot0, slot1)
	slot0:onTorepedoReady()
end

function slot4.onCastBlink(slot0, slot1)
	slot0:AddFX("jineng", false, slot1.Data.timeScale, slot1.Data.callbackFunc)
end

function slot4.onTorpedoWeaponFire(slot0, slot1)
	slot0._torpedoTrack:SetActive(false)
	slot0:onTorepedoReady()
end

function slot4.onTorpedoPrepar(slot0, slot1)
	slot0._torpedoTrack:SetActive(true)
	slot0._torpedoTrack:SetScale(Vector3(slot0.Battle.BattleDataFunction.GetBulletTmpDataFromID(slot1.Dispatcher:GetTemplateData().bullet_ID[1]).range / slot1.SPINE_SCALE, slot0.Battle.BattleDataFunction.GetBulletTmpDataFromID(slot1.Dispatcher.GetTemplateData().bullet_ID[1]).cld_box[3] / slot1.SPINE_SCALE, 1))
end

function slot4.onTorpedoCancel(slot0, slot1)
	slot0._torpedoTrack:SetActive(false)
end

function slot4.onTorepedoReady(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0._torpedoWeaponList) do
		if slot7:GetCurrentState() == slot7.STATE_READY then
			slot2 = slot2 + 1
		end
	end

	for slot6 = 1, slot0.Battle.BattleConst.MAX_EQUIPMENT_COUNT, 1 do
		LuaHelper.SetTFChildActive(slot0._torpedoIcons, "torpedo_" .. slot6, slot6 <= slot2)
	end
end

function slot4.onWillDie(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._smokeList) do
		if slot6.active == true then
			slot6.active = false

			for slot11, slot12 in pairs(slot7) do
				if slot11.unInitialize then
				else
					SetActive(slot12, false)
				end
			end
		end
	end
end

function slot4.SetSkeletonAutoCalcComplex(slot0)
	if slot0._animator then
		slot0._animator.autoCalcComplex = false
	end
end

function slot4.AddHPBar(slot0, slot1)
	slot0.super.AddHPBar(slot0, slot1)

	slot0._torpedoIcons = slot0._HPBarTf:Find("torpedoIcons")

	if #slot0._torpedoWeaponList <= 0 then
		slot0._torpedoIcons.gameObject:SetActive(false)
	end

	slot0._sonar = slot0._HPBarTf:Find("sonarMark")

	if slot1.Battle.BattleAttr.HasSonar(slot0._unitData) then
		slot0._sonar.gameObject:SetActive(true)
	else
		slot0._sonar.gameObject:SetActive(false)
	end

	slot0._diveMark = slot0._HPBarTf:Find("diveMark")
	slot0._oxygenBar = slot0._HPBarTf:Find("oxygenBar")
	slot0._oxygenSlider = slot0._oxygenBar:Find("oxygen"):GetComponent(typeof(Slider))
	slot0._oxygenSlider.value = 1

	slot0:onTorepedoReady()
end

function slot4.AddModel(slot0, slot1)
	slot0.super.AddModel(slot0, slot1)

	slot0._renderer = slot0:GetTf():GetComponent(typeof(Renderer))
end

function slot4.AddChargeArea(slot0, slot1)
	slot0._chargeWeaponArea = slot0.Battle.BattleChargeArea.New(slot1)
end

function slot4.AddTorpedoTrack(slot0, slot1)
	slot0._torpedoTrack = slot0.Battle.BossSkillAlert.New(slot1)

	slot0._torpedoTrack:SetActive(false)
end

function slot4.InitChargeWeapon(slot0, slot1)
	slot0._chargeWeaponList[#slot0._chargeWeaponList + 1] = slot1

	slot0:RegisterWeaponListener(slot1)
	slot1:RegisterEventListener(slot0, slot0.CHARGE_WEAPON_FINISH, slot0.onCastBlink)
end

function slot4.InitAirAssit(slot0, slot1)
	slot0._airAssistList[#slot0._airAssistList + 1] = slot1

	slot1:RegisterEventListener(slot0, slot0.CHARGE_WEAPON_FINISH, slot0.onCastBlink)
	slot1:RegisterEventListener(slot0, slot0.FIRE, slot0.onCannonFire)
end

function slot4.InitTorpedoWeapon(slot0, slot1)
	slot0._torpedoWeaponList[#slot0._torpedoWeaponList + 1] = slot1

	slot0:RegisterWeaponListener(slot1)
	slot1:RegisterEventListener(slot0, slot0.TORPEDO_WEAPON_FIRE, slot0.onTorpedoWeaponFire)
	slot1:RegisterEventListener(slot0, slot0.TORPEDO_WEAPON_PREPAR, slot0.onTorpedoPrepar)
	slot1:RegisterEventListener(slot0, slot0.TORPEDO_WEAPON_CANCEL, slot0.onTorpedoCancel)
	slot1:RegisterEventListener(slot0, slot0.TORPEDO_WEAPON_READY, slot0.onTorepedoReady)
end

function slot4.OnAnimatorTrigger(slot0)
	slot0._unitData:CharacterActionTriggerCallback()
end

function slot4.OnAnimatorEnd(slot0)
	slot0._unitData:CharacterActionEndCallback()
end

function slot4.OnAnimatorStart(slot0)
	slot0._unitData:CharacterActionStartCallback()
end

return
