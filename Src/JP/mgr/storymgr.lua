pg = pg or {}
pg.StoryMgr = singletonClass("StoryMgr")
pg.StoryMgr.ENABLE = true

if PlayerPrefs.GetInt("storyEnable") == 1 then
	slot0.ENABLE = false
end

slot2 = false
slot3 = 1
slot4 = createLog("StoryMgr", LOG_STORY)
slot5 = {}
slot6 = {}
slot7 = {}

function slot8(slot0)
	slot0("load story: " .. slot0.id)
	table.insert(table.insert, slot0)

	table.insert[slot0.id] = slot0
end

slot9 = {
	"",
	"JP",
	"KR"
}

function slot0.GetStoryByName(slot0, slot1)
	slot2 = slot0[PLATFORM_CODE]

	if slot1 == "index" then
		slot1 = slot1 .. slot2
	end

	slot3 = "GameCfg.story" .. slot2 .. "." .. slot1

	if Application.isEditor then
		print("Story Path:", slot3)
	end

	return require(slot3)
end

function slot0.Ctor(slot0)
	slot0._go = nil
end

slot10 = {
	BG = 3,
	ASIDE = 1,
	DIALOG = 2
}
slot11 = {
	RIGHT = 1,
	CENTER = 2,
	LEFT = 0
}
slot12 = 0.3
slot13 = 1

function slot0.Init(slot0, slot1)
	print("initializing story manager...")
	PoolMgr.GetInstance():GetUI("StoryUI", true, function (slot0)
		slot0._go = slot0

		slot0:Load()
		slot0.Load()
	end)
end

function slot0.Load(slot0)
	slot0._go:SetActive(false)
	slot0._go.transform:SetParent(GameObject.Find("Overlay/UIOverlay").transform, false)

	slot0._curtain = findTF(slot0._go, "curtain")
	slot0._curtainCG = slot0._curtain:GetComponent(typeof(CanvasGroup))
	slot0._option_tpl = findTF(slot0._go, "options_panel/options/option_tpl")

	slot0._option_tpl:SetParent(tf(slot0._go), false)
	SetActive(slot0._option_tpl, false)

	slot0._dialogue = findTF(slot0._go, "dialogue")
	slot0._asideContainer = findTF(slot0._go, "aside")
	slot0._asideTpl = findTF(slot0._go, "aside_txt_tpl")
	slot0._asideContainer2 = findTF(slot0._go, "aside_2")
	slot0._asideTpl2 = findTF(slot0._go, "aside_txt_tpl_2")
	slot0._asideSignDate = findTF(slot0._go, "aside_sign_date")
	slot0._bg = findTF(slot0._go, "bg")
	slot0._bgCG = GetOrAddComponent(slot0._bg, typeof(CanvasGroup))
	slot0._main = findTF(slot0._go, "dialogue/main")
	slot0.content = findTF(slot0._go, "dialogue/main/content")
	slot0.nextTF = findTF(slot0._go, "dialogue/main/next")
	slot0.actorLeft = findTF(slot0._go, "dialogue/actor/actor_left")
	slot0.nameLeft = findTF(slot0._go, "dialogue/main/name_left")
	slot0.actorRight = findTF(slot0._go, "dialogue/actor/actor_right")
	slot0.nameRight = findTF(slot0._go, "dialogue/main/name_right")
	slot0.actorMiddle = findTF(slot0._go, "dialogue/actor/actor_middle")
	slot0.options = findTF(slot0._go, "options_panel")
	slot0.optionsCg = slot0.options:GetComponent(typeof(CanvasGroup))
	slot0.optionsContainer = findTF(slot0._go, "options_panel/options")
	slot0.optionsBg = findTF(slot0._go, "options_panel/bg")
	slot0.skipBtn = findTF(slot0._go, "skip_button")
	slot0.typeWriter = slot0.content:GetComponent(typeof(Typewriter))
	slot0._subBg = findTF(slot0._bg, "sub")

	setActive(slot0._subBg, false)

	slot0._effectPanel = findTF(slot0._go, "effect")
	slot0._flash = findTF(slot0._go, "flash")
	slot0._flashCG = slot0._flash:GetComponent(typeof(CanvasGroup))
	slot0.effectObjs = {}
	slot0.posActorLeft = slot0.actorLeft.localPosition
	slot0.posActorMiddle = slot0.actorMiddle.localPosition
	slot0.posActorRight = slot0.actorRight.localPosition
end

function slot0.IsPlayed(slot0, slot1, slot2)
	if getProxy(PlayerProxy) then
		return slot3:getData():IsPlayed(slot1, slot2)
	end

	return false
end

function slot0.Reset(slot0)
	return
end

function slot0.hideEffects(slot0)
	for slot4 = 1, slot0._effectPanel.childCount, 1 do
		if slot0._effectPanel:GetChild(slot4 - 1) then
			setActive(slot5, false)
		end
	end
end

slot14 = {
	"LevelScene2",
	"BattleScene",
	"EventListScene",
	"MilitaryExerciseScene",
	"DailyLevelScene"
}

function slot0.PlayOnTaskAdded(slot0, slot1, slot2, slot3, slot4, slot5)
	if not table.contains(slot0, getProxy(ContextProxy):getCurrentContext().viewComponent.__cname) then
		slot0:Play(slot1, slot2, slot3, slot4, slot5)
	end
end

function slot15()
	if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
		return slot1.data.chapterVO
	end
end

