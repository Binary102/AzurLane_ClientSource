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
					text = "신병, 지금부터 아마존이 함대 운영을 가르쳐 주겠어!"
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
					text = "우선 <color=#ff7e00>스틱을 당겨서</color> 함선을 움직여 보도록!"
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
					text = "전열의 <color=#ff7e00>선봉함대</color>는 함포를 사용해서 <color=#ff7e00>자동으로 공격</color>해."
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
					text = "다음은 버튼을 눌러서 <color=#ff7e00>어뢰를 발사</color> 해보자!"
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
					text = "방어력이 높은 적을 상대할 땐 후열 주력함대의 <color=#ff7e00>주포</color>로 공격하는 게 효과적이야!"
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
					text = "버튼을 누르면 주포를 발사할 수 있어! <color=#ff7e00>버튼을 누르고 있으면</color>수동 조준도 가능하다고!"
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
