local ox_inventory = exports.ox_inventory

local Combinations = {
    --[[ ['itemname'] = {
        needs = 'the other itemname', 
        result = {
            {name = 'the result', amount = 1},
            --{name = 'other result', amount = 5},
        }, 
        removeItemA = true,
        removeItemB = true,
    }, ]]
}

local function combineItems(source, fromSlot, toSlot)
    local combo = Combinations[fromSlot.name]
    if combo and toSlot.name == combo.needs then
        TriggerClientEvent('ox_inventory:closeInventory', source)
        TriggerClientEvent('yoda-combine:Combine', source)
        Citizen.Wait(2000)
        if combo.removeItemA then
            ox_inventory:RemoveItem(source, fromSlot.name, 1)
        end
        if combo.removeItemB then
            ox_inventory:RemoveItem(source, combo.needs, 1)
        end
        for _, result in ipairs(combo.result) do
            ox_inventory:AddItem(source, result.name, result.amount)
        end
        return false
    end
end

local combhook = ox_inventory:registerHook('swapItems', function(payload)
    if payload.fromInventory == payload.source and payload.fromSlot and payload.toSlot then
        return combineItems(payload.source, payload.fromSlot, payload.toSlot)
    end
end, {})
