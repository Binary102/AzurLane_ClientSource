pg = pg or {}
slot0 = require("Mgr/Pool/PoolPlural")
slot1 = require("Mgr/Pool/PoolSingleton")
slot2 = require("Mgr/Pool/PoolObjPack")
slot3 = require("Mgr/Pool/PoolUtil")
PoolMgr = singletonClass("PoolMgr")
pg.PoolMgr = PoolMgr

function pg.PoolMgr.Ctor(slot0)
	slot0.root = GameObject.New("__Pool__").transform
	slot0.pools_plural = {}
	slot0.pools_single = {}
	slot0.pools_pack = {}
	slot0.callbacks = {}
	slot0.callingkey = nil
	slot0.pluralIndex = 0
	slot0.singleIndex = 0
	slot0.paintingCount = 0
	slot0.preloads = {
		shiptype = {
			"battle_hangmu",
			"battle_qingxun",
			"battle_quzhu",
			"battle_weixiu",
			"battle_zhanlie",
			"battle_zhongxun",
			"hangmu",
			"hangxun",
			"hangzhan",
			"leixun",
			"qingxun",
			"quzhu",
			"weixiu",
			"xunyang",
			"zhanlie",
			"zhongxun"
		},
		shipframe = {
			"1",
			"2",
			"3",
			"4",
			"5",
			"14",
			"b1",
			"b2",
			"b3",
			"b4",
			"b5",
			"b14",
			"ba",
			"bl",
			"prop",
			"bprop"
		},
		["shipyardicon/unknown"] = {
			""
		},
		skillframe = {
			"skill_red",
			"skill_blue",
			"skill_yellow"
		},
		weaponframes = {
			"bg1",
			"bg2",
			"bg3",
			"bg4",
			"bg5",
			"bg8",
			"bg9",
			"bg14",
			"frame1",
			"frame2",
			"frame3",
			"frame4",
			"frame5",
			"frame6",
			"frame7",
			"frame8",
			"frame9",
			"frame14",
			"frame_npc",
			"frame_prop"
		},
		energy = {
			"express_1",
			"express_2",
			"express_3",
			"express_4"
		},
		shipstatus = {},
		channel = {},
		["painting/mat"] = {}
	}
end

function pg.PoolMgr.Init(slot0, slot1)
	print("initializing pool manager...")

	slot2 = 0
	slot3 = 0

	for slot7, slot8 in pairs(slot0.preloads) do
		slot3 = slot3 + 1
	end

	function slot4()
		if slot0 + 1 == slot1 then
			slot2()
		end
	end

	for slot8, slot9 in pairs(slot0.preloads) do
		if #slot9 > 0 then
			slot10 = 0

			for slot14, slot15 in ipairs(slot9) do
				slot0:GetSprite(slot8, slot15, true, function (slot0)
					if slot0 + 1 == #slot1 then
						slot2()
					end
				end)
			end
		else
			ResourceMgr.Inst:loadAssetBundleAsync(slot8, function (slot0)
				slot0()
			end)
		end
	end
end

function pg.PoolMgr.GetSpineChar(slot0, slot1, slot2, slot3)
	function slot6()
		slot0.pools_plural[slot1].index = slot0.pluralIndex
		slot0.pluralIndex = slot0.pluralIndex + 1
		slot1 = slot0.pools_plural[slot1].Dequeue(slot0)

		slot1:SetActive(true)
		slot1:SetActive()
	end

	if not slot0.pools_plural[slot4 .. slot1] then
		slot0:GetSpineSkel(slot1, slot2, function (slot0)
			if not slot0.pools_plural[] then
				SpineAnimUI.AnimChar(slot2, slot0).SetActive(slot0, false)

				slot0.pools_plural[] = false.New(SpineAnimUI.AnimChar(slot2, slot0), 1)
			end

			slot4()
		end, true)
	else
		slot6()
	end
end

function pg.PoolMgr.ReturnSpineChar(slot0, slot1, slot2)
	slot4 = slot3 .. slot1

	if IsNil(slot2) then
		Debugger.LogError("empty go: " .. slot1)
	elseif slot0.pools_plural[slot4] then
		UIUtil.ClearChildren(slot2)
		slot2:SetActive(false)
		slot2.transform:SetParent(slot0.root, false)

		slot2.transform.localPosition = Vector3.New(0, 0, 0)
		slot2.transform.localScale = Vector3.New(0.5, 0.5, 1)
		slot2.transform.localRotation = Quaternion.identity

		slot0.pools_plural[slot4]:Enqueue(slot2)
		slot0:ExcessSpineChar()
	else
		slot0.Destroy(slot2)
	end
