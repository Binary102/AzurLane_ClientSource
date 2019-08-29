slot0 = setmetatable({}, {
	__mode = "kv"
})
slot2 = getmetatable(GameObject).__index

getmetatable(GameObject).__index = function (slot0, slot1)
	if slot1 == "transform" then
		if slot0[slot0] then
			return slot2
		end

		slot0[slot0] = slot1(slot0, slot1)

		return slot1(slot0, slot1)
	elseif slot1 == "gameObject" then
		return slot0
	else
		return slot1(slot0, slot1)
	end
end

slot3 = setmetatable({}, {
	__mode = "kv"
})
slot5 = getmetatable(Transform).__index

getmetatable(Transform).__index = function (slot0, slot1)
	if slot1 == "gameObject" then
		if slot0[slot0] then
			return slot2
		end

		slot0[slot0] = slot1(slot0, slot1)

		return slot1(slot0, slot1)
	elseif slot1 == "transform" then
		return slot0
	else
		return slot1(slot0, slot1)
	end
end

function gcAll(slot0)
	PoolMgr.GetInstance():ExcessPainting()
	ResourceMgr.Inst:unloadUnusedAssetBundles()

	if not slot0 then
		Resources.UnloadUnusedAssets()
	end

	GCThread.GetInstance():GC(slot0)
end

slot6 = print

function print(slot0, ...)
	if Application.isEditor then
		slot0(debug.traceback(tostring(slot0) .. " " .. table.concat(_.map({
			...
		}, function (slot0)
			return tostring(slot0)
		end), " "), 2))
	else
		slot0(slot0, ...)
	end
end

function traceback(slot0)
	return debug.traceback(slot0, 2)
end

function RemoveTableItem(slot0, slot1, slot2)
	slot3 = 0

	for slot7 = 1, #slot0, 1 do
		if slot0[slot7 - slot3] == slot1 then
			table.remove(slot0, slot7 - slot3)

			if slot2 then
				slot3 = slot3 + 1
			else
				break
			end
		end
	end
end

function IsNil(slot0)
	return slot0 == nil or slot0:Equals(nil)
end

function isnan(slot0)
	return slot0 ~= slot0
end

function string.split(slot0, slot1)
	slot0:gsub(string.format("([^%s]+)", slot1 or ","), function (slot0)
		table.insert(slot0, slot0)
	end)

	return {}
end

function GetDir(slot0)
	return string.match(slot0, ".*/")
end

function GetFileName(slot0)
	return string.match(slot0, ".*/(.*)")
end

function table.clear(slot0)
	if slot0 then
		for slot4, slot5 in pairs(slot0) do
			slot0[slot4] = nil
		end
	end
end

function table.contains(slot0, slot1)
	if slot0 == nil then
		return false
	end

	for slot5, slot6 in pairs(slot0) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

function table.equal(slot0, slot1)
	if type(slot0) ~= type(slot1) then
		return false
	end

	if type(slot0) ~= "table" then
		return slot0 == slot1
	end

	if slot0 == slot1 then
		return true
	end

	if #slot0 ~= #slot1 then
		return false
	end

	for slot5, slot6 in pairs(slot0) do
		if not table.equal(slot6, slot1[slot5]) then
			return false
		end
	end

	return true
end

function table.containsdata(slot0, slot1)
	if slot0 == nil then
		return false
	end

	for slot5, slot6 in pairs(slot0) do
		if table.equal(slot6, slot1) then
			return true
		end
	end

	return false
end

function table.eachAsync(slot0, slot1)
	if type(slot0) ~= "table" then
		return
	end

	slot2, slot3, slot4 = ipairs(slot0)
	slot5 = nil

	function slot5()
		slot0 = slot1(slot2, slot1)

		if slot2[] ~= nil then
			return
		end

		slot3(slot0, slot4)
	end
end

