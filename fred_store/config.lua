Config = {}

Config.NoMoney = 'No tienes suficiente dinero'
Config.NoItem ='~e~No tienes suficientes suministros~q~'
Config.NoGold = 'No tienes suficiente oro'
Config.NoRol = 'No tienes suficientes rol'
Config.Buy = '~t6~Compra realizada!~q~'
Config.Sell = '~t6~Venta realizada!~q~'
Config.Shoptext = 'Pulsa [~e~ESPACIO~q~] para abrir la tienda'
Config.LevelMissing = 'No tienes el nivel suficiente'
Config.MaxSlots = '~e~No puedes llevar mas objetos de este tipo~q~'

Config.Coords = {
	vector3(-321.89, 803.99, 117.88)
}

Colors = {
	MarkerGreen = { r = 200, g = 255, b = 200, a = 50 },
	MarkerBlue = { r = 25, g = 163, b = 255, a = 50 }
}

Markers = {
    Cylinder = 0x94FDAE17,
	Cube = 0x6EB7D3BB,
	Sphere = 0x50638AB9,
	Ring = 0xEC032ADD,
	Halo = 0x6903B113,
	Halo_Rotate = 0x7DCE236,
	Halo_Point = 0xD6445746,
	Num_0 = 0x29FE305A,
	Num_1 = 0xE3C923F1,
	Num_2 = 0xD57F875E,
	Num_3 = 0x40675D1C,
	Num_4 = 0x4E94F977,
	Num_5 = 0x234BA2E5,
	Num_6 = 0xF9B24FB3,
	Num_7 = 0x75FEB0E,
	Num_8 = 0xDD839756,
	num_9 = 0xE9F6303B
}

-- Draw Markers and 3D Text
function Config.DrawMarker(coords, color)
	Citizen.InvokeNative(0x2A32FAA57B937173, Markers.Cylinder, coords.x, coords.y, coords.z-0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.25, color.r, color.g, color.b, color.a, 0, 0, 2, 0, 0, 0, 0)	
end

function Config.DrawText3d(coords, text, size, font)
	local camCoords = Citizen.InvokeNative(0x595320200B98596E, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())
	local distance = Helpers.GetDistance(coords, camCoords)
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = ((size / distance) * 2) * fov	
	local visible, x, y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)

	if (visible) then
		SetTextScale(0.0 * scale, 0.55 * scale)
		SetTextColor(255, 255, 255, 255)

		if (font ~= nil) then
			SetTextFontForCurrentCommand(font)
		end

		SetTextDropshadow(0, 0, 0, 255)
		SetTextCentre(true)
		DisplayText(CreateVarString(10, 'LITERAL_STRING', text), x, y)
	end
end