end

function pg.PoolMgr.ExcessSpineChar(slot0)
	slot1 = 0
	slot2 = 6
	slot3 = {}

	for slot7, slot8 in pairs(slot0.pools_plural) do
		if string.find(slot7, "char/") == 1 then
			table.insert(slot3, slot7)
		end
	end

	if slot2 < #slot3 then
		table.sort(slot3, function (slot0, slot1)
			return slot0.pools_plural[slot1].index < slot0.pools_plural[slot0].index
		end)

		for slot7 = slot2 + 1, #slot3, 1 do
			slot0.pools_plural[slot3[slot7]].Clear(slot9)

			slot0.pools_plural[slot3[slot7]] = nil

			if slot0.pools_single[slot3[slot7]] then
				slot10:Clear()

				slot0.pools_single[slot8] = nil
			end
		end
	end
end

function pg.PoolMgr.GetSpineSkel(slot0, slot1, slot2, slot3)
	slot0:FromSingle("char/" .. slot1, slot1 .. "_SkeletonData", slot2, slot3)
end

function pg.PoolMgr.ClearSpineSkel(slot0, slot1)
	if slot0.pools_single[slot2 .. slot1 .. "_SkeletonData"] then
		slot0.pools_single[slot3]:Clear()

		slot0.pools_single[slot3] = nil
	end
end

function pg.PoolMgr.IsSpineSkelCached(slot0, slot1)
	return slot0.pools_single[slot2 .. slot1 .. "_SkeletonData"] ~= nil
end

slot6 = {
	"ProfileUI",
	"ResPanel"
}
slot7 = {
	"ProfileUI",
	"ResPanel",
	"MainUI",
	"DockyardUI",
	"AwardInfoUI",
	"SkillInfoUI",
	"ItemInfoUI",
	"LevelUI2"
}
slot8 = {}

function pg.PoolMgr.GetUI(slot0, slot1, slot2, slot3)
	slot0:FromPlural("ui/" .. slot1, slot1, slot2, (table.contains(slot0, slot1) and 3) or 1, function (slot0)
		if table.indexof(function ()
			slot0(slot1)
		end, table.indexof) then
			slot4.pools_plural[slot3 .. ].prefab:GetComponent(typeof(UIArchiver)):Clear()
			slot0:GetComponent(typeof(UIArchiver)):Load(slot1)
		else
			slot1()
		end
	end, function (slot0)
		slot0:SetActive(false)

		return slot0
	end, table.contains(slot1, slot1) or table.contains(slot2, slot1))
end

function pg.PoolMgr.ReturnUI(slot0, slot1, slot2)
	slot4 = slot3 .. slot1

	if IsNil(slot2) then
		Debugger.LogError("empty go: " .. slot1)
	elseif slot0.pools_plural[slot4] then
		if table.indexof(slot0, slot1) then
			slot2.transform:SetParent(slot0.root, false)
		end

		if table.indexof(slot1, slot1) then
			slot2:SetActive(false)
			slot0.pools_plural[slot4]:Enqueue(slot2)
		elseif table.indexof(slot2, slot1) then
			slot2:SetActive(false)
			slot2:GetComponent(typeof(UIArchiver)):Clear()
			slot0.pools_plural[slot4]:Enqueue(slot2)
		else
			slot0.pools_plural[slot4]:Enqueue(slot2, true)

			if slot0.pools_plural[slot4]:AllReturned() and slot0.callingkey ~= slot4 then
				ResourceMgr.Inst:ClearBundleRef(slot3, true, true)
				slot0.pools_plural[slot4]:Clear()

				slot0.pools_plural[slot4] = nil
			end
		end
	else
		slot3.Destroy(slot2)
	end
end

function pg.PoolMgr.PreloadUI(slot0, slot1, slot2)
	slot0:GetUI(slot1, true, function (slot0)
		slot0:ReturnUI(slot0.ReturnUI, slot0)

		if slot0 then
			slot2()
		end
	end)
end

