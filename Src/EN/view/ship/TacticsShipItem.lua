class("TacticsShipItem", import(".DockyardShipItem")).updateBlackBlock = function (slot0)
	warning("ko no dioda")

	if slot0.maskStatusOb then
		setActive(slot0.maskStatusOb, false)
	end
end

return class("TacticsShipItem", import(".DockyardShipItem"))
