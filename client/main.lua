ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('ExeLds:spatula')
AddEventHandler('ExeLds:spatula', function()
local coords  = GetEntityCoords(PlayerPedId())				
local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
if DoesEntityExist(vehicle) then	
	SetTextComponentFormat('STRING')
	AddTextComponentString('İptal etmek için ~INPUT_CELLPHONE_CANCEL~ - ~INPUT_FRONTEND_PAUSE_ALTERNATE~ - ~INPUT_AIM~ bas.')
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	TriggerEvent("mythic_progbar:client:progress", {
			name = "renting_motel",
			duration = 45000,
			label = "Araç kaplaması kaldırılıyor.. ",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
			},
			animation = {
				animDict = "mini@repair",
			anim = "fixing_a_ped",
			}
			--[[prop = {
				model = "prop_notepad_01"	
			}]]
	}, function(status)
			if not status then													
					local plate = GetVehicleNumberPlateText(vehicle)
					ESX.TriggerServerCallback('ExeLds:getVehicleProperties', function(props)
						props = json.decode(props)
						ESX.Game.SetVehicleProperties(vehicle, props)
					end, plate)
					
					exports['mythic_notify']:DoHudText('success', 'Araç kaplaması kaldırıldı.')
							
			end
	end)
else
	exports['mythic_notify']:DoHudText('error', 'Yakınında araç bulunmuyor!')
end
end)

RegisterNetEvent('ExeLds:aracKaplama')
AddEventHandler('ExeLds:aracKaplama', function(renk, itemName)
	local coords  = GetEntityCoords(PlayerPedId())				
	local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
	if DoesEntityExist(vehicle) then	
		SetTextComponentFormat('STRING')
		AddTextComponentString('İptal etmek için ~INPUT_CELLPHONE_CANCEL~ - ~INPUT_FRONTEND_PAUSE_ALTERNATE~ - ~INPUT_AIM~ bas.')
		DisplayHelpTextFromStringLabel(0, 0, 1, -1)
		TriggerEvent("mythic_progbar:client:progress", {
				name = "renting_motel",
				duration = 30000,
				label = "Araç kaplama işlemi yapılıyor.. ",
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = true,
				},
				animation = {
					animDict = "mini@repair",
				anim = "fixing_a_ped",
				}
				--[[prop = {
					model = "prop_notepad_01"	
				}]]
		}, function(status)
				if not status then										
					local props = {}
					props['color1'] = renk
					ESX.Game.SetVehicleProperties(vehicle, props)
						
					TriggerServerEvent('ExeLds:removeItem', itemName, 1)
						
					exports['mythic_notify']:DoHudText('success', 'Araç kaplaması kullanıldı.')
				
				end
		end)
	else
		exports['mythic_notify']:DoHudText('error', 'Yakınında araç bulunmuyor!')
	end	
end)