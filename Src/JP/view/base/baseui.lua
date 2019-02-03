slot0 = class("BaseUI")
slot1 = require("Framework.notify.event")
slot0.LOADED = "BaseUI:LOADED"
slot0.DID_ENTER = "BaseUI:DID_ENTER"
slot0.AVALIBLE = "BaseUI:AVALIBLE"
slot0.DID_EXIT = "BaseUI:DID_EXIT"
slot0.ON_BACK = "BaseUI:ON_BACK"
slot0.ON_HOME = "BaseUI:ON_HOME"
slot0.ON_CLOSE = "BaseUI:ON_CLOSE"
slot0.ON_DROP = "BaseUI.ON_DROP"
slot0.ON_DROP_LIST = "BaseUI.ON_DROP_LIST"
slot0.ON_ITEM = "BaseUI:ON_ITEM"
slot0.ON_SHIP = "BaseUI:ON_SHIP"
slot0.ON_AWARD = "BaseUI:ON_AWARD"
slot0.ON_ACHIEVE = "BaseUI:ON_ACHIEVE"
slot0.ON_EQUIPMENT = "BaseUI:ON_EQUIPMENT"
slot0.ON_SHIP_EXP = "BaseUI.ON_SHIP_EXP"
slot0.ON_BACK_PRESSED = "BaseUI:ON_BACK_PRESS"

function slot0.Ctor(slot0)
	slot0.event = slot0.New()
	slot0._isLoaded = false
	slot0._go = nil
	slot0._tf = nil
end

function slot0.setContextData(slot0, slot1)
	slot0.contextData = slot1
end

function slot0.getUIName(slot0)
	return nil
end

function slot0.getBGM(slot0)
	return nil
end

function slot0.preload(slot0, slot1)
	slot1()
end

function slot0.loadUISync(slot0, slot1)
	LoadAndInstantiateSync("UI", slot1, true, false).transform:SetParent(pg.UIMgr:GetInstance().UIMain.transform, false)

	return LoadAndInstantiateSync("UI", slot1, true, false)
end

function slot0.load(slot0)
	slot1 = nil
	slot2 = 0
	slot3 = Time.realtimeSinceStartup

	PoolMgr.GetInstance():GetUI(slot0:getUIName(), true, function (slot0)
		slot0 = slot0

		slot1()
	end)
	slot0:preload(function ()
		if slot0 + 1 == 2 then
			if slot1:getBGM() then
				playBGM(slot0)
			end

			pg.UIMgr.transform:SetParent(pg.UIMgr:GetInstance().UIMain.transform, false)
			pg.UIMgr.transform.SetParent:SetActive(true)
			slot1:onUILoaded(slot1.onUILoaded)
		end
	end)
end

function slot0.isLoaded(slot0)
	return slot0._isLoaded
end

function slot0.onUILoaded(slot0, slot1)
	slot0._go = slot1
	slot0._tf = slot1 and slot1.transform

	setActive(slot0._tf, true)

	slot0._isLoaded = true

	pg.DelegateInfo.New(slot0)
	slot0:init()
	pg.GuideMgr2:GetInstance():dispatch({
		isView = true,
		viewComponent = slot0.__cname,
		event = slot0.__cname
	})
	slot0:emit(slot0.LOADED)
end

function slot0.dispatchUILoaded(slot0, slot1)
	if slot1 or not slot0._guiderLoaded then
		pg.GuideMgr2:GetInstance():dispatchLoaded({
			viewComponent = slot0.__cname
		})
	end
end

function slot0.init(slot0)
	return
end

function slot0.enter(slot0)
	function slot1()
		slot0:emit(slot1.DID_ENTER)
		slot0.emit:didEnter()
		slot0.emit.didEnter:dispatchUILoaded()
		slot0.emit.didEnter.dispatchUILoaded:emit(slot1.AVALIBLE)
	end

	if slot0._tf ~= nil then
		slot3 = slot0._tf:GetComponent(typeof(UIEventTrigger))

		if slot0._tf:GetComponent(typeof(Animation)) ~= nil and slot3 ~= nil then
			if slot2:get_Item("enter") == nil then
				slot1()

				return
			end

			slot3.didEnter:AddListener(slot1)
			slot2:Play("enter")
		elseif slot2 ~= nil then
			print("cound not found [UIEventTrigger] component")
		elseif slot3 ~= nil then
			print("cound not found [Animation] component")
		else
			slot1()
		end
	else
		slot1()
	end
end

function slot0.didEnter(slot0)
	return
end

function slot0.closeView(slot0)
	slot0:emit(BaseUI.ON_CLOSE)
end

function slot0.willExit(slot0)
	return
end

function slot0.exit(slot0)
	slot0.exited = true

	pg.DelegateInfo.Dispose(slot0)
	slot0:willExit()

	function slot1()
		pg.GuideMgr2:GetInstance():dispatch({
			viewComponent = slot0.__cname,
			event = slot0.__cname .. "Exit"
		})
		pg.GuideMgr2.GetInstance().dispatch:detach()
		pg.GuideMgr2.GetInstance().dispatch.detach:emit(slot1.DID_EXIT)
	end

	if slot0._tf ~= nil then
		slot3 = slot0._tf:GetComponent(typeof(UIEventTrigger))

		if slot0._tf:GetComponent(typeof(Animation)) ~= nil and slot3 ~= nil then
			if slot2:get_Item("exit") == nil then
				slot1()

				return
			end

			slot3.didExit:AddListener(slot1)
			slot2:Play("exit")
		elseif slot2 ~= nil then
			print("cound not found [UIEventTrigger] component")
		elseif slot3 ~= nil then
			print("cound not found [Animation] component")
		else
			slot1()
		end
	else
		slot1()
	end
end

function slot0.attach(slot0, slot1)
	return
end

function slot0.detach(slot0, slot1)
	slot0._isLoaded = false
	slot0._tf = nil
	slot2 = slot0:getUIName()

	if slot0._go ~= nil and slot2 then
		PoolMgr.GetInstance():ReturnUI(slot2, slot0._go)

		slot0._go = nil
	end
end

function slot0.emit(slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

function slot0.findGO(slot0, slot1, slot2)
	return findGO(slot2 or slot0._go, slot1)
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

function slot0.getTpl(slot0, slot1, slot2)
	slot3 = slot0:findTF(slot1, slot2)

	slot3:SetParent(slot0._tf, false)
	SetActive(slot3, false)

	return slot3
end

function slot0.setSpriteTo(slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).sprite = slot0:findTF(slot1):GetComponent(typeof(Image)).sprite

	if slot3 then
		slot4:SetNativeSize()
	end
end

function slot0.setImageAmount(slot0, slot1, slot2)
	slot1:GetComponent(typeof(Image)).fillAmount = slot2
end

function slot0.onBackPressed(slot0)
	slot0:emit(slot0.ON_BACK_PRESSED)
end

return slot0
