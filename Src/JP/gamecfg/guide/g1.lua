return {
	id = 1,
	closeUI = true,
	nextId = 2,
	events = {
		BattleScene = {
			viewComponent = "BattleScene",
			action = {
				ui = {
					delay = 0.001,
					hide = true,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_1/ActCtl",
					hidePaths = {
						"UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_2/ActCtl",
						"UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl"
					}
				}
			}
		},
		ShowStick = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "新兵、今からこのアマゾンが艦隊運動を教えてやるわ！"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ShowStick_1"
				}
			}
		},
		ShowStick_1 = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "まずは<color=#ff7e00>スティックを引っ張って</color>艦を動かしなさい！"
				},
				ui = {
					delay = 0.3,
					path = "/UICamera/Canvas/UIMain/CombatUI(Clone)/Stick/Area",
					triggerType = {
						4
					},
					fingerPos = {
						posY = -31,
						posX = 43
					}
				}
			}
		},
		ShowSkill_2 = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "前列の<color=#ff7e00>前衛艦隊</color>は艦砲を使って<color=#ff7e00>自動で攻撃</color>してくれるわ！"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ShowSkill_2_1"
				}
			}
		},
		ShowSkill_2_1 = {
			viewComponent = "BattleGuideWave",
			action = {
				ui = {
					hide = false,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_2/ActCtl"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ReleaseTorpedo"
				}
			}
		},
		ReleaseTorpedo = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "次はボタンをタップして<color=#ff7e00>魚雷発射</color>よ！"
				},
				ui = {
					delay = 0.3,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_2/ActCtl",
					triggerType = {
						3
					}
				}
			}
		},
		ShowSkill_1 = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "硬い敵相手には後列の主力艦隊の<color=#ff7e00>主砲砲撃</color>が有効よ！"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ShowSkill_1_1"
				}
			}
		},
		ShowSkill_1_1 = {
			viewComponent = "BattleGuideWave",
			action = {
				ui = {
					delay = 0.3,
					hide = false,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_1/ActCtl"
				},
				newEvent = {
					viewComponent = "BattleGuideWave",
					name = "ReleaseCannon"
				}
			}
		},
		ReleaseCannon = {
			viewComponent = "BattleGuideWave",
			action = {
				say = {
					text = "ボタンをタップすると主砲発射よ！<color=#ff7e00>ボタンを押し続ける</color>と手動照準もできるわ！"
				},
				ui = {
					delay = 0.3,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_1/ActCtl",
					triggerType = {
						3
					}
				}
			}
		},
		NewPlayerScene = {
			viewComponent = "NewPlayerScene",
			finish = true,
			action = {}
		}
	}
}
