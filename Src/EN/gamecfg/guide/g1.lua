return {
	id = 1,
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
					text = "Commander! Let me show you how to control your fleet."
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
					text = "First, <color=#ff7e00>move the joystick</color> to get the fleet moving!"
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
					text = "Characters will <color=#ff7e00>fire their weapons automatically</color>, but you also have more firepower available at your disposal."
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
					text = "Tap the button below to <color=#ff7e00>unleash a barrage for torpedoes</color>!"
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
					text = "When you confront a defensive enemy force, use your main ship's <color=#ff7e00>volley</color>!"
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
					text = "Tap on the main gun icon. <color=#ff7e00>Press, hold, and move the joystick</color> to control your aim."
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
