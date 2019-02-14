pg = pg or {}
pg.UIMgr = singletonClass("UIMgr")
pg.UIMgr._loadPanel = nil

function pg.UIMgr.Init(slot0, slot1)
	print("initializing ui manager...")

	slot2 = GameObject.Find("UICamera")

	if PLATFORM == PLATFORM_IPHONEPLAYER or PLATFORM_CODE ~= PLATFORM_CH then
		slot0._cameraBlur = slot2:GetComponent("BlurOptimized")
	else
		slot0._cameraBlur = slot2:GetComponent("NewBlurOptimized")
	end

	slot0._staticBlur = slot2:GetComponent("UIStaticBlur")
	slot0._cameraBlurPartial = slot2:GetComponent("UIPartialBlur")
	slot0.UIMain = GameObject.Find("UICamera/Canvas/UIMain")
	slot0.OverlayMain = GameObject.Find("OverlayCamera/Overlay/UIMain")
	slot0.OverlayEffect = GameObject.Find("OverlayCamera/Overlay/UIEffect")
	slot0._debugPanel = DebugPanel.New()

	slot2:SetActive(false)
	seriesAsync({
		function (slot0)
			ResourceMgr.Inst:loadAssetBundleAsync("ui/commonui_atlas", function (slot0)
				slot0._common_ui_bundle = slot0

				slot0()
			end)
		end,
		function (slot0)
			ResourceMgr.Inst:loadAssetBundleAsync("skinicon", function (slot0)
				slot0._skinicon_bundle = slot0

				slot0()
			end)
		end,
		function (slot0)
			ResourceMgr.Inst:loadAssetBundleAsync("attricon", function (slot0)
				slot0._attricon_bundle = slot0

				slot0()
			end)
		end,
		function (slot0)
			slot0:SetActive(true)

			slot0.SetActive._loadPanel = LoadingPanel.New(slot0)
		end
	}, slot1)
end

function pg.UIMgr.Loading(slot0, slot1)
	slot0._loadPanel:appendInfo(slot1)
end

function pg.UIMgr.LoadingOn(slot0, slot1)
	slot0._loadPanel:on(slot1)
end

function pg.UIMgr.displayLoadingBG(slot0, slot1)
	slot0._loadPanel:displayBG(slot1)
end

function pg.UIMgr.LoadingOff(slot0)
	slot0._loadPanel:off()
end

function pg.UIMgr.LoadingRetainCount(slot0)
	return slot0._loadPanel:getRetainCount()
end

function pg.UIMgr.AddDebugButton(slot0, slot1, slot2)
	slot0._debugPanel:addCustomBtn(slot1, slot2)
end

pg.UIMgr._maxbianjie = 50
pg.UIMgr._maxbianjieInv = 0.02
pg.UIMgr._maxbianjieSqr = 2500
pg.UIMgr._followRange = 0
pg.UIMgr._stick = nil
pg.UIMgr._areaImg = nil
pg.UIMgr._stickImg = nil
pg.UIMgr._stickCom = nil
pg.UIMgr._normalColor = Color(255, 255, 255, 1)
pg.UIMgr._darkColor = Color(255, 255, 255, 0.5)
pg.UIMgr._firstPos = Vector3.zero

function pg.UIMgr.AttachStickOb(slot0, slot1)
	slot0.hrz = 0
	slot0.vtc = 0
	slot0.fingerId = -1
	slot2 = slot1:Find("Area")
	slot0._stick = slot2:Find("Stick")
	slot0._areaImg = slot2:GetComponent(typeof(Image))
	slot0._stickImg = slot0._stick:GetComponent(typeof(Image))
	slot0._stickCom = slot1:GetComponent(typeof(StickController))
	slot0._stickCom.StickBorderRate = 1

	slot0._stickCom:SetStickFunc(function (slot0, slot1)
		slot0:UpdateStick(slot0, slot1)
	end)

	slot0._firstPos = slot2.localPosition
	slot0.vtc = 0

	slot0:SetActive(true)
end

function pg.UIMgr.SetActive(slot0, slot1)
	slot0._stickActive = slot1
end

function pg.UIMgr.Marching(slot0)
	slot1 = ys.Battle.BattleConfig

	LeanTween.value(go(slot0._stick), 0, 0.625, 1.8):setOnUpdate(System.Action_float(function (slot0)
		slot0.hrz = slot1.START_SPEED_CONST_B * (slot0 - slot1.START_SPEED_CONST_A) * (slot0 - slot1.START_SPEED_CONST_A)
	end)):setOnComplete(System.Action(function ()
		slot0.hrz = 0
	end))
end

