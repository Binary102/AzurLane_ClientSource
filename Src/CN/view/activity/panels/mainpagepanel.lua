slot0 = class("MainPagePanel", import(".ActivityPanel"))

function slot0.getDefaultBg(slot0)
	return "Clutter/banai_main"
end

function slot0.onInit(slot0)
	slot0.gridTFs = slot0:findTF("AD/grids")
	slot0.list = {
		{
			ActivityMediator.EVENT_GO_SCENE,
			{
				SCENE.GETBOAT,
				{
					projectName = "new"
				}
			}
		},
		{
			ActivityMediator.BATTLE_OPERA,
			{}
		},
		{
			ActivityConst.BANAI_TASK_LIST_ID
		},
		{
			ActivityConst.BANAI_TASK_DAILY_ID
		},
		{
			ActivityMediator.MEMORYBOOK,
			{}
		},
		{
			ActivityMediator.BLACKWHITEGRID,
			{}
		}
	}

	for slot4, slot5 in ipairs(slot0.list) do
		onButton(slot0, slot0.gridTFs:GetChild(slot4 - 1), function ()
			if type(slot0[1]) == "number" then
				slot1.view:selectActivity(slot0[1])
			elseif type(slot0[1]) == "string" then
				slot1:emit(slot0[1], slot0[2][1], slot0[2][2])
			end
		end, SFX_PANEL)
	end
end

return slot0
