ys = ys or {}
slot1 = ys.Battle.BattleBulletEvent
slot2 = ys.Battle.BattleResourceManager
slot3 = class("BattleBombBullet", ys.Battle.BattleBullet)
ys.Battle.BattleBombBullet = slot3
slot3.__name = "BattleBombBullet"

function slot3.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot3.Dispose(slot0)
	if slot0._alert then
		slot0._alert:Dispose()
	end

	slot0.super.Dispose(slot0)
end

function slot3.AddBulletEvent(slot0)
	slot0._bulletData:RegisterEventListener(slot0, slot0.EXPLODE, slot0.onBulletExplode)
end

function slot3.RemoveBulletEvent(slot0)
	slot0._bulletData:UnregisterEventListener(slot0, slot0.EXPLODE)
end

function slot3.onBulletExplode(slot0, slot1)
	slot0:_bulletHitFunc()
end

return
