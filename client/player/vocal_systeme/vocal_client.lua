local x = 20.0 -- Portée par défaut à la connexion
local y = 2.0 -- Portée +/-
local portevoix = 10.0

AddEventHandler('onClientMapStart', function()
    NetworkSetTalkerProximity(x)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 213) then
            if portevoix <= 2.0 then
                portevoix = 10.0
                TriggerEvent('five_roleplay_core:advenced_notication', 'CHAR_BLANK_ENTRY', "Information.", "Vous parlez à haute voix (~g~" .. portevoix .. "~s~ M)")
            elseif portevoix == 10.0 then
                portevoix = 26.0
                TriggerEvent('five_roleplay_core:advenced_notication', 'CHAR_BLANK_ENTRY', "Information.", "Vous criez (~g~" .. portevoix .. "~s~ M)")
            elseif portevoix >= 26.0 then
                portevoix = 2.0
                TriggerEvent('five_roleplay_core:advenced_notication', 'CHAR_BLANK_ENTRY', "Information.", "Vous chuchotez (~g~" .. portevoix .. "~s~ M)")
            end
            NetworkSetTalkerProximity(portevoix)
        end
        if IsControlPressed(1, 213) then
            local posPlayer = GetEntityCoords(GetPlayerPed(-1))
            DrawMarker(1, posPlayer.x, posPlayer.y, posPlayer.z - 1, 0, 0, 0, 0, 0, 0, portevoix * 2, portevoix * 2, 0.8001, 196, 9, 27, 165, 0, 0, 0, 0)
        end
    end
end)

function Texte(text, showtime)
    ClearPrints()
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
