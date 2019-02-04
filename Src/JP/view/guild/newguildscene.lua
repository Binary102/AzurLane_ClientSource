slot0 = class("NewGuildScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "NewGuildUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	slot0._resPanel:setResources(slot1)
end

function slot0.init(slot0)
	slot0.createPanel = slot0:findTF("create_panel")
	slot0.factionPanel = slot0:findTF("faction_panel")
	slot0.createBtn = slot0:findTF("create_panel/frame/create_btn")
	slot0.joinBtn = slot0:findTF("create_panel/frame/join_btn")
	slot0.topPanel = slot0:findTF("top")
	slot0._playerResOb = slot0:findTF("playerRes", slot0.topPanel)
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)
	setActive(slot0.topPanel, false)

	slot0.backBtn = slot0:findTF("back", slot0.topPanel)

	setActive(slot0.factionPanel, false)

	slot0.blhxImg = slot0:findTF("faction_panel/bg/blhx"):GetComponent(typeof(Image))
	slot0.cszzImg = slot0:findTF("faction_panel/bg/cszz"):GetComponent(typeof(Image))
	slot0.humanImg = slot0:findTF("faction_panel/human"):GetComponent(typeof(Image))
	slot0.mask = slot0:findTF("mask")

	SetActive(slot0.mask, false)
end

function slot0.didEnter(slot0)
	slot0:select()
end

function slot0.startCreate(slot0)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf)
	setActive(slot0.createPanel, true)
end