function slot0.Play(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = getProxy(ChapterProxy)
	slot7 = false

	if slot0() and slot6 and slot6:getActiveChapter() and PlayerPrefs.GetInt("skip_events_on_" .. slot8.id, 1) == 0 then
		slot7 = true
	end

	slot0.force = slot3 or slot7

	if slot0.storyId then
		slot0:addQuery(slot1, slot2)

		return
	end

	slot0.storyId = slot1

	slot1(slot0:GetStoryByName(slot1))

	slot9 = (slot3 and true) or slot2[slot1].type ~= slot4

	if slot9 and not slot0.ENABLE and slot0:IsPlayed(slot1) then
		if slot2 then
			slot2(true)
		end

		slot0.storyId = nil

		slot0:popQuery()

		return
	end

	if not slot3 and slot8.once and slot0:IsPlayed(slot1) then
		if slot2 then
			slot2(true)
		end

		slot0.storyId = nil

		slot0:popQuery()

		return
	end

	slot0:StartStory(slot8, function ()
		slot0.keepSeletedOptions = true

		if slot0.nextEpisode and not slot0:isRecall() then
			slot0:Play(slot0.nextEpisode)
		end

		if slot1 then
			slot1()
		end

		slot0.keepSeletedOptions = false
	end, slot4, slot5)
end

function slot0.getSelectedOptions(slot0)
	return slot0.selectedOptions
end

function slot0.storyLog(slot0, slot1)
	slot0(slot0:GetStoryByName(slot1))

	if not slot1[slot1] then
		print("no story:" .. slot1 .. "|" .. #slot1)

		return ""
	end

	slot3 = ""

	function slot4(slot0)
		string.gsub(slot0 or "", "{namecode:(%d+)}", function (slot0)
			return pg.name_code[tonumber(slot0)] and slot1.name
		end)
	end

	for slot8, slot9 in ipairs(slot2.scripts) do
		if slot9.say then
			slot10 = ""
			slot3 = slot3 .. "\n" .. HXSet.hxLan((not slot9.actorName and not slot9.actor and "背景音\n") or slot9.actorName or (slot9.actor > 0 and pg.ship_data_statistics[slot9.actor].name) or (slot9.actor == 0 and "指挥官") or "秘书舰", true) .. ":\n" .. HXSet.hxLan(slot9.say, true)
		end

		if slot9.sequence then
			for slot13, slot14 in pairs(slot9.sequence) do
				if slot14 and slot14[1] then
					slot3 = slot3 .. "\n旁白:\n" .. slot14[1]
				end
			end
		end
	end

	return slot3
end

function slot0.isRecall(slot0)
	return getProxy(ContextProxy):getCurrentContext().mediator == CollectionMediator
end

function slot0.StartStory(slot0, slot1, slot2, slot3, slot4)
	pg.CriMgr.GetInstance():StopCV()

	if not slot0.keepSeletedOptions then
		slot0.selectedOptions = {}
	end

	slot0.nextEpisode = nil
	slot0.optionFlag = 0
	slot5 = false
	slot0.interactive = true
	slot6 = (slot1.skippable or slot0:IsPlayed(slot1.id)) and not slot3

	setActive(slot0.skipBtn, not slot4)
	pg.m02:sendNotification(GAME.STORY_BEGIN, slot1.id)
	pg.DelegateInfo.New(slot0)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = slot1.id
	})
	setText(slot0._asideSignDate, "")
	removeAllChildren(slot0.actorLeft:Find("fitter"))
	removeAllChildren(slot0.actorLeft:Find("actor_sub"))
	removeAllChildren(slot0.actorRight:Find("fitter"))
	removeAllChildren(slot0.actorRight:Find("actor_sub"))
	removeAllChildren(slot0.actorMiddle:Find("fitter"))
	removeAllChildren(slot0.actorMiddle:Find("actor_sub"))
	SetActive(slot0.options, false)

	if type(slot1.jumpto) == "string" then
		slot0.nextEpisode = slot1.jumpto
	end

	if type(slot1.jumpto) == "function" then
		slot0.nextEpisode = slot1.jumpto()
	end

	slot7 = nil

	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)
	onButton(slot0, slot0.skipBtn, function ()
		if (not slot0.interactive or slot1) and not slot0.blackSkip then
			return
		end

		function slot0()
			if slot0.inTypeWritter then
				slot0.typeWriter:setSpeed(slot0.typeWritterSpeedUp * Time.timeScale)
			end

			for slot4 = 0, go(slot0._go):GetComponentsInChildren(typeof(Transform)).Length - 1, 1 do
				LeanTween.cancel(go(slot0[slot4]), true)
			end

			slot0.skipBtn:GetComponent(typeof(Button)).interactable = false
			slot1 = true

			false()
		end

		if slot3 then
			slot0()
		else
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				parent = rtf(slot0._go).parent,
				content = i18n("story_skip_confirm"),
				onYes = function ()
					slot0()
				end
			})
		end
	end)
	onButton(slot0, slot0._go, function ()
		if slot0.inTypeWritter then
			slot0.typeWriter:setSpeed(slot0.typeWritterSpeedUp * Time.timeScale)

			return
		end

		if not slot0.interactive then
			return
		end

		if slot0.blankScreen then
			return
		end

		if slot0.occlusion then
			return
		end

		if slot0.inflashin then
			return
		end

		if slot0.inflashout then
			return
		end

		if slot0.inAction then
			return
		end

		if slot0.inFadeOut then
			slot0.inFadeOut = false

			LeanTween.cancel(go(slot0._curtain))
			LeanTween.cancel:EndStory(LeanTween.cancel)

			return
		end

		slot2()
	end)
	coroutine.wrap(function ()
		for slot3, slot4 in ipairs(slot0.scripts) do
			if slot4.say then
				slot4.say = HXSet.hxLan(slot4.say)
			end

			if slot4.optionFlag and slot1.optionFlag ~= slot4.optionFlag then
			elseif slot2 then
				if slot4.compulsory then
					if slot1:isRecall() then
					end
				end
			else
				slot2 = false
				slot5 = true

				setActive(slot1._flash, false)

				slot1.blackSkip = false
				slot6 = slot4.mode or slot0.mode

				if slot6 == slot3.ASIDE then
					if slot4.flashout then
						slot1:flashout(slot4, function ()
							slot0:initAside(slot0)

							if table.getCount(table.getCount.sequence or {}) == 0 then
								slot2 = nil
							end
						end)
					else
						slot1:initAside(slot4)

						if table.getCount(slot4.sequence or {}) == 0 then
							slot5 = nil
						end
					end
				elseif slot6 == slot3.DIALOG then
					if slot4.flashout then
						slot1:flashout(slot4, function ()
							slot0:initDialog(slot0)
						end)
					else
						slot1:initDialog(slot4)
					end
				elseif slot6 == slot3.BG then
					if slot4.flashout then
						slot1:flashout(slot4, function ()
							slot0:initBg(slot0)
						end)
					else
						slot1:initBg(slot4)
					end
				end

				if slot4.options then
					if not slot4.typewriter then
						slot1:initOptions(slot4, function ()
							slot0()
						end)
					else
						function slot1.typeWriteCallback()
							slot0.typeWriteCallback = nil

							slot0:initOptions(slot0, function ()
								slot0()
							end)
						end
					end
				end

				if slot4.effects then
					slot1:setEffects(slot4.effects)
				end

				SetActive(slot1.nextTF, true)

				if slot4.bgm then
					if slot4.bgmDelay then
						pg.CriMgr.GetInstance():stopBGM(true)

						slot1.stopBGM = true

						LeanTween.delayedCall(slot4.bgmDelay, System.Action(function ()
							slot0.bgm = slot1.bgm
							slot0.stopBGM = nil

							pg.CriMgr.GetInstance():PlayBGM(slot1.bgm, true)
						end))
					else
						slot1.bgm = slot4.bgm
						slot1.stopBGM = nil

						pg.CriMgr.GetInstance():PlayBGM(slot4.bgm, true)
					end
				elseif slot4.stopbgm then
					pg.CriMgr.GetInstance():stopBGM(true)

					slot1.stopBGM = true
				end

				if slot4.flash then
					slot1._flash:GetComponent(typeof(Image)).color = (slot4.flash.black and Color(0, 0, 0)) or Color(1, 1, 1)
					slot1._flashCG.alpha = slot4.flash.alpha[1]

					setActive(slot1._flash, true)

					for slot11 = 1, slot4.flash.number, 1 do
						slot12 = LeanTween.value
						slot13 = go(slot1._flash)
						slot14 = slot4.flash.alpha[1]
						slot15 = slot4.flash.alpha[2]
						slot16 = (slot4.flash.dur and slot4.flash.dur / 2) or slot4.flash.dur1

						LeanTween.value(slot13, slot14, slot15, slot16):setDelay((slot11 - 1) * slot4.flash.delay):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
							slot0._flashCG.alpha = slot0

							return
						end)):setOnComplete(System.Action(function ()
							slot1 = go(slot0._flash)
							slot2 = slot1.flash.alpha[2]
							slot3 = slot1.flash.alpha[1]

							if not slot1.flash.dur or not (slot1.flash.dur / 2) then
								slot4 = slot1.flash.dur2
							end

							slot0(slot1, slot2, slot3, slot4):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
								slot0._flashCG.alpha = slot0

								return
							end)):setOnComplete(System.Action(function ()
								if slot1.flash.number <= slot0 then
									setActive(slot2._flash, false)
								end

								return
							end)):setDelay(slot1.flash.wait)

							return
						end))

						if not (slot4.flash.dur / 2) then
							slot16 = slot4.flash.dur1
						end
					end
				end

				if slot4.flashN then
					slot1._flash:GetComponent(typeof(Image)).color = (slot4.flashN.color and Color(slot4.flashN.color[1], slot4.flashN.color[2], slot4.flashN.color[3])) or Color(0, 0, 0)

					setActive(slot1._flash, true)

					for slot11, slot12 in ipairs(slot4.flashN.alpha) do
						slot14 = LeanTween.value(go(slot1._flash), slot12[1], slot12[2], slot12[3])
						slot13 = LeanTween.value(go(slot1._flash), slot12[1], slot12[2], slot12[3]).setDelay

						if not slot12[4] then
							slot15 = 0
						end

						slot13(slot14, slot15):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
							slot0._flashCG.alpha = slot0

							return
						end))
					end
				end

				if slot4.dialogShake then
					slot1.interactive = false

					LeanTween.moveX(slot1._dialogue, slot4.dialogShake.x, slot4.dialogShake.speed):setLoopPingPong(slot4.dialogShake.number):setOnComplete(System.Action(function ()
						slot0.interactive = true

						return
					end))
				end

				if slot4.soundeffect then
					if slot4.seDelay then
						LeanTween.delayedCall(slot4.seDelay, System.Action(function ()
							slot0.bgm = slot1.bgm
							slot0.stopBGM = nil

							playSoundEffect(nil.soundeffect)

							return
						end))
					else
						playSoundEffect(slot4.soundeffect)
					end
				end

				if slot4.movie then
					pg.CriMgr.GetInstance():stopBGM()
					playMovie(slot4.movie, function ()
						onNextTick(function ()
							if not slot0.stopBGM then
								if slot0.bgm then
									pg.CriMgr.GetInstance():resumeStoryBGM()
								else
									pg.CriMgr.GetInstance():resumeNormalBGM()
								end
							end

							slot1()

							return
						end)

						return
					end)

					slot5 = true
				end

				if type(slot4.jumpto) == "string" then
					slot1.nextEpisode = slot4.jumpto

					break
				end

				if type(slot4.jumpto) == "function" then
					slot1.nextEpisode = slot4.jumpto()

					break
				end

				skip = slot4.skip or 0

				if slot5 then
					coroutine.yield()
				end
			end
		end

		if not slot0.continueBgm then
			pg.CriMgr.GetInstance():resumeNormalBGM()
		end

		slot1.skipBtn:GetComponent(typeof(Button)).interactable = true

		if not typeof and slot0.fadeOut then
			if slot0.noWaitFade and slot5 then
				slot5()
				slot1:fadeOut(slot0.fadeType, slot0.fadeOut)
			else
				slot1:fadeOut(slot0.fadeType, slot0.fadeOut, slot5)
			end

			slot2 = true
		else
			if not slot2 and slot0.occlusion then
				slot1.occlusion = true
				true.blackScreenTimer = Timer.New(function ()
					slot0:EndStory()
					slot0.EndStory.blackScreenTimer:Stop()

					slot0.EndStory.blackScreenTimer.Stop.blackScreenTimer = nil
					slot0.EndStory.blackScreenTimer.Stop.occlusion = nil

					if nil then
						slot1()
					end

					return
				end, slot0.occlusion, 1)

				slot1.blackScreenTimer:Start()

				slot2 = true
			else
				slot1:EndStory(slot5)
			end
		end
	end)()
