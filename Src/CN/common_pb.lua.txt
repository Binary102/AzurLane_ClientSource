slot0 = require("protobuf")

module("common_pb")

SHIPINFO = slot0.Descriptor()
slot1 = slot0.FieldDescriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
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
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
SHIPSTATE = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
slot26 = slot0.FieldDescriptor()
slot27 = slot0.FieldDescriptor()
EQUIPINFO = slot0.Descriptor()
slot28 = slot0.FieldDescriptor()
slot29 = slot0.FieldDescriptor()
SHIPSKILL = slot0.Descriptor()
slot30 = slot0.FieldDescriptor()
slot31 = slot0.FieldDescriptor()
slot32 = slot0.FieldDescriptor()
STRENGTH_INFO = slot0.Descriptor()
slot33 = slot0.FieldDescriptor()
slot34 = slot0.FieldDescriptor()
TRANSFORM_INFO = slot0.Descriptor()
slot35 = slot0.FieldDescriptor()
slot36 = slot0.FieldDescriptor()
DROPINFO = slot0.Descriptor()
slot37 = slot0.FieldDescriptor()
slot38 = slot0.FieldDescriptor()
slot39 = slot0.FieldDescriptor()
slot1.name = "id"
slot1.full_name = ".common.shipinfo.id"
slot1.number = 1
slot1.index = 0
slot1.label = 2
slot1.has_default_value = false
slot1.default_value = 0
slot1.type = 13
slot1.cpp_type = 3
slot2.name = "template_id"
slot2.full_name = ".common.shipinfo.template_id"
slot2.number = 2
slot2.index = 1
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "level"
slot3.full_name = ".common.shipinfo.level"
slot3.number = 3
slot3.index = 2
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "exp"
slot4.full_name = ".common.shipinfo.exp"
slot4.number = 4
slot4.index = 3
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "equip_info_list"
slot5.full_name = ".common.shipinfo.equip_info_list"
slot5.number = 5
slot5.index = 4
slot5.label = 3
slot5.has_default_value = false
slot5.default_value = {}
slot5.message_type = EQUIPINFO
slot5.type = 11
slot5.cpp_type = 10
slot6.name = "energy"
slot6.full_name = ".common.shipinfo.energy"
slot6.number = 6
slot6.index = 5
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "state"
slot7.full_name = ".common.shipinfo.state"
slot7.number = 7
slot7.index = 6
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = nil
slot7.message_type = SHIPSTATE
slot7.type = 11
slot7.cpp_type = 10
slot8.name = "is_locked"
slot8.full_name = ".common.shipinfo.is_locked"
slot8.number = 8
slot8.index = 7
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "transform_list"
slot9.full_name = ".common.shipinfo.transform_list"
slot9.number = 9
slot9.index = 8
slot9.label = 3
slot9.has_default_value = false
slot9.default_value = {}
slot9.message_type = TRANSFORM_INFO
slot9.type = 11
slot9.cpp_type = 10
slot10.name = "skill_id_list"
slot10.full_name = ".common.shipinfo.skill_id_list"
slot10.number = 10
slot10.index = 9
slot10.label = 3
slot10.has_default_value = false
slot10.default_value = {}
slot10.message_type = SHIPSKILL
slot10.type = 11
slot10.cpp_type = 10
slot11.name = "intimacy"
slot11.full_name = ".common.shipinfo.intimacy"
slot11.number = 11
slot11.index = 10
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "proficiency"
slot12.full_name = ".common.shipinfo.proficiency"
slot12.number = 12
slot12.index = 11
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
slot13.name = "strength_list"
slot13.full_name = ".common.shipinfo.strength_list"
slot13.number = 13
slot13.index = 12
slot13.label = 3
slot13.has_default_value = false
slot13.default_value = {}
slot13.message_type = STRENGTH_INFO
slot13.type = 11
slot13.cpp_type = 10
slot14.name = "create_time"
slot14.full_name = ".common.shipinfo.create_time"
slot14.number = 14
slot14.index = 13
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
slot15.name = "skin_id"
slot15.full_name = ".common.shipinfo.skin_id"
slot15.number = 15
slot15.index = 14
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
slot16.name = "propose"
slot16.full_name = ".common.shipinfo.propose"
slot16.number = 16
slot16.index = 15
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "name"
slot17.full_name = ".common.shipinfo.name"
slot17.number = 17
slot17.index = 16
slot17.label = 1
slot17.has_default_value = false
slot17.default_value = ""
slot17.type = 9
slot17.cpp_type = 9
slot18.name = "change_name_timestamp"
slot18.full_name = ".common.shipinfo.change_name_timestamp"
slot18.number = 18
slot18.index = 17
slot18.label = 1
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
slot19.name = "commanderid"
slot19.full_name = ".common.shipinfo.commanderid"
slot19.number = 19
slot19.index = 18
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "max_level"
slot20.full_name = ".common.shipinfo.max_level"
slot20.number = 20
slot20.index = 19
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "blue_print_flag"
slot21.full_name = ".common.shipinfo.blue_print_flag"
slot21.number = 21
slot21.index = 20
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "activity_npc"
slot22.full_name = ".common.shipinfo.activity_npc"
slot22.number = 22
slot22.index = 21
slot22.label = 2
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
SHIPINFO.name = "shipinfo"
SHIPINFO.full_name = ".common.shipinfo"
SHIPINFO.nested_types = {}
SHIPINFO.enum_types = {}
SHIPINFO.fields = {
	slot1,
	slot2,
	slot3,
	slot4,
	slot5,
	slot6,
	slot7,
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
	slot18,
	slot19,
	slot20,
	slot21,
	slot22
}
SHIPINFO.is_extendable = false
SHIPINFO.extensions = {}
slot23.name = "state"
slot23.full_name = ".common.shipstate.state"
slot23.number = 1
slot23.index = 0
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "state_info_1"
slot24.full_name = ".common.shipstate.state_info_1"
slot24.number = 2
slot24.index = 1
slot24.label = 1
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
slot25.name = "state_info_2"
slot25.full_name = ".common.shipstate.state_info_2"
slot25.number = 3
slot25.index = 2
slot25.label = 1
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
slot26.name = "state_info_3"
slot26.full_name = ".common.shipstate.state_info_3"
slot26.number = 4
slot26.index = 3
slot26.label = 1
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
slot27.name = "state_info_4"
slot27.full_name = ".common.shipstate.state_info_4"
slot27.number = 5
slot27.index = 4
slot27.label = 1
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
SHIPSTATE.name = "shipstate"
SHIPSTATE.full_name = ".common.shipstate"
SHIPSTATE.nested_types = {}
SHIPSTATE.enum_types = {}
SHIPSTATE.fields = {
	slot23,
	slot24,
	slot25,
	slot26,
	slot27
}
SHIPSTATE.is_extendable = false
SHIPSTATE.extensions = {}
slot28.name = "id"
slot28.full_name = ".common.equipinfo.id"
slot28.number = 1
slot28.index = 0
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
slot29.name = "skinId"
slot29.full_name = ".common.equipinfo.skinId"
slot29.number = 2
slot29.index = 1
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
EQUIPINFO.name = "equipinfo"
EQUIPINFO.full_name = ".common.equipinfo"
EQUIPINFO.nested_types = {}
EQUIPINFO.enum_types = {}
EQUIPINFO.fields = {
	slot28,
	slot29
}
EQUIPINFO.is_extendable = false
EQUIPINFO.extensions = {}
slot30.name = "skill_id"
slot30.full_name = ".common.shipskill.skill_id"
slot30.number = 1
slot30.index = 0
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
slot31.name = "skill_lv"
slot31.full_name = ".common.shipskill.skill_lv"
slot31.number = 2
slot31.index = 1
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
slot32.name = "skill_exp"
slot32.full_name = ".common.shipskill.skill_exp"
slot32.number = 3
slot32.index = 2
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
SHIPSKILL.name = "shipskill"
SHIPSKILL.full_name = ".common.shipskill"
SHIPSKILL.nested_types = {}
SHIPSKILL.enum_types = {}
SHIPSKILL.fields = {
	slot30,
	slot31,
	slot32
}
SHIPSKILL.is_extendable = false
SHIPSKILL.extensions = {}
slot33.name = "id"
slot33.full_name = ".common.strength_info.id"
slot33.number = 1
slot33.index = 0
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = 0
slot33.type = 13
slot33.cpp_type = 3
slot34.name = "exp"
slot34.full_name = ".common.strength_info.exp"
slot34.number = 2
slot34.index = 1
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = 0
slot34.type = 13
slot34.cpp_type = 3
STRENGTH_INFO.name = "strength_info"
STRENGTH_INFO.full_name = ".common.strength_info"
STRENGTH_INFO.nested_types = {}
STRENGTH_INFO.enum_types = {}
STRENGTH_INFO.fields = {
	slot33,
	slot34
}
STRENGTH_INFO.is_extendable = false
STRENGTH_INFO.extensions = {}
slot35.name = "id"
slot35.full_name = ".common.transform_info.id"
slot35.number = 1
slot35.index = 0
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
slot36.name = "level"
slot36.full_name = ".common.transform_info.level"
slot36.number = 2
slot36.index = 1
slot36.label = 2
slot36.has_default_value = false
slot36.default_value = 0
slot36.type = 13
slot36.cpp_type = 3
TRANSFORM_INFO.name = "transform_info"
TRANSFORM_INFO.full_name = ".common.transform_info"
TRANSFORM_INFO.nested_types = {}
TRANSFORM_INFO.enum_types = {}
TRANSFORM_INFO.fields = {
	slot35,
	slot36
}
TRANSFORM_INFO.is_extendable = false
TRANSFORM_INFO.extensions = {}
slot37.name = "type"
slot37.full_name = ".common.dropinfo.type"
slot37.number = 1
slot37.index = 0
slot37.label = 2
slot37.has_default_value = false
slot37.default_value = 0
slot37.type = 13
slot37.cpp_type = 3
slot38.name = "id"
slot38.full_name = ".common.dropinfo.id"
slot38.number = 2
slot38.index = 1
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
slot39.name = "number"
slot39.full_name = ".common.dropinfo.number"
slot39.number = 3
slot39.index = 2
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = 0
slot39.type = 13
slot39.cpp_type = 3
DROPINFO.name = "dropinfo"
DROPINFO.full_name = ".common.dropinfo"
DROPINFO.nested_types = {}
DROPINFO.enum_types = {}
DROPINFO.fields = {
	slot37,
	slot38,
	slot39
}
DROPINFO.is_extendable = false
DROPINFO.extensions = {}
dropinfo = slot0.Message(DROPINFO)
equipinfo = slot0.Message(EQUIPINFO)
shipinfo = slot0.Message(SHIPINFO)
shipskill = slot0.Message(SHIPSKILL)
shipstate = slot0.Message(SHIPSTATE)
strength_info = slot0.Message(STRENGTH_INFO)
transform_info = slot0.Message(TRANSFORM_INFO)

return
