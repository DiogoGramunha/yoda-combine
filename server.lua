local Combinations = Config.Combinations

local framework = exports.ox_inventory

local function combineItems(source, fromSlot, toSlot)
    local combo = Combinations[fromSlot.name]
    if combo and toSlot.name == combo.needs then
        TriggerClientEvent('ox_inventory:closeInventory', source)
        TriggerClientEvent('yoda-combine:Combine', source)
        Citizen.Wait(2000)
        if combo.removeItemA then
            framework:RemoveItem(source, fromSlot.name, 1)
        end
        if combo.removeItemB then
            framework:RemoveItem(source, combo.needs, 1)
        end
        for _, result in ipairs(combo.result) do
            framework:AddItem(source, result.name, result.amount)
        end
        return false
    end
end

local combhook = framework:registerHook('swapItems', function(payload)
    if payload.fromInventory == payload.source and payload.fromSlot and payload.toSlot then
        return combineItems(payload.source, payload.fromSlot, payload.toSlot)
    end
end, {})