end

function slot0.fadeOut(slot0, slot1, slot2, slot3)
	if slot1 ~= 1 or not slot0._curtain then
		slot4 = slot0._bg
	end

	if slot1 ~= 1 or not slot0._curtainCG then
		slot5 = slot0._bgCG
	end

	slot0.inFadeOut = true

	setActive(slot4, true)
	LeanTween.value(go(slot4), 1, 0, slot2):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
		slot0.alpha = slot0

		return
	end)):setOnComplete(System.Action(function ()
		if slot0.inFadeOut then
			slot0:EndStory(slot0)

			slot0.EndStory.inFadeOut = false
		end

		return
	end))
	LeanTween.alpha(rtf(slot0._go), 0, slot2):setUseEstimatedTime(true)

	if go(slot0._asideContainer).activeSelf then
		for slot9 = 1, slot0._asideContainer.childCount, 1 do
			LeanTween.textAlpha(slot0._asideContainer:GetChild(slot9 - 1), 0, slot2):setUseEstimatedTime(true)
		end
	end

	if go(slot0._asideContainer2).activeSelf then
		for slot9 = 1, slot0._asideContainer2.childCount, 1 do
			LeanTween.textAlpha(slot0._asideContainer2:GetChild(slot9 - 1), 0, slot2):setUseEstimatedTime(true)
		end
	end

	if go(slot0._dialogue).activeSelf then
		SetActive(slot0._dialogue, false)
	end

	return
