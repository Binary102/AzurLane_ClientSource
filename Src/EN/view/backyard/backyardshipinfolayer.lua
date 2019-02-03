slot0 = class("BackYardShipInfoLayer", import("..base.BaseUI"))
slot0.SHIP_TRAIN_TYPE = 1
slot0.SHIP_REST_TYPE = 2
slot0.SHIP_CLASS_TYPE = 3

function slot0.getUIName(slot0)
	return "BackYardShipInfoUI"
end

function slot0.setTrainShipVOs(slot0, slot1)
	slot0.trainShipVOs = slot1
end

function slot0.setResetShipVOs(slot0, slot1)
	slot0.restShipVOs = slot1
end

function slot0.setClassShipVOs(slot0, slot1)
	slot0.classShipVOs = slot1
end

function slot0.setCourseVO(slot0, slot1)
	slot0.courseVO = slot1
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setDormVO(slot0, slot1)
	slot0.dormVO = slot1
end

function slot0.setResClassVO(slot0, slot1)
	slot0.setResClassVO = slot1
end

function slot0.init(slot0)
	slot0._guiderLoaded = true
	slot0.speedTFs = {}
	slot0.cards = {}
	slot0.shipTpl = slot0:findTF("resources/shiptpl")
	slot0.addTpl = slot0:findTF("resources/addtpl")
	slot0.extendTpl = slot0:findTF("resources/extendtpl")
	slot0.mainPanel = slot0:findTF("main")
	slot0.trainContainer = slot0:findTF("frame/train_panel/scrollview/ships", slot0.mainPanel)
	slot0.restContainer = slot0:findTF("frame/rest_panel/scrollview/ships", slot0.mainPanel)
	slot0.classContainer = slot0:findTF("frame/class_panel/scrollview/ships", slot0.mainPanel)
	slot0.trainToggle = slot0:findTF("main/frame/top/train_btn"):GetComponent(typeof(Image))
	slot0.restToggle = slot0:findTF("main/frame/top/rest_btn"):GetComponent(typeof(Image))
	slot0.classToggle = slot0:findTF("main/frame/top/class_btn"):GetComponent(typeof(Image))
	slot0.trainingTitle = slot0:findTF("main/frame/top/title_training")
	slot0.restTitle = slot0:findTF("main/frame/top/title_rest")
	slot0.classTitle = slot0:findTF("main/frame/top/title_class")
	slot0.shipCountxt = slot0:findTF("main/frame/top/value/Text"):GetComponent(typeof(Text))
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0._overlayUIMain = pg.UIMgr:GetInstance().OverlayMain
	slot0.bg = slot0:findTF("bg", slot0.mainPanel)

	setActive(slot0.trainToggle, false)
	setActive(slot0.restToggle, false)
	setActive(slot0.classToggle, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.bg, function ()
		if (slot0.contextData.type == slot1.SHIP_TRAIN_TYPE or slot0.contextData.type == slot1.SHIP_REST_TYPE) and slot0.dormVO.food == 0 and table.getCount(slot0.dormVO.shipIds) > 0 then
			slot0:emit(BackYardShipInfoMediator.OPEN_NOFOOD)
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	slot0:setEnTitle(slot0.contextData.type)

	if slot0.contextData.type == slot0.SHIP_CLASS_TYPE then
		setActive(slot0.classToggle, true)
		slot0:setShipCount(slot0.SHIP_CLASS_TYPE)

		if not slot0.initClassShips then
			slot0.classAddTFs, slot0.classExtendTFs, slot0.classShipTFs = slot0:createShipCards(slot0.SHIP_CLASS_TYPE)

			slot0:initShipCards(slot0.SHIP_CLASS_TYPE)
			slot0:updateAddExpSpeed()

			slot0.initClassShips = true
		end

		triggerToggle(slot0.classToggle, true)
	elseif slot0.contextData.type == slot0.SHIP_TRAIN_TYPE or slot0.contextData.type == slot0.SHIP_REST_TYPE then
		slot0.trainToggle.color = Color.New(0.5, 0.5, 0.5, 1)

		setActive(slot0.trainToggle, true)
		onToggle(slot0, slot0.trainToggle.gameObject, function (slot0)
			slot0.trainToggle.color = (slot0 and Color.New(1, 1, 1, 1)) or Color.New(0.5, 0.5, 0.5, 1)

			if slot0 then
				slot0.contextData.type = slot1.SHIP_TRAIN_TYPE

				slot0:setEnTitle(slot0.contextData.type)
				slot0:setShipCount(slot1.SHIP_TRAIN_TYPE)

				if not slot0.initTrainShips then
					slot0.speed = 0
					slot0.trainAddTFs, slot0.trainExtendTFs, slot0.trainShipTFs = slot0:createShipCards(slot1.SHIP_TRAIN_TYPE)

					slot0:initShipCards(slot1.SHIP_TRAIN_TYPE)
					slot0:updateAddExpSpeed()

					slot0.initTrainShips = true
				end
			end
		end, SFX_PANEL)

		slot0.restToggle.color = Color.New(0.5, 0.5, 0.5, 1)

		setActive(slot0.restToggle.gameObject, slot0.dormVO:isUnlockFloor(2))
		onToggle(slot0, slot0.restToggle.gameObject, function (slot0)
			slot0.restToggle.color = (slot0 and Color.New(1, 1, 1, 1)) or Color.New(0.5, 0.5, 0.5, 1)

			if slot0 then
				slot0.contextData.type = slot1.SHIP_REST_TYPE

				slot0:setEnTitle(slot0.contextData.type)
				slot0:setShipCount(slot1.SHIP_REST_TYPE)

				if not slot0.initRestShips then
					slot0.restAddTFs, slot0.restExtendTFs, slot0.restShipTFs = slot0:createShipCards(slot1.SHIP_REST_TYPE)

					slot0:initShipCards(slot1.SHIP_REST_TYPE)

					slot0.initRestShips = true
				end
			end
		end, SFX_PANEL)

		if slot0.contextData.type == slot0.SHIP_TRAIN_TYPE then
			triggerToggle(slot0.trainToggle, true)
		elseif slot0.contextData.type == slot0.SHIP_REST_TYPE then
			triggerToggle(slot0.restToggle, true)
		end
	end

	slot0.UIMgr:BlurPanel(slot0.mainPanel)
end

function slot0.setEnTitle(slot0, slot1)
	setActive(slot0.restTitle, slot1 == slot0.SHIP_REST_TYPE)
	setActive(slot0.trainingTitle, slot1 == slot0.SHIP_TRAIN_TYPE)
	setActive(slot0.classTitle, slot1 == slot0.SHIP_CLASS_TYPE)
end

function slot0.createShipCards(slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = {}
	slot6 = {}
	slot7 = {}
	slot8 = {}
	slot9 = nil

	if slot1 == slot0.SHIP_TRAIN_TYPE then
		slot3 = slot0.dormVO.exp_pos
		slot8 = slot0.trainShipVOs
		slot9 = slot0.trainContainer
		slot4 = slot0.dormVO:getConfig("training_ship_number")
	elseif slot1 == slot0.SHIP_REST_TYPE then
		slot3 = slot0.dormVO.rest_pos
		slot8 = slot0.restShipVOs
		slot9 = slot0.restContainer
		slot4 = slot0.dormVO:getConfig("fix_ship_number")
	elseif slot1 == slot0.SHIP_CLASS_TYPE then
		slot3 = AcademyCourse.MaxStudentSlot
		slot8 = slot0.classShipVOs
		slot9 = slot0.classContainer
		slot4 = AcademyCourse.MaxStudentSlot
	end

	slot0:setShipCount(slot1)

	for slot13, slot14 in pairs(slot8) do
		slot7[slot14.id] = cloneTplTo(slot0.shipTpl, slot9)
		slot2 = slot2 + 1
	end

	for slot13 = 1, slot3 - slot2, 1 do
		table.insert(slot5, slot14)

		slot2 = slot2 + 1

		onButton(slot0, cloneTplTo(slot0.addTpl, slot9), function ()
			slot0:goSelectShip(slot0)
		end, SFX_PANEL)
	end

	for slot14 = 1, slot4 - slot2, 1 do
		table.insert(slot6, slot15)
		onButton(slot0, cloneTplTo(slot0.extendTpl, slot9), function ()
			if slot0.dormVO:getExtendTrainPosShopId() then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("backyard_backyardShipInfoLayer_quest_openPos", pg.shop_template[slot0].resource_num),
					onYes = function ()
						if slot0.playerVO and slot0.playerVO:getTotalGem() < slot0.playerVO then
							GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
						else
							slot0:emit(BackYardShipInfoMediator.EXTEND, , 1)
						end
					end
				})
			end
		end, SFX_PANEL)
	end

	return slot5, slot6, slot7
