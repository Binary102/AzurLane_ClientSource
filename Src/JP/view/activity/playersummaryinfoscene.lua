slot0 = class("PlayerSummaryInfoScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "PlayerSummaryUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activityVO = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.palyerVO = slot1
end

function slot0.setSummaryInfo(slot0, slot1)
	slot0.summaryInfoVO = slot1
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("bg/back_btn")
	slot0.pageContainer = slot0:findTF("bg/main/pages")
	slot0.pageFootContainer = slot0:findTF("bg/main/page_foot")
end

function slot0.didEnter(slot0)
	if slot0.summaryInfoVO then
		slot0:initSummaryInfo()
	else
		slot0:emit(PlayerSummaryInfoMediator.GET_PLAYER_SUMMARY_INFO)
	end

	onButton(slot0, slot0.backBtn, function ()
		if slot0:inAnim() then
			return
		end

		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
end

slot1 = {
	{},
	{
		{
			"isProPose",
			true
		}
	},
	{
		{
			"isProPose",
			false
		}
	},
	{},
	{}
}

function slot0.inAnim(slot0)
	if _.any(slot0.pages or {}, function (slot0)
		return slot0:inAnim()
	end) then
		return true
	end

	return false
end

function slot0.initSummaryInfo(slot0)
	slot0.pages = {}
	slot0.loadingPage = SummaryPage.New(slot0.pageContainer:Find("loading"))

	slot0.loadingPage:init(0, slot0.summaryInfoVO)

	for slot4, slot5 in ipairs(slot0) do
		slot6 = slot0:findTF("page" .. slot4, slot0.pageContainer)

		if (slot5[1] and slot0.summaryInfoVO[slot5[1][1]] == slot5[1][2]) or not slot5[1] then
			slot7 = SummaryPage.New(slot6)

			slot7:init(slot4, slot0.summaryInfoVO)
			table.insert(slot0.pages, slot7)
		else
			setActive(slot6, false)
		end
	end

	slot0:initPageFoot()
	setActive(slot0.pageFootContainer, false)
	slot0.loadingPage:show(function ()
		slot0.loadingPage:hide(function ()
			slot0:updatePageFoot(1, function ()
				slot0:registerDrag()
			end)
			setActive(slot0.pageFootContainer, true)
		end)
	end)
end

function slot0.registerDrag(slot0)
	slot0:addVerticalDrag(slot0:findTF("bg"), function ()
		if slot0.currPage == #slot0.pages then
			return
		end

		if slot0.footTFs[slot0.currPage + 1] then
			slot0:updatePageFoot(slot0.currPage + 1)
		end
	end, function ()
		if slot0.currPage == 1 then
			return
		end

		if slot0.footTFs[slot0.currPage - 1] then
			slot0:updatePageFoot(slot0.currPage - 1)
		end
	end)
end

function slot0.initPageFoot(slot0)
	slot0.footTFs = {}

	for slot4 = 1, #slot0.pages, 1 do
		table.insert(slot0.footTFs, slot0.pageFootContainer:Find("dot_" .. slot4))
	end
end

function slot0.updatePageFoot(slot0, slot1, slot2)
	if slot0:inAnim() then
		return
	end

	function slot3()
		slot0.currPage = slot1

		if slot2 then
			slot2()
		end
	end

	if slot0.currPage then
		slot0.pages[slot0.currPage]:hide(function ()
			slot0.pages[slot1]:show(slot2)
			triggerToggle(slot0.footTFs[], true)
		end)
		triggerToggle(slot0.footTFs[slot0.currPage], false)
	else
		slot0.pages[slot1]:show(slot3)
		triggerToggle(slot0.footTFs[slot1], true)
	end
end

function slot0.addVerticalDrag(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot5 = nil
	slot6 = 0
	slot7 = 50

	slot4:AddBeginDragFunc(function ()
		slot0 = 0
		slot1 = nil
	end)
	slot4:AddDragFunc(function (slot0, slot1)
		slot2 = slot1.position

		if not slot0 then
			slot0 = slot2
		end

		slot1 = slot2.y - slot0.y
	end)
	slot4:AddDragEndFunc(function (slot0, slot1)
		if slot0 < -slot1 then
			if slot2 then
				slot2()
			end
		elseif slot1 < slot0 and slot3 then
			slot3()
		end
	end)
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.pages) do
		slot5:dispose()
	end

	slot0.loadingPage:dispose()

	slot0.loadingPage = nil
end

return slot0
