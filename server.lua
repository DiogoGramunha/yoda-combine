local Combinations = Config.Combinations

local framework = exports.ox_inventory

local currentCrafts = {}
local function combineItems(source, fromSlot, toSlot)
    local combo = Combinations[fromSlot.name]
    if combo and toSlot.name == combo.needs then
        TriggerClientEvent('yoda-combine:Combine', source, combo?.parameters or false)
        currentCrafts[source] = {combo=combo, fromSlot=fromSlot, toSlot=toSlot}
        return false
    end
end

RegisterNetEvent('yoda-combine:FinishedCombine')
AddEventHandler('yoda-combine:FinishedCombine', function (completed)
    local src = source
    if currentCrafts[source] == nil then
        print(('[^4WARNING^7] Player %s tried to exploit "^2yoda-combine:FinishedCombine^7" !'):format(src))

        --[[ \/ Add in your kick/ban system below \/ ]]
        if Config.KickPlayerExploiting then
            DropPlayer(src, "Exploiting")
        end
        --[[ /\ Add in your kick/ban system above /\ ]]

        return
    end

    local data = currentCrafts[source]
    currentCrafts[source] = nil
    if completed then

        if data.combo.removeItemA then
            framework:RemoveItem(source, data.fromSlot.name, 1)
        end
        if data.combo.removeItemB then
            framework:RemoveItem(source, data.combo.needs, 1)
        end
        for _, result in ipairs(data.combo.result) do
            framework:AddItem(source, result.name, result.amount)
        end
    end

end)

local combhook = framework:registerHook('swapItems', function(payload)
    if payload.fromInventory == payload.source and payload.fromSlot and payload.toSlot then
        return combineItems(payload.source, payload.fromSlot, payload.toSlot)
    end
end, {})
