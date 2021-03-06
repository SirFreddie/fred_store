local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('fred2:buyitem')
AddEventHandler( 'fred2:buyitem', function ( args )

    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local _src   = source
    local _price = args['Price']
    local _level = args['Level']
    local _model = args['Model']
    local _qty = args['Cantidad']
    --local _gold = args['Gold']
    --local _rol = args['Rol']
    local count = VorpInv.getItemCount(source, _model)
    local maxCount = args['maxInvSlots']

    u_money = Character.money
    u_gold = Character.gold
    u_rols = Character.rol

    --Checkea si tiene el maximo de items
    if (count < maxCount) then

        if u_money <= _price then
            TriggerClientEvent("vorp:TipRight", _src, Config.NoMoney, 100)   
            return
        end

        --Para Tienda de Oro
        --if u_gold <= _gold then
        --            TriggerClientEvent("fred:Notification", _src, Config.NoGold)   
        --    return
        --end

        --if u_level <= _level then
        --            TriggerClientEvent("fred:Notification", _src, Config.LevelMissing)   
        --    return
        --end

        Character.removeCurrency(0, _price)
        VorpInv.addItem(_src, _model, 1)
        TriggerClientEvent("vorp:TipRight",_src, Config.Buy, 100) 

        --TriggerClientEvent("fred:Notification", _src, 'Has comprado '..(count+1)..'/'..maxCount)   
    else
        TriggerClientEvent("vorp:TipRight", _src, Config.MaxSlots, 100)
    end
end)


RegisterServerEvent('fred2:sellitem')
AddEventHandler('fred2:sellitem', function(args)

    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    local _src   = source
    local _price = args['Price']
    local _level = args['Level']
    local _model = args['Model']
    local _qty = args['Cantidad']
    --local _gold = args['Gold']
    --local _rol = args['Rol']
    local count = VorpInv.getItemCount(source, _model)
    local maxCount = args['maxInvSlots']

    u_money = Character.money
    u_gold = Character.gold
    u_rols = Character.rol

    if (count == nil) then
        TriggerClientEvent("vorp:TipRight", _src, Config.NoMoney, 100)  
    end

    if count >= _qty then
        VorpInv.subItem(_src, _model, _qty)
        Character.addCurrency(0, _price)

        TriggerClientEvent("vorp:TipRight", _src, Config.Sell, 100)
    else
        TriggerClientEvent("vorp:TipRight", _src, Config.NoItem, 100)
    end
end)