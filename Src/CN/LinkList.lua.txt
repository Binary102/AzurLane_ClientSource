ys = ys or {}
ys.LinkList = class("LinkList")
ys.LinkList.Head = nil
ys.LinkList.Tail = nil
ys.LinkList.Count = 0

ys.LinkList.Ctor = function (slot0)
	return
end

ys.LinkList.Clear = function (slot0)
	slot0.Head = nil
	slot0.Tail = nil
	slot0.Count = 0
end

ys.LinkList.NewNode = function (slot0, slot1)
	return {
		Data = slot1
	}
end

ys.LinkList.IsEmpty = function (slot0)
	return slot0.Count == 0
end

ys.LinkList.AddBefore = function (slot0, slot1, slot2)
	if slot1 == nil then
		return nil
	end

	slot3 = slot0:NewNode(slot2)

	if slot1.Before ~= nil then
		slot1.Before.Next = slot3
	end

	slot3.Before = slot1.Before
	slot3.Next = slot1
	slot1.Before = slot3

	if slot0.Head == slot1 then
		slot0.Head = slot3
	end

	slot0.Count = slot0.Count + 1

	return slot3
end

ys.LinkList.AddAfter = function (slot0, slot1, slot2)
	if slot1 == nil then
		return nil
	end

	slot3 = slot0:NewNode(slot2)

	if slot1.Next ~= nil then
		slot1.Next.Before = slot3
	end

	slot3.Next = slot1.Next
	slot1.Next = slot3
	slot3.Before = Node

	if slot0.Tail == slot1 then
		slot0.Tail = slot3
	end

	slot0.Count = slot0.Count + 1

	return slot3
end

ys.LinkList.AddFirst = function (slot0, slot1)
	return slot0:AddNodeFirst(slot0:NewNode(slot1))
end

ys.LinkList.AddNodeFirst = function (slot0, slot1)
	if slot0.Head ~= nil then
		slot0.Head.Before = slot1
	end

	slot1.Next = slot0.Head
	slot1.Before = nil
	slot0.Head = slot1

	if slot0.Tail == nil then
		slot0.Tail = slot1
	end

	slot0.Count = slot0.Count + 1

	return slot1
end

ys.LinkList.AddLast = function (slot0, slot1)
	return slot0:AddNodeLast(slot0:NewNode(slot1))
end

ys.LinkList.AddNodeLast = function (slot0, slot1)
	if slot0.Tail ~= nil then
		slot0.Tail.Next = slot1
	end

	slot1.Before = slot0.Tail
	slot1.Next = nil
	slot0.Tail = slot1

	if slot0.Head == nil then
		slot0.Head = slot1
	end

	slot0.Count = slot0.Count + 1

	return slot1
end

ys.LinkList.CopyTo = function (slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	if slot2 == nil then
		slot2 = 1
	end

	slot3 = slot0.Head

	for slot7 = 1, slot0.Count, 1 do
		table.insert(slot1, slot2, slot3.Data)

		slot3 = slot3.Next
		slot2 = slot2 + 1
	end
end

ys.LinkList.Find = function (slot0, slot1)
	slot2 = slot0.Head

	for slot6 = 1, slot0.Count, 1 do
		if slot2.Data == slot1 then
			return slot2
		end

		slot2 = slot2.Next
	end

	return nil
end

ys.LinkList.FindLast = function (slot0, slot1)
	slot2 = slot0.Tail

	for slot6 = 1, slot0.Count, 1 do
		if slot2.Data == slot1 then
			return slot2
		end

		slot2 = slot2.Before
	end

	return nil
end

ys.LinkList.RemoveFirst = function (slot0)
	slot0:Remove(slot0.Head)
end

ys.LinkList.RemoveLast = function (slot0)
	slot0:Remove(slot0.Tail)
end

ys.LinkList.Remove = function (slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.Head == slot1 then
		slot0.Head = slot1.Next
	end

	if slot0.Tail == slot1 then
		slot0.Tail = slot1.Before
	end

	if slot1.Next ~= nil then
		slot1.Next.Before = slot1.Before
	end

	if slot1.Before ~= nil then
		slot1.Before.Next = slot1.Next
	end

	slot0.Count = slot0.Count - 1
end

ys.LinkList.RemoveData = function (slot0, slot1)
	slot0:Remove(slot0:Find(slot1))

	return slot0.Find(slot1)
end

function slot2(slot0, slot1)
	if slot1 == nil then
		return slot0.Head
	else
		return slot1.Next
	end
end

ys.LinkList.Iterator = function (slot0)
	return slot0, slot0
end

ys.LinkList.Show = function (slot0)
	print("-------- list ++ begin --------")

	for slot4 in slot0:Iterator() do
		print(slot4.Data)
	end

	print("-------- list -- end ----------")
end

return
