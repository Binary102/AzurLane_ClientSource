slot0 = class("CommanderBoxCard")

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._parent = slot1
	slot0._tf = slot2
	slot0._go = go(slot2)
	slot0.startingTF = slot0._tf:Find("ongoing")
	slot0.waitTF = slot0._tf:Find("idle")
	slot0.startBtn = slot0.waitTF:Find("consume/start_btn")
	slot0.timerTxt = slot0.startingTF:Find("time/Text"):GetComponent(typeof(Text))
	slot0.slider = slot0.startingTF:Find("slider/bar")
	slot0.boxParent = slot0._tf:Find("char")
	slot0.titleStarting = slot0.startingTF:Find("title_starting")
	slot0.titleFinish = slot0.startingTF:Find("title_finish")
end

function slot0.update(slot0, slot1)
	slot0.boxVO = slot1

	slot0:removeTimer()
	removeOnButton(slot0.startBtn)
	removeOnButton(slot0._tf)

	if slot1:getState() == CommanderBox.STATE_WAITING then
		onButton(slot0, slot0.startBtn, function ()
			slot0._parent:showBuildPoolPanel(function (slot0)
				slot0._parent._parent:emit(CommandRoomMediator.ON_BUILD, slot0.id)
			end)
		end, SFX_PANEL)
	elseif slot2 == CommanderBox.STATE_STARTING then
		slot4 = slot1:getFinishTime() - slot1.beginTime
		slot0.timer = Timer.New(function ()
			if slot0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
				slot1:removeTimer()
				slot1:update(slot1.update)
			else
				slot1.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot1)

				setFillAmount(slot1.slider, 1 - slot1 / slot3)
			end
		end, 1, -1)

		slot0.timer:Start()
		slot0.timer.func()
	elseif slot2 == CommanderBox.STATE_FINISHED then
		slot0.timerTxt.text = "COMPLETE"

		setFillAmount(slot0.slider, 1)
		onButton(slot0, slot0._tf, function ()
			if getProxy(PlayerProxy):getData().commanderBagMax <= getProxy(CommanderProxy):getCommanderCnt() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("commander_capcity_is_max"))

				return
			end

			slot0._parent._parent:emit(CommandRoomMediator.ON_GET, slot1.id)
		end, SFX_PANEL)
	end

	setActive(slot0.titleStarting, slot2 == CommanderBox.STATE_STARTING)
	setActive(slot0.titleFinish, slot2 == CommanderBox.STATE_FINISHED)
	setActive(slot0.startingTF, slot2 ~= CommanderBox.STATE_WAITING)
	setActive(slot0.waitTF, slot2 == CommanderBox.STATE_WAITING)
	slot0:loadBox(slot1:getPrefab(), slot0.boxParent)
end

slot1 = true

function slot0.playAnim(slot0, slot1)
	setActive(slot0._parent.mask, true)
	slot0:loadBox(slot0.boxVO:getFetchPrefab(), slot0.boxParent, function (slot0)
		slot0.spineAnimUI = slot0

		slot0:SetActionCallBack(function (slot0)
			if slot0 == "finish" then
				setActive(slot0._parent.mask, false)
				setActive:SetActionCallBack(nil)
				setActive()
			end
		end)
	end)

	if slot0 then
		onButton(slot0, slot0._parent.mask, function ()
			if slot0.spineAnimUI then
				removeOnButton(slot0._parent.mask)
				setActive(slot0._parent.mask, false)
				setActive.spineAnimUI:SetActionCallBack(nil)
				slot1()

				slot1.spineAnimUI = nil
			end
		end, SFX_PANEL)
	end
end

function slot0.loadBox(slot0, slot1, slot2, slot3)
	if not slot1 then
		if slot0.modelTf then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.modelTf.gameObject)

			slot0.modelTf = nil
			slot0.prefabName = nil
		end
	else
		if slot0.prefabName == slot1 then
			return
		end

		if slot0.modelTf then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.modelTf.gameObject)
		end

		slot0.prefabName = slot1

		PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)
			slot0.modelTf = tf(slot0)
			slot0.modelTf.localScale = Vector3(0.7, 0.7, 1)
			slot0.modelTf.localPosition = Vector3(0, -123, 0)

			pg.ViewUtils.SetLayer(slot0.modelTf, Layer.UI)
			setParent(slot0.modelTf, setParent)
			slot0:GetComponent("SpineAnimUI"):SetAction("normal", 0)

			if slot0.GetComponent("SpineAnimUI").SetAction then
				slot2(slot1)
			end
		end)
	end
end

function slot0.removeTimer(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

function slot0.clear(slot0)
	pg.DelegateInfo.Dispose(slot0)
	slot0:removeTimer()

	if slot0.modelTf and slot0.prefabName then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.modelTf.gameObject)
	end
end

return slot0