end

function slot0.initShipCards(slot0, slot1)
	slot2, slot3 = nil

	if slot1 == slot0.SHIP_TRAIN_TYPE then
		slot2 = slot0.trainShipTFs
		slot3 = slot0.trainShipVOs
	elseif slot1 == slot0.SHIP_REST_TYPE then
		slot2 = slot0.restShipTFs
		slot3 = slot0.restShipVOs
	elseif slot1 == slot0.SHIP_CLASS_TYPE then
		slot2 = slot0.classShipTFs
		slot3 = slot0.classShipVOs
	end

	for slot7, slot8 in pairs(slot2) do
		slot0:updateShip(slot3[slot7], slot1)
	end

	slot0:dispatchUILoaded(true)
end

function slot0.goSelectShip(slot0, slot1, slot2)
	slot3 = 0

	if slot1 == slot0.SHIP_TRAIN_TYPE then
		slot3 = slot0.dormVO.exp_pos
	elseif slot1 == slot0.SHIP_REST_TYPE then
		slot3 = slot0.dormVO.rest_pos
	elseif slot1 == slot0.SHIP_CLASS_TYPE then
		if slot0.courseVO:inClass() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("course_learning"))

			return
		end

		slot3 = AcademyCourse.MaxStudentSlot
	end

	slot0:emit(BackYardShipInfoMediator.OPEN_CHUANWU, slot1, slot3, slot2)