end

function slot0.initAside(slot0, slot1)
	if (slot1.asideType and slot1.asideType ~= 1) or not slot0._asideContainer then
		slot2 = slot0._asideContainer2
	end

	if (slot1.asideType and slot1.asideType ~= 1) or not slot0._asideTpl then
		slot3 = slot0._asideTpl2
	end

	slot0("enter aside mode............")
	SetActive(slot2, true)
	setActive(slot0._curtain, true)

	slot4 = slot0._curtainCG

	if not slot1.alpha then
		slot5 = 1
	end

	slot4.alpha = slot5
	slot0.interactive = false
	slot0.blackSkip = true

	removeAllChildren(slot2)
	setActive(slot0._subBg, false)

	if not slot1.bgSpeed then
		slot4 = 0.5
	end

	if slot1.bgFade and slot0.preBg then
		slot0.interactive = false
		slot6 = LeanTween.value(go(slot0._bg), 1, 0, slot4):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			slot0._bgCG.alpha = slot0

			return
		end))
		slot5 = LeanTween.value(go(slot0._bg), 1, 0, slot4).setUseEstimatedTime(true).setOnUpdate(System.Action_float(function (slot0)
			slot0._bgCG.alpha = slot0

			return
		end)).setDelay

		if not delay then
			slot7 = 0
		end

		slot5(slot6, slot7):setOnComplete(System.Action(function ()
			slot0.interactive = true
			slot0.preBg = nil

			setActive(slot0._bg, false)

			return
		end))
	else
		slot0.preBg = nil

		setActive(slot0._bg, false)
	end

	if slot0.preStep and slot1.paintingFadeOut then
		slot0.interactive = false

		slot0:paintingFadeOut(slot0.preStep, slot1, function ()
			slot0.interactive = true

			SetActive(slot0._dialogue, false)

			return
		end)
	else
		SetActive(slot0._dialogue, false)
	end

	function slot5()
		slot1 = nil
		slot2 = ipairs

		if not slot0.sequence then
			slot3 = {}
		end

		for slot5, slot6 in slot2(slot3) do
			slot7 = cloneTplTo(slot1, slot2)

			setActive(slot7, true)
			setText(slot7, slot8)
			setTextAlpha(slot7, 0)

			slot9 = LeanTween.textAlpha
			slot10 = slot7
			slot11 = 1

			if not slot0.sequenceSpd then
				slot12 = 1
			end

			slot1 = slot9(slot10, slot11, slot12):setDelay(slot0):setUseEstimatedTime(true)
		end

		setAnchoredPosition(slot3._asideSignDate, Vector3(292, -635.4, 0))

		if slot0.signDate then
			setText(slot3._asideSignDate, slot0.signDate[1])
			setTextAlpha(slot3._asideSignDate._asideSignDate, 0)

			slot2 = LeanTween.textAlpha
			slot3 = slot3._asideSignDate._asideSignDate._asideSignDate
			slot4 = 1

			if not slot0.sequenceSpd then
				slot5 = 1
			end

			slot1 = slot2(slot3, slot4, slot5):setDelay(slot0):setUseEstimatedTime(true)

			if slot0.signDate[3] then
				setAnchoredPosition(slot3._asideSignDate, Vector3(slot0.signDate[3][1], slot0.signDate[3][2], 0))
			end
		else
			setText(slot3._asideSignDate, "")
		end

		if slot1 then
			slot1:setOnComplete(System.Action(function ()
				slot0.interactive = true

				if slot1.autoComplete then
					triggerButton(slot0._go)
				end

				return
			end))
		end

		return
	end

	if slot1.flashin then
		slot0:flashin(slot1, function ()
			slot0()

			return
		end)
	else
		slot5()
	end

	slot6 = table.getCount

	if not slot1.sequence then
		slot7 = {}
	end

	if slot6(slot7) == 0 then
		slot0.interactive = true
	end

	if slot1.bgName then
		slot0._bgCG.alpha = 1
		slot0._bg:GetComponent(typeof(Image)).color = Color.New(1, 1, 1)

		setActive(slot0._bg, true)
		setImageSprite(slot0._bg, LoadSprite("bg/" .. slot1.bgName))
	end

	if slot1.bgShadow then
		slot6 = slot0._bg:GetComponent(typeof(Image))

		LeanTween.value(go(slot0._bg), slot1.bgShadow[1], slot1.bgShadow[2], slot1.bgShadow[3]):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			slot0.color = Color.New(slot0, slot0, slot0)

			return
		end))
	end

	return
end