function pg.PoolMgr.GetPainting(slot0, slot1, slot2, slot3)
	slot5 = slot4 .. slot1

	slot0:FromPlural("painting/" .. slot1, slot1, slot2, 1, function (slot0)
		slot0:SetActive(true)
		slot0(slot0)
	end, function (slot0)
		return slot0 or ResourceMgr.Inst:getAssetSync("painting/unknown", "unknown", true, false)
	end, true)
end

function pg.PoolMgr.ReturnPainting(slot0, slot1, slot2)
	slot4 = slot3 .. slot1

	if IsNil(slot2) then
		Debugger.LogError("empty go: " .. slot1)
	elseif slot0.pools_plural[slot4] then
		slot2:SetActive(false)
		slot2.transform:SetParent(slot0.root, false)
		slot0.pools_plural[slot4]:Enqueue(slot2)
		slot0:ExcessPainting()
	else
		slot0.Destroy(slot2, true)
	end
end

function pg.PoolMgr.ExcessPainting(slot0)
	slot1 = 0
	slot2 = 4
	slot3 = {}

	for slot7, slot8 in pairs(slot0.pools_plural) do
		if string.find(slot7, "painting/") == 1 then
			table.insert(slot3, slot7)
		end
	end

	if slot2 < #slot3 then
		table.sort(slot3, function (slot0, slot1)
			return slot0.pools_plural[slot1].index < slot0.pools_plural[slot0].index
		end)

		for slot7 = slot2 + 1, #slot3, 1 do
			slot0.pools_plural[slot3[slot7]]:Clear(true)

			slot0.pools_plural[slot3[slot7]] = nil
		end

		ResourceMgr.Inst:unloadUnusedAssetBundles()

		slot0.paintingCount = slot0.paintingCount + 1

		if slot0.paintingCount > 10 then
			slot0.paintingCount = 0

			Resources.UnloadUnusedAssets()
		end
	end
end

function pg.PoolMgr.GetSprite(slot0, slot1, slot2, slot3, slot4)
	slot0:FromObjPack(slot1, tostring(slot2), slot3, typeof(Sprite), function (slot0)
		slot0(slot0)
	end)
end

function pg.PoolMgr.DestroySprite(slot0, slot1)
	slot3 = typeof(Sprite)

	if slot0.pools_pack[slot1] and slot0.pools_pack[slot2].type == slot3 then
		slot0.pools_pack[slot2]:Clear()

		slot0.pools_pack[slot2] = nil

		ResourceMgr.Inst:ClearBundleRef(slot2, true, false)
	end
end

function pg.PoolMgr.DestroyAllSprite(slot0)
	slot1 = {}
	slot2 = typeof(Sprite)

	for slot6, slot7 in pairs(slot0.pools_pack) do
		if slot7.type == slot2 and not slot0.preloads[slot6] then
			slot1[slot6] = slot7
		end
	end

	for slot6, slot7 in pairs(slot1) do
		slot0.pools_pack[slot6]:Clear()

		slot0.pools_pack[slot6] = nil

		ResourceMgr.Inst:ClearBundleRef(slot6, true, false)
	end
end

function pg.PoolMgr.SpriteMemUsage(slot0)
	slot1 = 0
	slot2 = 0.0009765625
	slot3 = typeof(Sprite)

	for slot7, slot8 in pairs(slot0.pools_pack) do
		if slot8.type == slot3 then
			slot9 = {}

			for slot13, slot14 in pairs(slot8.items) do
				if not table.contains(slot9, slot14.texture.name) then
					slot16 = 4

					if slot15.format == TextureFormat.RGB24 then
						slot16 = 3
					elseif slot15.format == TextureFormat.ARGB4444 or slot15.format == TextureFormat.RGBA4444 then
						slot16 = 2
					elseif slot15.format == TextureFormat.DXT5 or slot15.format == TextureFormat.ETC2_RGBA8 then
						slot16 = 1
					elseif slot15.format == TextureFormat.PVRTC_RGB4 or slot15.format == TextureFormat.PVRTC_RGBA4 or slot15.format == TextureFormat.ETC_RGB4 or slot15.format == TextureFormat.ETC2_RGB or slot15.format == TextureFormat.DXT1 then
						slot16 = 0.5
					end

					slot1 = slot1 + slot15.width * slot15.height * slot16 * slot2 * slot2

					table.insert(slot9, slot15.name)
				end
			end
		end
	end

	return slot1
end

slot9 = 64
slot10 = {
	"chapter/",
	"emoji/"
}

