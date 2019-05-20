slot0 = class("CommanderInfoScene", import("..base.BaseUI"))
slot0.PAGE_PLAY = 1
slot0.PAGE_TALENT = 2
slot0.PAGE_DETAIL = 3

function slot0.getUIName(slot0)
	return "CommanderInfoUI"
end

function slot0.getBGM(slot0)
	return "backyard"
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	slot0:updateGold()
end

function slot0.updateGold(slot0)
	if slot0.goldTxt then
		setText(slot0.goldTxt, slot0.playerVO.gold)
	end
end

function slot0.setPools(slot0, slot1)
	slot0.pools = slot1

	slot0:updateRes()
end

function slot0.updateRes(slot0)
	for slot4, slot5 in pairs(slot0.pools) do
		setText(slot0.resPanel:Find(slot5.id).Find(slot6, "Text"), slot5:getItemCount())
	end
end

function slot0.setCommander(slot0, slot1)
	slot0.commanderVO = slot1
	slot0.contextData.commanderVO = slot1

	slot0:updateCommander()
end

function slot0.init(slot0)
	slot0.bgTF = slot0._tf:Find("bg"):GetComponent(typeof(Image))
	slot0.backBtn = slot0:findTF("blur_panel/top/back_btn")
	slot0.mainTF = slot0:findTF("main")
	slot0.paintTF = slot0:findTF("paint", slot0.mainTF)
	slot0.levelTF = slot0:findTF("info/exp/level", slot0.mainTF):GetComponent(typeof(Text))
	slot0.nameTF = slot0:findTF("info/name_bg/content/Text", slot0.mainTF):GetComponent(typeof(Text))
	slot0.modifyNameBtn = slot0:findTF("info/name_bg/content/modify", slot0.mainTF)

	setActive(slot0.modifyNameBtn, pg.gameset.commander_rename_open.key_value == 1)

	slot0.expImg = slot0:findTF("info/exp/Image", slot0.mainTF):GetComponent(typeof(Image))
	slot0.rarityImg = slot0:findTF("info/rarity", slot0.mainTF)
	slot0.fleetTF = slot0:findTF("info/line/fleet", slot0.mainTF)
	slot0.leisureTF = slot0:findTF("info/line/leisure", slot0.mainTF)
	slot0.labelInBattleTF = slot0:findTF("info/line/inbattle", slot0.mainTF)
	slot0.lockTF = slot0:findTF("blur_panel/pages/detail/lock")
	slot0.pagesTF = slot0:findTF("blur_panel/pages")
	slot0.detailTF = slot0:findTF("blur_panel/pages/detail")

	setActive(slot0.detailTF, false)

	slot0.playTF = slot0:findTF("blur_panel/pages/play")

	setActive(slot0.playTF, false)

	slot0.talentTF = slot0:findTF("blur_panel/pages/talent")

	setActive(slot0.talentTF, false)

	slot0.leftPanel = slot0:findTF("blur_panel/left_panel")
	slot0.resPanel = slot0:findTF("blur_panel/top/res/bg")
	slot0.goldTxt = slot0:findTF("blur_panel/top/res/bg/gold/Text")
	slot0.toggleTFs = {
		slot0:findTF("blur_panel/left_panel/toggles/play"),
		slot0:findTF("blur_panel/left_panel/toggles/talent"),
		slot0:findTF("blur_panel/left_panel/toggles/detail")
	}

	setActive(slot0.toggleTFs[1], slot0.contextData.mode ~= CommandRoomScene.MODE_SELECT)
	setActive(slot0.toggleTFs[2], slot0.contextData.mode ~= CommandRoomScene.MODE_SELECT)

	slot0.panels = {
		CommanderPlayPanel.New(slot0.playTF),
		CommanderTalentPanel.New(slot0.talentTF),
		CommanderDetailPanel.New(slot0.detailTF)
	}
	slot0.treePanel = CommanderTreePanel.New(slot0:findTF("tree_panel"))
	slot0.msgbox = CommaderMsgBox.New(slot0:findTF("box_msg_panel"))
	slot0.renamePanel = ComanderRenamePanel.New(slot0, slot0:findTF("rename_panel"))

	slot0:enterAnim()
end

function slot0.opeRenamePanel(slot0, slot1)
	slot0.renamePanel:open(slot1)
end

function slot0.closeRenamePanel(slot0)
	slot0.renamePanel:close()
end

function slot0.openMsgBox(slot0, slot1)
	slot0.isShowMsgBox = true

	slot0.msgbox:openMsgBox(slot1)
end

function slot0.closeMsgBox(slot0)
	slot0.isShowMsgBox = nil

	slot0.msgbox:closeMsgBox()
end

function slot0.updateBg(slot0, slot1)
	if slot0.bg ~= slot1:getConfig("bg") then
		slot0.bg = slot2
		slot0.bgTF.sprite = LoadSprite("bg/commander_bg_" .. slot2)
	end
end

slot1 = 0.3

function slot0.enterAnim(slot0)
	setAnchoredPosition(slot0.mainTF, Vector3(30, slot0.mainTF.anchoredPosition.y, 0))
	LeanTween.moveLocalX(go(slot0.mainTF), 80, slot0):setFrom(30)
	LeanTween.moveLocalX(go(slot0.pagesTF), 0, slot0):setFrom(876):setOnComplete(System.Action(function ()
		return
	end))
