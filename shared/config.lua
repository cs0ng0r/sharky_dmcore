Config = {}

Config.FrameWork = "esx" -- esx / qbcore

Config.Peds = {
    [1] = {
        coords = vector3(305.1293, -1589.5740, 29.5322),
        heading = 124.4302,
        model = "s_m_m_chemsec_01",
        usetext = true,
        label = "~r~[Weapons]\n ~s~I have the finest weapons in town ~g~(E)",
        trigger = function()
            -- logic to open shop
        end
    },
    [2] = {
        coords = vector3(297.0484, -1582.8934, 29.5322),
        heading = 152.8853,
        model = "a_m_m_eastsa_01",
        usetext = true,
        label = "~b~[Dealer]\n ~s~Come on bro, get some drugs ~g~(E)",
        trigger = function()
            -- logic to open shop
        end
    },

    [3] = {
        coords = vector3(308.7453, -1599.4550, 29.5322),
        heading = 96.5832,
        model = "s_m_y_pilot_01",
        usetext = true,
        label = "~y~[JumpMaster]\n ~s~Let's go somewhere ~g~(E)",
        trigger = function()
            TriggerEvent('sharky_dmcore:teleportMenu')
        end
    }
}

Config.BlipSettings = {
    Name = "SafeZone",
    Sprite = 431,
    Color = 2,
    Scale = 0.8,
}

Config.SafeZones = {
    Notify = {
        enter = "~g~SafeZone-ban vagy!",
        exit = "~r~Elhagytad a SafeZonet!"
    },
    Areas = {
        {
            coords = vector3(288.2785, -1601.4647, 31.2657),
            radius = 50.0,
        },
    }
}

Config.Teleport = {
    MenuTitle = "Teleportálás",
    Options = {
        {
            label = "Humane Labs",
            coords = vector3(3619.5, 3733.5, 28.69),
        },
        {
            label = "Sandy Shores",
            coords = vector3(1845.7, 3685.7, 34.27),
        }
    }

}

Config.Notify = function(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
