GCThread = singletonClass("GCThread")
GCThread.R1024 = 0.00097656

function GCThread.Ctor(slot0)
	slot0.step = 1
	slot0.gctick = 0
	slot0.gccost = 0
	slot0.running = false
	slot0.gcHandle = UpdateBeat:CreateListener(slot0.GCStep, slot0)
	slot0.checkHandle = UpdateBeat:CreateListener(slot0.WatchStep, slot0)
end

function GCThread.GC(slot0, slot1)
	if slot1 then
		collectgarbage("collect")
		slot0:GCFinal()
	elseif not slot0.running then
		slot0.running = true

		slot0:CalcStep()

		slot0.gctick = 0
		slot0.gccost = 0

		UpdateBeat:AddListener(slot0.gcHandle)
	end
end

function GCThread.GCFinal(slot0)
	slot0.running = false

	UpdateBeat:RemoveListener(slot0.gcHandle)
	print("cached sprite size: " .. math.ceil(PoolMgr.GetInstance().SpriteMemUsage(slot1) * 10) / 10 .. "/" .. 24 .. "MB")

	if 24 < PoolMgr.GetInstance().SpriteMemUsage(slot1) then
		slot1:DestroyAllSprite()
	end

	LuaHelper.UnityGC()
	Resources.UnloadUnusedAssets()

	if Application.isEditor then
		print("lua mem: " .. collectgarbage("count") * slot0.R1024 .. "MB")
	end
end

function GCThread.GCStep(slot0)
	slot1 = os.clock()

	if not slot0.running then
	elseif collectgarbage("step", slot0.step) then
		slot0:GCFinal()
	else
		slot0.gccost = (slot0.gccost <= 0 and os.clock() * 1000 - slot1 * 1000) or slot0.gccost
		slot0.gccost = (slot0.gccost + os.clock() * 1000 - slot1 * 1000) * 0.5
		slot0.gctick = slot0.gctick + 1

		if slot0.gctick > 300 and slot0.gctick % 30 == 0 then
			slot0:CalcStep()
		end
	end
end

function GCThread.CalcStep(slot0)
	slot0.step = math.max(slot0.gctick - 60, 30) / 30 * 500 * math.max(1 - math.max(slot0.gccost - 3, 0) * 0.1, 0.1)
end

function GCThread.StartWatch(slot0, slot1)
	print("overhead: start watch")

	if slot1 < collectgarbage("count") * slot0.R1024 + 12 then
		slot1 = slot2 + 12
	end

	slot0.watcher = Timer.New(function ()
		if not slot0.running and slot2 < collectgarbage("count") * "count".R1024 then
			print("overhead: start gc " .. slot0 .. "MB")

			slot0.running = true

			slot0:CalcStep()

			slot0.gctick = 0
			slot0.gccost = 0

			UpdateBeat:AddListener(slot0.checkHandle)
		end
	end, 5, -1)

	slot0.watcher:Start()
end

function GCThread.StopWatch(slot0)
	print("overhead: stop watch")

	if slot0.watcher then
		slot0.watcher:Stop()

		slot0.watcher = nil
	end
end

function GCThread.WatchStep(slot0)
	slot1 = os.clock()

	if collectgarbage("step", slot0.step) then
		print("overhead: gc complete")

		if Application.isEditor then
			print("lua mem: " .. collectgarbage("count") * slot0.R1024 .. "MB")
		end

		slot0.running = false

		UpdateBeat:RemoveListener(slot0.checkHandle)
	else
		slot0.gccost = (slot0.gccost <= 0 and os.clock() * 1000 - slot1 * 1000) or slot0.gccost
		slot0.gccost = (slot0.gccost + os.clock() * 1000 - slot1 * 1000) * 0.5
		slot0.gctick = slot0.gctick + 1

		if slot0.gctick > 300 and slot0.gctick % 30 == 0 then
			slot0:CalcStep()
		end
	end
end

function GCThread.MarkMemory(slot0, slot1)
	slot2 = collectgarbage("count")

	warning(slot1 or "MemoryMark", slot2, slot2 - (slot0.lastMem or 0))

	slot0.lastMem = slot2
end

return GCThread
