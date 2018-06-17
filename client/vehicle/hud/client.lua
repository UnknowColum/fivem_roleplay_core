Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local get_ped_veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local plate_veh = GetVehicleNumberPlateText(get_ped_veh)
        local engineHealth = GetVehicleEngineHealth(get_ped_veh)
        local vehicleBodyHealth = GetVehicleBodyHealth(get_ped_veh)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
            if GetVehicleClass(get_ped_veh) == 8 then
            else
                if engineHealth <= 850 then
                    engineHealth = 850
                end
                engineHealth = engineHealth - 850
            end

            if blink == nil then
                blink = 0
            end

            if engineHealth < 60 or vehicleBodyHealth < 100 then
                if blink >= 255 then
                    blink = 0
                else
                    blink = blink + 7
                end
                if engineHealth < 15 and blink > 150 then

                    if fivem_roleplay_core._display_vehicle_broken_detector == true then
                       drawTxt(0.550, 1.332, 1.0, 1.0, 0.4, _L('vehicle_broken'), 255, 255, 255, 255)
                    end

                end
            else
                blink = 0
            end


            if fivem_roleplay_core._display_speed_vehicle == true then
                drawRct(0.105, 0.930, 0.046, 0.032, 0, 0, 0, 100) -- UI:panel kmh
                drawTxt(0.606, 1.42, 1.0, 1.0, 0.64, "~w~" .. math.ceil(kmh), 255, 255, 255, 255)
                drawTxt(0.627, 1.432, 1.0, 1.0, 0.4, "~w~ km/h", 255, 255, 255, 255)
            end

            if fivem_roleplay_core._display_plate == true then

                drawTxt(0.560, 1.2800, 1.0, 1.0, 0.55, "~w~" .. plate_veh, 255, 255, 255, 255)

            end
        end
    end
end)