function pg.PoolMgr.GetPrefab(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1 .. slot2

	slot0:FromPlural(slot1, slot2, slot3, slot0, function (slot0)
		if string.find(slot0, "emoji/") == 1 and slot0:GetComponent(typeof(CriManaEffectUI)) then
			slot1:Pause(false)
		end

		slot0:SetActive(true)
		slot0:SetActive()
	end, nil, true)
end

function pg.PoolMgr.ReturnPrefab(slot0, slot1, slot2, slot3)
	slot4 = slot1 .. slot2

	if IsNil(slot3) then
		Debugger.LogError("empty go: " .. slot2)
	elseif slot0.pools_plural[slot4] then
		if string.find(slot1, "emoji/") == 1 and slot3:GetComponent(typeof(CriManaEffectUI)) then
			slot5:Pause(true)
		end

		slot3:SetActive(false)
		slot3.transform:SetParent(slot0.root, false)
		slot0.pools_plural[slot4]:Enqueue(slot3)
	else
		slot0.Destroy(slot3)
	end
end

function pg.PoolMgr.DestroyAllPrefab(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.pools_plural) do
		if _.any(slot0, function (slot0)
			return string.find(slot0, slot0) == 1
		end) then
			slot6:Clear()
			ResourceMgr.Inst:ClearBundleRef(slot5, true, false)
			table.insert(slot1, slot5)
		end
	end

	_.each(slot1, function (slot0)
		slot0.pools_plural[slot0] = nil
	end)
end

function pg.PoolMgr.FromPlural(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	function slot9()
		slot0.pools_plural[slot1].index = slot0.pluralIndex
		slot0.pluralIndex = slot0.pluralIndex + 1

		slot0.pluralIndex + 1(slot0.pools_plural[slot1]:Dequeue())
	end

	if not slot0.pools_plural[slot1 .. slot2] then
		slot0:LoadAsset(slot1, slot2, slot3, typeof(Object), function (slot0)
			if not slot0.pools_plural[] then
				if slot2 then
					slot0 = slot2(slot0)
				end

				slot0.pools_plural[] = slot3.New(slot0, )
			end

			slot5()
		end, slot7)
	else
		slot9()
	end
end

function pg.PoolMgr.FromSingle(slot0, slot1, slot2, slot3, slot4, slot5)
	function slot7()
		slot0.pools_single[slot1].index = slot0.singleIndex
		slot0.singleIndex = slot0.singleIndex + 1

		slot0.singleIndex + 1(slot0.pools_single[slot1].prefab)
	end

	if not slot0.pools_single[slot1 .. slot2] then
		slot0:LoadAsset(slot1, slot2, slot3, typeof(Object), function (slot0)
			if not slot0.pools_single[] then
				if slot2 then
					slot0 = slot2(slot0)
				end

				slot0.pools_single[] = slot3.New(slot0)
			end

			slot4()
		end, true)
	else
		slot7()
	end
end

function pg.PoolMgr.FromObjPack(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot0.pools_pack[slot1] or not slot0.pools_pack[slot6]:Get(slot2) then
		slot0:LoadAsset(slot1, slot2, slot3, slot4, function (slot0)
			if not slot0.pools_pack[] then
				slot0.pools_pack[] = slot2.New(slot2.New)
			end

			if not slot0.pools_pack[]:Get(slot4) then
				slot0.pools_pack[]:Set(slot4, slot0)
			end

			slot5(slot0)
		end, false)
	else
		slot5(slot0.pools_pack[slot6]:Get(slot2))
	end
end

function pg.PoolMgr.LoadAsset(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.callbacks[slot1 .. slot2] then
		table.insert(slot0.callbacks[slot7], slot5)
	elseif slot3 then
		slot0.callbacks[slot7] = {
			slot5
		}

		ResourceMgr.Inst:getAssetAsync(slot1, slot2, slot4, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			if slot0.callbacks[] then
				slot0.callbacks[slot1] = nil
				slot0.callingkey = slot1

				for slot5 = 1, #slot0.callbacks[], 1 do
					if slot5 == #slot1 then
						slot0.callingkey = nil
					end

					slot1[slot5](slot0)
				end
			end
		end), slot6, false)
	else
		slot5(ResourceMgr.Inst:getAssetSync(slot1, slot2, slot4, slot6, false))
	end
end

return
