Framework = nil

if Config.Framework == "esx" then
    Framework = exports.es_extended:getSharedObject()
elseif Config.Framework == "qbcore" then
    Framework = exports['qb-core']:GetCoreObject()
else
    print("Invalid Framework")
end

AddEventHandler('playerKilled', function(killerId, data)
    if Config.FrameWork == "esx" then
        local xPlayer = Framework.GetPlayerFromId(killerId)
        xPlayer.addMoney(reward)
    else
        local Player = Framework.Functions.GetPlayer(killerId)
        Player.Functions.AddMoney('cash', reward)
    end
end)