function slot0.initDialog(slot0, slot1)
	slot0("enter dialogue mode............")
	SetActive(slot0._dialogue, true)
	SetActive(slot0._asideContainer, false)
	SetActive(slot0._asideContainer2, false)
	setText(slot0._asideSignDate, "")
	setActive(slot0._subBg, false)
	setActive(slot0._curtain, false)

	slot0.actorLeft.localPosition = slot0.posActorLeft
	slot0.actorRight.localPosition = slot0.posActorRight
	slot0.actorMiddle.localPosition = slot0.posActorMiddle

	if not slot1.bgSpeed then
		slot2 = 0.5
	end

	if slot1.bgFade and slot0.preBg then
		slot0.interactive = false
		slot4 = LeanTween.value(go(slot0._bg), 1, 0, slot2):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			slot0._bgCG.alpha = slot0

			return
		end))
		slot3 = LeanTween.value(go(slot0._bg), 1, 0, slot2).setUseEstimatedTime(true).setOnUpdate(System.Action_float(function (slot0)
			slot0._bgCG.alpha = slot0

			return
		end)).setDelay

		if not delay then
			slot5 = 0
		end

		slot3(slot4, slot5):setOnComplete(System.Action(function ()
			slot0.interactive = true
			slot0.preBg = nil

			setActive(slot0._bg, false)

			return
		end))
	else
		setActive(slot0._bg, false)
	end

	if slot1.bgName then
		slot0._bg:GetComponent(typeof(Image)).color = Color.New(1, 1, 1)
		slot0._bgCG.alpha = 1

		setActive(slot0._bg, true)
		setImageSprite(slot0._bg, LoadSprite("bg/" .. slot1.bgName))
	end

	if not slot1.side then
		slot3 = 0
	end

	slot4, slot5 = slot0:getTagetActorTF(slot3)
	slot6 = setActive
	slot7 = slot0.actorLeft

	if slot4 == slot0.actorLeft then
		slot8 = slot1.actor
	else
		slot8 = false

		if false then
			slot8 = true
		end
	end

	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.actorRight

	if slot4 == slot0.actorRight then
		slot8 = slot1.actor
	else
		slot8 = false

		if false then
			slot8 = true
		end
	end

	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.actorMiddle

	if slot4 == slot0.actorMiddle then
		slot8 = slot1.actor
	else
		slot8 = false

		if false then
			slot8 = true
		end
	end

	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.nameLeft

	if slot5 == slot0.nameLeft then
		if slot1.actor or slot1.actorName then
			slot8 = not slot1.withoutActorName
		end
	else
		slot8 = false

		if false then
			slot8 = true
		end
	end

	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.nameRight

	if slot5 == slot0.nameRight then
		if slot1.actor or slot1.actorName then
			slot8 = not slot1.withoutActorName
		end
	else
		slot8 = false

		if false then
			slot8 = true
		end
	end

	slot6(slot7, slot8)

	if slot1.actorPosition then
		slot6 = Vector3
		slot7 = slot4.localPosition.x

		if not slot1.actorPosition.x then
			slot8 = 0
		end

		slot7 = slot7 + slot8
		slot8 = slot4.localPosition.y

		if not slot1.actorPosition.y then
			slot9 = 0
		end

		slot4.localPosition = slot6(slot7, slot8 + slot9, 0)
	end

	slot4:SetAsLastSibling()

	if slot1.actor then
		if slot1.sound then
			playStorySound(slot1.sound)
		else
			stopStorySound()
		end

		slot6, slot7 = slot0:getNameAndPainting(slot1)

		if not slot1.painting then
			slot8 = {}
		end

		if not slot1.nameColor or not setColorStr(slot6, slot1.nameColor) then
			slot6 = setColorStr(slot6, COLOR_WHITE)
		end

		setText(slot5:Find("Text"), slot6)

		if not slot1.withoutPainting then
			if slot0.preStep and slot1.paintingFadeOut then
				slot0.interactive = false

				setActive(slot4, false)
				setActive(slot0._main, false)
				slot0:paintingFadeOut(slot0.preStep, slot1, function ()
					setActive(setActive, true)
					setActive(setActive._main, true)

					setActive._main.interactive = true

					return
				end)
			end

			setPaintingPrefab(slot4, slot7, "duihua")
			slot0:setSubActors(slot4, slot1.subActors)
			slot9(findTF(slot4, "fitter"):GetChild(0))

			if slot1.shake then
				if not slot1.shake.x then
					slot10 = 0
				end

				if not slot1.shake.y then
					slot11 = 10
				end

				slot13 = LeanTween.move
				slot14 = rtf(slot4)
				slot15 = Vector3(tf(slot4).localPosition.x + slot10, tf(slot4).localPosition.y + slot11, 0)

				if not slot1.shake.speed then
					slot16 = 1
				end

				slot14 = slot13(slot14, slot15, 1 / slot16)
				slot13 = slot13(slot14, slot15, 1 / slot16).setLoopPingPong

				if not slot1.shake.number then
					slot15 = 1
				end

				slot13(slot14, slot15):setUseEstimatedTime(true)
			end

			if slot1.action then
				slot10 = findTF(slot4, "fitter"):GetChild(0)
				slot11 = 0

				for slot15, slot16 in ipairs(slot1.action) do
					if slot16.type == "shake" then
						if not slot16.x then
							slot17 = 0
						end

						if not slot16.y then
							slot18 = 10
						end

						slot19 = LeanTween.move
						slot20 = rtf(slot4)
						slot21 = Vector3(tf(slot4).localPosition.x + slot17, tf(slot4).localPosition.y + slot18, 0)

						if not slot16.dur then
							slot22 = 1
						end

						slot20 = slot19(slot20, slot21, slot22)
						slot19 = slot19(slot20, slot21, slot22).setLoopPingPong

						if not slot16.number then
							slot21 = 1
						end

						slot20 = slot19(slot20, slot21):setUseEstimatedTime(true)
						slot19 = slot19(slot20, slot21).setUseEstimatedTime(true).setDelay

						if not slot16.delay then
							slot21 = 0
						end

						slot19(slot20, slot21)

						if not slot16.delay then
							slot19 = 0
						end

						if not slot16.dur then
							slot20 = 1
						end

						slot11 = slot19 + slot20 * slot16.number
					else
						if slot16.type == "zoom" then
							if not slot16.from then
								slot17 = {
									0,
									0,
									0
								}
							end

							if not slot16.to then
								slot18 = {
									1,
									1,
									1
								}
							end

							slot21 = LeanTween.scale(rtf(slot4), Vector3(slot18[1], slot18[2], slot18[3]), slot16.dur)
							slot20 = LeanTween.scale(rtf(slot4), Vector3(slot18[1], slot18[2], slot18[3]), slot16.dur).setDelay

							if not slot16.delay then
								slot22 = 0
							end

							slot20(slot21, slot22)

							if not slot16.delay then
								slot20 = 0
							end

							if not slot16.dur then
								slot21 = 0
							end

							slot11 = slot20 + slot21
						else
							if slot16.type == "rotate" then
								slot17 = LeanTween.rotate
								slot18 = rtf(slot4)
								slot19 = slot16.value

								if not slot16.dur then
									slot20 = 1
								end

								slot18 = slot17(slot18, slot19, slot20)
								slot17 = slot17(slot18, slot19, slot20).setLoopPingPong

								if not slot16.number then
									slot19 = 1
								end

								slot18 = slot17(slot18, slot19):setUseEstimatedTime(true)
								slot17 = slot17(slot18, slot19).setUseEstimatedTime(true).setDelay

								if not slot16.delay then
									slot19 = 0
								end

								slot17(slot18, slot19)

								if not slot16.delay then
									slot17 = 0
								end

								if not slot16.dur then
									slot18 = 1
								end

								slot11 = slot17 + slot18 * slot16.number
							else
								if slot16.type == "move" then
									if not slot16.x then
										slot17 = 0
									end

									if not slot16.y then
										slot18 = 0
									end

									slot19 = LeanTween.move
									slot20 = rtf(slot4)
									slot21 = Vector3(tf(slot4).localPosition.x + slot17, tf(slot4).localPosition.y + slot18, 0)

									if not slot16.dur then
										slot22 = 1
									end

									slot20 = slot19(slot20, slot21, slot22)
									slot19 = slot19(slot20, slot21, slot22).setDelay

									if not slot16.delay then
										slot21 = 0
									end

									slot19(slot20, slot21)

									if not slot16.delay then
										slot19 = 0
									end

									if not slot16.dur then
										slot20 = 1
									end

									slot11 = slot19 + slot20
								end
							end
						end
					end
				end

				slot0.inAction = true

				LeanTween.delayedCall(slot11, System.Action(function ()
					slot0.inAction = nil

					return
				end))
			end
		else
			removeAllChildren(slot4:Find("fitter"))
			removeAllChildren(slot4:Find("actor_sub"))
		end
	else
		removeAllChildren(slot4:Find("fitter"))
		removeAllChildren(slot4:Find("actor_sub"))

		if slot1.actorName then
			if not slot1.nameColor or not setColorStr(slot1.actorName, slot1.nameColor) then
				slot6 = setColorStr(slot1.actorName, COLOR_WHITE)
			end

			setText(slot5:Find("Text"), HXSet.hxLan(slot6))
		end
	end

	function slot6()
		if not slot1.say then
			slot2 = "..."
		end

		slot0(slot1, slot2)

		if slot1.typewriter then
			slot0:TypeWriter(slot0)
		end

		return
	end

	if slot1.flashin then
		slot0:flashin(slot1, function ()
			slot0()

			return
		end)
	else
		slot6()
	end

	slot0.preStep = slot1

	if slot1.blackBg then
		setActive(slot0._curtain, true)

		slot0._curtainCG.alpha = 1
	end

	return
