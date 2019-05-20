pg = pg or {}
pg.ToastMgr = singletonClass("ToastMgr")
pg.ToastMgr.TYPE_ATTIRE = "Attire"

function slot1(slot0)
	function (slot0)
		slot0.pools = {}
		slot0.parent = GameObject.Find("__Pool__").transform
		slot0.resources = slot0
		slot0.AttireTpl = slot0.resources:Find("attire_tpl")
	end({
		Get = function (slot0, slot1)
			if not slot0.pools[slot1] then
				slot0.pools[slot1] = {}
			end

			slot3 = nil

			setActive((#slot2 <= 0 or table.remove(slot2, #slot2)) and Instantiate(slot0[slot1 .. "Tpl"]), true)

			return (#slot2 <= 0 or table.remove(slot2, #slot2)) and Instantiate(slot0[slot1 .. "Tpl"])
		end,
		Return = function (slot0, slot1, slot2)
			setActive(slot2, false)
			setParent(slot2, slot0.parent)
			table.insert(slot0.pools[slot1], slot2)
		end,
		Dispose = function (slot0)
			for slot4, slot5 in pairs(slot0.pools) do
				for slot9, slot10 in ipairs(slot5) do
					Destroy(slot10)
				end
			end

			slot0.pools = nil
		end
	})

	return 
end

function pg.ToastMgr.Init(slot0, slot1)
	PoolMgr.GetInstance():GetUI("ToastUI", true, function (slot0)
		slot0._go = slot0

		slot0._go:SetActive(false)

		slot0._tf = slot0._go.transform
		slot0.container = slot0._tf:Find("container")

		slot0._go.transform:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)

		slot0.poolMgr = slot1(slot0._tf:Find("resources"))
		slot0.caches = {}

		if slot0 then
			slot2()
		end
	end)
end

function pg.ToastMgr.ShowToast(slot0, slot1, slot2)
	table.insert(slot0.caches, {
		type = slot1,
		info = slot2
	})

	if #slot0.caches == 1 then
		slot0:StartToast()
	end
end

function pg.ToastMgr.StartToast(slot0)
	setActive(slot0._tf, true)

	slot1 = nil

	function ()
		if #slot0.caches == 0 then
			return
		end

		slot0["Update" .. slot0.caches[1].type](slot0.caches[1], , function ()
			table.remove(slot0.caches, 1)
			slot0.caches()
		end, function ()
			if #slot0.caches == 0 then
				setActive(slot0._tf, false)
			end
		end)
	end()
end

function pg.ToastMgr.UpdateAttire(slot0, slot1, slot2, slot3)
	slot4 = slot0.poolMgr:Get(slot1.type)

	setParent(slot4, slot0.container)
	slot4.transform:SetAsLastSibling()

	slot5 = slot4:GetComponent(typeof(DftAniEvent))

	slot5:SetTriggerEvent(function (slot0)
		if slot0 then
			slot0()
		end

		slot1:SetTriggerEvent(nil)
	end)
	slot5:SetEndEvent(function (slot0)
		slot0.poolMgr:Return(slot1.type, slot0.poolMgr)
		slot3:SetEndEvent(nil)

		if slot0.poolMgr then
			slot4()
		end
	end)
	slot4:GetComponent(typeof(Animation)):Play("attire")
	setActive(slot4.transform:Find("bg/icon_frame"), slot1.info.getType(slot6) == AttireConst.TYPE_ICON_FRAME)
	setActive(slot4.transform:Find("bg/chat_frame"), slot7 == AttireConst.TYPE_CHAT_FRAME)
	setText(slot4.transform:Find("bg/Text"), slot6:getConfig("name"))
end

function pg.ToastMgr.Dispose(slot0)
	setActive(slot0._tf, false)
	slot0.poolMgr:Dispose()

	slot0.poolMgr = nil
end

return
