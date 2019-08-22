pg = pg or {}
pg.TrackerMgr = singletonClass("TrackerMgr")
TRACKING_ROLE_CREATE = "role_create"
TRACKING_ROLE_LOGIN = "role_login"
TRACKING_TUTORIAL_COMPLETE_1 = "tutorial_complete_1"
TRACKING_TUTORIAL_COMPLETE_2 = "tutorial_complete_2"
TRACKING_TUTORIAL_COMPLETE_3 = "tutorial_complete_3"
TRACKING_TUTORIAL_COMPLETE_4 = "tutorial_complete_4"
TRACKING_USER_LEVELUP = "user_levelup"
TRACKING_ROLE_LOGOUT = "role_logout"
TRACKING_PURCHASE_FIRST = "purchase_first"
TRACKING_PURCHASE_CLICK = "purchase_click"
TRACKING_PURCHASE_CLICK_MONTHLYCARD = "purchase_click_monthlycard"
TRACKING_PURCHASE_CLICK_GIFTBAG = "purchase_click_giftbag"
TRACKING_PURCHASE_CLICK_DIAMOND = "purchase_click_diamond"
TRACKING_2D_RETENTION = "2d_retention"
TRACKING_7D_RETENTION = "7d_retention"
TRACKING_BUILD_SHIP = "build_ship"
TRACKING_SHIP_INTENSIFY = "ship_intensify"
TRACKING_SHIP_HIGHEST_LEVEL = "ship_highest_level"
TRACKING_CUBE_ADD = "cube_add"
TRACKING_CUBE_CONSUME = "cube_consume"
TRACKING_USER_LEVEL_THIRTY = "user_level_thirty"
TRACKING_USER_LEVEL_FORTY = "user_level_forty"
TRACKING_PROPOSE_SHIP = "propose_ship"
TRACKING_REMOULD_SHIP = "remould_ship"
TRACKING_HARD_CHAPTER = "hard_chapter"
TRACKING_KILL_BOSS = "kill_boss"
TRACKING_HIGHEST_CHAPTER = "highest_chapter"

function pg.TrackerMgr.Ctor(slot0)
	slot1 = nil

	if PLATFORM_CODE == PLATFORM_CH then
		slot1 = require("Mgr.Tracker.BiliTracker")
	elseif PLATFORM_CODE == PLATFORM_JP then
		slot1 = require("Mgr.Tracker.AiriJPTracker")
	elseif PLATFORM_CODE == PLATFORM_US then
		slot1 = require("Mgr.Tracker.AiriUSTracker")
	elseif PLATFORM_CODE == PLATFORM_KR then
		slot1 = require("Mgr.Tracker.KwxyKrTracker")
	end

	if slot1 then
		slot0.instance = slot1.New()
	end
end

function pg.TrackerMgr.Call(slot0, slot1, ...)
	if slot0.instance and slot0.instance[slot1] then
		slot0.instance[slot1](slot0.instance, unpack({
			...
		}))
	end
end

function pg.TrackerMgr.Tracking(slot0, slot1, slot2)
	slot8 = getProxy(ServerProxy).getLastServer(slot6, slot5).id

	if slot1 == TRACKING_2D_RETENTION or slot1 == TRACKING_7D_RETENTION then
		if PlayerPrefs.GetInt(slot9, 0) <= 0 then
			print("tracking type : " .. slot1 .. "   user_id:" .. slot5)
			PlayerPrefs.SetInt(slot9, 1)
			PlayerPrefs.Save()
			slot0:Call("Tracking", slot1, slot5, slot2)
		end
	else
		print("tracking type : " .. slot1 .. ",   user_id:" .. slot5 .. ",   data:" .. (slot2 or "nil"))
		slot0:Call("Tracking", slot1, slot5, slot2, slot8)
	end

	if slot1 == TRACKING_PURCHASE_CLICK then
		if slot2 == 1 then
			print("tracking type : " .. TRACKING_PURCHASE_CLICK_MONTHLYCARD .. "   user_id:" .. slot5)
			slot0:Call("Tracking", TRACKING_PURCHASE_CLICK_MONTHLYCARD, slot5)
		elseif slot2 == 2 then
			print("tracking type : " .. TRACKING_PURCHASE_CLICK_GIFTBAG .. "   user_id:" .. slot5)
			slot0:Call("Tracking", TRACKING_PURCHASE_CLICK_GIFTBAG, slot5)
		else
			print("tracking type : " .. TRACKING_PURCHASE_CLICK_DIAMOND .. "   user_id:" .. slot5)
			slot0:Call("Tracking", TRACKING_PURCHASE_CLICK_DIAMOND, slot5)
		end
	end
end

return