slot0 = require("protobuf")
slot1 = require("common_pb")

module("p63_pb")

SC_63000 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
CS_63001 = slot0.Descriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
SC_63002 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
CS_63003 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
slot8 = slot0.FieldDescriptor()
SC_63004 = slot0.Descriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
CS_63005 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
SC_63006 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
CS_63007 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
SC_63008 = slot0.Descriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
TECHNOLOGYINFO = slot0.Descriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
SC_63100 = slot0.Descriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
CS_63200 = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
SC_63201 = slot0.Descriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
CS_63202 = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
SC_63203 = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
CS_63204 = slot0.Descriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
SC_63205 = slot0.Descriptor()
slot31 = slot0.FieldDescriptor()
CS_63206 = slot0.Descriptor()
slot32 = slot0.FieldDescriptor()
SC_63207 = slot0.Descriptor()
slot33 = slot0.FieldDescriptor()
CS_63208 = slot0.Descriptor()
slot34 = slot0.FieldDescriptor()
SC_63209 = slot0.Descriptor()
slot35 = slot0.FieldDescriptor()
BLUPRINTINFO = slot0.Descriptor()
slot36 = slot0.FieldDescriptor()
slot37 = slot0.FieldDescriptor()
slot38 = slot0.FieldDescriptor()
slot39 = slot0.FieldDescriptor()
slot40 = slot0.FieldDescriptor()
slot41 = slot0.FieldDescriptor()
slot2.name = "tech_list"
slot2.full_name = ".p63.sc_63000.tech_list"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = TECHNOLOGYINFO
slot2.type = 11
slot2.cpp_type = 10
slot3.name = "refresh_flag"
slot3.full_name = ".p63.sc_63000.refresh_flag"
slot3.number = 2
slot3.index = 1
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
SC_63000.name = "sc_63000"
SC_63000.full_name = ".p63.sc_63000"
SC_63000.nested_types = {}
SC_63000.enum_types = {}
SC_63000.fields = {
	slot2,
	slot3
}
SC_63000.is_extendable = false
SC_63000.extensions = {}
slot4.name = "tech_id"
slot4.full_name = ".p63.cs_63001.tech_id"
slot4.number = 1
slot4.index = 0
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "type"
slot5.full_name = ".p63.cs_63001.type"
slot5.number = 2
slot5.index = 1
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
CS_63001.name = "cs_63001"
CS_63001.full_name = ".p63.cs_63001"
CS_63001.nested_types = {}
CS_63001.enum_types = {}
CS_63001.fields = {
	slot4,
	slot5
}
CS_63001.is_extendable = false
CS_63001.extensions = {}
slot6.name = "result"
slot6.full_name = ".p63.sc_63002.result"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
SC_63002.name = "sc_63002"
SC_63002.full_name = ".p63.sc_63002"
SC_63002.nested_types = {}
SC_63002.enum_types = {}
SC_63002.fields = {
	slot6
}
SC_63002.is_extendable = false
SC_63002.extensions = {}
slot7.name = "tech_id"
slot7.full_name = ".p63.cs_63003.tech_id"
slot7.number = 1
slot7.index = 0
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = 0
slot7.type = 13
slot7.cpp_type = 3
slot8.name = "type"
slot8.full_name = ".p63.cs_63003.type"
slot8.number = 2
slot8.index = 1
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
CS_63003.name = "cs_63003"
CS_63003.full_name = ".p63.cs_63003"
CS_63003.nested_types = {}
CS_63003.enum_types = {}
CS_63003.fields = {
	slot7,
	slot8
}
CS_63003.is_extendable = false
CS_63003.extensions = {}
slot9.name = "result"
slot9.full_name = ".p63.sc_63004.result"
slot9.number = 1
slot9.index = 0
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "common_list"
slot10.full_name = ".p63.sc_63004.common_list"
slot10.number = 2
slot10.index = 1
slot10.label = 3
slot10.has_default_value = false
slot10.default_value = {}
slot10.message_type = slot1.DROPINFO
slot10.type = 11
slot10.cpp_type = 10
slot11.name = "tech_list"
slot11.full_name = ".p63.sc_63004.tech_list"
slot11.number = 3
slot11.index = 2
slot11.label = 3
slot11.has_default_value = false
slot11.default_value = {}
slot11.message_type = TECHNOLOGYINFO
slot11.type = 11
slot11.cpp_type = 10
slot12.name = "drop_list"
slot12.full_name = ".p63.sc_63004.drop_list"
slot12.number = 4
slot12.index = 3
slot12.label = 3
slot12.has_default_value = false
slot12.default_value = {}
slot12.message_type = slot1.DROPINFO
slot12.type = 11
slot12.cpp_type = 10
SC_63004.name = "sc_63004"
SC_63004.full_name = ".p63.sc_63004"
SC_63004.nested_types = {}
SC_63004.enum_types = {}
SC_63004.fields = {
	slot9,
	slot10,
	slot11,
	slot12
}
SC_63004.is_extendable = false
SC_63004.extensions = {}
slot13.name = "tech_id"
slot13.full_name = ".p63.cs_63005.tech_id"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "type"
slot14.full_name = ".p63.cs_63005.type"
slot14.number = 2
slot14.index = 1
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
CS_63005.name = "cs_63005"
CS_63005.full_name = ".p63.cs_63005"
CS_63005.nested_types = {}
CS_63005.enum_types = {}
CS_63005.fields = {
	slot13,
	slot14
}
CS_63005.is_extendable = false
CS_63005.extensions = {}
slot15.name = "result"
slot15.full_name = ".p63.sc_63006.result"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
SC_63006.name = "sc_63006"
SC_63006.full_name = ".p63.sc_63006"
SC_63006.nested_types = {}
SC_63006.enum_types = {}
SC_63006.fields = {
	slot15
}
SC_63006.is_extendable = false
SC_63006.extensions = {}
slot16.name = "type"
slot16.full_name = ".p63.cs_63007.type"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
CS_63007.name = "cs_63007"
CS_63007.full_name = ".p63.cs_63007"
CS_63007.nested_types = {}
CS_63007.enum_types = {}
CS_63007.fields = {
	slot16
}
CS_63007.is_extendable = false
CS_63007.extensions = {}
slot17.name = "result"
slot17.full_name = ".p63.sc_63008.result"
slot17.number = 1
slot17.index = 0
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
slot18.name = "tech_list"
slot18.full_name = ".p63.sc_63008.tech_list"
slot18.number = 2
slot18.index = 1
slot18.label = 3
slot18.has_default_value = false
slot18.default_value = {}
slot18.message_type = TECHNOLOGYINFO
slot18.type = 11
slot18.cpp_type = 10
SC_63008.name = "sc_63008"
SC_63008.full_name = ".p63.sc_63008"
SC_63008.nested_types = {}
SC_63008.enum_types = {}
SC_63008.fields = {
	slot17,
	slot18
}
SC_63008.is_extendable = false
SC_63008.extensions = {}
slot19.name = "id"
slot19.full_name = ".p63.technologyinfo.id"
slot19.number = 1
slot19.index = 0
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "time"
slot20.full_name = ".p63.technologyinfo.time"
slot20.number = 2
slot20.index = 1
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
TECHNOLOGYINFO.name = "technologyinfo"
TECHNOLOGYINFO.full_name = ".p63.technologyinfo"
TECHNOLOGYINFO.nested_types = {}
TECHNOLOGYINFO.enum_types = {}
TECHNOLOGYINFO.fields = {
	slot19,
	slot20
}
TECHNOLOGYINFO.is_extendable = false
TECHNOLOGYINFO.extensions = {}
slot21.name = "blueprint_list"
slot21.full_name = ".p63.sc_63100.blueprint_list"
slot21.number = 1
slot21.index = 0
slot21.label = 3
slot21.has_default_value = false
slot21.default_value = {}
slot21.message_type = BLUPRINTINFO
slot21.type = 11
slot21.cpp_type = 10
slot22.name = "cold_time"
slot22.full_name = ".p63.sc_63100.cold_time"
slot22.number = 2
slot22.index = 1
slot22.label = 2
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
SC_63100.name = "sc_63100"
SC_63100.full_name = ".p63.sc_63100"
SC_63100.nested_types = {}
SC_63100.enum_types = {}
SC_63100.fields = {
	slot21,
	slot22
}
SC_63100.is_extendable = false
SC_63100.extensions = {}
slot23.name = "blueprint_id"
slot23.full_name = ".p63.cs_63200.blueprint_id"
slot23.number = 1
slot23.index = 0
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
CS_63200.name = "cs_63200"
CS_63200.full_name = ".p63.cs_63200"
CS_63200.nested_types = {}
CS_63200.enum_types = {}
CS_63200.fields = {
	slot23
}
CS_63200.is_extendable = false
CS_63200.extensions = {}
slot24.name = "result"
slot24.full_name = ".p63.sc_63201.result"
slot24.number = 1
slot24.index = 0
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
slot25.name = "time"
slot25.full_name = ".p63.sc_63201.time"
slot25.number = 2
slot25.index = 1
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
SC_63201.name = "sc_63201"
SC_63201.full_name = ".p63.sc_63201"
SC_63201.nested_types = {}
SC_63201.enum_types = {}
SC_63201.fields = {
	slot24,
	slot25
}
SC_63201.is_extendable = false
SC_63201.extensions = {}
slot26.name = "blueprint_id"
slot26.full_name = ".p63.cs_63202.blueprint_id"
slot26.number = 1
slot26.index = 0
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
CS_63202.name = "cs_63202"
CS_63202.full_name = ".p63.cs_63202"
CS_63202.nested_types = {}
CS_63202.enum_types = {}
CS_63202.fields = {
	slot26
}
CS_63202.is_extendable = false
CS_63202.extensions = {}
slot27.name = "result"
slot27.full_name = ".p63.sc_63203.result"
slot27.number = 1
slot27.index = 0
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "ship"
slot28.full_name = ".p63.sc_63203.ship"
slot28.number = 2
slot28.index = 1
slot28.label = 1
slot28.has_default_value = false
slot28.default_value = nil
slot28.message_type = slot1.SHIPINFO
slot28.type = 11
slot28.cpp_type = 10
SC_63203.name = "sc_63203"
SC_63203.full_name = ".p63.sc_63203"
SC_63203.nested_types = {}
SC_63203.enum_types = {}
SC_63203.fields = {
	slot27,
	slot28
}
SC_63203.is_extendable = false
SC_63203.extensions = {}
slot29.name = "ship_id"
slot29.full_name = ".p63.cs_63204.ship_id"
slot29.number = 1
slot29.index = 0
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
slot30.name = "count"
slot30.full_name = ".p63.cs_63204.count"
slot30.number = 2
slot30.index = 1
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
CS_63204.name = "cs_63204"
CS_63204.full_name = ".p63.cs_63204"
CS_63204.nested_types = {}
CS_63204.enum_types = {}
CS_63204.fields = {
	slot29,
	slot30
}
CS_63204.is_extendable = false
CS_63204.extensions = {}
slot31.name = "result"
slot31.full_name = ".p63.sc_63205.result"
slot31.number = 1
slot31.index = 0
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
SC_63205.name = "sc_63205"
SC_63205.full_name = ".p63.sc_63205"
SC_63205.nested_types = {}
SC_63205.enum_types = {}
SC_63205.fields = {
	slot31
}
SC_63205.is_extendable = false
SC_63205.extensions = {}
slot32.name = "blueprint_id"
slot32.full_name = ".p63.cs_63206.blueprint_id"
slot32.number = 1
slot32.index = 0
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
CS_63206.name = "cs_63206"
CS_63206.full_name = ".p63.cs_63206"
CS_63206.nested_types = {}
CS_63206.enum_types = {}
CS_63206.fields = {
	slot32
}
CS_63206.is_extendable = false
CS_63206.extensions = {}
slot33.name = "result"
slot33.full_name = ".p63.sc_63207.result"
slot33.number = 1
slot33.index = 0
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = 0
slot33.type = 13
slot33.cpp_type = 3
SC_63207.name = "sc_63207"
SC_63207.full_name = ".p63.sc_63207"
SC_63207.nested_types = {}
SC_63207.enum_types = {}
SC_63207.fields = {
	slot33
}
SC_63207.is_extendable = false
SC_63207.extensions = {}
slot34.name = "blueprint_id"
slot34.full_name = ".p63.cs_63208.blueprint_id"
slot34.number = 1
slot34.index = 0
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = 0
slot34.type = 13
slot34.cpp_type = 3
CS_63208.name = "cs_63208"
CS_63208.full_name = ".p63.cs_63208"
CS_63208.nested_types = {}
CS_63208.enum_types = {}
CS_63208.fields = {
	slot34
}
CS_63208.is_extendable = false
CS_63208.extensions = {}
slot35.name = "result"
slot35.full_name = ".p63.sc_63209.result"
slot35.number = 1
slot35.index = 0
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
SC_63209.name = "sc_63209"
SC_63209.full_name = ".p63.sc_63209"
SC_63209.nested_types = {}
SC_63209.enum_types = {}
SC_63209.fields = {
	slot35
}
SC_63209.is_extendable = false
SC_63209.extensions = {}
slot36.name = "id"
slot36.full_name = ".p63.bluprintinfo.id"
slot36.number = 1
slot36.index = 0
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = 0
slot36.type = 13
slot36.cpp_type = 3
slot37.name = "ship_id"
slot37.full_name = ".p63.bluprintinfo.ship_id"
slot37.number = 2
slot37.index = 1
slot37.label = 2
slot37.has_default_value = false
slot37.default_value = 0
slot37.type = 13
slot37.cpp_type = 3
slot38.name = "start_time"
slot38.full_name = ".p63.bluprintinfo.start_time"
slot38.number = 3
slot38.index = 2
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
slot39.name = "blue_print_level"
slot39.full_name = ".p63.bluprintinfo.blue_print_level"
slot39.number = 4
slot39.index = 3
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = 0
slot39.type = 13
slot39.cpp_type = 3
slot40.name = "exp"
slot40.full_name = ".p63.bluprintinfo.exp"
slot40.number = 5
slot40.index = 4
slot40.label = 2
slot40.has_default_value = false
slot40.default_value = 0
slot40.type = 13
slot40.cpp_type = 3
slot41.name = "start_duration"
slot41.full_name = ".p63.bluprintinfo.start_duration"
slot41.number = 6
slot41.index = 5
slot41.label = 1
slot41.has_default_value = false
slot41.default_value = 0
slot41.type = 13
slot41.cpp_type = 3
BLUPRINTINFO.name = "bluprintinfo"
BLUPRINTINFO.full_name = ".p63.bluprintinfo"
BLUPRINTINFO.nested_types = {}
BLUPRINTINFO.enum_types = {}
BLUPRINTINFO.fields = {
	slot36,
	slot37,
	slot38,
	slot39,
	slot40,
	slot41
}
BLUPRINTINFO.is_extendable = false
BLUPRINTINFO.extensions = {}
bluprintinfo = slot0.Message(BLUPRINTINFO)
cs_63001 = slot0.Message(CS_63001)
cs_63003 = slot0.Message(CS_63003)
cs_63005 = slot0.Message(CS_63005)
cs_63007 = slot0.Message(CS_63007)
cs_63200 = slot0.Message(CS_63200)
cs_63202 = slot0.Message(CS_63202)
cs_63204 = slot0.Message(CS_63204)
cs_63206 = slot0.Message(CS_63206)
cs_63208 = slot0.Message(CS_63208)
sc_63000 = slot0.Message(SC_63000)
sc_63002 = slot0.Message(SC_63002)
sc_63004 = slot0.Message(SC_63004)
sc_63006 = slot0.Message(SC_63006)
sc_63008 = slot0.Message(SC_63008)
sc_63100 = slot0.Message(SC_63100)
sc_63201 = slot0.Message(SC_63201)
sc_63203 = slot0.Message(SC_63203)
sc_63205 = slot0.Message(SC_63205)
sc_63207 = slot0.Message(SC_63207)
sc_63209 = slot0.Message(SC_63209)
technologyinfo = slot0.Message(TECHNOLOGYINFO)

return
