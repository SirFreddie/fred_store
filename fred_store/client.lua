local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9, ["J"] = 0xF3830D8E, ["SPACE"] = 0xD9D0E1C0 }

local blips = {
    { name = 'Tienda General', sprite = 1475879922,x = -321.89, y = 803.99, z = 117.88 }
}

local CurrentZoneActive = 0

local foodrinkItems = {

	--COMPRAR--
	{
		['Text'] = "Durazno - x1",
		['SubText'] = "$1",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 1,
			['Model'] = "consumable_peach",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 5,
		}
	},
	{
		['Text'] = "Cafe - x1",
		['SubText'] = "$1",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 1,
			['Model'] = "consumable_coffee",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 5,
		}
	},
	{
		['Text'] = "Lata de Alubias - x1",
		['SubText'] = "$1",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 1,
			['Model'] = "consumable_kidneybeans_can",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 5,
		}
	},
}


local campingItems = {
	{
		['Text'] = "Hoguera - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "campfire",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 1,
		}
	},
}

local plantingItems = {}

local otherItems = {

	{
		['Text'] = "Ganzúa - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "lockpick",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 3,
		}
	},
	{
		['Text'] = "Zanahoria - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "carrot",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 12,
		}
	},
	{
		['Text'] = "Heno - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "consumable_haycube",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 25,
		}
	},
	{
		['Text'] = "Cepillo para caballo - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "horsebrush",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 1,
		}
	},
	{
		['Text'] = "Estimulante para caballo - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "stim",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 5,
		}
	},
	{
		['Text'] = "Bateador de oro - x1",
		['SubText'] = "$10",
		['Desc'] = "~pa~Usar en los rios para extraer pepitas de oro~q~",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "goldpan",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 1,
		}
	},
	{
		['Text'] = "Medicina - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "consumable_medicine",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 3,
		}
	},
	{
		['Text'] = "Aceite para armas - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "cleanshort",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 10,
		}
	},
}

local selleableItems = {
	{
		['Text'] = "Pepita de oro - x1",
		['SubText'] = "$10",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 10,
			['Model'] = "goldnugget",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 10,
		}
	},
	{
		['Text'] = "Durazno - x1",
		['SubText'] = "$1",
		['Desc'] = "",
		['Param'] = {
			['Price'] = 1,
			['Model'] = "consumable_peach",
			['Level'] = 0,
			['Cantidad'] = 1,
			--['Gold'] = 0,
			--['Rol'] = 0,
			['maxInvSlots'] = 5,
		}
	},

}

-- | Functions | --

local function IsNearZone ( location )

	local player = PlayerPedId()
	local playerloc = GetEntityCoords(player, 0)

	for i = 1, #location do
		if #(playerloc - location[i]) < 1.0 then
			return true, i
		end
	end

end

local function DisplayHelp( _message, x, y, w, h, enableShadow, col1, col2, col3, a, centre )

	local str = CreateVarString(10, "LITERAL_STRING", _message, Citizen.ResultAsLong())

	SetTextScale(w, h)
	SetTextColor(col1, col2, col3, a)

	SetTextCentre(centre)

	if enableShadow then
		SetTextDropshadow(1, 0, 0, 0, 255)
	end

	Citizen.InvokeNative(0xADA9255D, 10);

	DisplayText(str, x, y)

end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
   local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end

local function ShowNotification( _message )
	local timer = 200
	while timer > 0 do
		DisplayHelp(_message, 0.50, 0.90, 0.6, 0.6, true, 161, 3, 0, 255, true, 10000)
		timer = timer - 1
		Citizen.Wait(0)
	end
end

local function ShowNotification2( _message )
	local timer = 200
	while timer > 0 do
		DisplayHelp(_message, 0.50, 0.90, 0.6, 0.6, true, 9, 181, 64, 255, true, 10000)
		timer = timer - 1
		Citizen.Wait(0)
	end
end

function IsPlayerNearCoords2(x, y, z)
    local playerx, playery, playerz = table.unpack(GetEntityCoords(GetPlayerPed(), 0))
    local distance = GetDistanceBetweenCoords(playerx, playery, playerz, x, y, z, true)

    if distance < 5 then
        return true
    end
end



--CREAR BLIPS--

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)


--CREA MENU--

