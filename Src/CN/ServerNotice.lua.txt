class("ServerNotice", import(".Notice")).prefKey = function (slot0)
	return "ServerNotice" .. slot0.id
end

return class("ServerNotice", import(".Notice"))
