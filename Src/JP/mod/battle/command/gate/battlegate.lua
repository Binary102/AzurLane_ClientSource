slot0 = class("BattleGate")
ys.Battle.BattleGate = slot0
slot0.__name = "BattleGate"
slot0.Gates = {
	[SYSTEM_PROLOGUE] = ys.Battle.BattleGatePrologue,
	[SYSTEM_PERFORM] = ys.Battle.BattleGatePerform,
	[SYSTEM_SIMULATION] = ys.Battle.BattleGateSimulation,
	[SYSTEM_DODGEM] = ys.Battle.BattleGateDodgem,
	[SYSTEM_SUBMARINE_RUN] = ys.Battle.BattleGateSubmarine,
	[SYSTEM_SCENARIO] = ys.Battle.BattleGateScenario,
	[SYSTEM_ROUTINE] = ys.Battle.BattleGateRoutine,
	[SYSTEM_SUB_ROUTINE] = ys.Battle.BattleGateSubRoutine,
	[SYSTEM_DUEL] = ys.Battle.BattleGateDuel,
	[SYSTEM_CHALLENGE] = ys.Battle.BattleGateChallenge,
	[SYSTEM_WORLD] = ys.Battle.BattleGateWorld,
	[SYSTEM_GUILD] = ys.Battle.BattleGateGuild,
	[SYSTEM_DEBUG] = ys.Battle.BattleGateDebug
}

return slot0
