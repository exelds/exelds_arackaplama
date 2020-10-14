ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ExeLds:removeItem')
AddEventHandler('ExeLds:removeItem', function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, count)
end)


ESX.RegisterServerCallback('ExeLds:getVehicleProperties', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT vehicle FROM owned_vehicles WHERE plate = @plate',{['@plate'] = plate},
		function(result)
			cb(result[1].vehicle)
	end)
end)


ESX.RegisterUsableItem('spatula', function(source)
	TriggerClientEvent('ExeLds:spatula', source)
end)

ESX.RegisterUsableItem('kirmizikaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 39, 'kirmizikaplama')
end)

ESX.RegisterUsableItem('siyahkaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 12, 'siyahkaplama')
end)

ESX.RegisterUsableItem('beyazkaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 121, 'beyazkaplama')
end)

ESX.RegisterUsableItem('mavikaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 64, 'mavikaplama')
end)

ESX.RegisterUsableItem('yesilkaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 53, 'yesilkaplama')
end)

ESX.RegisterUsableItem('sarikaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 89, 'sarikaplama')
end)

ESX.RegisterUsableItem('morkaplama', function(source)
	TriggerClientEvent('ExeLds:aracKaplama', source, 148, 'morkaplama')
end)