function slot0.select(slot0)
	slot0:startCreate()
	onButton(slot0, slot0.createBtn, function ()
		slot0:createGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.joinBtn, function ()
		slot0:joinGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.createPanel, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
end

function slot0.createGuild(slot0)
	setActive(slot0.createPanel, false)
	setActive(slot0.factionPanel, false)
	setActive(slot0.topPanel, false)

	slot0.createProcess = coroutine.wrap(function ()
		setActive(slot0.createPanel, false)

		slot0 = Guild.New({})

		slot0:selectFaction(slot0, slot0.createProcess)
		coroutine.yield()
		slot0:setDescInfo(slot0:getUIName(), slot0)
	end)

	slot0.createProcess()
end

function slot0.selectFaction(slot0, slot1, slot2)
	setActive(slot0.topPanel, true)
	setActive(slot0._playerResOb, false)
	setActive(slot0.factionPanel, true)
	onButton(slot0, slot0:findTF("faction_panel/bg/blhx"), function ()
		setActive(slot0.mask, true)
		LeanTween.value(go(slot0._tf), 1, 0.2, 0.2):setOnUpdate(System.Action_float(function (slot0)
			slot0.cszzImg.color = Color.New(slot0, slot0, slot0)
		end)):setOnComplete(System.Action(function ()
			LeanTween.delayedCall(0.3, System.Action(function ()
				slot0:setFaction(Guild.FACTION_TYPE_BLHX)

				if slot0 then
					slot1()
				end

				slot2.createProcess = nil

				LeanTween.delayedCall(0.2, System.Action(function ()
					slot0.cszzImg.color = Color.white

					setActive(slot0.mask, false)
				end))
			end))
		end))
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("faction_panel/bg/cszz"), function ()
		setActive(slot0.mask, true)
		LeanTween.value(go(slot0._tf), 1, 0, 0.2):setOnUpdate(System.Action_float(function (slot0)
			slot0.blhxImg.color = Color.New(slot0, slot0, slot0)

			if slot0 > 0.15 then
				slot0.humanImg.color = Color.New(slot0, slot0, slot0)
			end

			return
		end)):setOnComplete(System.Action(function ()
			LeanTween.delayedCall(0.3, System.Action(function ()
				slot0:setFaction(Guild.FACTION_TYPE_CSZZ)

				if slot0 then
					slot1()
				end

				slot2.createProcess = nil

				LeanTween.delayedCall(0.2, System.Action(function ()
					slot0.blhxImg.color = Color.white
					slot0.blhxImg.humanImg.color = Color.white

					setActive(slot0.mask, false)

					return
				end))

				return
			end))

			return
		end))

		return
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		setActive(slot0.createPanel, true)
		setActive(slot0.factionPanel, false)
		setActive(slot0.topPanel, false)

		setActive.createProcess = nil

		return
	end, SOUND_BACK)
end

function slot0.setDescInfo(slot0, slot1, slot2)
	pg.UIMgr:GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
		setActive(slot0.factionPanel, false)
		setActive(slot0._playerResOb, true)

		slot0.name = setActive
		slot0.infoGameobject = slot0
		slot1 = tf(slot0)

		setParent(slot1, slot0._tf)
		setActive(slot1, true)
		slot0.topPanel:SetAsLastSibling()

		slot5 = findTF(slot1, "bg/frame/policy_container/switch/off")
		slot6 = findTF(slot1, "bg/frame/policy_container/switch/on")
		slot10 = findTF(slot1, "bg/frame/policy_container/relax"):GetComponent(typeof(Text))
		slot11 = findTF(slot1, "bg/frame/policy_container/power"):GetComponent(typeof(Text))
		findTF(slot1, "bg/frame/confirm_btn/print_container/Text"):GetComponent(typeof(Text)).text = pg.gameset.create_guild_cost.key_value

		onInputChanged(slot0, slot2, function ()
			slot1, slot2 = wordVer(slot0, {
				isReplace = true
			})

			if slot1 > 0 then
				setInputText(slot0, slot2)
			end

			return
		end)
		onInputChanged(slot0, slot3, function ()
			slot1, slot2 = wordVer(slot0, {
				isReplace = true
			})

			if slot1 > 0 then
				setInputText(slot0, slot2)
			end

			return
		end)

		function slot13()
			slot1:setName(slot0)

			slot2 = wordVer(slot1)

			slot1:setManifesto(slot2.text)

			return
		end

		onToggle(slot0, slot4, function (slot0)
			setActive(slot0, not slot0)
			setActive(setActive, slot0)

			slot1 = Color.New(0.9803921568627451, 0.9803921568627451, 0.9686274509803922)
			Color.New(1, 0.8235294117647058, 0).color = (slot0 and slot1) or slot2
			Color.New(1, 0.8235294117647058, 0).color = (slot0 and slot2) or slot1

			(slot0 and slot2) or slot1:setPolicy((not slot0 and Guild.POLICY_TYPE_RELAXATION) or Guild.POLICY_TYPE_POWER)

			return
		end, SFX_PANEL)
		triggerToggle(slot4, false)
		onButton(slot0, slot7, function ()
			slot0.createProcess = nil

			slot0:createGuild()
			PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance(), slot0.infoGameobject)

			return
		end, SFX_CANCEL)
		onButton(slot0, slot0.backBtn, function ()
			triggerButton(triggerButton)

			return
		end)
		onButton(slot0, findTF(slot1, "bg/frame/confirm_btn"), function ()
			slot0 = slot0()

			if not slot1:getName() or slot1 == "" then
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_noname"))

				return
			end

			if not nameValidityCheck(slot1, 0, 20, {
				"spece_illegal_tip",
				"login_newPlayerScene_name_tooShort",
				"login_newPlayerScene_name_tooLong",
				"err_name_existOtherChar"
			}) then
				return
			end

			if not slot1:getFaction() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_nofaction"))

				return
			end

			if not slot1:getPolicy() then
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_nopolicy"))

				return
			end

			if not slot1:getManifesto() or slot2 == "" then
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

				return
			end

			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("guild_create_confirm", slot2),
				onYes = function ()
					if slot0.playerVO:getTotalGem() < slot0.playerVO then
						GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
					else
						slot0:emit(NewGuildMediator.CREATE, )
					end

					return
				end
			})

			return
		end, SFX_CONFIRM)
		pg.UIMgr:GetInstance():LoadingOff()

		return
	end)

	return
end

function slot0.closeInfoPanel(slot0)
	PoolMgr.GetInstance():ReturnUI(uiName, slot0.infoGameobject)

	return
end

function slot0.joinGuild(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)
	slot0:emit(NewGuildMediator.OPEN_GUILD_LIST)

	return
end

function slot0.onBackPressed(slot0)
	if slot0.createProcess ~= nil then
		triggerButton(slot0.backBtn)
	else
		triggerButton(slot0.createPanel)
	end

	return
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)

	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end

	return
end

return slot0