end

function slot0.flashin(slot0, slot1, slot2)
	slot0.inflashin = true

	setText(slot0.content, "")

	slot3 = slot0._flash:GetComponent(typeof(Image))

	if not slot1.flashin.black or not Color(0, 0, 0) then
		slot4 = Color(1, 1, 1)
	end

	slot3.color = slot4
	slot0._flashCG.alpha = slot1.flashin.alpha[1]

	setActive(slot0._flash, true)
	LeanTween.value(go(slot0._flash), slot1.flashin.alpha[1], slot1.flashin.alpha[2], slot1.flashin.dur):setDelay(slot1.flashin.delay):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
		slot0._flashCG.alpha = slot0

		return
	end)):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end

		slot1.inflashin = nil

		return
	end))

	return
end

function slot0.flashout(slot0, slot1, slot2)
	slot0.inflashout = true
	slot3 = slot0._flash:GetComponent(typeof(Image))

	if not slot1.flashout.black or not Color(0, 0, 0) then
		slot4 = Color(1, 1, 1)
	end

	slot3.color = slot4
	slot0._flashCG.alpha = slot1.flashout.alpha[1]

	setActive(slot0._flash, true)
	LeanTween.value(go(slot0._flash), slot1.flashout.alpha[1], slot1.flashout.alpha[2], slot1.flashout.dur):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
		slot0._flashCG.alpha = slot0

		return
	end)):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end

		slot1.inflashout = nil

		return
	end))

	return
end

function slot0.TypeWriter(slot0, slot1, slot2)
	if not slot1.typewriter.speed then
		slot4 = 0.1
	end

	slot4 = slot4 * Time.timeScale
	slot0.inTypeWritter = true

	if not slot3.speedUp then
		slot5 = slot4
	end

	slot0.typeWritterSpeedUp = slot5

	slot0.typeWriter:setSpeed(slot4)
	slot0.typeWriter:Play()

	function slot0.typeWriter.endFunc()
		slot0.inTypeWritter = false
		slot0.typeWritterSpeedUp = nil

		if slot0.typeWriteCallback then
			slot0()
		end

		return
	end

	return
end

function slot0.getTagetActorTF(slot0, slot1)
	slot2, slot3, slot4 = nil

	if slot1 == slot0.LEFT then
		slot2 = slot0.actorLeft
		slot3 = slot0.nameLeft
		slot4 = slot0.actorRight
	else
		if slot1 == slot0.RIGHT then
			slot2 = slot0.actorRight
			slot3 = slot0.nameRight
			slot4 = slot0.actorLeft
		else
			if slot1 == slot0.CENTER then
				slot2 = slot0.actorMiddle
				slot3 = slot0.nameLeft
			end
		end
	end

	return slot2, slot3, slot4
end

function slot0.paintingFadeOut(slot0, slot1, slot2, slot3)
	if not slot2.painting then
		slot4 = {}
	end

	if slot1.side == slot2.side then
		if slot3 then
			slot3()
		end

		return
	end

	slot7 = slot2.paintingFadeOut.time
	slot8, slot14 = slot0:getNameAndPainting(slot1)

	setActive(slot5, true)

	slot10 = slot0:getTagetActorTF(slot1.side).anchoredPosition

	setPaintingPrefab(slot0:getTagetActorTF(slot6), slot9, "duihua")

	if not slot1.actorScale then
		slot12 = 1
	end

	if slot1.dir and slot1.dir < 0 then
		slot13 = -1
	else
		slot13 = 1
	end

	slot11.transform.localScale = Vector3(slot13 * slot12, slot12, slot12)

	slot0:setSubActors(slot11, slot1.subActors)

	slot15 = slot0
	slot14 = slot0.setFade
	slot16 = slot11
	slot17 = 1

	if not slot4.alpha then
		slot18 = slot0
	end

	slot14(slot15, slot16, slot17, slot18, 0)
	LeanTween.moveX(rtf(slot5), slot11.localPosition.x, slot7):setUseEstimatedTime(true):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end

		setActive(slot1, false)
		setActive(false, true)

		false.anchoredPosition = slot3

		return
	end))

	slot15 = slot0
	slot14 = slot0.setFade
	slot16 = slot5
	slot17 = 1

	if not slot4.alpha then
		slot18 = slot0
	end

	slot14(slot15, slot16, slot17, slot18, slot7)

	return
end

function slot0.setScale(slot0, slot1, slot2, slot3, slot4)
	LeanTween.scale(rtf(slot1), slot3, slot4):setUseEstimatedTime(true):setFrom(slot2)

	return
end

function slot0.setCurtainFade(slot0, slot1)
	if slot0.inFadeOut then
		return
	end

	LeanTween.value(go(target), 1, 0, slot1):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
		slot0._curtainCG.alpha = slot0

		return
	end))

	return
end

