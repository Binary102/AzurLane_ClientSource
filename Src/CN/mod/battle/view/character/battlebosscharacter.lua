ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = class("BattleBossCharacter", ys.Battle.BattleEnemyCharacter)
ys.Battle.BattleBossCharacter = slot2
slot2.__name = "BattleBossCharacter"

function slot2.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot2.Dispose(slot0)
	if not slot0._chargeTimer.paused then
		slot0._chargeTimer:Stop()
	end

	if slot0._castClock then
		slot0._castClock:Dispose()

		slot0._castClock = nil
	end

	LeanTween.cancel(slot0._HPBar)
	slot0.super.Dispose(slot0)
end

function slot2.Update(slot0)
	slot0.super.Update(slot0)
	slot0:UpdateCastClockPosition()

	if slot0._armor then
		slot0:UpdateCastClock()
	end
end

function slot2.UpdateVigilantBarPosition(slot0)
	slot0._vigilantBar:UpdateVigilantBarPosition(slot0._referenceVector + slot0._hpBarOffset)
end

function slot2.RegisterWeaponListener(slot0, slot1)
	slot0.super.RegisterWeaponListener(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot1.WEAPON_INTERRUPT, slot0.onWeaponInterrupted)
end

function slot2.UnregisterWeaponListener(slot0, slot1)
	slot0.super.UnregisterWeaponListener(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot1.WEAPON_INTERRUPT)
end

function slot2.AddHPBar(slot0, slot1, slot2)
	slot0._HPBar = slot1
	slot0._HPBarTf = slot1.transform

	slot1:SetActive(true)
	slot0._unitData:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.OnUpdateHP)

	slot0._HPBarCountText = slot0._HPBarTf.Find(slot3, "HPBarCount"):GetComponent(typeof(Text))
	slot0._activeVernier = slot2

	slot0:SetTemplateInfo()
	slot0:initBarComponent()
	slot0:SetHPBarCountText()

	slot0._cacheHP = slot0._unitData:GetCurrentHP()

	slot0:UpdateHpBar()
end

function slot2.SetTemplateInfo(slot0)
	slot2 = ""

	if slot0._unitData:GetTemplate() then
		slot2 = slot1.name
	end

	slot0._HPBarTf:Find("BossName"):GetComponent(typeof(Text)).text = slot2
	slot0._HPBarTf:Find("BossLv"):GetComponent(typeof(Text)).text = "Lv." .. slot0._unitData:GetLevel()

	setImageSprite(slot0._HPBarTf:Find("BossIcon/typeIcon/icon"), slot4, true)
	setImageSprite(findTF(slot0._HPBarTf, "BossIcon/icon"), slot6)

	slot0._armorBar = slot0._HPBarTf:Find("ArmorBar")
	slot0._armorProgress = slot0._HPBarTf:Find("ArmorBar/armorProgress"):GetComponent(typeof(Image))

	SetActive(slot0._armorBar, false)

	slot0._gizmos = slot0._HPBarTf:Find("gizmos")

	SetActive(slot0._gizmos, true)
end

function slot2.SetBossData(slot0, slot1)
	slot0._bossBarInfoList = {}
	slot0._HPBarTotalCount = slot1.hpBarNum or 1
	slot0._bossIcon = slot0:GetUnitData():GetTemplate().icon
	slot0._bossIndex = slot1.bossCount
end

function slot2.GetBossIndex(slot0)
	return slot0._bossIndex
end

function slot2.initBarComponent(slot0)
	slot1 = 1
	slot0._stepHP = slot0:GetUnitData():GetMaxHP() / slot0._HPBarTotalCount
	slot3 = 1
	slot4 = 5
	slot5 = {}

	while slot3 <= slot4 do
		slot9 = slot0._HPBarTf:Find(slot7)
		slot10 = slot0._HPBarTf:Find(slot8)
		({
			progressImage = slot9:GetComponent(typeof(Image)),
			deltaImage = slot10:GetComponent(typeof(Image)),
			progressTF = slot9.transform,
			deltaTF = slot10.transform
		})["progressImage"].fillAmount = 1
		()["deltaImage"].fillAmount = 1
		slot5[slot3] = 
		slot3 = slot3 + 1
	end

	slot0._topBarIndex = slot0._HPBarTf.childCount - 1

	while slot1 <= slot0._HPBarTotalCount do
		if math.fmod(slot1, slot4) == 0 then
			slot6 = slot4
		end

		slot0._bossBarInfoList[slot1] = {
			upperBound = slot1 * slot0._stepHP,
			lowerBound = ()["upperBound"] - slot0._stepHP,
			progressImage = slot5[slot6].progressImage,
			deltaImage = slot5[slot6].deltaImage,
			progressTF = slot5[slot6].progressTF,
			deltaTF = slot5[slot6].deltaTF
		}
		slot1 = slot1 + 1
	end

	if slot0._HPBarTotalCount < 5 then
		while slot1 <= 5 do
			SetActive(slot0._HPBarTf:Find(slot6), false)
			SetActive(slot0._HPBarTf:Find(slot6 .. "_delta"), false)

			slot1 = slot1 + 1
		end
	else
		if math.fmod(slot0._HPBarTotalCount, slot4) == 0 then
			slot6 = slot4
		end

		slot7 = slot4

		while slot6 < slot7 do
			slot0._HPBarTf:Find(slot8).transform:SetSiblingIndex(0)
			slot0._HPBarTf:Find(slot8 .. "_delta").transform:SetSiblingIndex(0)

			slot7 = slot7 - 1
		end
	end

	if slot0._activeVernier then
		slot0._vernier = slot0._HPBarTf:Find("vernier/tag")

		SetActive(slot0._HPBarTf:Find("vernier"), slot0._activeVernier)
	end

	slot0._currentIndex = #slot0._bossBarInfoList
	slot0._chargeTimer = Timer.New(function ()
		slot0._currentTween = slot0:generateTween()
	end, 1)
