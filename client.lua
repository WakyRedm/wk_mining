Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        for k, v in pairs(Config.tumblespots) do
            local y = v
            local distance = GetDistanceBetweenCoords(coords, y.Pos.x, y.Pos.y, y.Pos.z, true)
            if distance < 2.0 then
                DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                if IsControlJustReleased(0, 0xC7B5340A) then
                    mining_anim()
                    Wait(10500)
                    TriggerServerEvent('wk_mining:tumbleloot')	
                    y.picked = true	
                    DeleteObject(tool)
                    end_anim()
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        for k, v in pairs(Config.welspots) do
            local y = v
            local distance = GetDistanceBetweenCoords(coords, y.Pos.x, y.Pos.y, y.Pos.z, true)
            if distance < 2.0 then
                DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                if distance < 2.0 then
                    DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                    if IsControlJustReleased(0, 0xC7B5340A) then
                        mining_anim()
                        Wait(10500)
                        TriggerServerEvent('wk_mining:welloot')	
                        y.picked = true	
                        DeleteObject(tool)
                        end_anim()
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        for k, v in pairs(Config.kamaspots) do
            local y = v
            local distance = GetDistanceBetweenCoords(coords, y.Pos.x, y.Pos.y, y.Pos.z, true)
            if distance < 2.0 then
                DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                if distance < 2.0 then
                    DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                    if IsControlJustReleased(0, 0xC7B5340A) then
                        mining_anim()
                        Wait(10500)
                        TriggerServerEvent('wk_mining:kamaloot')	
                        y.picked = true	
                        DeleteObject(tool)
                        end_anim()
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        for k, v in pairs(Config.annespots) do
            local y = v
            local distance = GetDistanceBetweenCoords(coords, y.Pos.x, y.Pos.y, y.Pos.z, true)
            if distance < 5.0 then
                DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                if distance < 2.0 then
                    DrawText3D(y.Pos.x, y.Pos.y, y.Pos.z, "Press ~o~Enter ~q~to start mining.")
                    if IsControlJustReleased(0, 0xC7B5340A) then
                        mining_anim()
                        Wait(10500)
                        TriggerServerEvent('wk_mining:anneloot')	
                        y.picked = true	
                        DeleteObject(tool)
                        end_anim()
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)


------------------------------------BLIPS Function-------------------------------

local function addBlipForCoords(blipname,bliphash,coords)
	local blip = Citizen.InvokeNative(0x554D9D53F696D002,1664425300, coords[1], coords[2], coords[3])
	SetBlipSprite(blip,bliphash,true)
	SetBlipScale(blip,0.2)
	Citizen.InvokeNative(0x9CB1A1623062F402, blip, blipname)
end
----------------------------------------blips----------------------------------------
addBlipForCoords("Tumbleweed Mine",GetHashKey("blip_location_lower"),{-5963.02, -3193.17, -21.57})
addBlipForCoords("Grizzly's Mine",GetHashKey("blip_location_lower"),{-2328.32, 100.18, 221.62})
addBlipForCoords("Kamassa River Mine",GetHashKey("blip_location_lower"),{2284.27, 1194.54, 108.07})
addBlipForCoords("Annesburg Mine",GetHashKey("blip_location_lower"),{2776.93, 1339.18, 70.74})
-------------------------------------Anim-------------------------------------------

function playCustomAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
	TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

function mining_anim()
    local Get_Coords = GetEntityCoords(PlayerPedId())
	local ped = PlayerPedId()
    EquipTool('p_pickaxe01x', 'Swing')
    playCustomAnim('amb_work@world_human_pickaxe_new@working@male_a@trans','pre_swing_trans_after_swing', 10000, 17)

end

function end_anim()
    Citizen.InvokeNative(0x58F7DB5BD8FA2288, ped)
end

function EquipTool(toolhash, holdtowork)
    hastool = false
    Citizen.InvokeNative(0x6A2F820452017EA2) -- Clear Prompts from Screen
    if tool then
        DeleteEntity(tool)
    end
    Wait(500)
    ped = PlayerPedId()
    tool = CreateObject(toolhash, GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,0.0), true, true, true)
    AttachEntityToEntity(tool, ped, GetPedBoneIndex(ped, 7966), 0.0,0.0,0.0,  0.0,0.0,0.0, 0, 0, 0, 0, 2, 1, 0, 0);
    Citizen.InvokeNative(0x923583741DC87BCE, ped, 'arthur_healthy')
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, ped, "carry_pitchfork")
    Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    ForceEntityAiAndAnimationUpdate(tool, 1)
    Citizen.InvokeNative(0x3A50753042B6891B, ped, "PITCH_FORKS")

    Wait(500)
    hastool = true
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225

	end
end