local firstSpawn = true

AddEventHandler("playerSpawned", function(spawn)
	if firstSpawn == true then
		TriggerServerEvent('five_roleplay_core:spawn')
		firstSpawn = false
	end
end)

RegisterNetEvent('five_roleplay_core:initializeinfo')
AddEventHandler('five_roleplay_core:initializeinfo', function(money,dirtymoney,bankbalance)

	SendNUIMessage({
		initialise = true,
		money = money,
		dirtymoney = dirtymoney,
		bankbalanceinfo = bankbalance
	})

end)

RegisterNetEvent('five_roleplay_core:bankbalance')
AddEventHandler('five_roleplay_core:bankbalance', function(rslt)

	SendNUIMessage({
		bankbalanceinfo = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:dirtymoney')
AddEventHandler('five_roleplay_core:dirtymoney', function(rslt)

	SendNUIMessage({
		dirtymoneyinfo = rlst
	})

end)

RegisterNetEvent('five_roleplay_core:money')
AddEventHandler('five_roleplay_core:money', function(rslt)

	SendNUIMessage({
		moneyinfo = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:rmvMoney')
AddEventHandler('five_roleplay_core:rmvMoney', function(rslt)

	SendNUIMessage({
		rmvMoney = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:addMoney')
AddEventHandler('five_roleplay_core:addMoney', function(rslt)

	SendNUIMessage({
		addMoney = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:rmvBank')
AddEventHandler('five_roleplay_core:rmvBank', function(rslt)

	SendNUIMessage({
		rmvBank = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:addBank')
AddEventHandler('five_roleplay_core:addBank', function(rslt)

	SendNUIMessage({
		addBank = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:removeMoneyForBank')
AddEventHandler('five_roleplay_core:removeMoneyForBank', function(rslt)

	SendNUIMessage({
		rmvMoneyForBank = rslt
	})

end)

RegisterNetEvent('five_roleplay_core:removeBankForMoney')
AddEventHandler('five_roleplay_core:removeBankForMoney', function(rslt)

	SendNUIMessage({
		rmvBankForMoney = rslt
	})

end)


RegisterNetEvent('five_roleplay_core:addDirtyMoney')
AddEventHandler('five_roleplay_core:addDirtyMoney', function(rslt)

	SendNUIMessage({
		addDirtyMoney = rslt
	})

end)


RegisterNetEvent('five_roleplay_core:rmvDirtyMoney')
AddEventHandler('five_roleplay_core:rmvDirtyMoney', function(rslt)

	SendNUIMessage({
		rmvDirtyMoney = rslt
	})

end)


RegisterNetEvent('five_roleplay_core:setDirtyMoney')
AddEventHandler('five_roleplay_core:rmvDirtyMoney', function(rslt)

	SendNUIMessage({
		dirtymoneyinfo = rslt
	})

end)
