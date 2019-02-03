AIRIJP_TRACKING_ROLE_CREATE = "role_create"
AIRIJP_TRACKING_ROLE_LOGIN = "role_login"
AIRIJP_TRACKING_TUTORIAL_COMPLETE_1 = "tutorial_complete_1"
AIRIJP_TRACKING_TUTORIAL_COMPLETE_2 = "tutorial_complete_2"
AIRIJP_TRACKING_TUTORIAL_COMPLETE_3 = "tutorial_complete_3"
AIRIJP_TRACKING_TUTORIAL_COMPLETE_4 = "tutorial_complete_4"
AIRIJP_TRACKING_USER_LEVELUP = "user_levelup"
AIRIJP_TRACKING_ROLE_LOGOUT = "role_logout"
AIRIJP_TRACKING_PURCHASE_FIRST = "purchase_first"
AIRIJP_TRACKING_PURCHASE_CLICK = "purchase_click"
AIRIJP_TRACKING_PURCHASE_CLICK_MONTHLYCARD = "purchase_click_monthlycard"
AIRIJP_TRACKING_PURCHASE_CLICK_GIFTBAG = "purchase_click_giftbag"
AIRIJP_TRACKING_PURCHASE_CLICK_DIAMOND = "purchase_click_diamond"
AIRIJP_TRACKING_2D_RETENTION = "2d_retention"
AIRIJP_TRACKING_7D_RETENTION = "7d_retention"

function SendAiriJPTracking(slot0, slot1, slot2)
	if not isAiriUS() then
		if slot0 == AIRIJP_TRACKING_USER_LEVELUP then
			print("tracking type : " .. slot0 .. "   user_id:" .. slot1 .. "   lvl:" .. slot2)
		elseif slot0 == AIRIJP_TRACKING_PURCHASE_CLICK then
			print("tracking type : " .. slot0 .. "   user_id:" .. slot1)

			if slot2 == 1 then
				SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_MONTHLYCARD, slot1)
			elseif slot2 == 2 then
				SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_GIFTBAG, slot1)
			else
				SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_DIAMOND, slot1)
			end
		elseif slot0 == AIRIJP_TRACKING_2D_RETENTION or slot0 == AIRIJP_TRACKING_7D_RETENTION then
			if PlayerPrefs.GetInt(slot3, 0) <= 0 then
				PlayerPrefs.SetInt(slot3, 1)
				PlayerPrefs.Save()
				print("tracking type : " .. slot0 .. "   user_id:" .. slot1)
			end
		else
			print("tracking type : " .. slot0 .. "   user_id:" .. slot1)
		end

		return
	end

	if slot0 == AIRIJP_TRACKING_USER_LEVELUP then
		print("tracking type : " .. slot0 .. "   user_id:" .. slot1 .. "   lvl:" .. slot2)

		slot3 = AiriUserEvent.New(slot0)

		slot3:AddParam("lvl", slot2)
		slot3:AddParam("user_id", slot1)
		AiriSdkMgr.inst:UserEventUpload(slot3)
	elseif slot0 == AIRIJP_TRACKING_PURCHASE_CLICK then
		print("tracking type : " .. slot0 .. "   user_id:" .. slot1)

		slot3 = AiriUserEvent.New(slot0)

		slot3:AddParam("user_id", slot1)
		AiriSdkMgr.inst:UserEventUpload(slot3)

		if slot2 == 1 then
			SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_MONTHLYCARD, slot1)
		elseif slot2 == 2 then
			SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_GIFTBAG, slot1)
		else
			SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_DIAMOND, slot1)
		end
	elseif slot0 == AIRIJP_TRACKING_PURCHASE_FIRST then
		print("tracking type : " .. slot0 .. "   user_id:" .. slot1)

		slot3 = AiriUserEvent.New(AIRIJP_TRACKING_PURCHASE_FIRST)

		slot3:AddParam("user_id", slot1)
		slot3:AddParam("order_id", slot2)
		print("order id : " .. slot2)
		AiriSdkMgr.inst:UserEventUpload(slot3)
	elseif slot0 == AIRIJP_TRACKING_2D_RETENTION or slot0 == AIRIJP_TRACKING_7D_RETENTION then
		if PlayerPrefs.GetInt(slot3, 0) <= 0 then
			print("tracking type : " .. slot0 .. "   user_id:" .. slot1)
			PlayerPrefs.SetInt(slot3, 1)
			PlayerPrefs.Save()

			slot5 = AiriUserEvent.New(slot0)

			slot5:AddParam("user_id", slot1)
			AiriSdkMgr.inst:UserEventUpload(slot5)
		end
	else
		print("tracking type : " .. slot0 .. "   user_id:" .. slot1)

		slot3 = AiriUserEvent.New(slot0)

		slot3:AddParam("user_id", slot1)
		AiriSdkMgr.inst:UserEventUpload(slot3)
	end
end

return