function table.eachParalle(slot0, slot1, slot2)
	if type(slot0) ~= "table" then
		return
	end

	slot8, slot9, slot10 = ipairs(slot0)
	slot6 = {
		0,
		0,
		0
	}

	function slot7()
		if slot0[3] > 0 then
			return
		end

		slot0[2] = slot0[2] + 1

		if slot0[2] < slot0[1] then
			return
		end

		slot0[3] = 1

		1()
	end

	slot8 = slot3(slot4, slot5)

	while slot8 ~= nil do
		slot6[1] = slot6[1] + 1

		slot1(slot8, slot7)

		slot8 = slot4[slot3(slot4, slot5)]
	end
end

function table.getCount(slot0)
	slot1 = 0
	slot2 = nil

	while next(slot0, slot2) do
		slot1 = slot1 + 1
		slot2 = next(slot0, slot2)
	end

	return slot1
end

function table.merge(slot0, slot1, slot2)
	slot4(slot0)
	function (slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot0 then
				if not table.contains(slot1, slot5) then
					table.insert(slot1, slot5)
				end
			else
				table.insert(slot1, slot5)
			end
		end
	end(slot1)

	return {}
end

function table.Classify(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = {}
	slot7 = {}
	slot8 = {}

	if type(slot0) ~= type(slot1) then
		slot6 = slot0
		slot7 = slot1
	elseif type(slot0) ~= "table" then
		if slot0 == slot1 then
			slot8 = slot0
		else
			slot6 = slot0
			slot7 = slot1
		end
	elseif slot0 == slot1 then
		slot8 = slot0
	else
		slot8 = {}
		slot7 = {}
		slot6 = {}

		for slot12, slot13 in pairs(slot0) do
			if not slot1[slot12] then
				slot6[slot12] = slot13
			elseif type(slot13) ~= type(slot1[slot12]) then
				slot6[slot12] = slot13
				slot7[slot12] = slot1[slot12]
			elseif slot13 == slot1[slot12] then
				slot8[slot12] = slot13
			elseif type(slot13) ~= "table" then
				slot6[slot12] = slot13
				slot7[slot12] = slot1[slot12]
			else
				table.Classify(slot13, slot1[slot12], slot6, slot7, slot8, slot12)
			end
		end

		for slot12, slot13 in pairs(slot1) do
			if not slot0[slot12] then
				slot7[slot12] = slot13
			end
		end
	end

	if slot5 then
		slot2[slot5] = slot6
		slot3[slot5] = slot7
		slot4[slot5] = slot8
	else
		return slot6, slot7, slot8
	end
end

function table.removebyvalue(slot0, slot1, slot2)
	slot3 = 0
	slot4 = 1
	slot5 = #slot0

	while slot4 <= slot5 do
		if slot0[slot4] == slot1 then
			table.remove(slot0, slot4)

			slot3 = slot3 + 1
			slot4 = slot4 - 1
			slot5 = slot5 - 1

			if not slot2 then
				break
			end
		end

		slot4 = slot4 + 1
	end

	return slot3
end

function table.clean(slot0)
	for slot4 = #slot0, 1, -1 do
		table.remove(slot0, slot4)
	end
end

function DumpTable(slot0)
	for slot4, slot5 in pairs(slot0) do
		if slot5 ~= nil then
			Debugger.Log("Key: {0}, Value: {1}", tostring(slot4), tostring(slot5))
		else
			Debugger.Log("Key: {0}, Value nil", tostring(slot4))
		end
	end
end

function PrintTable(slot0)
	slot2(slot0, slot1, "")

	return table.concat({}, "")
end

function PrintLua(slot0, slot1)
	slot2 = nil
	slot1 = slot1 or _G

	for slot6 in string.gmatch(slot0, "%w+") do
		slot1 = slot1[slot6]
	end

	if slot1 == nil then
		Debugger.Log("Lua Module {0} not exists", slot0)

		return
	end

	Debugger.Log("-----------------Dump Table {0}-----------------", slot0)

	if type(slot2) == "table" then
		for slot6, slot7 in pairs(slot2) do
			Debugger.Log("Key: {0}, Value: {1}", slot6, tostring(slot7))
		end
	end

	slot3 = getmetatable(slot2)

	Debugger.Log("-----------------Dump meta {0}-----------------", slot0)

	while slot3 ~= nil and slot3 ~= slot2 do
		for slot7, slot8 in pairs(slot3) do
			if slot7 ~= nil then
				Debugger.Log("Key: {0}, Value: {1}", tostring(slot7), tostring(slot8))
			end
		end

		slot3 = getmetatable(slot3)
	end

	Debugger.Log("-----------------Dump meta Over-----------------")
	Debugger.Log("-----------------Dump Table Over-----------------")
end

function IsString(slot0)
	return type(slot0) == "string"
end

function IsNumber(slot0)
	return type(slot0) == "number"
end

function tobool(slot0)
	return (slot0 and true) or false
end

function warning(slot0, ...)
	Debugger.LogWarning(debug.traceback(tostring(slot0) .. " " .. table.concat(_.map({
		...
	}, function (slot0)
		return tostring(slot0)
	end), " "), 2))
end

function BuildVector3(slot0)
	return Vector3(slot0[1], slot0[2], slot0[3])
end

function ShowFuncInfo(slot0)
	return string.format("file:%s#%d", debug.getinfo(slot0).source, debug.getinfo(slot0).linedefined)
end

function String2Table(slot0)
	slot1 = {}

	for slot5 in slot0:gmatch(".") do
		table.insert(slot1, slot5)
	end

	return slot1
end

slot7 = require("bit")

function unicode_to_utf8(slot0)
	if type(slot0) ~= "string" then
		return slot0
	end

	slot1 = ""
	slot2 = 1

	while true do
		slot4 = nil

		if string.byte(slot0, slot2) ~= nil and string.sub(slot0, slot2, slot2 + 1) == "\\u" then
			slot4 = tonumber("0x" .. string.sub(slot0, slot2 + 2, slot2 + 5))
			slot2 = slot2 + 6
		elseif slot3 ~= nil then
			slot4 = slot3
			slot2 = slot2 + 1
		else
			break
		end

		slot1 = (slot4 <= 127 and slot1 .. string.char(slot0.band(slot4, 127))) or (slot4 >= 128 and slot4 <= 2047 and slot1 .. string.char(slot0.bor(192, slot0.band(slot0.rshift(slot4, 6), 31))) .. string.char(slot0.bor(128, slot0.band(slot4, 63)))) or (slot4 >= 2048 and slot4 <= 65535)
		slot1 = slot1 .. string.char(slot0.bor(224, slot0.band(slot0.rshift(slot4, 12), 15))) .. string.char(slot0.bor(128, slot0.band(slot0.rshift(slot4, 6), 63))) .. string.char(slot0.bor(128, slot0.band(slot4, 63)))
	end

	return slot1 .. " "
end

function utf8_to_unicode(slot0)
	if type(slot0) ~= "string" then
		return slot0
	end

	slot1 = ""
	slot3 = string.byte(slot0, 1)
	slot4 = 0

	while slot3 ~= nil do
		slot5, slot6 = nil

		if slot3 >= 0 and slot3 <= 127 then
			slot5 = slot3
			slot6 = 0
		elseif slot0.band(slot3, 224) == 192 then
			slot7 = 0
			slot8 = 0
			slot5 = slot0.bor(slot8, slot0.lshift(slot0.band(slot7, slot0.rshift(255, 6)), 6))
			slot6 = slot0.rshift(slot0.band(slot3, slot0.rshift(255, 3)), 2)
		elseif slot0.band(slot3, 240) == 224 then
			slot7 = 0
			slot8 = 0
			slot9 = 0
			slot5 = slot0.bor(slot0.lshift(slot0.band(slot8, slot0.rshift(255, 6)), 6), slot9)
			slot6 = slot0.bor(slot0.lshift(slot7, 4), slot0.rshift(slot0.band(slot3, slot0.rshift(255, 2)), 2))
		end

		slot1 = slot1 .. string.format("\\u%02x%02x", slot6, slot5)
		slot4 = (slot6 == 0 and slot4 + 1) or slot4 + 2
		slot3 = string.byte(slot0, slot2 + 1)
	end

	return slot1, slot4
end

return
