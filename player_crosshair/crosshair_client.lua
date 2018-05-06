local driveWanderTaskActive = false
local driveToWpTaskActive = false


-- function
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end


function DriveToWp()
    local PlayerPed = GetPlayerPed(-1)
    if driveTaskActive then
        ClearPedTasks(PlayerPed)
        driveTaskActive = false
    else
        driveTaskActive = true
        local waypoint = GetBlipCoords(GetFirstBlipInfoId(8))
        local veh = GetVehiclePedIsIn(PlayerPed, 0)
        local model = GetEntityModel(veh)

        SetDriverAbility(PlayerPed, 0.7)
        SetDriverAggressiveness(PlayerPed, 0.0)
        TaskVehicleDriveToCoordLongrange(PlayerPed, veh, waypoint.x, waypoint.y, waypoint.z, 16.0, 786603, 10.0)
    end
end

function DriveWander()
    local PlayerPed = GetPlayerPed(-1)
    if driveTaskActive then
        ClearPedTasks(PlayerPed)
        driveTaskActive = false
        driveToWpTaskActive = false
    else
        driveTaskActive = true
        local veh = GetVehiclePedIsIn(PlayerPed, 0)
        local model = GetEntityModel(veh)

        SetDriverAbility(PlayerPed, 0.7)
        SetDriverAggressiveness(PlayerPed, 0.0)
        TaskVehicleDriveWander(PlayerPed, veh, 16.0, 786603)
    end
end

-- Boucle

Citizen.CreateThread(function()
    local isSniper = false
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local currentWeaponHash = GetSelectedPedWeapon(ped)
        if currentWeaponHash == 100416529 then
            isSniper = true
        elseif currentWeaponHash == 205991906 then
            isSniper = true
        elseif currentWeaponHash == -952879014 then
            isSniper = true
        elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
            isSniper = true
        else
            isSniper = false
        end
        if not isSniper then
            HideHudComponentThisFrame(14)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetCanAttackFriendly(GetPlayerPed(-1), true, false)
        NetworkSetFriendlyFireOption(true)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 56) then
            DriveToWp()
        elseif IsControlJustReleased(0, 57) then
            DriveWander()
        end
    end
end)
