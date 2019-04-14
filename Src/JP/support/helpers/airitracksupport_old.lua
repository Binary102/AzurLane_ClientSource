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

function SendAiriJPTracking(slot0, slot1)
	if CSharpVersion < 10 then
		return
	end

	print("tracking type : " .. slot0)

	if slot0 == AIRIJP_TRACKING_USER_LEVELUP then
		AiriSdkMgr.inst:OnUserLvlUpEvent(slot1)
	elseif slot0 == AIRIJP_TRACKING_PURCHASE_CLICK then
		AiriSdkMgr.inst:OnUserEventByName(slot0)

		if slot1 == 1 then
			SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_MONTHLYCARD)
		elseif slot1 == 2 then
			SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_GIFTBAG)
		else
			SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK_DIAMOND)
		end
	else
		AiriSdkMgr.inst:OnUserEventByName(slot0)
	end
end

return