end

function slot0.openLockPos(slot0)
	slot1, slot2, slot3, slot4, slot5 = nil

	function slot6()
		Destroy(slot0)

		slot1 = cloneTplTo(slot1.addTpl, slot2)

		slot1:SetSiblingIndex(slot1)
		table.insert(slot1, slot1)
		onButton(slot1, slot1, function ()
			slot0:goSelectShip(slot0)
		end, SFX_PANEL)
	end

	if slot0.trainAddTFs and slot0.dormVO.exp_pos > #slot0.trainAddTFs + table.getCount(slot0.trainShipVOs) then
		slot1 = slot0.SHIP_TRAIN_TYPE
		slot2 = slot0.trainExtendTFs
		slot3 = slot0.trainContainer
		slot4 = slot0.trainAddTFs
		slot5 = slot0.dormVO.exp_pos

		slot6()
	end

	if slot0.restAddTFs and slot0.dormVO.rest_pos > #slot0.restAddTFs + table.getCount(slot0.restShipVOs) then
		slot1 = slot0.SHIP_REST_TYPE
		slot2 = slot0.restExtendTFs
		slot3 = slot0.restContainer
		slot4 = slot0.restAddTFs
		slot5 = slot0.dormVO.rest_pos

		slot6()
	end

	slot0:setShipCount(slot1)
end

function slot0.setShipCount(slot0, slot1)
	if slot1 == slot0.SHIP_TRAIN_TYPE then
		slot0.shipCountxt.text = table.getCount(slot0.trainShipVOs) .. "/" .. slot0.dormVO.exp_pos
	elseif slot1 == slot0.SHIP_REST_TYPE then
		slot0.shipCountxt.text = table.getCount(slot0.restShipVOs) .. "/" .. slot0.dormVO.rest_pos
	elseif slot1 == slot0.SHIP_CLASS_TYPE then
		slot0.shipCountxt.text = table.getCount(slot0.classShipVOs) .. "/" .. AcademyCourse.MaxStudentSlot
	end
end

