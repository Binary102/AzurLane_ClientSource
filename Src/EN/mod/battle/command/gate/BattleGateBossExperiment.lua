slot0 = class("BattleGateBossExperiment")
ys.Battle.BattleGateBossExperiment = slot0
slot0.__name = "BattleGateBossExperiment"

function slot0.Entrance(slot0, slot1)
	slot1:sendNotification(GAME.BEGIN_STAGE_DONE, {
		mainFleetId = slot0.mainFleetId,
		actId = slot0.actID,
		prefabFleet = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot5).fleet_prefab,
		stageId = slot0.stageId,
		system = SYSTEM_BOSS_EXPERIMENT
	})
end

function slot0.Exit(slot0, slot1)
	slot1:sendNotification(GAME.FINISH_STAGE_DONE, {
		system = SYSTEM_BOSS_EXPERIMENT,
		statistics = slot0.statistics,
		score = ys.Battle.BattleConst.BattleScore.S,
		drops = drops,
		commanderExps = {},
		extraDrops = extraDrops
	})
end

return slot0
