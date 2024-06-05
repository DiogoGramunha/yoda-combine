RegisterNetEvent('yoda-combine:Combine')
AddEventHandler('yoda-combine:Combine', function()
    exports.ox_lib:progressCircle({
        duration = 2000,
        label = 'Combining..',
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
        },
        anim = {
            dict = 'amb@prop_human_parking_meter@male@base',
            clip = 'base'
        },
    })
end)
