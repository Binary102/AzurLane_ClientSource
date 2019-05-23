slot0 = require("protobuf")

module("p24_pb")

CS_24002 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
SC_24003 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
CS_24004 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
SC_24005 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
CS_24009 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
SC_24010 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
CS_24011 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
SC_24012 = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
GROUPINFO = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
COMMANDERSINFO = slot0.Descriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
CHALLENGEINFO = slot0.Descriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
slot26 = slot0.FieldDescriptor()
USERCHALLENGEINFO = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
slot31 = slot0.FieldDescriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
slot34 = slot0.FieldDescriptor()
SHIPINCHALLENGE = slot0.Descriptor()
slot35 = slot0.FieldDescriptor()
slot36 = slot0.FieldDescriptor()
slot37 = slot0.FieldDescriptor()
GROUPINFOINCHALLENGE = slot0.Descriptor()
slot38 = slot0.FieldDescriptor()
slot39 = slot0.FieldDescriptor()
slot40 = slot0.FieldDescriptor()
COMMANDERINCHALLENGE = slot0.Descriptor()
slot41 = slot0.FieldDescriptor()
slot42 = slot0.FieldDescriptor()
slot2.name = "activity_id"
slot2.full_name = ".p24.cs_24002.activity_id"
slot2.number = 1
slot2.index = 0
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "group_list"
slot3.full_name = ".p24.cs_24002.group_list"
slot3.number = 2
slot3.index = 1
slot3.label = 3
slot3.has_default_value = false
slot3.default_value = {}
slot3.message_type = GROUPINFO
slot3.type = 11
slot3.cpp_type = 10
slot4.name = "mode"
slot4.full_name = ".p24.cs_24002.mode"
slot4.number = 3
slot4.index = 2
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
CS_24002.name = "cs_24002"
CS_24002.full_name = ".p24.cs_24002"
CS_24002.nested_types = {}
CS_24002.enum_types = {}
CS_24002.fields = {
	slot2,
	slot3,
	slot4
}
CS_24002.is_extendable = false
CS_24002.extensions = {}
slot5.name = "result"
slot5.full_name = ".p24.sc_24003.result"
slot5.number = 1
slot5.index = 0
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
SC_24003.name = "sc_24003"
SC_24003.full_name = ".p24.sc_24003"
SC_24003.nested_types = {}
SC_24003.enum_types = {}
SC_24003.fields = {
	slot5
}
SC_24003.is_extendable = false
SC_24003.extensions = {}
slot6.name = "activity_id"
slot6.full_name = ".p24.cs_24004.activity_id"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
CS_24004.name = "cs_24004"
CS_24004.full_name = ".p24.cs_24004"
CS_24004.nested_types = {}
CS_24004.enum_types = {}
CS_24004.fields = {
	slot6
}
CS_24004.is_extendable = false
CS_24004.extensions = {}
slot7.name = "result"
slot7.full_name = ".p24.sc_24005.result"
slot7.number = 1
slot7.index = 0
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = 0
slot7.type = 13
slot7.cpp_type = 3
slot8.name = "current_challenge"
slot8.full_name = ".p24.sc_24005.current_challenge"
slot8.number = 2
slot8.index = 1
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = nil
slot8.message_type = CHALLENGEINFO
slot8.type = 11
slot8.cpp_type = 10
slot9.name = "user_challenge"
slot9.full_name = ".p24.sc_24005.user_challenge"
slot9.number = 3
slot9.index = 2
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = nil
slot9.message_type = USERCHALLENGEINFO
slot9.type = 11
slot9.cpp_type = 10
SC_24005.name = "sc_24005"
SC_24005.full_name = ".p24.sc_24005"
SC_24005.nested_types = {}
SC_24005.enum_types = {}
SC_24005.fields = {
	slot7,
	slot8,
	slot9
}
SC_24005.is_extendable = false
SC_24005.extensions = {}
slot10.name = "activity_id"
slot10.full_name = ".p24.cs_24009.activity_id"
slot10.number = 1
slot10.index = 0
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
CS_24009.name = "cs_24009"
CS_24009.full_name = ".p24.cs_24009"
CS_24009.nested_types = {}
CS_24009.enum_types = {}
CS_24009.fields = {
	slot10
}
CS_24009.is_extendable = false
CS_24009.extensions = {}
slot11.name = "result"
slot11.full_name = ".p24.sc_24010.result"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "score"
slot12.full_name = ".p24.sc_24010.score"
slot12.number = 2
slot12.index = 1
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
SC_24010.name = "sc_24010"
SC_24010.full_name = ".p24.sc_24010"
SC_24010.nested_types = {}
SC_24010.enum_types = {}
SC_24010.fields = {
	slot11,
	slot12
}
SC_24010.is_extendable = false
SC_24010.extensions = {}
slot13.name = "activity_id"
slot13.full_name = ".p24.cs_24011.activity_id"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
CS_24011.name = "cs_24011"
CS_24011.full_name = ".p24.cs_24011"
CS_24011.nested_types = {}
CS_24011.enum_types = {}
CS_24011.fields = {
	slot13
}
CS_24011.is_extendable = false
CS_24011.extensions = {}
slot14.name = "result"
slot14.full_name = ".p24.sc_24012.result"
slot14.number = 1
slot14.index = 0
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
SC_24012.name = "sc_24012"
SC_24012.full_name = ".p24.sc_24012"
SC_24012.nested_types = {}
SC_24012.enum_types = {}
SC_24012.fields = {
	slot14
}
SC_24012.is_extendable = false
SC_24012.extensions = {}
slot15.name = "id"
slot15.full_name = ".p24.groupinfo.id"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
slot16.name = "ship_list"
slot16.full_name = ".p24.groupinfo.ship_list"
slot16.number = 2
slot16.index = 1
slot16.label = 3
slot16.has_default_value = false
slot16.default_value = {}
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "commanders"
slot17.full_name = ".p24.groupinfo.commanders"
slot17.number = 3
slot17.index = 2
slot17.label = 3
slot17.has_default_value = false
slot17.default_value = {}
slot17.message_type = COMMANDERSINFO
slot17.type = 11
slot17.cpp_type = 10
GROUPINFO.name = "groupinfo"
GROUPINFO.full_name = ".p24.groupinfo"
GROUPINFO.nested_types = {}
GROUPINFO.enum_types = {}
GROUPINFO.fields = {
	slot15,
	slot16,
	slot17
}
GROUPINFO.is_extendable = false
GROUPINFO.extensions = {}
slot18.name = "pos"
slot18.full_name = ".p24.commandersinfo.pos"
slot18.number = 1
slot18.index = 0
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
slot19.name = "id"
slot19.full_name = ".p24.commandersinfo.id"
slot19.number = 2
slot19.index = 1
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
COMMANDERSINFO.name = "commandersinfo"
COMMANDERSINFO.full_name = ".p24.commandersinfo"
COMMANDERSINFO.nested_types = {}
COMMANDERSINFO.enum_types = {}
COMMANDERSINFO.fields = {
	slot18,
	slot19
}
COMMANDERSINFO.is_extendable = false
COMMANDERSINFO.extensions = {}
slot20.name = "season_max_score"
slot20.full_name = ".p24.challengeinfo.season_max_score"
slot20.number = 1
slot20.index = 0
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "activity_max_score"
slot21.full_name = ".p24.challengeinfo.activity_max_score"
slot21.number = 2
slot21.index = 1
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "season_max_level"
slot22.full_name = ".p24.challengeinfo.season_max_level"
slot22.number = 3
slot22.index = 2
slot22.label = 2
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
slot23.name = "activity_max_level"
slot23.full_name = ".p24.challengeinfo.activity_max_level"
slot23.number = 4
slot23.index = 3
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "season_id"
slot24.full_name = ".p24.challengeinfo.season_id"
slot24.number = 5
slot24.index = 4
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
slot25.name = "dungeon_id_list"
slot25.full_name = ".p24.challengeinfo.dungeon_id_list"
slot25.number = 6
slot25.index = 5
slot25.label = 3
slot25.has_default_value = false
slot25.default_value = {}
slot25.type = 13
slot25.cpp_type = 3
slot26.name = "buff_list"
slot26.full_name = ".p24.challengeinfo.buff_list"
slot26.number = 7
slot26.index = 6
slot26.label = 3
slot26.has_default_value = false
slot26.default_value = {}
slot26.type = 13
slot26.cpp_type = 3
CHALLENGEINFO.name = "challengeinfo"
CHALLENGEINFO.full_name = ".p24.challengeinfo"
CHALLENGEINFO.nested_types = {}
CHALLENGEINFO.enum_types = {}
CHALLENGEINFO.fields = {
	slot20,
	slot21,
	slot22,
	slot23,
	slot24,
	slot25,
	slot26
}
CHALLENGEINFO.is_extendable = false
CHALLENGEINFO.extensions = {}
slot27.name = "current_score"
slot27.full_name = ".p24.userchallengeinfo.current_score"
slot27.number = 1
slot27.index = 0
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "level"
slot28.full_name = ".p24.userchallengeinfo.level"
slot28.number = 2
slot28.index = 1
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
slot29.name = "groupinc_list"
slot29.full_name = ".p24.userchallengeinfo.groupinc_list"
slot29.number = 3
slot29.index = 2
slot29.label = 3
slot29.has_default_value = false
slot29.default_value = {}
slot29.message_type = GROUPINFOINCHALLENGE
slot29.type = 11
slot29.cpp_type = 10
slot30.name = "mode"
slot30.full_name = ".p24.userchallengeinfo.mode"
slot30.number = 4
slot30.index = 3
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
slot31.name = "issl"
slot31.full_name = ".p24.userchallengeinfo.issl"
slot31.number = 5
slot31.index = 4
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
slot32.name = "season_id"
slot32.full_name = ".p24.userchallengeinfo.season_id"
slot32.number = 6
slot32.index = 5
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "dungeon_id_list"
slot33.full_name = ".p24.userchallengeinfo.dungeon_id_list"
slot33.number = 7
slot33.index = 6
slot33.label = 3
slot33.has_default_value = false
slot33.default_value = {}
slot33.type = 13
slot33.cpp_type = 3
slot34.name = "buff_list"
slot34.full_name = ".p24.userchallengeinfo.buff_list"
slot34.number = 8
slot34.index = 7
slot34.label = 3
slot34.has_default_value = false
slot34.default_value = {}
slot34.type = 13
slot34.cpp_type = 3
USERCHALLENGEINFO.name = "userchallengeinfo"
USERCHALLENGEINFO.full_name = ".p24.userchallengeinfo"
USERCHALLENGEINFO.nested_types = {}
USERCHALLENGEINFO.enum_types = {}
USERCHALLENGEINFO.fields = {
	slot27,
	slot28,
	slot29,
	slot30,
	slot31,
	slot32,
	slot33,
	slot34
}
USERCHALLENGEINFO.is_extendable = false
USERCHALLENGEINFO.extensions = {}
slot35.name = "id"
slot35.full_name = ".p24.shipinchallenge.id"
slot35.number = 1
slot35.index = 0
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
slot36.name = "hp_rant"
slot36.full_name = ".p24.shipinchallenge.hp_rant"
slot36.number = 2
slot36.index = 1
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = 0
slot36.type = 13
slot36.cpp_type = 3
slot37.name = "ship_info"
slot37.full_name = ".p24.shipinchallenge.ship_info"
slot37.number = 3
slot37.index = 2
slot37.label = 2
slot37.has_default_value = false
slot37.default_value = nil
slot37.message_type = require("common_pb").SHIPINFO
slot37.type = 11
slot37.cpp_type = 10
SHIPINCHALLENGE.name = "shipinchallenge"
SHIPINCHALLENGE.full_name = ".p24.shipinchallenge"
SHIPINCHALLENGE.nested_types = {}
SHIPINCHALLENGE.enum_types = {}
SHIPINCHALLENGE.fields = {
	slot35,
	slot36,
	slot37
}
SHIPINCHALLENGE.is_extendable = false
SHIPINCHALLENGE.extensions = {}
slot38.name = "id"
slot38.full_name = ".p24.groupinfoinchallenge.id"
slot38.number = 1
slot38.index = 0
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
slot39.name = "ships"
slot39.full_name = ".p24.groupinfoinchallenge.ships"
slot39.number = 2
slot39.index = 1
slot39.label = 3
slot39.has_default_value = false
slot39.default_value = {}
slot39.message_type = SHIPINCHALLENGE
slot39.type = 11
slot39.cpp_type = 10
slot40.name = "commanders"
slot40.full_name = ".p24.groupinfoinchallenge.commanders"
slot40.number = 3
slot40.index = 2
slot40.label = 3
slot40.has_default_value = false
slot40.default_value = {}
slot40.message_type = COMMANDERINCHALLENGE
slot40.type = 11
slot40.cpp_type = 10
GROUPINFOINCHALLENGE.name = "groupinfoinchallenge"
GROUPINFOINCHALLENGE.full_name = ".p24.groupinfoinchallenge"
GROUPINFOINCHALLENGE.nested_types = {}
GROUPINFOINCHALLENGE.enum_types = {}
GROUPINFOINCHALLENGE.fields = {
	slot38,
	slot39,
	slot40
}
GROUPINFOINCHALLENGE.is_extendable = false
GROUPINFOINCHALLENGE.extensions = {}
slot41.name = "pos"
slot41.full_name = ".p24.commanderinchallenge.pos"
slot41.number = 1
slot41.index = 0
slot41.label = 2
slot41.has_default_value = false
slot41.default_value = 0
slot41.type = 13
slot41.cpp_type = 3
slot42.name = "commanderinfo"
slot42.full_name = ".p24.commanderinchallenge.commanderinfo"
slot42.number = 2
slot42.index = 1
slot42.label = 2
slot42.has_default_value = false
slot42.default_value = nil
slot42.message_type = require("common_pb").COMMANDERINFO
slot42.type = 11
slot42.cpp_type = 10
COMMANDERINCHALLENGE.name = "commanderinchallenge"
COMMANDERINCHALLENGE.full_name = ".p24.commanderinchallenge"
COMMANDERINCHALLENGE.nested_types = {}
COMMANDERINCHALLENGE.enum_types = {}
COMMANDERINCHALLENGE.fields = {
	slot41,
	slot42
}
COMMANDERINCHALLENGE.is_extendable = false
COMMANDERINCHALLENGE.extensions = {}
challengeinfo = slot0.Message(CHALLENGEINFO)
commanderinchallenge = slot0.Message(COMMANDERINCHALLENGE)
commandersinfo = slot0.Message(COMMANDERSINFO)
cs_24002 = slot0.Message(CS_24002)
cs_24004 = slot0.Message(CS_24004)
cs_24009 = slot0.Message(CS_24009)
cs_24011 = slot0.Message(CS_24011)
groupinfo = slot0.Message(GROUPINFO)
groupinfoinchallenge = slot0.Message(GROUPINFOINCHALLENGE)
sc_24003 = slot0.Message(SC_24003)
sc_24005 = slot0.Message(SC_24005)
sc_24010 = slot0.Message(SC_24010)
sc_24012 = slot0.Message(SC_24012)
shipinchallenge = slot0.Message(SHIPINCHALLENGE)
userchallengeinfo = slot0.Message(USERCHALLENGEINFO)

return
