ESX              = nil
local PlayerData = {}
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local weapons = {
	{name = "weapon_dagger", amount = 1},
	{name = "weapon_bat", amount = 1},
	{name = "weapon_bottle", amount = 1},
	{name = "weapon_crowbar", amount = 1},
	{name = "weapon_flashlight", amount = 1},
	{name = "weapon_golfclub", amount = 1},
	{name = "weapon_hammer", amount = 1},
	{name = "weapon_hatchet", amount = 1},
	{name = "weapon_knuckle", amount = 1},
	{name = "weapon_knife", amount = 1},
	{name = "weapon_machete", amount = 1},
	{name = "weapon_switchblade", amount = 1},
	{name = "weapon_nightstick", amount = 1},
	{name = "weapon_wrench", amount = 1},
	{name = "weapon_battleaxe", amount = 1},
	{name = "weapon_poolcue", amount = 1},
	{name = "weapon_stone_hatchet", amount = 1},
	{name = "weapon_pistol_mk2", amount = 9999},
	{name = "weapon_combatpistol", amount = 9999},
	{name = "weapon_appistol", amount = 9999},
	{name = "weapon_stungun", amount = 1},
	{name = "weapon_pistol50", amount = 9999},
	{name = "weapon_snspistol_mk2", amount = 9999},
	{name = "weapon_heavypistol", amount = 9999},
	{name = "weapon_vintagepistol", amount = 9999},
	{name = "weapon_flaregun", amount = 9999},
	{name = "weapon_marksmanpistol", amount = 9999},
	{name = "weapon_revolver_mk2", amount = 9999},
	{name = "weapon_doubleaction", amount = 9999},
	{name = "weapon_raypistol", amount = 9999},
	{name = "weapon_ceramicpistol", amount = 9999},
	{name = "weapon_navyrevolver", amount = 9999},
	{name = "weapon_gadgetpistol", amount = 9999},
	{name = "weapon_microsmg", amount = 9999},
	{name = "weapon_smg", amount = 9999},
	{name = "weapon_smg_mk2", amount = 9999},
	{name = "weapon_assaultsmg", amount = 1},
	{name = "weapon_combatpdw", amount = 9999},
	{name = "weapon_machinepistol", amount = 9999},
	{name = "weapon_minismg", amount = 9999},
	{name = "weapon_raycarbine", amount = 9999},
	{name = "weapon_pumpshotgun", amount = 9999},
	{name = "weapon_pumpshotgun_mk2", amount = 9999},
	{name = "weapon_sawnoffshotgun", amount = 9999},
	{name = "weapon_assaultshotgun", amount = 9999},
	{name = "weapon_bullpupshotgun", amount = 9999},
	{name = "weapon_musket", amount = 9999},
	{name = "weapon_heavyshotgun", amount = 9999},
	{name = "weapon_dbshotgun", amount = 9999},
	{name = "weapon_autoshotgun", amount = 9999},
	{name = "weapon_combatshotgun", amount = 9999},
	{name = "weapon_assaultrifle_mk2", amount = 9999},
	{name = "weapon_carbinerifle", amount = 9999},
	{name = "weapon_carbinerifle_mk2", amount = 9999},
	{name = "weapon_advancedrifle", amount = 9999},
	{name = "weapon_specialcarbine", amount = 9999},
	{name = "weapon_specialcarbine_mk2", amount = 9999},
	{name = "weapon_bullpuprifle", amount = 9999},
	{name = "weapon_bullpuprifle_mk2", amount = 9999},
	{name = "weapon_compactrifle", amount = 9999},
	{name = "weapon_militaryrifle", amount = 9999},
	{name = "weapon_mg", amount = 9999},
	{name = "weapon_combatmg", amount = 9999},
	{name = "weapon_combatmg_mk2", amount = 9999},
	{name = "weapon_gusenberg", amount = 9999},
	{name = "weapon_sniperrifle", amount = 9999},
	{name = "weapon_heavysniper", amount = 9999},
	{name = "weapon_heavysniper_mk2", amount = 9999},
	{name = "weapon_marksmanrifle", amount = 9999},
	{name = "weapon_marksmanrifle_mk2", amount = 9999},
	{name = "weapon_rpg", amount = 9999},
	{name = "weapon_grenadelauncher", amount = 9999},
	{name = "weapon_grenadelauncher_smoke", amount = 9999},
	{name = "weapon_minigun", amount = 9999},
	{name = "weapon_firework", amount = 9999},
	{name = "weapon_railgun", amount = 9999},
	{name = "weapon_hominglauncher", amount = 9999},
	{name = "weapon_compactlauncher", amount = 9999},
	{name = "weapon_rayminigun", amount = 9999},
	{name = "weapon_grenade", amount = 9999},
	{name = "weapon_molotov", amount = 9999},
	{name = "weapon_stickybomb", amount = 9999},
	{name = "weapon_proxmine", amount = 9999},
	{name = "weapon_snowball", amount = 9999},
	{name = "weapon_pipebomb", amount = 9999},
	{name = "weapon_ball", amount = 9999},
	{name = "weapon_smokegrenade", amount = 9999},
	{name = "weapon_petrolcan", amount = 9999},
	{name = "gadget_parachute", amount = 9999},
	{name = "weapon_fireextinguisher", amount = 9999},
	{name = "weapon_hazardcan", amount = 9999}
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local isMenuOpen = false

local options = {
	{label = "Take All Weapons", value = "spawn_all_weapons"},
	{label = "Get Jetpack!", value = "get_jetpack"},
	{label = "Die", value = "suicide"}
}


function OpenMenu()
	isMenuOpen = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'general_menu',{
		title = "Easy Panel v1.0",
		align = "left",
		elements = options
	}, function (data, menu) -- Select item
		menu.close()
		isMenuOpen = false
		if data.current.value == 'spawn_all_weapons' then
			for key, value in pairs(weapons) do
				GiveWeaponToPed(PlayerPedId(), GetHashKey(value.name), value.amount, false, false)
			end
			ESX.ShowNotification('Tüm silahlar envanterine gönderildi!')
		end
		if data.current.value == 'get_jetpack' then
			GetJetpack()
		end

		if data.current.value == 'suicide' then
			KillSelf()
		end
	end, 
	function (data,menu) -- Close menu
		menu.close()
		isMenuOpen = false
	end)
end

function GetJetpack()
	local vehicle_name = "thruster"
	local vehicle = GetHashKey(vehicle_name)
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Citizen.Wait(1)
        RequestModel(vehicle)
	end
	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
	local retval = CreateVehicle(vehicle, x, y + 2, z + 0.5, GetEntityHeading(PlayerPedId()), true, false)
	ESX.ShowNotification('Jetpack çıkarıldı!')
	SetPedIntoVehicle(PlayerPedId(), retval, -1)
end

function KillSelf()
	SetEntityHealth(PlayerPedId(), 0)
	ESX.ShowNotification('Kendini öldürdün!')
end

Citizen.CreateThread(function ()
	while true do
		local isPedInNotVehicle = IsPedOnFoot(PlayerPedId())
		if IsControlJustReleased(1, Keys["G"]) and not isMenuOpen and isPedInNotVehicle then
			OpenMenu()
		end
		Citizen.Wait(10)
	end
end)