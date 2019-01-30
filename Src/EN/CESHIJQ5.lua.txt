return {
	id = "CESHIJQ5",
	mode = 2,
	once = true,
	scripts = {
		{
			actor = -1,
			side = 2,
			nameColor = "#a9f548",
			say = "SP2·判断跳转剧情测试",
			shake = {
				speed = 1,
				number = 3
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = -1,
			side = 2,
			nameColor = "#a9f548",
			say = "如果满足条件,自动跳转至隐藏剧情",
			shake = {
				speed = 1,
				number = 3
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = -1,
			side = 2,
			nameColor = "#a9f548",
			say = "…………",
			shake = {
				speed = 1,
				number = 3
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			},
			jumpto = function ()
				if not IsNil(GameObject.Find("UICamera/Canvas/UIMain/CollectionUI(Clone)")) then
					return nil
				end

				slot3 = nil

				for slot7, slot8 in pairs(slot2) do
					if slot8.attachmentId == 1160214 then
						slot3 = slot8
					end
				end

				if not slot3 then
					return nil
				elseif slot3.flag == 0 then
					return nil
				else
					return "CESHIJQ6"
				end
			end
		}
	}
}
