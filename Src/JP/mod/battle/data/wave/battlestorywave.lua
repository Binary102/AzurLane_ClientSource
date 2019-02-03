ys = ys or {}
ys.Battle.BattleStoryWave = class("BattleStoryWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleStoryWave.__name = "BattleStoryWave"

function ys.Battle.BattleStoryWave.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleStoryWave.SetWaveData(slot0, slot1)
	slot0.super.SetWaveData(slot0, slot1)

	slot0._storyID = slot0._param.id
end

function ys.Battle.BattleStoryWave.DoWave(slot0)
	slot0.super.DoWave(slot0)

	slot1 = true

	if slot0._param.progress then
		slot2 = getProxy(ChapterProxy):getActiveChapter()

		if math.min(slot2.progress + slot2:getConfig("progress_boss"), 100) < slot0._param.progress then
			slot1 = false
		end
	end

	if slot1 then
		gcAll()
		pg.StoryMgr.GetInstance():Play(slot0._storyID, function ()
			slot0:doFinish()
		end)
	else
		slot0:doFinish()
	end
end

return
