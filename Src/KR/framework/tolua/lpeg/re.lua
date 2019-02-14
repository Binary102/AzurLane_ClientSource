slot0 = tonumber
slot1 = type
slot2 = print
slot3 = error
slot4 = setmetatable
slot7 = getmetatable(require("lpeg").P(0))

if _VERSION == "Lua 5.2" then
	_ENV = nil
end

slot9 = slot5.P(1)
slot11, slot12, slot13 = nil

slot14()

slot15 = slot5.P(function (slot0, slot1)
	slot0(slot1, slot0:sub(1, slot1 - 1))

	return slot1
end)

function slot19(slot0, slot1, slot2)
	if slot0(slot2) ~= "string" then
		return nil
	end

	if slot0:sub(slot1, (#slot2 + slot1) - 1) == slot2 then
		return slot3
	else
		return nil
	end
end

slot35 = ((({
	nl = slot5.P("\n")
})["space"] + "--" * (slot9 - ()["nl"])^0)^0 * slot5.Cg(slot5.Cc(false), "G") * slot5.P({
	"Exp",
	Exp = (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * (slot5.V("Grammar") + slot5.Cf(slot5.V("Seq") * ("/" * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * slot5.V("Seq"))^0, slot7.__add)),
	Seq = slot5.Cf(slot5.Cc(slot5.P("")) * slot5.V("Prefix")^0, slot7.__mul) * (#(slot5.P("/") + ")" + "}" + ":}" + "~}" + "|}" + slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0 * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * "<-" + -1) + function (slot0, slot1)
		slot0("pattern error near '%s'":format((#slot0 < slot1 + 20 and slot0:sub(slot1)) or slot0:sub(slot1, slot1 + 20) .. "..."), 2)
	end),
	Prefix = ("&" * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * slot5.V("Prefix")) / slot7.__len + ("!" * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * slot5.V("Prefix")) / slot7.__unm + slot5.V("Suffix"),
	Suffix = slot5.Cf(slot5.V("Primary") * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * ((slot5.P("+") * slot5.Cc(1, slot7.__pow) + slot5.P("*") * slot5.Cc(0, slot7.__pow) + slot5.P("?") * slot5.Cc(-1, slot7.__pow) + "^" * (slot5.Cg((slot5.C(slot5.R("09")^1) * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0) / slot0 * slot5.Cc(slot18)) + slot5.Cg(slot5.C(slot5.S("+-") * slot5.R("09")^1) * slot5.Cc(slot7.__pow))) + "->" * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * (slot5.Cg(("'" * slot5.C((slot9 - "'")^0) * "'" + "\"" * slot5.C((slot9 - "\"")^0) * "\"" + (slot5.C(slot5.R("09")^1) * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0) / slot0) * slot5.Cc(slot7.__div)) + slot5.P("{}") * slot5.Cc(nil, slot5.Ct) + slot5.Cg((slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * slot5.Carg(1)) / function (slot0, slot1)
		if not (slot1 and slot1[slot0]) then
			slot0("undefined name: " .. slot0)
		end

		return slot2
	end * slot5.Cc(slot7.__div))) + "=>" * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * slot5.Cg((slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * slot5.Carg(1)) / function (slot0, slot1)
		if not (slot1 and slot1[slot0]) then
			slot0("undefined name: " .. slot0)
		end

		return slot2
	end * slot5.Cc(slot5.Cmt))) * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0)^0, function (slot0, slot1, slot2)
		return slot2(slot0, slot1)
	end),
	Primary = "(" * slot5.V("Exp") * ")" + ("'" * slot5.C((slot9 - "'")^0) * "'" + "\"" * slot5.C((slot9 - "\"")^0) * "\"") / slot6.P + ("[" * slot5.C(slot5.P("^")^-1) * slot5.Cf((("%" * slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * slot5.Carg(1)) / function (slot0, slot1)
		if not ((slot1 and slot1[slot0]) or slot0[slot0]) then
			slot1("name '" .. slot0 .. "' undefined")
		end

		return slot2
	end + slot5.Cs(slot9 * slot5.P("-") / "" * (slot9 - "]")) / slot6.R + slot5.C(slot9)) * ((("%" * slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * slot5.Carg(1)) / function (slot0, slot1)
		if not ((slot1 and slot1[slot0]) or slot0[slot0]) then
			slot1("name '" .. slot0 .. "' undefined")
		end

		return slot2
	end + slot5.Cs(slot9 * slot5.P("-") / "" * (slot9 - "]")) / slot6.R + slot5.C(slot9)) - "]")^0, slot7.__add)) / function (slot0, slot1)
		return (slot0 == "^" and slot0 - slot1) or slot1
	end * "]" + ("%" * slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * slot5.Carg(1)) / function (slot0, slot1)
		if not ((slot1 and slot1[slot0]) or slot0[slot0]) then
			slot1("name '" .. slot0 .. "' undefined")
		end

		return slot2
	end + ("{:" * (slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * ":" + slot5.Cc(nil)) * slot5.V("Exp") * ":}") / function (slot0, slot1)
		return slot0.Cg(slot1, slot0)
	end + ("=" * slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0)) / function (slot0)
		return slot0.Cmt(slot0:Cb(), slot0.Cmt)
	end + slot5.P("{}") / slot6.Cp + ("{~" * slot5.V("Exp") * "~}") / slot6.Cs + ("{|" * slot5.V("Exp") * "|}") / slot6.Ct + ("{" * slot5.V("Exp") * "}") / slot6.C + slot5.P(".") * slot5.Cc(slot9) + ((slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * -((()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * "<-") + "<" * slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * ">") * slot5.Cb("G")) / function (slot0, slot1)
		if not slot1 then
			slot0("rule '" .. slot0 .. "' used outside a grammar")
		else
			return slot1.V(slot0)
		end

		return
	end,
	Definition = slot5.C(slot5.R("AZ", "az", "__") * slot5.R("AZ", "az", "__", "09")^0) * (()["space"] + "--" * (slot9 - ()["nl"])^0)^0 * "<-" * slot5.V("Exp"),
	Grammar = (slot5.Cg(slot5.Cc(true), "G") * slot5.Cf(slot5.V("Definition") / function (slot0, slot1)
		return slot0({
			slot0
		}, slot0, slot1)
	end * slot5.Cg(slot5.V("Definition"))^0, slot31)) / slot6.P
})) / slot6.P * (-slot9 + function (slot0, slot1)
	slot0("pattern error near '%s'".format((#slot0 < slot1 + 20 and slot0.sub(slot1)) or slot0.sub(slot1, slot1 + 20) .. "..."), 2)
end)
slot40 = {
	compile = function (slot0, slot1)
		if slot0:type() == "pattern" then
			return slot0
		end

		if not slot1:match(slot0, 1, slot1) then
			slot2("incorrect pattern", 3)
		end

		return slot2
	end,
	match = function (slot0, slot1, slot2)
		if not slot0[slot1] then
			slot0[slot1] = slot1(slot1)
		end

		return slot3:match(slot0, slot2 or 1)
	end,
	find = function (slot0, slot1, slot2)
		if not slot0[slot1] then
			slot0[slot1] = slot2.P({
				slot2.Cp() * slot1(slot1) / 0 * slot2.Cp() + 1 * slot2.V(1)
			})
		end

		slot4, slot5 = slot3:match(slot0, slot2 or 1)

		if slot4 then
			return slot4, slot5 - 1
		else
			return slot4
		end

		return
	end,
	gsub = function (slot0, slot1, slot2)
		slot0[slot1] = slot0[slot1] or {}

		if not slot0[slot1] or [slot2] then
			slot3[slot2] = slot2.Cs((slot1(slot1) / slot2 + 1)^0)
		end

		return slot4:match(slot0)
	end,
	updatelocale = function ()
		slot0.locale(slot1)

		slot1.a = slot1.alpha
		slot1.alpha.c = slot1.alpha.cntrl
		slot1.alpha.cntrl.d = slot1.alpha.cntrl.digit
		slot1.alpha.cntrl.digit.g = slot1.alpha.cntrl.digit.graph
		slot1.alpha.cntrl.digit.graph.l = slot1.alpha.cntrl.digit.graph.lower
		slot1.alpha.cntrl.digit.graph.lower.p = slot1.alpha.cntrl.digit.graph.lower.punct
		slot1.alpha.cntrl.digit.graph.lower.punct.s = slot1.alpha.cntrl.digit.graph.lower.punct.space
		slot1.alpha.cntrl.digit.graph.lower.punct.space.u = slot1.alpha.cntrl.digit.graph.lower.punct.space.upper
		slot1.alpha.cntrl.digit.graph.lower.punct.space.upper.w = slot1.alpha.cntrl.digit.graph.lower.punct.space.upper.alnum
		slot1.alpha.cntrl.digit.graph.lower.punct.space.upper.alnum.x = slot1.alpha.cntrl.digit.graph.lower.punct.space.upper.alnum.xdigit
		slot1.alpha.cntrl.digit.graph.lower.punct.space.upper.alnum.xdigit.A = slot2 - slot1.a
		slot2 - slot1.a.C = slot1.a - slot1.c
		slot1.a - slot1.c.D = slot1.c - slot1.d
		slot1.c - slot1.d.G = slot1.d - slot1.g
		slot1.d - slot1.g.L = slot1.g - slot1.l
		slot1.g - slot1.l.P = slot1.l - slot1.p
		slot1.l - slot1.p.S = slot1.p - slot1.s
		slot1.p - slot1.s.U = slot1.s - slot1.u
		slot1.s - slot1.u.W = slot1.u - slot1.w
		slot1.u - slot1.w.X = slot1.w - slot1.x

		slot6({}, slot0)
		slot6(slot4, slot0)
		slot6({}, {
			__mode = "v"
		})

		return
	end
}

if slot8 == "Lua 5.1" then
end

return slot40