function slot0.setFade(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}
	slot6 = {}

	slot7(slot8)

	if findTF(slot1, "actor_sub") and slot9.childCount > 0 then
		for slot13 = 1, slot9.childCount, 1 do
			slot7(findTF(slot9:GetChild(slot13 - 1), "fitter"):GetChild(0))
		end
	end

	slot0.interactive = false

	LeanTween.value(go(slot1), slot2, slot3, slot4):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
		for slot4, slot5 in ipairs(slot0) do
			if not IsNil(slot5) then
				slot5.color = Color.New(slot0, slot0, slot0)
			end
		end

		return
	end)):setOnComplete(System.Action(function ()
		slot0.interactive = true

		return
	end))

	return
end

function slot0.initBg(slot0, slot1)
	slot0("enter bg mode............")
	setActive(slot0._bg, true)
	SetActive(slot0._asideContainer, false)
	SetActive(slot0._asideContainer2, false)
	setActive(slot0.actorLeft, false)
	setActive(slot0.actorRight, false)
	setActive(slot0.actorMiddle, false)
	setActive(slot0._curtain, false)
	setActive(slot0._dialogue, true)

	if slot1.blackBg then
		setActive(slot0._curtain, true)

		slot0._curtainCG.alpha = 1
	end

	if slot1.flashin then
		slot0:flashin(slot1)
	end

	if not slot1.side then
		slot2 = 0
	end

	slot3 = setActive
	slot4 = slot0.nameRight

	if slot1.side ~= 1 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.nameLeft

	if slot1.side ~= 0 then
		slot5 = false
	else
		slot5 = true
	end

	slot3(slot4, slot5)

	function slot3(slot0, slot1, slot2, slot3, slot4)
		slot6 = LeanTween.value(go(slot0._bg), slot0, slot1, slot2):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			slot0._bgCG.alpha = slot0

			return
		end))
		slot5 = LeanTween.value(go(slot0._bg), slot0, slot1, slot2).setUseEstimatedTime(true).setOnUpdate(System.Action_float(function (slot0)
			slot0._bgCG.alpha = slot0

			return
		end)).setDelay

		if not slot3 then
			slot7 = 0
		end

		slot5(slot6, slot7):setOnComplete(System.Action(function ()
			if slot0 then
				slot0()
			end

			return
		end))

		return
	end

	if not slot1.bgSpeed then
		slot4 = 0.5
	end

	if slot1.bgName then
		slot0._bg:GetComponent(typeof(Image)).color = Color.New(1, 1, 1)

		setActive(slot0._subBg, false)

		slot5 = LoadSprite("bg/" .. slot1.bgName)

		if slot0.preBg and slot0.preBg ~= slot1.bgName then
			slot0.interactive = false

			slot3(1, 0, slot4, 0, function ()
				setImageSprite(slot0._bg, )
				slot0._bg(0, 1, slot3, 0, function ()
					slot0.interactive = true

					return
				end)

				return
			end)
		else
			slot0._bgCG.alpha = 0

			setImageSprite(slot0._bg, slot5)
			slot3(0, 1, slot4, 0)
		end

		slot0.preBg = slot1.bgName
	end

	if slot1.bgFade then
		slot0.interactive = false

		slot3(1, 0, slot4, 0, function ()
			slot0.interactive = true

			if slot1.blankScreen then
				slot0.blankScreen = true

				SetActive(slot0._curtain, true)

				SetActive.blankScreenTimer = Timer.New(function ()
					SetActive(slot0._curtain, false)

					SetActive.blankScreen = nil

					triggerButton(slot0._go)

					return
				end, slot1.blankScreen, 1)

				SetActive.blankScreenTimer:Start()
			end

			return
		end)
		SetActive(slot0._dialogue, false)
	end

	if slot1.subBgName then
		setActive(slot0._subBg, true)
		setImageSprite(slot0._subBg, LoadSprite("bg/" .. slot1.subBgName.name), true)

		if not slot1.subBgName.anchors then
			slot6 = {
				0.5,
				0.5,
				0.5,
				0.5
			}
		end

		slot0._subBg.anchorMin = Vector2(slot6[1], slot6[2])
		slot0._subBg.anchorMax = Vector2(slot6[3], slot6[4])

		if not slot1.subBgName.pivot then
			slot7 = {
				0.5,
				0.5
			}
		end

		slot0._subBg.pivot = Vector2(slot7[1], slot7[2])

		if not slot1.subBgName.pos then
			slot8 = {
				0,
				0
			}
		end

		slot0._subBg.anchoredPosition = Vector2(slot8[1], slot8[2])
	end

	slot5 = setText
	slot6 = slot0.content

	if not slot1.say then
		slot7 = "..."
	end

	slot5(slot6, slot7)
	setActive(slot0._dialogue, slot1.say)

	if slot1.typewriter then
		slot0:TypeWriter(slot1)
	end

	slot5 = slot0:getNameAndPainting(slot1)

	if slot2 == 0 then
		setText(slot0.nameLeft:Find("Text"), slot5)
	else
		setText(slot0.nameRight:Find("Text"), slot5)
	end

	return
end

function slot0.getNameAndPainting(slot0, slot1)
	slot2 = ""
	slot3 = ""

	if not slot1.actor then
	else
		if slot4 > 0 then
			slot2 = Ship.getShipName(slot4)
			slot3 = Ship.getPaintingName(slot4)
		else
			if slot4 == 0 then
				slot2 = getProxy(PlayerProxy):getData().name
				slot3 = "unknown"
			else
				if slot4 == -1 and getProxy(PlayerProxy) then
					slot7 = getProxy(BayProxy):getShipById(slot5:getData().character)
					slot2 = slot7.name
					slot3 = slot7:getPainting()
				end
			end
		end
	end

	if slot1.actorName then
		slot2 = HXSet.hxLan(slot1.actorName)
	end

	if not slot1.painting then
		slot5 = {}
	end

	if not slot1.nameColor or not setColorStr(slot2, slot1.nameColor) then
		slot2 = setColorStr(slot2, COLOR_WHITE)
	end

	return slot2, slot3
end

function slot0.initOptions(slot0, slot1, slot2)
	slot0("enter bg Options............")

	slot0.skipBtn:GetComponent(typeof(Button)).interactable = false

	if not slot0.optionItems then
		slot0.optionItems = {}
	end

	slot0:removeOptBtns()

	for slot6, slot7 in ipairs(slot1.options) do
		if not slot0.optionItems[slot6] then
			slot0.optionItems[slot6] = cloneTplTo(slot0._option_tpl, slot0.optionsContainer)
		end

		slot9 = findTF(slot8, "option")
		slot9.transform.localPosition = Vector2(421, 0)

		setActive(slot8, true)
		setButtonText(slot9, slot10)
		onButton(slot0, slot9, function ()
			slot0:hideOptions(slot0, function ()
				slot0.optionFlag = slot1.flag

				table.insert(slot0.selectedOptions, slot0.optionFlag)

				if slot2() then
					slot2()
				end

				return
			end)

			return
		end)
	end

	slot0:showOptions()

	return
