return {
	id = 5013,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
			backGroundStageID = 1,
			passCondition = 1,
			totalArea = {
				-75,
				20,
				90,
				70
			},
			playerArea = {
				-75,
				20,
				42,
				68
			},
			enemyArea = {},
			fleetCorrdinate = {
				-80,
				0,
				75
			},
			waves = {
				{
					triggerType = 0,
					waveIndex = 201,
					conditionType = 1,
					preWaves = {},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 900010,
							delay = 0,
							moveCast = true,
							corrdinate = {
								-15,
								0,
								55
							},
							bossData = {
								hpBarNum = 30,
								icon = "kelifulan"
							},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 2,
									addWeapon = {
										950180,
										950181
									}
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 2,
									addWeapon = {
										950182
									}
								},
								{
									switchParam = 0.5,
									switchTo = 7,
									index = 2,
									switchType = 1,
									addWeapon = {
										950183
									},
									removeWeapon = {
										950182
									}
								},
								{
									switchType = 1,
									switchTo = 0,
									index = 7,
									switchParam = 3,
									removeWeapon = {}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						201
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