Citizen.CreateThread( function()
	WarMenu.CreateMenu('id_item', 'Tienda General', 'Interacción')
	WarMenu.SetSubTitle('id_item', 'Comprar o vender')

    WarMenu.CreateSubMenu('buy', 'id_item', 'Comprar Suministros')
    WarMenu.CreateSubMenu('fooddrink', 'buy', 'Comprar Suministros')
    WarMenu.CreateSubMenu('seeds', 'buy', 'Plantación')
    WarMenu.CreateSubMenu('camping', 'buy', 'Campamento')
    WarMenu.CreateSubMenu('others', 'buy', 'Otros')
    WarMenu.CreateSubMenu('sell', 'id_item', 'Vender Suministros')
	repeat
		if WarMenu.IsMenuOpened('id_item') then
			if WarMenu.MenuButton('Comprar Suministros', 'buy') then
            end
            if WarMenu.MenuButton('Vender Suministros', 'sell') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('buy') then
            if WarMenu.MenuButton('Comida y Bebida', 'fooddrink') then end
            if WarMenu.MenuButton('Plantación', 'seeds') then end
            if WarMenu.MenuButton('Campamento', 'camping') then end
            if WarMenu.MenuButton('Otros', 'others') then end
            WarMenu.Display()
  		elseif WarMenu.IsMenuOpened('fooddrink') then
			for i = 1, #foodrinkItems do
				if WarMenu.Button(foodrinkItems[i]['Text'], foodrinkItems[i]['SubText'], foodrinkItems[i]['Desc']) then
					TriggerServerEvent('fred2:buyitem', foodrinkItems[i]['Param'])
					--WarMenu.CloseMenu()
						Citizen.Wait(500)
				end
			end

			WarMenu.Display()


		elseif WarMenu.IsMenuOpened('seeds') then
			for i = 1, #plantingItems do
				if WarMenu.Button(plantingItems[i]['Text'], plantingItems[i]['SubText'], plantingItems[i]['Desc']) then
					TriggerServerEvent('fred2:buyitem', plantingItems[i]['Param'])
					--WarMenu.CloseMenu()
						Citizen.Wait(500)
				end
			end
			WarMenu.Display()

		elseif WarMenu.IsMenuOpened('camping') then
			for i = 1, #campingItems do
				if WarMenu.Button(campingItems[i]['Text'], campingItems[i]['SubText'], campingItems[i]['Desc']) then
					TriggerServerEvent('fred2:buyitem', campingItems[i]['Param'])
					--WarMenu.CloseMenu()
						Citizen.Wait(500)
				end
			end
			WarMenu.Display()

		elseif WarMenu.IsMenuOpened('others') then
			for i = 1, #otherItems do
				if WarMenu.Button(otherItems[i]['Text'], otherItems[i]['SubText'], otherItems[i]['Desc']) then
					TriggerServerEvent('fred2:buyitem', otherItems[i]['Param'])
					--WarMenu.CloseMenu()
						Citizen.Wait(500)
				end
			end
			WarMenu.Display()

		elseif WarMenu.IsMenuOpened('sell') then
			for i = 1, #selleableItems do
				if WarMenu.Button(selleableItems[i]['Text'], selleableItems[i]['SubText'], selleableItems[i]['Desc']) then
					TriggerServerEvent('fred2:sellitem', selleableItems[i]['Param'])
					--WarMenu.CloseMenu()
						Citizen.Wait(500)
				end
			end
			WarMenu.Display()
		end
		Citizen.Wait(0)
	until false
end)


Citizen.CreateThread(function()
	while true do

		local IsZone, IdZone = IsNearZone( Config.Coords )

		if IsPlayerNearCoords2(-321.89, 803.99, 117.88)then
			Citizen.InvokeNative(0x2A32FAA57B937173, Markers.Cylinder, -321.89, 803.99, 117.88-0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.25, 25, 163, 255, 50, 0, 0, 2, 0, 0, 0, 0)
		end

		if IsZone then
			--TODO: DETECT IF ANY MENU IS OPENED
			DrawTxt(Config.Shoptext, 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
			--DisplayHelp(Config.Shoptext, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
			if IsControlJustPressed(0, keys['SPACE']) then
				WarMenu.OpenMenu('id_item')		
				CurrentZoneActive = IdZone
			end

		--Si no esta en la zona cierra el menu
		elseif not IsZone then
			WarMenu.CloseMenu()
		end

		Citizen.Wait(0)

	end
end)


-- | Notification | --

RegisterNetEvent('fred:Notification')
AddEventHandler('fred:Notification', function( _message )
		TriggerEvent("vorp:TipRight", _message, 100)
end)
