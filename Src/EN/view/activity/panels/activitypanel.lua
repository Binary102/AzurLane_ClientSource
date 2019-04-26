slot0 = class("ActivityPanel")

function slot0.getDefaultBg(slot0)
	return "Clutter/8days"
end

function slot0.Ctor(slot0, slot1, slot2)
	slot0._tf = slot1
	slot0.view = slot2
	slot0.activity = slot2.activity
	slot0.bg = slot0:findTF("AD", slot0._tf)

	LoadImageSpriteAsync((slot0.activity:getConfig("bg") and slot3[1] and slot3[1]) or slot0:getDefaultBg(), slot0.bg)
	pg.DelegateInfo.New(slot0)
	slot0:onInit()
end

function slot0.Update(slot0, slot1)
	slot0.activity = slot1

	slot0:onUpdate()
end

function slot0.Dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)

	slot0._tf = nil

	clearImageSprite(slot0.bg)
	slot0:onDispose()
end

function slot0.onInit(slot0)
	return
end

function slot0.onUpdate(slot0)
	return
end

function slot0.onDispose(slot0)
	return
end

function slot0.emit(slot0, ...)
	slot0.view:emit(...)
end

function slot0.findTF(slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

return slot0
