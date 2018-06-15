function drawTxt(x, y, width, height, scale, text, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.004)
end

function drawRct(x, y, width, height, r, g, b, a)
    DrawRect(x + width / 2, y + height / 2, width, height, r, g, b, a)
end

function msginf(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local get_ped_veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local plate_veh = GetVehicleNumberPlateText(get_ped_veh)
        local veh_body_health = GetVehicleBodyHealth(get_ped_veh)
        local engineHealth = GetVehicleEngineHealth(get_ped_veh)
        local vehicleBodyHealth = GetVehicleBodyHealth(get_ped_veh)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
            if GetVehicleClass(get_ped_veh) == 8 then
                if veh_body_health <= 650 then
                    veh_body_health = 650
                end
                veh_body_health = veh_body_health - 650
            else
                if engineHealth <= 850 then
                    engineHealth = 850
                end
                engineHealth = engineHealth - 850
                local PosX = 0.1561
                local PosY = 0.968
                local WideL = 0.004
                local WideH = -0.157
                if engineHealth >= 135 and engineHealth <= 150 then
                    ColorR = 1
                    ColorG = 254
                    ColorB = 89
                    ColorA = 180
                elseif engineHealth >= 105 and engineHealth <= 135 then
                    ColorR = 0
                    ColorG = 255
                    ColorB = 9
                    ColorA = 180
                elseif engineHealth >= 85 and engineHealth <= 105 then
                    ColorR = 14
                    ColorG = 255
                    ColorB = 1
                    ColorA = 180
                elseif engineHealth >= 65 and engineHealth <= 85 then
                    ColorR = 134
                    ColorG = 254
                    ColorB = 1
                    ColorA = 190
                elseif engineHealth >= 50 and engineHealth <= 65 then
                    ColorR = 197
                    ColorG = 254
                    ColorB = 1
                    ColorA = 190
                elseif engineHealth >= 40 and engineHealth <= 50 then
                    ColorR = 197
                    ColorG = 254
                    ColorB = 1
                    ColorA = 190
                elseif engineHealth >= 30 and engineHealth <= 40 then
                    ColorR = 239
                    ColorG = 254
                    ColorB = 3
                    ColorA = 210
                elseif engineHealth >= 20 and engineHealth <= 30 then
                    ColorR = 255
                    ColorG = 200
                    ColorB = 5
                    ColorA = 255
                elseif engineHealth >= 10 and engineHealth <= 20 then
                    ColorR = 250
                    ColorG = 200
                    ColorB = 5
                    ColorA = 255
                elseif engineHealth >= 00 and engineHealth <= 10 then
                    ColorR = 255
                    ColorG = 0
                    ColorB = 0
                    ColorA = 255
                end
                if vehicleBodyHealth <= 650 then
                    vehicleBodyHealth = 650
                end
                vehicleBodyHealth = vehicleBodyHealth - 650
                ColorR = 255
                ColorG = 255
                ColorB = 255
                ColorA = 120
                local PosX = 0.151
                local PosY = 0.968
                local WideL = 0.004
                local WideH = -0.157
                if vehicleBodyHealth <= 315 and vehicleBodyHealth >= 350 then
                    ColorR = 1
                    ColorG = 254
                    ColorB = 89
                    ColorA = 180
                elseif vehicleBodyHealth >= 280 and vehicleBodyHealth <= 315 then
                    ColorR = 0
                    ColorG = 255
                    ColorB = 9
                    ColorA = 180
                elseif vehicleBodyHealth >= 245 and vehicleBodyHealth <= 280 then
                    ColorR = 14
                    ColorG = 255
                    ColorB = 1
                    ColorA = 180
                elseif vehicleBodyHealth >= 210 and vehicleBodyHealth <= 245 then
                    ColorR = 134
                    ColorG = 254
                    ColorB = 1
                    ColorA = 190
                elseif vehicleBodyHealth >= 175 and vehicleBodyHealth <= 210 then
                    ColorR = 197
                    ColorG = 254
                    ColorB = 1
                    ColorA = 190
                elseif vehicleBodyHealth >= 140 and vehicleBodyHealth <= 175 then
                    ColorR = 239
                    ColorG = 254
                    ColorB = 3
                    ColorA = 210
                elseif vehicleBodyHealth >= 105 and vehicleBodyHealth <= 140 then
                    ColorR = 254
                    ColorG = 175
                    ColorB = 1
                    ColorA = 210
                elseif vehicleBodyHealth >= 70 and vehicleBodyHealth <= 105 then
                    ColorR = 255
                    ColorG = 200
                    ColorB = 5
                    ColorA = 255
                elseif vehicleBodyHealth >= 35 and vehicleBodyHealth <= 70 then
                    ColorR = 250
                    ColorG = 200
                    ColorB = 5
                    ColorA = 255
                elseif vehicleBodyHealth >= 00 and vehicleBodyHealth <= 35 then
                    ColorR = 255
                    ColorG = 0
                    ColorB = 0
                    ColorA = 255
                end
            end
            if RectR == nil then
                RectR = 0
            end
            if engineHealth < 60 or vehicleBodyHealth < 100 then
                if RectR >= 255 then
                    RectR = 0
                else
                    RectR = RectR + 7
                end
                if engineHealth < 15 and RectR > 150 then
                    if fivem_roleplay_core._display_vehicle_broken_detector == true then
                    drawTxt(0.550, 1.332, 1.0, 1.0, 0.4, "~r~    Panne détecté ~n~Appelez un garage !", 255, 255, 255, 255)
                        end
                end
            else
                RectR = 0
            end

            if fivem_roleplay_core._display_speed_vehicle == true then
                drawRct(0.105, 0.930, 0.046, 0.032, RectR, 0, 0, 100) -- UI:panel kmh
                drawRct(0.105, 0.930, 0.046, 0.032, RectR, 0, 0, 100) -- UI:panel kmh
                drawTxt(0.606, 1.42, 1.0, 1.0, 0.64, "~w~" .. math.ceil(kmh), 255, 255, 255, 255) -- INT: kmh
                drawTxt(0.627, 1.432, 1.0, 1.0, 0.4, "~w~ km/h", 255, 255, 255, 255) -- TXT: kmh
            end

            if fivem_roleplay_core._display_plate == true then
                drawTxt(0.560, 1.2800, 1.0, 1.0, 0.55, "~w~" .. plate_veh, 255, 255, 255, 255) -- TXT: Plate
            end
        end
    end
end)