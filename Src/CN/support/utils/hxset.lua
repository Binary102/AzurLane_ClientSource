HXSet = {
	codeModeKey = "hx_code_mode",
	codeMode = false,
	nameCodeMap = {},
	codeNameMap = {},
	nameCodeMap_EN = {
		IJN = "IRN"
	},
	codeNameMap_EN = {},
	init = function ()
		for slot3, slot4 in pairs(pg.name_code) do
			slot0.nameCodeMap[slot4.name] = slot4.code
			slot0.codeNameMap[slot4.code] = slot4.name
		end

		for slot3, slot4 in pairs(slot0.codeNameMap_EN) do
			slot0.codeNameMap_EN[slot4] = slot3
		end

		if pg.gameset.code_switch.key_value == 1 and PlayerPrefs.HasKey(slot0.codeModeKey) then
			slot0.codeMode = PlayerPrefs.GetInt(slot0.codeModeKey) == 1
		end

		slot0.update()
	end,
	switchCodeMode = function ()
		if pg.gameset.code_switch.key_value == 1 or slot0.codeMode then
			slot0.codeMode = not slot0.codeMode

			slot0(slot0.codeModeKey, (slot0.codeMode and 1) or 0)
			PlayerPrefs.Save()
			PlayerPrefs.Save.update()
			slot0("anti hx mode: " .. ((slot0.codeMode and "on") or "off"))
		end
	end,
	update = function ()
		slot1 = ((slot0.codeMode and slot0.codeNameMap) or slot0.nameCodeMap.codeMode and (slot0.codeMode and slot0.codeNameMap) or slot0.nameCodeMap.codeNameMap_EN) or (slot0.codeMode and slot0.codeNameMap) or slot0.nameCodeMap.nameCodeMap_EN

		for slot5, slot6 in pairs(pg.ship_data_statistics) do
			if slot6.nationality == Nation.JP and slot0[slot6.name] then
				slot6.name = slot0[slot6.name]
			end

			for slot10, slot11 in pairs(slot1) do
				slot6.english_name = string.gsub(slot6.english_name or "", slot10, slot11)
			end
		end

		for slot5, slot6 in pairs(pg.enemy_data_statistics) do
			if slot6.nationality == Nation.JP and slot0[slot6.name] then
				slot6.name = slot0[slot6.name]
			end
		end
	end,
	hxLan = function (slot0, slot1)
		return string.gsub(slot0 or "", "{namecode:(%d+)}", function (slot0)
			return pg.name_code[tonumber(slot0)] and (((slot0.codeMode or slot1) and slot1.name) or slot1.code)
		end)
	end,
	isHx = function ()
		if slot0.codeMode then
		end

		return true
	end
}

HXSet.init()

return
