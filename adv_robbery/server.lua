RegisterNetEvent('adv:lester', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local pricemarket = Config.Marketpay * amount 
    if xPlayer.job.name == 'police' then
        xPlayer.showNotification('You cant do it youre part of the fdo')
    else
        if xPlayer.getMoney() >= pricemarket then
            xPlayer.removeMoney(pricemarket)
            exports.ox_inventory:AddItem(_source, "lockpick", amount) 
            TriggerClientEvent('adv:lester:success', _source)
    else
            xPlayer.showNotification('You don\'t have enough money')
            TriggerClientEvent('adv:lester:failed', _source)
        end
    end
end)

RegisterNetEvent('adv:lester2', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local pricefleeca = Config.Fleecapay * amount 
    if xPlayer.job.name == 'police' then
        xPlayer.showNotification('You cant do it youre part of the fdo')
    else
    if xPlayer.getMoney() >= pricefleeca then
        xPlayer.removeMoney(pricefleeca)
        exports.ox_inventory:AddItem(_source, "drill", amount)
        TriggerClientEvent('adv:lester:success', _source)
    else
        xPlayer.showNotification('You don\'t have enough money')
        TriggerClientEvent('adv:lester:failed', _source)
        end
    end
end)

RegisterNetEvent('adv:lester3', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local priceblaine = Config.Blainepay * amount 

    if xPlayer.job.name == 'police' then
        xPlayer.showNotification('You cant do it youre part of the fdo')
    else
        if xPlayer.getMoney() >= priceblaine then
            xPlayer.removeMoney(priceblaine)
            exports.ox_inventory:AddItem(_source, "card", amount)
            TriggerClientEvent('adv:lester:success', _source)
    else
        xPlayer.showNotification('You don\'t have enough money')
        TriggerClientEvent('adv:lester:failed', _source)
        end
    end
end)

RegisterNetEvent('adv:market', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local lootmarket = Config.ItemMarket
    local amount = Config.RewardsMarket
    local lockpick = xPlayer.getInventoryItem('lockpick').count 

    if xPlayer.job.name == 'police' then
        xPlayer.showNotification("You can't do it, you're part of the FDO")
    else 
        if lockpick > 0 then
            exports.ox_inventory:RemoveItem(_source, 'lockpick', 1) 
            exports.ox_inventory:AddItem(_source, lootmarket, amount)
            xPlayer.showNotification("You have received " .. amount .. " dirty money")

            local playerCoords = GetEntityCoords(GetPlayerPed(_source))


            local xPlayers = ESX.GetPlayers()
            for _, playerId in ipairs(xPlayers) do
                local fdo = ESX.GetPlayerFromId(playerId)
                if fdo.job.name == 'police' then
                    fdo.showNotification("A robbery is in progress!")

                    
                    TriggerClientEvent('adv:createRobberyBlip', playerId, playerCoords)
                end
            end
        else 
            xPlayer.showNotification("You don't have the lockpick")
        end
    end
end)

RegisterNetEvent('adv:market2', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local lootmarket = Config.ItemMarket
    local amount = Config.RewardsFleeca
    local card = xPlayer.getInventoryItem('card').count 

    if xPlayer.job.name == 'police' then
        xPlayer.showNotification("You can't do it, you're part of the FDO")
    else 
        if card > 0 then
            exports.ox_inventory:RemoveItem(_source, 'card', 1) 
            exports.ox_inventory:AddItem(_source, lootmarket, amount)
            xPlayer.showNotification("You have received " .. amount .. " dirty money")

            local playerCoords = GetEntityCoords(GetPlayerPed(_source))


            local xPlayers = ESX.GetPlayers()
            for _, playerId in ipairs(xPlayers) do
                local fdo = ESX.GetPlayerFromId(playerId)
                if fdo.job.name == 'police' then
                    fdo.showNotification("A robbery is in progress!")

                    
                    TriggerClientEvent('adv:createRobberyBlip', playerId, playerCoords)
                end
            end
        else 
            xPlayer.showNotification("You don't have the card")
        end
    end
end)

RegisterNetEvent('adv:market3', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local lootmarket = Config.ItemMarket
    local amount = Config.RewardsFleeca
    local drill = xPlayer.getInventoryItem('drill').count 

    if xPlayer.job.name == 'police' then
        xPlayer.showNotification("You can't do it, you're part of the FDO")
    else 
        if drill > 0 then
            exports.ox_inventory:RemoveItem(_source, 'drill', 1) 
            exports.ox_inventory:AddItem(_source, lootmarket, amount)
            xPlayer.showNotification("You have received " .. amount .. " dirty money")

            local playerCoords = GetEntityCoords(GetPlayerPed(_source))


            local xPlayers = ESX.GetPlayers()
            for _, playerId in ipairs(xPlayers) do
                local fdo = ESX.GetPlayerFromId(playerId)
                if fdo.job.name == 'police' then
                    fdo.showNotification("A robbery is in progress!")

                    
                    TriggerClientEvent('adv:createRobberyBlip', playerId, playerCoords)
                end
            end
        else 
            xPlayer.showNotification("You don't have the drill")
        end
    end
end)












