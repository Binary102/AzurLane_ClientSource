slot0 = class("LevelFleetPanel")
slot1 = pg.extraenemy_template

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.hideBtn = findTF(slot0._tf, "hide_btn")
	slot0.bgImg = findTF(slot0._tf, "panel/bg"):GetComponent(typeof(Image))
	slot0.itemTF = findTF(slot0._tf, "panel/item_tpl/bg")
	slot0.itemMaskTF = findTF(slot0._tf, "panel/item_tpl/mask")
	slot0.msgTF = findTF(slot0._tf, "panel/msg")
	slot0.msgTxt = findTF(slot0._tf, "panel/msg"):GetComponent(typeof(Text))
	slot0.processTxt = findTF(slot0._tf, "panel/process/Text"):GetComponent(typeof(Text))
	slot0.hpSlider = findTF(slot0._tf, "panel/slider"):GetComponent(typeof(Slider))
	slot0.nameTxt = findTF(slot0._tf, "panel/slider/Text"):GetComponent(typeof(Text))
	slot0.maskTF = findTF(slot0._tf, "panel/mask")
	slot0.timerTxt = findTF(slot0.maskTF, "Text"):GetComponent(typeof(Text))
	slot0.msgPosition = slot0.msgTF.anchoredPosition
	slot0.msgCG = slot0.msgTF:GetComponent(typeof(CanvasGroup))
	slot0.panel = findTF(slot0._tf, "panel")
	slot0.panelPosX = slot0.panel.anchoredPosition.x
	slot0.panelWidth = slot0.panel.rect.width
	slot0.flag = true
	slot0.msgs = {}

	onButton(slot0, slot0.hideBtn, function ()
		slot0:tweenPanel()
	end, SFX_PANEL)
end

function slot0.tweenPanel(slot0)
	if LeanTween.isTweening(go(slot0.panel)) then
		return
	end

	if slot0.flag then
		LeanTween.moveX(slot0.panel, slot0.panelWidth, 0.2)
	else
		LeanTween.moveX(slot0.panel, slot0.panelPosX, 0.2)
	end

	slot0.flag = not slot0.flag
end

slot2 = 4

function slot0.updateMsg(slot0, slot1)
	if slot0.isTweeningMsg then
		table.insert(slot0.msgs, slot1)
	else
		slot0:tweenMsg(slot1)
	end
end

function slot0.tweenMsg(slot0, slot1)
	slot0.isTweeningMsg = true
	slot0.msgTxt.text = slot1

	LeanTween.moveY(slot0.msgTF, slot0.msgPosition.y + 40, 1):setDelay(slot0):setOnComplete(System.Action(function ()
		if LeanTween.isTweening(go(slot0.msgTF)) then
			LeanTween.cancel(go(slot0.msgTF))
		end

		slot0.msgTF.anchoredPosition = slot0.msgPosition
		slot0.msgTF.isTweeningMsg = nil
		slot0.msgTF.msgCG.alpha = 1

		if #slot0.msgTF.msgCG.msgs == 1 then
			slot0.msgTxt.text = table.remove(slot0.msgs, 1)
		elseif #slot0.msgs > 0 then
			slot0:tweenMsg(table.remove(slot0.msgs, 1))
		end
	end))
	LeanTween.value(go(slot0.msgTF), 1, 0, 1):setOnUpdate(System.Action_float(function (slot0)
		slot0.msgCG.alpha = slot0
	end)):setDelay(slot0)
end

function slot0.update(slot0, slot1)
	slot0.activityVO = slot1
	slot2 = slot0.activityVO:getConfig("config_data")[1] or {}
	slot3 = slot0.activityVO:getData1()
	slot4 = -1
	slot5 = 0

	for slot9, slot10 in ipairs(slot2) do
		if slot10[1] == slot3 then
			slot4 = slot9
			slot5 = {
				slot10[2],
				slot10[3]
			}

			break
		end
	end

	slot6 = pg.TimeMgr.GetInstance():parseTimeFromConfig(slot5)

	if slot0.openTimer then
		slot0.openTimer:Stop()

		slot0.openTimer = nil
	end

	setActive(slot0.maskTF, pg.TimeMgr.GetInstance():GetServerTime() < slot6)

	if slot7 < slot6 then
		slot0.openTimer = Timer.New(function ()
			slot0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot1 - pg.TimeMgr.GetInstance():GetServerTime())

			return
		end, 1, -1)

		slot0.openTimer:Start()
		slot0.openTimer.func()
	else
		slot0.hpSlider.value = slot0.activityVO.data2 / slot0[slot3].HP
		slot11 = slot8.background

		if slot0.activityVO.data2 == 0 then
			GetSpriteFromAtlasAsync("bg/" .. (slot11 .. "_d" or slot11), "", function (slot0)
				slot0.bgImg.sprite = slot0

				return
			end)
			updateDrop(slot0.itemTF, slot13)

			slot0.processTxt.text = slot4 .. "/" .. #slot2
			slot0.nameTxt.text = slot8.name

			setActive(slot0.itemMaskTF, slot10)
			setGray(slot0.itemTF, slot10, true)
		end
	end

	return
end

function slot0.clear(slot0)
	pg.DelegateInfo.Dispose(slot0)

	if slot0.openTimer then
		slot0.openTimer:Stop()

		slot0.openTimer = nil
	end

	return
end

return slot0