end

function slot2.UpdateHpBar(slot0)
	if slot0._cacheHP == slot0._unitData:GetCurrentHP() then
		return
	end

	if not slot0._chargeTimer.paused then
		slot0._chargeTimer:Stop()
		slot0._chargeTimer:Stop()
		slot0._chargeTimer:Reset()
	end

	slot2 = slot0._bossBarInfoList[slot0._currentIndex]

	if slot1 < slot0._cacheHP then
		slot3 = nil

		while slot1 < slot2.lowerBound do
			if slot0._currentIndex > 5 then
				slot2.progressImage.fillAmount = 1
				slot2.deltaImage.fillAmount = 1

				slot2.progressTF:SetSiblingIndex(0)
				slot2.deltaTF:SetSiblingIndex(0)
			else
				SetActive(slot2.progressImage, false)
				SetActive(slot2.deltaImage, false)
			end

			slot0._currentIndex = slot0._currentIndex - 1
			slot2 = slot0._bossBarInfoList[slot0._currentIndex]
			slot3 = true
		end

		if slot3 then
			LeanTween.cancel(slot0._HPBar)
		end

		slot0._chargeTimer:Start()
	elseif slot0._cacheHP < slot1 then
		while slot2.upperBound < slot1 do
			slot2.progressImage.fillAmount = 1
			slot2.deltaImage.fillAmount = 1
			slot0._currentIndex = slot0._currentIndex + 1
			slot2 = slot0._bossBarInfoList[slot0._currentIndex]

			if slot0._currentIndex > 5 then
				slot2.deltaTF:SetSiblingIndex(slot0._topBarIndex)
				slot2.progressTF:SetSiblingIndex(slot0._topBarIndex)
			else
				SetActive(slot2.progressImage, true)
				SetActive(slot2.deltaImage, true)
			end
		end
	end

	slot2.progressImage.fillAmount = (slot1 - slot2.lowerBound) / slot0._stepHP

	if slot0._activeVernier then
		slot0._vernier.anchorMin = Vector2(slot3, 0.5)
		slot0._vernier.anchorMax = Vector2(slot3, 0.5)
	end

	if slot0._cacheHP < slot1 then
		slot2.deltaImage.fillAmount = slot3
	end

	slot0:SetHPBarCountText()

	slot0._cacheHP = slot1
end

function slot2.generateTween(slot0, slot1, slot2)
	slot4 = slot0._bossBarInfoList[slot0._currentIndex].deltaImage

	if not slot1 then
		slot1 = slot3.progressImage.fillAmount
	end

	slot2 = slot2 or 0.7

	return LeanTween.value(go(slot0._HPBar), slot4.fillAmount, slot1, slot2 or 0.7):setOnUpdate(System.Action_float(function (slot0)
		slot0.fillAmount = slot0

		return
	end))

	slot2 = 0.7
end

function slot2.SetHPBarCountText(slot0)
	slot0._HPBarCountText.text = "X " .. slot0._currentIndex

	return
end

function slot2.UpdateHPBarPostition(slot0)
	return
end

function slot2.onWeaponPreCast(slot0, slot1)
	slot0.super.onWeaponPreCast(slot0, slot1)
	slot0:initArmorBar(slot1.Data.armor)

	if slot1.Data.armor and slot3 ~= 0 then
		slot0:initCastClock(slot2.time, slot1.Dispatcher)
	end

	return
end

function slot2.onWeaponPrecastFinish(slot0, slot1)
	slot0.super.onWeaponPrecastFinish(slot0, slot1)

	slot3 = slot1.Data.armor

	if slot0._castClock:GetCastingWeapon() == slot1.Dispatcher and slot3 and slot3 ~= 0 then
		if slot0._armor <= 0 then
			slot0._castClock:Interrupt(true)
		else
			slot0._castClock:Interrupt(false)
		end

		slot0._armor = nil

		SetActive(slot0._armorBar, false)
		SetActive(slot0._gizmos, true)
	end

	return
end

function slot2.onWeaponInterrupted(slot0, slot1)
	slot0._unitData:StateChange(slot0.Battle.UnitState.STATE_INTERRUPT)

	return
end

function slot2.initArmorBar(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		slot0._armor = slot1
		slot0._totalArmor = slot1

		slot0:updateWeaponArmor(slot1)
		SetActive(slot0._armorBar, true)
		SetActive(slot0._gizmos, false)
	end

	return
end

function slot2.OnUpdateHP(slot0, slot1)
	slot0.super.OnUpdateHP(slot0, slot1)

	slot2 = slot1.Data.dHP

	if slot0._armor and slot2 < 0 then
		slot0._armor = slot0._armor + slot2

		slot0:updateWeaponArmor(slot0._armor)
	end

	return
end

function slot2.updateWeaponArmor(slot0, slot1)
	slot0._armorProgress.fillAmount = slot0._armor / slot0._totalArmor

	return
end

function slot2.initCastClock(slot0, slot1, slot2)
	slot0._castClock:Casting(slot1, slot2)

	slot0._castFinishTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot1
	slot0._castDuration = slot1

	return
end

function slot2.UpdateCastClock(slot0)
	slot0._castClock:UpdateCastClock()

	return
end

function slot2.updateComponentDiveInvisible(slot0)
	slot0.super.updateComponentDiveInvisible(slot0)
	SetActive(slot0._HPBarTf, true)

	return
end

return
