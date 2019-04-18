PLATFORM_WINDOWSEDITOR = 7
PLATFORM_IPHONEPLAYER = 8
PLATFORM_ANDROID = 11
MAIN_THEME = "main"
BILI_SERVER_ID = "388"
SHAREJOY_SERVER_ID = "475"
UNION_SERVER_ID = "439"
SERVER_TIME_ZONE = 28800
TIME_ZONE_DATA = {
	SERVER_TIME_ZONE_SWITCH_TIME = 1552212000,
	SERVER_TIME_ZONE_JP = 32400,
	SERVER_TIME_ZONE_KR = 32400,
	SERVER_TIME_ZONE_CH = 28800,
	SERVER_TIME_ZONE_PDT = -28800,
	SERVER_TIME_ZONE_DST = -25200
}

function SwitchTimeZone(slot0)
	if PLATFORM_CODE == PLATFORM_CH then
		SERVER_TIME_ZONE = TIME_ZONE_DATA.SERVER_TIME_ZONE_CH
	elseif PLATFORM_CODE == PLATFORM_JP then
		SERVER_TIME_ZONE = TIME_ZONE_DATA.SERVER_TIME_ZONE_JP
	elseif PLATFORM_CODE == PLATFORM_KR then
		SERVER_TIME_ZONE = TIME_ZONE_DATA.SERVER_TIME_ZONE_KR
	elseif PLATFORM_CODE == PLATFORM_US then
		if TIME_ZONE_DATA.SERVER_TIME_ZONE_SWITCH_TIME <= slot0 then
			SERVER_TIME_ZONE = TIME_ZONE_DATA.SERVER_TIME_ZONE_DST
		else
			SERVER_TIME_ZONE = TIME_ZONE_DATA.SERVER_TIME_ZONE_PDT
		end
	end
end

function GetLocalTimeZone()
	if PLATFORM_CODE == PLATFORM_US then
		slot0 = os.time()
		slot2 = os.difftime(slot0, os.time(os.date("!*t", slot0)))

		if os.date("*t", slot0).isdst then
			return slot2 + 3600
		else
			return slot2
		end
	else
		return os.difftime(os.time(), os.time(os.date("!*t", os.time())))
	end
end

