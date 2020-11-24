--####################################################################################
--#                                   DISCORD:                                       #
--#                                   Mun#0001                                       #
--####################################################################################

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("AddictionRentBoats:checkmoney")
AddEventHandler("AddictionRentBoats:checkmoney", function(money, bike, x, y, z, heading)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= money then
		xPlayer.removeMoney(money)
		TriggerClientEvent('AddictionRentBoats:spawnVehicle', _source, bike,x, y, z, heading)
	elseif xPlayer.getAccount('bank').money >= money then
		xPlayer.removeAccountMoney('bank',money)
		TriggerClientEvent('AddictionRentBoats:spawnVehicle', _source, bike,x, y, z, heading)
	else
		TriggerClientEvent('AddictionRentBoats:nomoney', _source)
	end
	
end)

RegisterServerEvent("AddictionRentBoats:addmoney")
AddEventHandler("AddictionRentBoats:addmoney", function(money)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(money)
end)