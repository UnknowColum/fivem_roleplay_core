local WantedIA_Status = fivem_roleplay_core._wanted_ia

AddEventHandler('five_roleplay_core:change_status')
RegisterNetEvent('five_roleplay_core:change_status', function(arg)
    WantedIA_Status = arg
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not WantedIA_Status then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
        if WantedIA_Status then
            -- Wanted IA enable
        end
    end
end)