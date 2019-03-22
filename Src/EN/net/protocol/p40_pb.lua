slot0 = require("protobuf")

module("p40_pb")

CS_40001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
SC_40002 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
CS_40003 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
slot15 = slot0.FieldDescriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
SC_40004 = slot0.Descriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
CS_40005 = slot0.Descriptor()
slot25 = slot0.FieldDescriptor()
SC_40006 = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
DROPPERFORMANCE = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
slot29 = slot0.FieldDescriptor()
STATISTICSINFO = slot0.Descriptor()
slot30 = slot0.FieldDescriptor()
slot31 = slot0.FieldDescriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
slot34 = slot0.FieldDescriptor()
slot35 = slot0.FieldDescriptor()
SHIP_EXP = slot0.Descriptor()
slot36 = slot0.FieldDescriptor()
slot37 = slot0.FieldDescriptor()
slot38 = slot0.FieldDescriptor()
COMMANDER_EXP = slot0.Descriptor()
slot39 = slot0.FieldDescriptor()
slot40 = slot0.FieldDescriptor()
ENEMYINFO = slot0.Descriptor()
slot41 = slot0.FieldDescriptor()
slot42 = slot0.FieldDescriptor()
slot43 = slot0.FieldDescriptor()
slot2.name = "system"
slot2.full_name = ".p40.cs_40001.system"
slot2.number = 1
slot2.index = 0
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "ship_id_list"
slot3.full_name = ".p40.cs_40001.ship_id_list"
slot3.number = 2
slot3.index = 1
slot3.label = 3
slot3.has_default_value = false
slot3.default_value = {}
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "data"
slot4.full_name = ".p40.cs_40001.data"
slot4.number = 3
slot4.index = 2
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
CS_40001.name = "cs_40001"
CS_40001.full_name = ".p40.cs_40001"
CS_40001.nested_types = {}
CS_40001.enum_types = {}
CS_40001.fields = {
	slot2,
	slot3,
	slot4
}
CS_40001.is_extendable = false
CS_40001.extensions = {}
slot5.name = "result"
slot5.full_name = ".p40.sc_40002.result"
slot5.number = 1
slot5.index = 0
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
slot6.name = "key"
slot6.full_name = ".p40.sc_40002.key"
slot6.number = 2
slot6.index = 1
slot6.label = 1
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "drop_performance"
slot7.full_name = ".p40.sc_40002.drop_performance"
slot7.number = 3
slot7.index = 2
slot7.label = 3
slot7.has_default_value = false
slot7.default_value = {}
slot7.message_type = DROPPERFORMANCE
slot7.type = 11
slot7.cpp_type = 10
SC_40002.name = "sc_40002"
SC_40002.full_name = ".p40.sc_40002"
SC_40002.nested_types = {}
SC_40002.enum_types = {}
SC_40002.fields = {
	slot5,
	slot6,
	slot7
}
SC_40002.is_extendable = false
SC_40002.extensions = {}
slot8.name = "system"
slot8.full_name = ".p40.cs_40003.system"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "data"
slot9.full_name = ".p40.cs_40003.data"
slot9.number = 2
slot9.index = 1
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "key"
slot10.full_name = ".p40.cs_40003.key"
slot10.number = 3
slot10.index = 2
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
slot11.name = "score"
slot11.full_name = ".p40.cs_40003.score"
slot11.number = 4
slot11.index = 3
slot11.label = 1
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "statistics"
slot12.full_name = ".p40.cs_40003.statistics"
slot12.number = 5
slot12.index = 4
slot12.label = 3
slot12.has_default_value = false
slot12.default_value = {}
slot12.message_type = STATISTICSINFO
slot12.type = 11
slot12.cpp_type = 10
slot13.name = "kill_id_list"
slot13.full_name = ".p40.cs_40003.kill_id_list"
slot13.number = 6
slot13.index = 5
slot13.label = 3
slot13.has_default_value = false
slot13.default_value = {}
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "total_time"
slot14.full_name = ".p40.cs_40003.total_time"
slot14.number = 7
slot14.index = 6
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
slot15.name = "bot_percentage"
slot15.full_name = ".p40.cs_40003.bot_percentage"
slot15.number = 8
slot15.index = 7
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
slot16.name = "extra_param"
slot16.full_name = ".p40.cs_40003.extra_param"
slot16.number = 9
slot16.index = 8
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "file_check"
slot17.full_name = ".p40.cs_40003.file_check"
slot17.number = 10
slot17.index = 9
slot17.label = 1
slot17.has_default_value = false
slot17.default_value = ""
slot17.type = 9
slot17.cpp_type = 9
slot18.name = "enemy_info"
slot18.full_name = ".p40.cs_40003.enemy_info"
slot18.number = 11
slot18.index = 10
slot18.label = 3
slot18.has_default_value = false
slot18.default_value = {}
slot18.message_type = ENEMYINFO
slot18.type = 11
slot18.cpp_type = 10
CS_40003.name = "cs_40003"
CS_40003.full_name = ".p40.cs_40003"
CS_40003.nested_types = {}
CS_40003.enum_types = {}
CS_40003.fields = {
	slot8,
	slot9,
	slot10,
	slot11,
	slot12,
	slot13,
	slot14,
	slot15,
	slot16,
	slot17,
	slot18
}
CS_40003.is_extendable = false
CS_40003.extensions = {}
slot19.name = "result"
slot19.full_name = ".p40.sc_40004.result"
slot19.number = 1
slot19.index = 0
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "drop_info"
slot20.full_name = ".p40.sc_40004.drop_info"
slot20.number = 2
slot20.index = 1
slot20.label = 3
slot20.has_default_value = false
slot20.default_value = {}
slot20.message_type = require("common_pb").DROPINFO
slot20.type = 11
slot20.cpp_type = 10
slot21.name = "player_exp"
slot21.full_name = ".p40.sc_40004.player_exp"
slot21.number = 3
slot21.index = 2
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "ship_exp_list"
slot22.full_name = ".p40.sc_40004.ship_exp_list"
slot22.number = 4
slot22.index = 3
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.message_type = SHIP_EXP
slot22.type = 11
slot22.cpp_type = 10
slot23.name = "mvp"
slot23.full_name = ".p40.sc_40004.mvp"
slot23.number = 5
slot23.index = 4
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "commander_exp"
slot24.full_name = ".p40.sc_40004.commander_exp"
slot24.number = 6
slot24.index = 5
slot24.label = 3
slot24.has_default_value = false
slot24.default_value = {}
slot24.message_type = COMMANDER_EXP
slot24.type = 11
slot24.cpp_type = 10
SC_40004.name = "sc_40004"
SC_40004.full_name = ".p40.sc_40004"
SC_40004.nested_types = {}
SC_40004.enum_types = {}
SC_40004.fields = {
	slot19,
	slot20,
	slot21,
	slot22,
	slot23,
	slot24
}
SC_40004.is_extendable = false
SC_40004.extensions = {}
slot25.name = "system"
slot25.full_name = ".p40.cs_40005.system"
slot25.number = 1
slot25.index = 0
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
CS_40005.name = "cs_40005"
CS_40005.full_name = ".p40.cs_40005"
CS_40005.nested_types = {}
CS_40005.enum_types = {}
CS_40005.fields = {
	slot25
}
CS_40005.is_extendable = false
CS_40005.extensions = {}
slot26.name = "result"
slot26.full_name = ".p40.sc_40006.result"
slot26.number = 1
slot26.index = 0
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
SC_40006.name = "sc_40006"
SC_40006.full_name = ".p40.sc_40006"
SC_40006.nested_types = {}
SC_40006.enum_types = {}
SC_40006.fields = {
	slot26
}
SC_40006.is_extendable = false
SC_40006.extensions = {}
slot27.name = "enemy_id"
slot27.full_name = ".p40.dropperformance.enemy_id"
slot27.number = 1
slot27.index = 0
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "resource_num"
slot28.full_name = ".p40.dropperformance.resource_num"
slot28.number = 2
slot28.index = 1
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
slot29.name = "other_num"
slot29.full_name = ".p40.dropperformance.other_num"
slot29.number = 3
slot29.index = 2
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
DROPPERFORMANCE.name = "dropperformance"
DROPPERFORMANCE.full_name = ".p40.dropperformance"
DROPPERFORMANCE.nested_types = {}
DROPPERFORMANCE.enum_types = {}
DROPPERFORMANCE.fields = {
	slot27,
	slot28,
	slot29
}
DROPPERFORMANCE.is_extendable = false
DROPPERFORMANCE.extensions = {}
slot30.name = "ship_id"
slot30.full_name = ".p40.statisticsinfo.ship_id"
slot30.number = 1
slot30.index = 0
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
slot31.name = "damage_cause"
slot31.full_name = ".p40.statisticsinfo.damage_cause"
slot31.number = 2
slot31.index = 1
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
slot32.name = "damage_caused"
slot32.full_name = ".p40.statisticsinfo.damage_caused"
slot32.number = 3
slot32.index = 2
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "hp_rest"
slot33.full_name = ".p40.statisticsinfo.hp_rest"
slot33.number = 4
slot33.index = 3
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = 0
slot33.type = 13
slot33.cpp_type = 3
slot34.name = "max_damage_once"
slot34.full_name = ".p40.statisticsinfo.max_damage_once"
slot34.number = 5
slot34.index = 4
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = 0
slot34.type = 13
slot34.cpp_type = 3
slot35.name = "ship_gear_score"
slot35.full_name = ".p40.statisticsinfo.ship_gear_score"
slot35.number = 6
slot35.index = 5
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
STATISTICSINFO.name = "statisticsinfo"
STATISTICSINFO.full_name = ".p40.statisticsinfo"
STATISTICSINFO.nested_types = {}
STATISTICSINFO.enum_types = {}
STATISTICSINFO.fields = {
	slot30,
	slot31,
	slot32,
	slot33,
	slot34,
	slot35
}
STATISTICSINFO.is_extendable = false
STATISTICSINFO.extensions = {}
slot36.name = "ship_id"
slot36.full_name = ".p40.ship_exp.ship_id"
slot36.number = 1
slot36.index = 0
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = 0
slot36.type = 13
slot36.cpp_type = 3
slot37.name = "exp"
slot37.full_name = ".p40.ship_exp.exp"
slot37.number = 2
slot37.index = 1
slot37.label = 2
slot37.has_default_value = false
slot37.default_value = 0
slot37.type = 13
slot37.cpp_type = 3
slot38.name = "intimacy"
slot38.full_name = ".p40.ship_exp.intimacy"
slot38.number = 3
slot38.index = 2
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
SHIP_EXP.name = "ship_exp"
SHIP_EXP.full_name = ".p40.ship_exp"
SHIP_EXP.nested_types = {}
SHIP_EXP.enum_types = {}
SHIP_EXP.fields = {
	slot36,
	slot37,
	slot38
}
SHIP_EXP.is_extendable = false
SHIP_EXP.extensions = {}
slot39.name = "commander_id"
slot39.full_name = ".p40.commander_exp.commander_id"
slot39.number = 1
slot39.index = 0
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = 0
slot39.type = 13
slot39.cpp_type = 3
slot40.name = "exp"
slot40.full_name = ".p40.commander_exp.exp"
slot40.number = 2
slot40.index = 1
slot40.label = 2
slot40.has_default_value = false
slot40.default_value = 0
slot40.type = 13
slot40.cpp_type = 3
COMMANDER_EXP.name = "commander_exp"
COMMANDER_EXP.full_name = ".p40.commander_exp"
COMMANDER_EXP.nested_types = {}
COMMANDER_EXP.enum_types = {}
COMMANDER_EXP.fields = {
	slot39,
	slot40
}
COMMANDER_EXP.is_extendable = false
COMMANDER_EXP.extensions = {}
slot41.name = "enemy_id"
slot41.full_name = ".p40.enemyinfo.enemy_id"
slot41.number = 1
slot41.index = 0
slot41.label = 2
slot41.has_default_value = false
slot41.default_value = 0
slot41.type = 13
slot41.cpp_type = 3
slot42.name = "damage_taken"
slot42.full_name = ".p40.enemyinfo.damage_taken"
slot42.number = 2
slot42.index = 1
slot42.label = 2
slot42.has_default_value = false
slot42.default_value = 0
slot42.type = 13
slot42.cpp_type = 3
slot43.name = "total_hp"
slot43.full_name = ".p40.enemyinfo.total_hp"
slot43.number = 3
slot43.index = 2
slot43.label = 2
slot43.has_default_value = false
slot43.default_value = 0
slot43.type = 13
slot43.cpp_type = 3
ENEMYINFO.name = "enemyinfo"
ENEMYINFO.full_name = ".p40.enemyinfo"
ENEMYINFO.nested_types = {}
ENEMYINFO.enum_types = {}
ENEMYINFO.fields = {
	slot41,
	slot42,
	slot43
}
ENEMYINFO.is_extendable = false
ENEMYINFO.extensions = {}
commander_exp = slot0.Message(COMMANDER_EXP)
cs_40001 = slot0.Message(CS_40001)
cs_40003 = slot0.Message(CS_40003)
cs_40005 = slot0.Message(CS_40005)
dropperformance = slot0.Message(DROPPERFORMANCE)
enemyinfo = slot0.Message(ENEMYINFO)
sc_40002 = slot0.Message(SC_40002)
sc_40004 = slot0.Message(SC_40004)
sc_40006 = slot0.Message(SC_40006)
ship_exp = slot0.Message(SHIP_EXP)
statisticsinfo = slot0.Message(STATISTICSINFO)

return
