function invincibility(state)
    SetEntityInvincible(cache.ped, state)
    SetEntityAlpha(cache.ped, 51, false)
    SetPlayerCanDoDriveBy(cache.ped, not state)

    if IsPedInAnyVehicle(cache.ped, false) then
        SetEntityAlpha(GetVehiclePedIsIn(cache.ped, false), 51, false)
    end
end

--[[ function safezone()
    for k, v in pairs(Config.SafeZones.Areas) do
        local zone = lib.zones.sphere({
            coords = v.coords,
            radius = v.radius,
            debug = false,
            onEnter = function()
                invincibility(true)
                Config.Notify(Config.SafeZones.Notify.enter)
            end,
            onExit = function()
                invincibility(false)
                Config.Notify(Config.SafeZones.Notify.exit)
                ResetEntityAlpha(cache.ped)
                ResetEntityAlpha(GetVehiclePedIsIn(cache.ped, false))
            end
        })
    end
end ]]
--[[ 
function CreateBlip()
    for k, v in pairs(Config.SafeZones.Areas) do
        local blip = AddBlipForCoord(v.coords)
        local radiusBlip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
        SetBlipSprite(blip, Config.BlipSettings.Sprite)
        SetBlipScale(blip, Config.BlipSettings.Scale)
        SetBlipColour(blip, Config.BlipSettings.Color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipSettings.Name)
        EndTextCommandSetBlipName(blip)

        SetBlipAlpha(radiusBlip, 80)
        SetBlipColour(radiusBlip, Config.BlipSettings.Color)
    end
end ]]

CreateThread(function()
        for k, v in pairs(Config.SafeZones.Areas) do
            local blip = AddBlipForCoord(v.coords)
            local radiusBlip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
            SetBlipSprite(blip, Config.BlipSettings.Sprite)
            SetBlipScale(blip, Config.BlipSettings.Scale)
            SetBlipColour(blip, Config.BlipSettings.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.BlipSettings.Name)
            EndTextCommandSetBlipName(blip)

            SetBlipAlpha(radiusBlip, 80)
            SetBlipColour(radiusBlip, Config.BlipSettings.Color)
        end

        for k, v in pairs(Config.SafeZones.Areas) do
            local zone = lib.zones.sphere({
                coords = v.coords,
                radius = v.radius,
                debug = false,
                onEnter = function()
                    invincibility(true)
                    Config.Notify(Config.SafeZones.Notify.enter)
                end,
                onExit = function()
                    invincibility(false)
                    Config.Notify(Config.SafeZones.Notify.exit)
                    ResetEntityAlpha(cache.ped)
                    ResetEntityAlpha(GetVehiclePedIsIn(cache.ped, false))
                end
            })
        end
end)


AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        ResetEntityAlpha(cache.ped)
        ResetEntityAlpha(GetVehiclePedIsIn(cache.ped, false))
    end
end)