function pg.UIMgr.UpdateStick(slot0, slot1, slot2)
	if not slot0._stickActive then
		return
	end

	if slot2 == -2 then
		slot0:SetOutput(slot1.x, slot1.y, -2)

		return
	else
		if slot2 == -1 then
			slot0:SetOutput(0, 0, slot2)

			return
		end
	end

	slot1.z = 0

	if slot0._maxbianjieSqr < slot1.SqrMagnitude(slot3) then
		if slot1 - slot3 / math.sqrt(slot4) * slot0._maxbianjie ~= slot0._firstPos then
			slot6 = slot0._firstPos
		end

		slot0._stick.localPosition = slot5

		slot0:SetOutput(slot3.x, slot3.y, slot2)
	else
		slot0._stick.localPosition = slot1

		slot0:SetOutput(slot3.x * slot0._maxbianjieInv, slot3.y * slot0._maxbianjieInv, slot2)
	end

	return
end

function pg.UIMgr.SetOutput(slot0, slot1, slot2, slot3)
	slot0.hrz = slot1
	slot0.vtc = slot2

	if slot3 >= 0 then
		if slot0.fingerId < 0 then
			slot0._areaImg.color = slot0._normalColor
			slot0._stickImg.color = slot0._normalColor
		end
	else
		if slot0.fingerId >= 0 then
			slot0._areaImg.color = slot0._darkColor
			slot0._stickImg.color = slot0._darkColor
		end

		slot0._stick.localPosition = Vector3.zero
	end

	slot0.fingerId = slot3

	return
end

function pg.UIMgr.ClearStick(slot0)
	slot0._stick.localPosition = Vector3.zero

	slot0._stickCom:ClearStickFunc()

	slot0._stick = nil
	slot0._areaImg = nil
	slot0._stickImg = nil
	slot0._stickCom = nil

	return
end

slot2 = 0
slot3 = {}
slot4 = nil
slot5 = {}
slot6 = false

function pg.UIMgr.OverlayPanel(slot0, slot1)
	setParent(slot1, slot0.OverlayMain, false)

	return
end

function pg.UIMgr.UnOverlayPanel(slot0, slot1, slot2)
	setParent(slot1, slot2 or slot0.UIMain, false)

	return
end

function pg.UIMgr.BlurPanel(slot0, slot1, slot2)
	if slot0[slot1] then
		return
	end

	slot0[slot1] = true
	slot1 = slot1 + 1

	if CSharpVersion < 17 then
		slot0._cameraBlur.staticBlur = slot2 or false
		slot0._cameraBlur.enabled = true
	else
		slot0._staticBlur.enabled = false

		if not slot0._cameraBlur.enabled then
			slot0._cameraBlur.enabled = true
			slot0._cameraBlur.downsample = 1
			slot0._cameraBlur.blurSize = 2
			slot0._cameraBlur.blurIterations = 1

			if not UnityEngine.Application.isEditor and slot0.UIMain.transform:Find("ActivityUI(Clone)") and PLATFORM ~= PLATFORM_IPHONEPLAYER and PLATFORM_CODE == PLATFORM_CH then
				slot4 = tolua.getfield(typeof(UnityStandardAssets.ImageEffects.NewBlurOptimized), "rt", System.Reflection.BindingFlags.NonPublic + System.Reflection.BindingFlags.Instance)
				slot5 = slot4:Get(slot0._cameraBlur)
				slot7 = tolua.getmethod(typeof(UnityEngine.RenderTexture), "GetTemporary", typeof("System.Int32"), typeof("System.Int32"), typeof("System.Int32")).Call(slot6, slot5.width, slot5.height, 24)
				GameObject.Find("UICamera"):GetComponent("Camera").targetTexture = slot7
				UnityEngine.Camera.main.targetTexture = slot7

				slot4:Set(slot0._cameraBlur, slot7)
				UnityEngine.RenderTexture.ReleaseTemporary(slot5)
			end
		end
	end

	setParent(slot1, slot0.OverlayMain, false)
	slot0:UpdatePBEnable()

	return
end

function pg.UIMgr.UnblurPanel(slot0, slot1, slot2)
	if not slot0[slot1] then
		return
	end

	slot0[slot1] = nil

	if slot1 - 1 == 0 then
		slot0._cameraBlur.enabled = false
	end

	setParent(slot1, slot2 or slot0.UIMain, false)
	slot0:UpdatePBEnable()

	return
end

function pg.UIMgr.PartialBlur(slot0, slot1, slot2)
	slot0 = slot1

	if slot1 ~= slot2 then
		slot0:UpdatePBEnable()

		if not slot2 then
			slot0 = nil
		end
	end

	return
end

function pg.UIMgr.PreparePartialMask(slot0, slot1)
	table.insert(slot0, slot1)

	return
end

function pg.UIMgr.ClearPartialMask(slot0)
	slot0 = {}

	return
end

function pg.UIMgr.UpdatePBEnable(slot0)
	if slot0 and slot1 == 0 then
		slot0._cameraBlurPartial.enabled = true
	end

	if not IsNil(IsNil) then
		slot2:GetComponent(typeof(Image)).material = (slot1 and Material.New(Shader.Find("UI/PartialBlur"))) or nil

		for slot6, slot7 in ipairs(ipairs) do
			slot7:GetComponent(typeof(Image)).material = (slot1 and Material.New(Shader.Find("UI/PartialBlur"))) or nil
		end
	end

	if not slot1 then
		slot0._cameraBlurPartial.enabled = false
	end

	return
end

return
