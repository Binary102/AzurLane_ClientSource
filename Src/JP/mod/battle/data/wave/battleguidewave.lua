ys = ys or {}
ys.Battle.BattleGuideWave = class("BattleGuideWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleGuideWave.__name = "BattleGuideWave"

function ys.Battle.BattleGuideWave.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleGuideWave.SetWaveData(slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._event = slot0._param.event
end

function ys.Battle.BattleGuideWave.DoWave(slot0)
	slot0.super.DoWave(slot0)
	pg.GuideMgr2:GetInstance():dispatch({
		viewComponent = slot0.__cname,
		event = slot0._event,
		func = function ()
			slot0:doFinish()
		end
	})
end

return
