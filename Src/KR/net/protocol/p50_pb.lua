slot0 = require("protobuf")
slot1 = require("common_pb")

module("p50_pb")

SC_50000 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
CS_50001 = slot0.Descriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
SC_50002 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
CS_50003 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
SC_50004 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
SC_50005 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
CS_50006 = slot0.Descriptor()
slot12 = slot0.FieldDescriptor()
SC_50007 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
SC_50008 = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
CS_50009 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
SC_50010 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
CS_50011 = slot0.Descriptor()
slot17 = slot0.FieldDescriptor()
SC_50012 = slot0.Descriptor()
slot18 = slot0.FieldDescriptor()
SC_50013 = slot0.Descriptor()
slot19 = slot0.FieldDescriptor()
CS_50014 = slot0.Descriptor()
slot20 = slot0.FieldDescriptor()
SC_50015 = slot0.Descriptor()
slot21 = slot0.FieldDescriptor()
CS_50016 = slot0.Descriptor()
slot22 = slot0.FieldDescriptor()
SC_50017 = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
SC_50101 = slot0.Descriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
slot26 = slot0.FieldDescriptor()
CS_50102 = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
SC_50103 = slot0.Descriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
SC_50104 = slot0.Descriptor()
slot31 = slot0.FieldDescriptor()
CS_50105 = slot0.Descriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
SC_50106 = slot0.Descriptor()
slot34 = slot0.FieldDescriptor()
CS_50107 = slot0.Descriptor()
slot35 = slot0.FieldDescriptor()
SC_50108 = slot0.Descriptor()
slot36 = slot0.FieldDescriptor()
CS_50109 = slot0.Descriptor()
slot37 = slot0.FieldDescriptor()
SC_50110 = slot0.Descriptor()
slot38 = slot0.FieldDescriptor()
CS_50111 = slot0.Descriptor()
slot39 = slot0.FieldDescriptor()
slot40 = slot0.FieldDescriptor()
slot41 = slot0.FieldDescriptor()
SC_50112 = slot0.Descriptor()
slot42 = slot0.FieldDescriptor()
MSG_INFO = slot0.Descriptor()
slot43 = slot0.FieldDescriptor()
slot44 = slot0.FieldDescriptor()
slot45 = slot0.FieldDescriptor()
DETAIL_INFO = slot0.Descriptor()
slot46 = slot0.FieldDescriptor()
slot47 = slot0.FieldDescriptor()
slot48 = slot0.FieldDescriptor()
slot49 = slot0.FieldDescriptor()
slot50 = slot0.FieldDescriptor()
slot51 = slot0.FieldDescriptor()
slot52 = slot0.FieldDescriptor()
slot53 = slot0.FieldDescriptor()
slot54 = slot0.FieldDescriptor()
slot55 = slot0.FieldDescriptor()
slot56 = slot0.FieldDescriptor()
slot57 = slot0.FieldDescriptor()
slot58 = slot0.FieldDescriptor()
slot59 = slot0.FieldDescriptor()
slot60 = slot0.FieldDescriptor()
slot61 = slot0.FieldDescriptor()
slot62 = slot0.FieldDescriptor()
FRIEND_INFO = slot0.Descriptor()
slot63 = slot0.FieldDescriptor()
slot64 = slot0.FieldDescriptor()
slot65 = slot0.FieldDescriptor()
slot66 = slot0.FieldDescriptor()
slot67 = slot0.FieldDescriptor()
slot68 = slot0.FieldDescriptor()
slot69 = slot0.FieldDescriptor()
PLAYER_INFO = slot0.Descriptor()
slot70 = slot0.FieldDescriptor()
slot71 = slot0.FieldDescriptor()
slot72 = slot0.FieldDescriptor()
slot73 = slot0.FieldDescriptor()
AD_ARG = slot0.Descriptor()
slot74 = slot0.FieldDescriptor()
slot75 = slot0.FieldDescriptor()
slot76 = slot0.FieldDescriptor()
slot2.name = "friend_list"
slot2.full_name = ".p50.sc_50000.friend_list"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = FRIEND_INFO
slot2.type = 11
slot2.cpp_type = 10
slot3.name = "request_list"
slot3.full_name = ".p50.sc_50000.request_list"
slot3.number = 2
slot3.index = 1
slot3.label = 3
slot3.has_default_value = false
slot3.default_value = {}
slot3.message_type = MSG_INFO
slot3.type = 11
slot3.cpp_type = 10
SC_50000.name = "sc_50000"
SC_50000.full_name = ".p50.sc_50000"
SC_50000.nested_types = {}
SC_50000.enum_types = {}
SC_50000.fields = {
	slot2,
	slot3
}
SC_50000.is_extendable = false
SC_50000.extensions = {}
slot4.name = "type"
slot4.full_name = ".p50.cs_50001.type"
slot4.number = 1
slot4.index = 0
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "keyword"
slot5.full_name = ".p50.cs_50001.keyword"
slot5.number = 2
slot5.index = 1
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = ""
slot5.type = 9
slot5.cpp_type = 9
CS_50001.name = "cs_50001"
CS_50001.full_name = ".p50.cs_50001"
CS_50001.nested_types = {}
CS_50001.enum_types = {}
CS_50001.fields = {
	slot4,
	slot5
}
CS_50001.is_extendable = false
CS_50001.extensions = {}
slot6.name = "result"
slot6.full_name = ".p50.sc_50002.result"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "player"
slot7.full_name = ".p50.sc_50002.player"
slot7.number = 2
slot7.index = 1
slot7.label = 1
slot7.has_default_value = false
slot7.default_value = nil
slot7.message_type = DETAIL_INFO
slot7.type = 11
slot7.cpp_type = 10
SC_50002.name = "sc_50002"
SC_50002.full_name = ".p50.sc_50002"
SC_50002.nested_types = {}
SC_50002.enum_types = {}
SC_50002.fields = {
	slot6,
	slot7
}
SC_50002.is_extendable = false
SC_50002.extensions = {}
slot8.name = "id"
slot8.full_name = ".p50.cs_50003.id"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "content"
slot9.full_name = ".p50.cs_50003.content"
slot9.number = 2
slot9.index = 1
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = ""
slot9.type = 9
slot9.cpp_type = 9
CS_50003.name = "cs_50003"
CS_50003.full_name = ".p50.cs_50003"
CS_50003.nested_types = {}
CS_50003.enum_types = {}
CS_50003.fields = {
	slot8,
	slot9
}
CS_50003.is_extendable = false
CS_50003.extensions = {}
slot10.name = "result"
slot10.full_name = ".p50.sc_50004.result"
slot10.number = 1
slot10.index = 0
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
SC_50004.name = "sc_50004"
SC_50004.full_name = ".p50.sc_50004"
SC_50004.nested_types = {}
SC_50004.enum_types = {}
SC_50004.fields = {
	slot10
}
SC_50004.is_extendable = false
SC_50004.extensions = {}
slot11.name = "msg"
slot11.full_name = ".p50.sc_50005.msg"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = nil
slot11.message_type = MSG_INFO
slot11.type = 11
slot11.cpp_type = 10
SC_50005.name = "sc_50005"
SC_50005.full_name = ".p50.sc_50005"
SC_50005.nested_types = {}
SC_50005.enum_types = {}
SC_50005.fields = {
	slot11
}
SC_50005.is_extendable = false
SC_50005.extensions = {}
slot12.name = "id"
slot12.full_name = ".p50.cs_50006.id"
slot12.number = 1
slot12.index = 0
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
CS_50006.name = "cs_50006"
CS_50006.full_name = ".p50.cs_50006"
CS_50006.nested_types = {}
CS_50006.enum_types = {}
CS_50006.fields = {
	slot12
}
CS_50006.is_extendable = false
CS_50006.extensions = {}
slot13.name = "result"
slot13.full_name = ".p50.sc_50007.result"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
SC_50007.name = "sc_50007"
SC_50007.full_name = ".p50.sc_50007"
SC_50007.nested_types = {}
SC_50007.enum_types = {}
SC_50007.fields = {
	slot13
}
SC_50007.is_extendable = false
SC_50007.extensions = {}
slot14.name = "player"
slot14.full_name = ".p50.sc_50008.player"
slot14.number = 1
slot14.index = 0
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = nil
slot14.message_type = FRIEND_INFO
slot14.type = 11
slot14.cpp_type = 10
SC_50008.name = "sc_50008"
SC_50008.full_name = ".p50.sc_50008"
SC_50008.nested_types = {}
SC_50008.enum_types = {}
SC_50008.fields = {
	slot14
}
SC_50008.is_extendable = false
SC_50008.extensions = {}
slot15.name = "id"
slot15.full_name = ".p50.cs_50009.id"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
CS_50009.name = "cs_50009"
CS_50009.full_name = ".p50.cs_50009"
CS_50009.nested_types = {}
CS_50009.enum_types = {}
CS_50009.fields = {
	slot15
}
CS_50009.is_extendable = false
CS_50009.extensions = {}
slot16.name = "result"
slot16.full_name = ".p50.sc_50010.result"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
SC_50010.name = "sc_50010"
SC_50010.full_name = ".p50.sc_50010"
SC_50010.nested_types = {}
SC_50010.enum_types = {}
SC_50010.fields = {
	slot16
}
SC_50010.is_extendable = false
SC_50010.extensions = {}
slot17.name = "id"
slot17.full_name = ".p50.cs_50011.id"
slot17.number = 1
slot17.index = 0
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
CS_50011.name = "cs_50011"
CS_50011.full_name = ".p50.cs_50011"
CS_50011.nested_types = {}
CS_50011.enum_types = {}
CS_50011.fields = {
	slot17
}
CS_50011.is_extendable = false
CS_50011.extensions = {}
slot18.name = "result"
slot18.full_name = ".p50.sc_50012.result"
slot18.number = 1
slot18.index = 0
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
SC_50012.name = "sc_50012"
SC_50012.full_name = ".p50.sc_50012"
SC_50012.nested_types = {}
SC_50012.enum_types = {}
SC_50012.fields = {
	slot18
}
SC_50012.is_extendable = false
SC_50012.extensions = {}
slot19.name = "id"
slot19.full_name = ".p50.sc_50013.id"
slot19.number = 1
slot19.index = 0
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
SC_50013.name = "sc_50013"
SC_50013.full_name = ".p50.sc_50013"
SC_50013.nested_types = {}
SC_50013.enum_types = {}
SC_50013.fields = {
	slot19
}
SC_50013.is_extendable = false
SC_50013.extensions = {}
slot20.name = "type"
slot20.full_name = ".p50.cs_50014.type"
slot20.number = 1
slot20.index = 0
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
CS_50014.name = "cs_50014"
CS_50014.full_name = ".p50.cs_50014"
CS_50014.nested_types = {}
CS_50014.enum_types = {}
CS_50014.fields = {
	slot20
}
CS_50014.is_extendable = false
CS_50014.extensions = {}
slot21.name = "player_list"
slot21.full_name = ".p50.sc_50015.player_list"
slot21.number = 1
slot21.index = 0
slot21.label = 3
slot21.has_default_value = false
slot21.default_value = {}
slot21.message_type = PLAYER_INFO
slot21.type = 11
slot21.cpp_type = 10
SC_50015.name = "sc_50015"
SC_50015.full_name = ".p50.sc_50015"
SC_50015.nested_types = {}
SC_50015.enum_types = {}
SC_50015.fields = {
	slot21
}
SC_50015.is_extendable = false
SC_50015.extensions = {}
slot22.name = "type"
slot22.full_name = ".p50.cs_50016.type"
slot22.number = 1
slot22.index = 0
slot22.label = 2
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
CS_50016.name = "cs_50016"
CS_50016.full_name = ".p50.cs_50016"
CS_50016.nested_types = {}
CS_50016.enum_types = {}
CS_50016.fields = {
	slot22
}
CS_50016.is_extendable = false
CS_50016.extensions = {}
slot23.name = "black_list"
slot23.full_name = ".p50.sc_50017.black_list"
slot23.number = 3
slot23.index = 0
slot23.label = 3
slot23.has_default_value = false
slot23.default_value = {}
slot23.message_type = PLAYER_INFO
slot23.type = 11
slot23.cpp_type = 10
SC_50017.name = "sc_50017"
SC_50017.full_name = ".p50.sc_50017"
SC_50017.nested_types = {}
SC_50017.enum_types = {}
SC_50017.fields = {
	slot23
}
SC_50017.is_extendable = false
SC_50017.extensions = {}
slot24.name = "player"
slot24.full_name = ".p50.sc_50101.player"
slot24.number = 1
slot24.index = 0
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = nil
slot24.message_type = PLAYER_INFO
slot24.type = 11
slot24.cpp_type = 10
slot25.name = "type"
slot25.full_name = ".p50.sc_50101.type"
slot25.number = 2
slot25.index = 1
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
slot26.name = "content"
slot26.full_name = ".p50.sc_50101.content"
slot26.number = 3
slot26.index = 2
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = ""
slot26.type = 9
slot26.cpp_type = 9
SC_50101.name = "sc_50101"
SC_50101.full_name = ".p50.sc_50101"
SC_50101.nested_types = {}
SC_50101.enum_types = {}
SC_50101.fields = {
	slot24,
	slot25,
	slot26
}
SC_50101.is_extendable = false
SC_50101.extensions = {}
slot27.name = "type"
slot27.full_name = ".p50.cs_50102.type"
slot27.number = 1
slot27.index = 0
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "content"
slot28.full_name = ".p50.cs_50102.content"
slot28.number = 2
slot28.index = 1
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = ""
slot28.type = 9
slot28.cpp_type = 9
CS_50102.name = "cs_50102"
CS_50102.full_name = ".p50.cs_50102"
CS_50102.nested_types = {}
CS_50102.enum_types = {}
CS_50102.fields = {
	slot27,
	slot28
}
CS_50102.is_extendable = false
CS_50102.extensions = {}
slot29.name = "ad_id"
slot29.full_name = ".p50.sc_50103.ad_id"
slot29.number = 1
slot29.index = 0
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
slot30.name = "arg_list"
slot30.full_name = ".p50.sc_50103.arg_list"
slot30.number = 2
slot30.index = 1
slot30.label = 3
slot30.has_default_value = false
slot30.default_value = {}
slot30.message_type = AD_ARG
slot30.type = 11
slot30.cpp_type = 10
SC_50103.name = "sc_50103"
SC_50103.full_name = ".p50.sc_50103"
SC_50103.nested_types = {}
SC_50103.enum_types = {}
SC_50103.fields = {
	slot29,
	slot30
}
SC_50103.is_extendable = false
SC_50103.extensions = {}
slot31.name = "msg"
slot31.full_name = ".p50.sc_50104.msg"
slot31.number = 1
slot31.index = 0
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = nil
slot31.message_type = MSG_INFO
slot31.type = 11
slot31.cpp_type = 10
SC_50104.name = "sc_50104"
SC_50104.full_name = ".p50.sc_50104"
SC_50104.nested_types = {}
SC_50104.enum_types = {}
SC_50104.fields = {
	slot31
}
SC_50104.is_extendable = false
SC_50104.extensions = {}
slot32.name = "id"
slot32.full_name = ".p50.cs_50105.id"
slot32.number = 1
slot32.index = 0
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "content"
slot33.full_name = ".p50.cs_50105.content"
slot33.number = 2
slot33.index = 1
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = ""
slot33.type = 9
slot33.cpp_type = 9
CS_50105.name = "cs_50105"
CS_50105.full_name = ".p50.cs_50105"
CS_50105.nested_types = {}
CS_50105.enum_types = {}
CS_50105.fields = {
	slot32,
	slot33
}
CS_50105.is_extendable = false
CS_50105.extensions = {}
slot34.name = "result"
slot34.full_name = ".p50.sc_50106.result"
slot34.number = 1
slot34.index = 0
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = 0
slot34.type = 13
slot34.cpp_type = 3
SC_50106.name = "sc_50106"
SC_50106.full_name = ".p50.sc_50106"
SC_50106.nested_types = {}
SC_50106.enum_types = {}
SC_50106.fields = {
	slot34
}
SC_50106.is_extendable = false
SC_50106.extensions = {}
slot35.name = "id"
slot35.full_name = ".p50.cs_50107.id"
slot35.number = 1
slot35.index = 0
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
CS_50107.name = "cs_50107"
CS_50107.full_name = ".p50.cs_50107"
CS_50107.nested_types = {}
CS_50107.enum_types = {}
CS_50107.fields = {
	slot35
}
CS_50107.is_extendable = false
CS_50107.extensions = {}
slot36.name = "result"
slot36.full_name = ".p50.sc_50108.result"
slot36.number = 1
slot36.index = 0
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = 0
slot36.type = 13
slot36.cpp_type = 3
SC_50108.name = "sc_50108"
SC_50108.full_name = ".p50.sc_50108"
SC_50108.nested_types = {}
SC_50108.enum_types = {}
SC_50108.fields = {
	slot36
}
SC_50108.is_extendable = false
SC_50108.extensions = {}
slot37.name = "id"
slot37.full_name = ".p50.cs_50109.id"
slot37.number = 1
slot37.index = 0
slot37.label = 2
slot37.has_default_value = false
slot37.default_value = 0
slot37.type = 13
slot37.cpp_type = 3
CS_50109.name = "cs_50109"
CS_50109.full_name = ".p50.cs_50109"
CS_50109.nested_types = {}
CS_50109.enum_types = {}
CS_50109.fields = {
	slot37
}
CS_50109.is_extendable = false
CS_50109.extensions = {}
slot38.name = "result"
slot38.full_name = ".p50.sc_50110.result"
slot38.number = 1
slot38.index = 0
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
SC_50110.name = "sc_50110"
SC_50110.full_name = ".p50.sc_50110"
SC_50110.nested_types = {}
SC_50110.enum_types = {}
SC_50110.fields = {
	slot38
}
SC_50110.is_extendable = false
SC_50110.extensions = {}
slot39.name = "id"
slot39.full_name = ".p50.cs_50111.id"
slot39.number = 1
slot39.index = 0
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = 0
slot39.type = 13
slot39.cpp_type = 3
slot40.name = "info"
slot40.full_name = ".p50.cs_50111.info"
slot40.number = 2
slot40.index = 1
slot40.label = 2
slot40.has_default_value = false
slot40.default_value = ""
slot40.type = 9
slot40.cpp_type = 9
slot41.name = "content"
slot41.full_name = ".p50.cs_50111.content"
slot41.number = 3
slot41.index = 2
slot41.label = 2
slot41.has_default_value = false
slot41.default_value = ""
slot41.type = 9
slot41.cpp_type = 9
CS_50111.name = "cs_50111"
CS_50111.full_name = ".p50.cs_50111"
CS_50111.nested_types = {}
CS_50111.enum_types = {}
CS_50111.fields = {
	slot39,
	slot40,
	slot41
}
CS_50111.is_extendable = false
CS_50111.extensions = {}
slot42.name = "result"
slot42.full_name = ".p50.sc_50112.result"
slot42.number = 1
slot42.index = 0
slot42.label = 2
slot42.has_default_value = false
slot42.default_value = 0
slot42.type = 13
slot42.cpp_type = 3
SC_50112.name = "sc_50112"
SC_50112.full_name = ".p50.sc_50112"
SC_50112.nested_types = {}
SC_50112.enum_types = {}
SC_50112.fields = {
	slot42
}
SC_50112.is_extendable = false
SC_50112.extensions = {}
slot43.name = "timestamp"
slot43.full_name = ".p50.msg_info.timestamp"
slot43.number = 1
slot43.index = 0
slot43.label = 2
slot43.has_default_value = false
slot43.default_value = 0
slot43.type = 13
slot43.cpp_type = 3
slot44.name = "player"
slot44.full_name = ".p50.msg_info.player"
slot44.number = 2
slot44.index = 1
slot44.label = 2
slot44.has_default_value = false
slot44.default_value = nil
slot44.message_type = PLAYER_INFO
slot44.type = 11
slot44.cpp_type = 10
slot45.name = "content"
slot45.full_name = ".p50.msg_info.content"
slot45.number = 3
slot45.index = 2
slot45.label = 2
slot45.has_default_value = false
slot45.default_value = ""
slot45.type = 9
slot45.cpp_type = 9
MSG_INFO.name = "msg_info"
MSG_INFO.full_name = ".p50.msg_info"
MSG_INFO.nested_types = {}
MSG_INFO.enum_types = {}
MSG_INFO.fields = {
	slot43,
	slot44,
	slot45
}
MSG_INFO.is_extendable = false
MSG_INFO.extensions = {}
slot46.name = "id"
slot46.full_name = ".p50.detail_info.id"
slot46.number = 1
slot46.index = 0
slot46.label = 2
slot46.has_default_value = false
slot46.default_value = 0
slot46.type = 13
slot46.cpp_type = 3
slot47.name = "name"
slot47.full_name = ".p50.detail_info.name"
slot47.number = 2
slot47.index = 1
slot47.label = 2
slot47.has_default_value = false
slot47.default_value = ""
slot47.type = 9
slot47.cpp_type = 9
slot48.name = "title"
slot48.full_name = ".p50.detail_info.title"
slot48.number = 3
slot48.index = 2
slot48.label = 2
slot48.has_default_value = false
slot48.default_value = 0
slot48.type = 13
slot48.cpp_type = 3
slot49.name = "lv"
slot49.full_name = ".p50.detail_info.lv"
slot49.number = 4
slot49.index = 3
slot49.label = 2
slot49.has_default_value = false
slot49.default_value = 0
slot49.type = 13
slot49.cpp_type = 3
slot50.name = "ship_count"
slot50.full_name = ".p50.detail_info.ship_count"
slot50.number = 5
slot50.index = 4
slot50.label = 2
slot50.has_default_value = false
slot50.default_value = 0
slot50.type = 13
slot50.cpp_type = 3
slot51.name = "collection_count"
slot51.full_name = ".p50.detail_info.collection_count"
slot51.number = 6
slot51.index = 5
slot51.label = 2
slot51.has_default_value = false
slot51.default_value = 0
slot51.type = 13
slot51.cpp_type = 3
slot52.name = "pvp_attack_count"
slot52.full_name = ".p50.detail_info.pvp_attack_count"
slot52.number = 7
slot52.index = 6
slot52.label = 2
slot52.has_default_value = false
slot52.default_value = 0
slot52.type = 13
slot52.cpp_type = 3
slot53.name = "pvp_win_count"
slot53.full_name = ".p50.detail_info.pvp_win_count"
slot53.number = 8
slot53.index = 7
slot53.label = 2
slot53.has_default_value = false
slot53.default_value = 0
slot53.type = 13
slot53.cpp_type = 3
slot54.name = "collect_attack_count"
slot54.full_name = ".p50.detail_info.collect_attack_count"
slot54.number = 9
slot54.index = 8
slot54.label = 2
slot54.has_default_value = false
slot54.default_value = 0
slot54.type = 13
slot54.cpp_type = 3
slot55.name = "attack_count"
slot55.full_name = ".p50.detail_info.attack_count"
slot55.number = 10
slot55.index = 9
slot55.label = 2
slot55.has_default_value = false
slot55.default_value = 0
slot55.type = 13
slot55.cpp_type = 3
slot56.name = "win_count"
slot56.full_name = ".p50.detail_info.win_count"
slot56.number = 11
slot56.index = 10
slot56.label = 2
slot56.has_default_value = false
slot56.default_value = 0
slot56.type = 13
slot56.cpp_type = 3
slot57.name = "adv"
slot57.full_name = ".p50.detail_info.adv"
slot57.number = 12
slot57.index = 11
slot57.label = 2
slot57.has_default_value = false
slot57.default_value = ""
slot57.type = 9
slot57.cpp_type = 9
slot58.name = "online"
slot58.full_name = ".p50.detail_info.online"
slot58.number = 13
slot58.index = 12
slot58.label = 2
slot58.has_default_value = false
slot58.default_value = 0
slot58.type = 13
slot58.cpp_type = 3
slot59.name = "pre_online_time"
slot59.full_name = ".p50.detail_info.pre_online_time"
slot59.number = 14
slot59.index = 13
slot59.label = 2
slot59.has_default_value = false
slot59.default_value = 0
slot59.type = 13
slot59.cpp_type = 3
slot60.name = "score"
slot60.full_name = ".p50.detail_info.score"
slot60.number = 15
slot60.index = 14
slot60.label = 2
slot60.has_default_value = false
slot60.default_value = 0
slot60.type = 13
slot60.cpp_type = 3
slot61.name = "medal_id"
slot61.full_name = ".p50.detail_info.medal_id"
slot61.number = 16
slot61.index = 15
slot61.label = 3
slot61.has_default_value = false
slot61.default_value = {}
slot61.type = 13
slot61.cpp_type = 3
slot62.name = "display"
slot62.full_name = ".p50.detail_info.display"
slot62.number = 17
slot62.index = 16
slot62.label = 1
slot62.has_default_value = false
slot62.default_value = nil
slot62.message_type = slot1.DISPLAYINFO
slot62.type = 11
slot62.cpp_type = 10
DETAIL_INFO.name = "detail_info"
DETAIL_INFO.full_name = ".p50.detail_info"
DETAIL_INFO.nested_types = {}
DETAIL_INFO.enum_types = {}
DETAIL_INFO.fields = {
	slot46,
	slot47,
	slot48,
	slot49,
	slot50,
	slot51,
	slot52,
	slot53,
	slot54,
	slot55,
	slot56,
	slot57,
	slot58,
	slot59,
	slot60,
	slot61,
	slot62
}
DETAIL_INFO.is_extendable = false
DETAIL_INFO.extensions = {}
slot63.name = "id"
slot63.full_name = ".p50.friend_info.id"
slot63.number = 1
slot63.index = 0
slot63.label = 2
slot63.has_default_value = false
slot63.default_value = 0
slot63.type = 13
slot63.cpp_type = 3
slot64.name = "name"
slot64.full_name = ".p50.friend_info.name"
slot64.number = 2
slot64.index = 1
slot64.label = 2
slot64.has_default_value = false
slot64.default_value = ""
slot64.type = 9
slot64.cpp_type = 9
slot65.name = "lv"
slot65.full_name = ".p50.friend_info.lv"
slot65.number = 3
slot65.index = 2
slot65.label = 2
slot65.has_default_value = false
slot65.default_value = 0
slot65.type = 13
slot65.cpp_type = 3
slot66.name = "adv"
slot66.full_name = ".p50.friend_info.adv"
slot66.number = 4
slot66.index = 3
slot66.label = 2
slot66.has_default_value = false
slot66.default_value = ""
slot66.type = 9
slot66.cpp_type = 9
slot67.name = "online"
slot67.full_name = ".p50.friend_info.online"
slot67.number = 5
slot67.index = 4
slot67.label = 2
slot67.has_default_value = false
slot67.default_value = 0
slot67.type = 13
slot67.cpp_type = 3
slot68.name = "pre_online_time"
slot68.full_name = ".p50.friend_info.pre_online_time"
slot68.number = 6
slot68.index = 5
slot68.label = 2
slot68.has_default_value = false
slot68.default_value = 0
slot68.type = 13
slot68.cpp_type = 3
slot69.name = "display"
slot69.full_name = ".p50.friend_info.display"
slot69.number = 7
slot69.index = 6
slot69.label = 1
slot69.has_default_value = false
slot69.default_value = nil
slot69.message_type = slot1.DISPLAYINFO
slot69.type = 11
slot69.cpp_type = 10
FRIEND_INFO.name = "friend_info"
FRIEND_INFO.full_name = ".p50.friend_info"
FRIEND_INFO.nested_types = {}
FRIEND_INFO.enum_types = {}
FRIEND_INFO.fields = {
	slot63,
	slot64,
	slot65,
	slot66,
	slot67,
	slot68,
	slot69
}
FRIEND_INFO.is_extendable = false
FRIEND_INFO.extensions = {}
slot70.name = "id"
slot70.full_name = ".p50.player_info.id"
slot70.number = 1
slot70.index = 0
slot70.label = 2
slot70.has_default_value = false
slot70.default_value = 0
slot70.type = 13
slot70.cpp_type = 3
slot71.name = "name"
slot71.full_name = ".p50.player_info.name"
slot71.number = 2
slot71.index = 1
slot71.label = 2
slot71.has_default_value = false
slot71.default_value = ""
slot71.type = 9
slot71.cpp_type = 9
slot72.name = "lv"
slot72.full_name = ".p50.player_info.lv"
slot72.number = 3
slot72.index = 2
slot72.label = 2
slot72.has_default_value = false
slot72.default_value = 0
slot72.type = 13
slot72.cpp_type = 3
slot73.name = "display"
slot73.full_name = ".p50.player_info.display"
slot73.number = 4
slot73.index = 3
slot73.label = 1
slot73.has_default_value = false
slot73.default_value = nil
slot73.message_type = slot1.DISPLAYINFO
slot73.type = 11
slot73.cpp_type = 10
PLAYER_INFO.name = "player_info"
PLAYER_INFO.full_name = ".p50.player_info"
PLAYER_INFO.nested_types = {}
PLAYER_INFO.enum_types = {}
PLAYER_INFO.fields = {
	slot70,
	slot71,
	slot72,
	slot73
}
PLAYER_INFO.is_extendable = false
PLAYER_INFO.extensions = {}
slot74.name = "type"
slot74.full_name = ".p50.ad_arg.type"
slot74.number = 1
slot74.index = 0
slot74.label = 2
slot74.has_default_value = false
slot74.default_value = 0
slot74.type = 13
slot74.cpp_type = 3
slot75.name = "string"
slot75.full_name = ".p50.ad_arg.string"
slot75.number = 2
slot75.index = 1
slot75.label = 1
slot75.has_default_value = false
slot75.default_value = ""
slot75.type = 9
slot75.cpp_type = 9
slot76.name = "int"
slot76.full_name = ".p50.ad_arg.int"
slot76.number = 3
slot76.index = 2
slot76.label = 1
slot76.has_default_value = false
slot76.default_value = 0
slot76.type = 13
slot76.cpp_type = 3
AD_ARG.name = "ad_arg"
AD_ARG.full_name = ".p50.ad_arg"
AD_ARG.nested_types = {}
AD_ARG.enum_types = {}
AD_ARG.fields = {
	slot74,
	slot75,
	slot76
}
AD_ARG.is_extendable = false
AD_ARG.extensions = {}
ad_arg = slot0.Message(AD_ARG)
cs_50001 = slot0.Message(CS_50001)
cs_50003 = slot0.Message(CS_50003)
cs_50006 = slot0.Message(CS_50006)
cs_50009 = slot0.Message(CS_50009)
cs_50011 = slot0.Message(CS_50011)
cs_50014 = slot0.Message(CS_50014)
cs_50016 = slot0.Message(CS_50016)
cs_50102 = slot0.Message(CS_50102)
cs_50105 = slot0.Message(CS_50105)
cs_50107 = slot0.Message(CS_50107)
cs_50109 = slot0.Message(CS_50109)
cs_50111 = slot0.Message(CS_50111)
detail_info = slot0.Message(DETAIL_INFO)
friend_info = slot0.Message(FRIEND_INFO)
msg_info = slot0.Message(MSG_INFO)
player_info = slot0.Message(PLAYER_INFO)
sc_50000 = slot0.Message(SC_50000)
sc_50002 = slot0.Message(SC_50002)
sc_50004 = slot0.Message(SC_50004)
sc_50005 = slot0.Message(SC_50005)
sc_50007 = slot0.Message(SC_50007)
sc_50008 = slot0.Message(SC_50008)
sc_50010 = slot0.Message(SC_50010)
sc_50012 = slot0.Message(SC_50012)
sc_50013 = slot0.Message(SC_50013)
sc_50015 = slot0.Message(SC_50015)
sc_50017 = slot0.Message(SC_50017)
sc_50101 = slot0.Message(SC_50101)
sc_50103 = slot0.Message(SC_50103)
sc_50104 = slot0.Message(SC_50104)
sc_50106 = slot0.Message(SC_50106)
sc_50108 = slot0.Message(SC_50108)
sc_50110 = slot0.Message(SC_50110)
sc_50112 = slot0.Message(SC_50112)

return
