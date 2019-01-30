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
					text = "新兵，让我来教你如何控制舰队吧"
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
					text = "首先，<color=#ff7e00>拖动摇杆</color>试着让舰队移动起来吧！"
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
					text = "角色会<color=#ff7e00>自动使用武器</color>攻击，但还有更厉害的武器哦~"
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
					text = "点击下方按钮<color=#ff7e00>发射鱼雷</color>！"
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
					text = "面对敌方护盾防御时，就可以使用主力舰队<color=#ff7e00>主炮跨射</color>"
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
					text = "点击主炮按钮发射主炮，<color=#ff7e00>长按主炮并拖动摇杆</color>可调整攻击位置"
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
