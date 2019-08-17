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
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0._playerResOb = slot0:findTF("playerRes", slot0.topPanel)
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0.backBtn = slot0:findTF("back", slot0.topPanel)

	setActive(slot0.factionPanel, false)

	slot0.mask = slot0:findTF("mask")

	SetActive(slot0.mask, false)
end

function slot0.didEnter(slot0)
	slot0:select()
end

function slot0.startCreate(slot0)
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
	onButton(slot0, slot0.backBtn, function ()
		if go(slot0.createPanel).activeSelf then
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
end

function slot0.createGuild(slot0)
	setActive(slot0.createPanel, false)
	setActive(slot0.factionPanel, false)

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
	function slot3(slot0, slot1)
		slot0.isPlaying = true
		slot2 = slot0:Find("bg")

		setActive(slot2, true)

		slot3 = slot2:GetComponent("CanvasGroup")

		LeanTween.value(go(slot2), 1, 3, 0.5):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
			slot0.alpha = 1 - slot0 / 3
		end)):setOnComplete(System.Action(function ()
			setActive(setActive, false)

			setActive.localScale = Vector3(1, 1, 1)
			Vector3(1, 1, 1).isPlaying = false

			1()
		end))
	end

	setActive(slot0.factionPanel, true)

	slot5 = slot0.factionPanel.Find(slot4, "panel")
	slot6 = slot5:Find("blhx")
	slot7 = slot5:Find("cszz")
	slot8 = slot5:Find("bg")

	function slot9()
		setImageSprite(setImageSprite, GetSpriteFromAtlas("commonbg/camp_bg", ""))
		setImageSprite(setImageSprite:Find("bg"), GetSpriteFromAtlas("clutter/blhx_icon", ""))
		setImageSprite(GetSpriteFromAtlas:Find("bg"), GetSpriteFromAtlas("clutter/cszz_icon", ""))
		setActive(GetSpriteFromAtlas.Find("bg"):Find("bg"), false)
		setActive(false:Find("bg"), false)

		return
	end

	if not slot0.isInitFaction then
		slot9()

		slot0.isInitFaction = true
	end

	onButton(slot0, slot6, function ()
		if slot0.isPlaying then
			return
		end

		slot1:setFaction(Guild.FACTION_TYPE_BLHX)

		if Guild.FACTION_TYPE_BLHX then
			slot2()
		else
			return
		end

		slot3(slot4, function ()
			slot0 = nil

			return
		end)

		return
	end, SFX_PANEL)
	onButton(slot0, slot7, function ()
		if slot0.isPlaying then
			return
		end

		slot1:setFaction(Guild.FACTION_TYPE_CSZZ)

		if Guild.FACTION_TYPE_CSZZ then
			slot2()
		else
			return
		end

		slot3(slot4, function ()
			slot0 = nil

			return
		end)

		return
	end)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.isPlaying then
			return
		end

		slot0.createProcess = nil

		setActive(slot0.createPanel, true)
		setActive(slot0.factionPanel, false)
		onButton(onButton, slot0.backBtn, function ()
			slot0:emit(slot1.ON_BACK)

			return
		end, SFX_CANCEL)

		return
	end, SFX_CANCEL)
	setActive(slot0.topPanel, true)
end

function slot0.setDescInfo(slot0, slot1, slot2)
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
		setActive(slot0._playerResOb, true)

		slot0.name = setActive
		slot0.infoGameobject = slot0
		slot1 = tf(slot0)

		setParent(slot1, slot0._tf)
		setActive(slot1, true)
		setActive(slot0.topPanel, true)
		slot0.topPanel:SetAsLastSibling()

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

		function slot10()
			slot1:setName(slot0)

			slot2 = wordVer(slot1)

			slot1:setManifesto(slot2.text)

			return
		end

		onToggle(slot0, slot4, function (slot0)
			if slot0 then
				slot0:setPolicy(Guild.POLICY_TYPE_RELAXATION)
			end

			return
		end, SFX_PANEL)
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				slot0:setPolicy(Guild.POLICY_TYPE_POWER)
			end

			return
		end, SFX_PANEL)
		triggerToggle(slot4, true)
		onButton(slot0, slot6, function ()
			slot0.createProcess = nil

			slot0:createGuild()
			PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance(), slot0.infoGameobject)

			return
		end, SFX_CANCEL)
		onButton(slot0, slot0.backBtn, function ()
			if slot0.isPlaying then
				return
			end

			slot0.createProcess = nil

			slot0:createGuild()
			PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance(), slot0.infoGameobject)

			return
		end, SFX_CANCEL)
		onButton(slot0, slot7, function ()
			slot0 = slot0()

			if not slot1:getName() or slot1 == "" then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_noname"))

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
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nofaction"))

				return
			end

			if not slot1:getPolicy() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nopolicy"))

				return
			end

			if not slot1:getManifesto() or slot2 == "" then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
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
		pg.UIMgr.GetInstance():LoadingOff()

		GetOrAddComponent(slot1, "CanvasGroup").alpha = 0
		slot0.isPlaying = true

		LeanTween.value(slot0, 0, 1, 0.6):setOnUpdate(System.Action_float(function (slot0)
			slot0.alpha = slot0

			return
		end)):setOnComplete(System.Action(function ()
			slot0.isPlaying = false

			setActive(slot0.factionPanel, false)

			return
		end)):setDelay(0.5)

		return
	end)

	return
end

function slot0.closeInfoPanel(slot0)
	PoolMgr.GetInstance():ReturnUI(uiName, slot0.infoGameobject)

	return
end

function slot0.joinGuild(slot0)
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
	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end

	return
end

return slot0