CONNECT_TIMEOUT = 20
SEND_TIMEOUT = 6
HEART_BEAT_TIMEOUT = 60
AUDIT_SERVER_ID = "2001"
LOGIN_BG_RES_ID = "login"
HOME_PAGE = "http://weibo.com/azurlane"
DOMAIN_LOGIN_1 = "line1.test.cp.login.blhx.biligame.net"
DOMAIN_LOGIN_2 = "line2.test.cp.login.blhx.biligame.net"
DOMAIN_LOGIN_3 = "line3.test.cp.login.blhx.biligame.net"
DOMAIN_LOGIN_4 = "line4.test.cp.login.blhx.biligame.net"
DOMAIN_GS_1 = "line1.test.cp.blhx.biligame.net"
DOMAIN_STATIC_1 = "line1.patch.blhx.biligame.net"
DEFAULT_PORT = 80
LOG = true
LOG_ATLAS = false
LOG_TICK = false
LOG_FMOD = false
LOG_STORY = false
LOG_GUIDE2 = false
LOG_CONNECTION = false
BATTLE_AUTO_ENABLED = 1000001
GAME_RESTOREVIEW_ALREADY = 1000002
PROLOGUE_DUNGEON = 100000
EPILOGUE_STORY = "S008"
CURTAIN_STORY = "S999"
BG_RANDOM_RANGE = 12
GUIDE_PROLOGUE_INDEX = 1
GUIDE_FINALE = 101
SOUND_BACK = "event:/ui/cancel"
SFX_MAIN = "event:/ui/main"
SFX_PANEL = "event:/ui/panel"
SFX_CONFIRM = "event:/ui/confirm"
SFX_CANCEL = "event:/ui/cancel"
SFX_BOAT_CLICK = "event:/ui/boat_click"
SFX_BOAT_DRAG = "event:/ui/boat_drag"
SFX_FURNITRUE_SAVE = "event:/ui/furnitrue_save"
SFX_BOAT_LEVEL_UP = "event:/ui/level_up"
SFX_BREAK_OUT_FULL = "event:/ui/break_out_full"
SFX_AUTO_BATTLE = "event:/ui/auto_battle"
SFX_STEP_MONOPOLY = "event:/ui/step"
ITEM_ID_SILVER_HOOK = 15001
ITEM_ID_GOLD_HOOK = 15002
ITEM_ID_EQUIP_QUICK_FINISH = 15003
ITEM_ID_ENERGY_QUICK_FINISH = 15004
ITEM_BACKYARD_AREA_EXTEND = 15005
ITEM_ID_FOR_PROPOSE = 15006
BACKYARD_AREA_EXTEND_ITEM_SHOPID = 50001
QUICK_ENERGY_ITEM_SHOPID = 50003
ITEN_EQUIPMENT_FRAGMENT_TYPE = 9
ITEM_ID_FUDAIS = {
	40904
}
QRJ_ITEM_ID_RANGE = {
	41001,
	42000
}
ITEM_ID_REACT_CHAPTER_TICKET = 59823
SHIP_HOOK_TYPE_SILVE = 0
SHIP_HOOK_TYPE_GOLD = 1
DAILY_MAX_COUNT = 3
DROP_TYPE_RESOURCE = 1
DROP_TYPE_ITEM = 2
DROP_TYPE_EQUIP = 3
DROP_TYPE_SHIP = 4
DROP_TYPE_FURNITURE = 5
DROP_TYPE_STRATEGY = 6
DROP_TYPE_SKIN = 7
DROP_TYPE_VITEM = 8
DROP_TYPE_EQUIPMENT_SKIN = 9
DROP_TYPE_NPC_SHIP = 10
BACKYARD_BUFF = "dorm_exp"
BACKYARD_SHIPINFO_ADDEXP = 1
BACKYARD_SHIPINFO_ADDENERGY = 2
BACKYARD_RECOVERENERGY = 2
BACKYARD_ADDEXP = 5
FLOOR_MAT_TYPE = 5
WALL_PAPER_TYPE = 1
FLOOR_PAPER_TYPE = 4
ADDITION_TYPE_MONEY = 1
ADDITION_TYPE_INTIMACY = 2
ADDITION_TYPE_EXP = 3
BACKYARD_WALL_DIR_LEFT = 1
BACKYARD_WALL_DIR_RIGHT = 2
BACKYARD_RED = Color.New(1, 0.294, 0.08)
BACKYARD_GREEN = Color.New(0.48, 1, 0.03)
BACKYARD_BLUE = Color.New(0.3, 0.63, 0.95)
SHOP_STREET_UPGRADE_SHOPID = 9
BUY_TYPE_RES = 1
BUY_TYPE_ITEM = 2
BUY_TYPE_EQUIPMENT = 3
EXTEND_DORM_EXP_POS = 4
EXTEND_DORM_FIX_POS = 3
SHIP_MOD_PREVIEW = 1
SHIP_MOD_UPGRADE = 2
CHAT_POP_STR_LEN = 69
CHAT_POP_STR_LEN_SHORT = 39
TASK_SUB_TYPE_GIVE_ITEM = 1000
TASK_SUB_TYPE_PT = 1001
TASK_SUB_TYPE_PLAYER_RES = 1002
TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM = 1003
TASK_SUB_TYPE_BOSS_PT = 1004
TASK_SUB_STROY = 1005
TASK_SUB_TYPE_PREV_TASK = 1041
TASK_SUB_TYPE_TECHNOLOGY_POINT = 1050
TASK_SUB_TYPE_FROM_TASKS = 90
TASK_SUB_TYPE_RES_GOLD = 122
TASK_SUB_TYPE_RES_OIL = 121
SYSTEM_SCENARIO = 1
SYSTEM_ROUTINE = 2
SYSTEM_DUEL = 3
SYSTEM_SHAM = 4
SYSTEM_GUILD = 5
SYSTEM_CHALLENGE = 6
SYSTEM_PERFORM = 7
SYSTEM_ACT_BOSS = 8
SYSTEM_HP_SHARE_ACT_BOSS = 9
SYSTEM_TEST = 10
SYSTEM_PROLOGUE = 0
SYSTEM_DEBUG = 99
SYSTEM_DODGEM = 98
SYSTEM_SIMULATION = 97
CHALLENGE_ACTIVITY_ID = 99999
AUTO_ENABLE_CHAPTER = 103
COLOR_RED = "#D6341DFF"
COLOR_YELLOW = "#FFDE00FF"
COLOR_GREEN = "#A9F548FF"
COLOR_WHITE = "#FFFFFFFF"
SLIP_TYPE_HRZ = 1
SLIP_TYPE_VERT = 2
REFRESH_BILLBOARD_TIME = 0
PLATFORM_BILIBILI = "bilibili"
PLATFORM_TXWY = "txwykr"
PLATFORM_AIRIJP = "yostarjp"
PLATFORM_AIRIUS = "yostarus"
MAX_FRIEND_COUNT = 50
MAX_BLACKLIST_COUNT = 50
MAX_BUILD_WORK_COUNT = 10
MAX_REPLACE_RIVAL_COUNT = 5
AABBUDUD = "dettimrepsignihtyrevednaeurtsignihton"
LOAD_TYPE_SCENE = "_load_type_scene"
LOAD_TYPE_LAYER = "_load_type_layer"
AUTO_BATTLE_LABEL = "autoBattle"
RARE_SHIP_VIBRATE = "rare_ship_vibrate"
DISPLAY_SHIP_GET_EFFECT = "display_ship_get_effect"
DISCONNECT_TIME_OUT = "time_out"
LOCK_PROPOSE = false
LOCK_CLASSROOM = false
LOCK_SHAM_CHAPTER = false
LOCK_PT_VALUE = false
LOCK_EQUIP_SKIN = false
LOCK_MITIGATION = false
LOCK_SEC_FLOOR = false
LOCK_FULL_EXP = false
LOCK_CLICK_MINGSHI = false
LOCK_DOWNVOTE = true
LOCK_TECHNOLOGY = false
LOCK_SECONDARY = false
LOCK_HIDE_CHAT = false
LOCK_SUBMARINE = false
LOCK_SOS = false
LOCK_EQUIP_DEVELOPMENT = false
LOCK_ILLUSTRATOR = false
LOCK_SKIN_SORT = false
LOCK_COMMANDER = false
LOCK_CLEAR_ACCOUNT = false
LOCK_TWITTER_LOGIN = false
DEFAULT_CVVOLUME = 0.8
DEFAULT_BGMVOLUME = 0.8
DEFAULT_SEVOLUME = 0.8
HIDE_CHAT_FLAG = "HideChat"
ERROR_MESSAGE = {
	"무효한 조작입니다.",
	"정보가 부족합니다.",
	"기간이 지났습니다.",
	"이벤트 기간이 아닙니다.",
	"이미 최대 레벨에 도달했습니다.",
	"이미 최대 수량 제한에 도달했습니다.",
	"이미 완료되었습니다.",
	"파라미터 부족",
	"데이터 에러가 발생했습니다.",
	"슬롯이 가득 찼습니다.",
	"데이터베이스 에러가 발생했습니다.",
	"시스템 에러가 발생했습니다.",
	"이용이 제한되어 있습니다.",
	nil,
	"서버가 만원입니다.",
	nil,
	nil,
	nil,
	nil,
	"임무 완료 데이터에 에러가 발생했습니다.",
	"유저 데이터가 존재하지 않습니다.",
	"함선 데이터가 존재하지 않습니다.",
	"아이템 데이터가 존재하지 않습니다.",
	"장비 데이터가 존재하지 않습니다.",
	"임무 데이터가 존재하지 않습니다.",
	"전투 정보가 존재하지 않습니다.",
	"의뢰 데이터가 존재하지 않습니다.",
	"친구가 없습니다.",
	"우편이 없습니다.",
	"임무에 에러가 발생했습니다.",
	"필요한 자원이 부족합니다.",
	"물자가 부족합니다.",
	"연료가 부족합니다.",
	"파우더가 부족합니다.",
	"크리스탈이 부족합니다.",
	"가구 코인이 부족합니다.",
	"아이템이 부족합니다.",
	"식량이 부족합니다.",
	"스테미너가 부족합니다.",
	"조건에 맞지 않습니다.",
	"레벨이 조건에 맞지 않습니다.",
	"함종이 조건에 맞지 않습니다.",
	[2015.0] = "이미 사용 중인 이름입니다.",
	[2011.0] = "이름이 너무 깁니다.",
	[1010.0] = "계정에 에러가 발생했습니다.",
	[2014.0] = "비정상적인 문자가 포함되어 있습니다.",
	[2013.0] = "금칙어가 포함되어 있습니다.",
	[2010.0] = "이름 체크에 에러가 발생했습니다.",
	[1011.0] = "이미 존재하는 계정입니다.",
	[1040.0] = "해당 서버는 현재 이용할 수 없습니다.",
	[1030.0] = "md5 인증 에러 (1030)",
	[2012.0] = "이름이 너무 짧습니다.",
	[1031.0] = "md5 인증 에러 (1031)",
	[4020.0] = "비서함으로 설정되어 있습니다.",
	[4030.0] = "출격 함선으로 편성되어 있습니다.",
	[4010.0] = "함선 데이터에 에러가 발생했습니다.",
	[9999.0] = "알 수 없는 에러가 발생했습니다.",
	[3010.0] = "전투 불능이 된 함선이 존재합니다.",
	[3020.0] = "개방을 위한 스테이지가 아직 클리어되지 않았습니다.",
	[4050.0] = "동일한 함선입니다.",
	[4040.0] = "출격 함선으로 편성되어 있지 않습니다.",
	[1020.0] = "패스워드가 정확하지 않습니다.",
	[1012.0] = "숫자뿐인 계정입니다."
}
SPECIAL_DATE = {
	{
		"20190401",
		"login",
		"loginbg_0401",
		"login_0401"
	}
}
SPECIAL_PROPOSE = {
	"20190401000000",
	{
		{
			202030,
			"91"
		},
		{
			202031,
			"91"
		},
		{
			202039,
			"91"
		},
		{
			102130,
			"92"
		},
		{
			102131,
			"92"
		},
		{
			102132,
			"92"
		},
		{
			206030,
			"93"
		},
		{
			206031,
			"93"
		},
		{
			206032,
			"93"
		},
		{
			206033,
			"93"
		}
	}
}
CRI_BG_FLAG = false
OPEN_ESCORT = false
OPEN_REMASTER = true
AUTO_LINKLINK = false
OPEN_AIR_DOMINANCE = true
OPEN_TEC_TREE_SYSTEM = true

return
