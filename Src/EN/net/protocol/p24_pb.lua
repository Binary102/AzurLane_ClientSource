slot0 = require("protobuf")

module("p24_pb")

SC_24001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
CS_24002 = slot0.Descriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
SC_24003 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
CS_24004 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
SC_24005 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
SC_24006 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
CS_24007 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
SC_24008 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
CHALLENGEINFO = slot0.Descriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
ELITEFLEETINFO = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
SHIPINCHALLENGE = slot0.Descriptor()
slot25 = slot0.FieldDescriptor()
slot26 = slot0.FieldDescriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
STRATEGYINFO = slot0.Descriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
slot2.name = "current_challenge"
slot2.full_name = ".p24.sc_24001.current_challenge"
slot2.number = 1
slot2.index = 0
slot2.label = 1
slot2.has_default_value = false
slot2.default_value = nil
slot2.message_type = CHALLENGEINFO
slot2.type = 11
slot2.cpp_type = 10
SC_24001.name = "sc_24001"
SC_24001.full_name = ".p24.sc_24001"
SC_24001.nested_types = {}
SC_24001.enum_types = {}
SC_24001.fields = {
	slot2
}
SC_24001.is_extendable = false
SC_24001.extensions = {}
slot3.name = "elite_fleet_list"
slot3.full_name = ".p24.cs_24002.elite_fleet_list"
slot3.number = 1
slot3.index = 0
slot3.label = 3
slot3.has_default_value = false
slot3.default_value = {}
slot3.message_type = ELITEFLEETINFO
slot3.type = 11
slot3.cpp_type = 10
slot4.name = "multiple_list"
slot4.full_name = ".p24.cs_24002.multiple_list"
slot4.number = 2
slot4.index = 1
slot4.label = 3
slot4.has_default_value = false
slot4.default_value = {}
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "activity_id"
slot5.full_name = ".p24.cs_24002.activity_id"
slot5.number = 3
slot5.index = 2
slot5.label = 1
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
CS_24002.name = "cs_24002"
CS_24002.full_name = ".p24.cs_24002"
CS_24002.nested_types = {}
CS_24002.enum_types = {}
CS_24002.fields = {
	slot3,
	slot4,
	slot5
}
CS_24002.is_extendable = false
CS_24002.extensions = {}
slot6.name = "result"
slot6.full_name = ".p24.sc_24003.result"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "ship_list"
slot7.full_name = ".p24.sc_24003.ship_list"
slot7.number = 2
slot7.index = 1
slot7.label = 3
slot7.has_default_value = false
slot7.default_value = {}
slot7.message_type = SHIPINCHALLENGE
slot7.type = 11
slot7.cpp_type = 10
SC_24003.name = "sc_24003"
SC_24003.full_name = ".p24.sc_24003"
SC_24003.nested_types = {}
SC_24003.enum_types = {}
SC_24003.fields = {
	slot6,
	slot7
}
SC_24003.is_extendable = false
SC_24003.extensions = {}
slot8.name = "act"
slot8.full_name = ".p24.cs_24004.act"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "act_arg1"
slot9.full_name = ".p24.cs_24004.act_arg1"
slot9.number = 2
slot9.index = 1
slot9.label = 3
slot9.has_default_value = false
slot9.default_value = {}
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "activity_id"
slot10.full_name = ".p24.cs_24004.activity_id"
slot10.number = 3
slot10.index = 2
slot10.label = 1
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
CS_24004.name = "cs_24004"
CS_24004.full_name = ".p24.cs_24004"
CS_24004.nested_types = {}
CS_24004.enum_types = {}
CS_24004.fields = {
	slot8,
	slot9,
	slot10
}
CS_24004.is_extendable = false
CS_24004.extensions = {}
slot11.name = "result"
slot11.full_name = ".p24.sc_24005.result"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "challenge_update"
slot12.full_name = ".p24.sc_24005.challenge_update"
slot12.number = 2
slot12.index = 1
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = nil
slot12.message_type = CHALLENGEINFO
slot12.type = 11
slot12.cpp_type = 10
SC_24005.name = "sc_24005"
SC_24005.full_name = ".p24.sc_24005"
SC_24005.nested_types = {}
SC_24005.enum_types = {}
SC_24005.fields = {
	slot11,
	slot12
}
SC_24005.is_extendable = false
SC_24005.extensions = {}
slot13.name = "score"
slot13.full_name = ".p24.sc_24006.score"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "is_last"
slot14.full_name = ".p24.sc_24006.is_last"
slot14.number = 2
slot14.index = 1
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
SC_24006.name = "sc_24006"
SC_24006.full_name = ".p24.sc_24006"
SC_24006.nested_types = {}
SC_24006.enum_types = {}
SC_24006.fields = {
	slot13,
	slot14
}
SC_24006.is_extendable = false
SC_24006.extensions = {}
slot15.name = "formation_list"
slot15.full_name = ".p24.cs_24007.formation_list"
slot15.number = 1
slot15.index = 0
slot15.label = 3
slot15.has_default_value = false
slot15.default_value = {}
slot15.type = 13
slot15.cpp_type = 3
CS_24007.name = "cs_24007"
CS_24007.full_name = ".p24.cs_24007"
CS_24007.nested_types = {}
CS_24007.enum_types = {}
CS_24007.fields = {
	slot15
}
CS_24007.is_extendable = false
CS_24007.extensions = {}
slot16.name = "result"
slot16.full_name = ".p24.sc_24008.result"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
SC_24008.name = "sc_24008"
SC_24008.full_name = ".p24.sc_24008"
SC_24008.nested_types = {}
SC_24008.enum_types = {}
SC_24008.fields = {
	slot16
}
SC_24008.is_extendable = false
SC_24008.extensions = {}
slot17.name = "max_score"
slot17.full_name = ".p24.challengeinfo.max_score"
slot17.number = 1
slot17.index = 0
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
slot18.name = "current_score"
slot18.full_name = ".p24.challengeinfo.current_score"
slot18.number = 2
slot18.index = 1
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
slot19.name = "level"
slot19.full_name = ".p24.challengeinfo.level"
slot19.number = 3
slot19.index = 2
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "strategy_use_list"
slot20.full_name = ".p24.challengeinfo.strategy_use_list"
slot20.number = 4
slot20.index = 3
slot20.label = 3
slot20.has_default_value = false
slot20.default_value = {}
slot20.message_type = STRATEGYINFO
slot20.type = 11
slot20.cpp_type = 10
slot21.name = "ship_list"
slot21.full_name = ".p24.challengeinfo.ship_list"
slot21.number = 5
slot21.index = 4
slot21.label = 3
slot21.has_default_value = false
slot21.default_value = {}
slot21.message_type = SHIPINCHALLENGE
slot21.type = 11
slot21.cpp_type = 10
slot22.name = "multiple_list"
slot22.full_name = ".p24.challengeinfo.multiple_list"
slot22.number = 6
slot22.index = 5
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.type = 13
slot22.cpp_type = 3
CHALLENGEINFO.name = "challengeinfo"
CHALLENGEINFO.full_name = ".p24.challengeinfo"
CHALLENGEINFO.nested_types = {}
CHALLENGEINFO.enum_types = {}
CHALLENGEINFO.fields = {
	slot17,
	slot18,
	slot19,
	slot20,
	slot21,
	slot22
}
CHALLENGEINFO.is_extendable = false
CHALLENGEINFO.extensions = {}
slot23.name = "main_id"
slot23.full_name = ".p24.elitefleetinfo.main_id"
slot23.number = 1
slot23.index = 0
slot23.label = 3
slot23.has_default_value = false
slot23.default_value = {}
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "scout_id"
slot24.full_name = ".p24.elitefleetinfo.scout_id"
slot24.number = 2
slot24.index = 1
slot24.label = 3
slot24.has_default_value = false
slot24.default_value = {}
slot24.type = 13
slot24.cpp_type = 3
ELITEFLEETINFO.name = "elitefleetinfo"
ELITEFLEETINFO.full_name = ".p24.elitefleetinfo"
ELITEFLEETINFO.nested_types = {}
ELITEFLEETINFO.enum_types = {}
ELITEFLEETINFO.fields = {
	slot23,
	slot24
}
ELITEFLEETINFO.is_extendable = false
ELITEFLEETINFO.extensions = {}
slot25.name = "id"
slot25.full_name = ".p24.shipinchallenge.id"
slot25.number = 1
slot25.index = 0
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
slot26.name = "hp_rant"
slot26.full_name = ".p24.shipinchallenge.hp_rant"
slot26.number = 2
slot26.index = 1
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
slot27.name = "strategy_list"
slot27.full_name = ".p24.shipinchallenge.strategy_list"
slot27.number = 3
slot27.index = 2
slot27.label = 3
slot27.has_default_value = false
slot27.default_value = {}
slot27.message_type = STRATEGYINFO
slot27.type = 11
slot27.cpp_type = 10
slot28.name = "ship_info"
slot28.full_name = ".p24.shipinchallenge.ship_info"
slot28.number = 4
slot28.index = 3
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = nil
slot28.message_type = require("common_pb").SHIPINFO
slot28.type = 11
slot28.cpp_type = 10
SHIPINCHALLENGE.name = "shipinchallenge"
SHIPINCHALLENGE.full_name = ".p24.shipinchallenge"
SHIPINCHALLENGE.nested_types = {}
SHIPINCHALLENGE.enum_types = {}
SHIPINCHALLENGE.fields = {
	slot25,
	slot26,
	slot27,
	slot28
}
SHIPINCHALLENGE.is_extendable = false
SHIPINCHALLENGE.extensions = {}
slot29.name = "id"
slot29.full_name = ".p24.strategyinfo.id"
slot29.number = 1
slot29.index = 0
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
slot30.name = "count"
slot30.full_name = ".p24.strategyinfo.count"
slot30.number = 2
slot30.index = 1
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
STRATEGYINFO.name = "strategyinfo"
STRATEGYINFO.full_name = ".p24.strategyinfo"
STRATEGYINFO.nested_types = {}
STRATEGYINFO.enum_types = {}
STRATEGYINFO.fields = {
	slot29,
	slot30
}
STRATEGYINFO.is_extendable = false
STRATEGYINFO.extensions = {}
challengeinfo = slot0.Message(CHALLENGEINFO)
cs_24002 = slot0.Message(CS_24002)
cs_24004 = slot0.Message(CS_24004)
cs_24007 = slot0.Message(CS_24007)
elitefleetinfo = slot0.Message(ELITEFLEETINFO)
sc_24001 = slot0.Message(SC_24001)
sc_24003 = slot0.Message(SC_24003)
sc_24005 = slot0.Message(SC_24005)
sc_24006 = slot0.Message(SC_24006)
sc_24008 = slot0.Message(SC_24008)
shipinchallenge = slot0.Message(SHIPINCHALLENGE)
strategyinfo = slot0.Message(STRATEGYINFO)

return
