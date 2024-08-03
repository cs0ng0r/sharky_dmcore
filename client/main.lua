RegisterNetEvent('sharky_dmcore:onPlayerKilled')
AddEventHandler('sharky_dmcore:onPlayerKilled', function(killerId, deathData)
    if killerId ~= nil then
        local victimName = GetPlayerName(source)
        TriggerServerEvent('playerKilled', killerId, { victimName = victimName })
    end
end)
