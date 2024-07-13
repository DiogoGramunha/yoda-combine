local Combinations = Config.Combinations

local framework = exports.ox_inventory

local function combineItems(source, fromSlot, toSlot)
    local combo = Combinations[fromSlot.name]
    if combo and toSlot.name == combo.needs then
        local response = lib.callback.await('yoda-combine:Combine', source, combo?.parameters or false)

        if not response then return false end

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
