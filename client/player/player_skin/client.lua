function SkinLoader(json_data)
    local playerPed = GetPlayerPed(-1)
    local male = GetHashKey("mp_m_freemode_01")

    if (GetEntityModel(GetPlayerPed(-1)) == male) then
        -- Homme

    else
        -- Femme

    end

end