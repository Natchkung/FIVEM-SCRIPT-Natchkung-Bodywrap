--| 🐌	@ NATCHKUNG DEV			
--| 💬	@ »ღ«#8480

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    ESX.TriggerServerCallback('Bodywrap:server:getdata', function(data)
        Wait(1000)
        Headername = data.name
    end)
end)

local NATCHKUNGSOURCE = GetCurrentResourceName()
if "natchkung-bodywrap" == NATCHKUNGSOURCE then
	Citizen.CreateThread(function()
		Citizen.Wait(500)
		NATCHKUNGSourceCode()
	end)
else
    Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        print('Fuck bodywrap by NATCHKUNG')
    end
    end)
end

NATCHKUNGSourceCode = function()

    RegisterNetEvent('Bodywrap:Getname')
    AddEventHandler('Bodywrap:Getname', function()
        ESX.TriggerServerCallback('Bodywrap:server:getdata', function(data)
            Wait(1000)
            Headername = data.headername
        end)
    end)

    local onwrap = false
    ----------------------------------------------- Bodywrap แบบ prop -----------------------------------------------------------

    RegisterNetEvent('natchkung_bodywrap:bodywrap')
    AddEventHandler('natchkung_bodywrap:bodywrap', function()

        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        if closestPlayer ~= -1 and closestDistance <= 2.0 then
            if IsPedDeadOrDying(GetPlayerPed(closestPlayer)) then
                TriggerServerEvent('natchkung_bodywrap:check', GetPlayerServerId(closestPlayer))
            else
                TriggerEvent("pNotify:SendNotification", {
                    text = '<strong class="red-text">ต้องทำให้ตายก่อน</strong>',
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "global"
                })
            end
        else
            TriggerEvent("pNotify:SendNotification", {
                text = '<strong class="red-text">ไม่มีผู้เล่นที่อยู่ใกล้คุณ</strong>',
                type = "error",
                timeout = 3000,
                layout = "bottomCenter",
                queue = "global"
            })
        end
    end)

    ---------------------------------------------------------------แบบ play--------------------------------------------------------

    RegisterNetEvent('natchkung_bodywrap:play')
    AddEventHandler('natchkung_bodywrap:play', function()

        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        if closestPlayer ~= -1 and closestDistance <= 2.0 then
            if IsPedDeadOrDying(GetPlayerPed(closestPlayer)) then
                TriggerServerEvent('natchkung_bodywrap:checkplay', GetPlayerServerId(closestPlayer))
            else
                TriggerEvent("pNotify:SendNotification", {
                    text = '<strong class="red-text">ผู้เล่นนั้นยังไม่ตาย</strong>',
                    type = "error",
                    timeout = 3000,
                    layout = "bottomCenter",
                    queue = "global"
                })
            end
        else
            TriggerEvent("pNotify:SendNotification", {
                text = '<strong class="red-text">ไม่มีผู้เล่นที่อยู่ใกล้คุณ</strong>',
                type = "error",
                timeout = 3000,
                layout = "bottomCenter",
                queue = "global"
            })
        end
    end)

    ---------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------หลอดโหลด----------------------------------------------------------
    RegisterNetEvent('natchkung_bodywrap:progress')
    AddEventHandler('natchkung_bodywrap:progress', function()

        TriggerEvent(Config.body.progress, {
            name = "unique_action_name",
            duration = Config.body.timeprogress,
            label = Config.body.textprogress,
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = Config.body.animDict,
                anim = Config.body.anim,
            },
        }, function(status)
            if not status then
                ClearPedTasks(PlayerPedId())
            end
        end)

    end)

    RegisterNetEvent('natchkung_bodywrap:progressplay')
    AddEventHandler('natchkung_bodywrap:progressplay', function()

        TriggerEvent(Config.play.progress, {
            name = "unique_action_name",
            duration = Config.play.timeprogress,
            label = Config.play.textprogress,
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = Config.play.animDict,
                anim = Config.play.anim,
            },
        }, function(status)
            if not status then
                ClearPedTasks(PlayerPedId())
            end
        end)

    end)


    --------------------------------เริ่มต้นห่อ-----------------------------------------------------------
    RegisterNetEvent('natchkung_bodywrap:blur')
    AddEventHandler('natchkung_bodywrap:blur', function()
        PutInbodyWrap()
        TriggerScreenblurFadeIn(100)
    end)

    RegisterNetEvent('natchkung_bodywrap:blurplay')
    AddEventHandler('natchkung_bodywrap:blurplay', function()
        PutInbodyWrap2()
        TriggerScreenblurFadeIn(100)
    end)

    ----------------------------------------------- Delete -----------------------------------------------------------
    RegisterNetEvent('natchkung_bodywarp:deletebodywrap')
    AddEventHandler('natchkung_bodywarp:deletebodywrap', function()
        delete()
    end)

    RegisterNetEvent('natchkung_bodywarp:deleteplay')
    AddEventHandler('natchkung_bodywarp:deleteplay', function()
        delete2()
    end)

    function delete()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        onwrap = false
        SetEntityVisible(playerPed, true, true)
        DeleteObject(bodyWrap)
        if x == 1 then
            ESX.Game.DeleteObject()
            table.remove(bodyWrap)
        end
    end

    function delete2()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local model = nil
            Citizen.Wait(100)
            if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
            else
            model = GetHashKey("mp_f_freemode_01")
            end

            RequestModel(model)
            while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
            end

            SetPlayerModel(PlayerId(), model)
            SetModelAsNoLongerNeeded(model)

            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('esx:restoreLoadout')
        end)
    end


    RegisterFontFile('font4thai')
    fontId = RegisterFontId('font4thai')

    ----------------------------------------------เป็นเสื้อผ้าห่อศพ-------------------------------------------------------
    function PutInbodyWrap2()
        local start = false
        local time = 500
        local PlayerPed = PlayerPedId()
        local coords =  GetEntityCoords(PlayerPed)
        local playerCoords = GetEntityCoords(playerPed)
        TriggerScreenblurFadeIn(100)
        onwrap = true
        local hashSkin = GetHashKey("mp_m_freemode_01")     
        if GetEntityModel(PlayerPed) == hashSkin then
            TriggerEvent('skinchanger:getSkin', function(skin)
                local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                ['torso_1'] = 144, ['torso_2'] = 0,
                ['arms'] = 6,
                ['pants_1'] = 65, ['pants_2'] = 0,
                ['shoes_1'] = 34, ['shoes_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end)
        else
            TriggerEvent('skinchanger:getSkin', function(skin)
                local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 99,
                ['torso_1'] = 142, ['torso_2'] = 2,
                ['arms'] = 14,
                ['pants_1'] = 67, ['pants_2'] = 2,
                ['shoes_1'] = 35, ['shoes_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end)
        end

    end

    ----------------------------------------------ห่อศพแบบprop---------------------------------------------------
    function PutInbodyWrap()
        local start = false
        local time = 500
        local PlayerPed = PlayerPedId()
        local coords =  GetEntityCoords(PlayerPed)
        local playerCoords = GetEntityCoords(playerPed)
        TriggerScreenblurFadeIn(100)
        StartDistressSignal()
        Gang()
        onwrap = true
        local hashSkin = GetHashKey("mp_m_freemode_01")     
        if GetEntityModel(PlayerPed) == hashSkin then
            TriggerEvent('skinchanger:getSkin', function(skin)
                local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                ['torso_1'] = 144, ['torso_2'] = 0,
                ['arms'] = 6,
                ['pants_1'] = 65, ['pants_2'] = 0,
                ['shoes_1'] = 34, ['shoes_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end)
        else
            TriggerEvent('skinchanger:getSkin', function(skin)
                local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 99,
                ['torso_1'] = 142, ['torso_2'] = 2,
                ['arms'] = 14,
                ['pants_1'] = 67, ['pants_2'] = 2,
                ['shoes_1'] = 35, ['shoes_2'] = 0,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end)
        end

    end


    ----------------------------------------------- Notify -----------------------------------------------------------
    function StartDistressSignal()
        Citizen.CreateThread(function()
            
            while onwrap do
                Citizen.Wait(2)

                SetTextFont(fontId)
                SetTextProportional(1)
                SetTextScale(0.0, 0.5)
                SetTextColour(185, 185, 185, 255)
                SetTextDropShadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)
                SetTextDropShadow()
                SetTextOutline()
                BeginTextCommandDisplayText('STRING')
                AddTextComponentSubstringPlayerName("~w~Press [~r~ENTER~w~] send ~b~Police ~w~signal")
                EndTextCommandDisplayText(0.78, 0.69)

                if IsControlPressed(0, 215) then
                    SendDistressSignal()
                    policenotify()
                    Citizen.CreateThread(function()
                        Citizen.Wait(Config.body.timesent)
                        StartDistressSignal()
                    end)
                    break
                end
            end
        end)
    end

    function Gang()
        Citizen.CreateThread(function()
            
            while onwrap do
                Citizen.Wait(2)

                SetTextFont(fontId)
                SetTextProportional(1)
                SetTextScale(0.0, 0.5)
                SetTextColour(185, 185, 185, 255)
                SetTextDropShadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)
                SetTextDropShadow()
                SetTextOutline()
                BeginTextCommandDisplayText('STRING')
                AddTextComponentSubstringPlayerName("~w~Press [~p~Q~w~] send ~p~Gang ~w~signal")
                EndTextCommandDisplayText(0.78, 0.65)

                if IsControlPressed(0, 44) then
                    gangnotify()
                    Citizen.CreateThread(function()
                        Citizen.Wait(Config.body.timesent)
                        Gang()
                    end)
                    break
                end
            end
        end)
    end

    function gangnotify()
        exports.UnxPboy_Gangalert:GangAlert("dead")
    end

    function SendDistressSignal()
        local playerPed = PlayerPedId()
        PedPosition		= GetEntityCoords(playerPed)
        
        local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

        ESX.ShowNotification("<font face='font4thai'>~r~ส่งสัญญาณไปยังตำรวจ</font>")

        TriggerServerEvent('esx_addons_gcphone:startCall', 'police', ("ช่วยด้วยถูกห่อศพ!"), PlayerCoords, {
            PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
        })
    end

    function policenotify()
        TriggerEvent("Porpy_policealert:alertNet", "deadbag")
    end

    RegisterNetEvent('natchkung_bodywrap:dontwork')
    AddEventHandler('natchkung_bodywrap:dontwork', function(xPlayer)
        exports['mythic_notify']:SendAlert('error', Config.body.Text.nocopandmc, 3*1000)
        onwrap = false	
    end)

    RegisterNetEvent('natchkung_bodywrap:dontworkplay')
    AddEventHandler('natchkung_bodywrap:dontworkplay', function(xPlayer)
        exports['mythic_notify']:SendAlert('error', Config.play.Text, 3*1000)
        onwrap = false	
    end)


    -------------------------------------------REMAKESTORY------------------------------------------------
    function agress()
        SetEntityHealth(PlayerPedId(), 0)
        PutInbodyWrap()
    end

    local display = false
    local timerremake = false
    local timerbreak = false

    RegisterNetEvent('natchkung_bodywarp:remakestory')
    AddEventHandler('natchkung_bodywarp:remakestory', function(time)
        display = true
        SetNuiFocus(display, display)
        SendNUIMessage({
            showst = display,
            timer = time,
            headername = Headername,
        })
        TriggerEvent('natchkung_bodywarp:remakestorytimer', time)
    end)

    RegisterNUICallback('CloseUI', function()
        display = false
        SetNuiFocus(display, display)
        timerbreak = true
        exports.nc_notify:PushNotification({
            title = 'แจ้งเตือน',
            description = 'คุณได้ปฎิเสธการต่อสตอรี่!',
            imageURL = '',
            icon = 'default',
            color = '#ff367c',
            duration = 5000
        })
        -- exports['okokNotify']:Alert("แจ้งเตือน", "คุณได้ปฎิเสธการต่อสตอรี่!", 5000, 'error')
    end)

    RegisterNUICallback('AgreeUI', function()
        display = false
        SetNuiFocus(display, display)
        agress()
        timerremake = true
    end)

    RegisterNetEvent('natchkung_bodywarp:remakestorytimer')
    AddEventHandler('natchkung_bodywarp:remakestorytimer', function(time)
        while true do
            Citizen.Wait(0)
            if timerremake then
            TriggerEvent('esx_ambulance:remakestory', time)
            timerremake = false 
            break
            elseif timerbreak then
                timerbreak = false 
                break
            end
        end
    end)
end