end

function slot0.exitAnim(slot0, slot1)
	LeanTween.moveLocalX(go(slot0.pagesTF), 876, slot0):setFrom(0):setOnComplete(System.Action(function ()
		slot0()
	end))
end

function slot0.didEnter(slot0)
	slot0:updateBg(slot0.commanderVO)
	onButton(slot0, slot0.modifyNameBtn, function ()
		if not slot0.commanderVO:canModifyName() then
			slot0:openMsgBox({
				content = i18n("commander_rename_coldtime_tip", slot0.commanderVO:getRenameTimeDesc())
			})
		else
			slot0:opeRenamePanel(slot0.commanderVO)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		slot0:exitAnim(function ()
			slot0:emit(slot1.ON_BACK)
		end)
	end, SOUND_BACK)
	slot0:initToggles()
	triggerToggle(slot0.toggleTFs[slot0.contextData.page or slot0.PAGE_DETAIL], true)

	slot0.helpBtn = slot0:findTF("help_btn", slot0.leftPanel)

	onButton(slot0, slot0.helpBtn, function ()
		if slot0.page == slot1.PAGE_DETAIL then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_commander_info.tip
			})
		elseif slot0.page == slot1.PAGE_PLAY then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_commander_play.tip
			})
		elseif slot0.page == slot1.PAGE_TALENT then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_commander_ability.tip
			})
		end
	end, SFX_PANEL)
	addSlip(SLIP_TYPE_HRZ, slot0.paintTF, function ()
		slot0:emit(CommanderInfoMediator.ON_PREV)
	end, function ()
		slot0:emit(CommanderInfoMediator.ON_NEXT)
	end)
	slot0:updateRes()
	slot0:updateGold()
end

function slot0.checkFirstHelp(slot0)
	if slot0.onClose then
		return
	end

	if slot0.page == slot0.PAGE_DETAIL then
		checkFirstHelpShow("help_commander_info")
	elseif slot0.page == slot0.PAGE_PLAY then
		checkFirstHelpShow("help_commander_play")
	elseif slot0.page == slot0.PAGE_TALENT then
		checkFirstHelpShow("help_commander_ability")
	end
end

function slot0.updateLockState(slot0)
	setActive(slot0.lockTF:Find("image"), slot0.commanderVO:getLock() == 0)
	onButton(slot0, slot0.lockTF, function ()
		slot1:emit(CommanderInfoMediator.ON_LOCK, slot1.commanderVO.id, 1 - slot0)
	end, SFX_PANEL)
end

function slot0.initToggles(slot0)
	for slot4, slot5 in ipairs(slot0.toggleTFs) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				slot0:switchPage(slot0.switchPage)
			end
		end)
	end
end

function slot0.switchPage(slot0, slot1)
	if slot0.page == slot1 then
		return
	end

	if slot1 == slot0.PAGE_PLAY and slot0.commanderVO.inBattle then
		slot0.toggleTFs[slot0.page]:GetComponent("Toggle").isOn = true

		pg.TipsMgr:GetInstance():ShowTips(i18n("commander_is_in_battle"))

		return
	end

	slot0.panels[slot1]:attach(slot0, slot0.contextData.mode)
	slot0.panels[slot1]:update(slot0.commanderVO)

	if slot0.page then
		slot0.panels[slot0.page]:detach()
	end

	slot0.page = slot1

	slot0:checkFirstHelp()
end

function slot0.updateCommander(slot0)
	slot0:updateLockState()

	slot0.levelTF.text = "LV." .. slot0.commanderVO.level
	slot0.nameTF.text = slot0.commanderVO:getName()

	if slot0.commanderVO:isMaxLevel() then
		slot0.expImg.fillAmount = 1
	else
		slot0.expImg.fillAmount = slot1.exp / slot1:getNextLevelExp()
	end

	LoadImageSpriteAsync("CommanderRarity/" .. slot2, slot0.rarityImg, true)

	if slot1:getPainting() ~= slot0.painting then
		if slot0.painting then
			retPaintingPrefab(slot0.paintTF, slot0.painting)
		end

		setPaintingPrefab(slot0.paintTF, slot3, "info")

		slot0.painting = slot3
	end

	if slot0.page and slot0.panels[slot0.page] then
		slot0.panels[slot0.page]:update(slot0.commanderVO)
	end

	if slot1.fleetId then
		eachChild(slot0.fleetTF, function (slot0)
			setActive(slot0, go(slot0).name == tostring(slot0.fleetId))
		end)
	end

	setActive(slot0.fleetTF, slot1.fleetId and not slot1.inBattle)
	setActive(slot0.leisureTF, not slot1.inFleet and not slot1.inBattle)
	setActive(slot0.labelInBattleTF, slot1.inBattle)
end

function slot0.openTreePanel(slot0, slot1)
	slot0.treePanel:openTreePanel(slot1)
end

function slot0.closeTreePanel(slot0)
	slot0.treePanel:closeTreePanel()
end

function slot0.willExit(slot0)
	if slot0.page then
		slot0.panels[slot0.page]:detach()
	end

	for slot4, slot5 in ipairs(slot0.panels) do
		slot5:exit()
	end

	retPaintingPrefab(slot0.paintTF, slot0.commanderVO:getPainting())
	slot0.treePanel:dispose()
end

return slot0