function slot0.calExpValue(slot0)
	if table.getCount(slot0.trainShipVOs) <= 0 then
		return 0
	end

	slot2 = pg.dorm_data_template[slot0.dormVO.id]
	slot3 = pg.benefit_buff_template
	slot5 = 1

	for slot9, slot10 in pairs(slot4) do
		if slot10.timestamp >= pg.TimeMgr:GetInstance():GetServerTime() then
			slot5 = tonumber(slot3[slot10.id].benefit_effect) / 100 + slot5
		end
	end

	return pg.gameset["dorm_exp_ratio_by_" .. slot1].key_value / 100 * (pg.gameset.dorm_exp_base.key_value + slot2.exp * slot0.dormVO:getComfortable() / (slot0.dormVO.getComfortable() + pg.gameset.dorm_exp_ratio_comfort_degree.key_value)) * slot5 * (1 + 0.05 * slot0.playerVO.level)
end

function slot0.updateAddExpSpeed(slot0)
	if slot0.contextData.type == slot0.SHIP_TRAIN_TYPE then
		slot0.speed = math.floor((slot0:calExpValue() * 3600) / pg.dorm_data_template[slot0.dormVO.id].time)

		for slot4, slot5 in pairs(slot0.trainShipVOs) do
			slot0:updateShip(slot5, slot0.SHIP_TRAIN_TYPE)
		end
	elseif slot0.contextData.type == slot0.SHIP_CLASS_TYPE then
		slot1 = 0

		if table.getCount(slot0.classShipVOs) > 0 then
			slot1 = math.floor((60 * slot0.setResClassVO:getConfig("proficency_cost_per_min") * slot0.setResClassVO:getConfig("proficency_to_exp_rant_" .. slot2)) / 100)
		end

		slot0.speed = slot1

		for slot6, slot7 in pairs(slot0.classShipVOs) do
			slot0:updateShip(slot7, slot0.SHIP_CLASS_TYPE)
		end
	end
end

function slot0.updateShip(slot0, slot1, slot2)
	slot3 = nil

	if slot2 == slot0.SHIP_TRAIN_TYPE then
		slot3 = slot0.trainShipTFs
	elseif slot2 == slot0.SHIP_REST_TYPE then
		slot3 = slot0.restShipTFs
	elseif slot2 == slot0.SHIP_CLASS_TYPE then
		slot3 = slot0.classShipTFs
	end

	slot4 = FormationCard.New(slot3[slot1.id])

	table.insert(slot0.cards, slot4)
	slot4:update(slot1)
	setActive(slot4.go.Find(slot5, "detail/frame/list"), slot2 == slot0.SHIP_TRAIN_TYPE)
	setActive(slot5:Find("detail/frame/list1"), slot2 == slot0.SHIP_REST_TYPE or slot2 == slot0.SHIP_CLASS_TYPE)

	if slot2 == slot0.SHIP_TRAIN_TYPE then
		slot4:updateProps({
			{
				i18n("word_lv"),
				slot1.level
			},
			{
				i18n("word_next_level"),
				math.max(slot1:getLevelExpConfig().exp - slot1.exp, 0)
			},
			{
				i18n("word_exp_chinese") .. i18n("word_get"),
				slot0.speed
			}
		})
	elseif slot2 == slot0.SHIP_REST_TYPE then
		slot4:updateProps1({
			{
				i18n("word_lv"),
				slot1.level
			},
			{
				i18n("word_nowenergy"),
				slot1.energy
			},
			{
				i18n("word_energy_recov_speed"),
				10 * (slot1:getRecoverEnergyPoint() + Ship.BACKYARD_2F_ENERGY_ADDITION) .. "/h"
			}
		})
	elseif slot2 == slot0.SHIP_CLASS_TYPE then
		slot4:updateProps1({
			{
				i18n("word_lv"),
				slot1.level
			},
			{
				i18n("word_next_level"),
				math.max(slot1:getLevelExpConfig().exp - slot1.exp, 0)
			},
			{
				i18n("word_exp_chinese") .. i18n("word_get"),
				(slot0.speed or "") .. "/h"
			}
		})
	end

	onButton(slot0, slot5, function ()
		slot0:goSelectShip(slot0, )
	end, SFX_PANEL)
end

function slot0.willExit(slot0)
	slot0.UIMgr:UnblurPanel(slot0.mainPanel, slot0._tf)

	for slot4, slot5 in ipairs(slot0.cards) do
		slot5:clear()
	end

	slot0.cards = nil
end

return slot0
