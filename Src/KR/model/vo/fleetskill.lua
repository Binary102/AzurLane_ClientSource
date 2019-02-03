slot0 = class("FleetSkill", import(".BaseVO"))
slot0.SystemCommanderNeko = 1
slot0.TypeMoveSpeed = "move_speed"
slot0.TypeHuntingLv = "hunt_lv"
slot0.TypeAmbushDodge = "ambush_dodge"
slot0.TypeAirStrikeDodge = "airfight_doge"
slot0.TypeStrategy = "strategy"
slot0.TypeBattleBuff = "battle_buff"
slot0.TypeAttack = "attack"
slot0.TypeTorpedoPowerUp = "torpedo_power_up"
slot0.TriggerDDCount = "dd_count"
slot0.TriggerDDHead = "dd_head"
slot0.TriggerAroundEnemy = "around_enemy"
slot0.TriggerVanCount = "vang_count"
slot0.TriggerNekoPos = "pos"
slot0.TriggerAroundLand = "around_land"
slot0.TriggerAroundCombatAlly = "around_combat_ally"
slot0.TriggerShipCount = "count"
slot0.TriggerInSubTeam = "insubteam"

function slot0.Ctor(slot0, slot1, slot2)
	slot0.system = slot1
	slot0.id = slot2
	slot0.configId = slot0.id
end

function slot0.GetSystem(slot0)
	return slot0.system
end

function slot0.bindConfigTable(slot0)
	if slot0:GetSystem() == slot0.SystemCommanderNeko then
		return pg.commander_skill_effect_template
	end
end

function slot0.GetType(slot0)
	if slot0:GetSystem() == slot0.SystemCommanderNeko then
		return slot0:getConfig("effect_type")
	end
end

function slot0.GetArgs(slot0)
	if slot0:GetSystem() == slot0.SystemCommanderNeko then
		return slot0:getConfig("args")
	end
end

function slot0.GetTriggers(slot0)
	if slot0:GetSystem() == slot0.SystemCommanderNeko then
		return slot0:getConfig("condition")
	end
end

return slot0
