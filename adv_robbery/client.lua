local showTimer = false
local startTime = nil  


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showTimer then

            local timer = Config.RobberymarketTimer
            

            if not startTime then
                startTime = GetGameTimer()
            end

            local currentTime = GetGameTimer()
            local timeLeft = timer - math.floor((currentTime - startTime) / 1000)
            

            if timeLeft >= 0 then

            DrawTxt(0.85, 1.4, 1.0,1.0,0.6, "Tempo: " .. timeLeft .. "s", 255, 255, 255, 255)

            else

                showTimer = false
                startTime = nil  
                TriggerServerEvent('adv:market')
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showTimer2 then

            local timer = Config.RobberyFleecaTimer
            

            if not startTime then
                startTime = GetGameTimer()
            end

            local currentTime = GetGameTimer()
            local timeLeft = timer - math.floor((currentTime - startTime) / 1000)
            

            if timeLeft >= 0 then

            DrawTxt(0.85, 1.4, 1.0,1.0,0.6, "Tempo: " .. timeLeft .. "s", 255, 255, 255, 255)

            else

                showTimer2 = false
                startTime = nil  
                TriggerServerEvent('adv:market2')
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showTimer3 then

            local timer = Config.RobberyBlaineTimer
            

            if not startTime then
                startTime = GetGameTimer()
            end

            local currentTime = GetGameTimer()
            local timeLeft = timer - math.floor((currentTime - startTime) / 1000)
            

            if timeLeft >= 0 then

            DrawTxt(0.85, 1.4, 1.0,1.0,0.6, "Tempo: " .. timeLeft .. "s", 255, 255, 255, 255)

            else

                showTimer3 = false
                startTime = nil  
                TriggerServerEvent('adv:market3')
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showTimer3 then

            local timer = Config.RobberyBlaineTimer
            

            if not startTime then
                startTime = GetGameTimer()
            end

            local currentTime = GetGameTimer()
            local timeLeft = timer - math.floor((currentTime - startTime) / 1000)
            

            if timeLeft >= 0 then

            DrawTxt(0.85, 1.4, 1.0,1.0,0.6, "Tempo: " .. timeLeft .. "s", 255, 255, 255, 255)

            else

                showTimer3 = false
                startTime = nil  
                TriggerServerEvent('adv:market3')
            end
        end
    end
end)

function DrawTxt(x, y, width, height, scale, text, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


Citizen.CreateThread(function()
    Wait(250)
    for k, v in pairs(Config.Market) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'rapina'..k,
            pos = v.pos,
            scale = vector3(1.5, 1.5, 1.5),
            msg = 'Press ~INPUT_CONTEXT~ To Start The Heist',
            control = 'E',
            type = 20,
            color = { r = 130, g = 120, b = 110 },
            action = function()
                local playerPed = PlayerPedId()

                if IsPedArmed(playerPed, 4) then  
                    if lib.progressBar({
                        duration = 2000,
                        label = 'Starting the robbery...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = { 
                            dict = 'anim@heists@fleeca_bank@drilling',
                            clip = 'drill_straight_end'
                        },
                    }) then 
                        showTimer = true 
                    end
                else
                    ESX.ShowNotification('you must be armed')
                end
            end
        })
    end
end)

Citizen.CreateThread(function()
    Wait(250)
    for k, v in pairs(Config.Fleeca) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'rapinafleeca'..k,
            pos = v.pos,
            scale = vector3(1.5, 1.5, 1.5),
            msg = 'Press ~INPUT_CONTEXT~ To Start The Heist',
            control = 'E',
            type = 20,
            color = { r = 130, g = 120, b = 110 },
            action = function()
                local playerPed = PlayerPedId()
                
                if IsPedArmed(playerPed, 4) then  
                    if lib.progressBar({
                        duration = 2000,
                        label = 'Starting the robbery...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = { 
                            dict = 'anim@heists@humane_labs@finale@keycards',
                            clip = 'ped_a_enter_loop'
                        },
                    }) then 
                        showTimer2 = true 
                    end
                else
                    ESX.ShowNotification('you must be armed')
                end
            end
        })
    end
end)

Citizen.CreateThread(function()
    Wait(250)
    for k, v in pairs(Config.Blaine) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'rapinablaine'..k,
            pos = v.pos,
            scale = vector3(1.5, 1.5, 1.5),
            msg = 'Press ~INPUT_CONTEXT~ To Start The Heist',
            control = 'E',
            type = 20,
            color = { r = 130, g = 120, b = 110 },
            action = function()
                local playerPed = PlayerPedId()
                
                if IsPedArmed(playerPed, 4) then  
                    if lib.progressBar({
                        duration = 2000,
                        label = 'Starting the robbery...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = { 
                           dict = 'anim@heists@fleeca_bank@drilling',
                            clip = 'drill_straight_end'
                        },
                    }) then 
                        showTimer3 = true 
                    end
                else
                    ESX.ShowNotification('you must be armed')
                end
            end
        })
    end
end)


RegisterNetEvent('shop_lockpick', function(args)
    lib.registerContext({
        id = 'adv_rapine',
        title = 'Adv_Robbery',
        options = {
            {
                title = 'Robbery Market',
                description = 'To rob the market you will need to buy a lockpick',
                icon = 'gun',
                onSelect = function()
                    local input = lib.inputDialog('ADV Robbery', {'Amount'})
                    if input and input[1] then
                        local amount = tonumber(input[1])
                        TriggerServerEvent('adv:lester', amount)
                    end
                end,
            },
            {
                title = 'Robbery Fleeca',
                description = 'To rob the fleeca you will need to buy a drill',
                icon = 'gun',
                onSelect = function()
                    local input = lib.inputDialog('ADV Robbery', {'Amount'})
                    if input and input[1] then
                        local amount = tonumber(input[1])
                        TriggerServerEvent('adv:lester2', amount)
                    end
                end,
            },
            {
                title = 'Robbery Blaine',
                description = 'To rob the Blaine you will need to buy a Card',
                icon = 'gun',
                onSelect = function()
                    local input = lib.inputDialog('ADV Robbery', {'Amount'})
                    if input and input[1] then
                        local amount = tonumber(input[1])
                        TriggerServerEvent('adv:lester3', amount)
                    end
                end,
            },
        }
    })
    lib.showContext('adv_rapine')
end)


local options = {
    {
        icon = 'fa-solid fa-comments',
        label = 'Parla Con Lester',
        onSelect = function(data)
           TriggerEvent('shop_lockpick')
        end,
        canInteract = function(entity, distance, coords, name, bone)
            return not IsEntityDead(entity)
        end
    },
}


Citizen.CreateThread(function()
    local model = 'ig_lestercrest'
    lib.requestModel(model)

    npc = CreatePed(4, model, 57.8811, -2665.2141, 5.0067, 13.4266, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    exports.ox_target:addLocalEntity(npc, options)
end)


RegisterNetEvent('adv:createRobberyBlip', function(coords)
    local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0) 
    SetBlipColour(blip, 1)          
    SetBlipAlpha(blip, 180)         

    Citizen.SetTimeout(60000, function() 
        RemoveBlip(blip)
    end)
end)

