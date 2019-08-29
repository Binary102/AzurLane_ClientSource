slot0 = class("WebVoteLayer", import("...base.BaseUI"))

function slot0.getUIName(slot0)
	return "WebVoteUI"
end

function slot0.setGroup(slot0, slot1)
	slot0.voteGroup = slot1
	slot0.voteShips = slot0.voteGroup:getList()
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.title = slot0:findTF("main/right_panel/title/main"):GetComponent(typeof(Text))
	slot0.subTitle = slot0:findTF("main/right_panel/title/Text"):GetComponent(typeof(Text))
	slot0.tagtimeTF = slot0:findTF("main/right_panel/title/sub"):GetComponent(typeof(Text))
	slot0.urlBtn = slot0:findTF("main/right_panel/filter_bg/filter_btn")
	slot0.helpBtn = slot0:findTF("main/right_panel/title/help")
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[pg.MsgboxMgr.GetInstance().ShowMsgBox].tip
		})
	end, SFX_PANEL)
	setActive(slot0.helpBtn, slot0.voteGroup:getConfig("help_text") and slot1 ~= "")
	onButton(slot0, slot0.urlBtn, function ()
		Application.OpenURL(pg.gameset.vote_web_url.description)
	end, SFX_PANEL)

	slot0.ships = VoteGroupRaceShipPage.New(slot0:findTF("main/right_panel"), slot0.event)
	slot0.ranks = VoteGroupRaceRankPage.New(slot0:findTF("main/left_panel"), slot0.event)

	slot0:UpdateMain()
end

function slot0.UpdateMain(slot0)
	slot0:initShips()
	slot0:initRanks()
	slot0:initTitles()
end

function slot0.initShips(slot0)
	slot0.displays = {}

	for slot4, slot5 in ipairs(slot0.voteShips) do
		table.insert(slot0.displays, slot5)
	end

	slot0.ships:ExecuteAction("Update", slot0.voteGroup, slot0.displays)
end

function slot0.initRanks(slot0)
	slot0.ranks:ExecuteAction("Update", slot0.voteGroup)
	slot0.ranks:AddLoadedCallback(function ()
		setActive(slot0.ranks.webBtn, false)
	end)
end

function slot0.initTitles(slot0)
	slot0.tagtimeTF.text = table.concat(slot0.voteGroup:getConfig("time_vote")[1][1], ".") .. i18n("word_maintain") .. " ~ " .. table.concat(slot0.voteGroup.getConfig("time_vote")[2][1], ".") .. "(23:59)"
	slot0.title.text = slot0.voteGroup:getConfig("name")
	slot0.subTitle.text = slot0.voteGroup:getConfig("desc")
end

function slot0.willExit(slot0)
	slot0.ships:Destroy()
	slot0.ranks:Destroy()
end

return slot0
