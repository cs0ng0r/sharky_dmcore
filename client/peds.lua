CreateThread(function()
    for k, v in pairs(Config.Peds) do
        local hash = GetHashKey(v.model)
        lib.requestModel(hash, 10000)
        ped = CreatePed(4, hash, v.coords, v.heading, false, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        local zone = lib.zones.sphere({
            coords = v.coords,
            radius = 3.5,
            debug = false,
            inside = function()
                if v.usetext then
                    DrawText3D(v.coords + vec3(0, 0, 2.2), v.label)
                end
                if IsControlJustPressed(0, 38) then
                    v.trigger()
                end
            end,

        })
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(Config.Peds) do
            DeleteEntity(ped)
        end
    end
end)