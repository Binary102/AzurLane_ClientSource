slot0 = require("protobuf")
slot1 = require("common_pb")

module("p25_pb")

SC_25001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
CS_25002 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
SC_25003 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
CS_25004 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
SC_25005 = slot0.Descriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
slot11 = slot0.FieldDescriptor()
CS_25006 = slot0.Descriptor()
slot12 = slot0.FieldDescriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
SC_25007 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
CS_25008 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
SC_25009 = slot0.Descriptor()
slot18 = slot0.FieldDescriptor()
CS_25010 = slot0.Descriptor()
slot19 = slot0.FieldDescriptor()
SC_25011 = slot0.Descriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
CS_25012 = slot0.Descriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
SC_25013 = slot0.Descriptor()
slot25 = slot0.FieldDescriptor()
CS_25014 = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
SC_25015 = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
CS_25016 = slot0.Descriptor()
slot28 = slot0.FieldDescriptor()
slot29 = slot0.FieldDescriptor()
SC_25017 = slot0.Descriptor()
slot30 = slot0.FieldDescriptor()
CS_25018 = slot0.Descriptor()
slot31 = slot0.FieldDescriptor()
SC_25019 = slot0.Descriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
CS_25020 = slot0.Descriptor()
slot34 = slot0.FieldDescriptor()
slot35 = slot0.FieldDescriptor()
SC_25021 = slot0.Descriptor()
slot36 = slot0.FieldDescriptor()
COMMANDERBOXINFO = slot0.Descriptor()
slot37 = slot0.FieldDescriptor()
slot38 = slot0.FieldDescriptor()
slot39 = slot0.FieldDescriptor()
slot40 = slot0.FieldDescriptor()
slot2.name = "commanders"
slot2.full_name = ".p25.sc_25001.commanders"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = slot1.COMMANDERINFO
slot2.type = 11
slot2.cpp_type = 10
slot3.name = "box"
slot3.full_name = ".p25.sc_25001.box"
slot3.number = 2
slot3.index = 1
slot3.label = 3
slot3.has_default_value = false
slot3.default_value = {}
slot3.message_type = COMMANDERBOXINFO
slot3.type = 11
slot3.cpp_type = 10
slot4.name = "usage_count"
slot4.full_name = ".p25.sc_25001.usage_count"
slot4.number = 3
slot4.index = 2
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
SC_25001.name = "sc_25001"
SC_25001.full_name = ".p25.sc_25001"
SC_25001.nested_types = {}
SC_25001.enum_types = {}
SC_25001.fields = {
	slot2,
	slot3,
	slot4
}
SC_25001.is_extendable = false
SC_25001.extensions = {}
slot5.name = "boxid"
slot5.full_name = ".p25.cs_25002.boxid"
slot5.number = 1
slot5.index = 0
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
CS_25002.name = "cs_25002"
CS_25002.full_name = ".p25.cs_25002"
CS_25002.nested_types = {}
CS_25002.enum_types = {}
CS_25002.fields = {
	slot5
}
CS_25002.is_extendable = false
CS_25002.extensions = {}
slot6.name = "result"
slot6.full_name = ".p25.sc_25003.result"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "box"
slot7.full_name = ".p25.sc_25003.box"
slot7.number = 2
slot7.index = 1
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = nil
slot7.message_type = COMMANDERBOXINFO
slot7.type = 11
slot7.cpp_type = 10
SC_25003.name = "sc_25003"
SC_25003.full_name = ".p25.sc_25003"
SC_25003.nested_types = {}
SC_25003.enum_types = {}
SC_25003.fields = {
	slot6,
	slot7
}
SC_25003.is_extendable = false
SC_25003.extensions = {}
slot8.name = "boxid"
slot8.full_name = ".p25.cs_25004.boxid"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
CS_25004.name = "cs_25004"
CS_25004.full_name = ".p25.cs_25004"
CS_25004.nested_types = {}
CS_25004.enum_types = {}
CS_25004.fields = {
	slot8
}
CS_25004.is_extendable = false
CS_25004.extensions = {}
slot9.name = "result"
slot9.full_name = ".p25.sc_25005.result"
slot9.number = 1
slot9.index = 0
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "commander"
slot10.full_name = ".p25.sc_25005.commander"
slot10.number = 2
slot10.index = 1
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = nil
slot10.message_type = slot1.COMMANDERINFO
slot10.type = 11
slot10.cpp_type = 10
slot11.name = "finish_time"
slot11.full_name = ".p25.sc_25005.finish_time"
slot11.number = 3
slot11.index = 2
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
SC_25005.name = "sc_25005"
SC_25005.full_name = ".p25.sc_25005"
SC_25005.nested_types = {}
SC_25005.enum_types = {}
SC_25005.fields = {
	slot9,
	slot10,
	slot11
}
SC_25005.is_extendable = false
SC_25005.extensions = {}
slot12.name = "groupid"
slot12.full_name = ".p25.cs_25006.groupid"
slot12.number = 1
slot12.index = 0
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
slot13.name = "pos"
slot13.full_name = ".p25.cs_25006.pos"
slot13.number = 2
slot13.index = 1
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "commanderid"
slot14.full_name = ".p25.cs_25006.commanderid"
slot14.number = 3
slot14.index = 2
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
CS_25006.name = "cs_25006"
CS_25006.full_name = ".p25.cs_25006"
CS_25006.nested_types = {}
CS_25006.enum_types = {}
CS_25006.fields = {
	slot12,
	slot13,
	slot14
}
CS_25006.is_extendable = false
CS_25006.extensions = {}
slot15.name = "result"
slot15.full_name = ".p25.sc_25007.result"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
SC_25007.name = "sc_25007"
SC_25007.full_name = ".p25.sc_25007"
SC_25007.nested_types = {}
SC_25007.enum_types = {}
SC_25007.fields = {
	slot15
}
SC_25007.is_extendable = false
SC_25007.extensions = {}
slot16.name = "targetid"
slot16.full_name = ".p25.cs_25008.targetid"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "materialid"
slot17.full_name = ".p25.cs_25008.materialid"
slot17.number = 2
slot17.index = 1
slot17.label = 3
slot17.has_default_value = false
slot17.default_value = {}
slot17.type = 13
slot17.cpp_type = 3
CS_25008.name = "cs_25008"
CS_25008.full_name = ".p25.cs_25008"
CS_25008.nested_types = {}
CS_25008.enum_types = {}
CS_25008.fields = {
	slot16,
	slot17
}
CS_25008.is_extendable = false
CS_25008.extensions = {}
slot18.name = "result"
slot18.full_name = ".p25.sc_25009.result"
slot18.number = 1
slot18.index = 0
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
SC_25009.name = "sc_25009"
SC_25009.full_name = ".p25.sc_25009"
SC_25009.nested_types = {}
SC_25009.enum_types = {}
SC_25009.fields = {
	slot18
}
SC_25009.is_extendable = false
SC_25009.extensions = {}
slot19.name = "commanderid"
slot19.full_name = ".p25.cs_25010.commanderid"
slot19.number = 1
slot19.index = 0
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
CS_25010.name = "cs_25010"
CS_25010.full_name = ".p25.cs_25010"
CS_25010.nested_types = {}
CS_25010.enum_types = {}
CS_25010.fields = {
	slot19
}
CS_25010.is_extendable = false
CS_25010.extensions = {}
slot20.name = "result"
slot20.full_name = ".p25.sc_25011.result"
slot20.number = 1
slot20.index = 0
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "abilityid"
slot21.full_name = ".p25.sc_25011.abilityid"
slot21.number = 2
slot21.index = 1
slot21.label = 3
slot21.has_default_value = false
slot21.default_value = {}
slot21.type = 13
slot21.cpp_type = 3
SC_25011.name = "sc_25011"
SC_25011.full_name = ".p25.sc_25011"
SC_25011.nested_types = {}
SC_25011.enum_types = {}
SC_25011.fields = {
	slot20,
	slot21
}
SC_25011.is_extendable = false
SC_25011.extensions = {}
slot22.name = "commanderid"
slot22.full_name = ".p25.cs_25012.commanderid"
slot22.number = 1
slot22.index = 0
slot22.label = 2
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
slot23.name = "targetid"
slot23.full_name = ".p25.cs_25012.targetid"
slot23.number = 2
slot23.index = 1
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "replaceid"
slot24.full_name = ".p25.cs_25012.replaceid"
slot24.number = 3
slot24.index = 2
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
CS_25012.name = "cs_25012"
CS_25012.full_name = ".p25.cs_25012"
CS_25012.nested_types = {}
CS_25012.enum_types = {}
CS_25012.fields = {
	slot22,
	slot23,
	slot24
}
CS_25012.is_extendable = false
CS_25012.extensions = {}
slot25.name = "result"
slot25.full_name = ".p25.sc_25013.result"
slot25.number = 1
slot25.index = 0
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
SC_25013.name = "sc_25013"
SC_25013.full_name = ".p25.sc_25013"
SC_25013.nested_types = {}
SC_25013.enum_types = {}
SC_25013.fields = {
	slot25
}
SC_25013.is_extendable = false
SC_25013.extensions = {}
slot26.name = "commanderid"
slot26.full_name = ".p25.cs_25014.commanderid"
slot26.number = 1
slot26.index = 0
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
CS_25014.name = "cs_25014"
CS_25014.full_name = ".p25.cs_25014"
CS_25014.nested_types = {}
CS_25014.enum_types = {}
CS_25014.fields = {
	slot26
}
CS_25014.is_extendable = false
CS_25014.extensions = {}
slot27.name = "result"
slot27.full_name = ".p25.sc_25015.result"
slot27.number = 1
slot27.index = 0
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
SC_25015.name = "sc_25015"
SC_25015.full_name = ".p25.sc_25015"
SC_25015.nested_types = {}
SC_25015.enum_types = {}
SC_25015.fields = {
	slot27
}
SC_25015.is_extendable = false
SC_25015.extensions = {}
slot28.name = "commanderid"
slot28.full_name = ".p25.cs_25016.commanderid"
slot28.number = 1
slot28.index = 0
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
slot29.name = "flag"
slot29.full_name = ".p25.cs_25016.flag"
slot29.number = 2
slot29.index = 1
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
CS_25016.name = "cs_25016"
CS_25016.full_name = ".p25.cs_25016"
CS_25016.nested_types = {}
CS_25016.enum_types = {}
CS_25016.fields = {
	slot28,
	slot29
}
CS_25016.is_extendable = false
CS_25016.extensions = {}
slot30.name = "result"
slot30.full_name = ".p25.sc_25017.result"
slot30.number = 1
slot30.index = 0
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
SC_25017.name = "sc_25017"
SC_25017.full_name = ".p25.sc_25017"
SC_25017.nested_types = {}
SC_25017.enum_types = {}
SC_25017.fields = {
	slot30
}
SC_25017.is_extendable = false
SC_25017.extensions = {}
slot31.name = "type"
slot31.full_name = ".p25.cs_25018.type"
slot31.number = 1
slot31.index = 0
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
CS_25018.name = "cs_25018"
CS_25018.full_name = ".p25.cs_25018"
CS_25018.nested_types = {}
CS_25018.enum_types = {}
CS_25018.fields = {
	slot31
}
CS_25018.is_extendable = false
CS_25018.extensions = {}
slot32.name = "result"
slot32.full_name = ".p25.sc_25019.result"
slot32.number = 1
slot32.index = 0
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "awards"
slot33.full_name = ".p25.sc_25019.awards"
slot33.number = 2
slot33.index = 1
slot33.label = 3
slot33.has_default_value = false
slot33.default_value = {}
slot33.message_type = slot1.DROPINFO
slot33.type = 11
slot33.cpp_type = 10
SC_25019.name = "sc_25019"
SC_25019.full_name = ".p25.sc_25019"
SC_25019.nested_types = {}
SC_25019.enum_types = {}
SC_25019.fields = {
	slot32,
	slot33
}
SC_25019.is_extendable = false
SC_25019.extensions = {}
slot34.name = "name"
slot34.full_name = ".p25.cs_25020.name"
slot34.number = 1
slot34.index = 0
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = ""
slot34.type = 9
slot34.cpp_type = 9
slot35.name = "commanderid"
slot35.full_name = ".p25.cs_25020.commanderid"
slot35.number = 2
slot35.index = 1
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
CS_25020.name = "cs_25020"
CS_25020.full_name = ".p25.cs_25020"
CS_25020.nested_types = {}
CS_25020.enum_types = {}
CS_25020.fields = {
	slot34,
	slot35
}
CS_25020.is_extendable = false
CS_25020.extensions = {}
slot36.name = "result"
slot36.full_name = ".p25.sc_25021.result"
slot36.number = 1
slot36.index = 0
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = 0
slot36.type = 13
slot36.cpp_type = 3
SC_25021.name = "sc_25021"
SC_25021.full_name = ".p25.sc_25021"
SC_25021.nested_types = {}
SC_25021.enum_types = {}
SC_25021.fields = {
	slot36
}
SC_25021.is_extendable = false
SC_25021.extensions = {}
slot37.name = "id"
slot37.full_name = ".p25.commanderboxinfo.id"
slot37.number = 1
slot37.index = 0
slot37.label = 2
slot37.has_default_value = false
slot37.default_value = 0
slot37.type = 13
slot37.cpp_type = 3
slot38.name = "poolId"
slot38.full_name = ".p25.commanderboxinfo.poolId"
slot38.number = 2
slot38.index = 1
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
slot39.name = "finish_time"
slot39.full_name = ".p25.commanderboxinfo.finish_time"
slot39.number = 3
slot39.index = 2
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = 0
slot39.type = 13
slot39.cpp_type = 3
slot40.name = "begin_time"
slot40.full_name = ".p25.commanderboxinfo.begin_time"
slot40.number = 4
slot40.index = 3
slot40.label = 2
slot40.has_default_value = false
slot40.default_value = 0
slot40.type = 13
slot40.cpp_type = 3
COMMANDERBOXINFO.name = "commanderboxinfo"
COMMANDERBOXINFO.full_name = ".p25.commanderboxinfo"
COMMANDERBOXINFO.nested_types = {}
COMMANDERBOXINFO.enum_types = {}
COMMANDERBOXINFO.fields = {
	slot37,
	slot38,
	slot39,
	slot40
}
COMMANDERBOXINFO.is_extendable = false
COMMANDERBOXINFO.extensions = {}
commanderboxinfo = slot0.Message(COMMANDERBOXINFO)
cs_25002 = slot0.Message(CS_25002)
cs_25004 = slot0.Message(CS_25004)
cs_25006 = slot0.Message(CS_25006)
cs_25008 = slot0.Message(CS_25008)
cs_25010 = slot0.Message(CS_25010)
cs_25012 = slot0.Message(CS_25012)
cs_25014 = slot0.Message(CS_25014)
cs_25016 = slot0.Message(CS_25016)
cs_25018 = slot0.Message(CS_25018)
cs_25020 = slot0.Message(CS_25020)
sc_25001 = slot0.Message(SC_25001)
sc_25003 = slot0.Message(SC_25003)
sc_25005 = slot0.Message(SC_25005)
sc_25007 = slot0.Message(SC_25007)
sc_25009 = slot0.Message(SC_25009)
sc_25011 = slot0.Message(SC_25011)
sc_25013 = slot0.Message(SC_25013)
sc_25015 = slot0.Message(SC_25015)
sc_25017 = slot0.Message(SC_25017)
sc_25019 = slot0.Message(SC_25019)
sc_25021 = slot0.Message(SC_25021)

return
