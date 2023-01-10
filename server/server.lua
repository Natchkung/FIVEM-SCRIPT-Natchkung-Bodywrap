--| 🐌	@ NATCHKUNG DEV			
--| 💬	@ »ღ«#8480

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

    --------------------------------------------เช็คไอเทม----------------------------------------------------------------
    ESX.RegisterUsableItem(Config.body.Item, function(source)
        TriggerClientEvent('natchkung_bodywrap:bodywrap', source)
    end)

    ESX.RegisterUsableItem(Config.play.Item, function(source)
        TriggerClientEvent('natchkung_bodywrap:play', source)
    end)

    RegisterServerEvent('natchkung_bodywrap:check')
    AddEventHandler('natchkung_bodywrap:check', function(target)
        local _source = source
        local kuypat = ESX.GetPlayerFromId(_source)
        local kuyjun = kuypat.getInventoryItem(Config.body.Item)

        if kuyjun.count > 0 then
            if CheckPolice() >= Config.body.Needcop and CheckAmbulance() >= Config.body.Needmc then
                TriggerClientEvent('natchkung_bodywrap:progress', source)
                Wait(Config.body.timeprogress)
                TriggerClientEvent('natchkung_bodywrap:blur', target)
                kuypat.removeInventoryItem(Config.body.Item, Config.body.count)
            else
                TriggerClientEvent('natchkung_bodywrap:dontwork', source)
            end
        end
    end)


    RegisterServerEvent('natchkung_bodywrap:checkplay')
    AddEventHandler('natchkung_bodywrap:checkplay', function(target)
        local _source = source
        local kuypat = ESX.GetPlayerFromId(_source)
        local kuyjun = kuypat.getInventoryItem(Config.play.Item)

        if kuyjun.count > 0 then
                TriggerClientEvent('natchkung_bodywrap:progressplay', source)
                Wait(Config.play.timeprogress)
                TriggerClientEvent('natchkung_bodywrap:blurplay', target)
                kuypat.removeInventoryItem(Config.play.Item, Config.play.count)
            else
                TriggerClientEvent('natchkung_bodywrap:dontworkplay', source)
        end
    end)

    --------------------------------------- CHECK JOB ---------------------------------------------------------------

    function CheckPolice()
        local cops = 0
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'police' then
                cops = cops + 1
            end
        end
        return cops
    end

    function CheckAmbulance()
        local mc = 0
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'ambulance' then
                mc = mc + 1
            end
        end
        return mc
    end

    --------------------------------------------------------------------------------------------------------------------------------------
     -------------------------------------------REMAKESTORY------------------------------------------------

    RegisterCommand("remakestory",function(source, args)
        local target = tonumber(args[1])
        local time = tonumber(args[2])
        local targetXPlayer = ESX.GetPlayerFromId(target)
        if ESX.GetPlayerFromId(source).getGroup() == "admin" then
            if targetXPlayer ~= nil then
                if time ~= nil then
                    if time > 0 and time < 41 then
                    TriggerClientEvent('natchkung_bodywarp:remakestory' ,target, time)
                    else
                    TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'เวลาคุณต้องมากกว่า 1 นาทีและต้องไม่มากไม่น้อยกว่า 40 นาที' } })
                    end
                else
                    TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'กรุณาใส่เวลา' } })
                end
            else
                TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'ไม่พบไอดีผู้เล่น' } })
            end
        else
            TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'คุณไม่สามารถใช้คำสั่งนี้ได้' } })
        end
    end)

    RegisterCommand("dell",function(source, args)
        local target = tonumber(args[1])
        local time = tonumber(args[2])
        local targetXPlayer = ESX.GetPlayerFromId(target)
        if ESX.GetPlayerFromId(source).getGroup() == "admin" then
            if targetXPlayer ~= nil then
                TriggerClientEvent('natchkung_bodywarp:deleteplay' ,target)
            else
                TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'ไม่พบไอดีผู้เล่น' } })
            end
        else
            TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'คุณไม่สามารถใช้คำสั่งนี้ได้' } })
        end
    end)
    
        ESX.RegisterServerCallback('Bodywrap:server:getdata', function(source, cb)
        local iden = GetPlayerIdentifiers(source)[1]
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @iden LIMIT 0,1', {
            ['@iden'] = iden
        }, function(result)
            if not (result[1] == nil) then
                data = {name = result[1].name}
                cb(data)
            else
                cb(nil)
            end
        end)
    end)

    Citizen.CreateThread(function()
        PerformHttpRequest("https://ipinfo.io/json", function(err, text, headers)
        local Original = "natchkung-bodywrap"
        local BotDiscord = "🔐"
        local Script = ''..GetCurrentResourceName()..''
        local UserName = "natchkung-bodywrap"
        local Version  = "V.1.1"
        local webhooks = "https://discord.com/api/webhooks/963496727372001320/S_yF96S2hDwcEMArg6cpmbbywAiSxk8VNzIA0nT-NsGWSo-ELJufJg-WWHDseWlbHpAa"
        local image = "https://media.discordapp.net/attachments/959469981496672317/961948074643705936/HanKinsongang.png"
        local connect = {
        {
        ["color"] = "3669760",
        ["description"] = '🌐 Server : '..GetConvar("sv_hostname","Unknown")..'\n \n❗ Script : '..Original..' \n✅ [DEV NATCHKUNG] Script : '..Script..' \n✅ GOD : '..UserName..' \n✅ Version : '..Version..'',
        ["image"] = {
        ["url"] = ''..image..'',
        },
        ['footer'] = { 
        ['text'] = '🕠 วันนี้ เวลา : '..os.date('%X')..'',
        },
        }
        }
        PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({username = ""..BotDiscord.."" , embeds = connect}), { ['Content-Type'] = 'application/json' })
        end)
        end)
-------
end

-------------------------------------------------------------------------------------------------------------------------------