PageUtil = class("PageUtil")
this = PageUtil

this.Ctor = function (slot0, slot1, slot2, slot3, slot4)
	pg.DelegateInfo.New(slot0)

	slot0._leftBtn = slot1
	slot0._rightBtn = slot2
	slot0._maxBtn = slot3
	slot0._numTxt = slot4

	onButton(slot0, slot0._leftBtn, function ()
		if slot0._curNum - slot0._addNum <= 0 then
			slot0._curNum or slot0:setCurNum(slot0._curNum or slot0)

			return
		end
	end)
	onButton(slot0, slot0._rightBtn, function ()
		if slot0._maxNum < 0 then
			slot0:setCurNum(slot0)
		elseif slot0._maxNum < slot0 then
			slot0._maxNum or slot0:setCurNum(slot0._maxNum or slot0)
		end
	end)
	onButton(slot0, slot0._maxBtn, function ()
		if slot0._maxNum < 0 then
		else
			slot0:setCurNum(slot0._maxNum)
		end
	end)
	slot0:setAddNum(1)
	slot0:setDefaultNum(1)
	slot0:setMaxNum(-1)
end

this.setAddNum = function (slot0, slot1)
	slot0._addNum = slot1
end

this.setDefaultNum = function (slot0, slot1)
	slot0._defaultNum = slot1

	slot0:setCurNum(slot0._defaultNum)
end

this.setMaxNum = function (slot0, slot1)
	slot0._maxNum = slot1

	setActive(slot0._maxBtn, slot0._maxNum > 0)
end

this.setCurNum = function (slot0, slot1)
	slot0._curNum = slot1

	setText(slot0._numTxt, slot0._curNum)

	if slot0._numUpdate ~= nil then
		slot0._numUpdate(slot0._curNum)
	end
end

this.setNumUpdate = function (slot0, slot1)
	slot0._numUpdate = slot1
end

this.getCurNum = function (slot0)
	return slot0._curNum
end

return this
