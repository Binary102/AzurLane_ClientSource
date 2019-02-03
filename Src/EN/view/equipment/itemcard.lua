slot0 = class("ItemCard")

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.bg = findTF(slot1, "bg")
	slot0.countTF = findTF(slot1, "bg/icon_bg/count"):GetComponent(typeof(Text))
	slot0.nameTF = findTF(slot1, "bg/name"):GetComponent(typeof(Text))
	slot0.bgTF = findTF(slot1, "bg/icon_bg"):GetComponent(typeof(Image))
	slot0.frameTF = findTF(slot1, "bg/icon_bg/frame"):GetComponent(typeof(Image))
	slot0.iconTF = findTF(slot1, "bg/icon_bg/icon"):GetComponent(typeof(Image))
	slot0.starsTF = findTF(slot1, "bg/icon_bg/stars")
	slot0.starTpl = findTF(slot1, "bg/icon_bg/startpl")
end

function slot0.update(slot0, slot1)
	slot0.itemVO = slot1

	updateItem(rtf(slot0.bg), slot1)

	slot0.countTF.text = (slot1.count > 0 and slot1.count) or ""
	slot0.nameTF.text = shortenString(HXSet.hxLan(slot1:getConfig("name")), 5)
end

function slot0.dispose(slot0)
	return
end

return slot0
