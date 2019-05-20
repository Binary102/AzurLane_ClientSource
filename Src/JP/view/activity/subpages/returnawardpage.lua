slot0 = class("ReturnAwardPage", import("...base.BaseActivityPage"))
slot0.INVITER = 1
slot0.RETURNER = 2
slot0.REFRESH_TIME = 1800
slot3 = {
	{
		ui = "ReturnAwardPage",
		class = function (slot0, slot1)
			function slot4(slot0, slot1)
				LoadSpriteAsync("qicon/" .. slot1:getPainting(), function (slot0)
					if not IsNil(slot0) then
						slot0:GetComponent(typeof(Image)).sprite = slot0
					end
				end)
				UIItemList.New(slot0:Find("starts"), slot0:Find("starts/tpl")):align(slot1:getStar())
			end

			function (slot0)
				pg.DelegateInfo.New(slot0)

				slot0._go = pg.DelegateInfo.New
				slot0._tf = tf(tf)
				slot0._event = slot2
				slot0.bg = slot0._tf:Find("bg"):GetComponent(typeof(Image))
				slot0.codeTxt = slot0._tf:Find("code"):GetComponent(typeof(Text))
				slot0.ptTxt = slot0._tf:Find("slider/Text"):GetComponent(typeof(Text))
				slot0.phaseTotalTxt = slot0._tf:Find("total_progress"):GetComponent(typeof(Text))
				slot0.phaseTxt = slot0._tf:Find("progress"):GetComponent(typeof(Text))
				slot0.progress = slot0._tf:Find("slider")
				slot0.getBtn = slot0._tf:Find("get")
				slot0.awardTF = slot0._tf:Find("item")
				slot0.returnerList = UIItemList.New(slot0._tf:Find("returners/content"), slot0._tf:Find("returners/content/tpl"))
				slot0.help = slot0._tf:Find("help")
				slot0.awardOverView = slot0._tf:Find("award_overview")

				onButton(slot0, slot0.getBtn, function ()
					slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
						activity_id = slot0.activity.id,
						cmd = ActivityConst.RETURN_AWARD_OP_GET_AWARD,
						arg1 = slot0.nextTarget
					})
				end, SFX_PANEL)
				onButton(slot0, slot0.awardOverView, function ()
					slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
						cmd = ActivityConst.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW,
						arg1 = {
							dropList = slot0.config.drop_client,
							targets = slot0.config.target,
							level = slot0.fetchIndex,
							count = slot0.pt,
							resId = slot0.config.pt
						}
					})
				end, SFX_PANEL)
			end({
				__cname = "ReturnAwardPage.InviterPage",
				Update = function (slot0, slot1)
					slot0.activity = slot1
					slot2 = pg.TimeMgr.GetInstance():GetServerTime()

					if not ActivityMainScene.FetchReturnersTime or ActivityMainScene.FetchReturnersTime <= slot2 then
						ActivityMainScene.FetchReturnersTime = slot2 + slot0.REFRESH_TIME

						slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
							activity_id = slot0.activity.id,
							cmd = ActivityConst.RETURN_AWARD_OP_GET_RETRUNERS
						})

						return
					end

					slot0:UpdateData()
					slot0:UpdateUI()
					slot0:UpdateReturners()
				end,
				getTotalPt = function (slot0)
					slot1 = 0

					for slot5, slot6 in ipairs(slot0.returners) do
						slot1 = slot1 + slot6:getPt()
					end

					return slot1
				end,
				UpdateData = function (slot0)
					slot0.code = getProxy(PlayerProxy):getRawData().id
					slot0.fetchList = slot0.activity.data1_list
					slot0.config = pg.activity_template_headhunting[slot0.activity.id]
					slot0.targets = slot0.config.target
					slot0.fetchIndex = 0

					for slot5 = #slot0.targets, 1, -1 do
						if table.contains(slot0.fetchList, slot0.targets[slot5]) then
							slot0.fetchIndex = slot5

							break
						end
					end

					slot0.drops = slot0.config.drop_client
					slot0.nextIndex = math.min(slot0.fetchIndex + 1, #slot0.drops)
					slot0.nextDrops = slot0.config.drop_client[slot0.nextIndex]
					slot0.nextTarget = slot0.targets[slot0.nextIndex]
					slot0.returners = slot1:getClientList()
					slot0.pt = slot0:getTotalPt()
				end,
				UpdateUI = function (slot0)
					slot0.codeTxt.text = slot0.code
					slot0.ptTxt.text = slot0.pt .. "/" .. slot0.nextTarget

					setActive(slot0.getBtn, slot0.fetchIndex ~= #slot0.targets and slot0.nextTarget <= slot0.pt)

					slot0.phaseTxt.text = slot0.fetchIndex
					slot0.phaseTotalTxt.text = #slot0.targets

					setFillAmount(slot0.progress, slot0.pt / slot0.nextTarget)
					updateDrop(slot0.awardTF, {
						type = slot0.nextDrops[1],
						id = slot0.nextDrops[2],
						count = slot0.nextDrops[3]
					})
				end,
				UpdateReturners = function (slot0)
					slot1 = slot0.returners

					slot0.returnerList:make(function (slot0, slot1, slot2)
						if slot0 == UIItemList.EventUpdate then
							if slot0[slot1 + 1] then
								slot1(slot2:Find("info/icon"), slot5)
								setText(slot2:Find("info/name"), slot3:getName())
								setText(slot2:Find("info/pt/Text"), slot3:getPt())
							end

							setActive(slot2:Find("empty"), not slot3)
							setActive(slot2:Find("info"), slot3)
						end
					end)
					slot0.returnerList:align(3)
				end,
				Dispose = function (slot0)
					pg.DelegateInfo.Dispose(slot0)

					slot0.bg.sprite = nil
				end
			})

			return 
		end
	},
	{
		ui = "ReturnAward4RetrunerPage",
		class = function (slot0, slot1)
			function slot4(slot0, slot1, slot2)
				updateDrop(slot1:Find("item"), {
					type = slot2:getConfig("award_display")[1][1],
					id = slot2.getConfig("award_display")[1][2],
					count = slot2.getConfig("award_display")[1][3]
				})
				setText(slot1:Find("desc"), slot2:getConfig("desc"))
				setFillAmount(slot1:Find("slider"), slot2:getProgress() / slot2:getConfig("target_num"))
				setActive(slot4, not slot2:isFinish())
				setActive(slot1:Find("get"), slot2:isFinish() and not slot2:isReceive())
				setActive(slot1:Find("got"), slot2:isReceive())
				onButton(slot0, slot4, function ()
					slot0._event:emit(ActivityMediator.ON_TASK_GO, slot0._event)
				end, SFX_PANEL)
				onButton(slot0, slot5, function ()
					slot0._event:emit(ActivityMediator.ON_TASK_SUBMIT, slot0._event)
				end, SFX_PANEL)
			end

			function (slot0)
				pg.DelegateInfo.New(slot0)

				slot0._go = pg.DelegateInfo.New
				slot0._tf = tf(tf)
				slot0._event = slot2
				slot0.bg = slot0._tf:Find("bg"):GetComponent(typeof(Image))
				slot0.input = slot0._tf:Find("InputField")
				slot0.inputPlaceholder = slot0._tf:Find("InputField/Placeholder"):GetComponent(typeof(Text))
				slot0.confirmBtn = slot0._tf:Find("confim_btn")
				slot0.taskUIlist = UIItemList.New(slot0._tf:Find("task_list"), slot0._tf:Find("task_list/tpl"))
				slot0.totalProgress = slot0._tf:Find("total_progress"):GetComponent(typeof(Text))
				slot0.progress = slot0._tf:Find("progress"):GetComponent(typeof(Text))
				slot0.awrdOverviewBtn = slot0._tf:Find("award_overview")
				slot0.help = slot0._tf:Find("help")
				slot0.ptTxt = slot0._tf:Find("pt"):GetComponent(typeof(Text))

				onButton(slot0, slot0.confirmBtn, function ()
					if slot0.code ~= 0 then
						pg.TipsMgr:GetInstance():ShowTips(i18n("return_have_participated_in_act"))

						return
					end

					if not getInputText(slot0.input) or slot0 == "" then
						return
					end

					slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
						activity_id = slot0.activity.id,
						cmd = ActivityConst.RETURN_AWARD_OP_SET_RETRUNER,
						arg1 = tonumber(slot0)
					})
				end, SFX_PANEL)
				onButton(slot0, slot0.awrdOverviewBtn, function ()
					slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
						cmd = ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW,
						arg1 = {
							tasklist = slot0.config.task_list,
							ptId = pg.activity_template_headhunting[slot0.activity.id].pt,
							totalPt = slot0.pt
						}
					})
				end, SFX_PANEL)
			end({
				__cname = "ReturnAwardPage.RETURNPAGE",
				Update = function (slot0, slot1)
					slot0.activity = slot1

					slot0:UpdateData()

					if slot0:ShouldAcceptTasks() then
						slot0:AcceptTasks()
					else
						slot0:UpdateTasks()
					end

					if not (slot0.code ~= 0) then
						slot0.inputPlaceholder.text = i18n("input_returner_code")
					else
						slot0.inputPlaceholder.text = slot0.code

						setInputText(slot0.input, "")
					end

					slot0.input:GetComponent(typeof(InputField)).interactable = not slot2
				end,
				ShouldAcceptTasks = function (slot0)
					if slot0.code == 0 then
						return false
					end

					if slot0.taskIndex == 0 then
						return true
					end

					slot2 = getProxy(TaskProxy)

					return _.all(slot0.config.task_list[slot0.taskIndex], function (slot0)
						return slot0:getTaskById(slot0) == nil and slot0:getFinishTaskById(slot0) == nil
					end) or (_.all(slot0.config.task_list[slot0.taskIndex], function (slot0)
						return slot0:getFinishTaskById(slot0) ~= nil
					end) and not (slot0.taskIndex == #slot0.config.task_list) and function ()
						return slot0.taskIndex < slot0.day
					end())
				end,
				AcceptTasks = function (slot0)
					slot0._event:emit(ActivityMediator.RETURN_AWARD_OP, {
						activity_id = slot0.activity.id,
						cmd = ActivityConst.RETURN_AWARD_OP_RETURNER_GET_AWARD
					})
				end,
				UpdateData = function (slot0)
					slot0.config = pg.activity_template_returnner[slot0.activity.id]
					slot0.code = slot0.activity.data2
					slot0.pt = slot0.activity.data3
					slot0.taskIndex = slot0.activity.data4
					slot0.ptTxt.text = slot0.pt
					slot0.day = pg.TimeMgr.GetInstance():DiffDay(slot0.activity.getStartTime(slot1), pg.TimeMgr.GetInstance():GetServerTime()) + 1
				end,
				UpdateTasks = function (slot0)
					slot0.taskUIlist:make(function (slot0, slot1, slot2)
						if slot0 == UIItemList.EventUpdate then
							slot1(slot2, slot2, getProxy(TaskProxy):getTaskById(slot0[slot1 + 1]) or slot4:getFinishTaskById(slot3))
						end
					end)
					slot0.taskUIlist:align(#(slot0.config.task_list[slot0.taskIndex] or {}))

					slot0.totalProgress.text = #slot1
					slot0.progress.text = slot0.taskIndex
				end,
				Dispose = function (slot0)
					pg.DelegateInfo.Dispose(slot0)

					slot0.bg.sprite = nil
				end
			})

			return 
		end
	}
}

function slot0.SetUIName(slot0, slot1)
	slot0._uiName = slot0[math.max(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RETURN_AWARD).data1, 1)].ui
end

function slot0.OnFirstFlush(slot0)
	slot0.page = slot0[slot0.activity.data1].class(slot0._tf, slot0._event)

	onButton(slot0, slot0.page.help, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.returner_help.tip
		})
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.page:Update(slot0.activity)
end

function slot0.OnDestroy(slot0)
	slot0.page:Dispose()
end

return slot0
