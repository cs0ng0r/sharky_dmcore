local TPOptions = {}

for k, v in pairs(Config.Teleport.Options) do
    TPOptions[#TPOptions + 1] = {
        title = v.label,
        onSelect = function()
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            SetEntityCoords(ped, v.coords)
            SetEntityHeading(ped, v.heading)
            Wait(100)
            SetEntityCoords(ped, v.coords)
            SetEntityHeading(ped, v.heading)
        end
    }
end

RegisterNetEvent('sharky_dmcore:teleportMenu')
AddEventHandler('sharky_dmcore:teleportMenu', function()
    lib.registerContext({
        id = 'teleportMenu',
        title = Config.Teleport.MenuTitle,
        options = TPOptions
    })
    lib.showContext('teleportMenu')
end)