end

function slot0.showOptions(slot0)
	slot0.optionsBg.transform.localPosition = Vector3(816, 40)

	setActive(slot0.options, true)

	slot1 = 0

	LeanTween.cancel(go(slot0.optionsBg))
	LeanTween.moveX(slot0.optionsBg, 640, 0.5)
	LeanTween.rotate(rtf(slot0.optionsBg), 360, 5):setLoopClamp()

	for slot5, slot6 in ipairs(slot0.optionItems) do
		if isActive(slot6) then
			LeanTween.moveX(slot7, 0, 0.4):setDelay(slot1 * 0.1)

			slot1 = slot1 + 1
		end
	end

	slot0.optionsCg.interactable = false

	LeanTween.value(go(slot0.options), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
		slot0.optionsCg.alpha = slot0

		return
	end))
	LeanTween.delayedCall(slot1 * 0.1, System.Action(function ()
		slot0.skipBtn:GetComponent(typeof(Button)).interactable = true
		slot0.skipBtn.GetComponent(typeof(Button)).optionsCg.interactable = true

		return
	end))

	return
end

function slot0.hideOptions(slot0, slot1, slot2)
	slot0.skipBtn:GetComponent(typeof(Button)).interactable = false
	slot3 = 0

	LeanTween.cancel(go(slot0.optionsBg))
	LeanTween.moveX(slot0.optionsBg, 816, 0.5)
	LeanTween.rotate(rtf(slot0.optionsBg), -360, 5)

	for slot7, slot8 in ipairs(slot0.optionItems) do
		if isActive(slot8) and slot7 ~= slot1 then
			LeanTween.moveX(slot9, 421, 0.4):setDelay(slot3 * 0.1)

			slot3 = slot3 + 1
		end
	end

	slot0.optionsCg.interactable = false

	LeanTween.value(go(slot0.options), 1, 0, 0.2):setOnUpdate(System.Action_float(function (slot0)
		slot0.optionsCg.alpha = slot0

		return
	end)):setDelay(slot3 * 0.1 + 0.8)
	LeanTween.delayedCall(slot3 * 0.1 + 1, System.Action(function ()
		slot0.skipBtn:GetComponent(typeof(Button)).interactable = true
		slot0.skipBtn.GetComponent(typeof(Button)).optionsCg.interactable = true

		setActive(slot0.options, false)
		LeanTween.cancel(go(slot0.optionsBg))

		if go then
			slot1()
		end

		return
	end))

	return
end

function slot0.removeOptBtns(slot0)
	if not slot0.optionItems then
		return
	end

	for slot4, slot5 in ipairs(slot0.optionItems) do
		setActive(slot5, false)
	end

	return
end

function slot0.setEffects(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot6.name then
			slot7 = LeanTween.delayedCall

			if not slot6.delay then
				slot8 = 0
			end

			slot7(slot8, System.Action(function ()
				if not findTF(slot0._effectPanel, slot1.name) then
					if not slot0.effectObjs[slot1.name] then
						PoolMgr.GetInstance():GetUI(slot1.name, false, function (slot0)
							slot0.name = slot0.name

							setParent(slot0, slot1._effectPanel.transform)
							setActive(slot0, slot0.active)

							setActive.effectObjs[slot0.name] = {}
							setActive.effectObjs.effectObjs[slot0.name][1] = slot0.name
							setActive.effectObjs.effectObjs[slot0.name].effectObjs[slot0.name][2] = slot0

							return
						end)
					else
						setActive(slot1[2], slot1.active)
					end
				else
					SetActive(slot0, slot1.active)
				end

				return
			end))
		end
	end

	return
end

function slot0.EndStory(slot0, slot1)
	pg.CriMgr.GetInstance():ResumeCV()
	pg.DelegateInfo.Dispose(slot0)
	slot0:removeOptBtns()

	slot0.preStep = nil
	slot0.targetActorTF = nil
	slot0.inTypeWritter = nil
	slot0.interactive = nil
	slot0.blankScreen = nil
	slot0.inFadeOut = nil

	slot0:hideEffects()

	slot0.preBg = nil
	slot0.stopBGM = nil
	slot0.blackSkip = nil
	slot0.bgm = nil

	setActive(slot0.actorRight, false)
	setActive(slot0.actorLeft, false)
	setActive(slot0.actorMiddle, false)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = slot0.storyId
	})

	slot0.storyId = nil

	SetActive(slot0._go, false)
	LeanTween.alpha(rtf(slot0._go), 0.6823529411764706, 0):setUseEstimatedTime(true)
	pg.m02:sendNotification(GAME.STORY_END, slot2)

	for slot6, slot7 in pairs(slot0.effectObjs) do
		PoolMgr.GetInstance():ReturnUI(slot7[1], slot7[2])
	end

	slot0.effectObjs = {}

	if slot1 then
		slot1()
	end

	slot0:popQuery()

	return
end

function slot0.setSubActors(slot0, slot1, slot2)
	if not findTF(slot1, "actor_sub") then
		return
	end

	removeAllChildren(slot3)

	if not slot2 then
		return
	end

	slot4 = findTF(slot1, "tpl")

	for slot8, slot9 in pairs(slot2) do
		slot10, slot15 = slot0:getNameAndPainting({
			actor = slot9.actor
		})

		setPaintingPrefab(cloneTplTo(slot4, slot3), slot11, "duihua")

		if slot9.pos then
			setAnchoredPosition(slot12, slot9.pos)
		end

		if slot9.dir then
			if not slot2.scale then
				slot13 = 1
			end

			slot12.transform.localScale = Vector3(slot9.dir * slot13, slot13, slot13)
		end
	end

	return
end

function slot0.popQuery(slot0)
	if table.getCount(slot0) > 0 then
		table.remove(slot0, 1)

		if slot0[1] then
			slot0:Play(slot1[1], slot1[2])
		end
	end

	return
end

function slot0.addQuery(slot0, slot1, slot2)
	table.insert(slot0, {
		slot1,
		slot2
	})

	return
end

function slot0.isActive(slot0)
	return isActive(slot0._go)
end

return
